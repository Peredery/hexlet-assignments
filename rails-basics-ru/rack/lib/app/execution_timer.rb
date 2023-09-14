# frozen_string_literal: true

require 'rack'

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    started_at = Time.now
    execution_time = ((Time.now - started_at) * 100).ceil
    [status, headers, body << "\nExecution time #{execution_time} ms"]
  end
end