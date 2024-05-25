<!DOCTYPE html>
<html>
    <head>
      <link rel="stylesheet" href="risorsa.css">
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

    </body>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "negozio";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the ID is set in the URL parameters
if (isset($_GET['IdRisorsa'])) {
    $idRisorsa = $_GET['IdRisorsa'];

    // Sanitize the ID before using it in the SQL query
    $idRisorsa = mysqli_real_escape_string($conn, $idRisorsa);

    $sql = "SELECT Nome, IdCategoria, Descrizione, Immagine, Prezzo 
            FROM risorse 
            WHERE IdRisorsa = '$idRisorsa'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Output data of each row
        while($row = $result->fetch_assoc()) {
            echo '<div class="product">';
            echo "<h2>" . $row["Nome"] . "</h2>";
            echo "<p>Descrizione: " . $row["Descrizione"] . "</p>";
            echo '<img class="product_image" src="' . htmlspecialchars($row['Immagine']) . '"><br>';
            echo "<h2 class=\"product-price\">" . $row["Prezzo"] . "€</h2>";
            echo '<button class="buy-button" onclick="window.location.href=\'acquista.php?IdRisorsa=' . $idRisorsa . '\'">Acquista</button>';
            echo '</div>';
        }
    } else {
        echo "No product found with ID: " . $idRisorsa;
    }
} else {
    echo "No ID received";
}

$conn->close();
?>
</html>