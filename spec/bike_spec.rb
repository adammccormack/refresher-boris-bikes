require 'bike'


describe Bike do
  let(:bike) { Bike.new }

  it { is_expected.to respond_to :working? }

end