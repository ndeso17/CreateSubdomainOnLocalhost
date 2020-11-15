# CreateSubdomainOnLocalhost
Ini digunakan untuk membuat subdomain di Localhost dengan Bind9. Perinsipnya dan carakerjanya pun sama dengan nasihosting-extensionpack. Karena awalnya script ini pun dari nasihosting-esxtensionpack.

# Nasihosting Github 
nasihosting-extensionpack : https://github.com/kurniawandata/nasihosting-extensionpack</br>
nasihosting               : https://github.com/kurniawandata/nasihosting



# installasi :
<i>Sebelum insttallasi scrip ini ada baiknya installasi terlebih dahulu <a href="https://github.com/ndeso17/easyLinuxWebServer">easyLinuxWebServer
  </a> ataupun <a href="https://github.com/kurniawandata/nasihosting">nasihosting</a></i></br>
  
cd /home</br>
git clone https://github.com/ndeso17/CreateSubdomainOnLocalhost.git</br>
cd CreateSubdomainOnLocalhost</br>
chmod -R 777 *</br>
a2enmod cgi</br>
service apache2 restart</br>
cp index.sh /usr/lib/cgi-bin</br>
cp run.sh /usr/lib/cgi-bin</br>
chmod 777 /usr/lib/cgi-bin</br>
chmod 777 /usr/lib/cgi-bin/*</br>
chmod 777 /home</br>
chmod 777 /var/www</br>
chmod 777 /etc/apache2/sites-available</br>
nano /usr/lib/cgi-bin/run.sh</br>
Ganti password : passwordmysql setelah itu keluar lalu simpan</br>
nano /etc/sudoers, isi : www-data ALL=(ALL) NOPASSWD: ALL</br>
a2enmod ssl</br>
Buat ssl menggunakan mkcert ataupun kalau sudah punya tinggal kalian pakai saja</br>
chmod 777 /etc/apache2/ssl</br>
service apache2 restart lalu enter</br>
Untuk membuat akun http://ipserver/cgi-bin/index.sh</br>
Untuk keamanan pastikan akun root dibuat terlebih dahulu agar password root tidak tertimpa atau dibypass, jika ada akun lain database lain punya akses seperti root pastikan juga dibuat terlebih dahulu akunnya.</br>


# Thanks To
 kurniawan@xcodetraining.com. xcode.or.id

# Licensi
GNU General Public License v3
