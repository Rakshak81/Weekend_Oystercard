class Oystercard

    MAX_LIMIT = 90
    MIN_LIMIT = 1
attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end
 
  def top_up(amount)
    fail "Maximum balance is #{MAX_LIMIT}, please do not exceed this limit" if @balance + amount > MAX_LIMIT
        @balance += amount
  end

  def deduct(amount)
    @balance -= amount

  end

  def in_journey?
    @in_journey
  end
 
  def touch_in
    fail "insufficent funds please top up to have a min fare of at least #{MIN_LIMIT}" if @balance < MIN_LIMIT
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end