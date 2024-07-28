# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022-2024, by Samuel Williams.

require "active_support"
require "active_record"
require "active_record/connection_adapters/abstract_adapter"

require "db/postgres"

module DB
	module ActiveRecord
		module Adapter
			class Postgres < ::ActiveRecord::ConnectionAdapters::AbstractAdapter
				def initialize(adapter, config)
					super(config)
					
					@adapter = adapter
				end
				
				def connect
					@raw_connection ||= @adapter.call
				end
				
				def raw_execute(sql, name, **options)
					log(sql, name) do
						connection = self.connect
						
						connection.send_query(sql)
						
						connection.next_result.to_a
					end
				end
			end
		end
	end
end
