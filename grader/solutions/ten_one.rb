class Grader::Solution::TenOne < Grader::Solution::Base
  def analyze_output
    verify_exitable
  end
  
  private
  
  def verify_exitable
    input = <<-END_OF_INPUT
s
1000
x
    END_OF_INPUT
    run(input)
    
    if /^Exiting program\.\.\.$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-50)
    end
  end
end
