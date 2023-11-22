# frozen_string_literal: true

json.extract! ad, :id, :name, :created_at, :updated_at
json.url ad_url(ad, format: :json)
