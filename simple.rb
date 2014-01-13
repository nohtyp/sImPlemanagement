!#/usr/bin/env ruby

class Network

end

class IP < Network

  def initialize(myip, mymask) 
      @myip   = myip
      @mymask = mymask
  end
  
  def convert_to_bin 
      
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
    
  end
  
  def networks
    
      define_network = @mybinary.rindex('1')
      mynet = (define_network + 1) % 8
  
      mynetworks =  mynet == 0 ? 8 : mynet
      #puts mynetworks
      output_networks = 2 ** (8 - mynetworks)
      available_networks = output_networks == 1 ? 1 : (256 / output_networks)
  
  
      #puts output_networks
      print "You have #{available_networks} networks available"
  
      #Add check for if available_networks is 1 and if so this is a specific ip address
  
      #for i in (0..256)
      #    print i % output_networks == 0 ? "Mynetworks #{i} \n" : nil
      #end

   end



  def hosts

    define_hosts = @mybinary.scan('0').length
    myhosts = (2 ** define_hosts) - 2 < 1 ? 1 : (2 ** define_hosts) - 2
    
    #puts myhosts
    print "You have #{myhosts} valid ip's"
  
  end


end


foster = IP.new('192.168.1.1', 22)
puts foster.convert_to_bin
puts foster.networks
puts foster.hosts
