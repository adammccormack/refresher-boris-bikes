require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) { DockingStation.new }

    it { is_expected.to respond_to :release_bike }

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to :docked_bike }
       
    it 'raises error when no bikes available' do
      docking_station

      expect{docking_station.release_bike}.to raise_error('Sorry no bikes left : (')
    end

    it 'raises an error when at capacity' do
      bike = Bike.new
      docking_station.dock(bike)

      expect { docking_station.dock bike }.to raise_error('Sorry all full : (')
    end

  describe '.dock' do
    it 'docks a bike' do
      bike = Bike.new

      expect(docking_station.dock(bike)).to eq(bike)
    end
  end

  describe '.docked_bike' do
    it 'confirms if bike is docked' do
      bike = Bike.new
      docking_station.dock(bike)

      expect(docking_station.docked_bike).to eq(bike)
    end
  end

  describe '.release' do
    it 'releases a bike' do
      bike = Bike.new
      docking_station.dock(bike)

      expect(docking_station.release_bike).to eq(bike)
    end
  end
end