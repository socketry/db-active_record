# frozen_string_literal: true

require_relative "lib/db/active_record/version"

Gem::Specification.new do |spec|
	spec.name = "db-active_record"
	spec.version = DB::ActiveRecord::VERSION
	
	spec.summary = "Asynchronous database adapters for ActiveRecord."
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.cert_chain  = ['release.cert']
	spec.signing_key = File.expand_path('~/.gem/release.pem')
	
	spec.homepage = "https://github.com/socketry/db-active_record"
	
	spec.metadata = {
		"source_code_uri" => "https://github.com/socketry/db-active_record.git",
	}
	
	spec.files = Dir.glob(['{lib}/**/*', '*.md'], File::FNM_DOTMATCH, base: __dir__)
	
	spec.required_ruby_version = ">= 3.1"
	
	spec.add_dependency "activerecord", "~> 7.1"
	spec.add_dependency "async-io"
	spec.add_dependency "async-pool"
	spec.add_dependency "db"
end
