!#/usr/bin/env ruby
#'1' * 8 + '.' + '1' * 8 + '.' + '1' * 7 + '0' + '.' + '0' * 8

def convert_to_bin(num)

    groupofbits = num / 8
    numberofones = groupofbits * 8 + (num % 8)
    zerosleft = 32 - numberofones
    
    print "Groups of bits #{groupofbits}, How many number of ones #{numberofones}, My zero's left #{zerosleft}"
    puts
    
    mybinary = '1' * numberofones + '0' * zerosleft
    return mybinary
    
end


def find_my_networks(network)
    
    define_network = network.rindex('1')
    mynet = (define_network + 1) % 8
    
    mynetworks =  mynet == 0 ? 8 : mynet 
    puts mynetworks
    output_networks = 2 ** (8 - mynetworks)
    available_networks = output_networks == 1 ? 1 : (256 / output_networks) 
    
    puts output_networks
    puts "You have #{available_networks} networks available"
    
    #Add check for if available_networks is 1 and if so this is a specific ip address

    for i in (0..256)
        print i % available_networks == 0 ? "Mynetworks #{i} \n" : nil
    end
   
    
    
    
end


print "Subnet: "
mysubnet = gets.chomp


find_my_networks(convert_to_bin(mysubnet.to_i))
