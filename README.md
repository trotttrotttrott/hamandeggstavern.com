# Ham and Eggs

#### Getting started

1. Clone the repo
```
git clone git@github.com:trotttrotttrott/ham_and_eggs.git
```

1. Install bundle
```
bundle install
```

1. Create and update `.env`
```
cp .env.sample .env
```

1. Create and update `database.yml`
```
cp config/database.sample.yml config/database.yml
```

1. Create databases (assuming Postgres is installed and running)
```
rake db:create:all
```

1. Start server
```
foreman start
```

1. Go to http://0.0.0.0:5000

#### Running tests

```
rake
```

#### Deployment

Heroku!

1. Add the heroku remotes
```
git remote add heroku_staging git@heroku.com:hamandeggs-staging.git
git remote add heroku_prod git@heroku.com:hamandeggs.git
```

1. Push to the heroku remotes
```
git push heroku_staging master
git push heroku_prod master
```

#### Database backups

[PG Backups](https://devcenter.heroku.com/articles/pgbackups) is a Heroku add-on that "...lets you easily capture and manage backups for your Heroku Postgres databases".

List backups
```
heroku pgbackups
```

Create backup
```
heroku pgbackups:capture
```

Download the latest backup
```
curl -o hamandeggs.dump `heroku pgbackups:url --app hamandeggs`
```

Load dump file into your local Postgres database (update or remove `-U myuser`)
```
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U myuser -d ham_and_eggs_development hamandeggs.dump
```
