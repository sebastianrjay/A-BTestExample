window.ApiActions = {
  submitRating: function(data) {
    $.ajax({
      url: '/ratings',
      method: 'POST',
      data: data
    });
  }
}
