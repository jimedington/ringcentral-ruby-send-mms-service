# RingCentral Ruby MMS sending service


## Setup

RingCentral - Create a RingCentral developer's account under your SuperAdmin account (it's FREE) at https://developers.ringcentral.com/. Create a private app name it what you want and select Platform Type "Server-Only (No UI)", and Permissions "SMS". When you commplete this step you have a Sandbox environment for your app to allow for testing the code found in this repository.

Github - Create your own fork on Github from this (creating your own repository) OR simply download the files and upload to your own repository. This code is ready to test once you have your RingCentral app and you have a Heroku app synched with it (next step).

Heroku - Create Heroku account to host your code on the cloud. Create an app, name it whatever you want & synch to your Github repository you created above. Upgrade your Dyno to Hobbyist so that your app doesn't fall asleep.


## Usage

HTTP Post to your Heroku app URL with the following parameters:

- receiver
- text
- file_url
- file_type
- ringcentral_server_url
- ringcentral_client_id
- ringcentral_client_secret
- ringcentral_username
- ringcentral_extension
- ringcentral_password

Example values for filetype (no quotations):
'text/vcard'
'image/jpeg'

## Known Issues

How it's coded right now only allows for 5 MMS per user per minute. The max allowable for MMS if I were to go the extra mile and code it properly would be 10 MMS per user per minute. This is an API limitation for MMS in general. The reason it's limited to 5 right now with how it's coded is because you're getting a new token each time you call the API. There is a way to store this token, but I was going for the quickest viable working solution (and 5 MMS per minute for us is well beyond what we need right now in our office).

There's no GUI. Even going to your app's URL on Heroku yields a "Not Found". But the code works. I've tested and re-tested it. I've even taken this code to a new repository and tested on a new Heroku app successfully just by connecting the git repository to the Heroku app.
