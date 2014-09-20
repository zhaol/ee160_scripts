class Grader::Solution::FiveOne < Grader::Solution::Base
  def analyze_output
    verify_5
    verify_300
  end
  
  private

  def verify_5
    input = <<-END_OF_INPUT
5
    END_OF_INPUT
    run(input)
    
    if /integer: #{input}/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -10
    end
  end
  
  def verify_300
    input = <<-END_OF_INPUT
300
    END_OF_INPUT
    run(input)
    
    if /integer: #{input}/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -10
    end
  end
end