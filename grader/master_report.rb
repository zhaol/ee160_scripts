class Grader::MasterReport
  attr_reader :assignment
  
  def initialize(assignment)
    @assignment = assignment
  end
  
  def append(username, folder)
    write_heading folder 
    copy_report_for username, folder
    write_separator
  end
  
  private
  
  def write_heading(folder)
    `echo 'student: #{folder}' >> #{master_report}`
  end
  
  def master_report
    @report_file ||= 'master_' + assignment + '.report'
  end
  
  def copy_report_for(username, folder)
    `cat #{student_report(username, folder)} >> #{master_report}`
  end
  
  def student_report(username, folder)
    "#{Shellwords.escape(folder)}/#{username}_#{assignment}.report"
  end
  
  def write_separator
    `echo '' >> #{master_report}`
  end
end