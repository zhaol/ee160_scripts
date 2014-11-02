class Grader::Solution::SixOne < Grader::Solution::Base
  def analyze_output
    verify_needs_magic
  end
  
  private
  
  def verify_needs_magic
    input = <<-END_OF_INPUT
7
    END_OF_INPUT
    run(input)
    
    if /^Your number needs more magic :( $/.match output
      # great
    else
      #report.write "Your program did correctly output \'Your number needs more magic :( \' when given a number less than 100"
      report.update_score_by -10
    end
  end
end
