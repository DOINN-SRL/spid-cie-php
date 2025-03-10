<?php
require_once("{{SDKHOME}}/proxy-spid-php.php");

$production = false;
$state = '';

$spidsdk = new PROXY_SPID_PHP('{{PROXY_CLIENT_ID}}', '{{PROXY_REDIRECT_URI}}', $state, $production);

//$spidsdk->setPurpose("P");

$logoutUrl = $spidsdk->getLogoutURL($spidsdk->getRedirectURI() . "-logout?" . http_build_query($_GET));
echo $logoutUrl;
if ($spidsdk->isAuthenticated()) {
    // header("Location: " . $logoutUrl);
    // exit;
    $spidsdk->logout($logoutUrl);
} else {
    echo "<p>Not authenticated</p>";
}
?>