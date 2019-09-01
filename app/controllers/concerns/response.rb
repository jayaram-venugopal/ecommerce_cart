module Response
  def json_response(object, status = :ok, message=nil)
    response = {"status": "Success", "data": object, "message": ""}
    render json: response, status: status
  end
end