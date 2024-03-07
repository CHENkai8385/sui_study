module game_demo::mygame{
    // use sui::object::{Self,ID};
    // use sui::tx_context::{TxContext};
    use std::string;
    use sui::event;
    use std::debug;
    // use oracle::weather::{WeatherOracle};
    use sui::clock::{Self, Clock};
    // use std::vector;
    // use sui::hash::blake2b256;
    // use sui::bcs::{Self};

    const EInvalidNumber: u64 = 0;
    struct GameResult has drop,copy{
        // id: ID,
        your_number: u64,
        computer_number: u64,
        result: string::String
    }

    // ,ctx: &mut TxContext
    public fun play(number: u64, clock: &Clock){
        // 玩家不能输入大于9的数字
        assert!(number < 10,EInvalidNumber);
        let computer_number = get_random(9,clock);
        let resultstr = if (number == computer_number) {
            string::utf8(b"tie")
        } else if (number > computer_number) {
            string::utf8(b"you win")
        } else {
            string::utf8(b"you lose")
        };
        // debug::print(b"your number is {} and computer number is {} and result is {}", number, computer_number, resultstr);
        // let id = object::new(ctx);
        // id: object::uid_to_inner(&id),
        let result = GameResult {
            your_number: number,
            computer_number: computer_number,
            result: resultstr
        };
        event::emit(result);
    }
    // fun u32_to_ascii(num: u32): vector<u8>
    // {
    //     if (num == 0) {
    //         return b"0"
    //     };
    //     let bytes = vector::empty<u8>();
    //     while (num > 0) {
    //         let remainder = num % 10; // get the last digit
    //         num = num / 10; // remove the last digit
    //         vector::push_back(&mut bytes, (remainder as u8) + 48); // ASCII value of 0 is 48
    //     };
    //     vector::reverse(&mut bytes);
    //     return bytes
    // }
    //
    // fun u64_to_ascii(num: u64): vector<u8>
    // {
    //     if (num == 0) {
    //         return b"0"
    //     };
    //     let bytes = vector::empty<u8>();
    //     while (num > 0) {
    //         let remainder = num % 10; // get the last digit
    //         num = num / 10; // remove the last digit
    //         vector::push_back(&mut bytes, (remainder as u8) + 48); // ASCII value of 0 is 48
    //     };
    //     vector::reverse(&mut bytes);
    //     return bytes
    // }

    public fun get_random(max: u64, clock: &Clock):u64{

        // let sender = tx_context::sender(ctx);
        // let tx_digest = tx_context::digest(ctx);
        // let random_pressure_p = oracle::weather::city_weather_oracle_pressure(weather_oracle, 2988507);
        // let random_pressure_l = oracle::weather::city_weather_oracle_pressure(weather_oracle, 88319);

        // let random_vector = vector::empty<u8>();
        // vector::append(&mut random_vector, address::to_bytes(copy sender));
        // vector::append(&mut random_vector, u32_to_ascii(random_pressure_p));
        // vector::append(&mut random_vector, u32_to_ascii(random_pressure_l));
        // vector::append(&mut random_vector, u64_to_ascii(clock::timestamp_ms(clock)));
        // vector::append(&mut random_vector, *copy tx_digest);
        //
        // let temp1 = blake2b256(&random_vector);
        // let random_num_ex = bcs::peel_u64(&mut bcs::new(temp1));
        let random_value = ((clock::timestamp_ms(clock) % max) as u64);
        debug::print(&random_value);
        random_value
    }
}