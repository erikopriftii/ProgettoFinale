<?php
session_start(); // Inizia la sessione all'inizio dello script

$host = "localhost";
$db   = "negozio";
$username = "root";
$pass = "";

$conn = new mysqli($host, $username, $pass, $db);

if ($conn->connect_error) {
    die("Connessione fallita: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $username = $_POST["username"];
    $password = $_POST["password"]; 

    
    $stmt = $conn->prepare("SELECT * FROM utenti WHERE Username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        $stored_password = $row['Password'];    

        if (md5($password) === $stored_password) { 
            $_SESSION['username'] = $username; // Salva l'username in sessione
            $_SESSION['IsAdmin'] = $row['IsAdmin']; // Salva il flag isAdmin in sessione 
            header("Location: template.php");
            exit; 
        } else {
            $error = "Credenziali errate.";
        }
    } else {
        $error = "Utente non trovato.";
    }

    $stmt->close();
}

if (isset($error)) {
    header("Location: login.php?error=" . urlencode($error));
    exit;
}
