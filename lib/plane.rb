class Plane

  attr_reader :status

  def initialize
    @status = 'flying'
  end

  def land
    self.status = 'landed'
  end

  def takeoff
    self.status = 'flying'
  end

  def landed?
    self.status == 'landed'
  end

  def flying?
    self.status == 'flying'
  end

  private

  attr_writer :status

end
