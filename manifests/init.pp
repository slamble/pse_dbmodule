# Manages five basic MySQL databases
#
# @summary For the PSE scenario
#
# @example
#   include databases
class databases (Array $dbs = [ { "name" => "db1", "pass" => "pass1" },
				{ "name" => "db2", "pass" => "pass2" },
				{ "name" => "db3", "pass" => "pass3" },
				{ "name" => "db4", "pass" => "pass4" },
				{ "name" => "db5", "pass" => "pass5" },

{
  #$dbnames = [ 'db1', 'db2', 'db3', 'db4', 'db5' ]
  class { '::mysql::server':
    root_password => "ultrasecurepassword",
    remove_default_accounts => true,
  }
  $dbs.each |Hash $dbdata| {
    $name = $dbdata[name]
    $pass = $dbdata[pass]
    mysql::db { $name:
      user     => "${name}-user",
      password => "${pass}",
    }
  }
}
