class Payment
  attr_accessor :installmentCount
  attr_accessor :fundingInstrument
  
  def initialize(installmentCount,fundingInstrument)
    @installmentCount = installmentCount
    @fundingInstrument = fundingInstrument
  end

  def to_json(*a)
    h = {
      "installmentCount" => @installmentCount,
      "fundingInstrument" => @fundingInstrument
    }.delete_if{|k,v|v.nil?}
    return h.to_json(*a)
  end
end
