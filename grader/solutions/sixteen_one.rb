class Grader::Solution::SixteenOne < Grader::Solution::Base
  def analyze_output
    verify_functionality
  end
  
  def analyze_syntax
    verify_prototype
    verify_function
  end
  private

  def verify_functionality
    input = <<-END_OF_INPUT
300
c
y
    END_OF_INPUT
    run(input)
   
    if (/^A minimum balance fee needs to be charged to this account[.]$/.match output) &&
      (/^Minimum Balance Fee to Account Balance Percentage: 11[.]7%$/.match output) &&
      (/^The new account balance is [$]265[.]00$/.match output)
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-20)
    end
  end
  
  def verify_prototype
    if /^void[\s]?display_account_summary_info[\s]*[(]
      [\s]*int[\s]*minimum_balance_fee_charged_flag,
      [\s]*int[\s]*[*]total_accounts_with_minimum_balance_fees,
      [\s]*int[\s]*[*]total_minimum_balance_fees,
      [\s]*float[\s]*minimum_balance_fee,
      [\s]*float[\s]*account_balance[)][\s]*;/x.match program_code
      #great
    else
      report.write 'Could not find function prototype'
      report.update_score_by(-20)
    end
  end
  
  def verify_function
    if /^void[\s]?display_account_summary_info[\s]*[(]
      [\s]*int[\s]*minimum_balance_fee_charged_flag,
      [\s]*int[\s]*[*]total_accounts_with_minimum_balance_fees,
      [\s]*int[\s]*[*]total_minimum_balance_fees,
      [\s]*float[\s]*minimum_balance_fee,
      [\s]*float[\s]*account_balance[)][\s]*{/x.match program_code
      #great
    else
      report.write 'Could not find function definition'
      report.update_score_by(-20)
    end
  end
end