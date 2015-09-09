$(function() {

  $('.endorsement').on('click', function() {
    var $endorsementIcon = $(this).find('.fa');
    var $endorsementCount = $(this).next('.endorsement-count');
    var count = parseInt($endorsementCount.text());

    //if not endorsed yet
    if ($endorsementIcon.hasClass('fa-thumbs-o-up')) {

      //fill in the thumbs-up icon 
      $endorsementIcon.removeClass('fa-thumbs-o-up').addClass('fa-thumbs-up');

      $.post('/endorsements', {
        endorsement: { resource_id: $(this).attr('data-id')}
        },
        function (data) {
          console.log(data);
          $endorsementCount.text(count + 1);
        }
      )

    //else it's already been endorsed
    } else {
      //change thumbs up from filled to un-filled
      $endorsementIcon.removeClass('fa-thumbs-up').addClass('fa-thumbs-o-up');

      //find id for resource to be un-endorsed
      resourceId = $(this).attr('data-id');
      console.log(resourceId)

      //$.ajax method:delete
      $.ajax({
        url: '/endorsements/' + resourceId,
        method: 'DELETE',
        success: function (data) {
          console.log(data);
          $endorsementCount.text(count - 1);
        } 
      });

    };//end of else statment
  }); //end of endorsement event listener

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
  }); //end of bookmark event listener

});