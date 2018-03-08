class Sport < ApplicationRecord
  # Direct associations

  belongs_to :spot,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
