local cjson    = require("cjson")
local resolver = require("resty.dns.resolver")

local r, err = resolver:new{ nameservers = { "8.8.8.8", { "8.8.4.4", 53 }, "1.1.1.1" }, retrans = 5, timeout = 2000, no_recurse = false }

if not r then
  ngx.say("failed to instantiate resolver: ", err)
  return
end

local ans, err = r:tcp_query("blitzsystems.in", { qtype = r.TYPE_TXT })
if not ans then
  ngx.say("failed to query: ", err)
  return
end

ngx.say("records: ", cjson.encode(ans))
