install_data('mate-wayland-components.sh',
 install_dir: get_option('bindir'))

install_data('mate-wayland.sh',
 install_dir: get_option('bindir'))

i18n = import('i18n')

i18n.merge_file(
 input: 'MATE.desktop.in',
 output: 'MATE.desktop',
 type: 'desktop',
 po_dir: join_paths(meson.project_source_root(), 'po'),
 install: true,
 install_dir: join_paths(get_option('datadir'), 'wayland-sessions'),
)
