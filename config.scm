(use-modules (gnu)
             (gnu packages admin)
             (gnu packages base)        
             (gnu packages commencement) 
             (gnu packages wm)          
             (gnu packages terminals)   
             (gnu packages xorg)
             (gnu packages linux)
             (gnu packages video)
             (gnu packages browsers)    ; Added for IceCat
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
  
  (users (cons* (user-account
                  (name "xer")
                  (comment "Xer")
                  (group "users")
                  (home-directory "/home/xer")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  (packages (append (list 
                          ;; The Wayland Suite (No Waybar)
                          (specification->package "sway")
                          (specification->package "swaybg")
                          (specification->package "swaylock")
                          (specification->package "swayidle")
                          (specification->package "foot")
                          
                          ;; The Browser
                          (specification->package "icecat")
                          
                          ;; Dev Tools
                          (specification->package "make")
                          (specification->package "binutils")
                          (specification->package "gcc-toolchain")
                          
                          ;; Graphics / Video
                          (specification->package "libva-utils")
                          (specification->package "intel-vaapi-driver"))
                     %base-packages))

  (services
   (append
    (list (service screen-locker-service-type
                   (screen-locker-configuration
                     (name "swaylock")
                     (program (file-append swaylock "/bin/swaylock")))))
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
