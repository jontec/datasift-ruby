# Custom error class for rescuing DataSift errors
class DataSiftError < StandardError
  attr_reader :status, :body, :response

  def initialize(http_status = nil, http_body = nil, response_on_error = nil)
    @status = http_status
    @body   = http_body
    @response = response_on_error
  end

  def message
    @body.nil? ? @status : @body
  end

  def to_s
    # If both body and status were provided then message is the body otherwise
    #   the status contains the message
    msg = !@body.nil? && !@status.nil? ? @body : @status
    # If body is nil then status is the message body so no status is included
    status_string = @body.nil? ? '' : "(Status #{@status}) "
    "#{status_string} : #{msg}"
  end
end

class NotSupportedError < DataSiftError
end

# Standard error returned when receiving a 400 response from the API
class BadRequestError < DataSiftError
end

# Standard error returned when receiving a 401 response from the API
class AuthError < DataSiftError
end

class ConnectionError < DataSiftError
end

# Standard error returned when receiving a 404 response from the API
class ApiResourceNotFoundError < DataSiftError
end

# Standard error returned when receiving a 409 response from the API
class ConflictError < DataSiftError
end

# Standard error returned when receiving a 410 response from the API
class GoneError < DataSiftError
end

# Standard error returned when receiving a 412 response from the API
class PreconditionFailedError < DataSiftError
end

# Standard error returned when receiving a 413 response from the API
class PayloadTooLargeError < DataSiftError
end

# Standard error returned when receiving a 415 response from the API
class UnsupportedMediaTypeError < DataSiftError
end

# Standard error returned when receiving a 422 response from the API
class UnprocessableEntityError < DataSiftError
end

# Standard error returned when receiving a 429 response from the API
class TooManyRequestsError < DataSiftError
end

# Standard error returned when receiving a 503 response from the API
class ServiceUnavailableError < DataSiftError
end

# Standard error returned when receiving a 504 response from the API
class GatewayTimeoutError < DataSiftError
end

class InvalidConfigError < DataSiftError
end

class InvalidParamError < DataSiftError
end

class NotConnectedError < DataSiftError
end

class ReconnectTimeoutError < DataSiftError
end

class NotConfiguredError < DataSiftError
end

class InvalidTypeError < DataSiftError
end

class StreamingMessageError < DataSiftError
end

class WebSocketOnWindowsError < DataSiftError
end

# Standard error returned when trying to use a method while missing parameters
class BadParametersError < DataSiftError
end
