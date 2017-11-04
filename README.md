# <p align="center">[Crowdfach](https://crowdfach.herokuapp.com) of the Net
### Getting Started
First clone the repository:
```
$ git clone https://github.com/lisovskey/crowdfach.git
```
Be sure that you have **ruby 2.4+** and **bundler** installed.

Then go ahead and update the gems:
```
$ cd crowdfach
$ bundle
```
If it fails seems to be you have a problem with **PostgreSQL**.
To solve it install `postgresql` if you haven't, start server and create superuser `crowdfach`.

Create and fill database:
```
$ rails db:create db:migrate
$ rails db:seed
```
Get it started:
```
$ rails s
```
Congratulations, you've discovered darknet.
### <p align="center">Copyright 2017 [lisovskey](https://telegram.me/lisovskey)
