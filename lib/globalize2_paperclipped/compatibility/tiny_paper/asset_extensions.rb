module Globalize2Paperclipped::Compatibility
  module TinyPaper::AssetExtensions
    def self.included(base)
      base.class_eval do

        named_scope :by_title, lambda{ |search_term| { :joins => "INNER JOIN asset_translations on asset_translations.asset_id = assets.id",  :conditions => ["LOWER(asset_translations.title) LIKE ? AND asset_translations.locale = ?", "%#{search_term.to_s.downcase}%", I18n.locale]}}
        
      end
    end
  end
end