module MyAddr::game{
  use std::signer;
  use std::debug;

  const StarAlreadyExists:u64 = 100;
  const StarDoesNotExist:u64 = 101;

  struct GameStar has key {
    name: vector<u8>,
    country: vector<u8>,
    position: u8,
    value: u64
  }

  public fun newStar(name:vector<u8>, country:vector<u8>, position:u8):GameStar{
    return GameStar{name, country, position, value:0}
  }

  public fun get(owner: address):(vector<u8>, u64) acquires GameStar {
    let star = borrow_global<GameStar>(owner);
    // let price:u64 = 5;
    // star.value = 5;
    (star.name, star.value)
  }

  public fun mint(to:&signer, star:GameStar){
    let addr = signer::address_of(to);
    assert!(!exists<GameStar>(addr), StarAlreadyExists);
    move_to(to, star);
  }

  public fun setPrice(owner: address, price:u64) acquires GameStar{
    assert!(exists<GameStar>(owner), StarDoesNotExist);
    let star = borrow_global_mut<GameStar>(owner);
    star.value = price;
  }

  public fun transfer(owner:&signer, to:&signer) acquires GameStar{
    let addrto = signer::address_of(to);
    let addro = signer::address_of(owner);

    assert!(exists<GameStar>(addro), StarDoesNotExist);

    let star = move_from<GameStar>(addro);
    star.value = star.value+20;
    assert!(!exists<GameStar>(addrto), StarAlreadyExists);
    move_to<GameStar>(to,star);
  }

  #[test(account = @0xACe, to = @0xBB)]
  public entry fun gameTest(account:&signer, to:&signer) acquires GameStar{
    let star:GameStar = MyAddr::game::newStar(b"Sneha", b"Bharat", 6);
    // let starNew:GameStar = MyAddr::game::newStar(b"Alice", b"India", 3);
    debug::print<GameStar>(&star);
    MyAddr::game::mint(account, star);
    // MyAddr::game::mint(account, starNew);
    let addr = signer::address_of(account);
    debug::print<address>(&addr);
    let (name, value):(vector<u8>, u64) =  MyAddr::game::get(addr);
    debug::print<vector<u8>>(&name);
    debug::print<u64>(&value);
    MyAddr::game::setPrice(addr, 25);
    let (new_name, new_value):(vector<u8>, u64) =  MyAddr::game::get(addr);
    debug::print<vector<u8>>(&new_name);
    debug::print<u64>(&new_value);
    let addrto = signer::address_of(to);
    debug::print<address>(&addrto);
    // MyAddr::game::setPrice(addrto, 54);
    MyAddr::game::transfer(account, to);
    let addrto = signer::address_of(to);
    debug::print<address>(&addrto);
    let (to_name, to_value):(vector<u8>, u64) =  MyAddr::game::get(addrto);
    debug::print<vector<u8>>(&to_name);
    debug::print<u64>(&to_value);
  }
}