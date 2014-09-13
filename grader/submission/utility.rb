class Grader::Submission::Utility
  def self.get_assignment_file_for_student(username, assignment)
    Dir.pwd + '/' + username + '_' + assignment + '.c'
  end
  
  def self.get_assignment_file_for_grader(username, assignment)
    Dir.pwd + '/Submission attachment(s)/' + username + '_' + assignment + '.c'
  end
end