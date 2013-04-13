from fabric.api import run, env, cd

env.host_string = "root@184.22.89.208"

def restart():
	with cd('/var/www/optico'):
		run('sh run.sh')

def deploy():
	with cd('/var/www/optico'):
		run('git pull')
		run('sh run.sh')

def ldeploy():
	with cd('/var/www/optico'):
		run('git pull')

# back up database files
def backup():
	pass

# show apache error log
def log():
	pass
