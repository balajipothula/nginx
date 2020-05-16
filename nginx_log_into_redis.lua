local con     = require("resty.redis")
local redis   = con:new()
local ok, err = redis:connect("127.0.0.1", 6379)

if ok then

  local ms = string.gsub(ngx.var.msec, "%.", "")
  
  redis:hmset( ms, { ancient_browser = ngx.var.ancient_browser, arg_ = ngx.var.arg_, args = ngx.var.args } )

  redis:hmset( ms, { binary_remote_addr = ngx.var.binary_remote_addr, body_bytes_sent = ngx.var.body_bytes_sent, bytes_received = ngx.var.bytes_received, bytes_sent = ngx.var.bytes_sent } )

  redis:hmset( ms, { connection = ngx.var.connection, connection_requests = ngx.var.connection_requests, connections_active = ngx.var.connections_active, connections_reading = ngx.var.connections_reading, connections_waiting = ngx.var.connections_waiting, connections_writing = ngx.var.connections_writing, content_length = ngx.var.content_length, content_type = ngx.var.content_type, cookie_ = ngx.var.cookie_ } )

  redis:hmset( ms, { date_gmt = ngx.var.date_gmt, date_local = ngx.var.date_local, document_root = ngx.var.document_root, document_uri = ngx.var.document_uri } )

  redis:hmset( ms, { fastcgi_path_info = ngx.var.fastcgi_path_info, fastcgi_script_name = ngx.var.fastcgi_script_name } )

  redis:hmset( ms, { geoip_area_code = ngx.var.geoip_area_code, geoip_city = ngx.var.geoip_city, geoip_city_continent_code = ngx.var.geoip_city_continent_code, geoip_city_country_code = ngx.var.geoip_city_country_code, geoip_city_country_code3 = ngx.var.geoip_city_country_code3, geoip_city_country_name = ngx.var.geoip_city_country_name, geoip_country_code = ngx.var.geoip_country_code, geoip_country_code3 = ngx.var.geoip_country_code3, geoip_country_name = ngx.var.geoip_country_name, geoip_dma_code = ngx.var.geoip_dma_code, geoip_latitude = ngx.var.geoip_latitude, geoip_longitude = ngx.var.geoip_longitude, geoip_org = ngx.var.geoip_org, geoip_postal_code = ngx.var.geoip_postal_code, geoip_region = ngx.var.geoip_region, geoip_region_name = ngx.var.geoip_region_name, gzip_ratio = ngx.var.gzip_ratio } )

  redis:hmset( ms, { host = ngx.var.host, hostname = ngx.var.hostname, http_ = ngx.var.http_, http2 = ngx.var.http2, https = ngx.var.https } )

  redis:hmset( ms, { invalid_referer = ngx.var.invalid_referer, is_args = ngx.var.is_args } )

  redis:hmset( ms, { jwt_claim_ = ngx.var.jwt_claim_, jwt_header_ = ngx.var.jwt_header_ } )

  redis:hmset( ms, { limit_conn_status = ngx.var.limit_conn_status, limit_rate = ngx.var.limit_rate, limit_req_status = ngx.var.limit_req_status } )

  redis:hmset( ms, { memcached_key = ngx.var.memcached_key, modern_browser = ngx.var.modern_browser, msec = ngx.var.msec, msie = ngx.var.msie } )

  redis:hmset( ms, { nginx_version = ngx.var.nginx_version } )

  redis:hmset( ms, { pid = ngx.var.pid, pipe = ngx.var.pipe, protocol = ngx.var.protocol, proxy_add_x_forwarded_for = ngx.var.proxy_add_x_forwarded_for, proxy_host = ngx.var.proxy_host, proxy_port = ngx.var.proxy_port, proxy_protocol_addr = ngx.var.proxy_protocol_addr, proxy_protocol_port = ngx.var.proxy_protocol_port, proxy_protocol_server_addr = ngx.var.proxy_protocol_server_addr, proxy_protocol_server_port = ngx.var.proxy_protocol_server_port } )

  redis:hmset( ms, { scheme = ngx.var.scheme, secure_link = ngx.var.secure_link, secure_link_expires = ngx.var.secure_link_expires, sent_http_ = ngx.var.sent_http_, sent_trailer_ = ngx.var.sent_trailer_, server_addr = ngx.var.server_addr, server_name = ngx.var.server_name, server_port = ngx.var.server_port, server_protocol = ngx.var.server_protocol, session_log_binary_id = ngx.var.session_log_binary_id, session_log_id = ngx.var.session_log_id, session_time = ngx.var.session_time, slice_range = ngx.var.slice_range, spdy = ngx.var.spdy, spdy_request_priority = ngx.var.spdy_request_priority, ssl_cipher = ngx.var.ssl_cipher, ssl_ciphers = ngx.var.ssl_ciphers, ssl_client_cert = ngx.var.ssl_client_cert, ssl_client_escaped_cert = ngx.var.ssl_client_escaped_cert, ssl_client_fingerprint = ngx.var.ssl_client_fingerprint, ssl_client_i_dn = ngx.var.ssl_client_i_dn, ssl_client_i_dn_legacy = ngx.var.ssl_client_i_dn_legacy, ssl_client_raw_cert = ngx.var.ssl_client_raw_cert, ssl_client_s_dn = ngx.var.ssl_client_s_dn, ssl_client_s_dn_legacy = ngx.var.ssl_client_s_dn_legacy, ssl_client_serial = ngx.var.ssl_client_serial, ssl_client_v_end = ngx.var.ssl_client_v_end, ssl_client_v_remain = ngx.var.ssl_client_v_remain, ssl_client_v_start = ngx.var.ssl_client_v_start, ssl_client_verify = ngx.var.ssl_client_verify, ssl_curves = ngx.var.ssl_curves, ssl_early_data = ngx.var.ssl_early_data, ssl_preread_alpn_protocols = ngx.var.ssl_preread_alpn_protocols, ssl_preread_protocol = ngx.var.ssl_preread_protocol, ssl_preread_server_name = ngx.var.ssl_preread_server_name, ssl_protocol = ngx.var.ssl_protocol, ssl_server_name = ngx.var.ssl_server_name, ssl_session_id = ngx.var.ssl_session_id, ssl_session_reused = ngx.var.ssl_session_reused, status = ngx.var.status } )

  redis:hmset( ms, { tcpinfo_rcv_space = ngx.var.tcpinfo_rcv_space, tcpinfo_rtt = ngx.var.tcpinfo_rtt, tcpinfo_rttvar = ngx.var.tcpinfo_rttvar, tcpinfo_snd_cwnd = ngx.var.tcpinfo_snd_cwnd, time_iso8601 = ngx.var.time_iso8601, time_local = ngx.var.time_local } )

  redis:hmset( ms, { uid_got = ngx.var.uid_got, uid_reset = ngx.var.uid_reset, uid_set = ngx.var.uid_set, upstream_addr = ngx.var.upstream_addr, upstream_bytes_received = ngx.var.upstream_bytes_received, upstream_bytes_sent = ngx.var.upstream_bytes_sent, upstream_cache_status = ngx.var.upstream_cache_status, upstream_connect_time = ngx.var.upstream_connect_time, upstream_cookie_ = ngx.var.upstream_cookie_, upstream_first_byte_time = ngx.var.upstream_first_byte_time, upstream_header_time = ngx.var.upstream_header_time, upstream_http_ = ngx.var.upstream_http_, upstream_queue_time = ngx.var.upstream_queue_time, upstream_response_length = ngx.var.upstream_response_length, upstream_response_time = ngx.var.upstream_response_time, upstream_session_time = ngx.var.upstream_session_time, upstream_status = ngx.var.upstream_status, upstream_trailer_ = ngx.var.upstream_trailer_, uri = ngx.var.uri } )

  ngx.say(ms)

end
