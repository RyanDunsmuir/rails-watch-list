module ListsHelper
  def list_background(list)
    if list.photo.attached?
      cl_image_path(@list.photo.key, height: 300, crop: :fill)
    else
      'https://images.unsplash.com/photo-1584213062606-7a1fc728727d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'
    end
  end
end
