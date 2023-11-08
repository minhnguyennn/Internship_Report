# frozen_string_literal: true

require './user.rb'
require './doc_exporter.rb'
require './importer.rb'

DocExporter.new(User.active_users).execute
Importer.new('users.csv').execute
