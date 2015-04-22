class Grader::Solution::ThreeOne < Grader::Solution::Base
  def analyze_output
    run
    verify_fore_zero_padding
    verify_aft_zero_padding
    verify_exponentials
    verify_truncation
    verify_negative_numbers
  end
  
  def analyze_syntax
    verify_no_zero_hardcoding
  end
  
  private
  
  def verify_fore_zero_padding
    if /^zero padding in back of a number: 1\.23450 1\.234500 1\.2345000$/.match output
      # great
    else
      report.write "Output did not correctly output: zero padding in back of a number: 1.23450 1.234500 1.2345000"
      report.update_score_by(-10)
    end
  end
  
  def verify_aft_zero_padding
    if /^zero padding in front of a number: 1\.2345 01\.2345 001\.2345$/.match output
      # great
    else
      report.write "Output did not correctly output: zero padding in front of a number: 1.2345 01.2345 001.2345"
      report.update_score_by(-10)
    end
  end
  
  def verify_exponentials
    if /^exponentials \(base 10\): 1.2345e\+00 1.23450e\+00 1.234500e\+00$/.match output
      # great
    else
      report.write "Output did not correctly output: exponentials (base 10): 1.2345e+00 1.23450e+00 1.234500e+00"
      report.update_score_by(-10)
    end
  end
  
  def verify_truncation
    if /^truncation vs rounding of numbers: 1\.234$/.match output
      # great
    else
      report.write "Output did not correctly output: truncation vs rounding of numbers: 1.234"
      report.update_score_by(-10)
    end
  end
  
  def verify_negative_numbers
    if /^negative numbers: -1\.2345 -1\.2345e\+00$/.match output
      # great
    else
      report.write "Output did not correctly output: negative numbers: -1.2345 -1.2345e+00"
      report.update_score_by(-10)
    end
  end
  
  def verify_no_zero_hardcoding
    if /0{2,}/.match program_code
      report.write "A sequence of hardcoded zeros (e.g 00 or 000) was detectd in your program; please do not hardcode zeros into your program"
      report.update_score_by(-10)
    else
      # great
    end
  end
end
