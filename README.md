# README

## High records

Exercise consisting of builind a high score service for a new game console using Ruby on Rails.

## Set up environment

For running a clean clone of the app:

```sh
$ vagrant up
$ vagrant ssh
$ cd /vagrant
$ bundle install
$ rake db:create db:migrate db:seed
$ rails server -b 0.0.0.0 -p 3000
```

## Main aspects

* Responsive design with Bootstrap
* Dependent destroy of scores when destroy a game
* Service object for ranking logic

## API calls

To communicate new scores a REST API is offered, the endpoint is shared for HTTP requests and JSON request by convention.
So **it's important** to specify both Content-Type and Accept headers to application/json in order to post payload in JSON format correctly.
An example below:

```http
POST /scores HTTP/1.1
Host: localhost:3000
Content-Type: application/json
Accept: application/json

{
"score": {
"player_email": "me@example.com",
"score": 10012,
"game_id": 12
}
}
```

And the HTTP response status code can be:

* 201 "Created" if score is stored or
* 422 "Unprocessable Entity" in case of errors with data.

In the last case the error messages are returned as response.

## Credits

Icons from Flaticon are licensed by CC 3.0 BY:

* Game controller made by Smashicons: https://www.flaticon.com/free-icon/game-controller_141074
* Score by Freepik: https://www.flaticon.com/free-icon/score_559771
* Ranking by Freepik: https://www.flaticon.com/free-icon/ranking_210997
