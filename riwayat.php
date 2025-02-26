<?php
include 'koneksi.php';  // Connection to the database
include 'bagan/header.php';  // Include the header file

// Fetching data from the transactions table
$sql = "SELECT * FROM transactions WHERE username";
$sql = "SELECT * FROM transactions ORDER BY id ASC"; // You can modify this query based on specific filters like user or status
$stmt = $conn->prepare($sql);
$stmt->execute();
$result = $stmt->get_result();
?>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }

    .main-container {
        width: 100%;
        position: relative;
    }

    /* Styling untuk header */
    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
        background-color: #281E15;
        color: white;
    }

    /* Logo */
    .logo img {
        height: 100px;
    }

    /* Navigasi */
    nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
    }

    nav ul li {
        margin: 0 15px;
    }

    nav ul li a {
        text-decoration: none;
        color: white;
        font-size: 20px;
        transition: color 0.3 ease;
    }

    nav ul li a:hover {
        color: #C09A7F
    }

    nav ul li.dropdown {
        position: relative;
    }

    nav ul li.dropdown .dropdown-content {
        display: none;
        position: absolute;
        background-color: #444;
        min-width: 160px;
        z-index: 1;
        max-height: 300px;
        overflow-y: auto;
        padding: 0 10px;
    }

    nav ul li.dropdown:hover .dropdown-content {
        display: block;
    }

    nav ul li.dropdown .dropdown-content a {
        color: white;
        padding: 10px;
        text-decoration: none;
        display: block;
    }

    nav ul li.dropdown .dropdown-content a:hover {
        background-color: #C09A7F;
    }

    .search-login {
        display: flex;
        align-items: center;
        padding-inline: 5px;
    }

    .search-login input {
        padding: 5px;
        margin-right: 10px;
        border-radius: 5px;
        border: none;
        font-size: 18px;
    }

    .search-login nav ul li {
        margin: 0;
    }

    .search-login nav ul li .login-btn {
        background-color: #916648;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 20px;
        padding: 5px 10px;
    }

    .search-login nav ul li .login-btn:hover {
        background-color: #C09A7F;
    }

    .search-login nav ul li .dropdown-content {
        display: none;
        position: absolute;
        background-color: #444;
        min-width: 50px;
        z-index: 1;
        overflow-y: auto;
        padding: 0 10px;
    }

    .search-login nav ul li:hover .dropdown-content {
        display: block;
    }

    .search-login nav ul li .dropdown-content a {
        color: #f4f4f4;
        padding: 10px;
        text-decoration: none;
        display: block;
    }

    .search-login nav ul li .dropdown-content a:hover {
        color: #C09A7F;
    }

    /* Styling untuk Slider Iklan */
    .slider-container {
        width: 100%;
        overflow: hidden;
        background-color: #f2f2f2;
        padding: 0;
    }

    .slider {
        display: flex;
        transition: transform 0.5s ease-in-out;
    }

    .slide {
        min-width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .slide img {
        width: 100%;
        max-height: 700px;
        object-fit: cover;
    }

    /* Styling untuk Button Film */
    .film-selection {
        text-align: center;
        margin-top: 20px;
    }

    .film-btn {
        padding: 10px 20px;
        background-color: #ff660000;
        color: rgb(244, 181, 10);
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin: 5px;
        transition: background-color 0.3s ease;
    }

    .film-btn:hover {
        background-color: #100700;
    }



    /* Styling untuk Poster Film */
    .poster-container {
        display: flex;
        justify-content: center;
        /* Center the posters horizontally */
        padding: 20px;
        flex-wrap: wrap;
        /* Allows posters to wrap on smaller screens */
        gap: 10px;
        /* Adjust gap between posters */
    }

    .poster {
        position: relative;
        width: 200px;
        height: 300px;
        margin: 5px;
        /* Reduced margin to bring posters closer */
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        /* Menyusun tombol di bagian bawah poster */
        align-items: center;
        overflow: hidden;
        cursor: pointer;
    }

    /* Poster Image */
    .poster img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 10px;
        opacity: 0.9;
        /* Agar poster sedikit transparan */
    }

    /* Tombol Lihat Film (Hidden by default) */
    .film-button {
        padding: 10px 20px;
        background-color: #281E15;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        margin-bottom: 10px;
        transition: background-color 0.3s ease;
        position: absolute;
        /* Position the button inside the poster */
        bottom: 20px;
        /* Position button near the bottom */
        display: none;
        /* Hide the button initially */
    }

    .film-button:hover {
        background-color: #C09A7F;
    }

    /* Styling untuk teks overlay (Jika ada) */
    .poster-overlay {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: rgba(0, 0, 0, 0.6);
        color: white;
        padding: 10px 20px;
        font-size: 20px;
        font-weight: bold;
        text-align: center;
        border-radius: 5px;
        z-index: 2;
    }

    /* When the poster is hovered, show the button */
    .poster:hover .film-button {
        display: block;
    }

    /* Style untuk memastikan footer tetap di bawah */
    body,
    html {
        height: 100%;
        /* Memastikan tinggi halaman penuh */
        margin: 0;
        /* Menghapus margin default */
    }

    .main-container {
        display: flex;
        /* Menggunakan flexbox untuk tata letak */
        flex-direction: column;
        /* Mengatur agar anak-anak berada dalam kolom */
        min-height: 100vh;
        /* Memastikan tinggi minimal 100% dari viewport */
    }

    .table-container {
        flex-grow: 1;
        /* Membuat konten bisa mengisi sisa ruang yang ada */
    }

    /* Styling untuk Footer */
    footer {
        margin-top: auto;
        /* Menyudutkan footer ke bawah */
        background-color: #281E15;
        color: white;
        padding: 60px 0;
        /* Same padding as the header */
        position: relative;
        width: 100%;
        box-sizing: border-box;
        /* Ensure padding doesn't affect the width */
    }

    footer .footer-content {
        position: absolute;
        /* Position content relative to the footer */
        left: 20px;
        /* Align content to the left */
        bottom: 20px;
        /* Position at the bottom */
    }

    footer .footer-content p {
        margin: 5px 0;
        font-size: 16px;
    }

    footer .footer-content p:first-child {
        font-weight: bold;
    }

    .table-container {
        width: 80%;
        margin: 0 auto;
        padding: 10px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin: 0 auto;
        background-color: #f9f9f9;
    }

    table th,
    table td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }

    table th:first-child,
    table td:first-child {
        width: 5%;
    }

    table th:nth-child(2),
    table td:first-child {
        width: 10%;
    }

    table th {
        background-color: #916648;
        color: black;
    }

    table tr:nth-child(even) {
        background-color: #f2f2f2;
    }
</style>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <link rel="stylesheet" href="path/to/bootstrap.css"> <!-- Add path to your bootstrap CSS if necessary -->
</head>

<body>
    <div class="main-container">

        <center>
            <h2>History Transaksi</h2>
        </center>

        <div class="table-container">
            <table id="transactionTable" class="table table-bordered" style="width: 100%;">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID Transaksi</th>
                        <th>Username</th>
                        <th>Nama Film</th>
                        <th>Nomer Kursi</th>
                        <th>Tanggal Pembayaran</th>
                        <th>Jenis Pembayaran</th>
                        <th>Harga</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <?php
                $no = 1;
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr class='hover:bg-gray-100 text-center'>
                                <td class='px-4 py-2 border'>{$no}</td>
                                <td class='px-4 py-2 border'>{$row['order_id']}</td>
                                <td class='px-4 py-2 border'>{$row['username']}</td>
                                <td class='px-4 py-2 border'>{$row['nama_film']}</td>
                                <td class='px-4 py-2 border'>{$row['seat_number']}</td>
                                <td class='px-4 py-2 border'>{$row['transaction_time']}</td>
                                <td class='px-4 py-2 border'>{$row['payment_type']}</td>
                                <td class='px-4 py-2 border'>Rp.{$row['amount']}</td>
                                <td class='px-4 py-2 border'>";

                        // Status dengan warna berbeda
                        if ($row['status'] == 'settlement') {
                            echo "<span class='bg-green-500 text-white px-3 py-1 rounded-lg'>Selesai</span>";
                        } elseif ($row['status'] == 'pending') {
                            echo "<span class='bg-yellow-500 text-white px-3 py-1 rounded-lg'>Menunggu</span>";
                        } else {
                            echo "<span class='bg-red-500 text-white px-3 py-1 rounded-lg'>{$row['status']}</span>";
                        }

                        echo "</td></tr>";
                        $no++;
                    }
                } else {
                    echo "<tr><td colspan='9' class='text-center py-4 text-gray-500'>Tidak ada data</td></tr>";
                }
                ?>
                </tbody>
            </table>
        </div>

        <!-- Footer Section -->
        <?php include 'bagan/footer.php' ?>

    </div>
</body>

</html>