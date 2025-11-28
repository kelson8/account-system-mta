--iManGaaX

sw,sh = guiGetScreenSize()
mx, my = sw * 0.122, sw * 0.244
sy = 0
ssy = sh
myy = 0

font = dxCreateFont( "font.ttf", 15 )

function createLoginPanel()
    addEventHandler("onClientRender",getRootElement(),renderLoginPanel)
    addEventHandler("onClientRender",getRootElement(),renderLoginContent)
	addEventHandler("onClientPreRender", getRootElement(), anim)
    showCursor(true,true)
    toggleAllControls(false)
    showChat(false)
    xml = xmlLoadFile("userdata.xml")
    loadXML()
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), createLoginPanel)

time = getTickCount()
x = 1300
y = -1770
z = 100
x2 = 1223
y2 = -1737
z2 = 69
function anim()
 y = y+0.4
 setCameraMatrix(x,y,z, x2, y2, z2)
 if (getTickCount() - time >= 5000) then 
  removeEventHandler("onClientPreRender", getRootElement(), anim) 
 end
end

function loadXML()
  if not xml then
    xml = xmlCreateFile("userdata.xml","userdata")
    usernameChild = xmlCreateChild(xml,"username")
    passwordChild = xmlCreateChild(xml,"password")
    checkboxChild = xmlCreateChild(xml,"state")
    xmlSaveFile(xml)
  else
    usernameChild = xmlFindChild(xml,"username",0)
    passwordChild = xmlFindChild(xml,"password",0)
    checkboxChild = xmlFindChild(xml,"state",0)
  end
  if xmlNodeGetValue(checkboxChild) == "true" then
   checkboxs[1].state = true
  end
    usernameLoad = xmlNodeGetValue(usernameChild)
    passwordLoad = xmlNodeGetValue(passwordChild)
    for w in string.gmatch(usernameLoad, ".") do
      for i,ebox in ipairs(editbox) do
        if ebox.name == "username" then
          table.insert(text[i], w)
        end
      end
    end
    for w in string.gmatch(passwordLoad, ".") do
      for i,ebox in ipairs(editbox) do
        if ebox.name == "password" then
          table.insert(text[i], w)
        end
      end
    end
end
function saveXML(username,password,checkboxState)
  if checkboxs[1].state == true then
    xmlNodeSetValue(usernameChild,username)
    xmlNodeSetValue(passwordChild,password)
    xmlNodeSetValue(checkboxChild,tostring(checkboxState))
    xmlSaveFile(xml)
  else
    xmlNodeSetValue(usernameChild,"")
    xmlNodeSetValue(passwordChild,"")
    xmlNodeSetValue(checkboxChild,"")
    xmlSaveFile(xml)
  end
end
addEvent("saveXML",true)
addEventHandler("saveXML",getRootElement(),saveXML)

credits = {
{ x = sw * 0.5375 - ( sw * 0.15 ), y = sh * 0.57 - ( sh * 0.25 ), w = sw * 0.22, h = sw * 0.22, image = "back2.png", color = tocolor(0, 0, 0, 160)  }
}

field = {
{ typ = "login", x = sw * 0.5, y = sh * 0.5 - ( sh * 0.405)/2, w = 0, h = sw * 0.244, image = "back.png"},
{ typ = "login", x = sw * 0.5, y = sh * 0.5 - ( sh * 0.405)/2, w = 0, h = sw * 0.244, image= "erbox.png", ercolor = tocolor(0, 0, 0), erbox = "grey", text = "Your Server Name", messageBox = "1"  }
}

buttons = {
{ typ = "login", x = sw * 0.5 + sw * 0.0122, y = sh * 0.5 - ( sh * 0.405)/2 + sw * 0.0854 + sw * 0.0244 + sw * 0.0122 + sw * 0.0244 +  sw * 0.0244 + sw * 0.244 * 0.02, w = sw * 0.244 * 0.3, h = sw * 0.0244, color = tocolor( 0, 0, 0, 160), text = "Login", func = "pressLogin"},
{ typ = "login", x = sw * 0.5 - sw * 0.122 + sw * 0.0366, y = sh * 0.5 - ( sh * 0.405)/2 + sw *  0.0854 +  sw * 0.0244 + sw * 0.0122 +  sw * 0.0244 + sw * 0.0244 + sw * 0.244 * 0.02, w = sw * 0.244 * 0.3, h = sw * 0.0244, color = tocolor( 0, 0, 0, 160), text = "Register", func = "pressRegisterBut"},
{ typ = "register", x = sw * 0.5 + sw * 0.0122, y = sh * 0.5 - ( sh * 0.405)/2 + sw *  0.0854 + sw * 0.0244 + sw * 0.0122 + sw * 0.0244 +  sw * 0.0244 + sw * 0.244 * 0.02, w = sw * 0.244 * 0.3, h = sw * 0.0244, color = tocolor( 0, 0, 0, 160), text = "Register", func = "pressRegister"},
{ typ = "register", x = sw * 0.5 - sw * 0.122 + sw * 0.0366, y = sh * 0.5 - ( sh * 0.405)/2 + sw *  0.0854 +  sw * 0.0244 + sw * 0.0122 +  sw * 0.0244 + sw * 0.0244 + sw * 0.244 * 0.02, w = sw * 0.244 * 0.3, h = sw * 0.0244, color = tocolor( 0, 0, 0, 160), text = "Back", func = "pressBack"},
}

editbox = {
{ typ = "login", x = sw * 0.5 - sw * 0.122 + sw * 0.244 * 0.3, y = sh * 0.5 - ( sh * 0.405)/2 + sw * 0.244 * 0.34, w = sw * 0.244 * 0.6, h = sw * 0.0244, image = "ebox.png", color = tocolor( 0, 0, 0, 160), text = "", textup = "Username", name = "username"},
{ typ = "login", x = sw * 0.5 - sw * 0.122 + sw * 0.244 * 0.3, y = sh * 0.5 - ( sh * 0.405)/2 + sw * 0.244 * 0.34 + sw * 0.0244 + sw * 0.0122, w = sw * 0.244 * 0.6, h = sw * 0.0244, image = "ebox.png", color = tocolor( 0, 0, 0, 160), text = "", textup = "Password", name = "password", hide = true},
{ typ = "register", x = sw * 0.5 - sw * 0.122 + sw * 0.244 * 0.3, y = sh * 0.5 - ( sh * 0.405)/2 + sw * 0.244 * 0.34 - sw * 0.0122, w = sw * 0.244 * 0.6, h = sw * 0.0244, image = "ebox.png", color = tocolor( 0, 0, 0, 160), text = "", textup = "Username", name = "usernameReg"},
{ typ = "register", x = sw * 0.5 - sw * 0.122 + sw * 0.244 * 0.3, y = sh * 0.5 - ( sh * 0.405)/2 + sw * 0.244 * 0.34 + sw * 0.0244, w = sw * 0.244 * 0.6, h = sw * 0.0244, image = "ebox.png", color = tocolor( 0, 0, 0, 160), text = "", textup = "Password", name = "passwordReg", hide = true},
{ typ = "register", x = sw * 0.5 - sw * 0.122 + sw * 0.244 * 0.3, y = sh * 0.5 - ( sh * 0.405)/2 + sw * 0.244 * 0.34 + sw * 0.0244 + sw * 0.0244 + sw * 0.0122, w = sw * 0.244 * 0.6, h = sw * 0.0244, image = "ebox.png", color = tocolor( 0, 0, 0, 160), text = "", textup = "Password", name = "passwordRRepeat", hide = true}
}

checkboxs = {
  { x =  sw * 0.5 + sw * 0.244 * 0.05, y = sh * 0.5 - ( sh * 0.405)/2 + sw * 0.244 * 0.34 + sw * 0.0244 + sw * 0.0122 + sw * 0.0244 + sw * 0.0122, wh = sw * 0.244 * 0.05, state = false, text = "Remember me" }
}

text = {}
for i,ebox in ipairs(editbox) do
table.insert(text,{})
end
bindKey("backspace", "down", function ()
  table.remove(text[eboxClickI], #text[eboxClickI])
end)
function getCharacter(character)
  for i,ebox in ipairs(editbox) do
    if eboxClickI == i then
      table.insert(text[i], character)
    end
  end
end

function renderLoginPanel()
  for index, field in ipairs ( credits ) do
    local seconds = getTickCount()  
    dxDrawImage( field.x, field.y  , field.w, field.h  , field.image, -seconds * 0.025, 0, 0 )
  end
    for index, login in ipairs ( field ) do
      if login.typ then 
        if (login.typ == "login") then 
	      dxDrawImage( login.x - mx, login.y  , login.w + my, login.h  , login.image, 0, 0, 0, login.ercolor )
	        if login.erbox then 
	          if (login.erbox == "green") then
	            login.ercolor = tocolor ( 0, 200, 0, 204 )
	          elseif ( login.erbox == "red") then 
	            login.ercolor = tocolor( 200, 0, 0, 204 )
	          elseif ( login.erbox == "grey") then 
	            login.ercolor = tocolor( 0, 0, 0, 204 )
	          end
	        end
	          if login.text then 
	            dxDrawText( login.text, login.x, login.y + login.h * 0.2  , login.x + login.w, login.y + login.h  , tocolor(230,230,230), sw/2000, font, "center")
              end
            end
        end 
    end
end 

function renderLoginContent()
  for i,ebox in ipairs(editbox) do
    if ebox.typ then 
	  if ( ebox.typ == "login" ) then 
        dxDrawImage( ebox.x, ebox.y + sy  , ebox.w, ebox.h, ebox.image, 0, 0, 0, ebox.color )
          if ebox.textup then
            dxDrawText( ebox.textup, ebox.x - ebox.x * 0.12, ebox.y + ebox.h * 0.25 + sy  , ebox.x + ebox.w, ebox.y + ebox.h  , tocolor( 230,230,230), sw/2000, font)
          end
            if isMouseWithinRangeOf(ebox.x, ebox.y + sy  , ebox.w, ebox.h) then
		      ebox.color = tocolor( 0, 0, 0, 200)
            else
              ebox.color = tocolor( 0, 0, 0, 160)
            end
              if ebox.text then
                ebox.text = table.concat(text[i],"")
                  if ebox.hide == true then
                    dxDrawText (string.rep("•",#text[i],""), ebox.x + 10, ebox.y + sy  , ebox.x + ebox.w, ebox.y + ebox.h + sy  , tocolor( 230,230,230), sw/1600, font, "left", "center", true)
                  else
                    dxDrawText ( table.concat(text[i],""), ebox.x + 10, ebox.y + sy  , ebox.x + ebox.w, ebox.y + ebox.h + sy  , tocolor( 230,230,230), sw/1600, font, "left", "center",true)
                  end
              end
                if eboxClickI == i then
                  dxDrawImage( ebox.x, ebox.y  , ebox.w, ebox.h, "border.png", 0, 0, 0, tocolor(0, 0, 0 ))
                end
	  elseif ( ebox.typ == "register" ) then 
	    dxDrawImage( ebox.x, ebox.y + ssy  , ebox.w, ebox.h, ebox.image, 0, 0, 0, ebox.color )
          if ebox.textup then
            dxDrawText( ebox.textup, ebox.x - ebox.x * 0.12, ebox.y + ebox.h * 0.25 + ssy  , ebox.x + ebox.w, ebox.y + ebox.h  , tocolor( 230,230,230), sw/2000, font)
          end
            if isMouseWithinRangeOf(ebox.x, ebox.y + ssy  , ebox.w, ebox.h) then
		      ebox.color = tocolor( 0, 0, 0, 200)
            else
              ebox.color = tocolor( 0, 0, 0, 160)
            end
              if ebox.text then
                ebox.text = table.concat(text[i],"")
                  if ebox.hide == true then
                    dxDrawText (string.rep("•",#text[i],""), ebox.x + 10, ebox.y + ssy  , ebox.x + ebox.w, ebox.y + ebox.h + ssy  , tocolor( 230,230,230), sw/1600, font, "left", "center", true)
                  else
                    dxDrawText ( table.concat(text[i],""), ebox.x + 10, ebox.y + ssy  , ebox.x + ebox.w, ebox.y + ebox.h + ssy  , tocolor( 230,230,230), sw/1600, font, "left", "center",true)
                  end
              end
                if eboxClickI == i then
                  dxDrawImage( ebox.x, ebox.y  , ebox.w, ebox.h, "border.png", 0, 0, 0, tocolor(0, 0, 0 ))
                end
	  end 
	end 
  end
    for index, cbox in ipairs ( checkboxs ) do 
    if ( cbox.state == true ) then 
	  dxDrawImage(cbox.x , cbox.y  + sy  , cbox.wh, cbox.wh, "accept.png")
      else
        dxDrawImage(cbox.x , cbox.y  + sy  , cbox.wh, cbox.wh, "decline.png")
      end
	if cbox.text then
        dxDrawText (cbox.text, cbox.x + cbox.wh + 5, cbox.y + sy  , cbox.x + cbox.wh*10, cbox.y + cbox.wh  + sy  , tocolor( 230,230,230), sw/2000, font, "left", "center",true)
      end
  end 
  for index, but in ipairs ( buttons ) do
    if but.typ then 
	  if ( but.typ == "login" ) then 
        dxDrawImage( but.x, but.y + sy  , but.w, but.h, "ebox.png", 0, 0, 0, but.color)
	      if isMouseWithinRangeOf(but.x, but.y  + sy  , but.w, but.h) then
		    but.color = tocolor( 0, 0, 0, 200)
          else
            but.color = tocolor( 0, 0, 0, 160)
          end
	        if but.text then 
	          dxDrawText( but.text, but.x, but.y + sy  , but.x + but.w, but.y + but.h + sy  , tocolor( 230,230,230), sw/1600, font, "center", "center")
	        end
      elseif ( but.typ == "register" ) then 
        dxDrawImage( but.x, but.y + ssy  , but.w, but.h, "ebox.png", 0, 0, 0, but.color)
	      if isMouseWithinRangeOf(but.x, but.y  + ssy  , but.w, but.h) then
		    but.color = tocolor( 0, 0, 0, 200)
          else
            but.color = tocolor( 0, 0, 0, 160)
          end
	        if but.text then 
	          dxDrawText( but.text, but.x, but.y + ssy  , but.x + but.w, but.y + but.h + ssy  , tocolor( 230,230,230), sw/1600, font, "center", "center")
            end 			  
      end	  
    end
  end 
end 
addEventHandler("onClientCharacter", getRootElement(), getCharacter)
function pressLogin()
  for i, ebox in ipairs(editbox) do
    if ebox.name == "username" then
      gUser = ebox.text
    elseif ebox.name == "password" then
      gPass = ebox.text
    end
  end 
triggerServerEvent ( "onLogin", getLocalPlayer(), gUser, gPass, checkboxs[1].state)
end
function pressRegister()
  for i, ebox in ipairs(editbox) do
    if ebox.name == "usernameReg" then
      rUser = ebox.text
    elseif ebox.name == "passwordReg" then
      rPass = ebox.text
	elseif ebox.name == "passwordRRepeat" then 
	  rePass = ebox.text
    end
  end 
triggerServerEvent ( "onRegister", getLocalPlayer(), rUser, rPass, rePass)
end
function pressRegisterBut()
  p_Move = {}
  p_Move.startTime = getTickCount()
  p_Move.endTime = p_Move.startTime + 1200
  p_Move.easingFunction = "InOutQuad"
  addEventHandler("onClientRender", getRootElement(), movePanelOut)
end
function pressBack()
  p_Move = {}
  p_Move.startTime = getTickCount()
  p_Move.endTime = p_Move.startTime + 1200
  p_Move.easingFunction = "InOutQuad"
  addEventHandler("onClientRender", getRootElement(), movePanelIn)
end
addEvent("pressBack",true)
addEventHandler("pressBack",getRootElement(),pressBack)
function movePanelOut()
  local now = getTickCount()
  local elapsedTime = now - p_Move.startTime
  local duration = p_Move.endTime - p_Move.startTime
  local progress = elapsedTime / duration
 
  local fAnimationTime = getEasingValue(progress, p_Move.easingFunction)
 
  local move = fAnimationTime*sw * 0.122
  removeEventHandler("onClientRender", getRootElement(), renderLoginContent)
  setTimer( function() addEventHandler("onClientRender", getRootElement(), renderLoginContent) end, 1200, 1 )
  removeEventHandler("onClientClick",getRootElement(),onClick)
  for i,v in ipairs ( field ) do 
   if v.text then 
    v.text = ""
	v.erbox = "grey"
   end
  end 
  setTimer( function()
    for i,v in ipairs ( field ) do 
	  if v.text then 
	    v.text = "Your Server Name"
	  end 
	end 
   end, 1200, 1 )
  mx = move
  my = move * 2
  sy = sh
  ssy = 0
  if now > p_Move.endTime then
    removeEventHandler("onClientRender", getRootElement(), movePanelOut)
    addEventHandler("onClientClick",getRootElement(),onClick)
  end
end
function movePanelIn()
  local now = getTickCount()
  local elapsedTime = now - p_Move.startTime
  local duration = p_Move.endTime - p_Move.startTime
  local progress = elapsedTime / duration
 
  local fAnimationTime = getEasingValue(progress, p_Move.easingFunction)
 
  local move = fAnimationTime* sw * 0.122
  removeEventHandler("onClientRender", getRootElement(), renderLoginContent)
  setTimer( function() addEventHandler("onClientRender", getRootElement(), renderLoginContent) end, 1200, 1 )
  removeEventHandler("onClientClick",getRootElement(),onClick)
  for i,v in ipairs ( field ) do 
   if v.text then 
    v.text = ""
	v.erbox = "grey"
   end
  end 
  setTimer( function()
    for i,v in ipairs ( field ) do 
	  if v.text then 
	    v.text = "Your Server Name"
	  end 
	end 
   end, 1200, 1 )
  mx = -move
  my = -move * 2
  sy = 0
  ssy = sh

  if now > p_Move.endTime then
    removeEventHandler("onClientRender", getRootElement(), movePanelIn)
	addEventHandler("onClientClick",getRootElement(),onClick)
  end
end


function changeMessage(mesBox, newMessage, boxColor)
  for i,box in ipairs(field) do
    if box.messageBox ==  mesBox then
      box.text = newMessage
      box.erbox = boxColor
    end
  end
end
addEvent("changeMessage",true)
addEventHandler("changeMessage",getRootElement(),changeMessage)
function onClick(mButton,state,ax,ay)
  if not (state == "down" and mButton == "left") then
    return false
  end
  for i,b in pairs(buttons) do
    if b.typ then 
	  if ( b.typ == "login" ) then 
        if isMouseWithinRangeOf(b.x, b.y + sy, b.w, b.h) then
          outputDebugString("Pressed "..b.text)
            if b.func then
              loadstring("return "..b.func.."()")()
            end
        end
	  elseif ( b.typ == "register" ) then
	    if isMouseWithinRangeOf(b.x, b.y + ssy, b.w, b.h) then
          outputDebugString("Pressed "..b.text)
            if b.func then
              loadstring("return "..b.func.."()")()
            end
        end
	  end 
    end
  end 
  for i,ebox in pairs(editbox) do
    if ebox.typ then 
	  if ( ebox.typ == "login" ) then 
        if isMouseWithinRangeOf(ebox.x, ebox.y + sy, ebox.w, ebox.h) then
          outputDebugString("Pressed "..ebox.textup)
          eboxClickI = i
          return true
		end 
	  elseif ( ebox.typ == "register" ) then 
	    if isMouseWithinRangeOf(ebox.x, ebox.y + ssy, ebox.w, ebox.h) then
          outputDebugString("Pressed "..ebox.textup)
          eboxClickI = i
            return true
	    end 
    elseif (ebox.typ == "")
	  end 
    end
  end
  for i,cbox in pairs(checkboxs) do
    if isMouseWithinRangeOf(cbox.x, cbox.y + sy, cbox.wh, cbox.wh) then
      outputDebugString("Pressed "..i.." checkbox")
      if cbox.state == false then
      cbox.state = true
      else
      cbox.state = false
      end
    end
  end
  eboxClickI = nil
  return false
end

addEventHandler("onClientClick",getRootElement(),onClick)

function isMouseWithinRangeOf(posX, posY, sizeX, sizeY)
  if isCursorShowing() == false then
    return false
  end
  local cx,cy = getCursorPosition()
  cx,cy = cx*sw,cy*sh
  if cx >= posX and cx <= posX+sizeX and cy >= posY and cy <= posY+sizeY then
    return true,cx,cy
  else
    return false
  end
end

function hideLoginPanel()
  addEventHandler("onClientRender", getRootElement(), hidePanelOut)
end

function hidePanelOut(thePlayer)
    setTimer( function() 
    removeEventHandler("onClientRender", getRootElement(), hidePanelOut)
    removeEventHandler("onClientRender",getRootElement(),renderLoginPanel)
    removeEventHandler("onClientRender",getRootElement(),renderLoginContent)
    showCursor(false)
    triggerServerEvent("onEnd", getRootElement(), getLocalPlayer())
    triggerServerEvent("onWelcome", getRootElement(), getLocalPlayer())
    removeEventHandler("onClientPreRender", getRootElement(), anim)
    toggleAllControls(true)
    showChat(true)
	end, 1000, 1)
  end
addEvent("hideLoginPanel",true)
addEventHandler("hideLoginPanel",getRootElement(),hideLoginPanel)