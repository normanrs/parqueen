# Parqueen

We have built an online parking app that allows a user to check if their current location is a valid place to park or now.  Users can supply their phone numbers and set intervals to receive a text message to warn them before their time expires.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

From GitHub clone down repository using the following commands in terminal:
* git clone git@github.com:mstang15/parqueen.git
* cd parqueen

### Prerequisites

You will need Rails installed and verify that it is version 5.2

To check your version using terminal run: rails -v in the command line.
If you have not installed rails, in terminal run: gem install rails -v 5.2 in the command line.


### Installing

This app require a keys.

You can sign up for a Google API key here: https://cloud.google.com/maps-platform/
You can sign up for a Coord API key here: https://coord.co/docs
You can sign up for a Twilio API key here: https://www.twilio.com/
Follow these directions to create a client id and secret: https://developers.google.com/adwords/api/docs/guides/authentication

Open terminal and run these commands:
* bundle
* bundle update
* figaro install
* in your config/applicaion.yml file add your keys with these names:
  * COORD_TOKEN:GOOGLE_CLIENT_ID:
  * GOOGLE_CLIENT_SECRET:
  * GOOGLE_API_KEY:
  * TWILIO_ACCOUNT_SID:
  * TWILIO_AUTH_TOKEN:
  * TWILIO_PHONE_NUMBER:
* rails db:{create,migrate,seed}
* rails s

Open up a web browser (preferably Chrome)

Navigate to localhost:3000 (a landing page should be displayed) that asks you to sign in with google.

![home page](Login.png)

### Using the App

A user can login to their app using a Google ID.
Once logged in, a user can opt to enter their phone numbers to receive text message alerts when their parking is about to expire.

A user will then see a map of their current location and have the option to park or save their current location.

![page with current location map](Map.png)

If their current location is a legal parking spot, a message will be displayed telling the user where they have parked.

![legal parking spot](Legal.png)

If their current location is not a legal parking spot, a message will be displayed telling the user that they cannot park in their current location.

![illegal parking spot](Illegal.png)


## Running the tests

* Note: Before running RSpec, ensure you're in the project root directory.

From terminal run: bundle exec rspec

After RSpec has completed, you should see all tests passing as GREEN.  Any tests that have failed or thrown an error will display RED.  Any tests that have been skipped will be displayed as YELLOW.

## Built With

* Rails
* RSpec
* ShouldaMatchers
* Capybara
* SimpleCov
* PostreSQL
* Faraday
* Figaro
* Bootstrap
* NewRelic
* Twilio


## Authors

* Harper Bellows - Github: hbellows
* Jennifer Lao - Github: jplao
* Meg Stang - Github: mstang15
* Norman Schultz - Github: normanrs
