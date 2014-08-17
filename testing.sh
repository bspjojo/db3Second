#!/bin/bash

read -p
echo"creating users"
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/users -d '{"user": {"email":"test1@foo.com", "name":"Test User 1", "password":"foo1"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/users -d '{"user": {"email":"test2@foo.com", "name":"Test User 2", "password":"foo2"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/users -d '{"user": {"email":"test3@foo.com", "name":"Test User 3", "password":"foo3"}}'
echo"users created"

read -p
echo"creating splatts"
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 1 user 1", "user_id":"1"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 1 user 2", "user_id":"2"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 1 user 3", "user_id":"3"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 2 user 1", "user_id":"1"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 3 user 1", "user_id":"1"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 2 user 2", "user_id":"2"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 4 user 1", "user_id":"1"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 5 user 1", "user_id":"1"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 3 user 2", "user_id":"2"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 2 user 3", "user_id":"3"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 4 user 2", "user_id":"2"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 3 user 3", "user_id":"3"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 4 user 3", "user_id":"3"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 5 user 3", "user_id":"3"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/splatts -d '{"splatt": {"body":"splatt 5 user 2", "user_id":"2"}}'
echo"splatts created"

read -p
echo"forcing a following"
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/users/follows -d '{"id": 1, "follows_id": 2}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/users/follows -d '{"id": 1, "follows_id": 3}'
echo"following forced"

read -p
echo "getting splatts for user with id of 1"
curl -i -H "Content-type: application/json" -X GET http://thompson.sqrawler.com:3000/users/splatts/1
echo"splatts retrieved"

read -p
echo"getting list of followed users for user with id of 1"
curl -i -H "Content-type: application/json" -X GET http://thompson.sqrawler.com:3000/users/follow/1
echo"list retrieved"

read -p
echo"splatts feed for user with id of 1"
curl -i -H "Content-type: application/json" -X GET http://thompson.sqrawler.com:3000/users/splatts-feed/1
echo"done"

read -p
echo"user 1 has had a fall out with user 3"
curl -i -H "Content-type: application/json" -X DELETE http://thompson.sqrawler.com:3000/users/follows/1/3
echo"user 1 no longer follows user 3"

read -p
echo"splatts feed for user with id of 1"
curl -i -H "Content-type: application/json" -X GET http://thompson.sqrawler.com:3000/users/splatts-feed/1
echo "done"
