class Grader::Solution
end

class Grader::Solution::Base
  attr_accessor :report, :output
  attr_reader :assignment_file, :compiler
  
  def initialize(assignment_file, report)
    @assignment_file = assignment_file
    @compiler = Grader::Submission::Compiler.new(@assignment_file)
    @report = report
    @output = ''
  end
  
  def check_output
    if respond_to? :analyze_output
      if compiled_successfully
        analyze_output
        clean_up
      else
        report.write "Program failed to compile"
        report.update_score_by -100
      end
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
  
  def compiled_successfully
    compile
  end
  
  def compile
    compiler.compile
  end
  
  def run(interactive_inputs=nil, input_file=nil)
    create_input_file if input_file
    if interactive_inputs
      @output = execute_program_with(interactive_inputs)
    else
      @output = execute_program
    end
  end
  
  def execute_program_with(input)
    `#{pwd}/#{compiler.compiled_output} <<INPUT  
      #{input}
    INPUT`
  end
  
  def pwd
    Shellwords.escape(Dir.pwd)
  end
  
  def execute_program()
    `#{pwd}/#{compiler.compiled_output}`
  end
  
  def create_input_file
    # TODO
  end
  
  def clean_up
    `rm #{compiler.compiled_output}`
  end
  
  def report_standard_error_message(input, output)
    report.write "The program did not successfully handle the following scenario:"
    report.write "input: #{input}"
    report.write "output: #{output}"
  end
end

Dir.glob(File.join(__dir__ + '/solutions', "**", "*.rb")).each do |file|
  require file
end