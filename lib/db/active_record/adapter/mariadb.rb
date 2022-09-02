# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022, by Samuel Williams.

require "active_support"
require "active_record"
require "active_record/connection_adapters/abstract_adapter"

require "db/mariadb"

module DB
	module ActiveRecord
		module Adapter
			class MariaDB < ::ActiveRecord::ConnectionAdapters::AbstractAdapter
				def self.new_client(config)
					DB::MariaDB::Connection.new(**config)
				end
				
				def connect
					@raw_connection = self.class.new_client(@config)
				end
			end
		end
	end
end
