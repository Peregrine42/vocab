class App
  attr_reader :filename

  def initialize filename
    @filename = filename
  end

  def run *words
    open(filename, 'a') do |f|
      words.each do |word|
        f << word + "\n"
      end
    end
  end

  def read
    open(filename, 'r') do |f|
      histogram = Hash.new { 0 }
      f.each { |line|
        histogram[line.strip] += 1
      }
      histogram.to_a
    end
  end
end
