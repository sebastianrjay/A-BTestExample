# About

I built this app in 3 days. It records A/B testing metrics on a mocked up 
website feature, and features Gmail Oauth.

Check it out the interface for tested users 
[here](https://young-refuge-6353.herokuapp.com).

# Interface For Tested Users

* First, it prompts the user to log in via Gmail.
* Once the user is logged in, it asks the user to rate a fictional meeting they 
had with "Bob."
* If they give their meeting a 4 or 5-star rating, the app provides them a link 
to invite a friend to the app.
* Users who open the invite link can sign up to join the "Concierge" service.
* Invited users can sign up without logging in via Gmail. Users who sign in via 
Gmail are considered to have already signed up.

# A/B Tester Interface

The app tracks unique invites and signups by using cookies. Its
[analytics page](https://young-refuge-6353.herokuapp.com/analytics/) displays 
the conversion rate from invites to signups before and after the introduction of 
the ratings page invite feature. This app has always had that feature and never 
existed without it, but this is just a basic example of how one would implement 
an A/B test. (Normally A/B tests are conducted on two features simultaneously 
instead of on one feature at at time, but that's a minor detail.)

The only thing that's lacking on the analytics page is a binomial statistical 
hypothesis test to see if there's a statistically significant difference between 
the conversion rate before and after the introduction of the feature. It would 
be conducted as follows:

* c_0 = invite-to-signup conversion rate before feature introduction
* c_1 = invite-to-signup conversion rate after feature introduction
* Null hypothesis: c_1 = c_0
* Alternative hypothesis: c_1 > c_0 (could be greater or less, but let's assume 
that the data shows that c_1 is greater, which it is on the app)
* Level of significance: 0.05

Then, we perform a one-sided binomial hypothesis test (perhaps in 
[R](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/binom.test.html)):

* Input
	* x = number of sucesses = number of signups after feature introduction
	* n = number of trials = number of invites after feature introduction
	* p = null hypothesis probability of success = c_0 (the conversion rate before 
	feature introduction)
	* alternative = comparator between c_1 and c_0 = "greater", since our data 
	leads us to expect that c_1 > c_0 in the alternative hypothesis.
* Output
	* p-value < 0.05 implies that we accept the alternative hypothesis and reject 
	the null hypothesis. In other words, the alternative hypothesis IS 
	statistically valid.
	* p-value > 0.05 implies that we reject the alternative hypothesis and accept 
	the null hypothesis. In other words, the alternative hypothesis IS NOT 
	statistically valid.

# To-Do: API

Generalize this app to an API, so that companies and developers can easily track 
unique conversion rates on any feature or web page by loading a JS library and 
inserting some AJAX callbacks into the page. In addition to the conversion rate 
of each feature, the API would allow its end user to fetch the results of the 
binomial hypothesis test described above.
