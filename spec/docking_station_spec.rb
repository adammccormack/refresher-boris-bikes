require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) { DockingStation.new }

    it { is_expected.to respond_to :release_bike }

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to :docked_bikes }
       
    it 'raises error when no bikes available' do
      docking_station

      expect{docking_station.release_bike}.to raise_error('Sorry no bikes left : (')
    end

    it 'raises an error when at capacity' do
      docking_station
      20.times { docking_station.dock(Bike.new)}

      expect { docking_station.dock(Bike.new) }.to raise_error('Sorry all full : (')
    end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      docking_station.dock(bike)

      expect(docking_station.docked_bikes.first).to eq(bike)
    end
  end

  describe '#release' do
    it 'releases a bike' do
      bike = Bike.new
      docking_station.dock(bike)

      expect(docking_station.release_bike).to eq(bike)
    end
  end
end