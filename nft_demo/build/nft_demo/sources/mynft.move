module nft_demo::mynft {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    struct Dog has key,store{
        id: UID,
        name: string::String,
        url: string::String
    }

    public fun mint(name: string::String, url: string::String,ctx: &mut TxContext){
        let dog = Dog {
            id: object::new(ctx),
            name: name,
            url: url
        };
        transfer::transfer(dog, tx_context::sender(ctx));
    }

    public fun name(dog: &Dog): string::String {
        dog.name
    }

    public fun url(dog: &Dog): string::String {
        dog.url
    }
}
