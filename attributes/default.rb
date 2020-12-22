default["cloudera_manager"]["admins"] = [ "cloudera" ]

############
# config.ini
############
# General Settings
default['cloudera_manager']['server_host'] = "localhost"
default['cloudera_manager']['server_port'] = "7182"
default['cloudera_manager']['listening_ip'] = node['ipaddress']
default['cloudera_manager']['listening_port'] = 9000
default['cloudera_manager']['listening_hostname'] = node['fqdn']
default['cloudera_manager']['reported_hostname'] = node['fqdn']
default['cloudera_manager']['supervisord_port'] = 19001
default['cloudera_manager']['log_file'] = "/var/log/cloudera-scm-agent/cloudera-scm-agent.log"
default['cloudera_manager']['lib_dir'] = "/var/lib/cloudera-scm-agent"
default['cloudera_manager']['parcel_dir'] = "/opt/cloudera/parcels"
default['cloudera_manager']['enable_supervisord_events'] = "true"
default['cloudera_manager']['max_collection_wait_seconds'] = 10.0
default['cloudera_manager']['metrics_url_timeout_seconds'] = 30.0
default['cloudera_manager']['task_metrics_timeout_seconds'] = 5.0
default['cloudera_manager']['monitored_nodev_filesystem_types'] = "nfs,nfs4,tmpfs"
default['cloudera_manager']['local_filesystem_whitelist'] = "ext2,ext3,ext4"
default['cloudera_manager']['impala_profile_bundle_max_bytes'] = 1073741824
default['cloudera_manager']['stacks_log_bundle_max_bytes'] = 1073741824
default['cloudera_manager']['stacks_log_max_uncompressed_file_size_bytes'] = 5242880
default['cloudera_manager']['orphan_process_dir_staleness_threshold'] = 5184000
default['cloudera_manager']['orphan_process_dir_refresh_interval'] = 3600
default['cloudera_manager']['scm_debug'] = "INFO"
default['cloudera_manager']['dns_resolution_collection_interval_seconds'] = 60
default['cloudera_manager']['dns_resolution_collection_timeout_seconds'] = 30
default['cloudera_manager']['agent_wide_credential_cache_location'] = "/var/run/cloudera-scm-agent"


# Security Settings
default['cloudera_manager']['use_tls'] = 0
default['cloudera_manager']['max_cert_depth'] = 9
default['cloudera_manager']['verify_cert_file'] = ''
default['cloudera_manager']['verify_cert_dir'] = ''
default['cloudera_manager']['client_key_file'] = ''
default['cloudera_manager']['client_keypw_cmd'] = ''
default['cloudera_manager']['client_keypw_file'] = ''
default['cloudera_manager']['client_cert_file'] = ''


# Hadoop Settings
default['cloudera_manager']['cdh_crunch_home'] = "/usr/lib/crunch"
default['cloudera_manager']['cdh_flume_home'] = "/usr/lib/flume-ng"
default['cloudera_manager']['cdh_hadoop_bin'] = "/usr/bin/hadoop"
default['cloudera_manager']['cdh_hadoop_home'] = "/usr/lib/hadoop"
default['cloudera_manager']['cdh_hbase_home'] = "/usr/lib/hbase"
default['cloudera_manager']['cdh_hbase_indexer_home'] = "/usr/lib/hbase-solr"
default['cloudera_manager']['cdh_hcat_home'] = "/usr/lib/hive-hcatalog"
default['cloudera_manager']['cdh_hdfs_home'] = "/usr/lib/hadoop-hdfs"
default['cloudera_manager']['cdh_hive_home'] = "/usr/lib/hive"
default['cloudera_manager']['cdh_httpfs_home'] = "/usr/lib/hadoop-httpfs"
default['cloudera_manager']['cdh_hue_home'] = "/usr/share/hue"
default['cloudera_manager']['cdh_hue_plugins_home'] = "/usr/lib/hadoop"
default['cloudera_manager']['cdh_impala_home'] = "/usr/lib/impala"
default['cloudera_manager']['cdh_llama_home'] = "/usr/lib/llama"
default['cloudera_manager']['cdh_mr1_home'] = "/usr/lib/hadoop-0.20-mapreduce"
default['cloudera_manager']['cdh_mr2_home'] = "/usr/lib/hadoop-mapreduce"
default['cloudera_manager']['cdh_oozie_home'] = "/usr/lib/oozie"
default['cloudera_manager']['cdh_parquet_home'] = "/usr/lib/parquet"
default['cloudera_manager']['cdh_pig_home'] = "/usr/lib/pig"
default['cloudera_manager']['cdh_solr_home'] = "/usr/lib/solr"
default['cloudera_manager']['cdh_spark_home'] = "/usr/lib/spark"
default['cloudera_manager']['cdh_sqoop_home'] = "/usr/lib/sqoop"
default['cloudera_manager']['cdh_sqoop2_home'] = "/usr/lib/sqoop2"
default['cloudera_manager']['cdh_yarn_home'] = "/usr/lib/hadoop-yarn"
default['cloudera_manager']['cdh_zookeeper_home'] = "/usr/lib/zookeeper"
default['cloudera_manager']['hive_default_xml'] = "/etc/hive/conf.dist/hive-default.xml"
default['cloudera_manager']['webhcat_default_xml'] = "/etc/hive-webhcat/conf.dist/webhcat-default.xml"
default['cloudera_manager']['jsvc_home'] = "/usr/libexec/bigtop-utils"
default['cloudera_manager']['tomcat_home'] = "/usr/lib/bigtop-tomcat"


# Cloudera Settings
default['cloudera_manager']['mgmt_home'] = "/usr/share/cmf"


# JDBC Settings
default['cloudera_manager']['cloudera_mysql_connector_jar'] = "/usr/share/java/mysql-connector-java.jar"
default['cloudera_manager']['cloudera_oracle_connector_jar'] = "/usr/share/java/oracle-connector-java.jar"
default['cloudera_manager']['cloudera_postgresql_jdbc_jar'] = ""


############
# End config.ini
############



## Databases
# amon
default['cloudera_manager']['amon']['database_type'] = "postgres"
default['cloudera_manager']['amon']['database_port'] = "3306"
default['cloudera_manager']['amon']['database_user'] = 'amon'
default['cloudera_manager']['amon']['database_name'] = 'amon_db'
default['cloudera_manager']['amon']['database_host'] = 'dbserver.example.com'

# hive / metadata
default['cloudera_manager']['hive']['database_type'] = "postgres"
default['cloudera_manager']['hive']['database_port'] = "3306"
default['cloudera_manager']['hive']['database_user'] = 'hive_db'
default['cloudera_manager']['hive']['database_name'] = 'hive_db'
default['cloudera_manager']['hive']['database_host'] = 'dbserver.example.com'

# hue
default['cloudera_manager']['hue']['database_type'] = "postgres"
default['cloudera_manager']['hue']['database_port'] = "3306"
default['cloudera_manager']['hue']['database_user'] = 'hue'
default['cloudera_manager']['hue']['database_name'] = 'hue_db'
default['cloudera_manager']['hue']['database_host'] = 'dbserver.example.com'

# nav
default['cloudera_manager']['nav']['database_type'] = "postgres"
default['cloudera_manager']['nav']['database_port'] = "3306"
default['cloudera_manager']['nav']['database_user'] = 'nav'
default['cloudera_manager']['nav']['database_name'] = 'nav_db'
default['cloudera_manager']['nav']['database_host'] = 'dbserver.example.com'

# navms
default['cloudera_manager']['navms']['database_type'] = "postgres"
default['cloudera_manager']['navms']['database_port'] = "3306"
default['cloudera_manager']['navms']['database_user'] = 'navms'
default['cloudera_manager']['navms']['database_name'] = 'navms_db'
default['cloudera_manager']['navms']['database_host'] = 'dbserver.example.com'

# oozie
default['cloudera_manager']['oozie']['database_type'] = "postgres"
default['cloudera_manager']['oozie']['database_port'] = "3306"
default['cloudera_manager']['oozie']['database_user'] = 'oozie'
default['cloudera_manager']['oozie']['database_name'] = 'oozie_db'
default['cloudera_manager']['oozie']['database_host'] = 'dbserver.example.com'

# rman
default['cloudera_manager']['rman']['database_type'] = "postgres"
default['cloudera_manager']['rman']['database_port'] = "3306"
default['cloudera_manager']['rman']['database_user'] = 'rman'
default['cloudera_manager']['rman']['database_name'] = 'rman_db'
default['cloudera_manager']['rman']['database_host'] = 'dbserver.example.com'

# scm
default['cloudera_manager']['scm']['database_type'] = "postgres"
default['cloudera_manager']['scm']['database_port'] = "3306"
default['cloudera_manager']['scm']['database_user'] = 'scm'
default['cloudera_manager']['scm']['database_name'] = 'scm_db'
default['cloudera_manager']['scm']['database_host'] = 'dbserver.example.com'

# sentry
default['cloudera_manager']['sentry']['database_type'] = "postgres"
default['cloudera_manager']['sentry']['database_port'] = "3306"
default['cloudera_manager']['sentry']['database_user'] = 'sentry'
default['cloudera_manager']['sentry']['database_name'] = 'sentry_db'
default['cloudera_manager']['sentry']['database_host'] = 'dbserver.example.com'



default['cloudera_manager']['master']['packages'] = case node['platform_family']
                                            when 'debian', 'ubuntu'
                                              {
                                                  "cloudera-manager-daemons" => "latest",
                                                  "cloudera-manager-server-db" => "latest",
                                                  "cloudera-manager-server" => "latest",
                                                  "python-pip" => "latest"
                                              }
                                            when 'rhel', 'centos'
                                              {
                                                  "cloudera-manager-daemons" => "latest",
                                                  "cloudera-manager-server-db" => "latest",
                                                  "cloudera-manager-server" => "latest",
                                                  "python-pip" => "latest"
                                              }
                                            else
                                              {
                                              }
                                                    end


default['cloudera_manager']['nodes']['packages'] = case node['platform_family']
                                                    when 'debian', 'ubuntu'
                                                      {
                                                          "cloudera-manager-daemons" => "latest",
                                                          "cloudera-manager-agent" => "latest"
                                                      }
                                                    when 'rhel', 'centos'
                                                      {
                                                          "cloudera-manager-daemons" => "latest",
                                                          "cloudera-manager-agent" => "latest"
                                                      }
                                                    else
                                                      {
                                                      }
                                                   end


default['cloudera_manager']['nfs']['packages'] = case node['platform_family']
                                                 when 'debian', 'ubuntu'
                                                   {
                                                       "nfs-common" => "latest"
                                                   }
                                                 when 'rhel', 'centos'
                                                   {
                                                       "nfs-utils" => "latest"
                                                   }
                                                 else
                                                   {
                                                   }
                                                 end



default['cloudera_manager']['external_db'] = false
default['cloudera_manager']['database']['database_type'] = "postgres"
default['cloudera_manager']['database']['postgres']['pip_dependencies'] = {
    "psycopg2" => "2.7.5"
}


default['cloudera_manager']['mount_nfs_shares'] = false
default['cloudera_manager']['nfs']['local_mount_point'] = "/nfs/"
default['cloudera_manager']['nfs']['server_host'] = "localhost"
default['cloudera_manager']['nfs']['remote_mount_point'] = "/export/fs"
default['cloudera_manager']['nfs']['version'] = "nfs"
default['cloudera_manager']['nfs']['options'] = "rw,noauto"