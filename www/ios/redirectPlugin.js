var RedirectPlugin = (function(){

	function ensureBoolean(callback){
		return function(result){
			callback(!!result);
		}
	}

	var RedirectPlugin = {};

	RedirectPlugin.switchToPasscode = function(successCallback, errorCallback) {
		return cordova.exec(successCallback,
			errorCallback,
			'RedirectPlugin',
			'switchToPasscode',
			[]);
	};

	return RedirectPlugin;
})();



module.exports = RedirectPlugin;
