require 'thor'

class Grader < Thor
  require __dir__ + '/submission'
  require __dir__ + '/solution'
  
  desc "check ASSIGNMENT USERNAME", "check ASSIGNMENT for USERNAME"
  def check(assignment, username)
    puts "Hi #{username}, we're going to check #{assignment} for you"
    submission = Grader::Submission.new(assignment, username)
    submission.check
    
    puts "Do you want to submit #{assignment}? (y/n)"
    submit_response = STDIN.gets.chomp
    submit(assignment, username) if submit_response.eql? "y"
  end
  
  desc "submit ASSIGNMENT USERNAME", "submit ASSIGNMENT for USERNAME"
  def submit(assignment, username)
    # TODO: need to implement
    puts "submitting #{assignment} for #{username}"
  end
end
 
Grader.start(ARGV)