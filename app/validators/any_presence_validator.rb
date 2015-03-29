class AnyPresenceValidator < ActiveModel::Validator
  def validate(record)
    unless options[:fields].any? { |attr| record[attr].present? }
      record.errors.add(:base, :blank)
    end
  end
end
