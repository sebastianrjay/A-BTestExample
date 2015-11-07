var RatingForm = React.createClass({

    deletePlaceholder: function() {
      if(this.state.reason === "Reason (optional)") {
        this.setState({ reason: "" });
      }
    },

    getInitialState: function() {
      return { rating: 5, reason: "Reason (optional)" };
    },

    _onSubmit: function(e) {
      e.preventDefault();
      var data = { rating: this.state.rating, reason: this.state.reason,
        gmail_address: this.props.gmailAddress };
      PageActions.submitRating(data);
      ApiActions.submitRating(data);
    },

    render: function () {
      return (
        <form onSubmit={ this._onSubmit }>
          <h3>How would you rate your meeting with Bob?</h3><br /><br />
          <select name="select" value={ this.state.rating }
            onChange={ this.updateSelected } className="rating-select">
            <option value="5">☆☆☆☆☆</option>
            <option value="4">☆☆☆☆</option>
            <option value="3">☆☆☆</option>
            <option value="2">☆☆</option>
            <option value="1">☆</option>
          </select><br /><br /><br />
          <textarea value={ this.state.reason } onClick={ this.deletePlaceholder }
            onChange={ this.updateReason } className="rating-textarea"></textarea>
          <br /><button className="btn btn-lg btn-block btn-primary" type="submit">Submit Rating</button>
        </form>
      );
    },

    updateReason: function(e) {
      this.setState({ reason: e.target.value });
    },

    updateSelected: function(e) {
      this.setState({ rating: 5 - e.currentTarget.selectedIndex });
    }
});
