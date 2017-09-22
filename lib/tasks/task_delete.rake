namespace :task_delete do
  desc "delete post after a month"
  task :task_delete => :environment do
    destroyed = CBoard.where("updated_at < '#{Date.today.prev_month.beginning_of_day}' ").destroy_all
    puts "[task_delete:task_delete] -- CBoard was successfully deleted."
    puts "[task_delete:task_delete] -- Execute details: [target_date_below: 'Date.today.prev_month.beginning_of_day' /records: #{destroyed.length}]"
  end
end
