require_relative "objectFactory"
require_relative "rest"
class Application

  def initialize
    @app = {}
    @objectFactory ||= ObjectFactory.new
  end
  
  def rest
    @app[:rest] ||= Rest.new
  end
  
  def objectFactory
    @app[:objectFactory] ||= @objectFactory
  end
  
  def customersList
    @app[:customersList] ||= @objectFactory.getCustomersList
  end
  
  def ordersList
    @app[:ordersList] ||= @objectFactory.getOrdersList
  end

  def getOrdersForNewCustomers
    @app[:OrdersForNewCustomers] ||= @objectFactory.getOrdersForNewCustomers
  end
  
  def getOrdersForHoldInEscrow
    @app[:getOrdersForHoldInEscrow] ||= @objectFactory.getOrdersForHoldInEscrow
  end

  def createOrderResponse(response)
    @app[:createOrderResponse] ||= @objectFactory.createOrderResponse(response)
  end
  
  def paymentsList
    @app[:paymentsList] ||= @objectFactory.getPaymentsList
  end

  def getBoletoPaymentsList
    @app[:getBoletoPaymentsList] ||= @objectFactory.getBoletoPaymentsList
  end
  def createPayment(payment)
    @app[:createPayment] ||= @objectFactory.createPayment(payment)
  end
end
