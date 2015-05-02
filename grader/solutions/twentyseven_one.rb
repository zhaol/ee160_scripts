class Grader::Solution::TwentysevenOne < Grader::Solution::Base
  def analyze_output
    verify_100_and_q
    verify_invalid_character_and_q
  end
  
  def analyze_syntax
    verify_do_while
    verify_for
  end
  
  private

  def verify_100_and_q
    input = <<-END_OF_INPUT
100
q
    END_OF_INPUT
    run(input)
    
    expected_output = <<-END_OF_EXPECTED_OUTPUT
counting: 0
counting: 1
counting: 2
counting: 3
counting: 4
counting: 5
counting: 6
counting: 7
counting: 8
counting: 9
counting: 10
counting: 11
counting: 12
counting: 13
counting: 14
counting: 15
counting: 16
counting: 17
counting: 18
counting: 19
counting: 20
counting: 21
counting: 22
counting: 23
counting: 24
counting: 25
counting: 26
counting: 27
counting: 28
counting: 29
counting: 30
counting: 31
counting: 32
counting: 33
counting: 34
counting: 35
counting: 36
counting: 37
counting: 38
counting: 39
counting: 40
counting: 41
counting: 42
counting: 43
counting: 44
counting: 45
counting: 46
counting: 47
counting: 48
counting: 49
counting: 50
counting: 51
counting: 52
counting: 53
counting: 54
counting: 55
counting: 56
counting: 57
counting: 58
counting: 59
counting: 60
counting: 61
counting: 62
counting: 63
counting: 64
counting: 65
counting: 66
counting: 67
counting: 68
counting: 69
counting: 70
counting: 71
counting: 72
counting: 73
counting: 74
counting: 75
counting: 76
counting: 77
counting: 78
counting: 79
counting: 80
counting: 81
counting: 82
counting: 83
counting: 84
counting: 85
counting: 86
counting: 87
counting: 88
counting: 89
counting: 90
counting: 91
counting: 92
counting: 93
counting: 94
counting: 95
counting: 96
counting: 97
counting: 98
counting: 99
counting: 100
Please enter a number to count or 'q' to quit:
Quitting...
    END_OF_EXPECTED_OUTPUT
    
    if /#{expected_output}/.match output
      report.write 'The program successfully handled a valid entry'
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  
  def verify_invalid_character_and_q
    input = <<-END_OF_INPUT
a
q
    END_OF_INPUT
    run(input)
    
    expected_output = <<-END_OF_EXPECTED_OUTPUT
Please enter a valid entry
Please enter a number to count or 'q' to quit:
Quitting...
    END_OF_EXPECTED_OUTPUT
    
    if /#{expected_output}/.match output
      report.write 'The program successfully handled an invalid entry'
    else
      report_standard_error_message(input, output)
      report.update_score_by(-10)
    end
  end
  
  def verify_do_while
    if (/do[\s]*{/.match program_code) &&
        (/}[\s]*while[\s]*[(]/.match program_code)
      report.write 'do while loop was found'
    else
      report.write 'do while loop was not found'
      report.update_score_by(-10)
    end
  end
  
  def verify_for
    if /for[\s]*[(]/.match program_code
      report.write 'for loop was found'
    else
      report.write 'for loop was not found'
      report.update_score_by(-10)
    end
  end
end