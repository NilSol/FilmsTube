-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 06 2018 г., 15:49
-- Версия сервера: 10.1.28-MariaDB
-- Версия PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kinomonster`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Фильмы'),
(2, 'Сериалы');

-- --------------------------------------------------------

--
-- Структура таблицы `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `movie_id` int(255) NOT NULL,
  `comment_text` text NOT NULL,
  `banned` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `movie_id`, `comment_text`, `banned`) VALUES
(1, 7, 605, 'пойдет', 0),
(2, 8, 605, 'норм', 0),
(3, 8, 600, 'норм', 0),
(4, 5, 605, 'Хороший', 1),
(5, 5, 605, 'Нормальный', 0),
(6, 5, 605, 'jl;l\\;\'okpok', 0),
(7, 5, 655, 'gbvhjhjhkm', 0),
(8, 5, 655, 'fjghjghj', 0),
(9, 5, 612, 'Оскар дать нужно!', 0),
(10, 7, 612, 'Уже', 0),
(11, 7, 612, 'Тест', 0),
(12, 5, 612, 'Хорошо!', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `movie`
--

CREATE TABLE `movie` (
  `id` int(5) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `descriptions` text NOT NULL,
  `year` int(4) NOT NULL,
  `rating` float(3,1) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `player_code` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `add_date` datetime NOT NULL,
  `category_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `movie`
--

INSERT INTO `movie` (`id`, `slug`, `name`, `descriptions`, `year`, `rating`, `poster`, `player_code`, `director`, `add_date`, `category_id`) VALUES
(605, 'joy', 'Джой', 'Волнующая история четырех поколений семьи. В центре сюжета — девушка Джой, превращающаяся в женщину, которая становится основательницей бизнес-династии и ее главой. Предательство и измена, потеря невинности и шрамы любви открывают дорогу в эмоциональную комедию о том, как стать истинным лидером семьи, и о том, как любое предприятие неумолимо сталкивается с миром коммерции. Союзники и противники меняются местами как внутри, так и вне семьи, и только внутренние переживания и неистовое воображение Джой помогают ей пройти через поджидающие ее жизненные бури.', 2015, 6.0, 'http://c.cinemate.cc/media/m/4/5/154054/0.big.jpg', 'https://www.youtube.com/embed/uR-2TiQVY-k?showinfo=0', 'Дэвид О. Расселл', '2015-12-05 17:50:27', 1),
(606, 'by-the-sea', 'Лазурный берег', 'Франция. Середина 1970-х. Ванесса, бывшая танцовщица, и ее муж Роланд, американский писатель, путешествуют вместе по стране. Понемногу они начинают отдаляться друг от друга, но все меняется, когда они задерживаются в одном тихом приморском городке…', 2015, 5.8, 'http://c.cinemate.cc/media/m/3/1/159513/0.big.jpg', 'https://www.youtube.com/embed/vUFZOO9zO0Q?showinfo=0', 'Анджелина Джоли', '2015-12-05 17:50:27', 1),
(607, 'concussion', 'Сотрясение', '42-летняя Эбби — состоятельная лесбиянка. У нее и ее супруги двое детей, и у них отличная семья. Но в один прекрасный день она получает травму головы, играя с детьми в бейсбол, и после этого все пошло наперекосяк…', 2015, 5.5, 'http://c.cinemate.cc/media/m/9/4/157449/0.big.jpg', 'https://www.youtube.com/embed/Io6hPdC41RM?showinfo=0', 'Стэйси Пассон', '2015-12-05 17:50:27', 1),
(608, 'the-boy', 'Кукла', 'Тед Хенли живет со своим отцом в их придорожном мотеле на пустынном участке дороги. Отец зарабатывает себе на крошечное пособие, собирая различный мусор вдоль шоссе. Но когда проблема с наличными дает о себе знать, Тед находит необычное занятие.', 2015, 5.3, 'http://c.cinemate.cc/media/m/7/6/159067/0.big.jpg', 'https://www.youtube.com/embed/yPxybc_aJWU?showinfo=0', 'Крэйг Уилльям Макнейлл', '2015-12-05 17:50:27', 1),
(609, 'the-finest-hours', 'И грянул шторм', 'Сюжет фильма основан на реальных событиях, произошедших в 1952 году, когда сотрудники береговой охраны в самый разгар шторма, используя деревянные моторные лодки, пытались спасти экипаж двух нефтяных танкеров.', 2015, 7.5, 'http://c.cinemate.cc/media/m/8/9/159198/0_1.big.jpg', 'https://www.youtube.com/embed/-1QOTS-OkIg?showinfo=0', 'Крэйг Гиллеспи', '2015-12-05 17:50:27', 1),
(610, 'exposed', 'Дочь Бога', 'С женщиной, которая стала свидетелем чуда, начинают происходить странные вещи. А в это время полицейский детектив пытается разобраться в том, что привело к смерти его напарника.', 2016, 4.8, 'http://c.cinemate.cc/media/m/2/7/159272/0.big.jpg', 'https://www.youtube.com/embed/sutfsWmgWgs?showinfo=0', 'Деклан Дэйл', '2015-12-05 17:50:27', 1),
(611, 'the-danish-girl', 'Девушка из Дании', 'Действие происходит в 1920-х годах в Копенгагене. Иллюстратор и художник Герда Вегенер просит своего мужа Эйнара Вегенера попозировать в качестве женской модели. Портреты приобретают популярность и Герда продолжает писать картины со своим мужем в качестве женщины. Эйнару нравится собственная женская внешность и он начинает жить под именем Лили Эльбе. Впоследствии Эльбе становится первым человеком, прошедшим хирургическую коррекцию пола.', 2015, 6.9, 'http://c.cinemate.cc/media/m/8/8/159788/0.big.jpg', 'https://www.youtube.com/embed/9VF3-6Odwu4?showinfo=0', 'Том Хупер', '2015-12-05 17:50:27', 1),
(612, 'the-revenant', 'Выживший', 'Охотник Хью Гласс серьезно ранен на неизведанных просторах американского Дикого Запада. Товарищ Хью по отряду покорителей новых земель Джон Фицжеральд предательски оставляет его умирать в одиночестве. Теперь у Гласса осталось только одно оружие — его сила воли. Он готов бросить вызов первобытной природе, суровой зиме и враждебным племенам индейцев, только чтобы выжить и отомстить Фицжеральду!', 2015, 10.0, 'http://c.cinemate.cc/media/m/0/9/155290/0.big.jpg', 'https://www.youtube.com/embed/QRfj1VCg16Y?showinfo=0', 'Алехандро Гонсалес Иньярриту', '2016-01-12 17:50:27', 1),
(613, 'sisters', 'Сестры', 'Две сестры решают устроить одну последнюю вечеринку в их семейном доме, прежде чем родители продадут его.', 2015, 5.8, 'http://c.cinemate.cc/media/m/0/1/153610/0_1.big.jpg', 'https://www.youtube.com/embed/vRnhEjP3R-c?showinfo=0', 'Джейсон Мур', '2015-12-05 17:50:27', 1),
(614, 'creed', 'Крид: Наследие Рокки', 'В центре внимания сын Аполло Крида — первого серьезного соперника Рокки Бальбоа на ринге, впоследствии ставшего лучшим другом героя. Талант отца в какой-то момент проявляется и в Криде-младшем, и юноша отправляется на поиски наставника, коим для него в итоге становится постаревший Рокки, тоже не слишком жаждущий возвращаться к старым делам. Даже в качестве тренера.', 2015, 7.3, 'http://c.cinemate.cc/media/m/5/7/157775/0_qHqshz3.big.jpg', 'https://www.youtube.com/embed/Uv554B7YHk4?showinfo=0', 'Райан Куглер', '2015-12-05 17:50:27', 1),
(615, 'alvin-and-the-chipmunks-the-road-chip', 'Элвин и бурундуки: Грандиозное бурундуключение', 'Бурундуки пойдут на всё, чтобы сохранить свою семью, даже на грандиозное бурундуключение по всей Америке!  Когда Бурундуки видят, что Дэйв берет с собой коробочку с кольцом в поездку в Майами, они отчаянно пытаются помешать ему сделать предложение его девушке — из опасения, что мачеха и сводный брат внесут перемены в их семейную идиллию. Но после того, как их помещают в черный список за хулиганское поведение в самолете, Элвин, Саймон, Теодор и их будущий брат Майлз отправляются в самое важное путешествие в их жизни через всю страну, чтобы успеть помешать помолвке.', 2015, 6.1, 'http://c.cinemate.cc/media/m/5/7/137475/0.big.jpg', 'https://www.youtube.com/embed/xA6cOSEZhzM?showinfo=0', 'Уолт Бекер', '2015-12-05 17:50:27', 1),
(616, 'steve-jobs', 'Стив Джобс', 'История жизни одного из самых выдающихся умов планеты, основателя компании Apple, Стива Джобса.', 2015, 6.6, 'http://c.cinemate.cc/media/m/1/7/157771/0_RfDTyDZ.big.jpg', 'https://www.youtube.com/embed/aEr6K1bwIVs?showinfo=0', 'Дэнни Бойл', '2015-12-05 17:50:27', 1),
(617, 'krampus', 'Крампус', 'История о демоне, который во время Рождества выискивает непослушных детей, чтобы наказать их.', 2015, 5.9, 'http://c.cinemate.cc/media/m/3/7/157773/0.big.jpg', 'https://www.youtube.com/embed/h6cVyoMH4QE?showinfo=0', 'Майкл Догерти', '2015-12-05 17:50:27', 1),
(618, 'point-break', 'На гребне волны', 'Джонни — молодой агент ФБР, специализирующийся на работе под прикрытием. Он не раз выходил из самых сложных ситуаций, всегда доделывая свою работу до конца. Его очередным заданием становится проникновение в банду воров. Однако эти люди не обычные грабители: их главным отличием от остальных является увлечение экстремальными видами спорта. Свои умения они используют при каждом новом ограблении, и стать частью их команды очень непросто. Чтобы войти в банду и остановить преступников, Джонни придется доказать, что он такой же как они, а для этого ему не раз предстоит рискнуть собственной жизнью…', 2015, 7.1, 'http://c.cinemate.cc/media/m/6/0/155006/0.big.jpg', 'https://www.youtube.com/embed/ncvFAm4kYCo?showinfo=0', 'Эриксон Кор', '2015-12-05 17:50:27', 1),
(619, 'dekiru-the-three-stones', 'Декиру: Магические камни', 'Главный герой отправляется в путешествие, чтобы найти три магических камня, которые способны остановить надвигающуюся угрозу и спасти мир от уничтожения.', 2015, 0.0, 'http://c.cinemate.cc/media/m/5/8/159885/0.big.jpg', 'https://www.youtube.com/embed/G5whoJ2GLUA?showinfo=0', 'Fred Grant', '2015-12-05 17:50:27', 1),
(620, 'masterminds', 'Зачинщики', 'Бывший клерк банка вместе со своей любовницей проворачивает дерзкое ограбление инкассаторской машины и забирает 17 миллионов баксов. Но по неопытности преступники-дебютанты оставляют на месте преступления столько следов и улик, что вряд ли смогут получить удовольствие от добычи.', 2016, 4.8, 'http://c.cinemate.cc/media/m/5/3/153535/0.big.jpg', 'https://www.youtube.com/embed/onOblb6W_yw?showinfo=0', '	Джаред Хесс', '2015-12-05 17:50:27', 1),
(621, 'love-the-coopers', 'Любите Куперов', 'Феерическая рождественская комедия о том, что бывает, когда на праздник собираются представители четырех поколений одной большой семьи…', 2015, 6.4, 'http://c.cinemate.cc/media/m/2/6/159062/0.big.jpg', 'https://www.youtube.com/embed/-TSX_0rwPNc?showinfo=0', 'Джесси Нельсон', '2015-12-05 17:50:27', 1),
(622, 'star-wars', 'Звёздные войны: Пробуждение силы', 'Через тридцать лет после гибели Дарта Вейдера и Императора галактика по-прежнему в опасности. Государственное образование Первый Орден во главе с их таинственным верховным лидером Сноуком и его правой рукой Кайло Реном идёт по стопам Империи, пытаясь захватить всю власть. В это нелёгкое время судьба сводит юную девушку Рей и бывшего штурмовика Первого Ордена Финна с героями времён войны с Империей — Ханом Соло, Чубаккой и генералом Леей. Вместе они должны дать бой Первому Ордену, однако настаёт тот момент, когда становится очевидно, что лишь джедаи могут остановить Сноука и Кайло Рена. И в галактике в живых остаётся только один…', 2015, 7.0, 'http://c.cinemate.cc/media/m/6/8/120786/0.big.jpg', 'https://www.youtube.com/embed/gAUxw4umkdY?showinfo=0', 'Джей Джей Абрамс', '2015-12-05 17:50:27', 1),
(623, 'the-night-before', 'Рождество', 'История о веселых приключениях трех старых друзей, отправившихся на поиски лучшей рождественской вечеринки в Нью-Йорке…', 2015, 6.7, 'http://c.cinemate.cc/media/m/7/3/156737/0.big.jpg', 'https://www.youtube.com/embed/ocjpSBMNyoU?showinfo=0', 'Джонатан Левин', '2015-12-05 17:50:27', 1),
(624, 'solace', 'Утешение', 'Напарники, Джо и Кэтрин, детективы из ФБР расследуют череду загадочных убийств. Все преступления объединяет нечто сверхъестественное — серийный убийца всегда на шаг впереди лучших сыщиков. Тогда на помощь правосудию приходит отставной аналитик спецслужб доктор Джон Кленси. Его исключительная интуиция и интеллект могут помочь поймать убийцу, но вскоре Джон понимает — его соперник значительно превосходит его в способностях.', 2015, 6.5, 'http://c.cinemate.cc/media/m/2/6/157762/0.big.jpg', 'https://www.youtube.com/embed/yiH5V5psa7M?showinfo=0', 'Афонсо Пойарт', '2015-12-05 17:50:27', 1),
(625, 'in-the-heart-of-the-sea', 'В сердце моря', 'В 1819 году американский корабль «Эссекс» с командой из двух десятков человек на борту отправился из порта в штате Массачусетс на китобойный промысел. Осенью 1820-го успешная на протяжении полутора лет охота была прервана атакой гигантского кашалота на судно, в результате чего морякам пришлось пересесть в шлюпки. В течение трех с лишним месяцев они боролись за выживание посреди океана…', 2015, 7.4, 'http://c.cinemate.cc/media/m/6/9/154996/0.big.jpg', 'https://www.youtube.com/embed/4Atz6dfryss?showinfo=0', 'Рон Ховард', '2015-12-05 17:50:27', 1),
(626, 'bridge-of-spies', 'Шпионский мост', 'Действие фильма происходит на фоне серии реальных исторических событий и рассказывает о бруклинском адвокате Джеймсе Доноване, который оказывается в эпицентре холодной войны, когда ЦРУ отправляет его на практически невозможное задание — договориться об освобождении захваченного в СССР американского пилота самолета-разведчика U2.', 2015, 7.6, 'http://c.cinemate.cc/media/m/0/1/155010/0.big.jpg', 'https://www.youtube.com/embed/jxUk1RsajcI?showinfo=0', 'Стивен Спилберг', '2015-12-05 17:50:27', 1),
(627, 'goosebumps', 'Ужастики', 'Кошмары бывают разные. Вечно голодные оборотни, плохо воспитанные зомби, агрессивные садовые гномы и даже гигантский неуравновешенный снежный человек…  Все эти фантастические монстры и монстрики многие годы магическим образом удерживались на страницах знаменитых бестселлеров «Ужастики», пока по воле случая их не выпустили на свободу в реальный мир.', 2015, 6.1, 'http://c.cinemate.cc/media/m/4/8/155284/0_VvqPtmT.big.jpg', 'https://www.youtube.com/embed/7Cn716jv61s?showinfo=0', 'Роб Леттерман', '2015-12-05 17:50:27', 1),
(628, 'the-good-dinosaur', 'Хороший динозавр', 'По сюжету динозавры не вымерли, а эволюционировали в разумных существ и живут и здравствуют на Земле. А вот люди остались на довольно примитивной стадии развития. Фильм расскажет историю дружбы динозавра и маленького мальчика.', 2015, 7.0, 'http://c.cinemate.cc/media/m/4/7/137474/0.big.jpg', 'https://www.youtube.com/embed/O-RgquKVTPE?showinfo=0', 'Питер Сон', '2015-12-05 17:50:27', 1),
(629, 'sicario', 'Убийца', 'На американо-мексиканской границе женщина-полицейский сопровождает двух рейнджеров, которые преследуют наркобарона. Она не подозревает, что по ту сторону границы есть тайное место, где не действуют никакие законы и царят насилие и разврат.', 2015, 7.1, 'http://c.cinemate.cc/media/m/1/2/158621/0.big.jpg', 'https://www.youtube.com/embed/kuCddASCWyo?showinfo=0', 'Дени Вильнёв', '2015-12-05 17:50:27', 1),
(655, 'quantico', 'База Куантико', 'Шесть совершенно разных новобранцев поступают на стажировку в ФБР на базу Куантико в штате Вирджиния. Базой руководит Миранда Шоу, первая женщина на высшей должности в ФБР. Миранда объединяется со своим бывшим партнером, Лиамом О`Коннором, который ныне работает советником, чтобы отобрать лучших новобранцев в агенты. Тем не менее в будущем один из новобранцев будет подозреваемым в планировании крупнейшего с 11 сентября террористического акта по Нью-Йорку.', 2015, 7.5, 'http://c.cinemate.cc/media/m/9/6/159969/0.big.jpg', 'https://www.youtube.com/embed/wJp-BZpVBPA?showinfo=0', 'Марк Манден', '2015-12-05 17:50:41', 2),
(656, 'secrets-and-lies', 'Тайны и ложь', 'После того, как Бен Кроуфорд нашел тело соседского мальчика в лесу, его начинают подозревать в убийстве. Детектив Андреа Корнелл пытается докопаться до истины. Все тайны и ложь городка, где произошел инцидент, всплывут на поверхность, а жизнь семьи Бена будет перевернута вверх дном…', 2015, 7.5, 'http://c.cinemate.cc/media/m/3/6/157863/0.big.jpg', 'https://www.youtube.com/embed/84LUUehDMB4?showinfo=0', 'Тимоти Басфилд', '2015-12-05 17:50:41', 2),
(657, 'miles-from-tomorrowland', 'Майлз с другой планеты', 'Знакомьтесь с юным любителем приключений Майлзом Каллисто и его необычной семьей! Мама парнишки — пилот космического корабля, папа — инженер-механик, а старшая сестра — настоящая всезнайка в области различных технологий. Вместе с ними и домашним питомцем, роботом-страусом Мёрком, Майлз путешествует по просторам вселенной и исследует неизведанные миры. В эпизодах познавательного мультсериала юных телезрителей ждут удивительные открытия!', 2015, 8.0, 'http://c.cinemate.cc/media/m/5/7/158275/0.big.jpg', 'https://www.youtube.com/embed/r59DjoDB-5Q?showinfo=0', 'Пол Димайер', '2015-12-05 17:50:41', 2),
(658, 'fear-the-walking-dead', 'Бойтесь ходячих мертвецов', 'Действия сериала происходят параллельно с событиями зомби-апокалипсиса, показанными в сериале «Ходячие мертвецы», но в совершенно другом месте — Лос-Анджелесе. В центре сюжета находится семья матери-одиночки и консультанта по профессиям Мэдисон Кларк и разведённого учителя Трэвиса Манавы, которые вместе пытаются выжить в зомби-апокалипсисе.', 2015, 7.0, 'http://c.cinemate.cc/media/m/2/5/159652/0.big.jpg', 'https://www.youtube.com/embed/yzXglr5bc3w?showinfo=0', 'Адам Дэвидсон', '2015-12-05 17:50:41', 2),
(659, 'show-me-a-hero', 'Покажите мне героя', 'Молодой мэр вынужден построить жилье для малообеспеченных слоев населения в престижном районе города по распоряжению федерального суда. Это решение поставило крест на его политической карьере и стало причиной волны недовольства горожан, которое вылилось в протесты и беспорядки на улицах города.', 2015, 7.3, 'http://c.cinemate.cc/media/m/9/9/159599/0.big.jpg', 'https://www.youtube.com/embed/0FPIflcWIOk?showinfo=0', 'Пол Хаггис', '2015-12-05 17:50:41', 2),
(660, 'k-c-undercover', 'Кей Си. Под прикрытием', 'Кей Си Купер — простая девочка-подросток, которая учится в обычной школе. Но вот она узнаёт, что её родители — профессиональные шпионы. И ей ничего больше не остаётся, как пойти по их стопам…', 2015, 6.1, 'http://c.cinemate.cc/media/m/0/4/159640/0.big.jpg', 'https://www.youtube.com/embed/_4tynKL-zyM?showinfo=0', 'Джонатан А. Розенбаум', '2015-12-05 17:50:41', 2),
(661, 'big-giant-swords', 'Гигантские мечи', 'Майк Крохвэлл и его команда славятся производством невероятного холодного оружия, способного уничтожить все на своем пути. Наши эксцентричные герои живут и работают на острове Мартас-Винъярд, где делают уникальные огромные мечи самых невообразимых форм. В этом сезоне Майк изготовит меч в виде кита и случайно подожжет сам себя во время испытаний оружия.', 2015, 8.0, 'http://c.cinemate.cc/media/m/7/9/159297/0.big.jpg', 'https://www.youtube.com/embed/iwM7GaXXtcA?showinfo=0', 'Discovery', '2015-12-05 17:50:41', 2),
(662, 'ballers', 'Футболисты', 'Сюжет сериала разворачивается вокруг группы футболистов, их семей, друзей и тренеров.', 2015, 7.1, 'http://c.cinemate.cc/media/m/7/1/159017/0.big.jpg', 'https://www.youtube.com/embed/go_V0xBH2TY?showinfo=0', 'Джулиан Фарино', '2015-12-05 17:50:41', 2),
(663, 'the-brink', 'На грани', 'Правительство и армия США пытаются предотвратить Третью мировую войну, в то время как в мире царит геополитический кризис.', 2015, 7.9, 'http://c.cinemate.cc/media/m/8/1/159018/0.big.jpg', 'https://www.youtube.com/embed/z9SJxSXySSo?showinfo=0', 'Майкл Леманн', '2015-12-05 17:50:41', 2),
(664, 'the-whispers', 'Шёпот', 'В центре сюжета находится агент ФБР Клэр Бенниган, расследующая дело шестилетней девочки, которая чуть не убила свою мать, в ходе чего история приобретает неожиданный поворот — Клэр узнает о существовании неведомой силы, манипулирующей детьми…', 2015, 6.8, 'http://c.cinemate.cc/media/m/4/1/158814/0.big.jpg', 'https://www.youtube.com/embed/DMG9TMnJfOs?showinfo=0', 'Чарльз Бисон', '2015-12-05 17:50:41', 2),
(665, 'harvey-beaks', 'Харви Бикс', 'История невероятной дружбы Харви, Фи и Фу. И если сам Харви никогда не нарушает правил, то его приятели, наоборот, никаких правил не признают. Действие нового шоу разворачивается в магическом лесу, где и происходят бесшабашные приключения милой птички Харви и двух его лучших друзей. Дружба между Харви, Фи и Фу только крепнет от серии к серии, и вместе им придётся немало повеселиться.', 2015, 6.8, 'http://c.cinemate.cc/media/m/9/3/158939/0_1.big.jpg', 'https://www.youtube.com/embed/XgBUo2eFUXY?showinfo=0', 'Дерек Эваник', '2015-12-05 17:50:41', 2),
(666, 'aquarius', 'Водолей', 'История о полицейских, которые работают под прикрытием, пытаясь выследить Чарльза Мэнсона и его секту под названием «Семья» до того, как они совершат ряд жестоких убийств.', 2015, 6.8, 'http://c.cinemate.cc/media/m/1/5/158751/0.big.jpg', 'https://www.youtube.com/embed/sFP-hW7JpUQ?showinfo=0', 'Джонас Пейт', '2015-12-05 17:50:41', 2),
(667, 'wayward-pines', 'Сосны', 'Агент секретной службы Итан Берк приезжает в пасторальный городок Уэйуорд Пайнс в Айдахо, чтобы найти двух пропавших фэбээровцев. Но расследование вместо ответов приносит лишь новые вопросы. Что же происходит в Уэйуорд Пайнс?', 2015, 7.2, 'http://c.cinemate.cc/media/m/0/0/157700/0_1.big.jpg', 'https://www.youtube.com/embed/RsQ9Fl0VCkk?showinfo=0', 'Зал Батманглидж', '2015-12-05 17:50:41', 2),
(668, 'happyish', 'Типа счастье', 'В культуре, которая чтит молодое поколение, Тому необходимо выяснить, что же является его целью теперь, когда он находится на полпути к смерти и никому не интересно то, о чем он думает…', 2015, 7.4, 'http://c.cinemate.cc/media/m/4/2/158424/0.big.jpg', 'https://www.youtube.com/embed/oZzsRNBq42Q?showinfo=0', 'Кен Куопис', '2015-12-05 17:50:41', 2),
(669, 'bella-and-the-bulldogs', 'Белла и Бульдоги', 'Школьница Белла Доусон уходит из группы поддержки и становится новым защитником футбольной команды «Бульдоги». Променяв помпоны на мяч, она наконец исполняет свою давнюю мечту — играть в футбол! Но как совместить тренировки на поле и общение с лучшими подружками-чирлидершами? Удастся ли Белле преуспеть в спорте и не растерять друзей?', 2015, 5.3, 'http://c.cinemate.cc/media/m/7/0/160007/0.big.jpg', 'https://www.youtube.com/embed/CVdxMzRQk5A?showinfo=0', 'Шон К. Ламберт', '2015-12-05 17:50:41', 2),
(670, 'battle-creek', 'Батл Крик', 'Два детектива с разными взглядами на мир объединяются, чтобы очистить улицы Батл Крика, используя цинизм, коварство и обман…', 2015, 7.0, 'http://c.cinemate.cc/media/m/0/3/157830/0.big.jpg', 'https://www.youtube.com/embed/6whby3eS8vw?showinfo=0', 'Эндрю Бернштейн', '2015-12-05 17:50:41', 2),
(671, 'better-call-saul', 'Лучше звоните Солу', 'История об испытаниях и невзгодах, которые приходится преодолеть Солу Гудману, адвокату по уголовным делам, в тот период, когда он пытается открыть свою собственную адвокатскую контору в Альбукерке, штат Нью-Мексико.', 2015, 8.2, 'http://c.cinemate.cc/media/m/0/2/157520/0.big.jpg', 'https://www.youtube.com/embed/lK_70f7PamE?showinfo=0', 'Лариса Кондрацки', '2015-12-05 17:50:41', 2),
(672, 'togetherness', 'Вместе', 'История о том, как супружеская пара с маленькими детьми и кучей проблем подселила к себе двух великовозрастных лузеров. Если личную жизнь не получается наладить вдвоем, может вчетвером выйдет?', 2015, 6.6, 'http://c.cinemate.cc/media/m/1/6/156961/0.big.jpg', 'https://www.youtube.com/embed/IBt3XoWxvOo?showinfo=0', 'Джей Дюпласс', '2015-12-05 17:50:41', 2),
(673, 'empire', 'Империя', 'История о главе музыкальной империи, который узнает о том, что он неизлечимо болен и что жить ему осталось всего три года. Он желает, чтобы его империя продолжала жить и после него, и потому решает выбрать наследника. Его трое сыновей и бывшая жена начинают борьбу за «трон».', 2015, 7.8, 'http://c.cinemate.cc/media/m/5/8/156885/0.big.jpg', 'https://www.youtube.com/embed/dBzu_jKLJek?showinfo=0', 'Санаа Хамри', '2015-12-05 17:50:41', 2),
(674, 'the-astronaut-wives-club', 'Клуб жён астронавтов', 'В 1960-х началась эра покорения космоса. Поэтому все мальчики рвались стать астронавтами. Поэтому целое поколение людей во всем мире жили в эйфории, где можно свершить подвиг и слетать в космическое пространство. В то время стать женой астронавта, была мечтой всех девушек, так как это считалось крайне престижным, так как в ту пору, космонавты имели большую популярность, чем первые лица государства.', 2015, 6.5, 'http://c.cinemate.cc/media/m/1/8/158981/0.big.jpg', 'https://www.youtube.com/embed/dKMDli5b3W8?showinfo=0', 'Джон Эмиел', '2015-12-05 17:50:41', 2),
(675, 'unreal', 'Нереально', 'Сериал дает нам возможность взглянуть на абсурд и ужас закулисья реалити-шоу. На съемочной площадке вымышленного шоу Everlasting, сериальной версии реального шоу «Холостяк», участницы в попытке устранить конкуренток предлагают секс, молодую женщину фактически держат заложницей на съемочной площадке, пока у нее дома разворачивается семейная трагедия, а афроамериканкам сообщают, что они останутся в шоу только при условии следования расистским стереотипам…', 2015, 7.3, 'http://c.cinemate.cc/media/m/2/8/158982/0.big.jpg', 'https://www.youtube.com/embed/BU7AjoWGHwc?showinfo=0', 'Питер О’Фаллон', '2015-12-05 17:50:41', 2),
(676, 'the-odd-couple', 'Странная парочка', 'Два друга пытаются жить в одной квартире, но их подход к ведению домашнего хозяйства и образ жизни такие же разные, как день и ночь.', 2015, 6.5, 'http://c.cinemate.cc/media/m/5/1/157715/0.big.jpg', 'https://www.youtube.com/embed/H8lY2kLmnbQ?showinfo=0', 'Фил Льюис', '2015-12-05 17:50:41', 2),
(677, 'you-me-and-the-apocalypse', 'Ты, я и конец света', 'Когда группа обычных людей узнаёт о комете, диаметром в тринадцать километров, которая летит навстречу Земле, они спускаются под город Слау, чтобы наблюдать за концом света по телевизору. Но кто эти люди, и как пересеклись их пути?', 2015, 7.5, 'http://c.cinemate.cc/media/m/0/2/160020/0.big.jpg', 'https://www.youtube.com/embed/nnFTbj7QyBE?showinfo=0', 'Сауль Метцштайн', '2015-12-05 17:50:41', 2),
(678, 'catching-monsters', 'Крупный улов', 'Каждую осень храбрая группа рыбаков оставляет своих близких и свои рабочие места. В течение шести недель, чтобы преследовать монстров глубокого океан. В них несгибаемая сила, чтобы бороться и побеждать в схватке с монстром под 500 килограмм и стоимостью до 30 000 долларов.', 2015, 7.2, 'http://c.cinemate.cc/media/m/4/2/160024/0.big.jpg', 'https://www.youtube.com/embed/8cadxeA__v4?showinfo=0', 'Discovery', '2015-12-05 17:50:41', 2),
(679, 'american-odyssey', 'Американская одиссея', 'Бедствующая женщина-солдат, разочарованный корпоративный юрист и презираемый политический деятель оказываются вовлечены в международный заговор.', 2015, 6.9, 'http://c.cinemate.cc/media/m/3/3/158233/0.big.jpg', 'https://www.youtube.com/embed/7PYepYHaitg?showinfo=0', 'Джон Джонс', '2015-12-05 17:50:41', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` tinyint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `slug`) VALUES
(1, 'Новость 1', 'Это текст новости 1', 'news-1'),
(2, 'Новость 2', 'Текст новости 2', 'news-2'),
(3, 'Новость 3', 'Текст новости 3', 'news-3');

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `data` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` tinyint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `slug`) VALUES
(1, 'Как снимали Интерстеллар', '45 лет исполнилось Кристоферу Нолану — одному из самых успешных режиссеров нашего времени, чьи работы одинаково любимы как взыскательными критиками, так и простыми зрителями. Фильмом изначально занималась студия Paramount. Когда Кристофер Нолан занял место режиссера, студия Warner Bros., которая выпускала его последние фильмы, добилась участия в проекте', 'posts-1'),
(2, 'Актер Том Хенкс поделился впечатлением о фестивале', '16 февраля в Лондоне состоялась 67-я церемония вручения наград Британской киноакадемии. Леонардо ДиКаприо, Брэд Питт, Анджелина Джоли, Кейт Бланшетт, Хелен Миррен, Эми Адамс, Кристиан Бэйл, Альфонсо Куарон и другие гости и победители премии — в нашем репортаже. ', 'posts-2'),
(3, 'Леонардо ДиКаприо вручили Оскар', 'Главная интрига предстоящей церемонии вручения \"Оскара\" понятна уже сейчас: вся планета гадает, получит или не получит Леонардо ДиКаприо свою первую статуэтку.', 'posts-3');

-- --------------------------------------------------------

--
-- Структура таблицы `rating`
--

CREATE TABLE `rating` (
  `id` int(255) NOT NULL,
  `movie_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `rating_num` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `rating`
--

INSERT INTO `rating` (`id`, `movie_id`, `user_id`, `rating_num`) VALUES
(1, 622, 8, 7),
(2, 628, 8, 7),
(3, 657, 8, 8),
(4, 605, 8, 6),
(5, 612, 5, 10),
(6, 612, 7, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `parent_id`, `name`) VALUES
(1, 0, 'User'),
(2, 0, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '1',
  `username` varchar(25) COLLATE utf8_bin NOT NULL,
  `password` varchar(75) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `newpass` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `newpass_key` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `newpass_time` datetime DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `username`, `password`, `email`, `banned`, `ban_reason`, `newpass`, `newpass_key`, `newpass_time`, `last_ip`, `last_login`, `created`, `modified`) VALUES
(5, 2, 'admin', '$2y$10$Mc0JAYfEVfvkb07qe3EmhOULlR.A9TLpzi5BK4j1/q6VrMiZrJ1he', 'admin@test.com', 0, NULL, NULL, NULL, NULL, '127.0.0.1', '2018-06-06 15:10:03', '2016-01-08 14:37:09', '2018-06-06 13:10:03'),
(7, 1, 'user', '$2y$10$.0/HYgD.XMnjGOs2lEH79.5LHqFb.Vun2A7V7Y5Cm1UpWU1Z/.NT.', 'user@test.com', 0, NULL, NULL, NULL, NULL, '127.0.0.1', '2018-05-20 13:06:56', '2016-01-08 14:46:36', '2018-05-20 11:06:56');

-- --------------------------------------------------------

--
-- Структура таблицы `user_autologin`
--

CREATE TABLE `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `user_profile`
--

INSERT INTO `user_profile` (`id`, `user_id`, `country`, `website`) VALUES
(4, 5, NULL, NULL),
(6, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_temp`
--

CREATE TABLE `user_temp` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(75) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `activation_key` varchar(75) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_autologin`
--
ALTER TABLE `user_autologin`
  ADD PRIMARY KEY (`key_id`,`user_id`);

--
-- Индексы таблицы `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_temp`
--
ALTER TABLE `user_temp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=680;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` tinyint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` tinyint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `user_temp`
--
ALTER TABLE `user_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
