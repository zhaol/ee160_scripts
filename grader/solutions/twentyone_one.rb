class Grader::Solution::TwentyoneOne < Grader::Solution::Base
  def analyze_output
    verify_zebra
    verify_dessert
  end
  
  private

  def verify_zebra
    input = <<-END_OF_INPUT
zebra
    END_OF_INPUT
    run(input)
    
    if /\baberz\b/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-20)
    end
  end
  
  def verify_dessert
    input = <<-END_OF_INPUT
dessert
    END_OF_INPUT
    run(input)
    
    if /\bdeersst\b/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-20)
    end
  end
end