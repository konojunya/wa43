(function ($, window, google) {

  // 位置情報データ
  var locations = {
    'tokyo-station': {
      lat: 35.681298,
      lng: 139.7640529
    },
    'osaka-station': {
      lat: 34.7024854,
      lng: 135.4937566
    },
    'kyoto-station': {
      lat: 34.985849,
      lng: 135.7587667
    }
  };

  // 初期表示のlocationを指定
  var init_location = locations['tokyo-station'];

  // Google Mapの取得
  // 基本の設定
  /* 基本のレンダリング */
  var map = new google.maps.Map(document.getElementById('google-map'), {
    center: init_location,
    zoom: 14
  });

  // Markerのレンダリング
  var marker = new google.maps.Marker({
    position: init_location,
    map: map,
    animation: google.maps.Animation.DROP
  });

  // ボタンに対応する位置を取得して地図を更新する

  // GeoCodeで位置を取得し、地図を更新する

})(jQuery, window, google);
