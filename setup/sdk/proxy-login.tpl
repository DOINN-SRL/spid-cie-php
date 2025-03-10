<?php 

    require_once("{{SDKHOME}}/proxy-spid-php.php");

    $production = false;
    $state = '';

    $spidsdk = new PROXY_SPID_PHP('{{PROXY_CLIENT_ID}}', '{{PROXY_REDIRECT_URI}}', $state, $production);

    //$spidsdk->setPurpose("P");

    if($spidsdk->isAuthenticated() 
        && isset($_GET['idp']) 
        && $spidsdk->isIdP($_GET['idp'])) {

            echo "<p>IdP: <b>" . $spidsdk->getIdP() . "</b></p>";
            
            foreach($spidsdk->getAttributes() as $attribute=>$value) {
                echo "<p>" . $attribute . ": <b>" . $value[0] . "</b></p>";
            }
    
            echo "<hr/><p><a href='" . $spidsdk->getLogoutURL("/proxy-login.php") . "'>Logout</a></p>";

    } else {

        if(!isset($_GET['idp'])) {    
            if($spidsdk->isSPIDEnabled()) {
                echo "<p>SPID BUTTON</p>";
                $spidsdk->insertSPIDButtonCSS();
                $spidsdk->insertSPIDButton("L");  
                $spidsdk->insertSPIDButtonJS(); 
            }
            if($spidsdk->isCIEEnabled()) {
                echo "<p>CIE BUTTON";
                $spidsdk->insertCIEButton();
            }
            
        } else {
            $currentBaseUrl = "https://".$_SERVER['HTTP_HOST'];
            $proxyUrl = $currentBaseUrl . "/proxy.php?client_id=" . $spidsdk->getClientId() . "&action=login&redirect_uri=" . $spidsdk->getRedirectURI() . "&idp=" . $_GET['idp'] . "&state=" . $spidsdk->getState();
            header("Location: " . $proxyUrl);
            exit;

            //OLD
            // $spidsdk->login($_GET['idp'], 2);  

            // set AttributeConsumingServiceIndex 2
            //$spidsdk->login($_GET['idp'], 2, "", 2);
        }
    }
?>

