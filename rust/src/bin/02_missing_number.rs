use std::io;

fn main() {
    let mut line = String::new();
    let _ = io::stdin().read_line(&mut line);
    let n: u64 = line.trim().parse().unwrap();

    line.clear();
    let _ = io::stdin().read_line(&mut line);

    let expected = n * (n + 1) / 2;
    let actual = line
        .split_ascii_whitespace()
        .map(|x| x.parse::<u64>().unwrap())
        .fold(0, |s, x| s + x);

    print!("{}", expected - actual);
}
