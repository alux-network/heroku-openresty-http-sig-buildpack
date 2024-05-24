# OpenResty Http Message Signature Buildpack for Heroku

## Description
Using Nginx with OpenResty as reverse proxy to access API, making the API implement [RFC 9421
HTTP Message Signatures](https://www.rfc-editor.org/rfc/rfc9421.html).


## Getting started

The easiest way to get started with this buildpack is to check out the [http sig](https://github.com/alux-network/heroku-openresty-http-sig.git) app.

### Basic usage

Clone the Http Sig app

```bash
$ git clone https://github.com/alux-network/heroku-openresty-http-sig.git
$ cd heroku-openresty-http-sig
```

Create a new Heroku app

```bash
$ heroku apps:create --stack=heroku-22 --buildpack=https://github.com/alux-network/heroku-openresty-http-sig-buildpack.git
```

We have to add the `heroku/python` buildpack as well so that we can compile the `nginx.conf` template.

```bash
$ heroku buildpacks:add heroku/python
```
Push the app to Heroku

```bash
$ git push heroku master
```

Visiting the app's URL(e.g. https://test.alux.fun) in your web browser will display "Example Domain".
```
curl https://test.alux.fun
```
Set the ```x-proxy-target``` value on the ```http header``` to the domain name you want to reverse proxy.
```
curl -H "x-proxy-target: www.google.com" https://test.alux.fun
```

## Supported Heroku stacks

This buildpack has been tested with the following Heroku stacks:

* `heroku-22`

## Note
`nginx.conf` and `lua scripts` are included in the buildpack by default. If they exist in the App, the version in the App will be used.

## Reference
[heroku-openresty-buildpack](https://github.com/benwilber/heroku-openresty-buildpack.git)

