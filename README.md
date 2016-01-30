# thunder-fastNiao
一个原生 OpenWrt 环境下的纯 ash 脚本实现的迅雷快鸟客户端。

根据 https://github.com/fffonion/Xunlei-FastDick 的项目重写。

适用条件：

1，迅雷快鸟的付费会员（没付费的就别想了，这只是个客户端不负责帮你们黑出付费会员的加速权限）。

2，有一个 OpenWrt 路由器，上面得装上 openssl-util，curl(带ssl)，这是 2 个必要的依赖。

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
    
使用方法：


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
 
    cat /tmp/thunder_fastdick/thunder_fastdick_log 
  
7，获取脚本运行时的pid：

    ps | grep fastdick

8，手动杀死脚本进程:

    kill 你ps时找到的pid
    kill 一个可能存在的 sleep 进程的pid


TODO:

增加返回值错误处理。

优化 log

Luci界面


