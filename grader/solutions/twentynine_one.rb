class Grader::Solution::TwentynineOne < Grader::Solution::Base
  def analyze_output
    verify_31
    verify_100
  end
  
  private

  def verify_31
    input = <<-END_OF_INPUT
31
    END_OF_INPUT
    run(input)
    
    expected_output = <<-END_OF_EXPECTED_OUTPUT
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
31
    END_OF_EXPECTED_OUTPUT
    
    if /#{expected_output}/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -20
    end
  end
  
  def verify_100
    input = <<-END_OF_INPUT
100
    END_OF_INPUT
    run(input)
    
    expected_output = <<-END_OF_EXPECTED_OUTPUT
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
31
32
Fizz
34
Buzz
Fizz
37
38
Fizz
Buzz
41
Fizz
43
44
FizzBuzz
46
47
Fizz
49
Buzz
Fizz
52
53
Fizz
Buzz
56
Fizz
58
59
FizzBuzz
61
62
Fizz
64
Buzz
Fizz
67
68
Fizz
Buzz
71
Fizz
73
74
FizzBuzz
76
77
Fizz
79
Buzz
Fizz
82
83
Fizz
Buzz
86
Fizz
88
89
FizzBuzz
91
92
Fizz
94
Buzz
Fizz
97
98
Fizz
Buzz
    END_OF_EXPECTED_OUTPUT
    
    if /#{expected_output}/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -20
    end
  end
end