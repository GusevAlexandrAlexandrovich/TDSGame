#constant MOV_LEFT   65
#constant MOV_UP     87
#constant MOV_RIGHT  68
#constant MOV_DOWN   83

#constant MOV_SPEED  5


type TPlayer
	sprite as integer
	move ref as function()
endtype



function initPlayer()
	tmp as TPlayer
	
	
	tmp.sprite = CreateSprite(LoadImage("121.png"))
	SetSpritePosition(tmp.sprite,10,10)
	
endfunction tmp


function movePlayer(p ref as TPlayer)
	delta_x = 0
	delta_y = 0
	
	x# = GetSpriteX(p.sprite)
	y# = GetSpriteY(p.sprite)
	
	dx = GetRawMouseX() - GetSpriteX(p.sprite)
	dy = GetRawMouseY() - GetSpriteY(p.sprite)
	rotation = ATan2(dy,dx)
	
	SetSpriteAngle(p.sprite,rotation)
	
	if GetRawKeyState( MOV_LEFT )
			// Move Sprite to Left
			delta_x = -MOV_SPEED
			delta_y = 0
			SetSpritePosition ( p.sprite, GetSpriteX( p.sprite ) + delta_x, GetSpriteY ( p.sprite ) + delta_y )
	elseif GetRawKeyState ( MOV_UP )
			// Move Sprite Up
			delta_x = 0
			delta_y = -MOV_SPEED
			SetSpritePosition ( p.sprite, GetSpriteX( p.sprite ) + delta_x, GetSpriteY ( p.sprite ) + delta_y )
	elseif GetRawKeyState ( MOV_RIGHT )
			// Move Sprite to Right
			delta_x = MOV_SPEED
			delta_y = 0
			SetSpritePosition ( p.sprite, GetSpriteX( p.sprite ) + delta_x, GetSpriteY ( p.sprite ) + delta_y )
	elseif GetRawKeyState ( MOV_DOWN )
			// Move Sprite to Down
			delta_x = 0
			delta_y = MOV_SPEED
			SetSpritePosition ( p.sprite, GetSpriteX( p.sprite ) + delta_x, GetSpriteY ( p.sprite ) + delta_y )
	endif
	
endfunction


