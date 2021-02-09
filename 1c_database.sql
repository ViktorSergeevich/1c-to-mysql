-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 09 2021 г., 15:26
-- Версия сервера: 10.4.17-MariaDB
-- Версия PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `1c_database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `dvizhenie_kontingenta`
--

CREATE TABLE `dvizhenie_kontingenta` (
  `id` int(11) NOT NULL,
  `period` date NOT NULL,
  `registrator` varchar(300) NOT NULL,
  `number_of_stroke` int(11) NOT NULL,
  `fio_student` varchar(300) NOT NULL,
  `group_student` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `fakultet`
--

CREATE TABLE `fakultet` (
  `id` int(11) NOT NULL,
  `fakultet` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `group_title` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `kafedra`
--

CREATE TABLE `kafedra` (
  `id` int(11) NOT NULL,
  `kafedra_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `kontingent`
--

CREATE TABLE `kontingent` (
  `id` int(11) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `otchestvo` varchar(25) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `snils` varchar(15) DEFAULT NULL,
  `passport_seria` varchar(10) NOT NULL,
  `passport_number` varchar(10) NOT NULL,
  `passport_date` int(11) NOT NULL,
  `passport_who_give` varchar(225) NOT NULL,
  `fakultet_title` varchar(255) NOT NULL,
  `kafedra_id` varchar(25) NOT NULL,
  `napravlenie_podgotovki_id` varchar(255) NOT NULL,
  `napravlennost_id` varchar(255) NOT NULL,
  `kurs_id` int(11) NOT NULL,
  `group_number_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `napravlenie_podgotovki`
--

CREATE TABLE `napravlenie_podgotovki` (
  `id` int(11) NOT NULL,
  `napravlenie_podgotovki_title` varchar(255) NOT NULL,
  `kafedra` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `napravlennosti`
--

CREATE TABLE `napravlennosti` (
  `id` int(11) NOT NULL,
  `napravlennosti_title` varchar(255) NOT NULL,
  `napravlenie_podgotovki` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `prikaz`
--

CREATE TABLE `prikaz` (
  `id` int(11) NOT NULL,
  `prikaz_date` date NOT NULL,
  `prikaz_number` varchar(9) NOT NULL,
  `prikaz_kurs` int(11) NOT NULL,
  `prikaz_group` varchar(15) NOT NULL,
  `prikaz_fakultet` varchar(255) NOT NULL,
  `prikaz_napravlenie_podgotovki` varchar(255) NOT NULL,
  `prikaz_napravlennost` varchar(255) NOT NULL,
  `prikaz_kafedra` varchar(255) NOT NULL,
  `prikaz_title` varchar(255) NOT NULL,
  `prikaz_formulirovka` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_number` (`course_number`);

--
-- Индексы таблицы `dvizhenie_kontingenta`
--
ALTER TABLE `dvizhenie_kontingenta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registrator` (`registrator`);

--
-- Индексы таблицы `fakultet`
--
ALTER TABLE `fakultet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fakultet` (`fakultet`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_title` (`group_title`);

--
-- Индексы таблицы `kafedra`
--
ALTER TABLE `kafedra`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kafedra_title` (`kafedra_title`);

--
-- Индексы таблицы `kontingent`
--
ALTER TABLE `kontingent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fakultet_title` (`fakultet_title`),
  ADD KEY `kafedra_id` (`kafedra_id`,`napravlenie_podgotovki_id`,`napravlennost_id`,`kurs_id`,`group_number_id`),
  ADD KEY `group_number_id` (`group_number_id`),
  ADD KEY `napravlenie_podgotovki_id` (`napravlenie_podgotovki_id`),
  ADD KEY `kurs_id` (`kurs_id`),
  ADD KEY `napravlennost_id` (`napravlennost_id`);

--
-- Индексы таблицы `napravlenie_podgotovki`
--
ALTER TABLE `napravlenie_podgotovki`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `napravlenie_podgotovki_title` (`napravlenie_podgotovki_title`),
  ADD KEY `kafedra` (`kafedra`);

--
-- Индексы таблицы `napravlennosti`
--
ALTER TABLE `napravlennosti`
  ADD UNIQUE KEY `napravlennosti_title` (`napravlennosti_title`),
  ADD KEY `napravlenie_podgotovki` (`napravlenie_podgotovki`);

--
-- Индексы таблицы `prikaz`
--
ALTER TABLE `prikaz`
  ADD PRIMARY KEY (`id`,`prikaz_date`,`prikaz_number`,`prikaz_title`),
  ADD UNIQUE KEY `prikaz_number` (`prikaz_number`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `dvizhenie_kontingenta`
--
ALTER TABLE `dvizhenie_kontingenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fakultet`
--
ALTER TABLE `fakultet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `kafedra`
--
ALTER TABLE `kafedra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `kontingent`
--
ALTER TABLE `kontingent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `napravlenie_podgotovki`
--
ALTER TABLE `napravlenie_podgotovki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `prikaz`
--
ALTER TABLE `prikaz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `kontingent`
--
ALTER TABLE `kontingent`
  ADD CONSTRAINT `kontingent_ibfk_2` FOREIGN KEY (`group_number_id`) REFERENCES `groups` (`group_title`),
  ADD CONSTRAINT `kontingent_ibfk_3` FOREIGN KEY (`kafedra_id`) REFERENCES `kafedra` (`kafedra_title`),
  ADD CONSTRAINT `kontingent_ibfk_4` FOREIGN KEY (`napravlenie_podgotovki_id`) REFERENCES `napravlenie_podgotovki` (`napravlenie_podgotovki_title`),
  ADD CONSTRAINT `kontingent_ibfk_5` FOREIGN KEY (`kurs_id`) REFERENCES `courses` (`course_number`),
  ADD CONSTRAINT `kontingent_ibfk_6` FOREIGN KEY (`napravlennost_id`) REFERENCES `napravlennosti` (`napravlennosti_title`),
  ADD CONSTRAINT `kontingent_ibfk_7` FOREIGN KEY (`fakultet_title`) REFERENCES `fakultet` (`fakultet`);

--
-- Ограничения внешнего ключа таблицы `napravlenie_podgotovki`
--
ALTER TABLE `napravlenie_podgotovki`
  ADD CONSTRAINT `napravlenie_podgotovki_ibfk_1` FOREIGN KEY (`kafedra`) REFERENCES `kafedra` (`kafedra_title`);

--
-- Ограничения внешнего ключа таблицы `napravlennosti`
--
ALTER TABLE `napravlennosti`
  ADD CONSTRAINT `napravlennosti_ibfk_1` FOREIGN KEY (`napravlenie_podgotovki`) REFERENCES `napravlenie_podgotovki` (`napravlenie_podgotovki_title`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
