class Order
  attr_reader :ownId
  attr_reader :items
  attr_reader :holdInEscrow
  attr_reader :customer

  def initialize(ownId,items,holdInEscrow,customer)
      @ownId = ownId
      @items = items
      @holdInEscrow = holdInEscrow
      @customer = customer
  end

  def to_json(*a)
    h = {
      "ownId" => @ownId,
      "items" => @items, 
      "holdInEscrow" => @holdInEscrow,
      "customer" => @customer
    }.delete_if{|k,v|v==""}
    return h.to_json(*a)
  end
end
