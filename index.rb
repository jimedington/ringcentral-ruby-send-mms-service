require 'dotenv'
Dotenv.overload

require 'sinatra'
require 'down'
require 'ringcentral'

RINGCENTRAL_SERVER_URL = ENV['RINGCENTRAL_SERVER_URL']
RINGCENTRAL_CLIENT_ID = ENV['RINGCENTRAL_CLIENT_ID']
RINGCENTRAL_CLIENT_SECRET = ENV['RINGCENTRAL_CLIENT_SECRET']
RINGCENTRAL_USERNAME = ENV['RINGCENTRAL_USERNAME']
RINGCENTRAL_EXTENSION = ENV['RINGCENTRAL_EXTENSION']
RINGCENTRAL_PASSWORD = ENV['RINGCENTRAL_PASSWORD']

post '/' do
    status 200

    ringcentral_server_url = params['ringcentral_server_url']
    ringcentral_client_id = params['ringcentral_client_id']
    ringcentral_client_secret = params['ringcentral_client_secret']
    ringcentral_username = params['ringcentral_username']
    ringcentral_extension = params['ringcentral_extension']
    ringcentral_password = params['ringcentral_password']

    receiver = params['receiver']
    text = params['text']
    file_url = params['file_url']
    file_type = params['file_type']

    tempfile = Down.download(file_url)
    file_type ||= tempfile.content_type

    rc = RingCentral.new(ringcentral_client_id, ringcentral_client_secret, ringcentral_server_url)
    r = rc.authorize(username: ringcentral_username, extension: ringcentral_extension, password: ringcentral_password)
    puts r
    r = rc.post('/restapi/v1.0/account/~/extension/~/sms',
        payload: {
            to: [{ phoneNumber: receiver }],
            from: { phoneNumber: ringcentral_username },
            text: text
        },
        files: [
            [tempfile.path, file_type]
        ]
    )
    puts r.body
    rc.revoke()
    body 'OK'
end
