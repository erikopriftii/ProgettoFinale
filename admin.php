<?php
session_start();

// Verifica se l'utente è un amministratore
if (!isset($_SESSION['IsAdmin']) || $_SESSION['IsAdmin'] !== 1) {
    header('Location: template.php');
    exit;
}

$db = new PDO('mysql:host=localhost;dbname=ludoteca', 'root', '');


$categorieStmt = $db->query("SELECT IdCategoria, Nome_categoria FROM categorie ORDER BY Nome_categoria");
$categorie = $categorieStmt->fetchAll(PDO::FETCH_ASSOC);

$centriStmt = $db->query("SELECT IdCentro, Indirizzo FROM centri ORDER BY Indirizzo");
$centri = $centriStmt->fetchAll(PDO::FETCH_ASSOC);


if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['nome'])) {
    $nome = $_POST['nome'];
    $descrizione = $_POST['descrizione'];
    $categoria = $_POST['categoria'];
    $centro = $_POST['centro'];

    $insertStmt = $db->prepare("INSERT INTO risorse (IdCentro, IdCategoria, Nome, Descrizione) VALUES (:centro, :categoria, :nome, :descrizione)");
    $insertStmt->execute([':centro' => $centro, ':categoria' => $categoria, ':nome' => $nome, ':descrizione' => $descrizione]);
}

// Eliminazione
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['delete_id'])) {
    $idRisorsa = $_POST['delete_id'];
    
    $checkStmt = $db->prepare("SELECT * FROM prestiti WHERE IdRisorsa = :idRisorsa AND DataRitorno IS NULL");
    $checkStmt->execute([':idRisorsa' => $idRisorsa]);
    if ($checkStmt->rowCount() == 0) {
        $deleteStmt = $db->prepare("DELETE FROM risorse WHERE IdRisorsa = :idRisorsa");
        $deleteStmt->execute([':idRisorsa' => $idRisorsa]);
    }
}

// Ottieni solo le risorse che non sono attualmente prenotate o sono state restituite
$risorseStmt = $db->query("SELECT r.IdRisorsa, r.Nome, c.Nome_categoria, cent.Indirizzo 
                           FROM risorse AS r 
                           JOIN categorie AS c ON r.IdCategoria = c.IdCategoria 
                           JOIN centri AS cent ON r.IdCentro = cent.IdCentro
                           LEFT JOIN prestiti AS p ON r.IdRisorsa = p.IdRisorsa
                           WHERE NOT EXISTS (
                             SELECT * FROM prestiti WHERE IdRisorsa = r.IdRisorsa AND DataRitorno IS NULL
                           )");
$risorse = $risorseStmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Gestione Risorse</title>
    <link rel="stylesheet" href="stylepag1.css">
</head>

<nav>
    <ul>
        <li><a href="template.php">Home</a></li>
        <li class="dx"><a href="Logout.php">Logout</a></li>
        <li><a href="catalogo.php">Prodotti</a></li>
        <li><a href="locations">Sedi</a></li>
        <li class="dx"><a href = #admin.php>Admin</a></li>
        
        <h1>Benvenuto nel sito ufficiale della Tecnoteca</h1>
    </ul>
 </nav>
<body>
    <h1>Amministrazione Risorse</h1>

    <form method="POST">
        <input type="hidden" name="add" value="1">
        <label for="nome">Nome Risorsa:</label>
        <input type="text" id="nome" name="nome" required>

        <label for="descrizione">Descrizione:</label>
        <input type="text" id="descrizione" name="descrizione" required>

        <label for="categoria">Categoria:</label>
        <select id="categoria" name="categoria" required>
            <?php foreach ($categorie as $cat): ?>
            <option value="<?php echo $cat['IdCategoria']; ?>"><?php echo htmlspecialchars($cat['Nome_categoria']); ?></option>
            <?php endforeach; ?>
        </select>

        <label for="centro">Centro:</label>
        <select id="centro" name="centro" required>
            <?php foreach ($centri as $cen): ?>
            <option value="<?php echo $cen['IdCentro']; ?>"><?php echo htmlspecialchars($cen['Indirizzo']); ?></option>
            <?php endforeach; ?>
        </select>

        <button type="submit">Aggiungi Risorsa</button>
    </form>

    <h2>Risorse Esistenti</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Categoria</th>
            <th>Indirizzo Centro</th>
            <th>Azione</th>
        </tr>
        <?php foreach ($risorse as $risorsa): ?>
        <tr>
            <td><?php echo htmlspecialchars($risorsa['IdRisorsa']); ?></td>
            <td><?php echo htmlspecialchars($risorsa['Nome']); ?></td>
            <td><?php echo htmlspecialchars($risorsa['Nome_categoria']); ?></td>
            <td><?php echo htmlspecialchars($risorsa['Indirizzo']); ?></td>
            <td>
                <form method="POST">
                    <input type="hidden" name="delete_id" value="<?php echo $risorsa['IdRisorsa']; ?>">
                    <button type="submit">Elimina</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>
