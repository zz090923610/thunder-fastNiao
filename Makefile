#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# Writen by zz090923610
# Not for any kind of commercial use.

include $(TOPDIR)/rules.mk

PKG_NAME:=thunder-fastdick
PKG_VERSION:=1.0
PKG_RELEASE:=0
PKG_MAINTAINER:=Zhao Zhang <zhao.zhang.glacier@gmail.com>
PKG_LICENSE:=GPLv2

include $(INCLUDE_DIR)/package.mk

define Package/thunder-fastdick
   SECTION:=thunder
   CATEGORY:=thunder
   DEPENDS:=+openssl-util +curl
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

	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_BIN) ./files/etc/hotplug.d/iface/* $(1)/etc/hotplug.d/iface/

endef


$(eval $(call BuildPackage,thunder-fastdick))
