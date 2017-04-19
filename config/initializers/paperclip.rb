Paperclip.options[:content_type_mappings] = {
    apk: %w(application/vnd.android.package-archive application/zip),
    ipa: %w(application/octet-stream application/zip)
}

Paperclip.interpolates :app_name  do |attachment, style|
  attachment.instance.app.name.downcase
end
Paperclip.interpolates :app_platform  do |attachment, style|
  attachment.instance.platform.name
end
Paperclip.interpolates :app_version  do |attachment, style|
  attachment.instance.version
end
Paperclip.interpolates :app_build  do |attachment, style|
  attachment.instance.build
end
Paperclip.interpolates :app_filename  do |attachment, style|
  attachment.instance.appli_file_name
end