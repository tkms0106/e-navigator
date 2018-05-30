class PastValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.past?
      record.errors[attribute] << (options[:message] || "は過去ではありません")
    end
  end
end
