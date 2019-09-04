# RingCentral Ruby MMS sending service


## Setup

```
Fork to private git of your own
```

Create Heroku app & synch to your fork


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


## Deploy

You can deploy this app to any server with a public adress, so that you can access it from anywhere.

You can also add some [password protection](http://recipes.sinatrarb.com/p/middleware/rack_auth_basic_and_digest) so that only you can use this service.
