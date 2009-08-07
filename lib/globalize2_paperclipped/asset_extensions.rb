module Globalize2Paperclipped  
  module AssetExtensions
    def self.included(base)
      
      base.class_eval do
        def self.scope_locale(locale, &block)
          with_scope(:find => { :joins => "INNER JOIN asset_translations on asset_translations.asset_id = assets.id", :conditions => ['asset_translations.locale = ?', locale] }) do
            yield
          end
        end
        
      end
    end
  end
end