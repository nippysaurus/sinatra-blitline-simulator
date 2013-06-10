# Sinatra Blitline Simulator

This is a really crude blitline simulator which I am using to test some code locally without hitting the real blitline servers. The code is extremely bad and probably wont work with all the usual ways you sould expect the blitline service to work. It just replies with the format I expect in my application.

You will also need to make some small modifications to the blitline gem to allow a custom blitline url to be specified. The standard gem does not allow you to do this, so use [my fork](https://github.com/nippysaurus/blitline) of it.

## Installation

Add this line to your application's Gemfile:

    gem 'sinatra_blitline_simulator', :github => 'nippysaurus/sinatra-blitline-simulator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra_blitline_simulator

## Usage

Simply map the simulator to a path in your config.ru.

    run Rack::URLMap.new({
      '/blitline' => SinatraBlitlineSimulator::Application.new,
      '/'         => Sinatra::Application
    })

So then the blitline simulator will be running on the '/blitline/job' route. If you are using my custom blitline gem, start you application with the following environment variable to use the simulator instead of the online service.

    BLITLINE_URL='http://localhost:9292/blitline/job'