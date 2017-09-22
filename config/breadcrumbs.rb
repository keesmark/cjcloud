crumb :root do
  link "home", root_path
end

crumb :c_boards do
  link "クラシファイド", c_boards_path
  parent :root
end

crumb :area do |area|
  link area.name, area
  parent :c_boards
end

crumb :area_category do |area, category|
  # link area.name, area
  link category.name, area_category_path(area, id: category.id)
  parent :area, area
end

crumb :detail do 
  link "詳細", c_board_path
  parent :c_boards
end

crumb :user do |user|
  link user.id, user
end

crumb :inquiry do
  link "お問い合わせ", inquiry_path
  parent :root
end

crumb :inquiry_confirm do
  link "内容確認", inquiry_confirm_path
  parent :inquiry
end

crumb :inquiry_thanks do
  link "送信完了", inquiry_thanks_path
  parent :inquiry_confirm
end

crumb :c_board_inquiry do
  link "お問い合わせ", c_board_inquiry_path
  parent :c_boards
end

crumb :c_board_inquiry_confirm do
  link "内容確認", c_board_inquiry_confirm_path
  parent :c_board_inquiry
end

crumb :c_board_inquiry_thanks do
  link "送信完了", c_board_inquiry_thanks_path
  parent :c_board_inquiry_confirm
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).