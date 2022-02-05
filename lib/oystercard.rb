class Oystercard

    MAX_LIMIT = 90
    MIN_LIMIT = 1
    MIN_FARE = 1

attr_reader :balance, :entry_station, :exit_station, :journey_history

  def initialize
    @balance = 0
    # @in_journey = false
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
  end
 
  def top_up(amount)
    fail "Maximum balance is #{MAX_LIMIT}, please do not exceed this limit" if @balance + amount > MAX_LIMIT
        @balance += amount
  end

 
  def in_journey?
    !!entry_station
  end

 
  def touch_in(station)
    fail "insufficent funds please top up to have a min fare of at least #{MIN_LIMIT}" if @balance < MIN_LIMIT
    # @in_journey = true
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @exit_station = station
    @journey_history << {entry_station: @entry_station, exit_station: station}
     # @in_journey = false
     @entry_station = nil
     
  end

 private
 
  def deduct(amount)
    @balance -= amount
  end
end