class OrderResponse
    attr_reader :id
    attr_reader :ownId
    attr_reader :status
    attr_reader :createdAt
    attr_reader :updatedAt
    attr_reader :customer
    attr_reader :shippingAddress

  def initialize(id,ownId,status,createdAt,
        updatedAt,customer,shippingAddress)
    @id = id
    @ownId = ownId
    @status = status
    @createdAt = createdAt
    @updatedAt = updatedAt
    @customer = customer
    @shippingAddress = shippingAddress
  end
end
