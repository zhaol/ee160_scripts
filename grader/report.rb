class Grader::Report
  attr_reader :assignment, :username
  attr_accessor :score
  
  def initialize(assignment, username)
    @assignment = assignment
    @username = username
    @score = 100
  end
  
  def write(text)
    `echo #{Shellwords.escape(text)} >> #{report_file}`
  end
  
  def update_score_by(adjustment)
    @score = score + adjustment
  end
  
  def finalize
    print_summary  
  end
  
  private
  
  def report_file
    @report_file ||= username + '_' + assignment + '.report'
  end
  
  def print_summary
    `echo "Assignment Grade: #{score}" >> #{report_file}`
  end
end