class OysterCard
  MAXIMUM_BALANCE = 90
  
  attr_reader :balance, :in_journey
  
  def initialize
    @balance = 0
    @in_journey
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} passed"if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
  
  def in_journey?
    @in_journey
  end
  
  def touch_in
    fail "Insufficient balance to touch" if balance < 1
    @in_journey = true
  end
  
  def touch_out
    @in_journey = false
  end
end
