use std::io;

fn main() {
    let mut line = String::new();
    let _ = io::stdin().read_line(&mut line);
    let n: u64 = line.trim().parse().unwrap();

    line.clear();
    let _ = io::stdin().read_line(&mut line);

    let mut nums: Vec<u64> = line
        .trim()
        .split_ascii_whitespace()
        .map(|x| x.parse().unwrap())
        .collect();

    let mut moves = 0;
    for i in 1..n as usize {
        if nums[i] < nums[i - 1] {
            moves += nums[i - 1] - nums[i];
            nums[i] = nums[i - 1];
        }
    }

    print!("{moves}")
}
