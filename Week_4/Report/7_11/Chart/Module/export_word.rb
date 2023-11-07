# frozen_string_literal: true

# Module Export
module Export
	def self.export_word
    # image_filename = 'mini_pie_keynote.png'

    # image_path = File.join('./Chart/', image_filename)

    Caracal::Document.save 'example.docx' do |docx|
      docx.img './Chart/mini_pie_keynote.png' do
        width   250
        height  200
        align   :left
      end
    end
	end
end
