pico-8 cartridge // http://www.pico-8.com
version 33
__lua__
-- the ferryman
-- a thoughtless labs experiment

function _init()
	souls = {}
end

function _update60()
	if btnp(4) then
		for i=1,10 do
			spawnsoul()
		end
	end
	updatesoul()
end

function _draw()
	cls()
	drawsoul()
	for i=1,#souls do
		print(souls[i].x)
	end
end
-->8
-- souls

function addsoul(x,y,coin)
	s = {}
	s.x = x
	s.y = y
	s.coin = coin
	add(souls,s)
end

function spawnsoul()
	soulx = flr(1+rnd(127))
	souly = 130
	has_coin = flr(rnd(2))
	if has_coin == 0 then
		soulcoin = true
	else
		soulcoin = false
	end
	addsoul(soulx,souly,soulcoin)
end

function updatesoul()
	for i=#souls,1,-1 do
		souls[i].y -= 1
		
		if not check_collision(souls[i]) then
			souls[i].x = 5
		end
				
		if souls[i].y < 0 then
			del(souls,souls[i])
		end
	
	end
end

function drawsoul()
	for i=#souls,1,-1 do
		if souls[i].coin then
			col = 9
		else
			col = 7
		end
		rectfill(souls[i].x,souls[i].y,souls[i].x+5,souls[i].y+5,col)
	end
end
-->8
-- collission

function check_collision(sl)
	a=sl
	for i=#souls,1,-1 do
	b=souls[i]
	if a != b then
	return not (a.x>b.x+(b.x+5)
	or a.y>b.y+(b.y+5)
	or a.x+(a.x+5)<b.x
	or a.y+(a.y+5)<b.y)
	end
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
