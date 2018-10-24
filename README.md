# Juicymo Drone CI Ruby image

We use this image on a daily basis at [Integra Credit](https://github.com/integracredit) for Continuous Integration of Ruby on Rails apps we make for our clients.

[![](https://images.microbadger.com/badges/image/aleccunningham/drone-ruby.svg)](https://microbadger.com/images/aleccunningham/drone-ruby "Get your own image badge on microbadger.com")

## Installation

Compiled Docker image can be pulled from: [Docker Hub](https://hub.docker.com/r/aleccunningham/drone-ruby/).

![](http://dockeri.co/image/aleccunningham/drone-ruby)

## About

This is a Ruby image for [Drone](https://github.com/drone/drone), inspired by [413x/ruby-2.3.3-alpine](https://github.com/413x/ruby-2.3.3-alpine).

Intent of this image is CI testing of Ruby or Rails projects with Drone.

This image supports `Drone 0.9.0` and `Ruby 2.2.4`:

It has a [bundler](http://bundler.io/) installed.

## Usage

Just add similar `.drone.yml` to you project *(example is compatible with Drone 0.7.0)*:

```yaml
pipeline:
  bundle:
    image: aleccunningham/drone-ruby
    pull: true
    environment:
      - RAILS_ENV=test
    commands:
      - bundle install --path ./bundle --without production,development
    when:
      event: [ push, tag, pull_request ]
```

See source at [GitHub](https://github.com/aleccunningham/drone-ruby).
