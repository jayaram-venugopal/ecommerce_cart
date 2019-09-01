module Response
  def json_response(object, status = :ok, message=nil)
    response = {"status": "Success", "data": object, "message": ""}
    render json: response, status: status
  end

  def error_response(object, status = :unprocessable_entity)
    render json: object, status: status
  end
end