class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one :popular_post, dependent: :destroy

  acts_as_taggable

  validates :title, presence: true
  validates :category_id, presence: true
  validates :text, presence: true
  validates :image, presence: true

  mount_uploader :image, PostImageUploader

  enum published: { Draft: false, Published: true }

  scope :default_order, -> { order('created_at desc') }
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }
  scope :favorite, -> { where(favorite: true) }

  def to_param
    slug
  end

  def previous
    Post.published.default_order.find_by('created_at < ?', created_at)
  end

  def next
    Post.published.default_order.where('created_at > ?', created_at).reverse.first
  end

end
