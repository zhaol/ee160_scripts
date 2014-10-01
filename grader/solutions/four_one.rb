class Grader::Solution::FourOne < Grader::Solution::Base
  def analyze_output
    run
    verify_output
  end
  
  private
  
  def verify_output
    if /(The result is: 64\s$|The result is: 64.000000\s$)/.match output
      # great
    else
      report.write "Output did not correctly output the square of the two numbers"
      report.update_score_by -10
    end
  end
end