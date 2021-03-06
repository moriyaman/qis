class Category < ActiveRecord::Base
  
  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image,
    content_type: /\Aimage\/.*\Z/

  has_many :questions

  validates :name, presence: true

  scope :name_like, -> text { where('name like ?', "%#{text}%") }

end

