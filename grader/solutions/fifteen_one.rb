class Grader::Solution::FifteenOne < Grader::Solution::Base
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
5
7
    END_OF_INPUT
    run(input)
    
    if /^The sum of your two numbers is:[\s]?12$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-20)
    end
  end

  def verify_prototype
    if /^int add[\s]?[(]int number1,[\s]*int number2[)];$/.match program_code
      # great
    else
      report.write 'Could not find the function prototype'
      report.update_score_by(-20)
    end
  end
  
  def verify_function
    if /^int add[\s]?[(]int number1,[\s]?int number2[)][\s]?{$/.match program_code
      # great
    else
      report.write 'Could not find the function definition'
      report.update_score_by(-20)
    end
  end
end