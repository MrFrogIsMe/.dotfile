package.path = "/Users/pengqize/.config/nvim/?.lua;" .. package.path
package.path = "/Users/pengqize/.config/nvim/lua/plugin_config/?.lua;" .. package.path

require("lua.keymaps")
require("lua.plugins")
require("lua.init")


vim.g.python3_host_prog = '/usr/local/opt/python@3/bin/python3.11'
