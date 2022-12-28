(() => {
	'use strict';

	Date.prototype.toDateInputValue = function () {
		var local = new Date(this);
		local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
		return local.toJSON().slice(0, 10);
	};

	document.querySelectorAll('.actualDate').forEach((element) => {
		element.value = new Date().toDateInputValue();
	});
})();
