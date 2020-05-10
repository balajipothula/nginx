local resty = require("resty.redis")
local redis = resty:new()

local ok, err = redis:connect("127.0.0.1", 6379)
if ok then
  local ms = string.gsub(ngx.var.msec, "%.", "")
  redis:hmset(ms, { request_id=ngx.var.request_id, remote_addr = ngx.var.remote_addr, remote_port = ngx.var.remote_port })
  ngx.say(ms)
end

--------

local connection = require "resty.redis"
local redis = connection:new()

redis:set_timeouts(1000, 1000, 1000) -- 1 sec

local ok, err = redis:connect("127.0.0.1", 6379)
if not ok then
  ngx.say("failed to connect: ", err)
  return
end

local ms = string.gsub(ngx.var.msec, "%.", "")
redis:hmset(ms, {remote_user=ngx.var.remote_user, remote_addr=ngx.var.remote_addr})


-- local res, err = redis:hmget("myhash", "remote_user", "remote_addr")

local ok, err = redis:set("dog", "an animal")
if not ok then
  ngx.say("failed to set dog: ", err)
  return
end

ngx.say("set result: ", ok)

local res, err = redis:get("dog")
if not res then
  ngx.say("failed to get dog: ", err)
  return
end

if res == ngx.null then
  ngx.say("dog not found.")
  return
end

ngx.say("dog: ", res)
