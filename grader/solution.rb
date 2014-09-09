class Grader::Solution
end

class Grader::Solution::Base
  attr_accessor :report
  
  def initialize(assignment_file, report)
    @assignment_file = assignment_file
    @compiler = Grader::Submission::Compiler.new(@assignment_file)
    @report = report
  end
  
  def check_output
    if respond_to? :analyze_output
      compile
      analyze_output
      clean_up
    else
      puts "no output to check for this assignment"
    end
  end
  
  def check_syntax
    if respond_to? :analyze_syntax
      analyze_syntax
    else
      puts "no syntax to check for this assignment"
    end
  end
  
  private
  
  def compile
    @compiler.compile
  end
  
  def clean_up
    `rm #{@compiler.compiled_output}`
  end
end

Dir.glob(File.join(__dir__ + '/solutions', "**", "*.rb")).each do |file|
  require file
end