Factory.define(:asset) do |f|
  f.sequence(:title) { |i| "Picture #{i}" }
  f.caption { |a| "#{a.title} caption" }
  f.asset_file_name { |a| "#{a.title.underscore}.jpg" }
  f.asset_content_type "image/jpeg"
  f.asset_file_size 44760
end

Factory.define(:page) do |f|
  f.sequence(:title) { |i| "Page #{i}"}
  f.slug { |a| a.title.downcase.gsub(/[^-a-z0-9~\s\.:;+=_]/, '').gsub(/[\s\.:;=+]+/, '-') }
  f.breadcrumb { |a| a.title }
end

Factory.define(:page_attachment) do |f|
  f.page { |page| page.association(:page) }
  f.asset { |asset| asset.association(:asset) }
end
