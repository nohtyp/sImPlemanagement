#!/usr/bin/env ruby

class Network
end
class IP < Network
  def initialize(myip, network)
    @myip   = myip.split('.')
    @mymask = network
  end

  def subnet
    if @mymask.include?('.')
      "Test1"
    else
      "Test2"
    end

  end


  def networks
  end

  def hosts
    define_hosts = 32 - @mymask.to_i
    (2**define_hosts) - 2 < 1 ? 1 : (2**define_hosts) - 2
  end
end

foster = IP.new('192.168.23.192', '255.255.255.128')
#puts "There are #{foster.networks} networks"
puts "There are #{foster.subnet} networks"
puts "There are #{foster.hosts} hosts on each network"
