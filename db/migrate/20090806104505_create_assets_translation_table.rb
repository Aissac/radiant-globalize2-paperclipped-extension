class CreateAssetsTranslationTable < ActiveRecord::Migration
  def self.up
    Asset.create_translation_table! :title => :string, :caption => :string
    Asset.all.each do |asset|
      translation = asset.globalize_translations.
        find_or_initialize_by_locale(Globalize2Extension.default_language.to_s)
      translation[:title] = asset[:title]
      translation[:caption] = asset[:caption]
      translation.save
    end
    remove_column :assets, :title
    remove_column :assets, :caption
  end

  def self.down
    add_column :assets, :title, :string
    add_column :assets, :caption, :string
    Asset.drop_translation_table!
  end
end