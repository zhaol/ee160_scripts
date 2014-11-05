require 'numbers_and_words'

I18n.enforce_available_locales = false # remove later when possible to avoid deprecation warning without it

class Grader::Submission
  @solution_namespace = 'Grader::Solution'
  
  def self.solution_namespace
    @solution_namespace
  end
  
  attr_reader :options, :attachment
  attr_accessor :report, :username, :assignment
  
  def initialize(assignment, username, options)
    default_options = {as: 'student'}
    @options = default_options.merge(options)
    
    @assignment = Grader::Submission::Parser.new(assignment)
    @username   = username
    @report     = Grader::Report.new(assignment, username)
    @attachment = Grader::Submission::Attachment.new(username, @assignment.identifier, @options)
  end
  
  def check
    preprocess_submission if submitted_as_grader
    begin
      get_solution.check_output
      get_solution.check_syntax
      get_solution.check_output_files
      report.finalize      
    rescue
      puts 'Sorry but this assignment is not available for self checking.'
    end
  end
  
  private
  
  def preprocess_submission
    Dir.chdir('Submission attachment(s)') do
      `tar xf #{username}_#{assignment.identifier}.tar`
    end
  end
  
  def submitted_as_grader
    options[:as] == 'grader'
  end
  
  def get_solution
    @solution ||= Object.const_get(build_solution_classname).new(attachment, report)
  end
  
  def build_solution_classname
    self.class.solution_namespace + '::' + major_assignment_number.gsub('-','') + minor_assignment_number
  end
  
  def major_assignment_number
    @major_assignment_number ||= @assignment.major.to_i.to_words.capitalize
  end
  
  def minor_assignment_number
    @minor_assignment_number ||= @assignment.minor.to_i.to_words.capitalize
  end
end

Dir.glob(File.join(__dir__ + '/submission', "**", "*.rb")).each do |file|
  require file
end