class Post < ApplicationRecord
	validates :title, presence: true

	after_initialize do |post|
		puts "You have initialized an object!"
	end

	after_find do |post|
		puts "You have found an object!"
	end
end
