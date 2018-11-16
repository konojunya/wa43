<?php

require_once 'init.php';

/**
 * callback処理を記述
 */
$helper = $fb->getRedirectLoginHelper();

try {
  $access_token = $helper->getAccessToken();
} catch(Exception $e) {
  echo $e->getMessage();
}

if(!$access_token) {
  if ($helper->getError()) {
    header('HTTP/1.0 401 Unauthorized');
    echo "認証に失敗しました。";
  } else {
    header('HTTP/1.0 400 Bad Request');
    echo 'リクエストに失敗しました。';
  }
  exit;
}

echo $access_token;

$_SESSION["access_token"] = $access_token->getValue();

/**
 * 正常にログインできれば、トップページに遷移
 */
header('Location: http://edu03.cra.jp/09');
