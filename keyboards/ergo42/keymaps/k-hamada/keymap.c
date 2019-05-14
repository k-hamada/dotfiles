#include QMK_KEYBOARD_H

#define _QWERTY 0
#define _LOWER 1
#define _RAISE 2

#define TT_LOWER TT(_LOWER)
#define TT_RAISE TT(_RAISE)
#define LM_LGUI LM(_LOWER, MOD_LGUI)
#define LM_RGUI LM(_RAISE, MOD_RGUI)

#define PERMISSIVE_HOLD

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
[_QWERTY] = LAYOUT( \
  KC_ESC  , KC_Q   , KC_W    , KC_E    , KC_R     , KC_T    , KC_LBRC , KC_RBRC , KC_Y    , KC_U     , KC_I    , KC_O    , KC_P    , KC_BSPC , \
  KC_TAB  , KC_A   , KC_S    , KC_D    , KC_F     , KC_G    , LM_LGUI , LM_RGUI , KC_H    , KC_J     , KC_K    , KC_L    , KC_SCLN , KC_ENT  , \
  KC_LSFT , KC_Z   , KC_X    , KC_C    , KC_V     , KC_B    , KC_LSPO , KC_RSPC , KC_N    , KC_M     , KC_COMM , KC_DOT  , KC_SLSH , KC_QUOT , \
  KC_LCTL , KC_APP , KC_LALT , KC_LGUI , TT_LOWER , KC_LCMD , KC_SPC  , KC_SPC  , KC_RCMD , TT_RAISE , KC_LEFT , KC_DOWN , KC_UP   , KC_RGHT \
),
[_LOWER] = LAYOUT( \
  KC_TILD , KC_EXLM , KC_AT   , KC_HASH , KC_DLR  , KC_PERC , KC_CIRC , KC_AMPR , KC_ASTR , KC_LPRN , KC_RPRN , KC_UNDS , KC_PLUS , _______ , \
  _______ , _______ , _______ , _______ , _______ , _______ , _______ , _______ , KC_LEFT , KC_DOWN , KC_UP   , KC_RGHT , _______ , _______ , \
  _______ , KC_UNDO , KC_CUT  , KC_COPY , KC_PSTE , _______ , _______ , _______ , KC_LCBR , KC_RCBR , KC_LBRC , KC_RBRC , _______ , KC_PIPE , \
  RESET   , _______ , _______ , _______ , _______ , _______ , _______ , _______ , _______ , _______ , KC_MUTE , KC_VOLD , KC_VOLU , KC_EJCT \
),
[_RAISE] = LAYOUT( \
  KC_GRV  , KC_1    , KC_2    , KC_3    , KC_4    , KC_5    , KC_6    , KC_7    , KC_8    , KC_9    , KC_0    , KC_MINS , KC_EQL  , _______ , \
  _______ , KC_F1   , KC_F2   , KC_F3   , KC_F4   , KC_F5   , KC_F6   , _______ , KC_LEFT , KC_DOWN , KC_UP   , KC_RGHT , _______ , _______ , \
  _______ , KC_F7   , KC_F8   , KC_F9   , KC_F10  , KC_F11  , KC_F12  , _______ , _______ , _______ , _______ , _______ , _______ , KC_BSLS , \
  _______ , _______ , _______ , _______ , _______ , _______ , _______ , _______ , _______ , _______ , KC_HOME , KC_PGDN , KC_PGUP , KC_END \
)
};
