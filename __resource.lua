resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Ali Gps isaretle'

version '1.0.1'

client_script "client/main.lua"
server_scripts {

    '@mysql-async/lib/MySQL.lua',
    'server/server.lua'
  
  }
