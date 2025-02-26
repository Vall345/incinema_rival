-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2025 at 01:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bioskop_rival`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `name`, `password`, `created_at`) VALUES
(3, 'rivaldisklh625@gmail.com', 'Valll', '$2y$10$n2pI0aDeXyVkTEIU/P0MZebDL3pblk2Ht3A41Oilf7A3WsNVauDAu', '2025-02-17 03:03:44'),
(4, 'rivaldisklh625@gmail.com', 'Slebew', '$2y$10$/JraKIhDQ9BtiXLh5tVuHOcz6ayiC4qGQeV.CfXWfg.j/SVXiCHt6', '2025-02-17 05:38:21'),
(5, 'rivaldisklh625@gmail.com', 'pagiber4k', '$2y$10$eMcuPhmWBmLwNawHQ3ECCe64J/X9.EY8zO8ei6sEoGvFd5pLX5NgW', '2025-02-17 05:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `akun_mall`
--

CREATE TABLE `akun_mall` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(231) NOT NULL,
  `nama_mall` varchar(231) NOT NULL,
  `nik` varchar(231) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun_mall`
--

INSERT INTO `akun_mall` (`id`, `email`, `password`, `nama_mall`, `nik`) VALUES
(2, 'rivaldisklh625@gmail.com', '$2y$10$9sdkqYisahmOUstI3FEIr.N5abYvUx2W.7KMNfpUDTs8dDVkvHONm', 'Metland V', '0066722360'),
(3, 'ibenskyy1@gmail.com', '$2y$10$ky20OCKtcDpDVBjYVLHEPu0r/BS11aoW0m557tEv49o2QVgdpO57y', 'Jarrmol', '008331547');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `banner` varchar(231) NOT NULL,
  `trailer` varchar(231) NOT NULL,
  `nama_film` varchar(231) NOT NULL,
  `judul` longtext NOT NULL,
  `total_menit` varchar(231) NOT NULL,
  `usia` varchar(231) NOT NULL,
  `genre` varchar(231) NOT NULL,
  `dimensi` varchar(231) NOT NULL,
  `producer` varchar(231) NOT NULL,
  `director` varchar(231) NOT NULL,
  `writer` varchar(231) NOT NULL,
  `cast` varchar(231) NOT NULL,
  `distributor` varchar(231) NOT NULL,
  `harga` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `poster`, `banner`, `trailer`, `nama_film`, `judul`, `total_menit`, `usia`, `genre`, `dimensi`, `producer`, `director`, `writer`, `cast`, `distributor`, `harga`) VALUES
(16, 'assets/uploads/poster/Totoro.jpg', 'assets/uploads/banner/bTotoro.jpeg', 'assets/uploads/trailer/MY NEIGHBOR TOTORO _ Official English Trailer.mp4', 'Totoro', 'film luar negri', '120', 'SU', 'Fantasy, ', '2D', 'bang ikbal', 'bang fajar', 'bang beni', 'bang ripal', 'bang idan', '55000'),
(17, 'assets/uploads/poster/the-boy-and-the-heron-sm-web.jpg', 'assets/uploads/banner/bTheboy.jpeg', 'assets/uploads/trailer/THE BOY AND THE HERON _ Official Teaser Trailer.mp4', 'The Boy and The Heron', 'film luar negri', '120', '17', 'Drama, Fantasy, ', '2D', 'bang ikbal', 'bang fajar', 'bang beni', 'bang ripal', 'bang idan', '55000'),
(18, 'assets/uploads/poster/chihiro.jpeg', 'assets/uploads/banner/bChihiro.jpeg', 'assets/uploads/trailer/tChihiro.mp4', 'Chihiro', 'film luar negri', '120', '13', 'Fantasy, Drama, ', '2D', 'bang ikbal', 'bang fajar', 'bang beni', 'bang ripal', 'bang idan', '55000');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_film`
--

CREATE TABLE `jadwal_film` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `studio` varchar(231) NOT NULL,
  `jam_tayang_1` time NOT NULL,
  `jam_tayang_2` time NOT NULL,
  `jam_tayang_3` time NOT NULL,
  `tanggal_tayang` date NOT NULL,
  `tanggal_akhir_tayang` date NOT NULL,
  `total_menit` varchar(231) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_film`
--

INSERT INTO `jadwal_film` (`id`, `mall_id`, `film_id`, `studio`, `jam_tayang_1`, `jam_tayang_2`, `jam_tayang_3`, `tanggal_tayang`, `tanggal_akhir_tayang`, `total_menit`) VALUES
(7, 2, 17, 'Studio 2', '11:17:00', '14:18:00', '17:18:00', '2025-02-25', '2025-03-25', '120');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` int(11) NOT NULL,
  `mall_name` varchar(255) NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `status` enum('available','occupied') NOT NULL,
  `film_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `mall_name`, `seat_number`, `status`, `film_name`) VALUES
(22, 'Metland V', 'A2', 'occupied', 'The Boy and The Heron'),
(23, 'Metland V', 'A3', 'occupied', 'The Boy and The Heron'),
(24, 'Metland V', 'A4', 'occupied', 'The Boy and The Heron'),
(25, 'Metland V', 'A1', 'occupied', 'The Boy and The Heron'),
(26, 'Metland V', 'B1', 'occupied', 'The Boy and The Heron'),
(27, 'Metland V', 'B2', 'occupied', 'The Boy and The Heron'),
(28, 'Metland V', 'C1', 'occupied', 'The Boy and The Heron'),
(29, 'Metland V', 'C2', 'occupied', 'The Boy and The Heron'),
(30, 'Metland V', 'C3', 'occupied', 'The Boy and The Heron'),
(31, 'Metland V', 'D1', 'occupied', 'The Boy and The Heron'),
(32, 'Metland V', 'D2', 'occupied', 'The Boy and The Heron'),
(33, 'Metland V', 'D3', 'occupied', 'The Boy and The Heron'),
(34, 'Metland V', 'E1', 'occupied', 'The Boy and The Heron');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `transaction_time` datetime NOT NULL,
  `username` varchar(250) NOT NULL,
  `seat_number` varchar(250) NOT NULL,
  `nama_film` varchar(231) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `order_id`, `status`, `payment_type`, `amount`, `transaction_time`, `username`, `seat_number`, `nama_film`) VALUES
(8, 'TIX1740457397', 'settlement', 'qris', 110000, '2025-02-25 11:23:19', 'rivaldisklh625@gmail.com', 'A2,A3', 'The Boy and The Heron'),
(9, 'TIX1740462545', 'settlement', 'qris', 55000, '2025-02-25 12:49:09', 'rivaldisklh625@gmail.com', 'A4', 'The Boy and The Heron'),
(10, 'TIX1740463689', 'settlement', 'qris', 550000, '2025-02-25 13:08:13', 'deviana001780@gmail.com', 'A1,B1,B2,C1,C2,C3,D1,D2,D3,E1', 'The Boy and The Heron');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `created_at`) VALUES
(1, 'rivaldisklh625@gmail.com', 'Rival', '$2y$10$tlrfkZ/7RJRo7X6SSAsQ0OLMVMjPW/tsij2Q40vZdXzdJiqLXyb9G', '2025-02-17 01:57:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`,`email`);

--
-- Indexes for table `akun_mall`
--
ALTER TABLE `akun_mall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_film`
--
ALTER TABLE `jadwal_film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `akun_mall`
--
ALTER TABLE `akun_mall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `jadwal_film`
--
ALTER TABLE `jadwal_film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
