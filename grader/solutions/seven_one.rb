class Grader::Solution::SevenOne < Grader::Solution::Base
  def analyze_syntax
    notify_assignment_score
  end
  
  private
  
  def notify_assignment_score
    report.write "This assignment cannot be self-checked. Please disregard the generated score."
    report.update_score_by(-100)
  end
end
