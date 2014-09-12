(function() { // We use this anonymous function to create a closure.

	var app = angular.module('splatter-web', ['ngResource']);
	
	app.factory("User", ['$resource', function($resource) {
		return $resource('http://thompson.sqrawler.com/api/users/:id.json', {id: '@id'},
			{
				update: { method:'PUT', url:'http://thompson.sqrawler.com/api/users/:id.json'},
				feed: { method: 'GET', isArray:true, url:'http://thompson.sqrawler.com/api/users/splatts-feed/:id.json'},
				ownFeed: { method: 'GET', isArray:true, url:'http://thompson.sqrawler.com/api/users/splatts/:id.json'},
			});
		}
	]);

	app.factory("Splatt", ['$resource', function($resource) {
		return $resource('http://thompson.sqrawler.com/api/splatts/', {},
			{
				post: { method: 'POST' }
			});
		}
	]);

	app.factory("Follow", ['$resource', function($resource) {
		return $resource('http://thompson.sqrawler.com/api/users/follows/.json', {id: '@id', follows_id: '@follows_id'},
			{
				follow: { method: 'POST' },
				deleteFollow: { method: 'DELETE', url:'http://thompson.sqrawler.com/api/users/:id/:follows_id.json'},
				getFollowing: {method: 'GET', isArray:true, url:'http://thompson.sqrawler.com/api/users/follow/:id.json'},
				getFollowers: {method: 'GET', isArray:true, url:'http://thompson.sqrawler.com/api/users/follower/:id.json'},			});
		}
	]);

	app.controller('AccountViewer', function(User) {
		this.user = null;
		this.id;


		this.getUser = function() {
			this.user = User.get({id: this.id});
		}
	});

	app.controller('LoginController', function(User){
		
		this.user;
		this.logged_in = false;

		//controls page shown,
		//add a list in to show the page and call default methods when needed
		this.tab = 0;

		this.id;
		this.name;
		this.email;
		this.password;
		this.blurb;

		this.login = function() {
			this.user = User.get({id: this.id});
			this.logged_in = true;
			this.tab = 0;
		}

		this.logout = function() {
			this.user = null;
			this.logged_in = false;
			this.tab = 0;
		}
		
		this.createAccount = function() {
			newUser = new User({user: {name: this.name, email: this.email, blurb: null, password: this.password}});
			newUser.$save();
			
		}

		this.editAccount = function() {
			//this.user.name = this.name;
			//this.user.blurb = this.blurb;
			//this.user.$update();
			//alert(this.user.name + " has been updated");
			User.update({id: this.user.user_id}, {user: {name: this.user.name, blurb: this.user.blurb}});
			this.data = {};
		};

		this.deleteAccount = function(){
			User.delete({id: this.user.user_id});
			logout();
		}
	});

	app.controller('SplattPoster', function(Splatt) {

		this.body = "";

		this.post_splatt = function(user_id_in) {
			//alert(this.body + "   " + user_id_in);
			Splatt.post({splatt: {body: this.body, user_id: user_id_in}});
			this.body="";
		}
	});


	app.controller('SplattFeedController', function(User) {
		
		this.splatts_feed;

		this.populate_splatts_feed = function(input_id) {
			this.splatts_feed = User.feed({id: input_id});
		}
	});


	app.controller('OwnSplattController', function(User) {
		
		this.splatts_own;

		this.populate_splatts_own = function(input_id) {
			this.splatts_own= User.ownFeed({id: input_id});
		}
	});

	app.controller('FollowControl', function(Follow) {
		this.follow = function(uidOne, uidTwo) {
			Follow.follow({id: uidOne, follows_id: uidTwo});
		}

		this.un_follow = function(uidOne, uidTwo) {
			Follow.deleteFollow({id: uidOne, follows_id: uidTwo});
		}

		this.followers;
		this.following;

		this.getFollowing = function(uid) {
			this.following = Follow.getFollowing({id: uid});
		}

		this.getFollowers = function(uid) {
			this.followers = Follow.getFollowers({id: uid});
		}
	});
})
();
