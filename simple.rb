!#/usr/bin/env ruby
#'1' * 8 + '.' + '1' * 8 + '.' + '1' * 7 + '0' + '.' + '0' * 8

def convert_to_bin(num)
    
    if (num < 8) || (num > 32)
        puts "Invalid subnet range #{num}."
        exit
    end

    groupofbits = num / 8
    numberofones = groupofbits * 8 + (num % 8)
    zerosleft = 32 - numberofones
    
    print "Groups of bits #{groupofbits}, How many number of ones #{numberofones}, My zero's left #{zerosleft}"
    puts
    
    mybinary = '1' * numberofones + '0' * zerosleft
    return mybinary
    
end


def networks_hosts(network)
    
    define_network = network.rindex('1')
    define_hosts = network.scan('0').length
    mynet = (define_network + 1) % 8
    myhosts = (2 ** define_hosts) - 2
    
    mynetworks =  mynet == 0 ? 8 : mynet 
    puts mynetworks
    puts define_hosts
    output_networks = 2 ** (8 - mynetworks)
    available_networks = output_networks == 1 ? 1 : (256 / output_networks) 
    

    puts output_networks
    puts "You have #{available_networks} networks available with a total of #{myhosts} valid ip's"
    
    #Add check for if available_networks is 1 and if so this is a specific ip address

    #for i in (0..256)
    #    print i % output_networks == 0 ? "Mynetworks #{i} \n" : nil
    #end
   
end


print "Subnet: "
mysubnet = gets.chomp


networks_hosts(convert_to_bin(mysubnet.to_i))
