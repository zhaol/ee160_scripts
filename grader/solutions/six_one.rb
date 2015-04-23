class Grader::Solution::SixOne < Grader::Solution::Base
  def analyze_output
    verify_needs_magic
    verify_very_magical
    verify_too_magical
  end
  
  private
  
  def verify_needs_magic
    input = <<-END_OF_INPUT
7
    END_OF_INPUT
    run(input)
    
    if /^Your number needs more magic :\($/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_very_magical
    input = <<-END_OF_INPUT
125
    END_OF_INPUT
    run(input)
    
    if /^Your number is very magical!$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_too_magical
    input = <<-END_OF_INPUT
233
    END_OF_INPUT
    run(input)
    
    if /^Your number is too magical :\($/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
end
