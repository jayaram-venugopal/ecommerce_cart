module ErrorHandler
  extend ActiveSupport::Concern

   ERRORS = {
    'ActiveRecord::RecordNotFound' => 'Errors::NotFound'
  }

  included do
    rescue_from(StandardError, with: lambda { |e| handle_error(e) })

    rescue_from ActiveRecord::RecordInvalid do |e|
      validation_error("Validation failed", e.message, 422, :unprocessable_entity)
    end

    rescue_from ActionController::ParameterMissing do |e|
      validation_error("Parameter Missing", e.message, 400, :bad_request)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      validation_error("Record Not Found", e.message, 404, :not_found)
    end
  end

  private

  def handle_error(e)
    mapped = map_error(e)
    # notify about unexpected_error unless mapped
    mapped ||= Errors::StandardError.new
    render_error(mapped, mapped.status)
  end

  def map_error(e)
    error_klass = e.class.name
    return e if ERRORS.values.include?(error_klass)
    ERRORS[error_klass]&.constantize&.new
  end

  def render_error(error, status)
    error_response(ErrorSerializer.new(error), error.status)
  end

  def validation_error(message, data, status_code, status)
    error_message = Errors::StandardError.new(message, data, status_code)
    render_error(error_message, status)
  end
end
