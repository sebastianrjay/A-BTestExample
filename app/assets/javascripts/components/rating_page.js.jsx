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
          <h3>{ text }</h3><br />
          <div id="invite-link-container">
            <a id="invite-link"
              href={ DataHub.inviteLink() }>{ DataHub.inviteLink() }</a>
          </div>
        </div>
      )
    }

    return (
      <div id='rating-page'>
        <section className="row rating-page-padding" />
        <section className="row">
          <div className="col-lg-4"></div>
          <div className="col-lg-4">
            { topContent }
          </div>
          <div className="col-lg-4"></div>
        </section><br />
        <section className="row">
          <div className="col-lg-3"></div>
          <div className="col-lg-6">{ bottomContent }</div>
          <div className="col-lg-3"></div>
        </section>
      </div>
    )
  }
});
