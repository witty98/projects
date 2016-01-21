class Contract < ActiveRecord::Base
  belongs_to :project
  belongs_to :partyb
  default_scope -> { order(created_at: :desc) }
  
  validates_presence_of  :name, presence: true, :message => "合同名称不能为空！"
  validates_presence_of  :code, presence: true, :message => "合同代码不能为空！"
  validates_uniqueness_of :code, :message => "合同代码不能相同！"
  validates :total, numericality: { greater_than: 0 },  allow_blank: true
  validates :surplus, numericality: { greater_than: 0 },  allow_blank: true
end
