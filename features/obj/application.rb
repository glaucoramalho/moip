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
  
  def paymentsList
    @app[:paymentsList] ||= @objectFactory.getPaymentsList
  end
end
