class Grader::Solution::FourTwo < Grader::Solution::Base
  def analyze_output
    run
    verify_line1
    verify_line2
    verify_line3
    verify_line4
  end
  
  private
  
  def verify_line1
    if /\/\/\/\/\s/.match output
      # great
    else
      report.write "First line output is incorrect"
      report.update_score_by -5
    end
  end
  def verify_line2
    if /\/\/The first number is 3\/\/\s/.match output
      # great
    else
      report.write "Second line output is incorrect"
      report.update_score_by -5
    end
  end
  def verify_line3
    if /\/\/The second number is 5.000000\/\/\s/.match output
      # great
    else
      report.write "Third line output is incorrect"
      report.update_score_by -5
    end
  end
  def verify_line4
    if /\/\/The special character is "\/"\/\/\s/.match output
      # great
    else
      report.write "Fourth line output is incorrect"
      report.update_score_by -5
    end
  end
end