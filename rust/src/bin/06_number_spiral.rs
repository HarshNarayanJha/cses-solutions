use std::io;

fn main() {
    let mut line = String::new();
    io::stdin().read_line(&mut line).unwrap();
    let n: u32 = line.trim().parse().unwrap();

    line.clear();

    for _ in 0..n {
        line.clear();
        io::stdin().read_line(&mut line).unwrap();

        let mut iter = line
            .trim()
            .split_whitespace()
            .map(|x| x.parse::<u64>().unwrap());
        let y = iter.next().unwrap();
        let x = iter.next().unwrap();

        if x == 1 && y == 1 {
            println!("{}", 1);
        } else if x > y {
            if x % 2 != 0 {
                println!("{}", x * x - y + 1);
            } else {
                println!("{}", (x - 1) * (x - 1) + y);
            }
        } else {
            if y % 2 == 0 {
                println!("{}", y * y - x + 1);
            } else {
                println!("{}", (y - 1) * (y - 1) + x);
            }
        }
    }
}
