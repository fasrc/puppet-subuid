# subuid::host sets up a host to use the subuid file
class subuid::host (
  String $ensure     = 'absent',
  String $data_store = '/odyssey/subuid',
  Integer $cronhour  = 2,
  Integer $cronmin   = 5,
){
  cron { 'subuid':
    ensure  => $ensure,
    command => 'cp -f ${data_store}/subuid /etc/subuid; cp -f ${data_store}/subuid /etc/subgid',
    user    => 'root',
    hour    => $cronhour,
    minute  => $cronmin,
  }
}
