module UsersHelper
    def like(post)
        likes << post
    end

    def unlike(post)
        likes.delete(post)
    end

    def liked?(post)
        likes.include?(post)
    end
end
