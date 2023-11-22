# frozen_string_literal: true

json.array! @magazines, partial: 'magazines/magazine', as: :magazine
