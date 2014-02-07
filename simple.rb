#!/usr/bin/env ruby

class Network

end

class IP < Network

  def subnet_to_bin
      
     if (@mymask < 8) || (@mymask > 32)
        puts "Invalid subnet range #{@mymask}."
        exit
    end

    groupofbits = @mymask / 8
    numberofones = groupofbits * 8 + (@mymask % 8)
    zerosleft = 32 - numberofones
    
    #print "Groups of 8 bits #{groupofbits}, How many number of ones #{numberofones}, My zero's left #{zerosleft}"
    #puts
            
    @mybinary = '1' * numberofones + '0' * zerosleft
    #return
    
  end
  
  def networks
    
      define_network = @mybinary.rindex('1')
      mynet = (define_network + 1) % 8
  
      mynetworks =  mynet == 0 ? 8 : mynet
      output_networks = 2 ** (8 - mynetworks)
      available_networks = output_networks == 1 ? 1 : (256 / output_networks)
  
      print "You have #{available_networks} networks available"
  
   end

  def hosts

    define_hosts = @mybinary.scan('0').length
    myhosts = (2 ** define_hosts) - 2 < 1 ? 1 : (2 ** define_hosts) - 2
    
    #puts myhosts
    print "You have #{myhosts} valid ip's"
  
  end

  def initialize(myip, network)

           @myip   = myip.split('.')
           @mymask = network.to_i

  end

  def ip_to_bin
 
      convert_ip = @myip


     @myconvip = Array.new 
     convert_ip.each do |mynum|
    
       @myconvip.push(convert_to_bin(mynum.to_i))
        
     end

    puts @myconvip.join('.')

  end

  def convert_to_bin(cNUM)
  
       convert = cNUM.to_s(2)
         if convert.length != 8
            leftbits = 8 - convert.length
           return newconvert =  '0' * leftbits + convert
        else
           return convert
        end
  end


end


foster = IP.new('192.168.23.192', '24')
#puts foster.subnet_to_bin
#puts foster.networks -----> broken
#puts foster.hosts -----> broken
print foster.ip_to_bin
