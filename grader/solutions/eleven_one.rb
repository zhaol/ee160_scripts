class Grader::Solution::ElevenOne < Grader::Solution::Base
  def analyze_output
    verify_3_3
  end
  
  private
  
  def verify_3_3
    input = <<-END_OF_INPUT
3
3
    END_OF_INPUT
    run(input)
    
    if /\s-5178\D/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-50)
    end
  end
end
