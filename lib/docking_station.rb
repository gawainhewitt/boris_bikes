require_relative './bike.rb'

class DockingStation
  attr_writer :capacity
  DEFAULT_CAPACITY = 20

  def initialize
    @stored_bikes = []
    @capacity = DEFAULT_CAPACITY
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
    @stored_bikes.length >= @capacity
  end

  def empty?
    @stored_bikes.length == 0
  end
end
