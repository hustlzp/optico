from fabric.api import run, env, cd

env.host_string = "root@184.22.89.208"

def start():
	with cd('/var/www/optico'):
		run('gunicorn -c gunicorn.conf optico:app -D')

def restart():
	with cd('/var/www/optico'):
		run('kill -HUP `cat /tmp/optico.pid`')

def deploy():
	with cd('/var/www/optico'):
		run('git pull')
		run('kill -HUP `cat /tmp/optico.pid`')

def ldeploy():
	with cd('/var/www/optico'):
		run('git pull')

# back up database files
def backup():
	pass

# show apache error log
def log():
	pass
