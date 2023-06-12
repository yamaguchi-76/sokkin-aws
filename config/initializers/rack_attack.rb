class Rack::Attack
    OFFICE_IP_ADDRESS = '121.2.78.206'
    YAMAGUCHI1 = '153.124.182.209'
    YAMAGUCHI2 = '117.102.207.199'
    MyIP = "192.168.1.6";
  blocklist('only allow from office') do |req|
    #req.path.match(%r{^/admins}) && ((OFFICE_IP_ADDRESS != req.ip) || (E_IP_ADDRESS != req.ip))
    req.path.match(%r{^/admins/sign_in}) && (OFFICE_IP_ADDRESS != req.ip) && (YAMAGUCHI1 != req.ip) && (YAMAGUCHI2 != req.ip) 
  end
end