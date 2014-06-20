require 'redcarpet'
require 'pygmentize'

module MarkdownHelper
  def markdown_with_pygmentize(text)
    options = {fenced_code_blocks: true, disable_indented_code_blocks: true,
      no_intra_emphasis: true}
    redcarpet = Redcarpet::Markdown.new(PygmentizeHTML, options)
    redcarpet.render(text).html_safe
  end

  class PygmentizeHTML < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygmentize.process(code, language)
    end
  end
end
