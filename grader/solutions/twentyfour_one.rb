class Grader::Solution::TwentyfourOne < Grader::Solution::Base
  def analyze_output_files
    verify_account_holder_output_file
    #@input_file_url = "https://raw.githubusercontent.com/zhaol/ee160/gh-pages/code/files/23_1.input"
    #verify_total_number_of_mamas
  end
  
  private

  def verify_account_holder_output_file
    account_holder_name = "yo"
    starting_account_balance = 100
    input = <<-END_OF_INPUT
#{account_holder_name}
#{starting_account_balance}
c
y
    END_OF_INPUT
    run(input)
    
    ending_account_balance = starting_account_balance - 35  
    if /#{ending_account_balance}/.match output_file("#{account_holder_name}.txt") # TODO: remove at the end of semester
    #if /#{ending_account_balance}/.match output_file("#{account_holder_name}.output") # TODO: uncomment at the end of semester
      report.write "an output file with the correct ending account balance was found"  
    else
      report.write "the output file did not contain the correct ending account balance"
      report.update_score_by -40
    end  
  end
end