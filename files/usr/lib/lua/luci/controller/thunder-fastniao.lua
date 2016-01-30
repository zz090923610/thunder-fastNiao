module("luci.controller.thunder-fastniao", package.seeall)

function index()
     require("luci.i18n")
     luci.i18n.loadc("setting")
    local fs = luci.fs or nixio.fs
    if not fs.access("/etc/config/fastdick") then
		return
	end
	
	
	local page = entry({"admin", "network", "thunder-fastniao"}, cbi("thunder-fastniao"), "thunder-fastniao")
	page.i18n = "thunder-fastniao"
	page.dependent = true

end
