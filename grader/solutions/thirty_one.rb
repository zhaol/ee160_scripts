class Grader::Solution::ThirtyOne < Grader::Solution::Base
  def analyze_output
    verify_functionality
  end
  
  def analyze_syntax
    verify_goto
  end
  
  private
  
  def verify_functionality
    input = <<-END_OF_INPUT
clinton
-300
-500
350
c
y
    END_OF_INPUT
    run(input)
   
    if there_are_two_positive_balance_messages
      report.write 'The program functions as expected'
    else
      report_standard_error_message(input, output)
      report.update_score_by(-20)
    end
  end
  
  def there_are_two_positive_balance_messages
    (/(Please enter a positive account balance)/.match(output)) &&
    (/(Please enter a positive account balance)/.match(output).size == 2)
  end
  
  def verify_goto
    if /[\s]*goto[\s]*/.match helper_functions
      report.write 'goto was found'
    else
      report.write 'goto was not found'
      report.update_score_by(-10)
    end
  end
end