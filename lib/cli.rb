class CLI
  attr_accessor :histogram, :compare_array

  def initialize
    @histogram = Hash.new
    @compare_array = Array.new
  end

  def start
    puts "Please enter the file path to your text document."
    pp 'For Example -> /Users/Brian/Desktop/text-file/files.txt '
    input = gets.chomp.strip()
    get_file(input)
    make_histogram()
    print_histogram()

  end

  def get_file(path)
    new_file = Api.new(path).get_data.split(' ')

    if  new_file.length <= 1
      puts ""
      puts "Not Enough words to make a histogram! Try another phrase."
      puts ""
      start()
    else
      convert_file(new_file)
    end
  end

  def convert_file(arr)
    arr.each_cons(2) do |word|
      @compare_array << word.join(' ')
    end
  end

  def make_histogram
    @compare_array.each do |ele|
      @histogram[ele] = @compare_array.count(ele)
    end
  end
  
  def print_histogram
    puts ""
    puts "Here is your Histogram"
    puts "----------------------------"
    @histogram.each do |k, v|
      puts "  #{k} : #{v} "
    end
    puts "-----------------------------"
  end

end