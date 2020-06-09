local cjson    = require("cjson")
local resolver = require("resty.dns.resolver")

local r, err = resolver:new{ nameservers = { "8.8.8.8" } }

if not r then
  ngx.say("failed to instantiate resolver: ", err)
  return
end

local ans, err = r:tcp_query("www.google.com", { qtype = r.TYPE_A })
if not ans then
  ngx.say("failed to query: ", err)
  return
end

ngx.say("records: ", cjson.encode(ans))
