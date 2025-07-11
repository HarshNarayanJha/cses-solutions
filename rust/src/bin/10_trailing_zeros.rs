use std::io;

fn main() {
    let mut line = String::new();
    io::stdin().read_line(&mut line).unwrap();
    let n: u64 = line.trim().parse().unwrap();

    let mut z: u64 = 0;
    let mut i: u32 = 1;
    loop {
        let k = n / 5_u64.pow(i);
        if k < 1 {
            break;
        }
        z += k;
        i += 1;
    }

    println!("{}", z);
}
