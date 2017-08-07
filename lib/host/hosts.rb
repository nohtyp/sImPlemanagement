module Hosts
  def hosts
      define_hosts = 32 - @mymask.to_i
      myhosts = (2 ** define_hosts) - 2 < 1 ? 1 : (2 ** define_hosts) - 2
   end
end
