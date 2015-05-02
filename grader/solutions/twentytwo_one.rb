class Grader::Solution::TwentytwoOne < Grader::Solution::Base
  def analyze_output
    verify_capitalization
  end
  def analyze_syntax
    verify_no_toupper
  end
  private

  def verify_capitalization
    input = <<-END_OF_INPUT
trey
300
c
y
    END_OF_INPUT
    run(input)
    
    if /Trey/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-20)
    end
  end
  
  def verify_no_toupper
    if (/toupper/.match program_code) ||
        (/toupper/.match helper_functions)
      report.write "A toupper function was detected in the program"
      report.update_score_by(-20)
    else
      # great
    end
  end
end