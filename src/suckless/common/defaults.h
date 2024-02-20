// The text font
// Override this with the environment variable LOCAL_DWM_FONT
// E.g.: export LOCAL_DWM_FONT="Inconsolata:size=12:antialias=true:autohint=true"
#define DEFAULT_FONT "monospace:size=13"

// Terminal colors 0-15
#define DEFAULT_COLOR_00 "#101010"
#define DEFAULT_COLOR_01 "#c04040"
#define DEFAULT_COLOR_02 "#48c848"
#define DEFAULT_COLOR_03 "#c8c848"
#define DEFAULT_COLOR_04 "#4888c8"
#define DEFAULT_COLOR_05 "#c040c0"
#define DEFAULT_COLOR_06 "#40c0c0"
#define DEFAULT_COLOR_07 "#c0c0c0"
#define DEFAULT_COLOR_08 "#404040"
#define DEFAULT_COLOR_09 "#e05050"
#define DEFAULT_COLOR_10 "#50e050"
#define DEFAULT_COLOR_11 "#e0e050"
#define DEFAULT_COLOR_12 "#68b8f8"
#define DEFAULT_COLOR_13 "#e050e0"
#define DEFAULT_COLOR_14 "#50e0e0"
#define DEFAULT_COLOR_15 "#e0e0e0"

// The foreground text color
// Override with the environment variable LOCAL_DWM_FG_COLOR
#define DEFAULT_FG_COLOR DEFAULT_COLOR_07

// The background color
// Override with the environment variable LOCAL_DWM_BG_COLOR
#define DEFAULT_BG_COLOR DEFAULT_COLOR_00

// The color of the cursor in 'st'
// Override with the environment variable LOCAL_DWM_CURSOR_COLOR
#define DEFAULT_CURSOR_COLOR DEFAULT_COLOR_15

// The reverse color of the cursor in 'st'
// The cursor will have this color when in a selection highlight
// Override with the environment variable LOCAL_DWM_REV_CURSOR_COLOR
#define DEFAULT_REV_CURSOR_COLOR DEFAULT_COLOR_08
