# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022-2024, by Samuel Williams.

require_relative "../../db/active_record/adapter/mariadb"

module ActiveRecord
	module ConnectionHandling
		def db_mariadb_connection(config)
			config = config.symbolize_keys.compact
			config.delete(:adapter)
			
			adapter = DB::MariaDB::Adapter.new(**config)
			
			return DB::ActiveRecord::Adapter::MariaDB.new(adapter, config)
		end
	end
end
