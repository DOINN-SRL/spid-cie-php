<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
</head>
<?php
$errorMessage = $_GET['error_message'];
$errorCode = $_GET['error_code'];
$responseId = $_GET['response_id'];
?>
<body>
    <h1> Errore durante il processo di autenticazione </h1>
    <div style="border: 1px solid #eee; padding: 1em; margin: 1em 0">
        <p style="margin: 1px">Messaggio di Errore: <?php echo htmlspecialchars($errorMessage); ?></p>
        <p style="margin: 1px">Codice di Errore: <?php echo htmlspecialchars($errorCode); ?></p>
        <p style="margin: 1px">ID Risposta: <?php echo htmlspecialchars($responseId); ?></p>
    </div>
</body>

</html>