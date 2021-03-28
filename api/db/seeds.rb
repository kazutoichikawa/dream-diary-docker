5.times do |i|
  dream = Dream.new(
    title: "Title #{i+1}",
    discription: "Discription #{i+1}",
    date: Date.today + i
  )

  dream.save!
end


