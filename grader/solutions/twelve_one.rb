class Grader::Solution::TwelveOne < Grader::Solution::Base
  def analyze_output
    verify_minimum_balances
  end
  private

  def verify_minimum_balances
    input = <<-END_OF_INPUT
300
c
n
500
c
n
500
s
y
    END_OF_INPUT
    run(input)
    
    if /$40.00/.match output
      # great
    elsif /40/.match output
      report.write "Please output minimum balance fees in currency format. Example: \"$40.00\""
      report.update_score_by -5
    elsif /60/.match output
      report.write "Program counts minimum balance fees from accounts that are over the minimum balance limit"
      report.update_score_by -10
    else
      report.write "Program did not correctly display total amount of minimum balance fees to be collected"
      report.update_score_by -20
    end
  end
end