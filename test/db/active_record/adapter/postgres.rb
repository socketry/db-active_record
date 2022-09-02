# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022, by Samuel Williams.

require 'sus/fixtures/async/reactor_context'
require 'db/active_record/adapter/postgres'

describe DB::ActiveRecord::Adapter::Postgres do
	include Sus::Fixtures::Async::ReactorContext
	
	CREDENTIALS = {
		adapter: 'db_postgres',
		username: 'test',
		password: 'test',
		database: 'test',
		host: '127.0.0.1'
	}
	
	it "can make a connection" do
		pool = ActiveRecord::Base.establish_connection(CREDENTIALS)
		connection = pool.connection
		expect(connection.execute("SELECT 1")).to be == [[1]]
	end
end
