#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "install lxml"
if [[ $(rpm -qa yum) ]] ; then
  echo "yum -y install python-lxml"
  yum -y install python-lxml
else
  echo "apt-get --assume-yes --quiet install python-lxml"
  apt-get --assume-yes --quiet install python-lxml
fi
echo "done"
echo "chmod"
chmod +x plugins/solr_*
echo "done"
echo "chown"
chown root:root plugins/solr_*
echo "done"
echo "move"
mv plugins/solr_* /usr/share/munin/plugins/
echo "done"
echo "symlink"
ln -s /usr/share/munin/plugins/solr_docs /etc/munin/plugins/solr_docs
ln -s /usr/share/munin/plugins/solr_documentcache /etc/munin/plugins/solr_documentcache
ln -s /usr/share/munin/plugins/solr_filtercache /etc/munin/plugins/solr_filtercache
ln -s /usr/share/munin/plugins/solr_qps /etc/munin/plugins/solr_qps
ln -s /usr/share/munin/plugins/solr_querycache /etc/munin/plugins/solr_querycache
ln -s /usr/share/munin/plugins/solr_querytime /etc/munin/plugins/solr_querytime
ln -s /usr/share/munin/plugins/solr_updates /etc/munin/plugins/solr_updates
ln -s /usr/share/munin/plugins/solr_updatetime /etc/munin/plugins/solr_updatetime
echo "done"
echo "restart munin-node"
/etc/init.d/munin-node restart
echo "done"
echo "/etc/munin/plugins/solr_docs"
/etc/munin/plugins/solr_docs
echo
echo "/etc/munin/plugins/solr_documentcache"
/etc/munin/plugins/solr_documentcache
echo
echo "/etc/munin/plugins/solr_filtercache"
/etc/munin/plugins/solr_filtercache
echo
echo "/etc/munin/plugins/solr_qps"
/etc/munin/plugins/solr_qps
echo
echo "/etc/munin/plugins/solr_querycache"
/etc/munin/plugins/solr_querycache
echo
echo "/etc/munin/plugins/solr_querytime"
/etc/munin/plugins/solr_querytime
echo
echo "/etc/munin/plugins/solr_updates"
/etc/munin/plugins/solr_updates
echo
echo "/etc/munin/plugins/solr_updatetime"
/etc/munin/plugins/solr_updatetime
echo
echo "it works!"
exit 0
