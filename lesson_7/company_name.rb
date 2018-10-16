module CompanyName

  def self.manufacturer(comp_name)
    self.company_name = comp_name
  end

  protected
  attr_accessor :company_name
end
