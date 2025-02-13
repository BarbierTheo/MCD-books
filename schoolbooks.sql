-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 12 fév. 2025 à 10:52
-- Version du serveur : 8.4.3
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `schoolbooks`
--

-- --------------------------------------------------------

--
-- Structure de la table `books`
--

CREATE TABLE `books` (
  `book_id` varchar(50) NOT NULL,
  `book_title` varchar(50) NOT NULL,
  `book_autor` varchar(50) NOT NULL,
  `book_year` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `books`
--

INSERT INTO `books` (`book_id`, `book_title`, `book_autor`, `book_year`) VALUES
('B001', 'Les Misérables', 'Victor Hugo', '1862-01-01'),
('B002', '1984', 'George Orwell', '1949-06-08'),
('B003', 'Le Comte de Monte-Cristo', 'Alexandre Dumas', '1844-08-28'),
('B004', 'La Peste', 'Albert Camus', '1947-11-10'),
('B005', 'L’Étranger', 'Albert Camus', '1942-05-01'),
('B006', 'L’Art de la Guerre', 'Sun Tzu', '0500-01-01'),
('B007', 'Le Petit Prince', 'Antoine de Saint-Exupéry', '1943-04-06'),
('B008', 'La Recherche du Temps Perdu', 'Marcel Proust', '1913-01-01'),
('B009', 'Le Seigneur des Anneaux', 'J.R.R. Tolkien', '1954-07-29'),
('B010', 'Les Fleurs du Mal', 'Charles Baudelaire', '1857-06-25');

-- --------------------------------------------------------

--
-- Structure de la table `book_borrowing`
--

CREATE TABLE `book_borrowing` (
  `id_borrow` int NOT NULL,
  `borrow_date_start` date NOT NULL,
  `borrow_start_return` date NOT NULL,
  `book_id` varchar(50) NOT NULL,
  `student_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `book_borrowing`
--

INSERT INTO `book_borrowing` (`id_borrow`, `borrow_date_start`, `borrow_start_return`, `book_id`, `student_id`) VALUES
(11, '2025-02-01', '2025-03-01', 'B001', 1),
(12, '2025-02-02', '2025-03-02', 'B002', 3),
(13, '2025-02-03', '2025-03-03', 'B003', 5),
(14, '2025-02-04', '2025-03-04', 'B004', 9),
(15, '2025-02-05', '2025-03-05', 'B005', 2),
(16, '2025-02-06', '2025-03-06', 'B006', 6),
(17, '2025-02-07', '2025-03-07', 'B007', 7),
(18, '2025-02-09', '2025-03-09', 'B009', 4),
(19, '2025-02-10', '2025-03-10', 'B010', 10);

-- --------------------------------------------------------

--
-- Structure de la table `students`
--

CREATE TABLE `students` (
  `student_id` int NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `student_surname` varchar(50) NOT NULL,
  `student_class` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `students`
--

INSERT INTO `students` (`student_id`, `student_name`, `student_surname`, `student_class`) VALUES
(1, 'Alice', 'Dupont', 'Seconde'),
(2, 'Bob', 'Martin', 'Première'),
(3, 'Charlie', 'Durand', 'Seconde'),
(4, 'David', 'Lemoine', 'Seconde'),
(5, 'Emma', 'Petit', 'Terminal'),
(6, 'Fanny', 'Blanc', 'Terminal'),
(7, 'Geoffrey', 'Lemoine', 'Terminal'),
(8, 'Hannah', 'Giraud', 'Première'),
(9, 'Ibrahim', 'Boudjema', 'Première'),
(10, 'Jasmine', 'Boucher', 'Première');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Index pour la table `book_borrowing`
--
ALTER TABLE `book_borrowing`
  ADD PRIMARY KEY (`id_borrow`),
  ADD UNIQUE KEY `book_id` (`book_id`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- Index pour la table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `book_borrowing`
--
ALTER TABLE `book_borrowing`
  MODIFY `id_borrow` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `book_borrowing`
--
ALTER TABLE `book_borrowing`
  ADD CONSTRAINT `book_borrowing_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `book_borrowing_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
