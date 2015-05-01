class Grader::Solution::TwentyOne < Grader::Solution::Base
  def analyze_output
    verify_account_balances
  end
  def analyze_syntax
    verify_no_qsort
  end
  private

  def verify_account_balances
    input = <<-END_OF_INPUT
500
c
n
150
s
n
200
s
n
1
c
y
    END_OF_INPUT
    run(input)
    if /List[\s]of[\s]Account[\s]Balances[\s=]*
        [\s]*0:[\s]*[$][\s]*1[.]00 
        [\s]*1:[\s]*[$][\s]*150[.]00 
        [\s]*2:[\s]*[$][\s]*200[.]00 
        [\s]*3:[\s]*[$][\s]*500[.]00/x.match output 
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-20)
    end
  end
  
  def verify_no_qsort
    if (/qsort/.match program_code) ||
      (/qsort/.match helper_functions)
      report.write "A qsort function was detected in your program"
      report.write "Please do not use the qsort function"
      report.update_score_by(-20)
    else
      # great
    end
  end
end