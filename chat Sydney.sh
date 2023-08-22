#!/bin/bash
echo -e "\e[32m  欢迎使用本脚本，确保开启代理，本脚本只用于zerotermux，请确保您的zerotermux未安装任何软件包，有问题加q群811759124，安装将在6秒后开始  \e[0m"  
sleep 6
echo -e "\e[32m  开始下载依赖  \e[0m"  
show_error_and_exit() {
    echo -e "\e[91m错误：$1\e[0m"
    exit 1
}

echo -e "\e[32m  正在更新软件包,如果卡住，请手动回车确认安装  \e[0m" 
sleep 2
apt update && apt upgrade -y || show_error_and_exit "更新软件包失败"
echo -e "\e[32m  正在安装 Git...  \e[0m"  
pkg install git -y || show_error_and_exit "安装 Git 失败"
echo -e "\e[32m  python-pip  \e[0m"
pkg install python-pip -y || show_error_and_exit "安装 Python pip 失败"
echo -e "\e[32m  正在安装setuptools  \e[0m"
pip install setuptools || show_error_and_exit "安装 setuptools 失败"
echo -e "\e[32m  依赖下载完成，开始拉取仓库  \e[0m"  
git clone https://github.com/xuyufenfei/ChatSydney-react-img || (rm -rf ChatSydney-react-img && git clone https://github.com/xuyufenfei/ChatSydney-react-img) || show_error_and_exit "拉取失败"
echo -e "\e[32m  拉取完成，安装pip包  \e[0m"
cd ChatSydney-react-img
pip install -r requirements.txt --upgrade || show_error_and_exit "失败"
echo -e "\e[32m  最后一步，Sydney，启动!  \e[0m"
echo -e "\e[32m  启动成功，请访问网址并且填入cookie，今后您只需要输入，cd ChatSydney-react-img，python main.py，即可启动  \e[0m" && python main.py || rm -rf ChatSydney-react-img && show_error_and_exit "启动失败"
