require_relative "orderResponse"
require_relative "customer"
require_relative "customerResponse"
require_relative "order"
require_relative "payment"

class ObjectFactory
  attr_reader :order
  attr_reader :orderResponse
  attr_reader :customer
  attr_reader :customerResponse
  attr_reader :payment
  
  def initialize;end

  def createOrderResponse(response)
    @orderResponse = OrderResponse.new(response['id'],
    response['ownId'],
    response['status'],
    response['createdAt'],
    response['updatedAt'],
    createCustomer(response['customer']),
    response['shippingAddress'])
    return @orderResponse
  end

  def createCustomerResponse(response)
     @customerResponse = CustomerResponse.new(response['id'],createCustomer(response))
     return @customerResponse
  end

  def createCustomer(customer)
    @customer =  Customer.new(customer['ownId'],customer['fullname'],customer['email'],customer['birthDate'],customer['shippingAddress'],customer['phone'],customer['taxDocument'],customer['fundingInstrument'])
    return @customer
  end

  def createItem(product,detail,price)
    return Item.new(product,detail,price)
  end

  def createOrder(order)
    @order = Order.new(order['ownId'],order['items'],order['holdInEscrow'],order['customer'])
    return @order
  end

  def createPayment(payment)
    @payment = Payment.new(payment['installmentCount'],payment['fundingInstrument'])
    return @payment
  end

  def getCustomersList
    file = File.open("features/data/customers.json")
    customerList = Array.new 
    file.each do |customer|
      customerList << createCustomer(JSON.parse(customer))
    end
    file.close
    return customerList
  end

  def getOrdersList
    file = File.open("features/data/orders.json")
    ordersList = Array.new 
    file.each do |order|
      ordersList << createOrder(JSON.parse(order))
    end
    file.close
    return ordersList
  end

  def getPaymentsList
    file = File.open("features/data/payments.json")
    paymentsList = Array.new 
    file.each do |payment|
      paymentsList << createPayment(JSON.parse(payment))
    end
    file.close
    return paymentsList
  end
end
