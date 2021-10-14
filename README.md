# Tripment

1. Parsing (https://github.com/forsaken1/tripment/pull/1/files)
2. API (https://github.com/forsaken1/tripment/pull/2/files)
3. Interface (optional) (https://github.com/forsaken1/tripment/pull/3)

## Installation

```shell
bundle install
bundle exec rails db:create db:migrate
```

## Usage

Run server

```
bundle exec rails s
```

Parse the data

```
bundle exec rake parse:procedures
```

## API

Procedures API `GET /api/v1/procedures?search=<search>&page=<page>&per=<per>`

## Tests

```
bundle exec rspec
```
