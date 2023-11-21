class Book < ApplicationRecord
	belongs_to :author

	# scope :out_of_print, -> { where(out_of_print: true) }

	# default_scope { where(out_of_print: false) }

	# default_scope { where('out_of_print = ?', false) }

	# scope :out_of_print_and_expensive, -> { 
	# out_of_print.where('price > ?', 1000) }

	# scope :costs_more_than, ->(amount) { where("price = ?", amount) }

	# def self.costs_more_than(amount)
	# 	where('price > ?', amount)
	# end

	# scope :created_before, ->(time) { where(created_at: ...time) if time.present? }

	scope :in_print, -> { where(out_of_print: false) }
	scope :out_of_print, -> { where(out_of_print: true) }

	scope :recent, -> { where(published: 50.years.ago.year..) }
	scope :old, -> { where(published: ...1.years.ago.year) }
end
