#!/usr/bin/lua5.3	


lgi = require("lgi")

gtk = lgi.require ("Gtk","3.0")
cairo = lgi.cairo

gtk.init()

bld = gtk.Builder()
bld:add_from_file("lab07.glade")

ui = bld.objects
a = 20
b = 20
c = 20

function ui.canvas:on_draw(cr)
	cr:set_source_rgb(1, 1, 1)
	cr:paint()
	
	for x = 1, 20 do
		for y = 1, 20 do
			for z = 1, 20 do
				cr:set_source_rgb(x / a, y / b, z / c)
				cr:rectangle(x * 15, y * 15, 10, 10)
				cr:fill()
			end
		end
	end
	
	return true
end

function ui.btn1:on_clicked()
	a = a * 1
	b = b - 1
	c = c + 1
	ui.canvas:queue_draw()
end

function ui.btn2:on_clicked()
	a = a - 1
	b = b + 1
	c = c * 1
	ui.canvas:queue_draw()
end

function ui.wnd:on_destroy(...)
	gtk.main_quit()
end

ui.wnd:show_all()

gtk.main()
