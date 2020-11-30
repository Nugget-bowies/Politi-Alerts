resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependency 'vrp'

server_export 'ShowAlert'
export 'ShowAlert'

ui_page {
    'html/alerts.html',
}

files {
	'html/alerts.html',
	'html/main.js', 
	'html/style.css',
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server.lua'
}

client_script 'client.lua'

export "dispatch"
export "sendDispatch2"
--[[
__________         ___ ___                             .__               
\______   \___.__./   |   \ ___.__.______   ___________|__| ____   ____  
 |    |  _<   |  /    ~    <   |  |\____ \_/ __ \_  __ \  |/  _ \ /    \ 
 |    |   \\___  \    Y    /\___  ||  |_> >  ___/|  | \/  (  <_> )   |  \
 |______  // ____|\___|_  / / ____||   __/ \___  >__|  |__|\____/|___|  /
        \/ \/           \/  \/     |__|        \/                     \/ 
--]]