class Grader::Solution::FifteenTwo < Grader::Solution::Base
  def analyze_output
    verify_addition
  end
  
  def analyze_syntax
    verify_prototype
    verify_function
  end
  
  private
  
  def verify_addition
    input = <<-END_OF_INPUT
12
101
    END_OF_INPUT
    run(input)
    
    if (/^The first number is now:[\s]?13$/.match output) &&
      (/^The second number is now:[\s]?102$/.match output)
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-20)
    end
  end

  def verify_prototype
    if /^void add_now[\s]?[(]int [*]number1,[\s]*int [*]number2[)];$/.match program_code
      # great
    else
      report.write 'Could not find the function prototype'
      report.update_score_by(-20)
    end
  end
  
  def verify_function
    if /^void add_now[\s]?[(]int [*]number1,[\s]?int [*]number2[)][\s]?{$/.match program_code
      # great
    else
      report.write 'Could not find the function definition'
      report.update_score_by(-20)
    end
  end
end