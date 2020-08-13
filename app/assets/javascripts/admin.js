$(function() {
  // ポストリストの個別アイテムにリンクを追加
  $('tbody tr[data-href]').addClass('clickable').click( function() {
    window.location = $(this).attr('data-href');
  }).find('a').hover( function() {
    $(this).parents('tr').unbind('click');
  }, function() {
    $(this).parents('tr').click( function() {
      window.location = $(this).attr('data-href');
    });
  });

  // dropzonejs
  Dropzone.autoDiscover = false;

  function insertImageUrl(image) {
    var html = `<div hidden class="btn btn-primary imageurl" data-clipboard-text="${image.url}">Copy Link</div>`
    return html
  }
  //images_controller.rbのcreateアクションが呼ばれる
  $('#my-dropzone').dropzone({
    maxFilesize: 200,// MB
    paramName: 'image[image]',
    clickable: true,
    success: function(file, response) {
      // file.previewElementでpreview要素のhtmlにアクセス
      $(file.previewElement).addClass('dz-success');
      $(file.previewElement).find('.dz-remove').hide();
      $(file.previewElement).find('.dz-progress').hide();
      $(file.previewElement).find('.dz-filename').find('span').text(response.url);

      // urlを埋め込んだ隠し要素を生成、埋め込み
      var imageUrl = insertImageUrl(response);
      $(file.previewElement).append(imageUrl);
    },
    // init executed at first when Page loaded
    init: function() {
      //this equal dropzone
      var me = this;

      //call list function in images_controller.rb with get method
      $.ajax({
        type: 'GET',
        url: "/admin/images",
        dataType: 'json',
        success: function(data){
          $.each(data.images, function(key, value) {
            if (data.images != undefined && data.images.length > 0) {
              me.emit("addedfile", value);
              me.emit("thumbnail", value, value.thumb);
              me.emit("complete", value);
              $(value.previewTemplate).attr("id", value.id);
              $(value.previewTemplate).find('.dz-size').hide();
              $(value.previewTemplate).find('.dz-filename').find('span').text(value.url);
              var imageUrl = insertImageUrl(value);
              $(value.previewTemplate).append(imageUrl);
              $(value._removeLink).hide();
            }
          });
        }
      });
    }
  });

  $(document).on("click", ".imageurl", function(){
    var url = $(this).data('clipboard-text');
    console.log(url);
  });

});
