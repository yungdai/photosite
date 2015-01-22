class User < ActiveRecord::Base
  # associate User with Authentication
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
  # end code for associating User with Authentication

  has_many :photos

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email

  def name
    [first_name, last_name].join (' ')
  end
end
