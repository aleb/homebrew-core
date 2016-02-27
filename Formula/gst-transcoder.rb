class GstTranscoder < Formula
  desc "GStreamer Transcoding API"
  homepage "https://github.com/pitivi/gst-transcoder"
  url "https://github.com/pitivi/gst-transcoder/archive/1.8.1.tar.gz"
  version "1.8.1"
  sha256 "372f1a8c4de6690f82360e2e312606fa398e802e55a7534b39aa64acbb7a8c25"

  depends_on "meson"  => :build
  depends_on "ninja"  => :build
  depends_on :python3
  depends_on "gstreamer"
  # Required for gstreamer-pbutils-1.0, see meson.build.
  depends_on "gst-plugins-base"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/gst-transcoder-1.0", "--help"
  end
end
