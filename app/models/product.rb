class Product < ApplicationRecord

	has_many :interactions, as: :interactive
end
