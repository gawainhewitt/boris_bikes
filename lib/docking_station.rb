require_relative './bike.rb'

class DockingStation 
  def initialize
    @stored_bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @stored_bikes.pop
  end

  def dock(bike)
    fail "dock full" if full?
    @stored_bikes << bike
  end

  private

  def full?
    @stored_bikes.length >= 20
  end

  def empty?
    @stored_bikes.length == 0
  end
end
