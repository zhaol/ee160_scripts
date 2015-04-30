class Grader::Solution::ElevenTwo < Grader::Solution::Base
  def analyze_output
    verify_quotient
    verify_remainder
  end
  
  private
  
  def verify_quotient
    input = <<-END_OF_INPUT
40
7
    END_OF_INPUT
    run(input)
    
    if /^The quotient is: 5$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-25)
    end
  end
  
  def verify_remainder
    input = <<-END_OF_INPUT
90
9
    END_OF_INPUT
    run(input)
    
    if /^The remainder is: 0$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-25)
    end
  end
end
