# == Schema Information
#
# Table name: tasks
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  done        :boolean          default(FALSE), not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ApplicationRecord
  validates :name, presence: true
end
