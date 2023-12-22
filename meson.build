project('mate-wayland-session',
  version: '1.27.0',
  meson_version: '>=0.50.0',
  license: 'GPLv2+',
)

prefix = get_option('prefix')
bindir = join_paths(prefix, get_option('bindir'))
datadir = join_paths(prefix, get_option('datadir'))

subdir('data')
subdir('session')
