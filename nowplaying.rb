# -*- coding: utf-8 -*-
require 'kconv'
Plugin.create(:nowplaying) do
  command(:nowplaying,
          name: "なうぷれTunes",
          condition: lambda{ |opt| true },
          visible: true,
          role: :postbox
  ) do |opt|
    begin
      SEPARATOR = File::ALT_SEPARATOR || File::SEPARATOR
      path = File.expand_path(File.dirname(__FILE__)) + SEPARATOR + "PluginReceiver.exe"
      np = `#{path} mikutter`
      Plugin[:gtk].widgetof(opt.widget).widget_post.buffer.text = NKF.nkf('-wxm0', np)
    end
  end
end