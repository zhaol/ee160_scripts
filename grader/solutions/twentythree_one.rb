class Grader::Solution::TwentythreeOne < Grader::Solution::Base
  def analyze_output
    @input_file_url = "https://raw.githubusercontent.com/zhaol/ee160/gh-pages/code/files/23_1.input"
    verify_total_number_of_mamas
  end
  
  private

  def verify_total_number_of_mamas
    run
    
    if / 10 /.match output
      # great
    else
      report.write "Did not output the correct number of mama's (10)"
      report.update_score_by -50
    end
  end
end