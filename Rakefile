require "bundler/gem_tasks"
require "rspec/core/rake_task"
require_relative './config/environment'
require 'pry'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

puts "Welcome to the place to learn about Presidential Candidates"

def reload!
    load '../lib/presidential_candidates'
    load '../lib/transfer'
end

desc "A console"
task :console do
    Pry.start
end