use std::io;

fn main() {
    let mut input = String::new();
    match io::stdin().read_line(&mut input) {
        Ok(_n) => (),
        Err(error) => panic!("error: {error}"),
    }

    let mut n: u64 = input.strip_suffix("\n").unwrap().parse().unwrap();

    while n > 1 {
        print!("{} ", n);
        if n & 1 == 0 {
            n >>= 1;
        } else {
            n = (n * 3) + 1;
        }
    }

    print!("{}", n);
}
