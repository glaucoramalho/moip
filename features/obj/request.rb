require 'json'
require 'rest-client'
require_relative 'objectFactory.rb'
require_relative 'rest'
require_relative 'customer'

def newCustomersList
  objectFactory = ObjectFactory.new
  customers = objectFactory.getCustomersList
  newCustomersList = Hash.new
  outputFile = File.new('features/data/customers.json','w')
  customers.each do |c|
    ownId = c.ownId.to_i + 1
    fullname = c.fullname
    email = fullname + "1@email.com"
    email.gsub!(" ","")
    birthDate = c.birthDate
    shippingAddress = c.shippingAddress
    phone = c.phone
 
    taxDocument = c.taxDocument
    newCPF = taxDocument['number'].to_i + 1
    taxDocument['number'] = newCPF
    fundingInstruments = c.fundingInstruments[0]
    cc = fundingInstruments['creditCard']['number'].to_i + 1
    fundingInstruments['creditCard']['number'] = String(cc)
    fundingInstruments['creditCard']['holder']['taxDocument'] = taxDocument
    fundingInstrumentss = Array.new
    fundingInstrumentss << fundingInstruments

    newCustomer = Customer.new(ownId,fullname,email,birthDate,shippingAddress,phone,taxDocument,fundingInstrumentss)

    puts "Old ownId: %s,CPF: %s, fundingInstruments: %s" % [c.ownId,c.taxDocument['number'],c.fundingInstruments.to_json]
    124.times{print '*'}
    puts ""
    puts "New ownId: %s,CPF: %s,fundingInstruments: %s" % [newCustomer.ownId,newCustomer.taxDocument['number'],newCustomer.fundingInstruments[0].to_json]
    124.times{print '='}
    puts ""
    outputFile.puts newCustomer.to_json
  end
  outputFile.close
end

def newOrdersList
  objectFactory = ObjectFactory.new
  orders = objectFactory.getOrdersList
  customers = objectFactory.getCustomersList
  newCustomersToOrders = Array.new
  i = 0
  c = 0
  outputFile = File.new('features/data/orders.json','w')
  orders.each do |order|
    orderId = order.ownId.to_i + 1
    items = order.items
    holdInEscrow = order.holdInEscrow
    customer = order.customer
    if customer.keys.count > 1
      customer = customers[i]
      newCustomersToOrders << customer.ownId
      i += 1
    end
    newOrder = Order.new(String(orderId),items,holdInEscrow,customer)
    puts "OrderId: %s, Customer: %s" % [order.ownId,order.customer.to_json]
    puts "New Order Id: %s, Customer: %s" % [newOrder.ownId,newOrder.customer.to_json]
    124.times{print '='}
    puts ""
    outputFile.puts newOrder.to_json
    c += 1
  end
  puts "Current Customers: %d, New Customers: %s" % [c,i]
  outputFile.close
  newCustomersToOrders.each{|c|puts c}
end

def createNewOrder
  rest = Rest.new
  objectFactory = ObjectFactory.new
  customer = objectFactory.getCustomersList[0]
  response = rest.createCustomer(customer)
  if response.code == 201
    customerResponse = objectFactory.createCustomerResponse(JSON.parse(response.to_str))
    puts customerResponse.id
  else
    puts response.to_str
  end
end

def createNewCustomer
  rest = Rest.new
  objectFactory = ObjectFactory.new
  customer = objectFactory.getCustomersList[0]
  response = rest.createCustomer(customer)
  if response.code == 201
    customerResponse = objectFactory.createCustomerResponse(JSON.parse(response.to_str))
    puts customerResponse.id
  else
    puts response.to_str
  end
 
end

def createOrder
  objectFactory = ObjectFactory.new
  key = ""
  File.open('features/data/key'){|file|key = file.read}
  @headers = {
    :content_type => 'application/json',
    :authorization => 'Basic %s' % key
  }
  order = objectFactory.getOrdersList[0]
  response = RestClient.post('https://sandbox.moip.com.br/v2/orders/', order.to_json, @headers){|response, request, result| response }
  puts response.code
  puts response.to_str
end

def createPayment
    key = ""
    File.open('features/data/key'){|file|key = file.read}
    @headers = {
      :content_type => 'application/json',
      :authorization => 'Basic %s' % key
    }
  url = 'https://sandbox.moip.com.br/v2/orders/ORD-AJIX045ZXIZF/payments/'
  payment = '{"installmentCount":1,"fundingInstrument":{"method":"CREDIT_CARD","creditCard":{"expirationMonth":8,"expirationYear":21,"number":"30163844935023","cvc":"416","holder":{"fullname":"Rodrigo Antoniazzi","birthdate":"1983-01-15","taxDocument":{"type":"CPF","number":"38140688746"},"phone":{"countryCode":"55","areaCode":"19","number":"38283211"}}}}}'
  
   response = RestClient.post(url, payment, @headers){|response, request, result| response }

  puts response.code 
  puts response.to_str
end
#createPayment
#createOrder
#createNewCustomer

#newCustomersList
#newOrdersList
#objectFactory = ObjectFactory.new
#orders = objectFactory.getOrdersForNewCustomers
#print orders[0].to_json
