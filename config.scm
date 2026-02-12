(use-modules (gnu)
             (gnu packages xorg)
             (gnu packages linux)
             (gnu packages video)
             (nongnu packages linux)
             (nongnu system linux-initrd))

(use-service-modules cups desktop networking ssh xorg)

(operating-system
  (locale "en_AG.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us" "dvorak"))
  (host-name "guix")

  (kernel linux)
  (firmware (list linux-firmware))
  (initrd microcode-initrd)

  (kernel-arguments '("quiet" "i915.modeset=1"))

  (users (cons* (user-account
                  (name "xer")
                  (comment "Xer")
                  (group "users")
                  (home-directory "/home/xer")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  (packages (append (list (specification->package "emacs")
                          (specification->package "emacs-exwm")
                          (specification->package "emacs-desktop-environment")
                          xf86-video-intel
                          xf86-video-fbdev
                          xf86-video-vesa
                          intel-vaapi-driver) 
                    %base-packages))

  (services
   (append
    (list (set-xorg-configuration
           (xorg-configuration
            (drivers '("intel" "modesetting" "fbdev" "vesa"))
            (modules (list xf86-video-intel 
                           xf86-video-fbdev 
                           xf86-video-vesa)))))
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
