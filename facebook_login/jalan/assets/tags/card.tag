<card>
  <div class="card{ model.id == parent.selected_model.id ? ' selected' : '' }">
    <div class="row">
      <div class="col s3 image">
        <img src="{model.picture_url}" class="responsive-img" />
      </div>
      <div class="col s9 content">
        <ul>
          <li class="left"><i class="material-icons left">business</i>{model.hotel_name}</li>
          <li class="left"><i class="material-icons left">payment</i>{model.rate}円〜</li>
        </ul>
        <p class="clearfix">{model.name}</p>
        <a onclick={selectPlan} href="#" class="btn btn-block blue">地図で確認する</a>
      </div>
    </div>
  </div>
  <style>
    .card.selected {
      background-color: rgb(255, 237, 187);
    }
  </style>
  <script>
    // console.log(opts.model)
    this.model = opts.model;

    this.selectPlan = function (e) {
      console.log(this);
      this.parent.selected_model = this.model;
      this.parent.update();
    }

  </script>
</card>
