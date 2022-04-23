require 'docking_station'

describe DockingStation do
  let(:docking_station) { DockingStation.new }

    it { is_expected.to respond_to :release_bike }

    it 'releases bike' do
     expect(docking_station.release_bike).to eq(true)
    end
end