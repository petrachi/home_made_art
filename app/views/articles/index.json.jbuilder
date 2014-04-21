json.array!(@articles) do |article|
  json.extract! article, :id, :title, :brief, :content, :published, :published_at, :user_id
  json.url article_url(article, format: :json)
end
