use std::io;

fn main() {
    let mut line = String::new();
    io::stdin().read_line(&mut line).unwrap();
    let n: u64 = line.trim().parse().unwrap();

    println!("{}", 0);

    for k in 2..=n {
        println!("{}", (k * k * (k * k - 1) / 2) - (4 * (k - 2) * (k - 1)));
    }
}
