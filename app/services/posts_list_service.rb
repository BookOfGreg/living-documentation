class PostsListService
  def initialize(posts, current_user)
    @current_user = current_user
    @posts = posts
  end

  def list
    {
      headings: build_headings,
      keys: build_keys,
      rows: build_list
    }
  end

  private

    def build_keys
      keys = [ 'title', 'content', 'category', 'show' ]
      keys += ['edit', 'delete'] if @current_user
      keys
    end

    def build_headings
      headings = [
        { name: 'Title' },
        { name: 'Content' },
        { name: 'Category' },
        { attribute: { colSpan: '1' } }
      ]
      headings += [{ attributes: { colSpan: '2' } }] if @current_user
      headings
    end

    def check_admin_access(post)
      return {} unless @current_user
      return {} unless post.user == @current_user
      {
        edit: { text: 'Edit', link: true, attributes: { href: "/posts/#{post.id}/edit" } },
        delete: { text: 'Destroy', link: true, attributes: {
          href: "/posts/#{post.id}",
          rel: 'nofollow',
          'data-method': 'delete',
          'data-confirm': 'Are you sure?'
        } },
      }
    end

    def build_categories(category_ids)
      Category.where(id: category_ids).map(&:name).join(', ')
    end

    def build_list
      @posts.map{ |post|
        {
          title: { text: post.title },
          content: { text: post.content },
          category: { text: build_categories(post.category_ids) },
          show: { text: 'Show', link: true, attributes: { href: "/posts/#{post.id}" }  }
        }.merge(check_admin_access(post))
      }
    end
end
