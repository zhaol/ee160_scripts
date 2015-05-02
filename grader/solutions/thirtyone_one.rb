class Grader::Solution::ThirtyoneOne < Grader::Solution::Base
  def analyze_output
    verify_6_6_table
  end
  
  private

  def verify_6_6_table
    input = <<-END_OF_INPUT
7
7
49
48
47
46
45
44
43
42
41
40
39
38
37
36
35
34
33
32
31
30
29
28
27
26
25
24
23
22
21
20
19
18
17
16
15
14
13
12
11
10
9
8
7
6
5
4
3
2
1
    END_OF_INPUT
    
    run(input)
    
    expected_output = <<-END_OF_EXPECTED_OUTPUT
[0][0]: 49, [0][1]: 48, [0][2]: 47, [0][3]: 46, [0][4]: 45, [0][5]: 44, [0][6]: 43
[1][0]: 42, [1][1]: 41, [1][2]: 40, [1][3]: 39, [1][4]: 38, [1][5]: 37, [1][6]: 36
[2][0]: 35, [2][1]: 34, [2][2]: 33, [2][3]: 32, [2][4]: 31, [2][5]: 30, [2][6]: 29
[3][0]: 28, [3][1]: 27, [3][2]: 26, [3][3]: 25, [3][4]: 24, [3][5]: 23, [3][6]: 22
[4][0]: 21, [4][1]: 20, [4][2]: 19, [4][3]: 18, [4][4]: 17, [4][5]: 16, [4][6]: 15
[5][0]: 14, [5][1]: 13, [5][2]: 12, [5][3]: 11, [5][4]: 10, [5][5]: 9, [5][6]: 8
[6][0]: 7, [6][1]: 6, [6][2]: 5, [6][3]: 4, [6][4]: 3, [6][5]: 2, [6][6]: 1
    END_OF_EXPECTED_OUTPUT
    
    if /#{Regexp.escape(expected_output)}/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by(-50)
    end
  end
end