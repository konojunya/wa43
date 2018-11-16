<?php

require_once 'includes/init.php';
/**
 * ログインURLの設定
 */
$helper = $fb->getRedirectLoginHelper();
$permission = ['email'];
$loginUrl = $helper->getLoginUrl('http://edu03.cra.jp/09/includes/facebook-callback.php', $permission);
echo $loginUrl;

?>
<!doctype html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ログインページ</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="assets/materialize/css/materialize.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>

<nav>
    <div class="container">
        <div class="nav-wrapper">
            <div class="row">
                <div class="col s6 offset-s3">
                    <a class="brand-logo"><i class="material-icons left">roome</i>Google Maps API</a>
                </div>
            </div>
        </div>
    </div>
</nav>


<div class="container" style="margin-top: 50px;">
    <div class="center-align row">
        <a href="<?php echo htmlspecialchars($loginUrl) ?>" class="waves-effect waves-light btn js-get-map-by-location">Facebook Login</a>
    </div>
</div>

<script type="text/javascript" src="assets/jquery/jquery-1.12.3.js"></script>
<script type="text/javascript" src="assets/materialize/js/materialize.js"></script>

</body>
</html>
