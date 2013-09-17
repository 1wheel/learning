var app = angular.module('myApp', []);

app.controller('PlayerController', ['$scope', function($scope){
	$scope.audio = document.createElement('audio');
	$scope.audio.src = 'npr.mp4';
	$scope.playing = false;

	$scope.play = function(){
		$scope.audio.play();
		$scope.playing = true;
	};
	$scope.stop = function(){
		$scope.audio.pause();
		$scope.playing = false;
	};

}]);

app.controller('RelatedController', ['$scope', function($scope){

}]);

app.run(function($rootScope){
	$rootScope.name = "ADAM!";
	z = $rootScope;
});

app.controller('MyController', function($scope){
	$scope.person ={
		name: "Becca K"
	};

	var updateClock = function(){
		console.log('a');
		$scope.clock = new Date();
	};
	var timer = setInterval(function(){
		$scope.$apply(updateClock);
	}, 1000);
	updateClock();
});

app.controller('ParentController', function($scope){
	$scope.person = {greeted: false};
});

app.controller('ChildController', function($scope){
	$scope.sayHello = function(){
		$scope.person.greeted = true;
	}
});