class TimeFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.blank?
      hours = value.split(":").first
      minutes = value.split(":").last
      if (hours.to_i > 23 or minutes.to_i > 59)
        record.errors[attribute] << (options[:message] || I18n.t("store.error.time_format"))
      end
    end
  end
end