class Role < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  enum access: {
    viewable: 0,
    createable: 1,
    editable: 2,
    no_access: 3
  }

end
