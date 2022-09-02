# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022, by Samuel Williams.

require_relative "../../db/active_record/adapter/mariadb"

module ActiveRecord
	module ConnectionHandling
		# mysql2_connection
		def db_mariadb_connection(config)
			DB::ActiveRecord::Adapter::MariaDB.new(config)
		end
	end
end
