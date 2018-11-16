<app>

  <div class="main-area">
    <div class="main-area-inner">
      <div id="map"></div>
    </div>
  </div>

  <div class="side-area">
    <div class="side-area-inner">
      <div class="row">
        <div class="col s12">
          <form class="row" onsubmit={search} id="search">
            <div class="col s6 input-field">
              <input type="date" ref="datepicker" name="stay_date" id="date" class="datepicker">
                <label for="date">宿泊日</label>
              </div>
              <div class="col s6 input-field">
                <select name="l_area" id="l_area" ref="l_area">
                  <option value="" disabled selected>地域を選択してください</option>
                  <option value="136200">銀座・日本橋・東京駅周辺</option>
                  <option value="136500">お茶の水・湯島・九段・後楽園</option>
                  <option value="136800">六本木・麻布・赤坂・青山</option>
                  <option value="137100">お台場・汐留・新橋・品川</option>
                  <option value="137400">上野・浅草・両国</option>
                  <option value="137700">池袋・目白・板橋・赤羽</option>
                  <option value="138000">新宿・中野・杉並・吉祥寺</option>
                  <option value="138300">渋谷・目黒・世田谷</option>
                  <option value="138600">蒲田・大森・羽田周辺</option>
                  <option value="138900">葛飾・江戸川・江東</option>
                  <option value="139200">八王子・立川・町田・府中・調布</option>
                  <option value="139500">青梅・奥多摩</option>
                  <option value="139800">伊豆七島・小笠原</option>
                </select>
              </div>

              <div class="col s12 input-field">
                <input type="number" name="adult_num" ref="adult_num" id="adult_num">
                  <label for="adult_num">大人人数</label>
                </div>
                <div class="col s12 l6 offset-l3">
                  <button type="submit" class="btn btn-block blue" style="width: 100%;"><i class="material-icons left">search</i>検索する</button>
                </div>
              </form>
            </div>
          </div>

          <div class="row">
            <div class="col s12" id="results-wrap">

              <card each={model in models} model={model}></card>

            </div>
          </div>
        </div>
      </div>

  <script>
    this.api = {
      root: 'http://hal.wire-frames.net/api/',
      key: 'cnc15c61f70694',
      api_name: 'StockSearch'
    }

    this.models = [];

    this.selected_model = null;

    this.condition = {
      l_area: 136200,
      stay_date: '20170810',
      stay_count: 3,
      adult_num: 2,
      count: 30
    };

    this.on('mount', function () {

      console.log("mount")
      // 日付指定
      $('.datepicker').pickadate({
        format: "yyyymmdd"
      });

      // セレクトボタン
      $('select').material_select();

      this.get();

    })

    this.on('update', function () {
      this.showMap()
    })

    // データを取得する
    this.get = function () {

      var that = this;

      this.models = [];

      $.get(this.api.root, {
        key: this.api.key,
        api_name: this.api.api_name,
        condition: this.condition
      }).done(function (resp) {

        var $plans = $(resp).find('Plan');

        $plans.each(function (i) {

          var $plan = $(this);

          that.models.push({
            name: $plan.find("PlanName").text(),
            hotel_name: $plan.find("HotelName").text(),
            rate: $plan.find("SampleRate").text(),
            picture_url: $plan.find("PlanPictureURL").text(),
            address: $plan.find("HotelAddress").text(),
            id: i
          });

        })

        that.selected_model = that.models[0];
        console.log(that.models)
        that.update();


      })


    }

    this.showMap = function () {
      if (!this.selected_model) return false;
      var address = this.selected_model.address;
      var geocoder = new google.maps.Geocoder();
      geocoder.geocode({ address: address }, function (results, status) {

        if (status === google.maps.GeocoderStatus.OK) {

          var map = new google.maps.Map(document.getElementById("map"),{
            center: results[0].geometry.location,
            zoom: 14
          })

          var marker = new google.maps.Marker({
            position: results[0].geometry.location,
            map: map
          })

        }

      })
    }

    this.search = function (e) {
      e.preventDefault();
      e.preventUpdate = true;

      console.log("here");

      // 1. 入力フォームの内容を取得
      // 2. 入力フォームの内容をthis.conditionにセット
      this.condition.stay_date = this.refs.datepicker.value ? this.refs.datepicker.value : this.condition.stay_date;
      this.condition.l_area = this.refs.l_area.value ? this.refs.l_area.value : this.condition.l_area;
      this.condition.adult_num = this.refs.adult_num.value ? this.refs.adult_num.value : this.condition.adult_num;
      // 3. this.getを実行する
      this.get();

    }

  </script>
</app>
