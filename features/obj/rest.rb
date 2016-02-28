require 'json'
require 'rest-client'

class Rest
  def initialize
    key = ""
    File.open('features/data/key'){|file|key = file.read}
    @headers = {
      :content_type => 'application/json',
      :authorization => 'Basic %s' % key
    }
  end
  
  def getCustomer
      RestClient.get('https://sandbox.moip.com.br/v2/customers/CUS-8UCHMF2JTNT', @headers){|response, request, result| response }
  end
  
  def createCustomer(customer)
    RestClient.post('https://sandbox.moip.com.br/v2/customers/', customer.to_json, @headers){|response, request, result| response }
  end
  
  def createOrder(order)
    RestClient.post('https://sandbox.moip.com.br/v2/orders/', order.to_json, @headers){|response, request, result| response }
  end
  
  def payOrder(order,payment)
    url = 'https://sandbox.moip.com.br/v2/orders/%s/payments/' % order
    response = RestClient.post(url, payment.to_json, @headers){|response, request, result| response }
    puts "URL: %s, Payment: %s, Reponse: %s" % [url,payment.to_json,response.to_str]
    return response
  end
end
