module ActsAsLocalized

  if defined? Rails::Railtie
    require 'acts_as_localized/railtie'
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def acts_as_localized *attributes
      attributes.each do |attribute|
        define_method attribute do
          send("#{attribute}_#{I18n.locale}")
        end
        define_method "#{attribute}=" do |value|
          send("#{attribute}_#{I18n.locale}=", value)
        end
      end
    end
  end
end