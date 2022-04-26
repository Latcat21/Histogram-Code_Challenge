class Api
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def clean_up_str(str)
    str.downcase.gsub(/[\W\d_]+/, " ").gsub(/\s+/, " ").strip
  end

  def get_data
    file_data = File.open("#{@path}").read
    clean_up_str(file_data)
  end

end