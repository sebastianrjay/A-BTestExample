var RatingForm = React.createClass({

    getInitialState: function() {
      return { rating: 5, reason: "Reason (optional)" };
    },

    _onSubmit: function(e) {
      e.preventDefault();
      var data = { rating: this.state.rating, reason: this.state.reason,
        gmailAddress: this.props.gmailAddress };
      PageActions.submitRating(data);
      ApiActions.submitRating(data);
    },

    render: function () {
      return (
        <form onSubmit={ this._onSubmit }>
          <h3>How would you rate your meeting with Bob?</h3>
          <select name="select" value={ this.state.rating }
            onChange={ this.updateSelected }>
            <option value="5">☆☆☆☆☆</option>
            <option value="4">☆☆☆☆</option>
            <option value="3">☆☆☆</option>
            <option value="2">☆☆</option>
            <option value="1">☆</option>
          </select><br />
          <textarea value={ this.state.reason }
            onChange={ this.updateReason }></textarea>
          <br /><button type="submit">Submit Rating</button>
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
