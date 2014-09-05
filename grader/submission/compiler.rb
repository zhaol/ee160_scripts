class Grader::Submission::Compiler
  def initialize(file)
    @file = file
  end
  
  def compile
    `gcc #{@file} -o #{output_filename}`
  end
  
  def compiled_output
    output_filename
  end
  
  private
  
  def output_filename
    'self_test'
  end
end