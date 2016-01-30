#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=thunder-fastdick
PKG_VERSION:=0.5
PKG_RELEASE:=0
PKG_MAINTAINER:=Zhao Zhang <zhao.zhang.glacier@gmail.com>
PKG_LICENSE:=GPLv2

include $(INCLUDE_DIR)/package.mk

define Package/thunder-fastdick
   SECTION:=thunder
   CATEGORY:=thunder
   DEPENDS:=++openssl-util +curl
   TITLE:=Xunlei Kuainiao OpenWrt Client
   MAINTAINER:=
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
	$(INSTALL_BIN) ./files/usr/bin/fastdick $(1)/usr/bin/
	$(INSTALL_BIN) ./files/etc/init.d/fastdick $(1)/etc/init.d/
	$(INSTALL_CONF) ./files/etc/config/fastdick $(1)/etc/config/
	$(INSTALL_CONF) ./files/etc/thunder.key $(1)/etc/

endef
define Package/thunder-fastdick/postinst
#!/bin/sh
endef


$(eval $(call BuildPackage,thunder-fastdick))
