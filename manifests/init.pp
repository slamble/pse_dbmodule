# Manages five basic MySQL databases
#
# @summary For the PSE scenario
#
# @example
#   include databases
class databases {
  $dbnames = [ 'db1', 'db2', 'db3', 'db4', 'db5' ]
  class { '::mysql::server':
    root_password => "ultrasecurepassword",
    remove_default_accounts => true,
  }
  $dbnames.each |Integer $index, String $dbname| {
    mysql::db { $dbname:
      user     => "${dbname}-user",
      password => "supersecretsecurepassword",
    }
  }
}
