# Add the Varnish repo
class varnish::repo::el7 {

  if ($::varnish::varnish_version < '5') {
    yumrepo { 'varnish-cache':
      baseurl  => "https://repo.varnish-cache.org/redhat/varnish-${::varnish::varnish_version}/el7/",
      descr    => 'Varnish-cache RPM repository',
      enabled  => 1,
      gpgcheck => 0
    }
  } else {
    yumrepo { 'varnish-cache':
      baseurl       => 'https://packagecloud.io/varnishcache/varnish5/el/7/$basearch',
      gpgkey        => 'https://packagecloud.io/varnishcache/varnish5/gpgkey',
      descr         => 'Varnish-cache RPM repository',
      enabled       => 1,
      gpgcheck      => 1,
      repo_gpgcheck => 1,
      sslverify     => 1,
    }
  }
}
