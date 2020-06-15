class Person < ApplicationRecord

   has_many :interactions, as: :interactive

   def name
	"#{first_name} #{last_name}"
   end

   validates :first_name, presence: true
end
