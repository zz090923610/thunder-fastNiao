#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=thunder-fastdick
PKG_VERSION:=2.0
PKG_RELEASE:=2
PKG_MAINTAINER:=Jeroen Louwes <jeroen.louwes@gmail.com>
PKG_LICENSE:=GPLv2

include $(INCLUDE_DIR)/package.mk

define Package/thunder-fastdick
   SECTION:=thunder
   CATEGORY:=thunder
   DEPENDS:=+jq +openssl-util +curl
   TITLE:=Xunlei Kuainiao OpenWrt Client
   MAINTAINER:=
   PKGARCH:=all
endef

define Package/thunder-fastdick/description
Hotplug script which makes configuration of multiple WAN interfaces simple
and manageable. With loadbalancing/failover support for up to 250 wan
interfaces, connection tracking and an easy to manage traffic ruleset.
endef

define Package/thunder-fastdick/conffiles
/etc/config/fastdick
endef

define Build/Compile
endef

define Package/thunder-fastdick/install
$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,thunder-fastdick))
