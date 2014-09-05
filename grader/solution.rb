class Grader::Solution
end

class Grader::Solution::Base
  def self.check_output
    puts "no output to check for this assignment"
  end
  
  def self.check_syntax
    puts "no syntax to check for this assignment"
  end
end

Dir.glob(File.join(__dir__ + '/solutions', "**", "*.rb")).each do |file|
  require file
end