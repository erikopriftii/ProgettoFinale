<?php
session_start(); // Start the session

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

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    echo "You must be logged in to make a purchase.";
    exit;
}

// Check if the ID is set in the URL parameters
if (isset($_GET['IdRisorsa'])) {
    $idRisorsa = $_GET['IdRisorsa'];

    // Sanitize the ID before using it in the SQL query
    $idRisorsa = mysqli_real_escape_string($conn, $idRisorsa);

    // Fetch the product details from the database
    $sql = "SELECT Nome, IdCategoria, Descrizione, Immagine, Prezzo 
            FROM risorse 
            WHERE IdRisorsa = '$idRisorsa'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        
        // Insert a new record into the 'acquisti' table
        $sql = "INSERT INTO acquisti (IdRisorsa, Username, DataAcquisto) VALUES ('$idRisorsa', '{$_SESSION['username']}', CURDATE())";

        if ($conn->query($sql) === TRUE) {
            echo "Purchase successful!";
            header('Refresh: 1; URL=catalogo.php');
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } else {
        echo "No product found with ID: " . $idRisorsa;
    }
} else {
    echo "No ID received";
}

$conn->close();
?>