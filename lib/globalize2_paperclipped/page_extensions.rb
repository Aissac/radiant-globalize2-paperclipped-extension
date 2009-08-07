module Globalize2Paperclipped  
  module PageExtensions
    def self.included(base)
      base.class_eval do
        alias_method_chain 'tag:if_assets', :globalize
        alias_method_chain 'tag:unless_assets', :globalize
      end
    end
  end
end