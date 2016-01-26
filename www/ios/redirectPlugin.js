var RedirectPlugin = (function(){

	/********************
	 * Internal functions
	 ********************/

	function ensureBoolean(callback){
		return function(result){
			callback(!!result);
		}
	}

	/**********************
	 * Public API functions
	 **********************/
	var RedirectPlugin = {};

	/**
	 * Switch to settings app. Opens settings page for this app.
	 *
	 * @param {Function} successCallback - The callback which will be called when switch to settings is successful.
	 * @param {Function} errorCallback - The callback which will be called when switch to settings encounters an error.
	 * This callback function is passed a single string parameter containing the error message.
	 * This works only on iOS 8+. iOS 7 and below will invoke the errorCallback.
	 */
	RedirectPlugin.switchToLocation = function(successCallback, errorCallback) {
		return cordova.exec(successCallback,
			errorCallback,
			'RedirectPlugin',
			'switchToSettings',
			[]);
	};

	return RedirectPlugin;
})();



module.exports = Diagnostic;
