namespace :mp do
  desc "すべての固定を解除する"
  task unpinAll: :environment do
    Micropost.find_each do |post|
      post.update_columns(isPinned: false)
    end
    puts "すべての固定を解除しました"
  end
end
