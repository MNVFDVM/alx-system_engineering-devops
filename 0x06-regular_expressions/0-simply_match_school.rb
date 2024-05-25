#!/usr/bin/env ruby

# Check if an argument is provided
if ARGV.empty?
	puts "Usage: #{$0} <string>"
	exit 1
end

regex = /School/
input = ARGV[0]

# Ensure input is a string before scanning
if input.is_a?(String)
	matches = input.scan(regex)
	puts matches.join
else
	puts "Error: Input is not a valid string."
end
