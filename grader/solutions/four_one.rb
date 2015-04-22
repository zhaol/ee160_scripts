class Grader::Solution::FourOne < Grader::Solution::Base
  def analyze_output
    run
    verify_output
  end
  
  private
  
  def verify_output
    if /^The result is: -0.250000$/.match output
      # great
    else
      report.write "Output did not correctly output: The result is: -0.250000"
      report.update_score_by(-50)
    end
  end
end