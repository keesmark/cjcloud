# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://cj-cloud.com"
SitemapGenerator::Sitemap.sitemaps_host = 'https://cjimage.s3.amazonaws.com'
SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new({
  fog_provider: 'AWS',
  fog_directory: ENV['AWS_S3_BUCKET'],
  fog_region: ENV['AWS_REGION'],
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
})

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  
     add root_path, :priority => 1.0, :changefreq => 'daily'
     
     add c_boards_path, :priority => 1.0, :changefreq => 'daily'
     
     add policy_path, :priority => 0, :changefreq => 'never'
     
     add signup_path, :priority => 0.2, :changefreq => 'monthly'
     
     add login_path, :priority => 0.2, :changefreq => 'monthly'
     
     add inquiry_path, :priority => 0.2, :changefreq => 'monthly'
     
     #add c_board_inquiry_path, :priority => 0.2, :changefreq => 'monthly'
     
     CBoard.find_each do |c_board|
       add c_boards_path(c_board), :lastmod => c_board.updated_at
     end
end
