class Grader::Solution::NineteenOne < Grader::Solution::Base
  def analyze_output
    verify_ten_inputs
    verify_five_inputs
  end
  
  private

  def verify_ten_inputs
    input = <<-END_OF_INPUT
1.1
2.2
3.3
4.4
5.5
6.6
7.7
8.8
9.9
10.10
    END_OF_INPUT
    run(input)
    
    inputs = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9, 10.10]
    
    if output_contains_all inputs
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -20
    end
  end
  
  def verify_five_inputs
    input = <<-END_OF_INPUT
1.1
2.2
3.3
4.4
5.5
99.9
99.9
99.9
99.9
99.9
    END_OF_INPUT
    run(input)
    
    inputs = [1.1, 2.2, 3.3, 4.4, 5.5, 99.9]
    
    if (output_contains_all(inputs)) && (output_contains(99.9, 5))
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -20
    end
  end
  
  def output_contains_all(inputs)
    inputs.all? do |input|
      /#{input}/.match output
    end
  end
  
  def output_contains(text, times)
    output.scan(/#{text}/).size == times  
  end
end