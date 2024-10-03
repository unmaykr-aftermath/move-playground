/// Module: touch_object
module touch_object::touch_object {
    public fun touch<T: key>(_arg: &mut T) {
        assert!(false, 0);
    }
}
