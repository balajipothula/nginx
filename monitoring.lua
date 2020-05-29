local resty = require("resty.redis")
local redis = resty:new()

local ok, err = redis:connect("127.0.0.1", 6379)
if ok then
  local ms = string.gsub(ngx.var.msec, "%.", "")
  redis:hmset(ms, { request_id=ngx.var.request_id, remote_addr = ngx.var.remote_addr, remote_port = ngx.var.remote_port })
  ngx.say(ms)
end
