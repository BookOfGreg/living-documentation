# frozen_string_literal: true

class PostsListService
  def initialize(posts, current_user)
    @current_user = current_user
    @posts = posts
  end

  def list
    {
      keys: build_keys,
      posts: build_list
    }
  end

  private

  def build_datetime(post)
    created_datetime = convert_to_datetime(post.created_at)
    updated_datetime = convert_to_datetime(post.updated_at)
    datetime_text = convert_to_clean_datetime(created_datetime)
    if created_datetime != updated_datetime
      updated_datetime_str = convert_to_clean_datetime(updated_datetime)
      datetime_text = "#{datetime_text} (last edited on #{updated_datetime_str})"
    end
    datetime_text
  end

  def convert_to_clean_datetime(datetime)
    datetime.strftime('%m/%d/%Y at %I:%M%p')
  end

  def convert_to_datetime(datetime)
    Time.parse(datetime.to_s)
  end

  def build_keys
    keys = %w[title content category datetime show]
    keys += %w[edit delete] if @current_user
    keys
  end

  # def build_headings
  #   headings = [
  #     { name: 'Title' },
  #     { name: 'Content' },
  #     { name: 'Category' },
  #     { name: 'DateTime' },
  #     { attribute: { colSpan: '1' } }
  #   ]
  #   headings += [{ attributes: { colSpan: '2' } }] if @current_user
  #   headings
  # end

  def check_admin_access(post)
    return {} unless @current_user
    return {} unless post.user == @current_user
    {
      edit: { text: 'Edit', link: true, attributes: { href: "/posts/#{post.id}/edit" } },
      delete: { text: 'Destroy', link: true, attributes: {
        href: "/posts/#{post.id}", rel: 'nofollow',
        'data-method': 'delete', 'data-confirm': 'Are you sure?'
      } }
    }
  end

  def build_categories(category_ids)
    Category.where(id: category_ids).map(&:name)
  end

  def build_list
    @posts.map do |post|
      {
        id: post.id,
        title: post.title,
        content: post.content,
        category: build_categories(post.category_ids),
        datetime: build_datetime(post),
        path: "/posts/#{post.id}"
      }.merge(check_admin_access(post))
    end
  end
end
