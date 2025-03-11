<?php 
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: /");
    die();
}

$redirectErrorUri = '{{PROXY_REDIRECT_URI}}' . '-error';
header("Location: " . $redirectErrorUri);
exit;