module ActsAsLocalized
  class Railtie < Rails::Railtie
    initializer 'acts_as_localized.insert_into_active_record' do
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.send(:include, ActsAsLocalized)
      end
    end
  end
end