require("luci.sys")
require("luci.sys.zoneinfo")
require("luci.config")
local fs = require "nixio.fs"
local ut = require "luci.util"

local sys = require "luci.sys"

m = Map("fastdick", translate("Thunder FastNiao OpenWrt","Thunder FastNiao OpenWrt"),
                translate("Powered by zz090923610, not for commercial use.","Powered by zz090923610, not for commercial use."))

s = m:section(TypedSection, "entry", translate("Please Set before apply."))
s.addremove = false

enable_fastdick = s:option(ListValue, "enabled", translate("Enable or Not"))
enable_fastdick:value("1", translate("Enabled")) 
enable_fastdick:value("0",  translate("Disabled")) 
enable_fastdick.optional = false
enable_fastdick.rmempty = true
enable_fastdick.default="0"

username = s:option(Value, "name", translate("Thunder Username"))
username.datatype = "minlength(1)"
username.rmempty = false

password = s:option(Value, "passwd", translate("Thunder Password"))
password.password = true
password.datatype = "minlength(1)"
password.rmempty = false

startup = s:option(Flag, "startup", translate("Run when router startup"))
startup.default = true
startup.optional = false
startup.rmempty = true

local apply = luci.http.formvalue("cbi.apply")
if apply then
    io.popen("luci_fastdick_apply")
end

return m
