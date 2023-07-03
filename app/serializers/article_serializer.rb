# app/serializers/article_serializer.rb
class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :minutes_to_read, :author, :preview, :content

  def author
    object.user.username
  end

  def preview
    object.content.lines.first.chomp
  end
end
