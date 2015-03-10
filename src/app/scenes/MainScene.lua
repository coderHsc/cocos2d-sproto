local sproto = require "sproto"
local print_r = require "print_r"

local sp = sproto.parse [[
.foobar {
	.nest {
		a 1 : string
		b 3 : boolean
		c 5 : integer
	}
	a 0 : string
	b 1 : integer
	c 2 : boolean
	d 3 : nest

	e 4 : *string
	f 5 : *integer
	g 6 : *boolean
	h 7 : *foobar
}
]]

local obj = {
	a = "hello",
	b = 1000000,
	c = true,
	d = {
		a = "world",
		-- skip b
		c = -1,
	},
	e = { "ABC", "def" },
	f = { -3, -2, -1, 0 , 1, 2},
	g = { true, false, true },
	h = {
		{ b = 100 },
		{},
		{ b = -100, c= false },
		{ b = 0, e = { "test" } },
	},
}

local code = sp:encode("foobar", obj)
obj = sp:decode("foobar", code)

print_r(obj)

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
--
	--MainScene:test()
    cc.ui.UILabel.new({
            UILabelType = 2, text = "Hello, World", size = 64})
        :align(display.CENTER, display.cx, display.cy)
        :addTo(self)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end



return MainScene
