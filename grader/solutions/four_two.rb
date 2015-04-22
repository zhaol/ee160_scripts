class Grader::Solution::FourTwo < Grader::Solution::Base
  def analyze_output
    run
    verify_slashes
    verify_integer
    verify_decimal
    verify_character
  end
  
  private
  
  def verify_slashes
    if /^\/\\\/\\$/.match output
      # great
    else
      report.write 'Output did not correctly output: /\\/\\'
      report.update_score_by(-10)
    end
  end
  
  def verify_integer
    if /^'The first number is \$3'$/.match output
      # great
    else
      report.write "Output did not correctly output: 'The first number is $3'"
      report.update_score_by(-10)
    end
  end
  
  def verify_decimal
    if /^"The second number is 5.000000\?"$/.match output
      # great
    else
      report.write 'Output did not correctly output: "The second number is 5.000000?"'
      report.update_score_by(-10)
    end
  end
  
  def verify_character
    if /^\/\|\\The special character is "\\"\/\|\\$/.match output
      # great
    else
      report.write 'Output did not correctly output: /|\The special character is "\"/|\\'
      report.update_score_by(-10)
    end
  end
end