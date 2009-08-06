Factory.define(:asset) do |f|
  f.sequence(:title) { |i| "Picture #{i}" }
  f.caption { |a| "#{a.title} caption" }
  f.asset_file_name { |a| "#{a.title.underscore}.jpg" }
  f.asset_content_type "image/jpeg"
  f.asset_file_size 44760
end