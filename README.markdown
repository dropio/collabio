Collab.io
============================

This simple application searches for a particular query in the Twitter stream, characterizes it as positive or negative and archives the twit into a Drop as a note. 

This application requires to you sign up for an API key. To get an API key, go to [http://api.drop.io/](http://api.drop.io/).

Create a RAILS_ROOT/config/api.yml with the contents below, replacing "your_api_key" with your API key you were issued.

	dropio:
    	api_key: your_api_key

Then just...

    >mongrel_rails start
