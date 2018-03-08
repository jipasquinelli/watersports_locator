class Spot < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  has_many   :sports,
             :dependent => :nullify

  has_many   :likes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
