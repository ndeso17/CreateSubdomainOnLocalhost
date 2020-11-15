#!/bin/bash
echo "Content-type: text/html"
echo ""
cat <<EOT
<!DOCTYPE html>
<html>
<head>
        <title>Daftar LarendaCs NasiHosting</title>
</head>
<body>
        <p>Silahkan masukkan nama subdomain dan password, password yang dimasukkan hanya mendukung huruf dan angka</p>
        <form action="run.sh" method="get">
                <label>Nama Sub domain</label>
                <input type="text" name="name">@larendacs.pc
                <br>
                <label>Password</label>
                <input type="password" name="password">
                <br>
                <label>IP V4</label>
                <input type="number" name="ip4"> masukkan digit ipv4 contoh 1 ketentuan 9 keatas dibawah 253.
                <br>
                <label>IP V6</label>
                <input type="text" name="ip6"> masukkan digit ipv6 dengan terbalik contoh 1.b = b1 ketentuan 5.7 = 75 ke atas.
                <input type="number" name="ipv6"> masukkan digit ipv6 tanpa . contoh b1 ketentuan 75 ke atas.
                <br>
                <button type="submit">OK</button>
        </form>
</body>
</html>
EOT
