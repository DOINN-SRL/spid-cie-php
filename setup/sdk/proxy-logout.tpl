<?php
require_once("{{SDKHOME}}/proxy-spid-php.php");

$production = false;
$state = '';

$spidsdk = new PROXY_SPID_PHP('{{PROXY_CLIENT_ID}}', '{{PROXY_REDIRECT_URI}}', $state, $production);

//$spidsdk->setPurpose("P");

$backendUrl = $spidsdk->getRedirectURI() . "-logout?" . http_build_query($_GET);
$logoutUrl = $spidsdk->getLogoutURL($backendUrl);
echo $logoutUrl;
echo "<br>";
echo $backendUrl;

if ($spidsdk->isAuthenticated()) {
    $spidsdk->logout($logoutUrl);
    header("Location: " . $backendUrl);
    exit;
} else {
    echo "<p>Not authenticated</p>";
}
?>