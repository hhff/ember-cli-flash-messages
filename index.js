'use strict';

module.exports = {
  name: 'ember-cli-flash-messages',

  included: function(app) {
    this._super.included(app);
    app.import('vendor/css/ember-cli-flash-messages.css');
  }
};
