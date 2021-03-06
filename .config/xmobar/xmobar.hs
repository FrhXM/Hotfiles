Config {
       font                 = "xft:JetBrains Mono:weight=bold:pixelsize=10:antialias=true:hinting=true"
       , additionalFonts    = [ "xft:FiraCode Nerd Font Mono:pixelsize=12:antialias=true:hinting=true"
                                , "xft:Font Awesome 6 Free Solid:pixelsize=12"
                                , "xft:Font Awesome 6 Brands:pixelsize=12"
                                , "xft:JetBrains Mono:style=Bold:pixelsize=10"
                              ]
       , bgColor        = "#11121D"
       , fgColor        = "#a9b1d6"
       , alpha          = 240
       , position       = Static {xpos = 20, ypos = 2, width = 1885, height = 35}
       , border         = BottomB
       , borderWidth    = 0
       , borderColor    = "#1d2021"
       , lowerOnStart   = True
       , hideOnStart    = False
       , allDesktops    = False
       , overrideRedirect = True,
       , pickBroadest   = False,
       , persistent     = True
       , iconRoot       = "/home/frhxm/.config/xmobar/xpm/"  -- default: "[NERD]"
       , commands       = [ Run Date "<fn=2>\xf017</fn> %b %d %Y  %H:%M:%S" "date" 10
                            , Run Cpu ["-t", "<fn=2>\xf108</fn>  CPU: (<total>%)","-H","50","--high","red"] 20
                            , Run Memory ["-t", "<fn=2>\xf233</fn>  MEM: (<usedratio>%)"] 20
                            , Run DiskU [("/", "<fn=2>\xf0c7</fn>  SSD: <free> free")] [] 60
                            , Run BatteryP ["BAT0"] ["-t", " <fn=2>\61671</fn> BAT: <acstatus><watts> (<left>%)"] 360
                            , Run Uptime ["-t", " <fn=2>\62036</fn> UP: <days>d <hours>h"] 36000
                            , Run Com "uname" ["-r"] "" 3600
                            , Run Brightness [ "-t", "<fn=2></fn> BR: <percent>%", "--", "-D", "intel_backlight" ] 60
                            , Run Volume "default" "Master"
                                [ "-t", "<status>", "--"
                                , "--on", "<fc=#449dab><fn=2>\xf028</fn> VOL:  <volume>%</fc>"
                                , "--onc", "#449dab"
                                , "--off", "<fc=#ff7a93><fn=2>\xf026</fn> MUTE  </fc>"
                                , "--offc", "#ff7a93"
                                ] 1
                            , Run XMonadLog
                            ]
       , sepChar        = "%"
       , alignSep       = "}{"
       , template       = "   <action=`bash ~/.config/rofi/scripts/powerMenu.sh` button=1><icon=arch.xpm/></action> <fc=#0db9d7> <fn=2></fn></fc> %XMonadLog%}{<box type=Bottom width=2 mb=2 color=#a9b1d6><fc=#a9b1d6><fn=3></fn> %uname%</fc></box>   <box type=Bottom width=2 mb=2 color=#f7768e><fc=#f7768e>%cpu%</fc></box>   <box type=Bottom width=2 mb=2 color=#9ece6a><fc=#9ece6a>%memory%</fc></box>   <box type=Bottom width=2 mb=2 color=#e0af68><fc=#e0af68>%disku%</fc></box>   <box type=Bottom width=2 mb=2 color=#7aa2f7><fc=#7aa2f7>%battery%</fc></box>   <box type=Bottom width=2 mb=2 color=#ad8ee6><fc=#ad8ee6>%uptime%</fc></box>   <action=`pamixer --toggle-mute` button=1><box type=Bottom width=2 mb=2 color=#449dab>%default:Master%</box></action>   <action=`xbacklight -set 100` button=1><box type=Bottom width=2 mb=2 color=#787c99><fc=#787c99>%bright%</fc></box></action>   <box type=Bottom width=2 mb=2 color=#7da6ff><fc=#7da6ff>%date%</fc></box>   "

       }
