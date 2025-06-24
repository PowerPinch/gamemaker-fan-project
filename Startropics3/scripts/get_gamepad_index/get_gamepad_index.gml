function get_gamepad_index() {
    // Find the first connected gamepad
    for (var i = 0; i < 4; i++) {
        if (global.gp[i] && gamepad_is_connected(i)) {
            return i;
        }
    }
    // Fallback to 0 if no gamepad is connected
    return 0;
} 