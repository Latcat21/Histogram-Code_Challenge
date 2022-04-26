class CLI
  attr_accessor :histogram, :compare_array

  def initialize
    @histogram = Hash.new
    @compare_array = Arr.new
  end

end