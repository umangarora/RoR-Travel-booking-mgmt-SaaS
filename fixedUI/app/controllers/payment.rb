class Payment
  def initialize(paymentOptionCheckbox,accountID,custBankID)
   
    @paymentOptionCheckbox= paymentOptionCheckbox
    @custBankID = custBankID
    @accountID = accountID
    
   
  end

  attr_accessor :paymentOptionCheckbox, :accountID, :custBankID
end