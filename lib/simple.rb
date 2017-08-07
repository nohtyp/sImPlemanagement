require_relative 'host/hosts'
require_relative 'network/networks'

class IP
    include Networks
    include Hosts
    def initialize(myip, network)
      @myip   = myip.split('.')
      @mymask = network
    end
end
