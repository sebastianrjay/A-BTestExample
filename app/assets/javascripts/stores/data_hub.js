;(function(root) {

  var _inviteLink;

  root.DataHub = $.extend({}, EventEmitter.prototype, {

    addChangeListener: function(actionType, callback) {
      this.on(actionType, callback);
    },

    inviteLink: function() {
      return _inviteLink;
    },

    removeChangeListener: function(actionType, callback) {
      this.removeListener(actionType, callback);
    },

    dispatcherID: AppDispatcher.register(function (payload) {
      if (payload.actionType === Constants.RATING_SUBMITTED) {
        DataHub.emit(Constants.RATING_SUBMITTED);

        if(payload.data.rating > 3) {
          _inviteLink = 'localhost:3000/invites/' + payload.data.gmail_address;
          DataHub.emit(Constants.INVITE_LINK_CREATED)
        }
      } else if (payload.actionType === Constants.SIGNUP_SUBMITTED) {
        DataHub.emit(Constants.SIGNUP_SUBMITTED);
      }

      return true;
    })
  });
})(this);
