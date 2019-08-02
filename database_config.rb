require 'active_record'

options = {
    adapter: 'postgresql',
    database: 'yogafails'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)