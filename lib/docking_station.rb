require_relative './bike.rb'

class DockingStation 
  def initialize
    @stored_bikes = []
  end

  def release_bike
    if @stored_bikes.empty?
      fail 'No bikes available'
    else
      @stored_bikes.pop
    end
  end

  def dock(bike)
    !@stored_bikes.full? << bike
  end

  private

  def full?()
    if @stored_bikes.length >= 20
      true
    else
      false
    end
  end
end
