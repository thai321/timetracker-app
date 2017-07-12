class Hand < ApplicationRecord # hand is manager
  belongs_to :user
  belongs_to :hand, class_name: 'User' # belong to itself
end
