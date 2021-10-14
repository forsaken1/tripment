class SearchProceduresService
  attr_reader :params

  PAGE = 1
  PER = 25

  def initialize(params)
    @params = params
  end

  def call
    Procedure.find_by_sql([query, search_by_prefix, search_full, per, offset])
  end

  private

  def query
    "WITH first_query as (SELECT 1 as req_num, * FROM procedures WHERE title ILIKE ?)

    SELECT * from first_query
    UNION
    SELECT 2 as req_num, * FROM procedures WHERE title ILIKE ? AND id NOT IN (SELECT id FROM first_query)
    ORDER BY req_num, title
    LIMIT ? OFFSET ?"
  end

  def search_by_prefix
    "#{search}%"
  end

  def search_full
    "%#{search}%"
  end

  def search
    params[:search]
  end

  def offset
    (page - 1) * per
  end

  def page
    return PAGE if params[:page].blank?
    params[:page].to_i
  end

  def per
    return PER if params[:per].blank?
    params[:per].to_i
  end
end
