class Grader::Solution::ThirtyoneTwo < Grader::Solution::Base
  def analyze_output
    @input_file_url = "https://raw.githubusercontent.com/zhaol/ee160/gh-pages/code/2d_arrays/31_2_input.txt"
    verify_image_is_boldened
  end
  
  private

  def verify_image_is_boldened
    run
    
    boldened_image = <<-END_OF_INPUT
OOOOOOOOOOOOOOO
OOXXXOOOOOXXXOO
OOXXXOOOOOXXXOO
OOXXXOOOOOXXXOO
OOOOOOXXXOOOOOO
OOOOOOXXXOOOOOO
OOOOOOXXXOOOOOO
OXXXOOOOOOOXXXO
OXXXXXXXXXXXXXO
OXXXXXXXXXXXXXO
OOXXXXXXXXXXXOO
OOOOOOOOOOOOOOO
    END_OF_INPUT

puts output
    
    if /#{boldened_image}/.match output
      # great
    else
      report.write "The outputed images is not boldened"
      report.update_score_by -50
    end
  end
  
end