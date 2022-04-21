#!/usr/bin/ruby
puts "what should we call this project?"
project_name = gets.chomp
puts "thanks, I'll create your files now"

#create project folders
system "mkdir #{project_name}"
system "mkdir ./#{project_name}/lib ./#{project_name}/spec"

#create project files
system "touch ./#{project_name}/lib/#{project_name}.rb"
system "touch ./#{project_name}/spec/#{project_name}_spec.rb"
system "touch ./#{project_name}/Gemfile"
system "touch ./#{project_name}/README.md"

#append Gemfile with required gems (rspec, pry)
system "echo 'source \"https://rubygems.org\"' >> ./#{project_name}/Gemfile"
system "echo 'gem \"rspec\"' >> ./#{project_name}/Gemfile"
system "echo 'gem \"pry\"'  >> ./#{project_name}/Gemfile"

#append main project file with requirments for pry gem
system "echo 'require(\"pry\")'  >> ./#{project_name}/lib/#{project_name}.rb"

#append test file with requirments for rspec and main project file
system "echo 'require(\"rspec\")' >> ./#{project_name}/spec/#{project_name}_spec.rb"
system "echo 'require(\"#{project_name}\")' >> ./#{project_name}/spec/#{project_name}_spec.rb"

#bundle install
system "( cd ./#{project_name} && bundle install )"

puts "file structure complete"