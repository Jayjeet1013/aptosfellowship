module MyAddr::example{
    use aptos_std::debug;
    use std::signer;

public fun adding(a: u8,b: u8):u8{
        a+b
}

#[test(account = @0x1)]
public entry fun addex(){
        let c:u8 = adding(3,4);
        debug::print<u8>(&c);
}


    #[test(account = @0x1)]
    public entry fun debugex(account: signer){
        let a:u8= 23;
        let addr = signer::address_of(&account);
        debug::print<address>(&addr);
        debug::print<u8>(&a);
    }
}