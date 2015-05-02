class Grader::Solution::TwentyeightOne < Grader::Solution::Base
  def analyze_output
    verify_functionality
  end
  
  def analyze_syntax
    verify_for
  end
  
  private
  
  def verify_functionality
    input = <<-END_OF_INPUT
bush
300
c
y
    END_OF_INPUT
    run(input)
   
    if (/^Minimum Balance Fee to Account Balance Percentage: 11[.]7%$/.match output) &&
      (/^The new account balance is [$]265[.]00$/.match output)
      report.write 'The program still functions as before'
    else
      report_standard_error_message(input, output)
      report.update_score_by(-20)
    end
  end
  
  def verify_for
    if /for[\s]*[(]/.match helper_functions
      report.write 'for loop was found'
    else
      report.write 'for loop was not found'
      report.update_score_by(-10)
    end
  end
end