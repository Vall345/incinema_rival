<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="assets/img/Logo1.jpg">
    <title>Dashboard - Studio G</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <!-- Container utama untuk header dan slider -->
    <div class="main-container">
        <!-- Header -->
        <?php include'bagan/header.php'?>

        <!-- Slider Iklan -->
        <div class="slider-container">
            <div class="slider">
                <div class="slide">
                    <img src="assets/uploads/banner/bTheboy.jpeg" alt="Iklan 1">
                </div>
                <div class="slide">
                    <img src="assets/uploads/banner/bTotoro.jpeg" alt="Iklan 2">
                </div>
            </div>
        </div>

        <!-- Foto Poster Film di bawah Slider -->
        <br>
        <h1>Sedang Tayang</h1>
    <?php
        include 'koneksi.php'; // Menghubungkan ke database

               // Query untuk mengambil film yang akan tayang dalam waktu dekat
        $sql = "SELECT * FROM film ORDER BY id ASC";
        $result = $conn->query($sql);
   
               // Memulai output HTML
    ?>
   
    <div class="poster-container">
        <?php while ($row = $result->fetch_assoc()):?>
            <div class="poster">
            <img src="<?php echo $row['poster'];?>" alt="Poster Film 1">
                <a href="lihat_film.php?id=<?php echo $row['id'];?>" class="film-button">Lihat Film</a>
            </div>
            <?php endwhile ?>
    </div>
</div>
    <!-- Footer Section -->
    <?php include'bagan/footer.php'?>
        
        
</div>

<script src="assets/js/script.js"></script>
<script src="assets/js/button.js"></script>
</body>
</html>
