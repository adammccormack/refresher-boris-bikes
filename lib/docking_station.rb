require_relative 'bike'

class DockingStation
  attr_reader :capacity, :docked_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Sorry all full : (' if full?
    @docked_bikes << bike
  end
  
  def release_bike
    fail 'Sorry no bikes left : (' if empty?
    @docked_bikes.pop
  end

  private

  def full?
    @docked_bikes.count >= capacity
  end

  def empty?
    @docked_bikes.empty?
  end

end