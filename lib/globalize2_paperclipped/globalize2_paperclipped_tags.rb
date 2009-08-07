module Globalize2Paperclipped
  module Globalize2PaperclippedTags
    include Radiant::Taggable
  
    class TagError < StandardError; end
    
    tag 'if_assets_with_globalize' do |tag|
      result = Asset.scope_locale(I18n.locale) do
        send('tag:if_assets_without_globalize', tag)
      end
      result
    end
    
    tag 'unless_assets_with_globalize' do |tag|
      result = Asset.scope_locale(I18n.locale) do
        send('tag:unless_assets_without_globalize', tag)
      end
      result
    end
    
    tag 'assets:each_with_globalize' do |tag|
      with_translated_locales = tag.attr['locale'] == 'false' ? false : true
      if with_translated_locales
        result = Asset.scope_locale(I18n.locale) do
          send('tag:assets:each_without_globalize', tag)
        end
      else
        result = send('tag:assets:each_without_globalize', tag)
      end
      result
    end
    
    desc %{
      Renders the containing elements if the asset is translated
      
      *Usage:*
      
      <pre><code><r:if_translation_asset>...</r:if_translation_asset></code></pre>
    }
    tag 'assets:if_translation_asset' do |tag|
      asset = tag.locals.asset
      tag.expand if asset.translated_locales.include?(I18n.locale.to_sym)
    end
    
    desc %{
      The opposite of the @if_translation_asset@ tag. Renders the containing elements if the asset is not translated
      
      *Usage:*
      
      <pre><code><r:unless_translation_asset>...</r:unless_translation_asset></code></pre>
    }
    tag 'assets:unless_translation_asset' do |tag|
      asset = tag.locals.asset
      tag.expand unless asset.translated_locales.include?(I18n.locale.to_sym)
    end    
  end
end