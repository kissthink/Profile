#说明
一些乱七八糟的配置文件，都是个人使用的，不过为了今后方便自己多系统使用和今后的迁移，写了一些一键安装配置和依赖的脚本。如果你要使用这些配置，对在你的机器上引发的一切不良后果例如蓝屏和发射核导弹概不负责～

#安装
其中的`install.sh` 用于整体的安装，每个子目录下的`check_dependence.sh` 用于检查所必须的运行环境是否满足，`install.sh` 用于单独安装配置文件并备份旧的配置文件，`install_dependence.sh` 用于安装配置依赖的运行环境。

如果看了这些你仍然不知道该怎么做，请执行下面的指令同时安装配置文件和所依赖的运行环境

    git clone https://github.com/iSpeller/Profile.git ~/Profile
    cd ~/Profile
    ./install.sh -c -i -d

然后祈祷吧！

#注意
1. 配置文件的安装使用了ln 创建软链接，所以一定不要删除git clone 生成的目录（默认是~/Profile）！

2. 虽然YCM 的作者反对使用系统clang，但是使用YCM 自带的install.sh 脚本下载的libclang.so 似乎会导致YCMServer 崩溃，使用系统libclang.so 可以避免这个问题，请尽量在系统中预先安装llvm/clang 以提供YCM 使用的libclang.so。不同发行版中libclang.so 所在的包名不一定相同，例如Archlinux 下是clang 包，Slackware 下是llvm 包，Debian 下则是libclang-dev 包。

3. YCM 在cmake 的过程中用到python-config，不同发行版中python-config 所在包不一定相同，例如Archlinux 和Slackware 下是python 包，Debian 下则是python-dev 包。

