use std::io;

fn main() {
    let mut line = String::new();
    let _ = io::stdin().read_line(&mut line);

    let n: u32 = line.trim().parse().unwrap();

    if n == 1 {
        print!("{}", 1);
        return;
    }

    if n <= 3 {
        print!("NO SOLUTION");
        return;
    }

    (2..=n)
        .filter(|x| x % 2 == 0)
        .for_each(|x| print!("{} ", x));

    (1..=n)
        .filter(|x| x % 2 != 0)
        .for_each(|x| print!("{} ", x));
}
