var SignupForm = React.createClass({

  mixins: [React.addons.LinkedStateMixin],

  componentDidMount: function() {
    this.placeholders = { firstName: "First Name", lastName: "Last Name",
      email: "Email Address", linkedinUrl: "LinkedIn URL (optional)" };
  },

  deletePlaceholder: function(e) {
    e.preventDefault();
    if(this.placeholders[e.target.name]) {
      var newState = {};
      newState[e.target.name] = "";
      this.setState(newState);
    }
  },

  getInitialState: function() {
    return { firstName: "First Name", lastName: "Last Name",
      email: "Email Address", linkedinUrl: "LinkedIn URL (optional)" };
  },

  _onSubmit: function(e) {
    e.preventDefault();
    var data = { first_name: this.state.firstName, email: this.state.email,
      last_name: this.state.lastName, linkedin_url: this.state.linkedinUrl };
    ApiActions.submitSignup(data);
  },

  render: function() {
    return (
      <form onSubmit={ this._onSubmit }>
        <input name="referringGmailAddress"
          value={ this.props.gmailAddress } type="hidden" />
        <input name="firstName" type="text" onClick={ this.deletePlaceholder }
          valueLink={ this.linkState('firstName') }/><br />
        <input name="lastName" type="text" onClick={ this.deletePlaceholder }
          valueLink={ this.linkState('lastName') }/><br />
        <input name="email" type="text" onClick={ this.deletePlaceholder }
          valueLink={ this.linkState('email') }/><br />
        <input name="linkedinUrl" type="text" onClick={ this.deletePlaceholder }
          valueLink={ this.linkState('linkedinUrl') }/><br />
        <button type="submit">Sign Up</button>
      </form>
    )
  }
});
