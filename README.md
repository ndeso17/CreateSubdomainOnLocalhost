# CreateSubdomainOnLocalhost
Ini digunakan untuk membuat subdomain di Localhost dengan Bind9. Perinsipnya dan carakerjanya pun sama dengan nasihosting-extensionpack. Karena awalnya script ini pun dari nasihosting-esxtensionpack.

# Nasihosting Github 
nasihosting-extensionpack : https://github.com/kurniawandata/nasihosting-extensionpack
nasihosting               : https://github.com/kurniawandata/nasihosting



# installasi :
<i>Sebelum insttallasi scrip ini ada baiknya installasi terlebih dahulu <a href="https://github.com/ndeso17/easyLinuxWebServer">easyLinuxWebServer
  </a> ataupun <a href="https://github.com/kurniawandata/nasihosting">nasihosting</a></i>
  
cd /home
git clone https://github.com/ndeso17/CreateSubdomainOnLocalhost.git
cd CreateSubdomainOnLocalhost
chmod -R 777 *
a2enmod cgi
service apache2 restart
cp index.sh /usr/lib/cgi-bin
cp run.sh /usr/lib/cgi-bin
chmod 777 /usr/lib/cgi-bin
chmod 777 /usr/lib/cgi-bin/*
chmod 777 /home
chmod 777 /etc/apache2/sites-available
nano /usr/lib/cgi-bin/run.sh
Ganti password : passwordmysql setelah itu keluar lalu simpan
nano /etc/sudoers, isi : www-data ALL=(ALL) NOPASSWD: ALL
a2enmod ssl
Buat nasihosting.com.key dan nasihosting.com.pem dengan isi yang didapat dari cloudflare
chmod 777 /etc/apache2/ssl
service apache2 restart lalu enter
Untuk membuat akun http://ipserver/cgi-bin/index.sh
Untuk keamanan pastikan akun root dibuat terlebih dahulu agar password root tidak tertimpa atau dibypass, jika ada akun lain database lain punya akses seperti root pastikan juga dibuat terlebih dahulu akunnya.


# Thanks To
 kurniawan@xcodetraining.com. xcode.or.id

# Licensi
GNU General Public License v3
