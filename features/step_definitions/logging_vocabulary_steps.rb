require "rspec"
require "./app.rb"

test_filename = "vocab_test.log"

Before do
  File.delete(test_filename) if File.exist?(test_filename)
end

After do
  File.delete(test_filename) if File.exist?(test_filename)
end

When(/^I run the cli with a new word, e\.g "([^"]*)"$/) do |arg1|
  App.new(test_filename).run arg1
end

Then(/^"([^"]*)" appears in the log file$/) do |arg1|
  lines = File.foreach(test_filename).first(1)
  expect(lines).to eq [arg1]
end

Given(/^there is a file called "([^"]*)"$/) do |arg1|
  expect(File.exist?(arg1)).to be_truthy
  @file = arg1
end

When(/^I run the cli in read mode$/) do
  @result = App.new(@file).read
end

Then(/^the cli returns a histogram of the words entered$/) do
  expect(@result).to eq [
    ["hello", 2],
    ["goodbye", 1]
  ]
end
