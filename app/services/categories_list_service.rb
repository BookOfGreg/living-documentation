class CategoriesListService
  def initialize(categories, current_user)
    @current_user = current_user
    @categories = categories
  end

  def list
    {
      headings: build_headings,
      keys: build_keys,
      rows: build_list,
      raw: @categories
    }
  end

  private

    def build_keys
      keys = [ 'name', 'show' ]
      keys += ['edit', 'delete'] if @current_user
      keys
    end

    def build_headings
      headings = [
        { name: 'Name' },
        { attribute: { colSpan: '1' } }
      ]
      headings += [{ attributes: { colSpan: '2' } }] if @current_user
      headings
    end

    def check_admin_access(category)
      return {} unless @current_user
      return {} unless category.user == @current_user
      {
        edit: { text: 'Edit', link: true, attributes: { href: "/categories/#{category.id}/edit" } },
        delete: { text: 'Destroy', link: true, attributes: {
          href: "/categories/#{category.id}",
          rel: 'nofollow',
          'data-method': 'delete',
          'data-confirm': 'Are you sure?'
        } },
      }
    end

    def build_list
      @categories.map{ |category|
        {
          name: { text: category.name },
          show: { text: 'Show', link: true, attributes: { href: "/categories/#{category.id}" }  }
        }.merge(check_admin_access(category))
      }
    end
end
