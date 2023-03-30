fx_version 'cerulean'

game 'gta5'

author 'Barikelo & Juliroo'
description 'Re-Design of bk_emotes by Juliroo'

--Client Scripts-- 
client_scripts {
    'NativeUI.lua',
	'Config.lua',
 	'Client/*.lua'
}

--Server Scripts-- 
server_scripts {
	'Config.lua',
	'Server/*.lua'
}

export {
    'WalkMenuStart'
}
--UI Part-- 
ui_page {
 'Client/html/index.html', 
}

shared_script '@es_extended/imports.lua'

--File Part-- 
files {
 'Client/html/index.html',
 'Client/html/app.js', 
 'Client/html/main.css',
 'Client/html/ios.ttf',
 'Client/html/search.svg'
} 