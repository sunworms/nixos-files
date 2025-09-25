(self: super: {
  mpv = super.mpv.override {
    scripts = [ self.mpvScripts.mpris ];
  };
})
