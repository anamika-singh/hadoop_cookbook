###
# cookbook settings
###
# Supported: cdh, hdp
default['hadoop']['distribution'] = 'hdp'
default['hadoop']['distribution_version'] = '2'
# Default: conf.chef
default['hadoop']['conf_dir'] = 'conf.chef'
default['hbase']['conf_dir'] = node['hadoop']['conf_dir']
default['hive']['conf_dir'] = node['hadoop']['conf_dir']
default['zookeeper']['conf_dir'] = node['hadoop']['conf_dir']

###
# core-site.xml settings
###
default['hadoop']['core_site']['fs.defaultFS'] = 'hdfs://localhost'

###
# yarn-site.xml settings
###
default['hadoop']['yarn_site']['yarn.resourcemanager.hostname'] = 'localhost'
