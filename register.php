<?php
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
    

    // Verifica se l'utente esiste già nel database
    $stmt_check = $conn->prepare("SELECT * FROM utenti WHERE username = ?");
    $stmt_check->bind_param("s", $username);
    $stmt_check->execute();
    $result = $stmt_check->get_result();

    if ($result->num_rows > 0) {
        echo "Questo username è già stato utilizzato.";
    } else {
        $hashed_password = md5($password); // Usando l'MD5 per criptare la password

        
        $stmt_insert = $conn->prepare("INSERT INTO utenti (username, password, email) VALUES (?, ?, ?)");
        $stmt_insert->bind_param("sss", $username, $hashed_password, $email);

        if ($stmt_insert->execute()) {
            header("Location: template.php");
            exit();
        } else {
            echo "Errore durante la registrazione: " . $conn->error;
        }

        $stmt_insert->close();
    }

    $stmt_check->close();
}
