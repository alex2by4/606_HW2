# app/helpers/movies_helper.rb

module MoviesHelper
    def sortable_column(column_title, column_name)
      direction = column_name == params[:sort] ? params[:direction] : "asc"
      css_class = sort_column_class(column_name)
      link_to column_title, { sort: column_name, direction: next_sort_direction(column_name) }, class: css_class
    end
  
    def sort_column_class(column_name)
      return unless params[:sort] == column_name
  
      direction = params[:direction] == 'asc' ? 'ascending' : 'descending'
      "sorted-#{direction}"
    end
  
    def next_sort_direction(column_name)
      if params[:sort] == column_name
        params[:direction] == "asc" ? "desc" : "asc"
      else
        "asc"
      end
    end
  end
  