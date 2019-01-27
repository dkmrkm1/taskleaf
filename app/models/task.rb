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
  before_validation :set_name_nameless_name

  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  private

    def validate_name_not_including_comma
      errors.add(:name, 'にカンマを追加することは出来ません.. (泣)') if name&.include?(',')
    end

    def set_name_nameless_name
      self.name = '名前はあとで決めるよ！' if name.blank?
    end
end
