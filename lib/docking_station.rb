require_relative 'bike'

class DockingStation

  attr_reader :docked_bike

  def dock(bike)
    fail 'Sorry all full : (' if @docked_bike
    @docked_bike = bike
  end
  
  def release_bike
    fail 'Sorry no bikes left : (' unless @docked_bike
    @docked_bike
  end
end