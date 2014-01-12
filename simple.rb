#!/usr/bin/env ruby

mybits = 8

print "subnet: "
test = gets.chomp

if test.to_i % 8 == 0
  puts "even"
  groups = test.to_i / 8
  1.upto(3) do 
        
        print '1' * mybits.to_i 
  end
else
  puts "odd"
  puts test.to_i / 8
  puts test.to_i % 8
end
