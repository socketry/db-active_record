# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require 'covered/sus'
include Covered::Sus

Bundler.require(:adapters)

::CREDENTIALS = {
	username: 'test',
	password: 'test',
	database: 'test',
	host: '127.0.0.1'
}.freeze
