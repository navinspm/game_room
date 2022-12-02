role :app, %w{navin@139.180.187.44}
role :web, %w{navin@139.180.187.44}
role :db,  %w{navin@139.180.187.44}

server '139.180.187.44', user: 'navin', roles: %w{web app db}

set :deploy_to, "/home/navin/apps/game_room"

set :ssh_options, {
    forward_agent: true,
    auth_methods: %w(password),
    password: 'ravi@yaavarum',
    user: 'navin',
}
