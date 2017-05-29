
local Chun_li_vida=100
local Chun_li_velocidade=1
local Chun_li_gravidade=1
local Chun_li_andar=100
local Chun_li_anim_frame = 1
local Chun_li_pos_x = 30
local Chun_li_pos_y = 50
local Chun_li_walk = {}
local Chun_li_anim_time = 0
local Chun_li_crouch = {}
function love.load()
  for x = 1, 16 do -- carrega as imagens da animação
    Chun_li_walk[x] = love.graphics.newImage("Chun-li_20-" .. (x-1) .. ".png")
    Chun_li_walk[x+16] = love.graphics.newImage("Chun-li_21-" .. (x-1) .. ".png")
  end
  for x = 1, 2 do
    Chun_li_crouch[x] = love.graphics.newImage("Chun-li_121-" .. (x-1) .. ".png")
end
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    Chun_li_pos_x = Chun_li_pos_x + (100 * dt) -- movimenta o personagem
    Chun_li_anim_time = Chun_li_anim_time + dt
    if Chun_li_anim_frame > 15 then
      Chun_li_anim_frame = 1
    end
    end
    
  if love.keyboard.isDown("left") then
    Chun_li_pos_x = Chun_li_pos_x + (-100 * dt) -- movimenta o personagem
    Chun_li_anim_time = Chun_li_anim_time + dt
    if Chun_li_anim_frame > 31 or Chun_li_anim_frame < 17 then
      Chun_li_anim_frame = 17
    end
    end
  
  
    if love.keyboard.isDown("down") then
      Chun_li_pos_y = Chun_li_pos_y + (-100 * dt)
      Chun_li_anim_time = Chun_li_anim_time + dt
    if Chun_li_anim_frame > 1 then
      Chun_li_anim_frame = 0
  end
end

  if Chun_li_anim_time > 0.06 then -- quando acumular mais de 0.1
    Chun_li_anim_frame = Chun_li_anim_frame + 1 -- avança para proximo frame
    Chun_li_anim_time = 0
  end
end


function love.draw() -- desenha o personagem usando o indice da animação
  love.graphics.draw(Chun_li_walk[Chun_li_anim_frame], Chun_li_pos_x, Chun_li_pos_y)
  love.graphics.draw(Chun_li_crouch[Chun_li_anim_frame], Chun_li_pos_x, Chun_li_pos_y)
end
