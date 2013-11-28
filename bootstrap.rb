!# /usr/bin/env ruby

# Usage: curl https://ee160-c9-zhaol.c9.io/code/bootstrap.rb | ruby
puts "bootstrapping your workspace for EE160 (this might take awhile)..."
puts "installing dependencies..."
`gem install twitter -v 5.0.0.rc.1`
`gem install wavefile`
puts "setting up your scripts"
Dir.chdir do
  `touch hi.bye`
  `git clone https://github.com/zhaol/ee160_scripts.git`
end
puts "your workspace is now bootstrapped...have a wonderful semester"