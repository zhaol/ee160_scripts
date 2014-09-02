class Grader::Solutions
end

class Grader::Solutions::Base
  Dir.glob(File.join("./grader", "**", "*.rb")).each do |file|
    require file
  end
  
  def self.check_output
    puts "no output to check"
  end
  
  def self.check_syntax
    puts "no syntax to check"
  end
end