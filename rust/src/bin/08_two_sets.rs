use std::{collections::HashSet, io};

fn main() {
    let mut line = String::new();
    io::stdin().read_line(&mut line).unwrap();
    let mut n: u64 = line.trim().parse().unwrap();

    let mut s = n * (n + 1) / 2;
    if s % 2 != 0 {
        println!("NO");
        return;
    }

    println!("YES");

    s = s / 2;
    let mut left: HashSet<u64> = HashSet::new();

    while s >= n {
        left.insert(n);
        s -= n;
        n -= 1;
    }

    if s > 0 {
        left.insert(s);
    }

    let right = (1..=n).collect::<HashSet<u64>>();
    let right = right
        .difference(&left)
        .map(|&x| x)
        .collect::<HashSet<u64>>();

    println!("{}", left.len());
    for x in left.iter() {
        print!("{} ", x);
    }
    println!("");

    println!("{}", right.len());
    for x in right.iter() {
        print!("{} ", x);
    }
    println!("");
}
