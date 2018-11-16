<?php

require_once 'includes/init.php';

/**
 *
 * セッション情報にfb_access_tokenが存在しなければ、login画面に遷移する
 *
 */
if(!isset($_SESSION["access_token"])) {
  header('Location: http://edu03.cra.jp/09/login.php');
}

$request = $fb->request("GET", "/me", [], $_SESSION["access_token"]);
try {
  $response = $fb->getClient()->sendRequest($request);
} catch(Exception $e) {
  echo $e->getMessage();
}

$graphNode = $response->getGraphNode();
var_dump($graphNode);

?>
<!doctype html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>Google Map Practice</title>
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
          <a class="brand-logo"><i class="material-icons left">roome</i>Google Map</a>
        </div>
      </div>
    </div>
  </div>
</nav>


<div class="container" style="margin-top: 50px;">
  <div class="center-align row">
    <a class="waves-effect waves-light btn js-get-map-by-location"><i class="material-icons left">room</i> 位置情報を取得してマップを表示する</a>
  </div>

  <div class="row">
    <div class="input-field col s6 offset-s3 center-align">
      <input placeholder="住所を入力" id="first_name" type="text" class="js-get-map-by-address-target">
      <label for="first_name">住所を検索</label>
      <a class="waves-effect waves-light btn js-get-map-by-address" data-location="kyoto-station">検索</a>
    </div>
  </div>

  <div class="center-align row">
    <a class="waves-effect waves-light btn js-get-map-by-place" data-location="kyoto-station"><i class="material-icons left">room</i> 京都駅</a>
    <a class="waves-effect waves-light btn js-get-map-by-place" data-location="osaka-station"><i class="material-icons left">room</i> 大阪駅</a>
  </div>

  <div class="row">
    <div class="col s12" id="google-map" style="height: 500px;">
    </div>
  </div>
</div>

<script type="text/javascript" src="assets/jquery/jquery-1.12.3.js"></script>
<script type="text/javascript" src="assets/materialize/js/materialize.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDILjQYP1WbCNWLqqNNbhLJG_-_DVLd3qk&sensor=false"></script>
<script type="text/javascript" src="assets/app/app_sample.js"></script>

</body>
</html>
