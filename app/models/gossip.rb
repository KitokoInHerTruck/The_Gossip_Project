class Gossip < ApplicationRecord
  belongs_to :user, required: false
  validates :title, presence: true, length: { in: 3..14 }
  validates :content, presence: true
  has_many :join_table_gossip_tags
  has_many :tags, through: :join_table_gossip_tags
  has_many :comments
end
