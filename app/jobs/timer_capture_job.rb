class TimerCaptureJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Page.all.each do |page|
      page.capturebytimecheck
    end
  end
end
