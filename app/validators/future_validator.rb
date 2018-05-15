class FutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.future?
      record.errors[attribute] << (options[:message] || "は未来ではありません")
    end
  end
end
