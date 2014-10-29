OPTICO
======

http://www.optico.com.cn

Website for OPTICO Communication.

Lovely build with Flask & Bootstrap3.

部署：

1. git clone https://github.com/hustlzp/optico.git
2. 创建数据库'optico'，并导入'optico.sql'
3. 创建virtualenv环境，安装依赖库
    * virtualenv venv
    * . venv/bin/activate
    * pip install -r requirements.txt
4. 将`optico/config.py.sample`另存为`optico/config.py`，并按需填充其中的配置项
5. 配置Nginx以能通过配置项UPLOADED_IMAGES_URL的路径访问图片
6. python run.py