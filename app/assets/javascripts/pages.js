$(function() {

  $('.bookmark').on('click', function() {
    var $bookmarkIcon = $(this).find('.fa');

    //if not bookmarked yet
    if ($bookmarkIcon.hasClass('fa-bookmark-o')) {

      //fill in bookmark icon before ajax call for percieved speed
      $bookmarkIcon.removeClass('fa-bookmark-o').addClass('fa-bookmark');

      $.post('/bookmarks.json', {
        bookmark: { resource_id: $(this).attr('data-id') }
        },
        function (data) {
          console.log(data);
        } 
      )
    //else, it's already bookmarked
    } else {

      //change bookmark icon from filled to unfilled
      $bookmarkIcon.removeClass('fa-bookmark').addClass('fa-bookmark-o');

      //find id for bookmark
      bookmarkId = $(this).attr('data-id');

      //$.ajax method:delete
      $.ajax({
        url: '/bookmarks/' + bookmarkId,
        type: 'DELETE',
        success: function (data) {
          console.log(data);
        } 
      });
    }; //end of else statement
  })
})