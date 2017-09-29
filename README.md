# <p align="center">[Crowdfach](https://crowdfach.herokuapp.com) of the Net
### Getting Started
First clone the repository:
```
git clone https://github.com/lisovskey/crowdfach.git
```
Be sure that you have **ruby 2.4+** and **bundler** installed

Then go ahead and update the gems:
```
cd crowdfach
bundle --without=production
```
**SQLite** is used for development mode so if you want to go production you'll need **PostgreSQL** be installed and configured according to `config/database.yml` production mode

So let's get it started:
```
rails s
```
Congratulations, you've discovered darknet
### <p align="center">Copyright 2017 [lisovskey](https://vk.com/lisovskey)
