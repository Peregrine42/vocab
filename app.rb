class App
  attr_reader :filename

  def initialize filename
    @filename = filename
  end

  def run word
    open(filename, 'a') do |f|
      f << word
    end
  end
end
