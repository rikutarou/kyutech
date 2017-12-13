class TimerCaptureJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Page.all.each do |page|
#      page.capturebytimecheck
    end

    # Next schedule
#    TimerCaptureJob.set(wait: 60.minute).perform_later
    nt = (Time.now+3600)
    p nt
    TimerCaptureJob.set(run_at: "#{nt.year}-#{nt.month}-#{nt.day} #{nt.hour}:00:00").perform_later

  end
end
