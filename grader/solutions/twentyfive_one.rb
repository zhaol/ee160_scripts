class Grader::Solution::TwentyfiveOne < Grader::Solution::Base
  def analyze_output
    verify_E
    verify_Q
    verify_r
    verify_t
    verify_!
  end
  
  private

  def verify_E
    input = <<-END_OF_INPUT
E
    END_OF_INPUT
    run(input)
    
    if /This is a winning character/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_Q
    input = <<-END_OF_INPUT
Q
    END_OF_INPUT
    run(input)
    
    if /This uppercase character is not a winning character/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_r
    input = <<-END_OF_INPUT
r
    END_OF_INPUT
    run(input)
    
    if /This is a winning character/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_t
    input = <<-END_OF_INPUT
t
    END_OF_INPUT
    run(input)
    
    if /This lowercase character is not a winning character/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_!
    input = <<-END_OF_INPUT
!
    END_OF_INPUT
    run(input)
    
    if /This is an invalid character/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
end