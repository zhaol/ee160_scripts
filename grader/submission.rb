require 'numbers_and_words'

I18n.enforce_available_locales = false # remove later when possible to avoid deprecation warning without it

class Grader::Submission
  @solution_namespace = 'Grader::Solution'
  
  def self.solution_namespace
    @solution_namespace
  end
  
  def initialize(assignment, username)
    @assignment = Grader::Submission::Parser.new(assignment)
    @username   = username
  end
  
  def check
    begin
      get_solution_class.check_output
    rescue
      puts 'Sorry but this assignment is not available for self checking.'
    end
  end
  
  private
  
  def get_solution_class
    Object.const_get(build_solution_classname)
  end
  
  def build_solution_classname
    self.class.solution_namespace + '::' + major_assignment_number + minor_assignment_number
  end
  
  def major_assignment_number
    @assignment.major.to_i.to_words.capitalize
  end
  
  def minor_assignment_number
    @assignment.minor.to_i.to_words.capitalize
  end
end

class Grader::Submission::Parser
  def initialize(assignment)
    @assignment = assignment
  end
  
  def major
    @major || get_major_assignment_number
  end
  
  def minor
    @minor || get_minor_assignment_number
  end
  
  private
  
  def get_major_assignment_number
    parse_assignment_number
    @major
  end
  
  def parse_assignment_number
    @major, @minor = @assignment.match(/([\d]+)[_]([\d]+)/).captures
  end
  
  def get_minor_assignment_number
    parse_assignment_number
    @minor
  end
end