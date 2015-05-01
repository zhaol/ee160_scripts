class Grader::Solution::ThirteenOne < Grader::Solution::Base
  def analyze_output
    run
    verify_int_over_float
    verify_int_over_int
    verify_mod
  end
  
  def analyze_syntax
    verify_float_cast
    verify_int_cast
  end
  
  private

  def verify_int_over_float
    if /^int \/ float: 0.750000$/.match output
      # great
    else
      report.write 'Output did not correctly output: int / float: 0.750000'
      report.update_score_by(-10)
    end
  end
  
  def verify_int_over_int
    if /^int \/ int: 0.750000$/.match output
      # great
    else
      report.write 'Output did not correctly output: int / int: 0.750000'
      report.update_score_by(-10)
    end
  end
  
  def verify_mod
    if /^using the % operator: 1$/.match output
      # great
    else
      report.write 'Output did not correctly output: using the % operator: 1'
      report.update_score_by(-10)
    end
  end
  
  def verify_float_cast
    if /[(]float[)][\s]?integer1[\s]?\/[\s]?integer2/.match program_code
      # great
    else
      report.write 'Could not find something similar to the following in your code: (float)integer1/integer2'
      report.update_score_by(-10)
    end
  end
  
  def verify_int_cast
    if (/integer2[\s]?%[\s]?integer1/.match program_code) ||
      (/[(]int[)][\s]?decimal[\s]?%[\s]?integer1/.match program_code)
      # great
    else
      report.write 'Could not find something similar to the following in your code: integer2 % integer1 or (int) decimal % integer1'
      report.update_score_by(-10)
    end
  end
end