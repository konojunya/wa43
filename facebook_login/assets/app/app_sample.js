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

  // イベントで ロケーションを変更
  var $btn_place = $('.js-get-map-by-place');

  $btn_place.on('click', function (evt) {

    var $elem = $(this);
    var target_location = $elem.data('location');
    var location = locations[target_location];

    map.setCenter({
      lat: location.lat,
      lng: location.lng
    });


  });

  // イベントで現在の位置情報を取得してその場所を表示する
  var $btn_geo = $('.js-get-map-by-location');

  $btn_geo.on('click', function (evt) {
    if ( navigator.geolocation ) {
      navigator.geolocation.getCurrentPosition(function (pos) {
        // コールバック処理
        var pos = {
          lat: pos.coords.latitude,
          lng: pos.coords.longitude
        };
        map.setCenter(pos);

        // マーカーもおいてみる
        var marker = new google.maps.Marker({
          position: pos,
          map: map,
          title: 'いまココ'
        });

      });
    }
  });

  // GeoCodeで地図を取得

  var $btn_address = $('.js-get-map-by-address');

  $btn_address.on('click', function (evt) {
    var $elem = $(this);
    var address = $elem[0].value;
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({address: address}, function (results, status) {

      // コールバック
      if ( status === google.maps.GeocoderStatus.OK ) {
        map.setCenter(results[0].geometry.location);
      }

    });

  });

})(jQuery, window, google);