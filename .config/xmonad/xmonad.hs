-- ===========================================================================
-- ██╗  ██╗███╗   ███╗ ██████╗ ███╗   ██╗ █████╗ ██████╗
-- ╚██╗██╔╝████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗
--  ╚███╔╝ ██╔████╔██║██║   ██║██╔██╗ ██║███████║██║  ██║
--  ██╔██╗ ██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══██║██║  ██║
-- ██╔╝ ██╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║  ██║██████╔╝
-- ╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═════╝
-- ===========================================================================
-------------------------------------------------------------------------------
--          written by Farah Abderrazzak Aka FrhXM(https://github.com/FrhXM)  --
-------------------------------------------------------------------------------
-- Import modules                                                           {{{
-------------------------------------------------------------------------------
-- Main
import XMonad                                                                                  
import System.Exit
import Control.Monad (liftM2)                                                                 

-- Actions
import XMonad.Actions.UpdatePointer (updatePointer)
import XMonad.Actions.FindEmptyWorkspace (viewEmptyWorkspace, tagToEmptyWorkspace)
import XMonad.Actions.Minimize (minimizeWindow, withLastMinimized, maximizeWindowAndFocus)
import XMonad.Actions.Promote (promote)
import XMonad.Actions.WithAll (killAll, sinkAll)
import XMonad.Actions.RotSlaves (rotSlavesDown)
import XMonad.Actions.Search  (google, youtube, images, github, promptSearch, searchEngine, promptSearchBrowser)

-- Hooks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops 
import XMonad.Hooks.WindowSwallowing
import XMonad.Hooks.ManageDocks (avoidStruts, docks, ToggleStruts(..))
import XMonad.ManageHook (doFloat)                                                         
import XMonad.Hooks.ManageHelpers (doCenterFloat, doFullFloat, isFullscreen)              
import XMonad.Hooks.FadeInactive (fadeInactiveLogHook) 

-- Utilities
import XMonad.Util.EZConfig ( additionalKeysP )                                                 
import XMonad.Util.SpawnOnce (spawnOnce)                                                    
import XMonad.Util.Cursor (setDefaultCursor)
import XMonad.Util.NamedScratchpad 

-- Layouts/Modifiers 
import XMonad.Layout.ComboP
import XMonad.Layout.Master
import XMonad.Layout.PerWorkspace                                                               
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.LimitWindows
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ShowWName
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances

-- Layouts
import XMonad.Layout.ResizableTile
import XMonad.Layout.ThreeColumns
import XMonad.Layout.OneBig
import XMonad.Layout.TwoPanePersistent
import XMonad.Layout.TwoPane
import XMonad.Layout.Tabbed
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Circle
import XMonad.Layout.Dishes
import XMonad.Layout.HintedGrid
import XMonad.Layout.Dwindle                                                    
import XMonad.Layout.Accordion

-- prompt
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Window
import XMonad.Prompt.Man
import XMonad.Prompt.FuzzyMatch

-- Others
import qualified XMonad.StackSet as W                                                        
import qualified Data.Map 	     as M                                                              

------------------------------------------------------------------------
-- Color Pallatte
------------------------------------------------------------------------
--- One Pallate ---
bg            = "#11121D"
fg            = "#a9b1d6"
black         = "#32344a"
red           = "#f7768e"
green         = "#9ece6a"
yellow        = "#e0af68"
blue          = "#7aa2f7"
magenta       = "#ad8ee6"
cyan          = "#449dab"
white         = "#787c99"

--- Two Pallate ---
black_       = "#444b6a"
red_         = "#ff7a93"
green_       = "#b9f27c"
yellow_      = "#ff9e64"
blue_        = "#7da6ff"
magenta_     = "#bb9af7"
cyan_        = "#0db9d7"
white_       = "#acb0d0"

------------------------------------------------------------------------
-- VARIABLES
------------------------------------------------------------------------
myTerminal           = "kitty"     :: String     -- Terminal
myModMask            = mod1Mask    :: KeyMask    -- leader key (Alt)
myWinMask            = mod4Mask    :: KeyMask    -- Windows Key (Super)
myBorderWidth        = 1           :: Dimension  -- Border size
myNormalBorderColor  = black       :: String     -- Border color of unfocus window
myFocusedBorderColor = blue        :: String     -- Border color of focus window
myFocusFollowsMouse  = True        :: Bool       -- focus follow config
myClickJustFocuses   = False       :: Bool       -- focus click config

myBrowser = "qutebrowser"          :: String    
myFont    = "xft:JetBrains Mono:style=Bold:pixelsize=13" :: String
myBigFont = "xft:FiraCode Nerd Font Mono:pixelsize=100"  :: String

------ Workspaces -------
-- wsDEV           = "¹DEV"
-- wsGIT           = "²GIT"
-- wsWEB           = "³WEB"
-- wsYTB           = "⁴YTB"
-- wsCHT           = "⁵CHT"
-- wsMSC           = "⁶MSC"
-- wsVED           = "⁷VED"
-- wsSIT           = "⁸SIT"
-- wsGME           = "⁹GME"
-- myWorkspaces    = [wsDEV,wsGIT,wsWEB,wsYTB,wsCHT,wsMSC,wsVED,wsSIT, wsGME]
myWorkspaces = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "] 

------------------------------------------------------------------------
-- Startup Hooks
------------------------------------------------------------------------
myStartupHook = do
    spawnOnce "xwallpaper --zoom ~/pix/wall/anime.png"                        	    -- Wallpapers
    spawnOnce "dunst"                                                               -- notfiction
    spawnOnce "unclutter"                                                           -- hidden Mouse
    -- spawnOnce "redshift -O 3800k"                                                   -- Safe your eyes
    spawnOnce "xset r rate 200 80"                                                  -- speeds cursor in urxvt
    spawnOnce "picom --experimental-backends"
    setDefaultCursor xC_left_ptr                                                    -- Default Cursor

------------------------------------------------------------------------
-- ManageHooks
------------------------------------------------------------------------
myManageHook = composeAll 
     [ className =? "qutebrowser"       --> doViewShift " 3 "
     , className =? "Thunar"            --> doViewShift " 9 "
     , className =? "mpv"               --> doViewShift " 9 "
     , className =? "Sxiv"              --> doCenterFloat
     , className =? "Nitrogen"          --> doCenterFloat
     , className =? "Xmessage"          --> doCenterFloat
     , className =? "download"          --> doFloat
     , className =? "error"             --> doFloat
     , className =? "Gimp"              --> doFloat
     , className =? "notification"      --> doFloat
     , isFullscreen                     -->  doFullFloat
     ] <+> namedScratchpadManageHook myScratchPads
    where
     doViewShift = doF . liftM2 (.) W.view W.shift

------------------------------------------------------------------------
-- Scratch Pads
------------------------------------------------------------------------
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "cmus" spawnCmus findCmus manageCmus
                , NS "browser" spawnBrowser findBrowser manageBrowser
                ]
               where
    spawnTerm  = myTerminal ++ " -T scratchpad"
    findTerm   = title =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w
    spawnCmus   = myTerminal ++ " -T cmus -e cmus"
    findCmus    = title =? "cmus"
    manageCmus  = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w
    spawnBrowser = "firefox"
    findBrowser = className =? "firefox"
    manageBrowser = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w

------------------------------------------------------------------------
-- Tiling Layouts
------------------------------------------------------------------------
-------------------- Base Layout ------------------------
myTabTheme      = def
                { fontName              = myFont
                , activeColor           = blue
                , inactiveColor         = bg
                , activeBorderColor     = blue
                , inactiveBorderColor   = bg
                , activeTextColor       = bg
                , inactiveTextColor     = fg
                }

tabs            = renamed [Replace "TABBED"]      
                $ noBorders
                $ maximizeWithPadding 10
                $ minimize 
                $ myGaps 
                $ tabbed shrinkText myTabTheme

threeColMid     = renamed [Replace "THREECOLMID"] 
                $ maximizeWithPadding 10 
                $ minimize 
                $ mySpacings 
                $ ThreeColMid 1 (3/100) (1/2)

oneBig          = renamed [Replace "ONEBIG"]      
                $ maximizeWithPadding 10 
                $ minimize 
                $ mySpacings 
                $ OneBig (3/4) (3/4)

tall            = renamed [Replace "TILD"]  
                $ maximizeWithPadding 10
                $ minimize 
                $ mySpacings 
                $ ResizableTall 1 (3/100) (1/2) []

twoPane         = renamed [Replace "TWOPANE"]
                $ maximizeWithPadding 10
                $ minimize
                $ mySpacings
                $ TwoPanePersistent Nothing (3/100) (1/2)

dishes          = renamed [Replace "DISHES"]
                $ maximizeWithPadding 10
                $ minimize
                $ mySpacings
                $ Dishes 2 (1/5)

circle          = renamed [Replace "CIRCLE"]
                $ maximizeWithPadding 10
                $ minimize
                $ mySpacings
                $ Circle


floats          =  renamed [Replace "FLOAT"]    
                $ maximizeWithPadding 10
                $ minimize 
                $ myGaps 
                $ mySpacings 
                $ simplestFloat

grid            = renamed [Replace "GRID"]
                $ mySpacings
                $ maximizeWithPadding 10
                $ minimize
                $ limitWindows 12
                $ GridRatio (4/3) False

spirals         = renamed [Replace "spirals"]
                $ maximizeWithPadding 10
                $ minimize
                $ mySpacings
                $ Dwindle R CW 1.5 1.1

full            = renamed [Replace "FULL"]       
                $ maximizeWithPadding 10 
                $ minimize 
                $ mySpacings 
                $ limitWindows 20 Full

    --------- Compine Layout ------------
masterTabbed    = renamed [Replace "MASTER TABBED"]       
                $ maximizeWithPadding 10 
                $ minimize 
                $ mastered (1/100) (1/2) $ tabbed shrinkText myTabTheme

oneUp           = renamed [Replace "1UP"]
                $ maximizeWithPadding 10 
                $ mySpacings 
                $ combineTwoP (ThreeCol 1 (3/100) (1/2))
                                    (Simplest)
                                    (Tall 1 0.03 0.5)
                                    (ClassName "mpv")

twoTabbed       = renamed [Replace "TWO TABBED"]
                $ maximizeWithPadding 10 
                $ combineTwoP (TwoPane 0.03 0.5) 
                              (tabbed shrinkText myTabTheme) 
                              (tabbed shrinkText myTabTheme) 
                              (ClassName "mpv")

------------------------------------------------------------------------
-- Layout Hook
------------------------------------------------------------------------
myHandleEventHook= swallowEventHook (className =? "kitty") (return True)
mySpacings       = spacingRaw False (Border 0 10 10 10) True (Border 10 10 10 10) True
myGaps           = gaps [(U, 10),(D, 5),(L, 10),(R, 10)]
myShowWNameTheme = def
                { swn_font              = myBigFont
                , swn_fade              = 1.0
                , swn_bgcolor           = bg
                , swn_color             = blue
                }

myLayoutHook    = showWName' myShowWNameTheme
                $ mkToggle (NBFULL ?? NOBORDERS ?? EOT)
                $ limitWindows 12
                $ avoidStruts
                $ onWorkspaces [" 1 "," 2 "] codeLayouts
                $ onWorkspaces [" 3 "," 4 "] webLayouts
                $ onWorkspaces [" 5 "," 6 "] chatLayouts
                $ onWorkspaces [" 7 "," 8 "] settingeLayouts
                $ onWorkspace " 9 " mediaLayouts
                $ allLayouts
               where 
    allLayouts = tall ||| threeColMid ||| dishes ||| oneBig ||| grid ||| twoPane ||| spirals ||| circle ||| floats ||| tabs
    webLayouts = oneBig ||| threeColMid ||| dishes ||| tall ||| grid ||| twoPane ||| spirals ||| circle ||| floats ||| tabs
    codeLayouts = dishes ||| twoPane ||| tabs
    chatLayouts = grid ||| threeColMid ||| dishes ||| oneBig ||| tall ||| twoPane ||| spirals ||| circle ||| floats ||| tabs
    youtubeLayouts = oneBig ||| full
    settingeLayouts = circle ||| grid ||| spirals ||| floats
    mediaLayouts = oneUp ||| twoTabbed ||| masterTabbed ||| tabs 

------------------------------------------------------------------------
-- XPrompt
------------------------------------------------------------------------
myXPConfig = def 
          { font                = myFont
          , bgColor             = bg
          , fgColor             = fg
          , bgHLight            = green
          , fgHLight            = black
          , borderColor         = blue
          , promptBorderWidth   = 3
          , position            = CenteredAt (1 / 4) (1 / 3)
          , alwaysHighlight     = True
          , height              = 40
          , maxComplRows        = Just 5       -- set to Just 5 for 5 rows Or Nothing
          , maxComplColumns     = Just 2       -- set to Just 5 for 5 coulmn Or Nothing
          , historySize         = 256
          , historyFilter       = id
          , promptKeymap        = vimLikeXPKeymap
          , completionKey       = (0, xK_Tab)
          , changeModeKey       = xK_grave
          , defaultText         = []
          , autoComplete        = Nothing     -- set Just 100000 for .1 sec
          , showCompletionOnTab = False
          , complCaseSensitivity= CaseInSensitive
          , defaultPrompter     = id
                -- Prompt.FuzzyMatch
          , searchPredicate     = fuzzyMatch
          , sorter              = fuzzySort
          }

------------------------------------------------------------------------
-- XP Search 
------------------------------------------------------------------------
aur         = searchEngine "aur" "https://aur.archlinux.org/packages?O=0&K="
archwiki    = searchEngine "archwiki" "http://wiki.archlinux.org/index.php/Special:Search?search="
reddit      = searchEngine "reddit" "https://www.reddit.com/r/unixporn/search/?q="
wallhaven   = searchEngine "wallhaven" "https://wallhaven.cc/search?q="
 
------------------------------------------------------------------------
-- Custom Keys
------------------------------------------------------------------------
myKeys = 
    [
    -- Xmonad
      ("M-q", spawn "xmonad --recompile && xmonad --restart")     
    , ("M-S-q", io exitSuccess)                                  
    
    -- System 
                   --- Audio ---
    , ("<XF86AudioMute>", spawn "pamixer -t && notify-send -t 200 'Toggle mute button!'") 	
    , ("<F9>",         spawn "pamixer -i 5 && notify-send -t 200 `pulsemixer --get-volume | awk '{print $1}'`")
    , ("<F8>",         spawn "pamixer -d 5 && notify-send -t 200 `pulsemixer --get-volume | awk '{print $1}'`")  			    
    , ("<F10>",        spawn "pamixer --default-source -t && notify-send -t 200 'Toggle mute Mic button'")   
                   --- Brightenss ---
    , ("<F5>",         spawn "xbacklight -dec 10 && notify-send -t 200 `xbacklight -get`")
    , ("<F6>",         spawn "xbacklight -inc 10 && notify-send -t 200 `xbacklight -get`")
                   --- ScreenShoot --- 
    , ("<Print>",      spawn "scrot -F ~/pix/screen/%Y-%m-%d-%T-screenshot.png && notify-send -t 2800 'ScreenShot Takeen' 'Saved in ~/pix/screen/'"     )
    , ("M-<Print>",    spawn "scrot -u -F ~/pix/screen/%Y-%m-%d-%T-screenshot.png && notify-send -t 2800 'ScreenShot Takeen' 'Saved in ~/pix/screen/'"  )
    , ("M-S-<Print>",  spawn "scrot -s -F ~/pix/screen/%Y-%m-%d-%T-screenshot.png && notify-send -t 2800 'ScreenShot Takeen' 'Saved in ~/pix/screen/'"  )
                   --- Scripts ---
    , ("M-S-w",        spawn "bash ~/.config/rofi/scripts/wifiMenu.sh" )
    , ("M-S-e",        spawn "bash ~/.config/rofi/scripts/powerMenu.sh")

    -- Apps
    , ("M-S-<Return>", spawn myTerminal)                                      
    , ("M-w",          spawn myBrowser)
    , ("M-r",          spawn "redshift -O 3800K")                                        
    , ("M-x",          spawn "redshift -x")                                              

    -- Run Prompt
    , ("M-d",          spawn "rofi -show drun -show-icons")                                           
    , ("M-S-d",        spawn "dmenu_run -fn 'JetBrains Mono:style=Bold:pixelsize=14' -nb '#11121D' -nf '#7aa2f7' -sb '#7aa2f7' -sf '#11121D' -l 5 -p 'Execute:'")

    -- XMonad Prompt (XPConfig)
    , ("C-p p",        shellPrompt myXPConfig)   
    , ("C-p m",        manPrompt myXPConfig)
    , ("C-p g",        windowPrompt myXPConfig Goto wsWindows)
    , ("C-p b",        windowPrompt myXPConfig Bring allWindows)
    
    -- Prompt Search
    , ("C-s g",        promptSearchBrowser myXPConfig myBrowser google) 
    , ("C-s y",        promptSearchBrowser myXPConfig myBrowser youtube)
    , ("C-s i",        promptSearchBrowser myXPConfig myBrowser images)
    , ("C-s p",        promptSearchBrowser myXPConfig myBrowser github)
    , ("C-s a",        promptSearchBrowser myXPConfig myBrowser archwiki)
    , ("C-s u",        promptSearchBrowser myXPConfig myBrowser aur)
    , ("C-s r",        promptSearchBrowser myXPConfig myBrowser reddit)
    , ("C-s w",        promptSearchBrowser myXPConfig myBrowser wallhaven)
    
   -- ScratchPads 
    , ("M-s t",        namedScratchpadAction myScratchPads "terminal") -- Terminal
    , ("M-s s",        namedScratchpadAction myScratchPads "cmus"    ) -- Cmus [Music Player]
    , ("M-s w",        namedScratchpadAction myScratchPads "browser" ) -- firefox

    -- Window navigation
    , ("M-<Return>",   promote                                 ) {-- Moves the focused window to the master pane --}
    , ("M-t",          withFocused toggleFloat                 ) {-- Floating window --}
    , ("M-f",          sendMessage (Toggle NBFULL) >> sendMessage ToggleStruts) {--FuLL Screen--}
    , ("M-S-f",        withFocused (sendMessage . maximizeRestore)) {-- For Maximaze With Paddings --}
    , ("M-b",          sendMessage ToggleStruts                ) {-- ignore Bar --}
    , ("M-e",          viewEmptyWorkspace                      ) {-- Find Empty Workspaces --}
    , ("M-g",          tagToEmptyWorkspace                     ) {-- Go To workspaces --}
    , ("M-n",          withFocused minimizeWindow              ) {-- For Minimize && Action minimize --}
    , ("M-S-n",        withLastMinimized maximizeWindowAndFocus) {-- For Minimize && Action minimize --}
    , ("M-S-a",        killAll                                 ) {-- Quite All --}
    , ("M-S-t",        sinkAll                                 ) {-- Push ALL floating windows to tile.--}
    , ("M-S-s",        sendMessage $ SwapWindow                ) {-- Compine Two Layout [XM-comboP]--}
    , ("M-S-r",        rotSlavesDown                           ) {-- Don't Touch Layout in Master --}
   
   -- Resize layout
    , ("M-a",          sendMessage MirrorExpand) {-- For Layout ResizableTile( Tiled ) -}
    , ("M-z",          sendMessage MirrorShrink) {-- For Layout ResizableTile( Tiled ) -}

   -- Increase/decrease spacing (gaps)
    , ("M-C-j",        decWindowSpacing 4     )  -- Decrease window spacing
    , ("M-C-k",        incWindowSpacing 4     )  -- Increase window spacing
    , ("M-C-h",        decScreenSpacing 4     )  -- Decrease screen spacing
    , ("M-C-l",        incScreenSpacing 4     )  -- Increase screen spacing
    ]
    where 
        toggleFloat w = windows (\s -> if M.member w (W.floating s)
                    then W.sink w s
                    else (W.float w (W.RationalRect (1/6) (1/6) (2/3) (2/3)) s))
------------------------------------------------------------------------
-- Main && XMobar
------------------------------------------------------------------------
main = xmonad
     . ewmh
     . ewmhFullscreen
     . withEasySB mySB defToggleStrutsKey
     . docks
     $ myConfig
     where
     mySB = statusBarProp "xmobar" (pure myPP)
     	where
	myPP = def 
	      -- Properties of current workspace
	    { ppCurrent = xmobarColor colorPrimary "" . wrap "<box type=Bottom width=2> " " </box>"

	      -- Properties of workspace on other monitor
	    , ppVisible = xmobarColor colorSecondary "" . wrap "<box type=Bottom width=2> " " </box>"

	      -- Properties of hidden workspaces without windows
	    , ppHiddenNoWindows = xmobarColor colorInactive ""
        
        -- Properties of hidden WS (Active)
        , ppHidden = xmobarColor colorFG ""

        -- Type Of layout in xmobar
        , ppLayout = xmobarColor colorInactive ""   

	      -- Title of active window
	    , ppTitle = xmobarColor colorFG "" . shorten 70 
	      
	      -- Separator character
	    , ppSep =  "<fc=#3d85c6> <fn=2>\61762</fn> </fc>"

	      -- WS Separator
	    , ppWsSep = " "

	      -- Number of windows on workspace
	    , ppExtras = [windowCount]

	      -- Order of things
	    , ppOrder  = \(ws:l:t:ex) -> ["<fn=4>" ++ ws ++ "</fn>"] ++ ex ++ ["<fc=" ++ black ++ "> { " ++ l ++ " } </fc> " ++ t ]
	    }     
	    where
		colorBG :: String
		colorBG = "#1f1f1f"

		colorFG :: String
		colorFG = "#caa9fa"

		colorInactive :: String
		colorInactive = "#878787"

		colorPrimary :: String
		colorPrimary = "#3d85c6"

		colorSecondary :: String
		colorSecondary = "#c13e63"
		
		-- this is to show the number of windows in each workspace.
		windowCount :: X (Maybe String)
		windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

-------------------------------------------------------------------------------
-- 	   AllVaribles Not In Containers But In My Heart ==>               ---
-------------------------------------------------------------------------------
myConfig = def  
        { modMask                   = myModMask
		, terminal                  = myTerminal
		, borderWidth               = myBorderWidth
		, focusedBorderColor        = myFocusedBorderColor 
		, normalBorderColor         = myNormalBorderColor
		, focusFollowsMouse         = myFocusFollowsMouse  
		, clickJustFocuses          = myClickJustFocuses
		, workspaces                = myWorkspaces
		, startupHook               = myStartupHook
		, layoutHook                = myLayoutHook
		, manageHook                = myManageHook
        , handleEventHook           = myHandleEventHook
		, logHook		            = updatePointer (0.5, 0.5) (0, 0)
					                >> fadeInactiveLogHook 0.90
	    } `additionalKeysP` myKeys
