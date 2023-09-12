module MyAddr::example{
    use aptos_std::debug;
    
    
    #[test(account = @0x1)]
    public entry fun debugex(account: signer){
        let a:u8= 23;
      
        debug::print<u8>(&a);
    }
}