class Grader::Solution::SeventeenOne < Grader::Solution::Base
  def analyze_output
    verify_3p3
  end
  
  def analyze_syntax
    verify_pi_macro
    verify_circumference_macro
    verify_circumference_macro_was_used
    verify_circle_area_macro
    verify_circle_area_macro_was_used
    verify_square_area_macro
  end
  
  private
  
  def verify_3p3
    input = <<-END_OF_INPUT
3.3
    END_OF_INPUT
    run(input)

    if (/circumference.+20[.]72$/.match output) &&
      (/area.+circle.+34[.]19$/.match output) &&
      (/area.+square.+10[.]89$/.match output)
      report.write "The program produced the correct output"
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_pi_macro
    if /#define[\s]+PI[\s]+3.14/.match macros
      report.write "A macro for PI was found"
    else
      report.write "A macro for PI was not found"
      report.update_score_by(-10)
    end
  end
  
  def verify_circumference_macro
    if /#define[\s]+CIRCUMFERENCE[\s]+/.match macros
      report.write "A macro for CIRCUMFERENCE was found"
    else
      report.write "A macro for CIRCUMFERENCE was not found"
      report.update_score_by(-10)
    end
  end

  def verify_circumference_macro_was_used
    if /printf.+CIRCUMFERENCE/.match program_code
      report.write "A macro for CIRCUMFERENCE was used"
    else
      report.write "A macro for CIRCUMFERENCE was not used"
      report.update_score_by(-10)
    end
  end
  
  def verify_circle_area_macro
    if /#define[\s]+CIRCLE_AREA[\s]+/.match macros
      report.write "A macro for CIRCLE_AREA was found"
    else
      report.write "A macro for CIRCLE_AREA was not found"
      report.update_score_by(-10)
    end
  end
  
  def verify_circle_area_macro_was_used
    if /printf.+CIRCLE_AREA/.match program_code
      report.write "A macro for CIRCLE_AREA was used"
    else
      report.write "A macro for CIRCLE_AREA was not used"
      report.update_score_by(-10)
    end
  end
  
  def verify_square_area_macro
    if /#define[\s]+SQUARE_AREA\s+/.match macros
      report.write "A macro for SQUARE_AREA was found"
    else
      report.write "A macro for SQUARE_AREA was not found"
      report.update_score_by(-10)
    end
  end
  
  def verify_square_area_macro_was_used
    if /printf.+SQUARE_AREA/.match program_code
      report.write "A macro for SQUARE_AREA was used"
    else
      report.write "A macro for SQUARE_AREA was not used"
      report.update_score_by(-10)
    end
  end
end