class TimerCaptureJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Page.all.each do |page|
      page.capturebytimecheck
    end

    # Next schedule
#    TimerCaptureJob.set(wait: 60.minute).perform_later
    nt = (Time.now+3600)
    rat = Time.local(nt.year, nt.month, nt.day, nt.hour, 0, 0);
#    p rat
    TimerCaptureJob.set(wait_until: rat ).perform_later

  end
end
