7月11日说明：
大家好，非常抱歉，我这个版本现在应该已经不能用了，因为迅雷搞了好多变化。最近出国，两年内目测是没时间弄了，所以最近也跟fffonion大大发了邮件，看看能不能把我的版本和大大的版本取精华合起来。当然如果大家需要自行搞的话可以继续按照https://github.com/fffonion/Xunlei-Fastdick 的python的四月份及以后的更新来，还有我这用到的thunder.key需要重新生成一下，根据新的rsa的n和e。。大概需要改的是登陆的函数，可能还有比如发送心跳的那几个api，理论上架构不需要做大的变化。。当然，openwrt上需要另外安装一个提供sha1sum命令的包。。。


# thunder-fastNiao
一个原生 OpenWrt 环境下的纯 ash 脚本实现的迅雷快鸟客户端。

根据 https://github.com/fffonion/Xunlei-FastDick 的项目重写。
 
适用条件：

1，迅雷快鸟的付费会员（没付费的就别想了，这只是个客户端不负责帮你们黑出付费会员的加速权限）。

2，有一个 OpenWrt 路由器，上面得装上 openssl-util，curl(带ssl)，这是 2 个必要的依赖。

直接依赖软件包: openssl-util, curl

间接依赖软件包（被openssl-util和curl依赖）: libcurl, libpolarssl; libopenssl, zlib

如何获取并安装这六个软件包：

1，请根据OpenWrt的官方教程学习如何安装软件包https://wiki.openwrt.org/doc/packages#install_packagesusage_of_opkg

2，这六个软件包首先可以自行编译。

3，因为这六个软件包都已经加入官方的package feeds，所以如果不想编译，OpenWrt官方提供每个版本的预编译好的官方源包含的软件包可供下载。下载地址http://downloads.openwrt.org/ 你需要选择与自己路由器所装OpenWrt版本匹配的、与你路由器硬件方案匹配的预编译好的软件包下载。


直接安装方法：

克隆本项目到本地，将 thunder-fastdick_0.5-0_all.ipk 上传路由器，使用opkg 安装。

编译安装方法：

1，获得适用于自己路由器的OpenWrt BUildroot或是SDK。

2，将本项目克隆到 Buildroot/SDK 的 package 目录下。

3，`make menuconfig`，从 thunder 子目录里选中这个 package。

4，编译并制成ipk安装包。如果你本地之前有过完整的固件编译，请用这个命令：

    make package/thunder-fastdick/{clean,compile} V=s
    
如果没有，需要从头编译的话，请用这个命令：

    make V=s
   
5，请自行解决编译中遇到的问题。

6，生成的 ipk 会在 bin 目录下，名字中包含 thunder 字样，请把它 `scp` 到你的路由器 `/tmp/` 路径下。

7，使用 ssh 连接到你的路由器，执行下面命令安装 ipk 包。

    opkg install /tmp/thunder-*.ipk
    
使用方法（luci）：

https://github.com/zz090923610/thunder-fastNiao/wiki/Manual-(LUCI)

日志返回结果简介及问题判断： https://github.com/zz090923610/thunder-fastNiao/wiki/Log-Message

使用方法（命令行）：


1，使用 uci 设置用户名密码信息。

    uci set fastdick.setting.name='你的用户名'
    uci set fastdick.setting.passwd='你的密码'
    uci commit fastdick
    
2，启用服务(启用但不开启)：
  
    uci set fastdick.setting.enabled=1
    uci commit fastdick

3，开启加速：

    /etc/init.d/fastdick start
  
4，停止加速:
  
    /etc/init.d/fastdick stop

5，禁用服务：
  
    uci set fastdick.setting.enabled=0
    uci commit fastdick
  
6，查看日志：
 
    logread | grep Thunder
  
7，获取脚本运行时的pid：

    ps | grep fastdick

8，手动杀死脚本进程:

    kill 你ps时找到的pid
    kill 一个可能存在的 sleep 进程的pid


TODO:

增加返回值错误处理。

优化 log

<del>Luci界面<del>


