require 'active_support'
ActiveSupport::IsolatedExecutionState.isolation_level = :fiber

require 'active_record'

credentials = {
	adapter: 'db_postgres',
	username: 'test',
	password: 'test',
	database: 'test',
	host: '127.0.0.1'
}

ActiveRecord::Base.establish_connection(credentials)

ActiveRecord::Schema.define do
	create_table :posts, force: true do |t|
	end
	
	create_table :comments, force: true do |t|
		t.integer :post_id
	end
end

class Post < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :post
end
