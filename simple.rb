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

  def verify_single_ip(myip)

   aIP = myip.split(/\D/)
   
   if aIP.length >= 4 && aIP.length <= 5
       @mymask = aIP[4].to_i
       @myip   = aIP[0..3]
       return
   else
       puts "You didin't provided a valid ip"
   end

  end

  def ip_to_bin
      
   convert_ip = @myip
    
  end
     


end


foster = IP.new
number = ARGV[0]
print foster.verify_single_ip(number)
puts foster.subnet_to_bin
print foster.ip_to_bin
#puts foster.networks
#puts foster.hosts
