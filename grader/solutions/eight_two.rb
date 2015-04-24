class Grader::Solution::EightTwo < Grader::Solution::Base
  def analyze_output
    verify_18
    verify_30
    verify_programmer
    verify_nonprogrammer
    verify_gpa
    verify_out_of_world_gpa
    verify_unbelievable_gpa
  end
  
  private
  
  def verify_18
    input = <<-END_OF_INPUT
18
n
3.1
    END_OF_INPUT
    run(input)
    
    if /^You have a bright future ahead of you.$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_30
    input = <<-END_OF_INPUT
30
y
1.1
    END_OF_INPUT
    run(input)
    
    if /^You have years of wisdom that can be paid forward.$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_programmer
    input = <<-END_OF_INPUT
31
y
2.1
    END_OF_INPUT
    run(input)
    
    if /^if\(crazy\)\{change_world\(\)\}$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_nonprogrammer
    input = <<-END_OF_INPUT
100
n
2.2
    END_OF_INPUT
    run(input)
    
    if /^The people who are crazy enough to think they can change the world, are the ones who do\. - Apple$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_gpa
    input = <<-END_OF_INPUT
10
n
2.2
    END_OF_INPUT
    run(input)
    
    if /^There's too much emphasis on this number\.$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_out_of_world_gpa
    input = <<-END_OF_INPUT
11
y
1000.2
    END_OF_INPUT
    run(input)
    
    if /^Your GPA is out of this world\.$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_unbelievable_gpa
    input = <<-END_OF_INPUT
1001
n
-1000.2
    END_OF_INPUT
    run(input)
    
    if /^Your GPA is unbelievable\.$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
end
