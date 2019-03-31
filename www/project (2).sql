-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 31 2019 г., 14:56
-- Версия сервера: 5.6.41
-- Версия PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `project`
--

-- --------------------------------------------------------

--
-- Структура таблицы `about`
--

CREATE TABLE `about` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `about`
--

INSERT INTO `about` (`id`, `name`, `description`, `photo`) VALUES
(1, 'Алексей', '<p>Я веб-разработчик из Гомеля. Мне 24 года.</p>\r\n<p>Занимаюсь разработкой современных сайтов и приложений. Мне нравится делать интересные и современные проекты.</p>\r\n<h1>Что я умею</h1>\r\n<p>Меня привлекает Frontend разработка, это не только моя работа, но и хобби. Также знаком и могу решать не сложные задачи на Backend.</p>', '963580322.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `cat_title` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `cat_title`) VALUES
(1, 'Путешествия'),
(2, 'Покупки'),
(8, 'Заметки');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `text`, `date_time`) VALUES
(1, 16, 1, '123', '2019-03-28 20:51:21'),
(2, 16, 1, '123', '2019-03-28 20:58:06'),
(3, 16, 1, '0', '2019-03-28 20:58:14'),
(4, 16, 1, '1234567', '2019-03-28 21:13:22'),
(5, 16, 1, '12345', '2019-03-28 21:16:43'),
(6, 16, 1, 'text', '2019-03-28 21:37:15'),
(7, 15, 1, '55555', '2019-03-28 21:45:49');

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` double DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `secondname` varchar(191) DEFAULT NULL,
  `skype` varchar(191) DEFAULT NULL,
  `vkontakte` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `github` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `youtube` varchar(191) DEFAULT NULL,
  `intagram` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `email`, `phone`, `address`, `name`, `secondname`, `skype`, `vkontakte`, `facebook`, `github`, `twitter`, `youtube`, `intagram`) VALUES
(1, 'fiksik8260@gmail.com', 375291111111, 'РБ, г. Гомель', 'Алексей', 'Алексеич', 'fiksik8260111', 'https://vk.com/id459909587', '123', 'https://vk.com/id459909587', 'https://vk.com/id459909587', 'https://vk.com/id459909587', 'https://vk.com/id459909587');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `message_file_name_original` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `message_file` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `email`, `name`, `message`, `message_file_name_original`, `message_file`, `date_time`) VALUES
(1, '123@gma.ru', 'Кексик', 'test', NULL, NULL, NULL),
(2, 'velcom.ale@gmail.com', 'Russian', 'twta', 'VDmzqa8sxKg.jpg', '564254760.jpg', NULL),
(3, 'velcom.ale@gmail.com', 'Russian', 'twta', 'VDmzqa8sxKg.jpg', '142764282.jpg', NULL),
(4, 'developer8260@gmail.com', 'Алексей', '123', '27bb0b4a26b85a693d36aa77c2889524.zip', '423547363.zip', NULL),
(5, '123@gma.ru', 'Кексик', '12', '27bb0b4a26b85a693d36aa77c2889524.zip', '151498413.zip', NULL),
(6, '1251', '52151', '12515', '27bb0b4a26b85a693d36aa77c2889524.zip', '272705078.zip', NULL),
(7, '12345', 'Кексик', '1424214', '27bb0b4a26b85a693d36aa77c2889524.zip', '412698364.zip', '2019-03-29 11:25:17'),
(8, '12412412', '21414214', '41241412', 'VDmzqa8sxKg.jpg', '761871337.jpg', '2019-03-29 11:42:24');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_520_ci,
  `text` text COLLATE utf8mb4_unicode_520_ci,
  `author_id` int(11) UNSIGNED DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `post_img` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `post_img_smail` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cat` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `author_id`, `date_time`, `post_img`, `post_img_smail`, `cat`, `update_time`) VALUES
(4, 'Мой первый пост 2', 'Тест 2', 1, '2019-03-27 20:08:42', '477655029.jpg', '320-477655029.jpg', '1', NULL),
(5, 'Национальный парк Йосемити', 'Парк находится в горах Сьерра-Невада на востоке штата Калифорния и занимает огромную даже для Америки площадь, около 3000 кв. км. На этой площади расположены гранитные скальные стены огромной высоты, которыми, собственно, в первую очередь и знаменит парк, водопады, среди которых одни из самых высоких в США, три рощи гигантской секвойи — самого долгоживущего в мире дерева и самого большого по диаметру ствола, а также масса рек, озёр, лесов и лугов.\r\n\r\nЦентром парка является долина Йосемити, круглый год переполненная туристами, зато в большей части парка никаких туристов нет. Если вы хотите погулять по территории парка, к вашим услугам огромная разветвлённая система троп, по которым проложены маршруты длительностью от получаса до нескольких дней. Ко всем этим прелестям бесплатно прилагаются животные и птицы. Если, на ваше счастье, медведей вы скорее всего не увидите, то оленей или бурундуков увидите почти гарантированно, даже не обладая специальными навыками.', 1, '2019-03-27 20:13:49', '244635009.png', '320-244635009.png', '1', NULL),
(6, 'Мой первый пост c картинкой', 'Парк находится в горах Сьерра-Невада на востоке штата Калифорния и занимает огромную даже для Америки площадь, около 3000 кв. км. На этой площади расположены гранитные скальные стены огромной высоты, которыми, собственно, в первую очередь и знаменит парк, водопады, среди которых одни из самых высоких в США, три рощи гигантской секвойи — самого долгоживущего в мире дерева и самого большого по диаметру ствола, а также масса рек, озёр, лесов и лугов.\r\n\r\nЦентром парка является долина Йосемити, круглый год переполненная туристами, зато в большей части парка никаких туристов нет. Если вы хотите погулять по территории парка, к вашим услугам огромная разветвлённая система троп, по которым проложены маршруты длительностью от получаса до нескольких дней. Ко всем этим прелестям бесплатно прилагаются животные и птицы. Если, на ваше счастье, медведей вы скорее всего не увидите, то оленей или бурундуков увидите почти гарантированно, даже не обладая специальными навыками.', 1, '2019-03-27 20:18:50', '157870483.jpg', '320-157870483.jpg', '2', NULL),
(7, 'Мой первый пост c картинкой', '5555555555555555555555', 1, '2019-03-27 20:33:25', '404760742.jpg', '320-404760742.jpg', '8', NULL),
(8, 'Мой первый пост', '122', 1, '2019-03-27 20:39:47', '920486450.png', '320-920486450.png', '2', NULL),
(9, 'Парк находится в горах Сьерра-Невада на востоке штата Калифорния и занимает огромную даже для Америки площадь, около 3000 кв. км. На этой площади расположены гранитные скальные стены огромной высоты, которыми, собственно, в первую очередь и знаменит парк, водопады, среди которых одни из самых высоких в США, три рощи гигантской секвойи &mdash; самого долгоживущего в мире дерева и самого большого по диаметру ствола, а также масса рек, озёр, лесов и лугов.', 'Парк находится в горах Сьерра-Невада на востоке штата Калифорния и занимает огромную даже для Америки площадь, около 3000 кв. км. На этой площади расположены гранитные скальные стены огромной высоты, которыми, собственно, в первую очередь и знаменит парк, водопады, среди которых одни из самых высоких в США, три рощи гигантской секвойи — самого долгоживущего в мире дерева и самого большого по диаметру ствола, а также масса рек, озёр, лесов и лугов.', 1, '2019-03-27 21:19:16', '562991333.png', '320-562991333.png', '1', NULL),
(15, '123555555555555555555', '<p>123</p>\r\n', 1, '2019-03-28 18:46:10', NULL, NULL, '8', '2019-03-28 18:47:48'),
(16, 'тест444', '<p>12344</p>\r\n', 1, '2019-03-28 19:22:37', '981762695.jpg', '320-981762695.jpg', '2', '2019-03-28 19:22:57');

-- --------------------------------------------------------

--
-- Структура таблицы `skills`
--

CREATE TABLE `skills` (
  `id` int(11) UNSIGNED NOT NULL,
  `html` int(11) UNSIGNED DEFAULT NULL,
  `css` int(11) UNSIGNED DEFAULT NULL,
  `js` int(11) UNSIGNED DEFAULT NULL,
  `jquery` int(11) UNSIGNED DEFAULT NULL,
  `php` int(11) UNSIGNED DEFAULT NULL,
  `mysql` int(11) UNSIGNED DEFAULT NULL,
  `git` int(11) UNSIGNED DEFAULT NULL,
  `gulp` tinyint(1) UNSIGNED DEFAULT NULL,
  `bower` tinyint(1) UNSIGNED DEFAULT NULL,
  `webpack` tinyint(1) UNSIGNED DEFAULT NULL,
  `less` int(11) UNSIGNED DEFAULT NULL,
  `sass` tinyint(1) UNSIGNED DEFAULT NULL,
  `bootstrap` int(11) UNSIGNED DEFAULT NULL,
  `wordpress` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `skills`
--

INSERT INTO `skills` (`id`, `html`, `css`, `js`, `jquery`, `php`, `mysql`, `git`, `gulp`, `bower`, `webpack`, `less`, `sass`, `bootstrap`, `wordpress`) VALUES
(1, 90, 90, 40, 40, 70, 50, 70, 0, 0, 0, 40, 0, 40, 50);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `secondname` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `avatar_smail` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `secondname`, `city`, `country`, `avatar`, `avatar_smail`) VALUES
(1, 'fiksik8260@gmail.com', '$2y$10$jjQjywf2Id/QuL/V/iqbsewVgQqfpoozRRqcqaJNbLwgY/2dkVTbq', 'admin', 'Алексей', 'Фиксик', 'Гомель', 'Республика Беларусь', '839764404.jpg', '48-839764404.jpg'),
(3, 'test', '$2y$10$WWr3LHD4ogoVJR8c/y8iDOrLNLOQSitnhSiR9jEtayAapED6l9OEi', 'user', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'velcom.ale@gmail.com', '$2y$10$t5JYC20zOShNmGm6WkzZMOMxJZ3kPLNYPcAZzTy97.55gXjsx.fd2', 'admin', 'Админ', 'Админыч', '', '', NULL, NULL),
(7, 'developer8260@gmail.com', '$2y$10$M5PbAvwLdrXAb7ZXcNnvou/1cWAp/WziwJ4m5gUPr0Hg3hhabG25y', 'user', 'Кексик', 'Фиксик', 'Москва', 'Россия', '184237670.jpg', '48-184237670.jpg'),
(8, '123', '$2y$10$aJe.BEk7cNb3r88OJ/Dkl.jKLSeuxFnsQ9Y0bIWRzn9uyppejBKDi', 'user', NULL, NULL, NULL, NULL, NULL, NULL),
(9, '123@gma.ru', '$2y$10$DnOXdlOnG1ec9v0SzyYoaOBjb/Pj7FoiQlantXVw17da06r208Bjq', 'user', 'aleksey_an', 'Пользователь', 'папуасы', 'Африка', NULL, NULL),
(10, 'dev123@gmail.com', '$2y$10$GWIWSbk2D0vpdmL56ykvOuNN9DqPgBv156QWEhLxfZKmBFxNPDcu6', 'user', 'Кексик', 'Пользователь', '', '', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_comments_post` (`post_id`),
  ADD KEY `index_foreignkey_comments_user` (`user_id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_posts_author` (`author_id`);

--
-- Индексы таблицы `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
