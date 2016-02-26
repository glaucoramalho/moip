class Customer
    attr_accessor :ownId
    attr_accessor :fullname
    attr_accessor :email
    attr_accessor :birthDate
    attr_accessor :shippingAddress
    attr_accessor :phone
    attr_accessor :taxDocument
    attr_accessor :fundingInstrument

  def initialize(ownId,fullname,email,birthDate,shippingAddress,phone,taxDocument,fundingInstrument)
    @ownId  = ownId 
    @fullname = fullname
    @email = email
    @birthDate = birthDate
    @shippingAddress = shippingAddress
    @phone = phone
    @taxDocument = taxDocument
    @fundingInstrument = fundingInstrument
  end

  def to_json(*a)
    h = {
      "ownId" => @ownId,
      "fullname" => @fullname,
      "email" => @email,
      "birthDate" => @birthDate,
      "shippingAddress" => @shippingAddress,
      "phone" => @phone,
      "taxDocument" => @taxDocument,
      "fundingInstrument" => @fundingInstrument
    }.delete_if{|k,v|v==""}
    return h.to_json(*a)
  end
end
