# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022, by Samuel Williams.

require_relative "../../db/active_record/adapter/postgres"
require "db/client"

module ActiveRecord
	module ConnectionHandling
		# postgresql_connection
		def db_postgres_connection(config)
			config = config.symbolize_keys.compact
			config.delete(:adapter)
			
			client = DB::Postgres::Adapter.new(**config).call
			
			DB::ActiveRecord::Adapter::Postgres.new(
				client,
				Console.logger,
				config
			)
		end
	end
end
