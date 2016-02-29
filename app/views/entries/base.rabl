attributes :id, :name, :created_at, :updated_at, :latitude, :longitude

child :entities do
  attributes :id
  node :url do |a|
    asset_url(a.file.url)
  end
end
