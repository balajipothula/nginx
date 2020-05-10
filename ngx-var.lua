ngx.say(ngx.config.nginx_version)
ngx.say(ngx.config.ngx_lua_version)

ngx.say(ngx.localtime())
ngx.say(ngx.utctime())

ngx.say(ngx.today())


ngx.say(ngx.req.http_version())



local h, err = ngx.resp.get_headers()

if "truncated" == err then ngx.say("error") end

for k, v in pairs(h) do ngx.say(k) end
