class Ckeditor::Asset < ActiveRecord::Base
  include Ckeditor::Orm::ActiveRecord::AssetBase
  include Ckeditor::Backend::Paperclip

  def mime_type_from_mimemagic
    MimeMagic.by_magic(File.open(path)).type
  end

end
