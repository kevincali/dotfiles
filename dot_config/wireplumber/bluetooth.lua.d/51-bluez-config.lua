-- Enable proper codecs for bluetooth headphones.
-- Source: https://wiki.archlinux.org/title/PipeWire#Low_audio_quality_on_Bluetooth
bluez_monitor.properties = {
  ["bluez5.enable-sbc-xq"] = true,
  ["bluez5.enable-msbc"] = true,
  ["bluez5.codecs"] = "[sbc sbc_xq]",
}
