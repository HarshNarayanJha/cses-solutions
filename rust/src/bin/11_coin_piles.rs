use std::io;

fn main() {
    let mut line = String::new();
    io::stdin().read_line(&mut line).unwrap();
    let n: u32 = line.trim().parse().unwrap();

    for _ in 0..n {
        line.clear();
        io::stdin().read_line(&mut line).unwrap();
        let nums: Vec<u32> = line
            .trim()
            .split_whitespace()
            .map(|x| x.trim().parse().unwrap())
            .collect();
        let (a, b) = (nums[0], nums[1]);

        if (a + b) % 3 == 0 && a.min(b) * 2 >= a.max(b) {
            println!("YES")
        } else {
            println!("NO")
        }
    }
}
