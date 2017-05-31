
local Chun_li_vida=100
local Chun_li_velocidade=1
local Chun_li_gravidade=1
local Chun_li_andar=100
local Chun_li_anim_frame = 1
local Chun_li_pos_x = 30
local Chun_li_pos_y = 50
local Chun_li = {}
local Chun_li_attack = {}
local Chun_li_anim_time = 0
local Chun_li_anim_number = {16, 16, 11}
local cl_count = 1
local cl_anim_type = 0

function love.load()
  for x = 1, 3 do -- carrega as imagens da animação
    Chun_li[x] = {}
      for y = 1, Chun_li_anim_number[x] do
        Chun_li[x][y]=love.graphics.newImage("Chun-li_" ..cl_count.. ".png")
        cl_count = cl_count+1
        end
  end
end


function love.update(dt)
  if love.keyboard.isDown("right") then
    cl_anim_type = 1
    Chun_li_pos_x = Chun_li_pos_x + (100 * dt) -- movimenta o personagem
    Chun_li_anim_time = Chun_li_anim_time + dt
    
    if Chun_li_anim_time > 0.06 then -- quando acumular mais de 0.1
      Chun_li_anim_frame = Chun_li_anim_frame + 1 -- avança para proximo frame
      Chun_li_anim_time = 0
    end
    
    if Chun_li_anim_frame > 16 then
      Chun_li_anim_frame = 1
    end
    
  elseif love.keyboard.isDown("left") then
    cl_anim_type = 2
    Chun_li_pos_x = Chun_li_pos_x + (-100 * dt) -- movimenta o personagem
    
    Chun_li_anim_time = Chun_li_anim_time + dt
    if Chun_li_anim_time > 0.06 then -- quando acumular mais de 0.1
      Chun_li_anim_frame = Chun_li_anim_frame + 1 -- avança para proximo frame
      Chun_li_anim_time = 0
    end
    
    if Chun_li_anim_frame > 16 then
      Chun_li_anim_frame = 1
    end
  else
    cl_anim_type = 3
    
    Chun_li_anim_time = Chun_li_anim_time + dt
    if Chun_li_anim_time > 0.06 then -- quando acumular mais de 0.1
      Chun_li_anim_frame = Chun_li_anim_frame + 1 -- avança para proximo frame
      Chun_li_anim_time = 0
    end
    if Chun_li_anim_frame > 11 then
      Chun_li_anim_frame = 1
    end
  end
    
   --[[ Chun_li_anim_time = Chun_li_anim_time + dt
    if Chun_li_anim_time > 0.06 then -- quando acumular mais de 0.1
      Chun_li_anim_frame = Chun_li_anim_frame + 1 -- avança para proximo frame
      Chun_li_anim_time = 0
  end]]
end

function love.draw() -- desenha o personagem usando o indice da animação
  love.graphics.draw(Chun_li[cl_anim_type][Chun_li_anim_frame], Chun_li_pos_x, Chun_li_pos_y)
end
