class Order
  attr_accessor :ownId
  attr_accessor :items
  attr_accessor :holdInEscrow
  attr_accessor :customer

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
    }.delete_if{|k,v|v.nil?}
    return h.to_json(*a)
  end
end
