#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# Writen by zz090923610
# Not for any kind of commercial use.

include $(TOPDIR)/rules.mk

PKG_NAME:=thunder-fastdick
PKG_VERSION:=0.6
PKG_RELEASE:=0
PKG_MAINTAINER:=Zhao Zhang <zhao.zhang.glacier@gmail.com>
PKG_LICENSE:=GPLv2

include $(INCLUDE_DIR)/package.mk

define Package/thunder-fastdick
   SECTION:=thunder
   CATEGORY:=thunder
   DEPENDS:=++openssl-util +curl
   TITLE:=Xunlei Kuainiao OpenWrt Client
   MAINTAINER:=Zhao Zhang <zhao.zhang.glacier@gmail.com>
   PKGARCH:=all
endef

define Package/thunder-fastdick/description
	Speed up all day long
endef

define Package/thunder-fastdick/conffiles
/etc/config/fastdick
endef

define Build/Compile
endef

define Package/thunder-fastdick/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/usr/bin/* $(1)/usr/bin/
	$(INSTALL_BIN) ./files/etc/init.d/fastdick $(1)/etc/init.d/
	$(INSTALL_CONF) ./files/etc/config/fastdick $(1)/etc/config/
	$(INSTALL_CONF) ./files/etc/thunder.key $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_CONF) ./files/usr/lib/lua/luci/controller/thunder-fastniao.lua $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_CONF) ./files/usr/lib/lua/luci/model/cbi/thunder-fastniao.lua $(1)/usr/lib/lua/luci/model/cbi/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_CONF) ./files/usr/lib/lua/luci/i18n/thunder-fastniao.zh-cn.lmo $(1)/usr/lib/lua/luci/i18n/
endef
define Package/thunder-fastdick/preinst
#!/bin/sh
cd /proc
	for pid in [0-9]*
	do
		if grep "Name:	fastdick" $pid/status &>/dev/null
			then
			if [ "$pid" -eq "$$" ]
				then
				continue
			fi
			echo "Stop service fastdick $pid"
			kill "$pid"
			for cpid in [0-9]*
			do
				if grep "PPid:	$pid" $cpid/status &>/dev/null
				then
				    echo "Stop child process $cpid"
				    name=`cat $cpid/status | grep "Name:" | sed 's/Name://' | tr -d ' \n\t'`
				    if [ "$name" = "sleep" ]
				    then
					    kill $cpid
				    fi
				fi
			done	
		fi
	done
endef

define Package/thunder-fastdick/postinst
#!/bin/sh
rm -rf /luci-modulecache
rm -f luci-indexcache
endef
define Package/thunder-fastdick/postrm
#!/bin/sh
cd /proc
	for pid in [0-9]*
	do
		if grep "Name:	fastdick" $pid/status &>/dev/null
			then
			if [ "$pid" -eq "$$" ]
				then
				continue
			fi
			echo "Stop service fastdick $pid"
			kill "$pid"
			for cpid in [0-9]*
			do
				if grep "PPid:	$pid" $cpid/status &>/dev/null
				then
				    echo "Stop child process $cpid"
				    name=`cat $cpid/status | grep "Name:" | sed 's/Name://' | tr -d ' \n\t'`
				    if [ "$name" = "sleep" ]
				    then
					    kill $cpid
				    fi
				fi
			done	
		fi
	done
rm -rf /luci-modulecache
rm -f luci-indexcache
endef

$(eval $(call BuildPackage,thunder-fastdick))
