<!DOCTYPE html>
<html>

<head>
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
    <?php 
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "negozio";
    
    
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $idCategoria = $_GET['categoria'];
    $sql = "SELECT Nome_categoria from categorie where IdCategoria = $idCategoria";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        // Output data of each row
        while ($row = $result->fetch_assoc()) {
            echo '<div>';
            echo '<p id = "nomeCategoria">';
            echo  $row['Nome_categoria'];
            echo '</p>';
            echo '</div>';
            
        }
    }
    ?>


<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "negozio";


$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the ID is set in the URL parameters
if (isset($_GET['categoria'])) {
    $idCategoria = $_GET['categoria'];

    // Sanitize the ID before using it in the SQL query
    $idCategoria = mysqli_real_escape_string($conn, $idCategoria);

    $sql = "SELECT IdRisorsa,Nome, IdCategoria, Descrizione, Immagine, Prezzo FROM risorse WHERE IdCategoria = '$idCategoria'";

    $result = $conn->query($sql,);
    echo '<div class="risorse2">';

    if ($result->num_rows > 0) {
        // Output data of each row
        while ($row = $result->fetch_assoc()) {
            echo '<a href="risorsa.php?IdRisorsa=' . $row['IdRisorsa'] . '">';
            echo '<div class="risorsa2">';
            echo "<h2 class=\"nome_prodotto\">" . $row["Nome"] . "</h2>";
            echo '<img class="product_image" src="' . htmlspecialchars($row['Immagine']) . '"><br>';

            echo "<h2 class=\"prezzo\">" . $row["Prezzo"] . "€</h2>";
            echo '</div>';
            echo '</a>';
        }
    }
    else 
        echo "0 results";
    echo '</div>';
} 
else 
    echo "No ID received";

$conn->close();
?>
<footer class="footer">
        <p>&copy; <?php echo date('Y'); ?> SoloSport</p>
        <p>P. IVA:IT389247382ASD</p>
        <p>Contatti: 031-123456</p>
    </footer>
</body>

</html>