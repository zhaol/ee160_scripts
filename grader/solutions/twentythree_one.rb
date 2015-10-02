class Grader::Solution::TwentythreeOne < Grader::Solution::Base
  def analyze_output
    @input_file_url = "https://raw.githubusercontent.com/zhaol/ee160/gh-pages/code/files/test/23_1.input"
    verify_total_number_of_mamas
  end
  
  private

  def verify_total_number_of_mamas
    run
    
    
    if (/[^\d]?14[^\d]?/.match output) 
      # able to find multiple mama's in a single line and not count mama's inside longer mama-words (e.g. mamasan)
      report.write "Awesome job! The program was able to find multiple mama's in a single line and"
      report.write "knew not to count long mama-words (e.g. mamasan)"
    else
      if (/[^\d]?17[^\d]?/.match output)
        # only able to find multiple mama's in a single line
        report.write "Great job! The program was able to find multiple mama's in a single line"
        report.write "As a stretch goal, the program might also not count long mama-words (e.g. mamasan)"
      elsif (/[^\d]?12[^\d]?/.match output)
        # only able to not count mama's inside longer mama-words (e.g. mamasan)
        report.write "Great job! The program was able to not count long mama-words"
        report.write "As a stretch goal, the program might also be able to count multple mama's in a single line"
      else
        if (/[^\d]?10[^\d]?/.match output)
          # able to find what was given for assignment
          report.write "Good job! The program was able to find all 10 mama's from the input file"
          report.write "However, the program was not able to detect new occurrences of mama added to the top of the input file, here:"
          report.write @input_file_url
          report.update_score_by(-10)
        else
          # not able to parse assignment input
          report_standard_error_message(input_file, output)
          report.write "Did not output the correct number of mama's (10)"
          report.write "12, 14, or 17 were also acceptable if running the program with the modified input file here:"
          report.write @input_file_url
          report.update_score_by(-50)
        end
      end
    end
  end
end