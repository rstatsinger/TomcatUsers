

# default recipe for users cookbook

user 'chef' do
	home '/home/chef'
	password 'chef'
end


# template for the /etc/sshd.config file

node.default['allowPasswordAuthentication'] = 'yes'

template '/etc/ssh/sshd_config' do
 	source 'sshdConfig.erb'
end


service 'sshd' do
	action :nothing
	subscribes :restart, 'template[/etc/ssh/sshd_config]', :immediately
end





