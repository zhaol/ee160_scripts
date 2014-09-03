!# /usr/bin/env ruby

puts "bootstrapping your workspace for EE160 (this might take awhile)..."

puts "setting up your directories (i.e. folders)"
  `git clone https://github.com/zhaol/ee160_scaffold.git ee160`

puts "installing dependencies..."
  `gem install twitter -v 5.11.0`
  `gem install wavefile -v 0.6.0`
  `gem install thor -v 0.19.1`
  `gem install activesupport -v 4.1.5`
  `gem install numbers_in_words -v 0.2.0`
  `gem install numbers_and_words -v 0.10.0`

puts "setting up your scripts"
Dir.chdir do
  `git clone https://github.com/zhaol/ee160_scripts.git`
end

puts "your workspace is now bootstrapped...have a wonderful semester"
