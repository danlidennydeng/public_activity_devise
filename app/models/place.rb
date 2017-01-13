class Place < ApplicationRecord

	has_many :addresses, dependent: :destroy
	accepts_nested_attributes_for :addresses, allow_destroy: true,
	                               reject_if: ->(attrs) { attrs['city'].blank? || attrs['street'].blank? }
	                               #no warning messages. user won't know.

end
