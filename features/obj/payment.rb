class Payment
  attr_reader :installmentCount
  attr_reader :fundingInstrument
  
  def initialize(installmentCount,fundingInstrument)
    @installmentCount = installmentCount
    @fundingInstrument = fundingInstrument  
  end

  def to_json(*a)
    h = {
      "installmentCount" => @installmentCount,
      "fundingInstrument" => @fundingInstrument
    }.delete_if{|k,v|v==""}
    return h.to_json(*a)
  end
end
