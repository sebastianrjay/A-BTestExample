var RatingPage = React.createClass({

  componentDidMount: function() {
    DataHub.addChangeListener(Constants.RATING_SUBMITTED, this._onRatingSubmit);
    DataHub.addChangeListener(Constants.INVITE_LINK_CREATED,
      this._onInviteLinkCreate);
  },

  getInitialState: function() {
    return { ratingSubmitted: false, displayInviteLink: false };
  },

  _onInviteLinkCreate: function() {
    this.setState({ displayInviteLink: true });
  },

  _onRatingSubmit: function() {
    this.setState({ ratingSubmitted: true });
  },

  render: function() {
    var bottomContent = "", topContent = <h2>Thank you for submitting!</h2>
    if(!this.state.ratingSubmitted) {
      topContent = <RatingForm gmailAddress={ this.props.gmailAddress } />
    }

    if(this.state.displayInviteLink) {
      var text = "Know anyone Bob should know? Tell them to sign up via " +
        "this link, and we'll set them up with Bob the next week!";
      bottomContent = (
        <div>
          <h3>{ text }</h3>
          <a href={ DataHub.inviteLink() }>{ DataHub.inviteLink() }</a>
        </div>
      )
    }
    
    return (
      <div id='rating-page'>
        { topContent }
        { bottomContent }
      </div>
    )
  }
});
