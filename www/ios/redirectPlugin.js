var RedirectPlugin = (function(){

	function ensureBoolean(callback){
		return function(result){
			callback(!!result);
		}
	}

	var RedirectPlugin = {};

	RedirectPlugin.switchToLocation = function(successCallback, errorCallback) {
		return cordova.exec(successCallback,
			errorCallback,
			'RedirectPlugin',
			'switchToLocation',
			[]);
	};

	return RedirectPlugin;
})();



module.exports = RedirectPlugin;
