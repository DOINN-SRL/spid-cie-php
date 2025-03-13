<?php 
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: /");
    die();
}

$redirectErrorUri = 'https://api.welfaregranda.it/api/user/spid-auth-callback' . '-error';
header("Location: " . $redirectErrorUri . "?saml_response=". urlencode($_POST['SAMLResponse']));
exit;