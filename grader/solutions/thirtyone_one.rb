class Grader::Solution::ThirtyoneOne < Grader::Solution::Base
  def analyze_output
    verify_array_size
    verify_0_0_element
    verify_0_4_element
    verify_5_0_element
    verify_6_6_element
    verify_3_3_element
  end
  
  private

  def verify_array_size
    input = <<-END_OF_INPUT
3
3
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
    
    if output.scan(/Please enter value for/).size == 9
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -10
    end
  end
  
  def verify_0_0_element
    input = <<-END_OF_INPUT
4
4
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
    
    if /\[0\]\[0\]: 16/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -10
    end
  end
  
  def verify_0_4_element
    input = <<-END_OF_INPUT
5
5
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
    
    if /\[0\]\[4\]: 21/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -10
    end
  end
  
  def verify_5_0_element
    input = <<-END_OF_INPUT
6
6
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
    
    if /\[5\]\[0\]: 6/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -10
    end
  end
  
  def verify_6_6_element
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
    
    if /\[6\]\[6\]: 1/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -10
    end
  end
  
  def verify_3_3_element
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
    
    if /\[3\]\[3\]: 25/.match output
      # great
    else
      report_standard_error_message(input, output)
      report.update_score_by -10
    end
  end
end