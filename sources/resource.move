module MyAddr::Colln{
    use std::vector;
    use std::signer;
    use std::debug;

    struct Item has store, drop{}

    struct Collection has store, key {
        items: vector<Item>,
    }

    public fun start_collection(account:&signer)
    {
        move_to<Collection>(account, Collection{items: vector::empty<Item>()})
    }
        //presence/absence

    public fun exists_at(at: address):bool{
        exists<Collection>(at)
    }

  


}