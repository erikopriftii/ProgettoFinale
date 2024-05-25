<?php
$db = new PDO('mysql:host=localhost;dbname=negozio', 'root', '');

// Ottieni tutte le sedi dal database
$sediStmt = $db->query("SELECT IdCentro, Indirizzo, Immagine FROM centri ORDER BY IdCentro");
$sedi = $sediStmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <title>Pagina di Benvenuto</title>
    <link href="stylepag1.css" rel="stylesheet">
</head>

<body>
    <nav>
        <ul>
            <li><a href="template.php">Home</a></li>
            <li class="dx"><a href="Logout.php">Logout</a></li>
            <li><a href="catalogo.php">Prodotti</a></li>
            <li><a href="template.php">Sedi</a></li> 
            <li class="dx"><a href="admin.php">Admin</a></li>

            <h1 class="main-title">Benvenuto su SoloSport</h1>
        </ul>
    </nav>
    <section class="intro">
        <div class="paragraph-box">
            <p>Su questo sito puoi trovare ogni prodotto sportivo che desideri, dalle scarpe da corsa a quelle di calcio fino ai guantoni da pugilato </p>
            
        </div>
    </section>


    <div class="box-resto">
        <h2>Le nostre sedi:</h2> 
        <div class="sedi">
        <section id="sedi"></section>
        <?php foreach ($sedi as $sede) : ?>
            <div class="sede">
                <p><?php echo htmlspecialchars($sede['Indirizzo']); ?></p>
                <img class="location_images" src="<?php echo htmlspecialchars($sede['Immagine']); ?>" alt="Immagine della sede" />
            </div>
        <?php endforeach; ?>
        </section>
    </div>
    </div>

    <div class="Oggetti">
        <p>I prodotti che puoi trovare:</p>
        <div class="box-oggetti">
            <div class="maglie">
                <p>Maglie</p>
                <img class="ex" src="Maglia.jpg" alt="Maglia" width="250" height="250"></br>
            </div>

            <div class="pantaloncini">
                <p>Pantaloncini </br></p>
                <img class="ex" src="Pantaloncini.jpg" alt="Pantaloncini" width="250" height="250"></br>
            </div>

            <div class="calze">
                <p>Calzettoni</p>
                <img class="ex" src="Calze.jpg" alt="Calze" width="250" height="250"></br>
            </div>

            <div class="scarpe">
                <p>Scarpe</p>
                <img class="ex" src="Scarpe.jpg" alt="Scarpa" width="250" height="250"></br>
            </div>

            <div class="guanti">
                <p>Guanti</p>
                <img class="ex" src="guanti.jpg" alt="Guanti" width="250" height="250"></br>
            </div>
            <button onclick="window.location.href='catalogo.php'">Al catalogo<br>>>></button>
        </div>
    </div>


    <footer class="footer">
        <p>&copy; <?php echo date('Y'); ?> SoloSport</p>
        <p>P. IVA:IT389247382ASD</p>
    </footer>
</body>

</html>