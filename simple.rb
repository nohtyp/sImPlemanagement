!#/usr/bin/env ruby

class Network

end

class IP < Network

  def subnet_to_bin(mymask)
      
     if (mymask < 8) || (mymask > 32)
        puts "Invalid subnet range #{mymask}."
        exit
    end

    groupofbits = mymask / 8
    numberofones = groupofbits * 8 + (mymask % 8)
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


end


foster = IP.new
puts foster.subnet_to_bin()
#puts foster.networks
#puts foster.hosts
