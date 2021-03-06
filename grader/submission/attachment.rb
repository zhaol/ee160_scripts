class Grader::Submission::Attachment
  class << self
    attr_accessor :STUDENT_DIRECTORY, :GRADER_DIRECTORY,
      :ASSIGNMENT_FILE_TRAILING_CHARACTERS, :FUNCTION_FILE_TRAILING_CHARACTERS,
      :MACRO_FILE_TRAILING_CHARACTERS, :INPUT_FILE_TRAILING_CHARACTERS
  end
  @STUDENT_DIRECTORY                   = '/'
  @GRADER_DIRECTORY                    = '/Submission attachment(s)/'
  @ASSIGNMENT_FILE_TRAILING_CHARACTERS = '.c'
  @FUNCTION_FILE_TRAILING_CHARACTERS   = '_functions.c'
  @MACRO_FILE_TRAILING_CHARACTERS      = '_macros.h'
  @INPUT_FILE_TRAILING_CHARACTERS      = '.input'
  
  attr_reader :username, :assignment, :options
  
  def initialize(username, assignment, options)
    default_options = {as: 'student'}
    @options = default_options.merge(options)
    
    @username   = username
    @assignment = assignment
  end
  
  def assignment_file
    Dir.pwd + directory + username + '_' + assignment + self.class.ASSIGNMENT_FILE_TRAILING_CHARACTERS
  end
  
  def function_file
    Dir.pwd + directory + username + '_' + assignment + self.class.FUNCTION_FILE_TRAILING_CHARACTERS
  end
  
  def macro_file
    Dir.pwd + directory + username + '_' + assignment + self.class.MACRO_FILE_TRAILING_CHARACTERS
  end
  
  def output_file(filename)
    Dir.pwd + directory + filename
  end
  
  def input_file
    Dir.pwd + directory + assignment + self.class.INPUT_FILE_TRAILING_CHARACTERS
  end
  
  private
  
  def directory
    submitted_as_student ? self.class.STUDENT_DIRECTORY : self.class.GRADER_DIRECTORY
  end
  
  def submitted_as_student
    options[:as] == 'student'
  end
end