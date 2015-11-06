window.PageActions = {
  submitRating: function(data) {
    AppDispatcher.dispatch({
      actionType: Constants.RATING_SUBMITTED,
      data: data
    });
  }
}
