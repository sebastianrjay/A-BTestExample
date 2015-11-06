window.PageActions = {
  submitRating: function(data) {
    AppDispatcher.dispatch({
      actionType: Constants.RATING_SUBMITTED,
      data: data
    });
  },

  submitSignup: function(data) {
    AppDispatcher.dispatch({
      actionType: Constants.SIGNUP_SUBMITTED,
      data: data
    });
  }
}
