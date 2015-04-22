require 'thor'
require 'shellwords'

class Grader < Thor
  require __dir__ + '/submission'
  require __dir__ + '/solution'
  require __dir__ + '/report'
  
  @laulima_dropbox_url = 'https://laulima.hawaii.edu/dav/group-user/MAN.XLSEE160zl.201510'
  def self.laulima_dropbox_url
    @laulima_dropbox_url
  end
  
  desc "check ASSIGNMENT USERNAME", "check ASSIGNMENT for USERNAME"
  def check(assignment, username, options={})
    default_options = {quiet_mode: false}
    options = default_options.merge(options)
    
    if options[:quiet_mode]
      puts "Grading #{username}'s submission..."
      submission = Grader::Submission.new(assignment, username, {as: 'grader'}).check
    else
      puts "Hi #{username}, we're going to check #{assignment} for you"
      submission = Grader::Submission.new(assignment, username, {as: 'student'}).check      
      
      puts "Please note that uploading the same assignment again will overwrite any existing files in your Laulima Dropbox that has the same name"
      puts "Do you want to upload #{assignment} to Laulima Dropbox? (y/n)"
      submit_response = STDIN.gets.chomp
      submit(assignment, username) if submit_response.eql? "y"
    end
  end
  
  # TODO: Refactor to Grader::Submission::Submitter
  desc "submit ASSIGNMENT USERNAME", "submit ASSIGNMENT for USERNAME"
  def submit(assignment, username)
    success = send_file(
      assignment,
      username,
      package_files(assignment, username)
    )
    if success
      print_disclaimer
      else
      print_error
    end
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
  
  desc "compile_class ASSIGNMENT", "compile ASSIGNMENT for entire class"
  def compile_class(assignment)
    Dir.foreach('.') do |folder|
      next if folder == '.' or folder == '..'
      username = get_username_from folder
      Dir.chdir(folder) do
        file = Grader::Submission::Utility.get_assignment_file_for_grader(username, assignment)
        Grader::Submission::Compiler.new(file).compile
      end
    end
  end
  
  private
  
  def get_username_from(folder_name)
    /[(](.+)[)]/.match(folder_name).captures[0]
  end
  
  # TODO: Refactor to Grader::Submission::Packager
  def package_files(assignment, username)
    puts "Packaging the following files:"
    puts `ls -A1 --ignore=*.report --ignore=*.tar`
    `tar cf #{username}_#{assignment}.tar * --exclude='*.report' --exclude='*.tar'`
    puts "Packaged to #{username}_#{assignment}.tar"
    Dir.pwd + '/' + username + '_' + assignment + '.tar'
  end
  
  def send_file(assignment, username, file)
    puts "Please enter your Laulima Dropbox password (it should be the same as your UH email password; password won't be shown for your protection):"
    password = STDIN.noecho(&:gets)
    system "curl --fail -T #{file} #{self.class.laulima_dropbox_url}/#{username}/#{assignment}/ -u #{username}:#{password}"
  end
  
  def print_disclaimer
    puts "A tar file of your assignment source code has been submitted to Laulima Dropbox"
    puts "Please verify the contents of the tar file before attaching it to your Laulima Assignment"
    puts "This submission script is provided for convenience only"
    puts "The graders will only grade the contents of the Laulima Assignment attachments"
  end
  
  def print_error
    puts "Could not submit to Laulima Dropbox"
    puts "Please try again and be careful while entering your password"
    puts "If this continues, then please notify your instructor"
  end
end
 
Grader.start(ARGV)