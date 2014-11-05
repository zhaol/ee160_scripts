class Grader::Solution
end

class Grader::Solution::Base
  attr_accessor :report, :output, :input_file_url,
    :program_code, :helper_functions, :macros, :output_file
  attr_reader :attachment, :compiler
  
  def initialize(attachment, report)
    @attachment = attachment
    @compiler   = Grader::Submission::Compiler.new(attachment.assignment_file)
    @report     = report
    @output     = ''
  end
  
  def check_output
    if respond_to? :analyze_output
      puts "checking output..."
      if compiled_successfully
        puts "running compiled program..."
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
      puts "checking syntax..."
      begin
        analyze_syntax
      rescue Exception => message
        report.write "couldn't find the following file"
        report.write message
        report.update_score_by -100    
      end
    else
      puts "no syntax to check for this assignment"
    end
  end
  
  def check_output_files
    if respond_to? :analyze_output_files
      puts "checking output files..."
      if compiled_successfully
        puts "running compiled program..."
        begin
          analyze_output_files
        rescue Exception => message
          report.write "the program did not generate the following output file"
          report.write message
          report.update_score_by -100            
        end
        clean_up
      else
        report.write "Program failed to compile"
        report.update_score_by -100
      end
    else
      puts "no output files to check for this assignment"
    end
  end
  
  private
  
  def compiled_successfully
    compile
  end
  
  def compile
    compiler.compile
  end
  
  def program_code
    @program_code ||= File.open(attachment.assignment_file).read
  end
  
  def helper_functions
    @helper_functions ||= File.open(attachment.function_file).read  
  end
  
  def macros
    @macros ||= File.open(attachment.macro_file).read  
  end
  
  def output_file(filename)
    @output_file ||= File.open(attachment.output_file(filename)).read
  end
  
  def run(interactive_inputs=nil)
    get_input_file if input_file_url
    if interactive_inputs
      @output = execute_program_with(interactive_inputs)
    else
      @output = execute_program
    end
  end
  
  def get_input_file
    `wget -Nq #{input_file_url}`
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

  def clean_up
    `rm #{compiler.compiled_output}`
    `rm *.txt` # TODO: remove after semester
    #`rm *.output` # TODO: uncomment after semester
  end
  
  def report_standard_error_message(input, output)
    report.write "The program did not successfully handle the following scenario:"
    report.write "input:"
    report.write input
    report.write "output:"
    report.write output
  end
end

Dir.glob(File.join(__dir__ + '/solutions', "**", "*.rb")).each do |file|
  require file
end