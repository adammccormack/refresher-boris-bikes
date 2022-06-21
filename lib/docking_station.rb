require_relative 'bike'

class DockingStation
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=20)
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

  attr_reader :docked_bikes

  def full?
    @docked_bikes.count >= capacity
  end

  def empty?
    @docked_bikes.empty?
  end

end