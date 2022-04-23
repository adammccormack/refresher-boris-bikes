require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) { DockingStation.new }

    it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
     bike = docking_station.release_bike
     expect(bike).to be_working
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to :docked_bike }

    it 'docks a bike' do
      bike = Bike.new

      expect(docking_station.dock(bike)).to eq(bike)
    end

    it 'confirms if bike is docked' do
      bike = Bike.new
      docking_station.dock(bike)

      expect(docking_station.docked_bike).to eq(bike)
    end
end
