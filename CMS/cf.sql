-- filepath: c:\xampp\htdocs\CMS\cf.sql
--
-- Database: `cms`
-- RaccoonArcade - Digital Games Store
-- --------------------------------------------------------

-- Create and select database
CREATE DATABASE IF NOT EXISTS `cms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `cms`;

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `title`, `summary`, `content`, `created`, `category_id`, `member_id`, `image_id`, `published`) VALUES
-- Co-op Games (category_id = 1)
(1, 'It Takes Two', 'A co-op platformer about a couple saving their relationship', 'It Takes Two is a genre-defying platform game made purely for co-op. Play as the estranged couple Cody and May, two people on the brink of divorce who are magically transformed into dolls. Trapped in a fantastical world controlled by the power of their daughter''s wish, they are reluctantly challenged to save their relationship. Filled with a huge variety of gleefully disruptive gameplay challenges, It Takes Two takes co-operative play to a whole new level.', '2024-01-10 10:00:00', 1, 1, 1, 1),
(2, 'Overcooked! 2', 'A chaotic co-op cooking game for up to 4 players', 'Overcooked! 2 is a frantic co-op cooking game where players must work together to prepare, cook, and serve up a variety of tasty orders before the timer runs out. Travel through a variety of cruel and unusual kitchens, from fiery trucks to flying hot air balloons. Throw and catch ingredients across kitchens as you try to master new recipes and keep your customers satisfied.', '2024-01-11 10:00:00', 1, 1, 2, 1),
(3, 'A Way Out', 'A co-op only prison break and action adventure game', 'A Way Out is an exclusively co-op adventure where you play the roles of Leo and Vincent, two prisoners who must escape from prison and go on the run from the authorities. This genre-bending experience lets two players share the same journey together, switching seamlessly between action, adventure, and mini-games with a gripping story at its heart.', '2024-01-12 10:00:00', 1, 2, 3, 1),
(4, 'Left 4 Dead 2', 'A co-op survival shooter set during a zombie apocalypse', 'Left 4 Dead 2 is a co-operative action horror game set during the immediate aftermath of a zombie apocalypse. Play as one of four survivors as you fight through five campaigns across the American South. With an AI Director that tailors the experience to your team''s performance, no two playthroughs are the same. Includes an improved version of the original game''s campaigns.', '2024-01-13 10:00:00', 1, 2, 4, 1),
(5, 'Deep Rock Galactic', 'A co-op FPS about space dwarves mining dangerous alien worlds', 'Deep Rock Galactic is a 1-4 player co-op game about space dwarves mining in the most dangerous cave systems in the galaxy. Work together as a team to dig, fight, and complete various objectives on procedurally generated alien planets. Choose from four unique classes, each with their own gear, abilities, and role to play in the team. No two missions are ever the same.', '2024-01-14 10:00:00', 1, 3, 5, 1),
(6, 'Portal 2', 'A puzzle-platformer with a brilliant co-op mode featuring two robots', 'Portal 2 draws from the award-winning formula of innovative gameplay, story, and music that earned the original Portal over 70 industry accolades. The co-op mode features two robots, Atlas and P-Body, who must work together to solve increasingly complex puzzle chambers using portal guns. Communication and teamwork are essential to escape Aperture Science''s testing facility.', '2024-01-15 10:00:00', 1, 3, 6, 1),
-- Horror Games (category_id = 2)
(7, 'Resident Evil Village', 'A first-person survival horror game set in a mysterious village', 'Set a few years after the horrors of Resident Evil 7, Ethan Winters and his wife Mia are living peacefully in a new location when tragedy strikes. Ethan finds himself in a remote snowy village filled with monstrous creatures and finds himself pursuing the enigmatic Mother Miranda in order to rescue his daughter. The game blends action and horror, featuring memorable villains including the towering Lady Dimitrescu.', '2024-02-10 10:00:00', 2, 1, 7, 1),
(8, 'Outlast', 'A first-person survival horror game set in a psychiatric hospital', 'Outlast is a first-person survival horror game set in the remote mountains of Colorado. You are Miles Upshur, a freelance investigative journalist who sneaks into the Mount Massive Asylum following an anonymous tip. Armed only with a camcorder, you must survive the horrors that lurk within the asylum and uncover the terrible secret that is buried beneath the surface.', '2024-02-11 10:00:00', 2, 1, 8, 1),
(9, 'Phasmophobia', 'A 4-player co-op psychological horror ghost hunting game', 'Phasmophobia is a 4 player online co-op psychological horror game where you and your team of paranormal investigators must enter haunted locations and gather evidence of the ghosts that dwell within. Use your ghost-hunting equipment to find and identify the type of ghost haunting the location while trying not to provoke it. The longer you stay, the more dangerous it becomes.', '2024-02-12 10:00:00', 2, 2, 9, 1),
(10, 'Amnesia: The Dark Descent', 'A first-person survival horror game set in a dark castle', 'Amnesia: The Dark Descent places you in the shoes of Daniel, who wakes up in a dark and foreboding castle with no memory of his past. Armed only with a lantern and your wits, you must delve into the depths of Brennenburg Castle, discovering clues about what has happened to you. Avoid the monsters that lurk in the darkness and try to piece together the truth before your sanity slips away.', '2024-02-13 10:00:00', 2, 2, 10, 1),
(11, 'Dead by Daylight', 'An asymmetrical multiplayer survival horror game', 'Dead by Daylight is an asymmetric multiplayer horror game where one player takes on the role of a savage killer and four other players take on the roles of survivors. The survivors must try to escape from the killing grounds while the killer tries to sacrifice them to a mysterious entity. With a roster of iconic killers from film and gaming history, no match ever feels the same.', '2024-02-14 10:00:00', 2, 3, 11, 1),
(12, 'The Mortuary Assistant', 'A horror simulation game about working at a funeral home', 'The Mortuary Assistant places you in the role of a mortuary assistant who must embalm and prepare bodies for burial while investigating whether the deceased are demonically possessed. Work through the night shift performing your duties while warding off supernatural threats. Identify the demon hiding among the bodies before the night is over or face terrifying consequences.', '2024-02-15 10:00:00', 2, 3, 12, 1),
-- Survival Games (category_id = 3)
(13, 'Minecraft', 'A sandbox survival game where you build and explore infinite worlds', 'Minecraft is a game about placing blocks and going on adventures. Explore randomly generated worlds and build amazing things from the simplest of homes to the grandest of castles. Play in Creative Mode with unlimited resources or dig deep into the world in Survival Mode, crafting weapons and armour to fend off dangerous mobs. Mine resources, farm food, tame animals and survive the night.', '2024-03-10 10:00:00', 3, 1, 13, 1),
(14, 'Rust', 'A brutal multiplayer survival game set in a post-apocalyptic world', 'Rust is a multiplayer survival game where the only aim is to survive. Everything wants you dead. The island is littered with dangers, from other players to bears and wolves, as well as radiation from abandoned nuclear power plants. You must gather resources, craft tools and weapons, and build a shelter to protect yourself. Form alliances or betray others — the choice is yours in this unforgiving world.', '2024-03-11 10:00:00', 3, 1, 14, 1),
(15, 'ARK: Survival Evolved', 'A survival game where you tame and ride dinosaurs on a mysterious island', 'ARK: Survival Evolved is an open-world dinosaur survival game. You awaken on a mysterious island filled with prehistoric and fantastical creatures. Hunt, harvest resources, craft items, grow crops, research technologies, and build shelters to withstand the elements. Form a tribe and join forces with hundreds of players online, or take on the world solo in single player. Tame, train, breed, and ride over 100 unique dinosaurs.', '2024-03-12 10:00:00', 3, 2, 15, 1),
(16, 'The Forest', 'A survival horror game set on a mysterious cannibal-infested island', 'The Forest is an open world survival horror game where you play as a plane crash survivor stranded on a mysterious forest peninsula. Build, explore, and survive in this terrifying first-person survival horror simulator. After crashing your plane, you wake up to see your son kidnapped by a strange humanoid creature. As the lone survivor, you must build a shelter to survive while searching for your missing child.', '2024-03-13 10:00:00', 3, 2, 16, 1),
(17, 'Subnautica', 'An underwater survival game set on an alien ocean planet', 'Subnautica is an open world underwater exploration and construction game. Descend into the depths of an alien underwater world filled with wonder and peril. Craft equipment, build bases, and manage resources to survive. Explore vast biomes ranging from sun-drenched shallow reefs to treacherous deep-sea trenches, lava fields, and bio-luminescent underwater rivers. Piece together the story of how you came to be stranded on this alien world.', '2024-03-14 10:00:00', 3, 3, 17, 1),
(18, 'Don''t Starve', 'A wilderness survival game with a dark fairy tale art style', 'Don''t Starve is an uncompromising wilderness survival game full of science and magic. You play as Wilson, a gentleman scientist who has been trapped by a demon and transported to a mysterious wilderness world. Wilson must learn to exploit his environment and its inhabitants if he ever hopes to escape and find his way back home. The game features a distinct hand-drawn art style and procedurally generated worlds.', '2024-03-15 10:00:00', 3, 3, 18, 1),
-- RPG Games (category_id = 4)
(19, 'The Witcher 3: Wild Hunt', 'An open-world RPG set in a dark fantasy universe', 'The Witcher 3: Wild Hunt is a story-driven open world RPG set in a stunning fantasy universe. You are Geralt of Rivia, a monster hunter hired to navigate a complex world of moral choices and dangerous beasts. Explore a massive open world across its 36 main story quests and 94 side quests. With over 100 hours of gameplay, stunning visuals, and one of the best stories in gaming, it is a must-play RPG for any fan of the genre.', '2024-04-10 10:00:00', 4, 1, 19, 1),
(20, 'Elden Ring', 'An action RPG set in a vast and perilous open world', 'Elden Ring is an action RPG developed by FromSoftware in collaboration with George R.R. Martin. Journey through the Lands Between, a new fantasy world, and discover the shattered remnants of the Elden Ring. Face sharply designed enemies and challenging bosses as you build a character to suit your playstyle. A vast world awaits, full of danger, mystery, and breathtaking vistas.', '2024-04-11 10:00:00', 4, 1, 20, 1),
(21, 'Skyrim', 'An open-world RPG set in a breathtaking fantasy province', 'The Elder Scrolls V: Skyrim is an open world action RPG set 200 years after Oblivion in the province of Skyrim. As the Dragonborn, you must stop the return of the World-Eater dragon, Alduin. Explore over 300 hours of content across a vast open world filled with questlines, factions, dungeons, and secrets. Forge your own path as a warrior, mage, or thief in this legendary RPG.', '2024-04-12 10:00:00', 4, 2, 21, 1),
(22, 'Final Fantasy VII Remake', 'A reimagining of the classic RPG set in the dystopian city of Midgar', 'Final Fantasy VII Remake is a reimagining of the iconic original game that re-examines the story of Cloud Strife, a mercenary who joins the eco-terrorist group AVALANCHE in their fight against the mega-corporation Shinra. Featuring a hybrid real-time and command-based combat system, stunning visuals, and an expanded storyline, the remake breathes new life into one of the most celebrated games of all time.', '2024-04-13 10:00:00', 4, 2, 22, 1),
(23, 'Persona 5', 'A JRPG about high school students who become phantom thieves', 'Persona 5 is a role-playing game set in modern-day Tokyo. You play as a high school student who forms a group called the Phantom Thieves of Hearts, who explore the Metaverse — a supernatural realm born from human desire — to steal malevolent intent from the hearts of corrupt adults. Featuring a unique visual style, a gripping story, and deep turn-based combat, Persona 5 is widely regarded as one of the greatest JRPGs ever made.', '2024-04-14 10:00:00', 4, 3, 23, 1),
(24, 'Cyberpunk 2077', 'An open-world RPG set in the dystopian megacity of Night City', 'Cyberpunk 2077 is an open-world action-adventure RPG set in Night City, a megalopolis obsessed with power, glamour, and body modification. You play as V, a mercenary outlaw going after a one-of-a-kind implant that is the key to immortality. Featuring a deep character creation system, branching narrative choices, and a massive open world to explore, the game delivers an unforgettable RPG experience in a breathtaking sci-fi setting.', '2024-04-15 10:00:00', 4, 3, 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `navigation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `navigation`) VALUES
(1, 'Co-op Games', 'Games where players work together', 1),
(2, 'Horror Games', 'Scary games focused on suspense and survival', 1),
(3, 'Survival Games', 'Games about gathering resources and staying alive', 1),
(4, 'RPG Games', 'Role-playing games with rich stories and characters', 1);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `file` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `file`, `alt`) VALUES
(1, 'ItTakesTwo.jpg', 'It Takes Two cover art'),
(2, 'Overcooked!2.jpg', 'Overcooked! 2 cover art'),
(3, 'AWayOut.jpg', 'A Way Out cover art'),
(4, 'L4D2.jpg', 'Left 4 Dead 2 cover art'),
(5, 'DRG.jpg', 'Deep Rock Galactic cover art'),
(6, 'Portal2.jpg', 'Portal 2 cover art'),
(7, 'REV.jpg', 'Resident Evil Village cover art'),
(8, 'Outlast.jpg', 'Outlast cover art'),
(9, 'Phasmophobia.jpg', 'Phasmophobia cover art'),
(10, 'Amnesia.jpg', 'Amnesia: The Dark Descent cover art'),
(11, 'DBD.jpg', 'Dead by Daylight cover art'),
(12, 'TMA.jpg', 'The Mortuary Assistant cover art'),
(13, 'MC.jpg', 'Minecraft cover art'),
(14, 'Rust.jpg', 'Rust cover art'),
(15, 'ARK.jpg', 'ARK: Survival Evolved cover art'),
(16, 'TheForest.jpg', 'The Forest cover art'),
(17, 'Subnautica.jpg', 'Subnautica cover art'),
(18, 'Don''t Starve.jpg', 'Don''t Starve cover art'),
(19, 'TW3.jpg', 'The Witcher 3: Wild Hunt cover art'),
(20, 'EldenRing.jpg', 'Elden Ring cover art'),
(21, 'Skyrim.jpg', 'Skyrim cover art'),
(22, 'FFVII.jpg', 'Final Fantasy VII Remake cover art'),
(23, 'PR5.jpg', 'Persona 5 cover art'),
(24, 'Cyberpunk.jpg', 'Cyberpunk 2077 cover art');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `forename` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `forename`, `surname`, `email`, `password`, `joined`, `picture`) VALUES
(1, 'Ivy', 'Stone', 'ivy@eg.link', 'c63j-82ve-2sv9-qlb38', '2024-01-01 12:04:23', 'ivy.jpg'),
(2, 'Luke', 'Wood', 'luke@eg.link', 'saq8-2f2k-3nv7-fa4k', '2024-01-01 12:15:18', NULL),
(3, 'Emiko', 'Ito', 'emi@eg.link', 'sk3r-vd92-3vn1-exm2', '2024-01-01 10:53:47', 'emi.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`member_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `category_exists` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `image_exists` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `member_exists` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);
