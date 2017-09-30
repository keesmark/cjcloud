module ApplicationHelper
  def default_meta_tags
  {
    title:       "CJ cloud カナダ掲示板・クラシファイド",
    description: "カナダと日本を繋ぐ掲示板です。いろんな情報をシェアしたり、売り買いや求人、ホームステイと様々なことを探したりできます。",
    keywords:    "カナダ,掲示板,クラシファイド,求人,ホームステイ",
    icon: image_url("favicon.ico"),
    charset: "UTF-8",
    og: {
      title: :title,
      type: "website",
      url: request.original_url,
      image: image_url("favicon.ico"),
      site_name: "CJ cloud",
      description: :description,
      locale: "ja_JP"
    } 
  }
  end
end
