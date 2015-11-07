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
          _inviteLink = 'https://young-refuge-6353.herokuapp.com/invites/' +
            payload.data.gmail_address;
          DataHub.emit(Constants.INVITE_LINK_CREATED)
        }
      }

      return true;
    })
  });
})(this);
