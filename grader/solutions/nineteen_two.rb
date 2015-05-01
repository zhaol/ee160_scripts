class Grader::Solution::NineteenTwo < Grader::Solution::Base
  def analyze_output
    verify_functionality
  end
  
  def analyze_syntax
    verify_get_values_usage
    verify_get_values_definition
    verify_display_values_usage
    verify_display_values_definition
  end
  
  private

  def verify_functionality
    input = <<-END_OF_INPUT
1.01
2.02
3.03
4.04
5.05
6.06
7.07
8.08
9.09
10.01
    END_OF_INPUT
    run(input)
    
    inputs = [1.01, 2.02, 3.03, 4.04, 5.05, 6.06, 7.07, 8.08, 9.09, 10.01]
    
    if output_contains_all inputs
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_get_values_definition
    if /^void[\s]?get_values[\s]*[(] # ensure function name
      [\s]*float[\s]*                # ensure float data type
      .+\[\]                         # ensure array 
      [)][\s]*{/x.match helper_functions
      #great
    else
      report.write 'Could not find get_values function definition'
      report.update_score_by(-10)
    end
  end
    
  def verify_get_values_usage
    if /get_values[\s]?[(][\s]?list_of_values[\s]?[)];/.match program_code
      #great
    else
      report.write 'Could not find get_values function used'
      report.update_score_by(-10)
    end
  end
  
  def verify_display_values_definition
    if /^void[\s]?display_values[\s]*[(] # ensure function name
      [\s]*float[\s]*                # ensure float data type
      .+\[\]                         # ensure array 
      [)][\s]*{/x.match helper_functions
      #great
    else
      report.write 'Could not find display_values function definition'
      report.update_score_by(-10)
    end
  end
  
  def verify_display_values_usage
    if /display_values[\s]?[(][\s]?list_of_values[\s]?[)];/.match program_code
      #great
    else
      report.write 'Could not find display_values function used'
      report.update_score_by(-10)
    end
  end
  
  def output_contains_all(inputs)
    inputs.all? do |input|
      /#{input}/.match output
    end
  end
end