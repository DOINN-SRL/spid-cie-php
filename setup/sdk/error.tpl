<?php
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: /");
    exit;
}

$redirectErrorUri = 'https://api.welfaregranda.it/api/user/spid-auth-callback-error';
$samlResponse = $_POST['SAMLResponse'];
?>
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <title>Redirect in corso...</title>
</head>
<body onload="document.getElementById('redirectForm').submit();">
  <form id="redirectForm" action="<?php echo htmlspecialchars($redirectErrorUri); ?>" method="post">
    <input type="hidden" name="saml_response" value="<?php echo $samlResponse; ?>">
  </form>
  <noscript>
    <p>Se non vieni reindirizzato automaticamente, clicca sul pulsante sottostante:</p>
    <form action="<?php echo htmlspecialchars($redirectErrorUri); ?>" method="post">
      <input type="hidden" name="saml_response" value="<?php echo $samlResponse; ?>">
      <button type="submit">Continua</button>
    </form>
  </noscript>
</body>
</html>
