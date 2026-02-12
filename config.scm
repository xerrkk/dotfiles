(use-modules (gnu)
             (gnu packages admin)
             (gnu packages base)
             (gnu packages commencement)
             (gnu packages wm)
             (gnu packages terminals)
             (gnu packages xorg)
             (gnu packages linux)
             (gnu packages video)
             (gnu packages gnuzilla)
             (gnu packages freedesktop)
             (gnu packages display-managers)
             (gnu packages emacs)
             (nongnu packages linux)
             (nongnu system linux-initrd))

(use-service-modules desktop networking ssh xorg)

(operating-system
  (locale "C.UTF-8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us" "dvorak"))
  (host-name "guix")

  (kernel linux)
  (firmware (list linux-firmware))
  (initrd microcode-initrd)

  (users (cons* (user-account
                  (name "xer")
                  (comment "elixer")
                  (group "users")
                  (home-directory "/home/xer")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  (packages (append (list
                          (specification->package "hyprland")
                          (specification->package "xdg-desktop-portal-hyprland")
                          (specification->package "xdg-desktop-portal-gtk")
                          (specification->package "xorg-server-xwayland")
                          (specification->package "hyprlock")
                          (specification->package "hypridle")
                          (specification->package "waybar")
			  (specification->package "zile")
                          (specification->package "rofi")
                          (specification->package "swaybg")
                          (specification->package "foot")
                          
                          (specification->package "emacs-pgtk")
                          (specification->package "icecat")
                          (specification->package "make")
                          (specification->package "gcc-toolchain")
                          
                          (specification->package "libva-utils")
                          (specification->package "intel-vaapi-driver"))
                     %base-packages))

  (services
   (append
    %desktop-services))

  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets (list "/dev/sda"))
                (keyboard-layout keyboard-layout)))

  (swap-devices (list (swap-space
                        (target (uuid "dad41259-ab3f-43a1-93be-11c3ab8ac765")))))

  (file-systems (cons* (file-system
                         (mount-point "/")
                         (device (uuid "16e59feb-4827-4935-b9fd-7e71a2cd6831" 'ext4))
                         (type "ext4"))
                       (file-system
                         (mount-point "/home")
                         (device (uuid "2eb0ea10-cfe3-4f01-9d3e-adc674da858d" 'ext4))
                         (type "ext4"))
                        %base-file-systems)))
