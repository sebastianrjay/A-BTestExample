class AnalyticsController < ApplicationController

  def index
    # We want to compare signups and conversion rates from when the new feature
    # was introduced until the present, and for the same time period before the
    # feature was introduced.
    feature_introduction_date = DateTime.new(2015, 11, 8)
    pre_feature_start_date = DateTime.strptime((feature_introduction_date.to_i -
      (DateTime.now.to_i - feature_introduction_date.to_i)).to_s, '%s')

    @new_signup_count = Signup
      .where("created_at > ?", feature_introduction_date).count
    @previous_signup_count = Signup.where("created_at > ? AND created_at < ?",
      pre_feature_start_date, feature_introduction_date).count
    @new_invite_count = Invite
      .where("created_at > ?", feature_introduction_date).count
    @previous_invite_count = Invite.where("created_at > ? AND created_at < ?",
      pre_feature_start_date, feature_introduction_date).count

    @new_conversion_rate = (@new_signup_count.to_f / @new_invite_count)
    @previous_conversion_rate = (@previous_signup_count.to_f /
      @previous_invite_count)

    render :index
  end
end
