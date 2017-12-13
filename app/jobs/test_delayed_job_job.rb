class TestDelayedJobJob < ApplicationJob
  queue_as :default

  def perform(*args)

    # debug "delayed"
    # Do something later
  end
end
