--iManGaaX

function onLogin(username,password,checkboxState)
	if not (username == "") then
		if not (password == "") then
			local account = getAccount ( username, password )
			if ( account ~= false ) then
				logIn(source, account, password)
				triggerClientEvent (source,"hideLoginPanel",getRootElement())
				triggerClientEvent (source,"saveXML",getRootElement(),username,password,tostring(checkboxState))
				triggerClientEvent(source,"changeMessage",getRootElement(),"1","You are successfully logged in", "green")
			else
				triggerClientEvent(source,"changeMessage",getRootElement(),"1","Wrong username or password", "red")
				
			end
		else
			triggerClientEvent(source,"changeMessage",getRootElement(),"1","Please enter your password", "red")
			
		end
	else
		triggerClientEvent(source,"changeMessage",getRootElement(),"1","Please enter your username", "red")
		
	end
end
addEvent("onLogin",true)
addEventHandler("onLogin",getRootElement(),onLogin)

function onRegister(username,password, repass)
	if not (username == "") then
	  if not ( username:find("%W")) then 
		if not (password == "") then
		  if not ( password:find("%W")) then
		    if ( password == repass ) then 
					local account = getAccount (username, password)
					if (account == false) then
						addAccount(tostring(username),tostring(password))
						triggerClientEvent(source,"changeMessage",getRootElement(),"1","You have successfully registered", "green")
						triggerClientEvent(source,"changeMessage",getRootElement(),"1","Now log in please", "green")
						triggerClientEvent(source,"pressBack", getRootElement())
					else
						triggerClientEvent(source,"changeMessage",getRootElement(),"1","This username already taken", "red")
					end
		    else 
          	  triggerClientEvent(source,"changeMessage",getRootElement(),"1","Repeat your password", "red")
	        end 	
		  else
		    triggerClientEvent(source,"changeMessage",getRootElement(),"1","Password contains disallowed signs", "red")
	      end
		else
			triggerClientEvent(source,"changeMessage",getRootElement(),"1","Please enter your password", "red")
		end
	  else
		triggerClientEvent(source,"changeMessage",getRootElement(),"1","Username contains disallowed signs", "red")
	  end
	else
		triggerClientEvent(source,"changeMessage",getRootElement(),"1","Please enter your username", "red")
	end
end
addEvent("onRegister",true)
addEventHandler("onRegister",getRootElement(),onRegister)

function onEnd(thePlayer)
spawnPlayer(thePlayer, 1480.00122, -1739.92871, 13.54688, 0)
setTimer(function()
setCameraTarget(thePlayer, thePlayer)
fadeCamera(thePlayer, true)
end, 1010, 1)
end
addEvent("onEnd", true)
addEventHandler("onEnd", getRootElement(), onEnd)

x = 1480.00122
y = -1739.92871
z = 113.54688
x2 = 1480.00122
y2 = -1739.92871
time = getTickCount()

function onWelcome(thePlayer)
z = z-2.5
setCameraMatrix(thePlayer, x, y, z, x2, y2)
 if (getTickCount() - time >= 5000) then 
  removeEventHandler("onClientPreRender", getRootElement(), onWelcome) 
 end
end
addEvent("onWelcome", true)
addEventHandler("onWelcome", getRootElement(), onWelcome)