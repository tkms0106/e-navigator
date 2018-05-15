class PastValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.past?
      record.errors[attribute] << (options[:message] || "は未来ではありません")
    end
  end
end
