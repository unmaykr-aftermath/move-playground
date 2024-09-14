/// Module: counter
module counter::counter {
    use sui::event;

    public struct Counter has key {
        id: UID,
        count: u64,
    }

    public struct AdminCap has key, store {
        id: UID,
    }

    public struct IncrementedCounter has copy, drop {
        count: u64,
    }

    fun init(ctx: &mut sui::tx_context::TxContext) {
        let counter = Counter { id: object::new(ctx), count: 0};
        transfer::share_object(counter);

        let sender = ctx.sender();
        transfer::transfer(AdminCap { id: object::new(ctx) }, sender);
    }

    public fun increment(_: &AdminCap, counter: &mut Counter) {
        counter.count = counter.count + 1;
        event::emit(IncrementedCounter { count: counter.count });
    }
}