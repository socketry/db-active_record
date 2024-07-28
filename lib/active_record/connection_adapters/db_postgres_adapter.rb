# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022-2024, by Samuel Williams.

require_relative "../../db/active_record/adapter/postgres"
require "db/client"

module ActiveRecord
	module ConnectionHandling
		def db_postgres_connection(config)
			config = config.symbolize_keys.compact
			config.delete(:adapter)
			
			adapter = DB::Postgres::Adapter.new(**config)
			
			return DB::ActiveRecord::Adapter::Postgres.new(adapter, config)
		end
	end
end
