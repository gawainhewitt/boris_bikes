require 'docking_station'

describe DockingStation do

  it { expect(subject).to respond_to :release_bike } #unit test

  it 'Checking to see if a bike from the docking station works' do #feature test
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike)
    bike = station.release_bike
    expect(bike.working?).to eq(true)
  end

  it { expect(subject).to respond_to(:dock).with(1).argument } #unit test

  it 'Can dock a bike at a docking station' do #feature test
    bike = Bike.new
    station = DockingStation.new
    expect(station.dock(bike)).to eq([bike])
  end

  # xit { is_expected.to respond_to(:stored_bikes) } #unit test

  # xit 'Can see a bike that has been docked' do # feature test
  #   station = DockingStation.new
  #   bike = Bike.new
  #   station.dock(bike)
  #   expect(station.stored_bikes).to eq([bike])
  # end
  
  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      station = DockingStation.new
      expect{station.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when dock is full' do
      station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times do
        station.dock Bike.new
      end
      expect{station.dock(Bike.new)}.to raise_error 'dock full'
    end
  end

end

#I'd like docking stations not to release 
# bikes when there are none available.