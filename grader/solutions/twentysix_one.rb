class Grader::Solution::TwentysixOne < Grader::Solution::Base
  def analyze_output_files
    verify_output_to_screen
    verify_output_to_file_and_not_screen
    verify_no_output
  end
  
  private
  
  def verify_output_to_screen
    input = <<-END_OF_INPUT
yo
100
c
y
s
    END_OF_INPUT
    run(input)
    
    if (/Accounts Summary/.match output) &&
        (/List of Account Balances/.match output)
      report.write "Good job! The accounts summary and balances screen outputs were found."
    else
      report.write "Sorry, but could not find valid accounts summary and balances screen outputs."
      report.update_score_by(-40)
    end  
  end
  
  def verify_output_to_file_and_not_screen
    input = <<-END_OF_INPUT
yo
100
c
y
f
    END_OF_INPUT
    run(input)
    
    if (/Accounts Summary/.match output_file("account_summary.output")) &&
        (/List of Account Balances/.match output_file("list_of_account_balances.output")) &&
         !(/Accounts Summary/.match output) &&
         !(/List of Account Balances/.match output)
      report.write "Good job! The accounts summary and balances files were found."
      report.write "And not outputs was printed to the screen."
    else
      report_standard_error_message(input, output)
      report.write "Sorry, but could not find valid accounts summary and balances files."
      report.write "Or outputs were found printed to the screen."
      report.update_score_by(-40)
    end  
  end
  
  def verify_no_output
    input = <<-END_OF_INPUT
yo
100
c
y
n
    END_OF_INPUT
    run(input)
    
    if (/Accounts Summary/.match output) &&
        (/List of Account Balances/.match output)
      report_standard_error_message(input, output)
      report.update_score_by(-40)
    else
      report.write "Good job! No outputs were detected."
    end  
  end
end