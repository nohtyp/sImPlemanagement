module Networks
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
end

  
