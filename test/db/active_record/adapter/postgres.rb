# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022-2024, by Samuel Williams.

require 'sus/fixtures/async/reactor_context'
require 'db/active_record/adapter/postgres'

describe DB::ActiveRecord::Adapter::Postgres do
	include Sus::Fixtures::Async::ReactorContext
	
	let(:credentials) {
		CREDENTIALS.merge(
			adapter: 'db_postgres'
		)
	}
	
	it "can make a connection" do
		pool = ActiveRecord::Base.establish_connection(credentials)
		
		connection = pool.connection
		
		expect(connection.execute("SELECT 1")).to be == [[1]]
	end
	
	# it "can create model objects" do
	# 	post = Post.create!
	# 	post.comments << Comment.create!

	# 	expect(post.comments).to have_attributes(count: be == 1)
	# end
end
