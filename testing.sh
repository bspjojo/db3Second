#!/bin/bash

curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/users -d '{"user": {"email":"test1@foo.com", "name":"Test User 1", "password":"foo1"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/users -d '{"user": {"email":"test2@foo.com", "name":"Test User 2", "password":"foo2"}}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/users -d '{"user": {"email":"test3@foo.com", "name":"Test User 3", "password":"foo3"}}'

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

curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/users/follows -d '{"id": 1, "follows_id": 2}'
curl -i -H "Content-type: application/json" -X POST http://thompson.sqrawler.com:3000/users/follows -d '{"id": 1, "follows_id": 3}'

curl -i -H "Content-type: application/json" -X GET http://thompson.sqrawler.com:3000/users/splatts/1

curl -i -H "Content-type: application/json" -X GET http://thompson.sqrawler.com:3000/users/follow/1

curl -i -H "Content-type: application/json" -X GET http://thompson.sqrawler.com:3000/users/splatts-feed/1

curl -i -H "Content-type: application/json" -X DELETE http://thompson.sqrawler.com:3000/users/1/3

curl -i -H "Content-type: application/json" -X GET http://thompson.sqrawler.com:3000/users/splatts-feed/1
