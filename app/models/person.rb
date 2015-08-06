class Person < ActiveRecord::Base
	#validations
	validates :name, :dob, :phone, :email, :address, :gender, :desg, :salary, presence: true
	validates :name, format: { with: /\A[a-zA-Z ]+\z/ ,message: "Not a valid name" }
  validates :email, format: { with: /([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/ ,message: "Not a valid email" }#,uniqueness: true
  validates :desg, inclusion: { in: %w(manager developer hr) ,message: "%{value} is not a valid desg" } 
  validates_format_of :phone, :with => /\d[0-9]\)*\z/, :message => "Only positive number without spaces are allowed"
	validates :salary, numericality: { :greater_than_or_equal_to => 0 }
	
	#callbacks
	before_save :capitalize_name
	private
	def capitalize_name
		self.name = self.name.split.collect(&:capitalize).join(' ')
	end
end
