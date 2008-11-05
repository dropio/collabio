Collab.io
============================

This sample application taps into the lesser used features of Drop.io to create a collaboration tool for a one time, topical meeting.

This application requires to you sign up for an API key. To get an API key, go to [http://api.drop.io/](http://api.drop.io/).

Create a RAILS\_ROOT/config/api.yml with the contents below, replacing "your\_api\_key" with your API key you were issued.

	dropio:
    	api_key: your_api_key

Then just...

    >mongrel_rails start
