class Account < ApplicationRecord
	validates :subdomain, exclusion: { in: %w(www us ca jp),
	message: '%{value} is reserved' }
end
