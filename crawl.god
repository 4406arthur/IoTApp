God.watch do |w|
  w.name = "crawl"
  w.start = "ruby app/back_end_process/crawl_swot_db.rb"
  w.keepalive
end
