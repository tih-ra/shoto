class PostAttachment < ActiveRecord::Base
  belongs_to :post
  belongs_to :attachable, :polymorphic=>true
end
