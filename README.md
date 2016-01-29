# thunder-fastNiao
一个原生 OpenWrt 环境下的纯 ash 脚本实现的迅雷快鸟客户端。
根据 https://github.com/fffonion/Xunlei-FastDick 的项目重写。

适用条件：

1，迅雷快鸟的付费会员（没付费的就别想了，这只是个客户端不负责帮你们黑出付费会员的加速权限）。
2，有一个 OpenWrt 路由器，上面得装上 openssl-util，curl(带ssl)，jq(怎么编译看这里)，这是三个必要的依赖。

使用方法：
1，获得适用于自己路由器的OpenWrt BUildroot或是SDK。
2，将本项目克隆到 Buildroot/SDK 的 package 目录下。
3，make menuconfig，从 thunder 子目录里选中这个 package。
4，编译并制成ipk安装包。如果你本地之前有过完整的固件编译，请用这个命令：

   make package/thunder-fastdick/{clean,compile} V=s
如果没有，需要从头编译的话，请用这个命令：

   make V=s
5，请自行解决编译中遇到的问题。
6，生成的 ipk 会在 bin 目录下，名字中包含 thunder 字样，请把它 `scp` 到你的路由器 `/tmp/` 路径下。
7，使用 ssh 连接到你的路由器，执行下面命令安装 ipk 包。

   opkg install /tmp/your_thunder_pkg.ipk
8，使用 uci 设置用户名密码信息。

   uci set fastdick.setting.name='你的用户名'
   uci set fastdick.setting.passwd='你的密码'
   uci commit fastdick
9，启用服务：
  
   /etc/init.d/fastdick enable

10，开启加速：

   /etc/init.d/fastdick start
  
10，停用加速:
  
    /etc/init.d/fastdick stop

11，停止服务：
  
   /etc/init.d/fastdick disable
  
12，查看日志：

   logread | grep thunder
或是:
    
    cat /tmp/thunder_fastdick_log
  
13，获取脚本运行时的pid：

    ps | grep thunder
或是：

    cat /var/state/fastdick
14，手动杀死脚本进程

    kill 你ps时找到的pid






