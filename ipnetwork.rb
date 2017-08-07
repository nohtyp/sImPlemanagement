require_relative 'lib/simple'

foster = IP.new('192.168.23.192', '30')
puts "There are #{foster.networks} networks"
puts "There are #{foster.hosts} hosts on each network"
