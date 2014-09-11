require 'thor'
require 'shellwords'

class Grader < Thor
  require __dir__ + '/submission'
  require __dir__ + '/solution'
  require __dir__ + '/report'
  
  desc "check ASSIGNMENT USERNAME", "check ASSIGNMENT for USERNAME"
  def check(assignment, username, options={})
    default_options = {quiet_mode: false}
    options = default_options.merge(options)
    
    puts "Hi #{username}, we're going to check #{assignment} for you"
    submission = Grader::Submission.new(assignment, username)
    submission.check
    
    if options[:quiet_mode]
      # don't ask to submit
    else
      puts "Do you want to submit #{assignment}? (y/n)"
      submit_response = STDIN.gets.chomp
      submit(assignment, username) if submit_response.eql? "y"
    end
  end
  
  desc "submit ASSIGNMENT USERNAME", "submit ASSIGNMENT for USERNAME"
  def submit(assignment, username)
    # TODO: need to implement
    puts "submitting #{assignment} for #{username}"
  end
  
  desc "score_class ASSIGNMENT", "score ASSIGNMENT for entire class"
  def score_class(assignment)
    Dir.foreach('.') do |folder|
      next if folder == '.' or folder == '..'
      username = get_username_from folder
      Dir.chdir(folder) do
        check(assignment, username, {quiet_mode: true})
      end
    end
  end
  
  private
  
  def get_username_from(folder_name)
    /[(](.+)[)]/.match(folder_name).captures[0]
  end
end
 
Grader.start(ARGV)