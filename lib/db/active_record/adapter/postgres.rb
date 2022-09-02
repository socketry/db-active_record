# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022, by Samuel Williams.

require "active_support"
require "active_record"
require "active_record/connection_adapters/abstract_adapter"

require "db/postgres"

module DB
	module ActiveRecord
		module Adapter
			class Postgres < ::ActiveRecord::ConnectionAdapters::AbstractAdapter
				def connect
					@connection
				end
				
				def execute(sql, name = nil)
					sql = transform_query(sql)
					check_if_write_query(sql)

					materialize_transactions
					mark_transaction_written_if_write(sql)

					log(sql, name) do
						ActiveSupport::Dependencies.interlock.permit_concurrent_loads do
							@connection.send_query(sql)
							@connection.next_result.to_a
						end
					end
				end
			end
		end
	end
end
