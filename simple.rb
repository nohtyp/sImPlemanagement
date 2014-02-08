#!/usr/bin/env ruby

class Network

end

class IP < Network

   def initialize(myip, network)

           @myip   = myip.split('.')
           @mymask = network
   end
  

   def networks 
      
         if (@mymask.to_i < 8) || (@mymask.to_i > 32) || (@mymask.split(/\D/).length > 1)
            puts "Invalid subnet range #{@mymask}."
            exit
         end

        groupofbits = @mymask.to_i / 8
        numberofones = groupofbits * 8 + (@mymask.to_i % 8)
        zerosleft = 32 - numberofones
    
        @mybinary = '1' * numberofones + '0' * zerosleft
    
        define_network = @mybinary.rindex('1')
        mynet = (define_network + 1) % 8
  
        mynetworks =  mynet == 0 ? 8 : mynet
        output_networks = 2 ** (8 - mynetworks)
        available_networks = output_networks == 1 ? 1 : (256 / output_networks)
  
   end

   def hosts

        define_hosts = 32 - @mymask.to_i
        myhosts = (2 ** define_hosts) - 2 < 1 ? 1 : (2 ** define_hosts) - 2
  
   end


end


foster = IP.new('192.168.23.192', '22')
puts "There are #{foster.networks} networks"
puts "There are #{foster.hosts} hosts on each network"
