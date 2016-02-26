class CustomerResponse
  attr_reader :id
  attr_reader :customer
  def initialize(id,customer)
    @id = id
    @customer = customer
  end
end
