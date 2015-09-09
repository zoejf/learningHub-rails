$(function() {

  $('.endorsement').on('click', function() {
    var $endorsementIcon = $(this).find('.fa');

    //if not endorsed yet
    if ($endorsementIcon.hasClass('fa-thumbs-o-up')) {
      //fill in the thumbs-up icon 
      $endorsementIcon.removeClass('fa-thumbs-o-up').addClass('fa-thumbs-up');

      $.post('/')

    //else it's already been endorsed
    } else {

    };

  });

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

      //find id for resource to be un-bookmarked
      resourceId = $(this).attr('data-id');
      console.log(resourceId)

      //$.ajax method:delete
      $.ajax({
        url: '/bookmarks/' + resourceId,
        method: 'DELETE',
        success: function (data) {
          console.log(data);
        } 
      });
    }; //end of else statement
  })
})