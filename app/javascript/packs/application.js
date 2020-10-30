
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);


require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("turbolinks").start()


