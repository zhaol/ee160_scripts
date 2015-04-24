class Grader::Solution::EightOne < Grader::Solution::Base
  def analyze_output
    verify_below_checking_min
    verify_above_checking_min
    verify_below_savings_min
    verify_above_savings_min
    verify_invalid_account_type
  end
  
  private
  
  def verify_below_checking_min
    input = <<-END_OF_INPUT
499
c
    END_OF_INPUT
    run(input)
    
    if /^A minimum balance fee needs to be charged to this account.$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_above_checking_min
    input = <<-END_OF_INPUT
501
c
    END_OF_INPUT
    run(input)
    
    if /^A minimum balance fee does not need to be charged to this account.$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_below_savings_min
    input = <<-END_OF_INPUT
999
s
    END_OF_INPUT
    run(input)
    
    if /^A minimum balance fee needs to be charged to this account.$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_above_savings_min
    input = <<-END_OF_INPUT
1000
s
    END_OF_INPUT
    run(input)
    
    if /^A minimum balance fee does not need to be charged to this account.$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_invalid_account_type
    input = <<-END_OF_INPUT
0
m
    END_OF_INPUT
    run(input)
    
    if /^The account type entered is not valid.$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
end
