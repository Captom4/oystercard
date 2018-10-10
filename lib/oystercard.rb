class OysterCard
  MAXIMUM_BALANCE = 90
  attr_reader :balance
  def initialize
    @balance = 0
  end

  def top_up(ammount)
    raise 'Maximum balance passed' if ammount + balance > MAXIMUM_BALANCE
    @balance += ammount
  end
  
  def deduct(amount)
    @balance -= amount
  end
  
end
