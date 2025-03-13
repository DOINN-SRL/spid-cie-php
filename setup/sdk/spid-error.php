<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
</head>

<body>
    <h1> Errore durante il processo di autenticazione </h1>
    <div style="border: 1px solid #eee; padding: 1em; margin: 1em 0">
        <p style="margin: 1px">Error: <?php echo htmlspecialchars($_GET['error']); ?></p>
        <!-- <p style="margin: 1px">StatusCode: <?php //echo htmlspecialchars($_GET['statusCode']); ?></p>
        <p style="margin: 1px">StatusMessage: <?php //echo htmlspecialchars($_GET['statusMessage']); ?></p>
        <p style="margin: 1px">ErrorMessage: <?php //echo htmlspecialchars($_GET['errorMessage']); ?></p> -->
    </div>
</body>

</html>