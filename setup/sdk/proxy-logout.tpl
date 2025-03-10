<?php
require_once("{{SDKHOME}}/proxy-spid-php.php");

$production = false;
$state = '';

$spidsdk = new PROXY_SPID_PHP('{{PROXY_CLIENT_ID}}', '{{PROXY_REDIRECT_URI}}', $state, $production);

//$spidsdk->setPurpose("P");

if ($spidsdk->isAuthenticated()) {
    $logoutUrl = $spidsdk->getLogoutURL($spidsdk->getRedirectURI() . "-logout?" . http_build_query($_GET));
    header("Location: " . $logoutUrl);
    exit;
} else {
    echo "<p>Not authenticated</p>";
}
?>