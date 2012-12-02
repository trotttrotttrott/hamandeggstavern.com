class BaseService

  protected

  def transaction
    ActiveRecord::Base.transaction do
      begin
        yield
      rescue => exception
        raise ActiveRecord::Rollback, exception.message
      end
    end
  end
end
