class Notification < ActiveRecord::Base
  UPDATABLE_ATTRS = [:sender_id, :receiver_id, :subject, :description]
  belongs_to :sender, class_name: User.name
  belongs_to :receiver, class_name: User.name

end
