module PostsHelper
  def choose_new_or_edit
    if action_name == "new" || action_name == "create" || action_name == "destroy"
      confirm_posts_path
    end
  end
end
