class Grader::Solution::EighteenOne < Grader::Solution::Base
  def analyze_syntax
    verify_no_printing_account_summary_in_main
    verify_no_printing_total_number_of_accounts_in_main
    verify_no_printing_total_amount_in_accounts_in_main
    verify_no_printing_minimum_balance_fee_percentage
    verify_no_printing_bad_standing_accounts_percentage
  end
  
  private
  
  def verify_no_printing_account_summary_in_main
    if /printf.+[A|a]ccounts\s+[S|s]ummary/.match program_code
      report.write "A printf for account summary was detectd in your main function"
      report.update_score_by -10
    else
      # great
    end
  end
  
  def verify_no_printing_total_number_of_accounts_in_main
    if /printf.+total_number_of_accounts/.match program_code
      report.write "A printf for total_number_of_accounts was detectd in your main function"
      report.update_score_by -10
    else
      # great
    end
  end
  
  def verify_no_printing_total_amount_in_accounts_in_main
    if /printf.+total_amount_in_accounts/.match program_code
      report.write "A printf for total_amount_in_accounts was detectd in your main function"
      report.update_score_by -10
    else
      # great
    end
  end
  
  def verify_no_printing_minimum_balance_fee_percentage
    if /printf.+total_minimum_balance_fees.*\/.*total_amount_in_accounts/.match program_code
      report.write "A printf for 'total_minimum_balance_fees / total_amount_in_accounts' was detectd in your main function"
      report.update_score_by -10
    else
      # great
    end
  end
  
  def verify_no_printing_bad_standing_accounts_percentage
    if /printf.+total_accounts_with_minimum_balance_fees.*\/.*total_number_of_accounts/.match program_code
      report.write "A printf for 'total_accounts_with_minimum_balance_fees / total_number_of_accounts' was detectd in your main function"
      report.update_score_by -10
    else
      # great
    end
  end
end