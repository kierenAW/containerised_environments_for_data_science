# jupyter config
c = get_config()
# allow connection from anywhere
c.ServerApp.ip = '0.0.0.0'
# port number
c.ServerApp.port = 8888
# do not open browser
c.ServerApp.open_browser = False
# workspace directory
c.ServerApp.root_dir = '/app'
# allow access to root directory
c.ServerApp.allow_root = True
# password for web interface
c.ServerApp.token = 'easy'
# disable password for web interface
c.ServerApp.password = ''
# disable xsrf check
c.ServerApp.disable_check_xsrf = False
# allow remote access
c.ServerApp.allow_remote_access = True
