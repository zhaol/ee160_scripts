class Grader::Solution::EighteenOne < Grader::Solution::Base
  def analyze_output
    verify_functionality
  end
  
  def analyze_syntax
    verify_function
    verify_no_printing_account_summary_in_main
    verify_printing_account_summary_in_function
    verify_no_printing_total_number_of_accounts_in_main
    verify_printing_total_number_of_accounts_in_function
    verify_no_printing_total_amount_in_accounts_in_main
    verify_printing_total_amount_in_accounts_in_function
    verify_no_printing_minimum_balance_fee_percentage_in_main
    verify_printing_minimum_balance_fee_percentage_in_function
    verify_no_printing_bad_standing_accounts_percentage_in_main
    verify_printing_bad_standing_accounts_percentage_in_function
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
      report.update_score_by(-10)
    end
  end
  
  def verify_function
    if /^void[\s]?display_accounts_summary_information[\s]*[(]
      [\s]*int[\s]*total_number_of_accounts,
      [\s]*float[\s]*total_amount_in_accounts,
      [\s]*float[\s]*total_minimum_balance_fees,
      [\s]*int[\s]*total_accounts_with_minimum_balance_fees[)][\s]*{/x.match helper_functions
      #great
    else
      report.write 'Could not find function definition'
      report.update_score_by(-10)
    end
  end
  
  def verify_no_printing_account_summary_in_main
    if /^[^\/]*printf.+[A|a]ccounts\s+[S|s]ummary/.match program_code
      report.write "A printf for account summary was detectd in your main function"
      report.update_score_by(-10)
    else
      # great
    end
  end
  
  def verify_printing_account_summary_in_function
    if /printf.+[A|a]ccounts\s+[S|s]ummary/.match helper_functions
      # great
    else
      report.write "No printf for account summary was detectd in your helper function"
      report.update_score_by(-10)
    end
  end
  
  def verify_no_printing_total_number_of_accounts_in_main
    if /^[^\/]*printf.+total number of accounts.+total_number_of_accounts/.match program_code
      report.write "A printf for total_number_of_accounts was detectd in your main function"
      report.update_score_by(-10)
    else
      # great
    end
  end
  
  def verify_printing_total_number_of_accounts_in_function
    if /printf.+total number of accounts.+total_number_of_accounts/.match helper_functions
      # great
    else
      report.write "No printf for total_number_of_accounts was detectd in your helper function"
      report.update_score_by(-10)
    end
  end
  
  def verify_no_printing_total_amount_in_accounts_in_main
    if /^[^\/]*printf.+total amount in all accounts.+total_amount_in_accounts/.match program_code
      report.write "A printf for total_amount_in_accounts was detectd in your main function"
      report.update_score_by(-10)
    else
      # great
    end
  end
  
  def verify_printing_total_amount_in_accounts_in_function
    if /printf.+total amount in all accounts.+total_amount_in_accounts/.match helper_functions
      # great
    else
      report.write "No printf for total_amount_in_accounts was detectd in your helper function"
      report.update_score_by(-10)
    end
  end
  
  def verify_no_printing_minimum_balance_fee_percentage_in_main
    if /^[^\/]*printf.+total_minimum_balance_fees.*\/.*total_amount_in_accounts/.match program_code
      report.write "A printf for 'total_minimum_balance_fees / total_amount_in_accounts' was detectd in your main function"
      report.update_score_by(-10)
    else
      # great
    end
  end
  
  def verify_printing_minimum_balance_fee_percentage_in_function
    if /printf.+total_minimum_balance_fees.*\/.*total_amount_in_accounts/.match helper_functions
      # great
    else
      report.write "No printf for 'total_minimum_balance_fees / total_amount_in_accounts' was detectd in your helper function"
      report.update_score_by(-10)
    end
  end
  
  def verify_no_printing_bad_standing_accounts_percentage_in_main
    if /^[^\/]*printf.+total_accounts_with_minimum_balance_fees.*\/.*total_number_of_accounts/.match program_code
      report.write "A printf for 'total_accounts_with_minimum_balance_fees / total_number_of_accounts' was detectd in your main function"
      report.update_score_by(-10)
    else
      # great
    end
  end
  
  def verify_printing_bad_standing_accounts_percentage_in_function
    if /printf.+total_accounts_with_minimum_balance_fees.*\/.*total_number_of_accounts/.match helper_functions
      # great
    else
      report.write "No printf for 'total_accounts_with_minimum_balance_fees / total_number_of_accounts' was detectd in your helper function"
      report.update_score_by(-10)
    end
  end
end