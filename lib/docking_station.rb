require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def dock(bike)
    fail 'Sorry all full : (' if @docked_bikes.count >= 20
    @docked_bikes << bike
  end

  def release_bike
    fail 'Sorry no bikes left : (' if @docked_bikes.empty?
    @docked_bikes.pop
  end
end