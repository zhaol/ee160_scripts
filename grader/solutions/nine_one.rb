class Grader::Solution::NineOne < Grader::Solution::Base
  def analyze_output
    verify_2p1
  end
  
  private
  
  def verify_2p1
    input = <<-END_OF_INPUT
2.1
    END_OF_INPUT
    run(input)
    
    if /^2\.100000\s
         4\.410000\s
         9\.261000\s
        19\.448100\s
        40\.841010\s
        85\.766121\s
       180\.108854\s
       378\.228594\s
       794\.280047\s
      1667\.988098\s
      3502\.775005\s
      7355\.827511\s
     15447\.237774\s
     32439\.199325\s
     68122\.318583\s
    143056\.869024\s
    300419\.424951\s
    630880\.792397\s
   1324849\.664033\s
   2782184\.294470\s
   5842587\.018386\s
  12269432\.738611\s
  25765808\.751082\s
  54108198\.377273\s
 113627216\.592273$/x.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-50)
    end
  end
end
