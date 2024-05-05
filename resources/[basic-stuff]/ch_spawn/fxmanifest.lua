fx_version 'cerulean'
game 'gta5'

lua54 'yes'

resource_type 'gametype' { name = 'ouuv', }

author 'oguzhankumsal44@gmail.com'
description 'Example resource'
version '1.0.0'

client_script 'client/client.lua'

--server_script 'server.lua'

-- Extra data can be used as well
my_data 'one' { two = 42 }
my_data 'three' { four = 69 }

-- due to Lua syntax, the following works too:
my_data('nine')({ ninety = "nein" })

-- metadata keys can be arbitrary
pizza_topping 'pineapple'
