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
c
n
200
c
n
1
c
y
    END_OF_INPUT
    run(input)
    
    if /1.+150.+200.+500/m.match output
      # great
    else
      report.write "Program did not correctly display List of Account Balances"
      report.update_score_by -20
    end
  end
  
  def verify_no_qsort
    if /qsort/.match program_code
      report.write "A qsort function was detected in your program code"
      report.update_score_by -20
    elsif /qsort/.match helper_functions
      report.write "A qsort function was detected in your helper functions"
      report.update_score_by -20
    else
      # great
    end
  end
end