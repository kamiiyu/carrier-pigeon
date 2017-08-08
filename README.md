# Carrier Pigeon

Carrier Pigeon is a intranet project of the TKGZ Office.  
She brings awesome messages to everyone worked in the TKGZ office like a carrier pigeon.  

## Features:

* Create/Edit/Publish an event(Training, Outing, etc.)
* Display event details
* Show event list

## Authority Matrix

#### Event

```
  ○: All
  □: Owned
  △: Published
  ×: None
```

| Action | Admin | Owner | Invited User | Other User | Anonymous |
| --- | --- | --- | --- | --- | --- |
| Index| ○ | □△ | △ | △ | △ |
| Show | ○ | □△ | △ | △ | × |
| Create | ○ | × | × | × | ×|
| Update | ○ | □ | × | × | ×|
| Publish | ○ | □ | × | × | ×|
| Enroll | △ | △ | △ | × | ×|
| Delete | × | × | × | × | ×|


## Development

Carrier Pigeon is a web based application that is developed on [Ruby on Rails](https://github.com/rails/rails).
System theme is [sb-admin-2](https://github.com/BlackrockDigital/startbootstrap-sb-admin-2) which is base on [Bootstrap](http://getbootstrap.com/).

### Recommend Development Environment

| Stack | Version |
| -------- | ------- |
| Ruby| 2.4.0 |
| Rails| 5.0.1 |
| Bootstrap| 3.3.7 |
| Postgresql| 9.6.1 |
| Redis| 3.2.6 |

#### Install dependencies

Enter Project folder.

    cd carrier-pigeon

Install dependencies with bundler.

    bundle install

#### Initialize Database

Note: User related tables is shared with [progress-review-api](https://git.xogrp.com/GZ-Odyssey/progress-review-api) temporarily, so we should import data from progress-review-api first and then run db migration.

    rails db:create
    rails db:migrate

#### Run Test

    rspec

#### Start Application Server

    rails s

Open browser and access `http://localhost:3000`.

## Deployment

Using Capistrano for development.

    cap stging deploy
