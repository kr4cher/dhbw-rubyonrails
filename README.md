# Ruby on Rails

## Start
```shell script
$ rails s
```

## Generator
```shell script
$ rails g scaffold User email:string username:string passwort:string
$ rails g scaffold Post title:string user:references
$ rails g migration
$ rails g controller articles
```

## Routing
Configuration: *config/routes.rb*

Docs: [https://devdocs.io/rails~6.0/guides/routing](https://devdocs.io/rails~6.0/guides/routing)

## Validation
[https://devdocs.io/rails~6.0/guides/active_record_validations](https://devdocs.io/rails~6.0/guides/active_record_validations)

## Database
### Migrations
```shell script
# test environment
$ rails db:migrate RAILS_ENV=test
```
#### References
```shell script
# Reference
$ rails g migration AddUserRefToProducts user:references
# JoinTable
$ rails g migration CreateJoinTableCustomerProduct customer product
```

### Edit
```shell script
# Rollback Migration
$ rails db:rollback RAILS_ENV=test
# -> edit migrations
$ rails db:migrate RAILS_ENV=test
```

### Reset
```shell script
$ rails db:reset

# equivalent to
$ rails db:drop db:setup
```

## Routes
[https://devdocs.io/rails~6.0/guides/routing](https://devdocs.io/rails~6.0/guides/routing)

[Getting Started](https://devdocs.io/rails~6.0/guides/getting_started#setting-the-application-home-page)
