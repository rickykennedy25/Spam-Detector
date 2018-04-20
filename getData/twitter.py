import requests
import json
from requests_oauthlib import OAuth1

TWITTER_API_SECRET = 'GRyG6GWfkL5dSu2KUMvHqsWpQqdEg4TKfC1s6F4mSCXc2sm1Ms'
TWITTER_API_KEY = 	'tn4vgSFypeapI77UlU0rnuU0s'
TWITTER_TOKEN = '984800304070721539-5f0RnB1qHIZkgLZWUdJQhWinqBMjpxw'
TWITTER_TOKEN_SECRET = '2GWV2KIGKgnl3VdRWxHyUyrX23yH8aDpZCtDAAlIUgkbe'
url = 'https://api.twitter.com/1.1/statuses/home_timeline.json'

auth = OAuth1(TWITTER_API_KEY, TWITTER_API_SECRET,
              TWITTER_TOKEN, TWITTER_TOKEN_SECRET)

r = requests.get(url, auth=auth)
print(r.text)