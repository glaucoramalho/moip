require 'json'
require 'rest-client'
require_relative 'objectFactory.rb'

#key = ""
#File.open('features/data/key'){|file|key = file.read}
#headers = {
#  :content_type => 'application/json',
#  :authorization => key
#}
#objectFactory = ObjectFactory.new
#customer = objectFactory.getCustomersList[0]
#customer.birthDate = ""
#customer.shippingAddress = ""
#customer.phone = ""
#customer.taxDocument = ""
#customer.fundingInstrument = ""
#puts customer.to_json
#CUS-8UCHMF2JTNFT
#CUS-0K899WLOT16D
#CUS-R5M09YMDR01D
#CUS-7RES4THEYRU4
#CUS-4VF57VRFSKMM
#ORD-A6BC7Z2IM2V6
#ORD-9X1TZ1BVAECY
#Commissioning is not working!!

#objectFactory = ObjectFactory.new
#orders = objectFactory.getOrdersList
#order = orders[0].to_json
#payments = objectFactory.getPaymentsList
#payment = payments[0].to_json
#response = RestClient.post 'https://sandbox.moip.com.br/v2/customers/', customer.to_json, headers
#orderResponse = objectFactory.createCustomerResponse(JSON.parse(response.to_str))
#if response.code == 201
#  orderId = orderResponse.id
#  url = 'https://sandbox.moip.com.br/v2/orders/%s/payments' % orderId
#  puts url
#  response = RestClient.post url, payment, headers
#  puts response.code
#  puts response.to_str
#end
#puts "Response Code: %s" % response.code
#100.times{print "="}
#puts ""
#puts "Response Cookies: %s" % response.cookies
#100.times{print "="}
#puts ""
#puts "Response Headers: %s" % response.headers
#100.times{print "="}
#puts ""
#puts "Response str: %s" % response.to_str
#100.times{print "="}
#puts ""
