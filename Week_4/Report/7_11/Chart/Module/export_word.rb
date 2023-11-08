# frozen_string_literal: true

# Module Export
module Export
  def self.export_word
    Caracal::Document.save 'example.docx' do |docx|
      docx.img 'mini_pie_keynote.png' do
        width   250
        height  200
        align   :left
      end
    end
  end
end
