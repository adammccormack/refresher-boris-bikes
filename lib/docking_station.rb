require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @docked_bikes = []
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
    @docked_bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @docked_bikes.empty?
  end

end