module Pagination
    extend ActiveSupport::Concern

    def pagination_dict(object)
        {
            total_pages: object.total_pages,
            current_page: object.current_page,
            next_page: object.next_page,
            total_count: object.total_entries 
        }
    end
end