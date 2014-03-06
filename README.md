OPTICO
======

http://www.optico.com.cn

Website for OPTICO Communication.

Lovely build with Flask & Bootstrap3.

部署：

1. git clone https://github.com/hustlzp/optico.git
2. 创建数据库'optico'，并导入'optico.sql'
    * mysql -uuser -ppassword
    * mysql> CREATE DATABASE optico DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    * mysql -uuser -ppassword optico < optico.sql
3. 创建virtualenv环境，安装依赖库
    * sudo apt-get libmysqlclient-dev python-dev
    * sudo apt-get install python-virtualenv
    * virtualenv venv
    * . venv/bin/activate
    * pip install -r requirements.txt
4. 将config另存为/var/www/flaskconfig/optico/config.py，并填充其中所有的缺失配置项
5. 根据配置项UPLOADED_IMAGES_DEST，将文件夹opticoimgs存放到对应的路径下
6. 配置Nginx以能通过配置项UPLOADED_IMAGES_URL的路径访问图片
7. python run.py