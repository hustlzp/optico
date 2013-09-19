OPTICO
======

http://www.optico.com.cn

Website for OPTICO company.

Lovely build with Flask & Bootstrap2.

部署：

1. git clone https://github.com/hustlzp/xichuangzhu.git
2. 创建数据库'optico'，并导入'optico.sql'
    * mysql> CREATE DATABASE 'optico' DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    * mysql -uuser -ppassword optico < optico.sql
3. 安装依赖库
    * sudo apt-get install libmysqlclient-dev python-dev
    * sudo pip install -r requirements.txt
4. 将config另存为/var/www/flaskconfig/xichuangzhu/config.py，并填充其中所有的缺失配置项
5. python run.py