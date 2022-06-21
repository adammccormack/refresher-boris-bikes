require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) { DockingStation.new }
  let(:bike) {Bike.new}


    it { is_expected.to respond_to :release_bike }

    it { is_expected.to respond_to(:dock).with(1).argument }
       
    it 'raises error when no bikes available' do
      docking_station

      expect{docking_station.release_bike}.to raise_error('Sorry no bikes left : (')
    end

    it 'raises an error when at capacity' do
      docking_station
      DockingStation::DEFAULT_CAPACITY.times { docking_station.dock(bike)}

      expect { docking_station.dock(bike) }.to raise_error('Sorry all full : (')
    end

  describe '#dock' do
    it 'docks a bike' do
      docking_station.dock(bike)

      expect(docking_station.docked_bikes.first).to eq(bike)
    end
  end

  describe '#release' do
    it 'releases a bike' do
      docking_station.dock(bike)

      expect(docking_station.release_bike).to eq(bike)
    end
  end

  describe '#default_capacity' do
    it 'has a default capacity' do
      expect(docking_station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end
  end

  describe '#change_capacity' do
    it 'allows change of bike capacity' do
      
      docking_station = DockingStation.new(30)
      30.times { docking_station.dock(bike)}

      expect { docking_station.dock(Bike.new) }.to raise_error('Sorry all full : (')
    end
  end
end