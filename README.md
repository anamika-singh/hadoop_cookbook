# hadoop cookbook

# Requirements

This cookbook may work on earlier versions, but these are the minimal tested versions.

* Chef 11.4.0+
* CentOS 6.4+
* Ubuntu 12.04+

This cookbook assumes that you have a working Java installation. It has been tested using version 1.13.0 of the java cookbook, using Oracle Java 6. If you plan on using Hive with a database other than the embedded Derby, you will need to provide it and set it up prior to starting Hive Metastore service.

# Usage

# Attributes

Attributes for this cookbook define the configuration files for Hadoop and its various services. Hadoop configuration files are XML files, with name/value property pairs. The attribute name determines which file the property is placed and the property name. The attribute value is the property value. The attribute `['hadoop']['core_site']['fs.defaultFS']` will configure a property named `fs.defaultFS` in `core-site.xml` in `node['hadoop']['conf_dir']`. All attribute values are taken as-is and only minimal configuration checking is done on values. It is up to the user to provide a valid configuration for your cluster.

## Distribution Attributes

* `['hadoop']['distribution']` - Specifies which Hadoop distribution to use, currently supported: cdh, hdp. Default `hdp`
* `['hadoop']['distribution_version']` - Specifies which version of `['hadoop']['distribution']` to use. Default `2`

### APT-specific settings

* `['hadoop']['apt_repo_url']` - Provide an alternate apt installation source location. If you change this attribute, you are expected to provide a path to a working repo for the `node['hadoop']['distribution']` used. Default: `nil`
* `['hadoop']['apt_repo_key_url']` - Provide an alternative apt repository key source location. Default `nil`

### RPM-specific settings

* `['hadoop']['yum_repo_url']` - Provide an alternate yum installation source location. If you change this attribute, you are expected to provide a path to a working repo for the `node['hadoop']['distribution']` used. Default: `nil`
* `['hadoop']['yum_repo_key_url']` - Provide an alternative yum repository key source location. Default `nil`

## Global Configuration Attributes

* `['hadoop']['conf_dir']` - The directory used inside `/etc/hadoop` and used via the alternatives system. Default `conf.chef`
* `['hbase']['conf_dir']` - The directory used inside `/etc/hbase` and used via the alternatives system. Default `conf.chef`
* `['hive']['conf_dir']` - The directory used inside `/etc/hive` and used via the alternatives system. Default `conf.chef`
* `['zookeeper']['conf_dir']` - The directory used inside `/etc/zookeeper` and used via the alternatives system. Default `conf.chef`

## Default Attributes

* `['hadoop']['core_site']['fs.defaultFS']` - Sets URI to HDFS NameNode. Default `hdfs://localhost`
* `['hadoop']['yarn_site']['yarn.resourcemanager.hostname']` - Sets hostname of YARN ResourceManager. Default `localhost`
* `['hive']['hive_site']['javax.jdo.option.ConnectionURL']` - Sets JDBC URL. Default `jdbc:derby:;databaseName=/var/lib/hive/metastore/metastore_db;create=true`
* `['hive']['hive_site']['javax.jdo.option.ConnectionDriverName']` - Sets JDBC Driver. Default `org.apache.derby.jdbc.EmbeddedDriver`

# Recipes

* `default.rb` - Sets up configuration and `hadoop-client` packages.
* `hadoop_hdfs_checkconfig` - Ensures the HDFS configuration meets required parameters.
* `hadoop_hdfs_datanode` - Sets up an HDFS DataNode.
* `hadoop_hdfs_ha_checkconfig` - Ensures the HDFS configuration meets requirements for High Availability.
* `hadoop_hdfs_journalnode` - Sets up an HDFS JournalNode.
* `hadoop_hdfs_namenode` - Sets up an HDFS NameNode.
* `hadoop_hdfs_secondarynamenode` - Sets up an HDFS Secondary NameNode.
* `hadoop_hdfs_zkfc` - Sets up HDFS Failover Controller, required for automated NameNode failover.
* `hadoop_yarn_nodemanager` - Sets up a YARN NodeManager.
* `hadoop_yarn_resourcemanager` - Sets up a YARN ResourceManager.
* `hbase` - Sets up configuration and `hbase` packages.
* `hbase_checkconfig` - Ensures the HBase configuration meets required parameters.
* `hbase_master` - Sets up an HBase Master.
* `hbase_regionserver` - Sets up an HBase RegionServer.
* `hbase_thrift` - Sets up an HBase Thrift interface.
* `hive` - Sets up configuration and `hive` packages.
* `hive_metastore` - Sets up Hive Metastore metadata repository.
* `hive_server` - Sets up a Hive Thrift service.
* `hive_server2` - Sets up a Hive Thrift service with Kerberos and multi-client concurrency support.
* `pig` - Installs pig interpreter.
* `repo` - Sets up package manager repositories for specified `node['hadoop']['distribution']`
* `zookeeper` - Sets up `zookeeper` package.
* `zookeeper_server` - Sets up a ZooKeeper server.

# Author

Author:: Chris Gianelloni (<chris@continuuity.com>)

Author:: Continuuity, Inc. (<ops@continuuity.com>)

# Testing

This cookbook requires the `vagrant-omnibus` and `vagrant-berkshelf` Vagrant plugins to be installed.
