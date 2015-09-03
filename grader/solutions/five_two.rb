class Grader::Solution::FiveTwo < Grader::Solution::Base
  def analyze_output
    verify_b_1p23456_123456
    verify_z_12345p6_123456789
  end
  
  private
  
  def verify_b_1p23456_123456
    input = <<-END_OF_INPUT
b 1.23456 123456
    END_OF_INPUT
    run(input)
    
    if /^character: b\ndecimal: 1.23456\ninteger: 123456$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.write 'For assignment 05_2: If the program is working when you run it by yourself, but the homework checking software is returning something like:'
      report.write 'character:\ndecimal: 0.00000\ninteger: 32767'
      report.write 'Review the assignment 05_1 notes and pay particular attention to the "scanf phenomenon" portion.'
      report.write 'Post to Piazza if your are still stuck.'
      report.update_score_by(-20)
    end
  end
  
  def verify_z_12345p6_123456789
    input = <<-END_OF_INPUT
z
12345.6
123456789
    END_OF_INPUT
    run(input)
    
    if /^character: z\ndecimal: 12345.60000\ninteger: 123456$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.write 'For assignment 05_2: If the program is working when you run it by yourself, but the homework checking software is returning something like:'
      report.write 'character:\ndecimal: 0.00000\ninteger: 32767'
      report.write 'Review the assignment 05_1 notes and pay particular attention to the "scanf phenomenon" portion.'
      report.write 'Post to Piazza if your are still stuck.'
      report.update_score_by(-20)
    end
  end
end