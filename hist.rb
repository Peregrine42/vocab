#! /home/duncan-fermor/.rbenv/shims/ruby

require "./app.rb"

hist = App.new("vocab.log").read
puts "#{hist.uniq { |word, freq| word }.size} words"
hist.sort { |word1, word2|
  word1[1] <=> word2[1]
}.reverse.each { |word, freq|
  puts "#{freq}: #{word}"
}
