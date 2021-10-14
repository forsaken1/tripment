# Tripment

1. Parsing
2. API
3. Interface (optional)

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
