class Grader::Submission::Parser
  def initialize(assignment)
    @assignment = assignment
  end
  
  def major
    @major || get_major_assignment_number
  end
  
  def minor
    @minor || get_minor_assignment_number
  end
  
  def identifier
    @assignment
  end
  
  private
  
  def get_major_assignment_number
    parse_assignment_number
    @major
  end
  
  def parse_assignment_number
    @major, @minor = @assignment.match(/([\d]+)[_]([\d]+)/).captures
  end
  
  def get_minor_assignment_number
    parse_assignment_number
    @minor
  end
end