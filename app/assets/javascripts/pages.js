$(function() {

  $('.bookmark').on('click', function() {
    var $bookmarkIcon = $(this).find('.fa');

    //fill in bookmark icon before ajax call for percieved speed
    $bookmarkIcon.removeClass('fa fa-bookmark-o').addClass('fa fa-bookmark');

    //ajax call to create new bookmark in db
    $.post('/bookmarks', {
      bookmark: { resource_id: $(this).attr('data-id') }
      },
      function (data) {
        console.log(data);
      } 
    )
  })
})