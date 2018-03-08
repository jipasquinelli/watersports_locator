class Sport < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :dependent => :nullify

  belongs_to :spot,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
