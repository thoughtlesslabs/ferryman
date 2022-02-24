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
end
-->8
-- souls

function addsoul(x,y,coin,soulcol)
	s = {}
	s.w = 5
	s.h = 5
	s.x1 = x
	s.y1 = y
	s.x2 = s.x1 + s.w
	s.y2 = s.y1 + s.h
	s.col = soulcol
	s.coin = coin
	add(souls,s)
end

function spawnsoul()
	soulx = flr(1+rnd(127))
	souly = 60
	has_coin = flr(rnd(2))
	if has_coin == 0 then
		soulcoin = true
		col = 9
	else
		soulcoin = false
		col = 7
	end
	addsoul(soulx,souly,soulcoin,col)
end

function updatesoul()
	for i=#souls-1,1,-1 do
		i2=i+1
		if not check_collision(souls[i],souls[i2]) then
			souls[i].x1 += 5
		end
		souls[i].x2 = souls[i].x1+souls[i].w
	end
end

function drawsoul()
	for i=#souls,1,-1 do
		rect(souls[i].x1,souls[i].y1,souls[i].x2,souls[i].y2,souls[i].col)
	end
end
-->8
-- collission

function check_collision(a,b)
	return not (a.x1>b.x2
	or a.y1>b.y2
	or a.x2<b.x1
	or a.y2<b.y1)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
