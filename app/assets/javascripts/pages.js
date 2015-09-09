$(function() {

  $('.bookmark').on('click', function() {
    var $bookmarkIcon = $(this).find('.fa');

    //if not bookmarked yet
    if ($bookmarkIcon.hasClass('fa-bookmark-o')) {

      //fill in bookmark icon before ajax call for percieved speed
      $bookmarkIcon.removeClass('fa fa-bookmark-o').addClass('fa fa-bookmark');

      $.post('/bookmarks.json', {
        bookmark: { resource_id: $(this).attr('data-id') }
        },
        function (data) {
          console.log(data);
        } 
      )

    } else {

      //change bookmark icon from filled to unfilled

      //$.ajax method:delete
      
    };

   
  })
})