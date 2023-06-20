-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2023 at 02:03 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booksdaily`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` char(6) NOT NULL,
  `nama_anggota` varchar(30) DEFAULT NULL,
  `alamat_anggota` varchar(50) DEFAULT NULL,
  `telepon_anggota` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `alamat_anggota`, `telepon_anggota`) VALUES
('A001', 'John Doe', 'Jl. Ahmad Yani No. 123', '081234567890'),
('A0015', 'Agus', 'Jl. Sudirman No. 123, Jakarta Pusat', '081234567890'),
('A002', 'Jane Smith', 'Jl. Sudirman No. 456', '082345678901'),
('A003', 'David Johnson', 'Jl. Gatot Subroto No. 789', '083456789012'),
('A004', 'Emily Davis', 'Jl. Diponegoro No. 987', '084567890123'),
('A005', 'Michael Wilson', 'Jl. Panglima Polim No. 321', '085678901234'),
('A006', 'Budi', 'Jl. Raya Kertajaya No. 45, Surabaya', '082345678901'),
('A007', 'Citra', 'Jl. Cihampelas No. 67, Bandung', '083456789012'),
('A008', 'Dewi', 'Jl. Malioboro No. 89, Yogyakarta', '084567890123'),
('A009', 'Eko', 'Jl. Gajahmada No. 12, Semarang', '085678901234'),
('A010', 'Fajar', 'Jl. Thamrin No. 34, Medan', '086789012345'),
('A011', 'Gita', 'Jl. Legian No. 56, Denpasar', '087890123456'),
('A012', 'Hari', 'Jl. Boulevard No. 78, Makassar', '088901234567'),
('A013', 'Indra', 'Jl. Simpang Lima No. 90, Palembang', '089012345678'),
('A014', 'Joko', 'Jl. Imam Bonjol No. 43, Padang', '090123456789');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` char(6) NOT NULL,
  `id_kategori` char(6) NOT NULL,
  `judul_buku` varchar(50) DEFAULT NULL,
  `nama_penulis` varchar(30) DEFAULT NULL,
  `tahun_penerbitan` int(4) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `url_gambar` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `judul_buku`, `nama_penulis`, `tahun_penerbitan`, `stok`, `url_gambar`) VALUES
('B001', 'KAT003', 'Steve Jobs', 'Walter Isaacson', 2007, 3, 'images/books/stevejobs.png'),
('B002', 'KAT005', 'Malibu Rising', 'Taylor Jenkins Reid', 2015, 2, 'images/books/malibu.png'),
('B003', 'KAT004', 'The Psychology of Money', 'Morgan Housel', 2011, 2, 'images/books/psikologiuang.png'),
('B004', 'KAT004', 'The First 90 Days', 'Michael D. Watkins', 2020, 4, 'images/books/90days.png'),
('B005', 'KAT003', 'The Diary of a Young Girl', 'Anne Frank', 1947, 1, 'images/books/diaryofyg.jpg'),
('B006', 'KAT003', 'Educated', 'Tara Westover', 2018, 3, 'images/books/educated.jpg'),
('B007', 'KAT004', 'A Brief History of Time', 'Stephen Hawking', 1988, 2, 'images/books/abrief.jpg'),
('B008', 'KAT004', 'The Gene: An Intimate History', 'Siddhartha Mukherjee', 2016, 5, 'images/books/gene.jpg'),
('B009', 'KAT005', 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 2011, 3, 'images/books/sapiens.jpg'),
('B010', 'KAT005', 'Guns, Germs, and Steel', 'Jared Diamond', 1997, 4, 'images/books/gunsgerms.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `denda`
--

CREATE TABLE `denda` (
  `id_denda` char(6) NOT NULL,
  `id_peminjaman` char(6) NOT NULL,
  `jumlah_denda` decimal(10,0) DEFAULT NULL,
  `status` varchar(15) DEFAULT 'belum lunas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favorit`
--

CREATE TABLE `favorit` (
  `id_favorit` int(11) NOT NULL,
  `id_buku` char(6) NOT NULL,
  `id_anggota` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `informasi_buku`
-- (See below for the actual view)
--
CREATE TABLE `informasi_buku` (
`id_buku` char(6)
,`id_kategori` char(6)
,`judul_buku` varchar(50)
,`nama_penulis` varchar(30)
,`tahun_penerbitan` int(4)
,`stok` int(11)
,`url_gambar` varchar(200)
,`kategori` varchar(30)
,`nilai` decimal(12,1)
,`sinopsis` text
);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` char(6) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
('KAT001', 'Fiction'),
('KAT002', 'Non-Fiction'),
('KAT003', 'Biographies'),
('KAT004', 'Self Improvement'),
('KAT005', 'Arts and Literature'),
('KAT006', 'Children\'s Books'),
('KAT007', 'History and Culture'),
('KAT008', 'Science and Technology');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` char(6) NOT NULL,
  `id_anggota` char(6) NOT NULL,
  `id_buku` char(6) NOT NULL,
  `id_petugas` char(6) NOT NULL,
  `tanggal_peminjaman` date DEFAULT NULL,
  `tanggal_pengembalian` date DEFAULT NULL,
  `tanggal_dikembalikan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` char(6) NOT NULL,
  `nama_petugas` varchar(30) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `jabatan`) VALUES
('P001', 'Ibrahim Osman', 'Pustakawan'),
('P002', 'Hana Zahra', 'Admin'),
('P003', 'Budi', 'Petugas Arsip'),
('P004', 'Aiza Maira', 'Pustakawan'),
('P005', 'Andi Wijaya', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `sinopsis`
--

CREATE TABLE `sinopsis` (
  `id_sinopsis` int(11) NOT NULL,
  `id_buku` char(6) NOT NULL,
  `sinopsis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sinopsis`
--

INSERT INTO `sinopsis` (`id_sinopsis`, `id_buku`, `sinopsis`) VALUES
(1, 'B001', 'The book \"Steve Jobs\" is a captivating biography written by Walter Isaacson. It takes readers on an extraordinary journey through the life of Steve Jobs, the co-founder of Apple Inc. From his humble beginnings in a garage to his rise as a visionary leader, Jobs\' story is one of relentless passion, innovation, and determination. Isaacson explores Jobs\' early influences, his tumultuous relationships, and his remarkable contributions to the world of technology. With deep insights into his personality and creative process, the book provides a comprehensive understanding of Jobs\' impact on the digital revolution.'),
(2, 'B002', 'In the novel \"Malibu Rising\" by Taylor Jenkins Reid, readers are transported to the vibrant world of Malibu, California. Against the backdrop of a glamorous summer party, Reid weaves a compelling story of love, family, and the complexities of fame. The Riva siblings, children of a famous singer, navigate their own personal struggles while carrying the weight of their family legacy. As secrets unravel and tensions escalate, the novel explores themes of identity, resilience, and the enduring bonds of siblinghood.'),
(3, 'B003', 'Morgan Housel\'s book \"The Psychology of Money\" offers a fascinating exploration of our relationship with money and the factors that influence our financial decisions. Drawing on real-life examples and behavioral psychology, Housel challenges conventional wisdom and provides valuable insights into building long-term wealth. The book delves into the emotional and cognitive biases that often drive financial choices, offering readers a fresh perspective on how to navigate the complex world of personal finance.'),
(4, 'B004', 'Leadership transitions can be challenging, and \"The First 90 Days\" by Michael D. Watkins is a valuable guide for anyone entering a new role. Watkins provides practical strategies and actionable advice for accelerating learning, building relationships, and making a positive impact during the critical early phase of leadership. Drawing on extensive research and real-world examples, the book equips leaders with the tools they need to navigate the complexities of their new role with confidence and effectiveness.'),
(5, 'B005', 'Anne Frank\'s diary, \"The Diary of a Young Girl,\" is a poignant and powerful memoir that offers an intimate glimpse into the life of a young Jewish girl hiding from the Nazis during World War II. Anne Frank\'s diary entries capture the daily challenges, fears, and hopes of living in hiding. Through her candid reflections, readers gain a profound understanding of the human spirit and the enduring power of hope, even in the darkest of times.'),
(6, 'B006', 'Tara Westover\'s memoir, \"Educated,\" is a compelling story of resilience, self-discovery, and the transformative power of education. Growing up in a strict and isolated environment in rural Idaho, Westover had limited access to formal education. Against all odds, she embarked on a journey of self-education, eventually earning a Ph.D. from Cambridge University. Westover\'s memoir explores the complexities of family, the pursuit of knowledge, and the indomitable human spirit.'),
(7, 'B007', 'Stephen Hawking\'s \"A Brief History of Time\" is a thought-provoking exploration of the mysteries of the universe. Hawking takes readers on a journey through the realms of cosmology, exploring concepts such as the Big Bang, black holes, and the nature of time. With clarity and intellectual rigor, Hawking demystifies complex scientific theories and offers insights into the fundamental questions that have puzzled humanity for centuries.'),
(8, 'B008', 'In \"The Gene: An Intimate History\" by Siddhartha Mukherjee, readers delve into the fascinating world of genetics. From the discovery of the gene to the revolutionary advancements in gene editing, Mukherjee chronicles the scientific breakthroughs that have transformed our understanding of heredity and disease. Blending science, history, and personal narratives, the book provides a comprehensive exploration of the genetic code and its profound impact on our lives.'),
(9, 'B009', 'Yuval Noah Harari\'s \"Sapiens: A Brief History of Humankind\" offers a sweeping overview of human history, from the emergence of Homo sapiens to the present day. Harari explores the key developments that have shaped our species, including the agricultural revolution, the rise of empires, and the technological advancements that define the modern era. With thought-provoking insights and a global perspective, the book challenges conventional narratives and invites readers to contemplate the future of humanity.'),
(10, 'B010', 'Jared Diamond\'s \"Guns, Germs, and Steel\" presents a captivating exploration of the factors that have shaped human societies throughout history. Diamond investigates the role of geography, biology, and cultural interactions in determining the fates of different civilizations. The book offers a compelling argument about the complex interplay of environmental factors and human agency, providing a fresh perspective on the inequalities and patterns of development that have defined our world.');

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `id_ulasan` int(11) NOT NULL,
  `id_buku` char(6) NOT NULL,
  `id_anggota` char(6) NOT NULL,
  `ulasan` varchar(200) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL CHECK (`nilai` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ulasan`
--

INSERT INTO `ulasan` (`id_ulasan`, `id_buku`, `id_anggota`, `ulasan`, `nilai`) VALUES
(31, 'B001', 'A001', 'This book is absolutely incredible. The storyline is gripping, and the characters are well-developed. I couldn\'t put it down!', 4),
(32, 'B002', 'A002', 'I enjoyed reading this book. It had a good mix of suspense and romance. Definitely worth a read.', 4),
(33, 'B003', 'A003', 'This book is a masterpiece. The author\'s descriptive writing transported me to another world. Highly recommended!', 5),
(34, 'B004', 'A004', 'A quick and entertaining read. Perfect for a lazy weekend. I liked the unexpected twist in the plot.', 4),
(35, 'B005', 'A005', 'I found this book to be quite engaging. The author\'s storytelling kept me hooked till the end. Looking forward to more from them!', 4),
(36, 'B006', 'A006', 'An eye-opening book that made me reflect on life. It offers valuable insights and encourages self-reflection. Highly recommended!', 4),
(37, 'B007', 'A007', 'I learned so much from this book. The author presents complex ideas in a clear and concise manner. It is a must-read for anyone interested in the subject.', 5),
(38, 'B008', 'A008', 'This book is a rollercoaster of emotions. It made me laugh, cry, and everything in between. The characters felt so real, and the plot twists kept me on the edge of my seat.', 5),
(39, 'B009', 'A009', 'A beautifully written novel that touched my heart. The author\'s prose is poetic, and the story is both heartwarming and thought-provoking. Highly recommended!', 5),
(40, 'B010', 'A010', 'I couldn\'t put this book down. The suspense and mystery kept me guessing until the very end. It is a thrilling page-turner that I would highly recommend!', 5),
(41, 'B001', 'A010', 'This book exceeded my expectations. The author\'s attention to detail and vivid descriptions brought the story to life. It is a captivating and immersive read.', 5),
(42, 'B002', 'A009', 'A heartwrenching story that explores themes of love and loss. The author\'s poignant writing tugged at my heartstrings. I was deeply moved by this book.', 5),
(43, 'B003', 'A008', 'An intriguing and fast-paced read. The author\'s storytelling skills kept me hooked from beginning to end. I couldn\'t stop turning the pages!', 5),
(44, 'B004', 'A007', 'I thoroughly enjoyed this book. The author\'s unique writing style and engaging narrative made it a standout read for me. Highly recommended!', 5),
(45, 'B005', 'A006', 'A captivating story that transported me to a different time and place. The author\'s attention to historical detail is commendable. I highly recommend this book to history lovers.', 4),
(46, 'B006', 'A005', 'A thrilling and suspenseful book that had me on the edge of my seat. The plot twists and turns kept me guessing until the very end. A great read!', 4),
(47, 'B007', 'A004', 'This book made me experience a wide range of emotions. It made me laugh, cry, and feel deeply. The author\'s writing beautifully captured the essence of the story.', 5),
(48, 'B008', 'A003', 'A compelling and thought-provoking book that tackles important social issues. The author\'s storytelling is powerful and impactful. It left a lasting impression on me.', 3),
(49, 'B009', 'A002', 'I couldn\'t get enough of this book. The characters were relatable, and the story had me hooked from the first page. It is a must-read for fans of the genre.', 3),
(50, 'B010', 'A001', 'This book is a literary gem. The author\'s prose is elegant and evocative. It took me on an emotional journey that I won\'t soon forget. Highly recommended!', 4),
(51, 'B004', 'A011', 'A mesmerizing and beautifully written book. The author\'s lyrical prose swept me away. I was completely immersed in the story and didn\'t want it to end.', 4),
(52, 'B002', 'A012', 'This book kept me on the edge of my seat. The suspense was intense, and the plot twists were unexpected. I couldn\'t turn the pages fast enough!', 5),
(53, 'B003', 'A013', 'An empowering and inspiring book. It motivated me to pursue my dreams and never give up. I highly recommend it to anyone in need of a dose of motivation.', 5),
(54, 'B004', 'A014', 'I couldn\'t put this book down. The characters were well-developed, and the story was full of twists and turns. It kept me guessing until the very end.', 5),
(55, 'B005', 'A014', 'A heartwarming and uplifting story that touched my soul. The author\'s writing radiates warmth and compassion. It left me with a renewed sense of hope.', 5),
(56, 'B006', 'A002', 'This book is a true gem. The characters are deeply complex, and their relationships are beautifully portrayed. The author\'s writing is exquisite.', 4),
(57, 'B007', 'A003', 'A mind-bending and thought-provoking book. It challenged my perceptions and made me question reality. I was captivated from start to finish.', 4),
(58, 'B008', 'A004', 'I couldn\'t get enough of this book. The story was addictive, and the pacing was perfect. It kept me up all night, eager to uncover the mysteries.', 5),
(59, 'B009', 'A001', 'This book touched my heart in ways I can\'t describe. The author\'s words resonated with me on a deep level. It is a powerful and unforgettable read.', 5),
(60, 'B010', 'A002', 'A beautifully written book that explores love, loss, and the human spirit. The author\'s prose is poetic, and the story is deeply moving. Highly recommended!', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`) VALUES
(2, 'hassan', '$2y$10$ZKKx7vFwwy27k9OnSt2uAOGnM4MOdlCLs/7Qg63OSCsvTerwUvAGm'),
(3, 'hassan aldhi', '$2y$10$PlbSd9Z7SKYtgj4fQ0R06.P/MzfyI0WCb.I7o7EVc1ggyJSRlvgHm'),
(4, 'userbaru', '$2y$10$hfmRMW84gRIAcNbKi9CgEuc0TQjiK2EFHWYYlcc7J0xP7VHnJi9Y.');

-- --------------------------------------------------------

--
-- Structure for view `informasi_buku`
--
DROP TABLE IF EXISTS `informasi_buku`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `informasi_buku`  AS  select `b`.`id_buku` AS `id_buku`,`b`.`id_kategori` AS `id_kategori`,`b`.`judul_buku` AS `judul_buku`,`b`.`nama_penulis` AS `nama_penulis`,`b`.`tahun_penerbitan` AS `tahun_penerbitan`,`b`.`stok` AS `stok`,`b`.`url_gambar` AS `url_gambar`,`k`.`nama_kategori` AS `kategori`,round(`u`.`nilai_rata`,1) AS `nilai`,`s`.`sinopsis` AS `sinopsis` from (((`buku` `b` join `kategori` `k` on(`b`.`id_kategori` = `k`.`id_kategori`)) join `sinopsis` `s` on(`b`.`id_buku` = `s`.`id_buku`)) left join (select `ulasan`.`id_buku` AS `id_buku`,avg(`ulasan`.`nilai`) AS `nilai_rata` from `ulasan` group by `ulasan`.`id_buku`) `u` on(`b`.`id_buku` = `u`.`id_buku`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `FK_kategori_buku` (`id_kategori`);

--
-- Indexes for table `denda`
--
ALTER TABLE `denda`
  ADD PRIMARY KEY (`id_denda`),
  ADD KEY `FK_denda_peminjaman` (`id_peminjaman`);

--
-- Indexes for table `favorit`
--
ALTER TABLE `favorit`
  ADD PRIMARY KEY (`id_favorit`),
  ADD KEY `FK_buku_favorit` (`id_buku`),
  ADD KEY `FK_anggota_favorit` (`id_anggota`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `FK_Petugas_peminjaman` (`id_petugas`),
  ADD KEY `FK_anggota_pinjam` (`id_anggota`),
  ADD KEY `FK_buku_pinjam` (`id_buku`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `sinopsis`
--
ALTER TABLE `sinopsis`
  ADD PRIMARY KEY (`id_sinopsis`),
  ADD KEY `FK_sinopsis_buku` (`id_buku`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id_ulasan`),
  ADD KEY `FK_buku_diulas` (`id_buku`),
  ADD KEY `FK_anggota_pengulas` (`id_anggota`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sinopsis`
--
ALTER TABLE `sinopsis`
  MODIFY `id_sinopsis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id_ulasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `FK_kategori_buku` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Constraints for table `denda`
--
ALTER TABLE `denda`
  ADD CONSTRAINT `FK_denda_peminjaman` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`);

--
-- Constraints for table `favorit`
--
ALTER TABLE `favorit`
  ADD CONSTRAINT `FK_anggota_favorit` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `FK_buku_favorit` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `FK_Petugas_peminjaman` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  ADD CONSTRAINT `FK_anggota_pinjam` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `FK_buku_pinjam` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `sinopsis`
--
ALTER TABLE `sinopsis`
  ADD CONSTRAINT `FK_sinopsis_buku` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `FK_anggota_pengulas` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `FK_buku_diulas` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
