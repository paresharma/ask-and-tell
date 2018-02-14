module Permission
  extend ActiveSupport::Concern

  def can_be_administered_by(user)
    return false unless user.present?
    user.id == self.user_id
  end
end
