require 'thor'
require 'active_support/all'
require 'numbers_in_words'
require 'numbers_in_words/duck_punch'

class Grader < Thor
  require_relative 'solutions'
  
  desc "check ASSIGNMENT USERNAME", "check ASSIGNMENT for USERNAME"
  def check(assignment, username)
    puts "Hi #{username}, we're going to check #{assignment} for you"
    
    puts "Do you want to submit #{assignment}? (y/n)"
    submit_response = STDIN.gets.chomp
    submit(assignment, username) if submit_response.eql? "y"
  end
  
  desc "submit ASSIGNMENT USERNAME", "submit ASSIGNMENT for USERNAME"
  def submit(assignment, username)
    puts "submitting #{assignment} for #{username}"
  end
end
 
Grader.start(ARGV)