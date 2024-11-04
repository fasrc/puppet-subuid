# subuid::generate generates the subuid mapping
class subuid::generate (
  Boolean $enable      = false,
  String  $data_store  = '/odyssey/subuid',
  Integer $subuidstart = 100000000,
  Integer $subuidrange = 66536,
  Integer $cronhour    = 1,
  Integer $cronmin     = 10,
){

  if $enable {
    file {'/usr/local/sbin/subuid.sh':
      content => template('subuid/subuid.sh.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
    }

    cron { 'subuid':
      command => '/usr/local/sbin/subuid.sh',
      user    => 'root',
      hour    => $cronhour,
      minute  => $cronmin,
    }
  }
}
