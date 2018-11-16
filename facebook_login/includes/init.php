<?php

/**
 *
 * 定数を定義
 *
 */
define("APP_ID", "698069817048925");
define("APP_SECRET", "1d12fbf9edbe06da4627174538fbe9df");

/**
 * セッションをスタート
 */
session_start();

/**
 *
 * Facebookのイニシャライズ
 * autoload.phpを読み込み
 *
 */
require_once 'php-graph-sdk-5.0.0/src/Facebook/autoload.php';

/**
 * Facebookのインスタンスを作成
 */
$fb = new \Facebook\Facebook([
  "app_id" => APP_ID,
  "app_secret" => APP_SECRET,
  "default_graph_version" => "v2.2",
]);