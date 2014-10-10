Dependencies
============
baker - http://github.com/teran-mckinney/baker

Notes
=====

```
ibakestuff$ ./deploy.sh
# kldload linux
bash# pkg install -y linux-f10-{atk,cairo,curl,gtk2,libssh2,nspr,nss}
# pkg add -y /tmp/usr/ports/www/linux-f10-flashplugin11/work/pkg/linux-f10-flashplugin*
iuseflash$ nspluginwrapper -v -a -i
```
