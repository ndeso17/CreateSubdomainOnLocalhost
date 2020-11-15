#!/bin/bash
echo "Content-type: text/html"
echo ""
name=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[1]}' | awk '{split($0,array,"=")} END{print array[2]}'`
ip4=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[3]}' | awk '{split($0,array,"=")} END{print array[2]}'`
ip6=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[4]}' | awk '{split($0,array,"=")} END{print array[2]}'`
ipv6=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[5]}' | awk '{split($0,array,"=")} END{print array[2]}'`
password=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[2]}' | awk '{split($0,array,"=")} END{print array[2]}'`
if [ -z "$(ls -A /var/www/$name/config.php)" ]; then
sudo mkdir /var/www/$name
sudo cp /home/larendacs/filemanager/* /var/www/$name
sudo chmod 777 /var/www/$name
sudo chmod 777 /var/www/$name/*
sed -i "s/unik/$password/g" /var/www/$name/config.php
cp /home/larendacs/support/larendacs.conf /etc/apache2/sites-available/$name.conf
sed -i "s/sample/$name/g" /etc/apache2/sites-available/$name.conf
sudo a2ensite $name.conf
sudo systemctl reload apache2
cp /home/larendacs/support/db.ipv4 /etc/bind/hosting/$name.ipv4
sed -i "s/sample/$name/g" /etc/bind/hosting/$name.ipv4
sed -i "s/ip4/$ip4/g" /etc/bind/hosting/$name.ipv4
cp /home/larendacs/support/db.ipv6 /etc/bind/hosting/$name.ipv6
sed -i "s/sample/$name/g" /etc/bind/hosting/$name.ipv6
sed -i "s/ip6/$ip6/g" /etc/bind/hosting/$name.ipv6
cp /home/larendacs/support/db.larendacs /etc/bind/hosting/$name.larendacs
sed -i "s/sample/$name/g" /etc/bind/hosting/$name.larendacs
sed -i "s/ip4/$ip4/g" /etc/bind/hosting/$name.larendacs
sed -i "s/ipv6/$ipv6/g" /etc/bind/hosting/$name.larendacs
sudo systemctl restart bind9
mysql -ulocaldb -p123456 -e "CREATE DATABASE "$name""
mysql -ulocaldb -p123456 -e "GRANT ALL PRIVILEGES ON "$name".* TO "$name"@localhost IDENTIFIED BY '"$password"'"
cat <<EOT
<!DOCTYPE html>
<html>
<head>
<title>Larenda It</title>
</head>
<body>
<h2>Welcome $name </h1>
Alamat website anda : https://$name.larendacs.pc <br />
Login : https://$name.larendacs.pc/login.php<br />
Username : admin<br />
Password : $password<br />
Cara ganti password edit pada bagian config.php, cari password anda dan ganti dengan password yang baru<br />
<br />
Login phpmyadmin<br />
Login : https://$name.larendacs.pc/phpmyadmin<br />
Username : $name <br />
Password : $password <br />
<br />
Saat ini request anda tinggal diapprove oleh admin<br />
</body>
</html>
EOT
else
echo "Subdomain yang anda masukkan sudah ada pemiliknya"
fi
