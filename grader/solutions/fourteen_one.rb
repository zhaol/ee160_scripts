class Grader::Solution::FourteenOne < Grader::Solution::Base
  def analyze_output
    verify_overdrawn_savings_account_relative_to_overall_overdrawn_accounts
  end
  private

  def verify_overdrawn_savings_account_relative_to_overall_overdrawn_accounts
    input = <<-END_OF_INPUT
300
c
n
600
c
n
500
s
n
1000
s
y
    END_OF_INPUT
    run(input)
    
    if /^The percentage of saving accounts that were charged a minimum balance fee [(]relative to the total number of accounts that were charged a minimum balance fee[)]:[\s]?50.0%$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-50)
    end
  end
end