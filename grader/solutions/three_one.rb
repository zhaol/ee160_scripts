class Grader::Solution::ThreeOne < Grader::Solution::Base
  def analyze_syntax
    verify_no_00_hardcoding
    verify_no_000_hardcoding
  end
  
  private
  
  def verify_no_00_hardcoding
    if /(?<!0)0{2}(?!0)/.match program_code
      report.write "A sequence of '00' was detectd in your program; please do not hardcode '00' into your program"
      report.update_score_by -10
    else
      # great
    end
  end
  
  def verify_no_000_hardcoding
    if /(?<!0)0{3}(?!0)/.match program_code
      report.write "A sequence of '000' was detectd in your program; please do not hardcode '000' into your program"
      report.update_score_by -10
    else
      # great
    end
  end
end