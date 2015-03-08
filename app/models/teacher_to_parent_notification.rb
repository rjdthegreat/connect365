class TeacherToParentNotification < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :parent
end
