#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [0] = LAYOUT(
    KC_ESC,   KC_F1,    KC_F2,    KC_F3,    KC_F4,    KC_F5,    KC_F6,    KC_F7,    KC_F8,    KC_F9,    KC_F10,   KC_F11,   KC_F12,   KC_PSCR,  KC_DEL,   MO(1),
    KC_GRV,   KC_1,     KC_2,     KC_3,     KC_4,     KC_5,     KC_6,     KC_7,     KC_8,     KC_9,     KC_0,     KC_MINS,  KC_EQL,   KC_DEL,   KC_BSPC,  KC_HOME,
    KC_TAB,   KC_Q,     KC_W,     KC_E,     KC_R,     KC_T,     KC_Y,     KC_U,     KC_I,     KC_O,     KC_P,     KC_LBRC,  KC_RBRC,  KC_BSLS,            KC_VOLU,
    KC_LCTL,  KC_A,     KC_S,     KC_D,     KC_F,     KC_G,     KC_H,     KC_J,     KC_K,     KC_L,     KC_SCLN,  KC_QUOT,                      KC_ENT,   KC_VOLD,
    KC_LSFT,  MO(1),    KC_Z,     KC_X,     KC_C,     KC_V,     KC_B,     KC_N,     KC_M,     KC_COMM,  KC_DOT,   KC_SLSH,  KC_RSFT,            KC_UP,    KC_END,
    KC_LCTL,  KC_LALT,  KC_LGUI,                      KC_SPC,   KC_SPC,   KC_SPC,                       KC_RGUI,  KC_RALT,  MO(1),    KC_LEFT,  KC_DOWN,  KC_RGHT
  ),

  [1] = LAYOUT(
    _______,  RGB_M_P,  RGB_M_T,  RGB_M_G,  RGB_M_X,  RGB_M_K,  RGB_M_SN, RGB_M_SW, RGB_M_R,  RGB_M_B,  _______,  _______,  _______,  _______,  _______,  _______,
    _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  RESET,
    _______,  RGB_TOG,  RGB_MOD,  RGB_HUI,  RGB_HUD,  RGB_SAI,  RGB_SAD,  RGB_VAI,  RGB_VAD,  _______,  _______,  _______,  _______,  _______,            KC_BRIU,
    _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  KC_BRID,
    _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
    _______,  _______,  _______,                      _______,  _______,  _______,                      _______,  _______,  _______,  _______,  _______,  _______
  ),
};