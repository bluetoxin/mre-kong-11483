local inspect = require "inspect"

local MREHandler = {
  VERSION = "0.1.0",
  PRIORITY = 1100,
}

function MREHandler:access()
  ngx.run_worker_thread()
  ngx.say("Hello World")
end

return MREHandler
