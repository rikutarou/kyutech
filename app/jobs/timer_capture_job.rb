class TimerCaptureJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Page.all.each do |page|
      page.capturebytimecheck
    end

    # Next schedule
    TimerCaptureJob.set(wait: 60.minute).perform_later
  end
end
