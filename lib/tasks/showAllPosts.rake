namespace :mp do
  desc "全ユーザの全投稿を表示設定にします"
  task showAllPosts: :environment do
    Micropost.find_each do |post|
      post.update_columns(hidden: false)
    end
    puts "全ユーザの全投稿を表示設定にしました。"
  end
end
