class Grader::Solution::ThirtyoneTwo < Grader::Solution::Base
  def analyze_output
    @input_file_url = "https://raw.githubusercontent.com/zhaol/ee160/gh-pages/code/2d_arrays/test/31_2.input"
    verify_image_is_boldened
  end
  
  private

  def verify_image_is_boldened
    run
    
    boldened_image = <<-END_OF_INPUT
XXXOOOOOOOOOOOO
XXXXXOOOOOXXXOO
XXXXXOOOOOXXXOO
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
      report.write "The program successfully boldened the image"
    else
      report.write "The outputed images was not boldened"
      report.update_score_by9-50
    end
  end
  
end