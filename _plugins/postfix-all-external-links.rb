require 'stringio'

Jekyll::Hooks.register([:pages, :posts], :pre_render) do |post|
    # search for URL
    regex = /(https?:\/\/[\S]+)/
    StringIO.open(post.content) do |strio|
        strio.each_line do |characters| #split by lines
            if characters.start_with?("###")
                replace_with = characters.gsub(regex, '\\1?ref=curatedseotools.com)').gsub(/\/?\)\?/,'?') # for each URL append postfix
                post.content.gsub!(characters, replace_with) # replace inline jekyll post content
            end
        end
    end
end
