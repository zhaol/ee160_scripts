class Grader::Solution::SixOne < Grader::Solution::Base
  def analyze_output
    verify_needs_magic
    verify_very_magical
    verify_too_magical
  end
  
  private
  
  def verify_needs_magic
    input = <<-END_OF_INPUT
7
    END_OF_INPUT
    run(input)
    
    if /^Your number needs more magic :($/.match output
      # great
    else
      #report.write "Your program did not correctly output \'Your number needs more magic :( \' when given a number less than 100"
      report.update_score_by -10
    end
  end
  
  def verify_very_magical
    input = <<-END_OF_INPUT
125
    END_OF_INPUT
    run(input)
    
    if /^Your number is very magical!$/.match output
      # great
    else
      #report.write "Your program did not correctly output \'Your number is very magical! \' when given a number between 100 and 199"
      report.update_score_by -10
    end
  end
  
  def verify_too_magical
    input = <<-END_OF_INPUT
233
    END_OF_INPUT
    run(input)
    
    if /^Your number is too magical :($/.match output
      # great
    else
      #report.write "Your program did not correctly output \'Your number is too magical :\( \' when given a number 200 or greater"
      report.update_score_by -10
    end
  end
  
end
