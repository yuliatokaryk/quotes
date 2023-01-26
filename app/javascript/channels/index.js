// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

import '@fortawesome/fontawesome-free/js/fontawesome'
import '@fortawesome/fontawesome-free/js/solid'
import '@fortawesome/fontawesome-free/js/regular'
import '@fortawesome/fontawesome-free/js/brands'

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
