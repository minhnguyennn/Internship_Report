class Employee < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "employee_name", "gender", "hobbies", "id", "updated_at"]
  end

  has_many :addresses
  accepts_nested_attributes_for :addresses,
                                allow_destroy: true,
                                reject_if: proc { |att| att['house_number'].blank? || att['society_name'].blank? || att['city'].blank? || att['area'].blank? }                                                        
end