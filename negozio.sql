-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 31, 2024 alle 18:50
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `negozio`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `acquisti`
--

CREATE TABLE `acquisti` (
  `IdAcquisto` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `IdRisorsa` int(11) NOT NULL,
  `DataAcquisto` date NOT NULL,
  `DataRitorno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `acquisti`
--

INSERT INTO `acquisti` (`IdAcquisto`, `Username`, `IdRisorsa`, `DataAcquisto`, `DataRitorno`) VALUES
(88, 'gfdfgrt', 54, '2024-05-30', NULL),
(89, 'gfdfgrt', 49, '2024-05-30', NULL),
(90, 'nbvxc', 78, '2024-05-31', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `categorie`
--

CREATE TABLE `categorie` (
  `IdCategoria` int(11) NOT NULL,
  `Nome_categoria` varchar(50) NOT NULL,
  `Descrizione` varchar(300) NOT NULL,
  `ImmagineCategoria` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `categorie`
--

INSERT INTO `categorie` (`IdCategoria`, `Nome_categoria`, `Descrizione`, `ImmagineCategoria`) VALUES
(32, 'Maglie sportive', 'Maglie sportive', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSTUu82HF1itJjRLBFuilnGWkDyvRZtj5nATURgd0IJUkWp9ACSDY_jy0-33u7EQLe5s9j45cynIZlRpe1velNV_My8snpj6-1iV_2-2oKy0UCLkjj1iKqDxqm3rRSO&usqp=CAc'),
(34, 'Scarpe da calcio', 'scarpe da calcio', 'https://media.foot-store.it/catalog/product/cache/image/1800x/9df78eab33525d08d6e5fb8d27136e95/n/i/nike_dj5631-300-phsrh000_s23.jpg'),
(35, 'Calzini sportivi', 'Calzini sportivi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnvnTIG3QfiXHfyAsPbsJSzUo6EwnvE-7TRg&s'),
(36, 'Guanti da boxe', 'Guanti da boxe', 'https://www.tsunaminutrition.it/12132-large_default/guanti-boxe-flash-nero.jpg'),
(37, 'Sacchi da boxe', 'Sacco da boxe', 'https://www.tecnicasport.com/images/thumbs/0004035_leone-sacco-da-boxe-lungo-basic-55kg.jpeg'),
(38, 'Pantaloncini', 'Pantaloncini sportivi', 'https://www.sportlandweb.it/103251-tm_thickbox_default/adidas-pantaloncini-calcio-squadra-21-verde-bianco-bambino.jpg'),
(39, 'Scarpe da corsa', 'Scarpe da corsa\r\n', 'https://www.lbmsport.it/wp-content/uploads/2022/04/brooks-glycerin-20-uomo-1103821D-012-1200x1048.jpg'),
(40, 'Guanti da MMA', 'Guanti MMA', 'https://www.leone1947.com/cache/media/2022/09/gp133_01_1_6003.jpg/b729a6826d31548332f29da96211ed9a.jpg'),
(42, 'Maglie da calcio', 'Maglie da calcio', 'https://www.vintagefootballclub.com/wp-content/uploads/2020/07/barcelona-1990-91-1.jpg'),
(43, 'Guanti da portiere', 'Guanti da portiere', 'https://www.portierecalcio.it/cdn/shop/products/guanti-portiere-uhlsport-powerline-supergrip-hn.jpg?v=1691659754&width=1200');

-- --------------------------------------------------------

--
-- Struttura della tabella `centri`
--

CREATE TABLE `centri` (
  `IdCentro` int(11) NOT NULL,
  `Indirizzo` varchar(100) NOT NULL,
  `Immagine` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `centri`
--

INSERT INTO `centri` (`IdCentro`, `Indirizzo`, `Immagine`) VALUES
(1, 'Via Roma 12, Pordenone', 'https://flawless.life/wp-content/uploads/2019/04/i-migliori-negozi-sportivi-di-milano-football-team.jpg'),
(2, 'Via Gianni 2, Udine', 'https://www.effearredamenti.com/wp-content/uploads/2017/02/003-Arredi-Negozii-sport-estremi.jpg'),
(3, 'Via Allegria 5, Trieste', 'https://www.sportpescosta.it/media/k2/galleries/234/480/sport-pescosta-alta-badia-1.jpg'),
(4, 'Via Bombetta 5, Mestre', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAjJxd4aLwZPjXPCzzKyRxT6KL9jocRksAAJn9h5gDnw&s');

-- --------------------------------------------------------

--
-- Struttura della tabella `risorse`
--

CREATE TABLE `risorse` (
  `IdRisorsa` int(11) NOT NULL,
  `IdCentro` int(11) NOT NULL,
  `IdCategoria` int(11) NOT NULL,
  `Nome` varchar(200) NOT NULL,
  `Descrizione` varchar(500) NOT NULL,
  `Immagine` varchar(200) NOT NULL,
  `Prezzo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `risorse`
--

INSERT INTO `risorse` (`IdRisorsa`, `IdCentro`, `IdCategoria`, `Nome`, `Descrizione`, `Immagine`, `Prezzo`) VALUES
(49, 3, 42, 'Maglia Juventus 2022/2023', 'Le iconiche strisce si fondono con l’ineguagliabile magia che si respira in Casa Bianconera, creando un rivoluzionario pattern di triangoli in onore delle stelle dell’Allianz Stadium.\r\nIl modello, inoltre, rispetta l’ambiente e guarda al futuro. È realizzato al 100% con materiali riciclati.\r\n\r\n', 'https://store.juventus.com/data/store/product/5/54815/product.jpg\r\n', 59.99),
(50, 3, 38, 'Pantaloncini Jordan', 'I pantaloncini sono un capo d\'abbigliamento essenziale per il comfort e la praticità, offrendo una vestibilità comoda e uno stile versatile per una varietà di attività e occasioni.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkIeYuf8gGQCq3LBNJg-vUMhYR-KDiAK72YnYGIYMvTg&s', 19.99),
(52, 3, 35, 'Calzini Nike', 'Calzini sportivi Nike', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHbnz2z4AB3hVsxuK-3gZ4V3-vCWNYgPMnL731u07uvQ&s', 14.99),
(53, 3, 34, 'Nike Mercurial', 'Il campo è tuo quando indossi Vapor 15 Elite FG. Abbiamo aggiunto un\'unità Zoom Air, pensata specificamente per il calcio, e una texture aderente sulla parte superiore per un tocco eccezionale, così potrai dare il massimo nei minuti finali della partita, quando conta di più. Sentirai la velocità esplosiva mentre corri in campo e durante rapide azioni decisive. Fast is in the Air.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuh7QhGWzIjkfIMFvR2pj-JeTCwJVigB-KcJ6v8dYXFg&s', 149.99),
(54, 1, 43, 'ADIDAS PREDATOR PRO HYBRID PROMO SOLAR ENGERY', 'Il lattice usato è l\' URG1.0, che è lo stesso lattice usato anche dai portieri professionisti targati Adidas (Neuer, Ter Stegen, Donnarumma, ...). Questo tipo di lattice offre probabilmente uno dei migliori Grip sul mercato in tutte le condizioni atmosferiche. ', 'https://m.media-amazon.com/images/I/7164tPLs09L.jpg', 79.99),
(56, 3, 34, 'Adidas X Crazyfast.1 FG', 'Senti la carica della velocità intensa con le scarpe da calcio adidas X Crazyfast.1 FG in Bianco/Nero Core/Limone Lucido, dal design aerodinamico e essenziale per darti velocità estrema in ogni direzione.', 'https://www.cisalfasport.it/dw/image/v2/BBVV_PRD/on/demandware.static/-/Sites-cisalfa-master/default/dw7092b8ea/cisalfa/files/S5589960-UNI/image/S5589960_UNI.jpg?sw=960&sh=1200', 119.99),
(57, 4, 37, 'SACCO ALLENAMENTO PRO LEONE 1947 AT840', 'In pelle sintetica ultra resistente, il sacco da allenamento boxe è un prodotto artigianale. L’imbottitura interna garantisce una sicurezza antishock. È caratterizzato da una chiusura zip e da catene appendi  sacco.\r\ndimensioni variante 20 kg', 'https://www.leone1947.com/cache/media/2024/01/at840_01_1_743.jpg/efc550239381f0e14b8c265f891c939d.jpg', 143.91),
(58, 2, 37, 'Sacco boxe 120 peso 20kg blu', 'Il sacco ideale per il pugile che vuole allenarsi da casa sulle tecniche della boxe inglese. Imbottitura in tessuto, peso 20Kg e altezza 100 cm', 'https://contents.mediadecathlon.com/p2191905/k$1cef4483ff082643fab0da45e8776c7b/sq/sacco-boxe-120-peso-20kg-blu.jpg?format=auto&f=1200x1200', 89.99),
(59, 4, 37, 'Sacco boxe Leone King Size 60 kg bianco-nero', 'Prodotto ideato per atleti esperti che vogliono allenarsi intensamente con pugni e calci.\r\n\r\nL`imbottitura in cotone e EVA permette un buon assorbimento dei colpi, per un allenamento più intenso e ottimale. E` dotato di catene appendi-sacco e ha un`altezza di 145 cm.', 'https://contents.mediadecathlon.com/p1662646/k$7a5a206594967ec24c137234d3e98b22/sq/sacco-boxe-leone-king-size-60-kg-bianco-nero.jpg?format=auto&f=969x969', 259.99),
(62, 3, 36, 'Guantoni da boxe Venum Challenger 3.0', 'Realizzati in pelle sintetica di alta qualità, i guantoni da boxe Venum Challenger di generazione 3.0 ti garantiscono la massima durata e una perfetta vestibilità durante i tuoi combattimenti e sessioni di allenamento.', 'https://it.venum.com/cdn/shop/files/f_252F3_252F7_252Fe_252Ff37e82b333b21419c5f96375ae08f65820869c47_bg_challenger_3.0_white_black_gold_1500_01_e01f31c9-e8df-41e3-97a2-db17c399136d.jpg?v=1707818057&wi', 27.94),
(63, 3, 36, 'GUANTI BOXE CONTEST GN010', 'Guantoni in pelle professionali anti - shock già approvati FPI (Federazione Pugilistica Italiana). Qualità inconfondibile e performance eccellente.', 'https://www.leone1947.com/cache/media/2024/01/gn010_02_1_916.jpg/f29d502f4b3edffd3d60c8590500f04e.jpg', 99.99),
(65, 3, 36, 'Guanti da boxe Muay Thai', 'I guantoni da boxe Phantom Muay Thai sono tra i bestseller assoluti della nostra gamma. Hanno una solida imbottitura per pugni e calci bloccanti, oltre al taglio tipico dei guantoni da boxe tailandesi. \r\nUn\'ampia chiusura in velcro garantisce un polso stabile durante l\'allenamento e la competizione. \r\nL\'interno dei guantoni da boxe Phantom Muay Thai è realizzato con un materiale MESH permeabile all\'aria per garantire una ventilazione ottimale e meno sudore durante le arti marziali.', 'https://www.phantom-athletics.com/cdn/shop/products/2329_1_2000x.jpg?v=1669126941', 61.99),
(66, 3, 32, 'MAGLIA A MANICA CORTA UOMO COMBI TURCHESE FLUORESCENTE', 'T-shirt a maniche corte da uomo/bambino, progettata per lo sport e buona per allenamenti e gare in sport come il calcio. Grazie alla sua resistenza, leggerezza e traspirabilità, questa maglia è molto comoda per lo sportivo. Inoltre, la sua forma ampia permetterà di giocare godendo del comfort.', 'https://www.joma-sport.com/dw/image/v2/BFRV_PRD/on/demandware.static/-/Sites-joma-masterCatalog/default/dwb87df2ec/images/medium/100052.010_1.jpg?sw=460&sh=475&sm=fit', 12),
(67, 3, 32, 'AMZSPORT Maglietta a Maniche Corte, Funzionale, Cool Dry, per Allenamento e Corsa', 'Tessuto traspirante traspirante per asciutto e comfort. Il sistema di trasporto dell\'umidità allontana il sudore dal corpo e dall\'altra presa. Cuciture ergonomiche per una vestibilità sagomata e un comfort naturale. La tecnologia antiodore impedisce la proliferazione di microbi e quindi elimina la formazione di odori nei punti di pressione. Informazioni sul prodotto:\r\nMateriale: 90% poliestere, 10% elastan', 'https://m.media-amazon.com/images/I/616b7PeikdL._AC_SX569_.jpg', 32.98),
(68, 4, 32, 'Under Armour Bekleidung Sportstyle Logo', 'Tutti fanno t-shirt grafiche... ma nessuno le fa meglio di Under Armour. Utilizziamo un tessuto morbido, leggero e ad asciugatura rapida.', 'https://m.media-amazon.com/images/I/612gtxmjwdL._AC_SX569_.jpg', 15.6),
(69, 3, 34, 'adidas Copa Mundial Made in Germany FG', 'Realizzate in Germania con tomaia in pelle di canguro premium e suola a doppia densità, le scarpe da calcio adidas Copa Mundial FG in Nero/Bianco Running sono le scarpe da calcio per campi compatti più vendute di tutti i tempi.\r\nIndossata da alcuni dei più grandi calciatori nella storia della Coppa del Mondo FIFA, tra cui Beckenbauer, Platini, Zico e Rummenigge, l\'adidas Copa Mundial vanta un pedigree senza rivali stabilito in oltre quattro decenni.', 'https://www.futbolemotion.com/imagesarticulos/88055/grandes/bota-adidas-copa-mundial-0.webp', 144.99),
(70, 2, 35, 'TANSTC Calze Antiscivolo Calcio', 'Miglioramento della sicurezza: Utilizzando la tecnologia delle calze antiscivolo calcio, i cuscinetti in gomma sulla parte inferiore delle calze sportive possono aumentare l\'attrito tra il piede, le calze, le scarpe e il terreno, migliorando efficacemente la velocità durante improvvisi scatti e cambi di direzione nell\'attività sportiva, rendendo l\'attività fisica più sicura. Materiali di alta qualità: Realizzati con il 75% di cotone, il 15% di nylon e il 10% di fibra di poliestere', 'https://m.media-amazon.com/images/I/81k-t05arbL._AC_SX569_.jpg', 15.58),
(71, 3, 35, 'ENONEO Calze Calcio Antiscivolo', 'Calzini da calcio progettato con gommino antiscivolo nella parte inferiore, per fissare i calzini negli stivali che garantiscono sicurezza nelle calzature e che il piede non scivoli, migliorano la presa e rendono più sicuro l\'esercizio; Migliorare la tua agilità e migliorare le tue prestazioni. ', 'https://m.media-amazon.com/images/I/81PsbktLGrL._AC_SX569_.jpg', 18.99),
(72, 4, 38, 'adidas - Squadra 21 Shorts', 'Sul Campo, Sei Tu E La Tua Squadra Contro Il Mondo. Così Adidas Ha Creato La Serie Squadra 21 Per Aiutarti A Vincere In Grande Stile. Questi Pantaloncini Da Calcio Mantenere Il Corpo Asciutto Con Tessuto Aeroready Che È Fatto Con Materiali Riciclati. E \'Un Piccolo Passo Verso L\'Obiettivo Di Porre Fine Rifiuti Di Plastica. Questo Prodotto È Realizzato Con Primegreen, Una Serie Di Materiali Ad Alte Prestazioni Riciclati.', 'https://m.media-amazon.com/images/I/51eGkj8XXtL._AC_SX679_.jpg', 12.99),
(73, 2, 38, 'Joma Bermuda Drive', 'Pantaloncini da tennis pensati per la competizione e realizzati in tessuto a maglia. Cintura elastica regolabile con cordini. Con taschini laterali.', 'https://m.media-amazon.com/images/I/811ZF5VkPaL._AC_SX569_.jpg', 10.99),
(74, 2, 39, 'Nike Performance INITIATOR - Scarpe running neutre', 'Scarpe da corsa Nike', 'https://img01.ztat.net/article/spp-media-p1/322298732acd4970882081923f555082/f01c582155e947ffbe1b33d3ce54dd0e.jpg?imwidth=1800&filter=packshots', 76.5),
(75, 2, 39, 'ASICS NOVABLAST 4', 'Rispetto alla versione precedente, presenta la schiuma FF Blast+ Eco ancora più sostenibile e con maggior rimbalzo grazie anche al rocker più accentuato che donano transizioni più fluide ed efficienti. La tomaia in mesh realizzata per il 20% da materie prime riciclate, assicura sostegno e traspirabilità, mentre la pianta più ampia garantisce maggior comfort migliorando la calzata. Anche la suola ha subito un piccolo restyling che assicura maggior aderenza per una trazione superiore.', 'https://maxiprod.b-cdn.net/media/catalog/product/cache/1/image/1000x/9df78eab33525d08d6e5fb8d27136e95/a/s/asics-1011b693-novablast_4-scarpe-running-uomo-048908801_400_1.jpg', 135.01),
(76, 2, 39, 'PUMA DEVIATE NITRO 2 FF', 'Le scarpe running PUMA Deviate Nitro 2 da uomo sono ideali per tutti i runner con appoggio neutro alla ricerca del giusto mix tra ammortizzazione e reattività negli allenamenti quotidiani su qualsiasi distanza ma anche nelle mezze o nelle maratone.', 'https://maxiprod.b-cdn.net/media/catalog/product/cache/1/image/1000x/9df78eab33525d08d6e5fb8d27136e95/p/u/puma-30969701-deviate_nitro_2_ff-scarpe-running-uomo-049357101_01_1.jpg', 119),
(78, 2, 40, 'Guanti UFC Pro Competition nero puro bianco', 'I guanti UFC Pro Competition sono guanti di alta qualità che offrono una protezione ottimale per le tue mani durante gli allenamenti e i combattimenti. Con queste caratteristiche uniche, questi guanti forniscono una protezione extra nell\'area delle nocche, grazie alla comoda protezione in gel. Inoltre, la loro vestibilità aderente garantisce una sensazione di comfort e un eccellente supporto per i polsi.', 'https://cdn.deporvillage.com/cdn-cgi/image/h=1800,w=1800,dpr=1,f=auto,q=75,fit=contain,background=white/product/UFC-UHK-69908-C_001.jpg', 105.3),
(79, 1, 42, 'IM NIKE MAGLIA GARA HOME STADIUM 2023/24 UOMO', 'Nella maglia Home Stadium 2023/24 le iconiche righe nere e blu sfoggiano un motivo a mosaico digitale che celebra il fit classico e l\'architettura moderna della città antica. Il motivo interno commemora il legame tra l\'Inter e la città che chiamiamo casa', 'https://store.inter.it/dw/image/v2/BJBQ_PRD/on/demandware.static/-/Sites-inter-master-catalog/default/dw25f197a0/images/large/23N001M0303_01.jpg?sw=1400&q=80', 94.99),
(80, 2, 42, 'SSC NAPOLI MAGLIA GARA HOME 2023/2024', 'Nuovo styline con manica raglan su tessuto tecnico stretch, piping in contrasto bianco, collo a V ad incrocio con stampa tricolore come sulla linea fondo della manica. Nuovo motivo allover “N” con tecnica di stampa a caldo su materiale tecnico traspirante con tecnologia Dry Touch. Patch classico Napoli in silicone e scudetto tricolore personalizzato. \r\n\r\nVestibilità: Slim Fit. Composizione: 82% poliestere, 18% elastane', 'https://static.sscnapoli.it/img/p/8/5/9/0/8590-large_default.jpg', 130),
(81, 4, 43, 'PETROL BEAST 3.0', 'Nessuna scusa: il T1TAN PETROL BEAST 3.0 è stato concepito per la pioggia e l\'umidità. 4mm Aqua Grip per un palmo ideale in caso di pioggia. Prestazioni super quando è bagnato, ma anche quando c\'è il sole.\r\n\r\nMateriale Mechano 2.0 traspirante e super leggero. Palmo allungato. Punching Zone in silicone completamente ridisegnata in un bellissimo Beast Look. Palmo allungato. Cinturino rimovibile.', 'https://it.t1tan.com/cdn/shop/files/IT_1_750x.jpg?v=1691017375', 79.99),
(82, 2, 43, 'Reusch Attrakt Freegel Gold X Evolution', 'Con nuovo palmo Reusch-Grip Gold, i Guanti da portiere Reusch Attrakt Freegel Gold X Evolution offrono una presa extra adesiva in condizioni asciutte e bagnate grazie all\'aggiunta di particelle adesive nel lattice. Il taglio Evolution presenta un palmo prevalentemente piatto con lattice che continua ed avvolge il lattice attorno alla punta delle dita, offrendoti la combinazione perfetta tra vestibilità aderente e controllo diretto della palla.', 'https://www.portierecalcio.it/cdn/shop/files/Guanti-portiere-Reusch-Attrakt-Freegel-Gold-X-Evolution-Cut-Shine-Bright.webp?v=1714470527&width=1200', 115);

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `Username` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Citta'` varchar(50) NOT NULL,
  `IsAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `Via` varchar(50) NOT NULL,
  `NumeroCivico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`Username`, `Email`, `Password`, `Citta'`, `IsAdmin`, `Via`, `NumeroCivico`) VALUES
('admin', 'admin@admin', '21232f297a57a5a743894a0e4a801fc3', '', 1, '', 0),
('casd', 'cioao@sda', '6e6bc4e49dd477ebc98ef4046c067b5f', '', 0, '', 0),
('das', 'gdfsfgg@fsdf', '5f039b4ef0058a1d652f13d612375a5b', '', 0, '', 0),
('dassd', 'ciao@ciao', '59b466fd93164953e56bdd1358dc0044', '', 0, '', 0),
('dsa', 'das@fds', '51888604cf507f0d151b78db9eed4e30', '', 0, '', 0),
('dsamh', 'dsa@htg', 'f95adbce0a51589cb6e87112eb6becd4', '', 0, '', 0),
('fas', 'dsasd@fdgd', '838ece1033bf7c7468e873e79ba2a3ec', '', 0, '', 0),
('ger', 'hfg@hgf', '81448138f5f163ccdba4acc69819f280', '', 0, '', 0),
('gfd', 'dsa@hg', 'd187535d40b96a60387e8dff44b0c491', '', 0, '', 0),
('gfdfgrt', 'dsadsa@hgfh', '44fdb916a558ef6739cfa6378de4995a', '', 0, '', 0),
('gfdgdg', 'dassd@hgfh', '5f039b4ef0058a1d652f13d612375a5b', '', 0, '', 0),
('gfdghfd', 'fgds@dfgs', 'f2a7e899b5af7365d70d252f3fd387dd', '', 0, '', 0),
('nbvxc', 'dsa@ghfd', '838ece1033bf7c7468e873e79ba2a3ec', '', 0, '', 0),
('ter', 'gregre@gre', '849aab3e265d5a9352de8cdfb3d716ff', '', 0, '', 0);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `acquisti`
--
ALTER TABLE `acquisti`
  ADD PRIMARY KEY (`IdAcquisto`),
  ADD KEY `Username` (`Username`,`IdRisorsa`),
  ADD KEY `IdRisorsa` (`IdRisorsa`);

--
-- Indici per le tabelle `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indici per le tabelle `centri`
--
ALTER TABLE `centri`
  ADD PRIMARY KEY (`IdCentro`);

--
-- Indici per le tabelle `risorse`
--
ALTER TABLE `risorse`
  ADD PRIMARY KEY (`IdRisorsa`),
  ADD KEY `Id_Centro` (`IdCentro`),
  ADD KEY `Id-categoria` (`IdCategoria`),
  ADD KEY `IdCentro` (`IdCentro`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`Username`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `acquisti`
--
ALTER TABLE `acquisti`
  MODIFY `IdAcquisto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT per la tabella `categorie`
--
ALTER TABLE `categorie`
  MODIFY `IdCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT per la tabella `centri`
--
ALTER TABLE `centri`
  MODIFY `IdCentro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `risorse`
--
ALTER TABLE `risorse`
  MODIFY `IdRisorsa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `acquisti`
--
ALTER TABLE `acquisti`
  ADD CONSTRAINT `acquisti_ibfk_1` FOREIGN KEY (`IdRisorsa`) REFERENCES `risorse` (`IdRisorsa`),
  ADD CONSTRAINT `acquisti_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `utenti` (`Username`);

--
-- Limiti per la tabella `risorse`
--
ALTER TABLE `risorse`
  ADD CONSTRAINT `risorse_ibfk_1` FOREIGN KEY (`IdCentro`) REFERENCES `centri` (`IdCentro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `risorse_ibfk_2` FOREIGN KEY (`IdCategoria`) REFERENCES `categorie` (`IdCategoria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
