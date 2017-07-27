# Morph CSV proxy

Allows applications to download CSVs from [morph.io](https://morph.io) scrapers without needing an API key.

## Install

This is a Ruby web application, so you'll need to have Ruby and
[Bundler](https://bundler.io/) installed before running the steps below.

    git clone https://github.com/everypolitician/morph_csv_proxy
    cd morph_csv_proxy
    bundle install

## Usage

### Running the app

You'll need to get a [morph.io](https://morph.io) API key before you can run this application.

    export MORPH_API_KEY=replace-with-your-actual-key
    bundle exec ruby app.rb

### Making requests

You'll need to provide two parameters:

- `scraper` - the "slug" of the scraper you want to query, something like `username/scraper-name`
- `query` - the SQL query to run against the scraper's sqlite database

Assuming the application is running on port 4567 (the default):

    curl http://localhost:4567/?scraper=everypolitician-scrapers/estonia-riigikogu&query=select+*+from+data
