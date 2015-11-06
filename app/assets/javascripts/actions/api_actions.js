window.ApiActions = {
  submitRating: function(data) {
    $.ajax({
      url: '/ratings',
      method: 'POST',
      data: data
    });
  },

  submitSignup: function(data) {
    var signupCallback = function() {
      PageActions.submitSignup(data);
    }

    $.ajax({
      url: '/signups',
      method: 'POST',
      data: data,
      success: signupCallback
    });
  }
}
