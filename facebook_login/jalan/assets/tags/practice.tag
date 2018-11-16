<practice>

  <p>こんにちは、{name}さん</p>
  <a href="#" onclick={changeName}>クリック</a>

  <style>
    p {
      background: #f00;
      color: #fff;
      padding: 20px;
    }
  </style>

  <script>

    console.log('実行');
    this.firstname = opts.firstname;
    this.lastname = opts.lastname;
    this.name = this.firstname;

    this.changeName = function (e) {
      e.preventDefault();
      this.name = this.lastname;
    }

  </script>

</practice>
