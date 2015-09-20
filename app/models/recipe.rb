class Recipe < ActiveRecord::Base
    has_many :ingredients
    has_many :directions
    belongs_to :user
    accepts_nested_attributes_for :ingredients, reject_if: proc {|atributes| atributes['name'].blank? },
                                                allow_destroy: true
        accepts_nested_attributes_for :directions, reject_if: proc {|atributes| atributes['step'].blank? },                                                     allow_destroy: true
    has_attached_file :image, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    validates :title, :image, :description, presence: true
end
