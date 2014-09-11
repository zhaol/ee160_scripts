class Grader::Solution::TwoOne < Grader::Solution::Base
  def analyze_output
    run
    verify_it_was_nice_meeting_you
    verify_hope_to_see_you_again
    verify_dont_forget_to_write
  end
  
  private
  
  def verify_it_was_nice_meeting_you
    if /^It was nice meeting you, world.$/.match output
      # great
    else
      report.write "Output did not correctly output: It was nice meeting you, world."
      report.update_score_by -10
    end
  end
  
  def verify_hope_to_see_you_again
    if /^Hope to see you again soon. :-[\\]$/.match output
      # great
    else
      report.write "Output did not correctly output: Hope to see you again soon. :-\\"
      report.update_score_by -30
    end
  end
  
  def verify_dont_forget_to_write
    if /^Don't forget to write.$/.match output
      # great
    else
      report.write "Output did not correctly output: Don't forget to write."
      report.update_score_by -10
    end
  end
end