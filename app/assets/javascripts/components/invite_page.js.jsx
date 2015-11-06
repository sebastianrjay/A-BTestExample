var InvitePage = React.createClass({

  componentDidMount: function() {
    DataHab.addChangeListener(Constants.SIGNUP_SUBMITTED, this._onSignupSubmit);
  },

  _onSignupSubmit: function() {
    
  },

  render: function() {
    var text = this.props.firstName + " thinks you should meet Bob. Join " +
      "Concierge to meet Bob and other awesome professionals in SF.";
    return (
      <section className="invite-page">
        <h2>{ text }</h2>
        <SignupForm gmailAddress={ this.props.gmailAddress } />
      </section>
    )
  }
});
