<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "PHP JALAN <br>";

include "config.php";

if (!$conn) {
    die("Koneksi gagal");
} else {
    echo "Koneksi OK <br>";
}

$data = mysqli_query($conn, "SELECT * FROM buku");

if (!$data) {
    die("Query error: " . mysqli_error($conn));
}

echo "Jumlah data: " . mysqli_num_rows($data) . "<br>";

while($row = mysqli_fetch_assoc($data)) {
    echo $row['judul'] . " - " . $row['penulis'] . "<br>";
}
?>