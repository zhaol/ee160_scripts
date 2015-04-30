class Grader::Solution::TwelveOne < Grader::Solution::Base
  def analyze_output
    verify_total_min_bal_fee_collected
  end
  private

  def verify_total_min_bal_fee_collected
    input = <<-END_OF_INPUT
300
c
n
500
c
n
500
s
n
1000
s
y
    END_OF_INPUT
    run(input)
    
    if /^The total amount of minimum balance fee collected: \$40.00$/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-50)
    end
  end
end