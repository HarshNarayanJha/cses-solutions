use std::io;

const MOD: u64 = (1e9 + 7_f64) as u64;

fn bin_pow(b: u64, n: u64) -> u64 {
    if n == 0 {
        return 1;
    }

    if n == 1 {
        return b % MOD;
    }

    let mut res = bin_pow(b, n / 2);
    res = (res * res) % MOD;
    if (n & 0x1) != 0 {
        res = (res * b) % MOD;
    }

    res
}

fn main() {
    let mut line = String::new();
    io::stdin().read_line(&mut line).unwrap();
    let n: u64 = line.trim().parse().unwrap();
    let res = bin_pow(2, n);
    println!("{}", res);
}
