
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)
local SocketManager = require("app.scenes.socket_manager")
local socket = require "socket"
local scheduler = require("framework.scheduler")
local scheduler_handler_ = nil 
local udp = socket.udp() 
udp:settimeout(0)
udp:setpeername("192.168.38.113", 8765)
local cnt = 0
function MainScene:ctor()

	--udp = socket.udp()
	--udp:settimeout(0)
	--udp:setpeername("192.168.38.113", 8765)
	scheduler_handler_ = scheduler.scheduleGlobal(handler(self, self.update), 0)


	local pre_time = os.time()
	-- local cnt = 0 
	-- for i =1 ,10000, 1 do 

	-- 	local str = "wocao ni mei"
	
	-- 	udp:send(str)
	-- 	--udp:receive()
	-- 	if udp then
	-- 		local rece_str = udp:receive()

	-- 		if rece_str == nil then 
	-- 			cnt = cnt +1 
	-- 			udp:send(str)
	-- 			--print("",rece_str)
	-- 		else
	-- 			--print(rece_str)
	-- 		end 
	-- 	end
	-- 	--print("",str)

	-- end 
	--print("hello,world",os.time()-pre_time,cnt)
	


	--print("hello,world",udp:getpeername())

	--udp:close()

     --SocketManager:init()
end

function MainScene:update(ts)

	udp:send("hello")
	local rece_str = udp:receive()

	if rece_str == nil then 
		cnt = cnt + 1
	end
	print("ans",rece_str,cnt)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene

--60* 1000  6w次
