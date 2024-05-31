<?php
session_start();

// Connessione al database
try {
    $db = new PDO('mysql:host=localhost;dbname=negozio', 'root', '');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connessione fallita: " . $e->getMessage());
}

// Recupera le categorie
$stmtCategorie = $db->query("SELECT IdCategoria, Nome_categoria, ImmagineCategoria FROM categorie");
$categorie = $stmtCategorie->fetchAll(PDO::FETCH_ASSOC);

// Ottiene la categoria selezionata dal form
$selectedCategoria = isset($_POST['categoria']) ? $_POST['categoria'] : null;

// Query per ottenere le risorse, filtrando per categoria se necessario
$query = "SELECT r.IdRisorsa, r.Nome, r.Descrizione, r.Immagine, r.Prezzo, 
                 c.Nome_categoria, cent.Indirizzo
          FROM risorse AS r
          JOIN categorie AS c ON r.IdCategoria = c.IdCategoria
          JOIN centri AS cent ON r.IdCentro = cent.IdCentro";

if ($selectedCategoria) {
    $query .= " WHERE r.IdCategoria = :selectedCategoria";
}

$stmt = $db->prepare($query);

if ($selectedCategoria) {
    $stmt->bindParam(':selectedCategoria', $selectedCategoria, PDO::PARAM_INT);
}

$stmt->execute();
$risorse = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Catalogo Risorse</title>
    <link rel="stylesheet" href="stylepag1.css">
</head>

<body>
    <nav>
        <ul>
            <li><a href="template.php">Home</a></li>
            <li class="dx"><a href="Logout.php">Logout</a></li>
            <li><a href="catalogo.php">Prodotti</a></li>
            <li><a href="#locations">Sedi</a></li>
            <li class="dx"><a href="admin.php">Admin</a></li>
        </ul>
    </nav>

    <h1 id="titolo">Catalogo Risorse</h1>

    <!-- Form per visualizzare tutte le categorie -->
    <h2 class="generic">Tutte le Categorie:</h2>
    <div class="categorie">
        <?php foreach ($categorie as $categoria) : ?>
            <div class="categoria">
                <a class="link" href="categoria.php?categoria=<?php echo $categoria['IdCategoria']; ?>">
                    <p class="nome_categoria"><?php echo htmlspecialchars($categoria['Nome_categoria']); ?></p>
                    <img class="cat_image" src="<?php echo htmlspecialchars($categoria['ImmagineCategoria']); ?>" alt="Immagine della categoria" />
                </a>
            </div>
        <?php endforeach; ?>
    </div>
    <h2 class="generic">Tutte le risorse:</h2>
    <div class="risorse">
        <?php foreach ($risorse as $risorsa) : ?>
            <a href="risorsa.php?IdRisorsa=<?php echo $risorsa['IdRisorsa']; ?>">
                <div class="risorsa">
                    <img class="product_image" src="<?php echo htmlspecialchars($risorsa['Immagine']); ?>"><br>
                    <h3 class="nome_prodotto"><?php echo htmlspecialchars($risorsa['Nome']); ?></h3><br>
                    <p class="prezzo">Prezzo: €<?php echo htmlspecialchars($risorsa['Prezzo']); ?></p><br>

                </div>
            </a>
        <?php endforeach; ?>
    </div>
    <footer class="footer">
        <p>&copy; <?php echo date('Y'); ?> SoloSport</p>
        <p>P. IVA:IT389247382ASD</p>
        <p>Contatti: 031-123456</p>
    </footer>
</body>

</html>