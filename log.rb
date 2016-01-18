#! /home/duncan-fermor/.rbenv/shims/ruby

require "./app.rb"

App.new("vocab.log").run *ARGV
