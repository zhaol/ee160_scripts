class Grader::Submission::Attachment
  attr_reader :username, :assignment, :options
  
  def initialize(username, assignment, options)
    default_options = {as: 'student'}
    @options = default_options.merge(options)
    
    @username   = username
    @assignment = assignment
  end
  
  def assignment_file
    if submitted_as_student
      student_assignment_file
    else
      grader_assignment_file
    end
  end
  
  def function_file
    if submitted_as_student
      student_function_file
    else
      grader_function_file
    end  
  end
  
  private
  
  def student_assignment_file
    Dir.pwd + '/' + username + '_' + assignment + '.c'
  end
  
  def grader_assignment_file
    Dir.pwd + '/Submission attachment(s)/' + username + '_' + assignment + '.c'
  end
  
  def student_function_file
    Dir.pwd + '/' + username + '_' + assignment + '_helper_functions.c'
  end
  
  def grader_function_file
    Dir.pwd + '/Submission attachment(s)/' + username + '_' + assignment + '_helper_functions.c'
  end
  
  def submitted_as_student
    options[:as] == 'student'
  end
end