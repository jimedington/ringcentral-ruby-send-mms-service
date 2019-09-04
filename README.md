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

Example values for filetype:
text/vcard
image/jpeg

