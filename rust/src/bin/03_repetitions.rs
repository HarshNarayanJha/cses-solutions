use std::io;

fn main() {
    let mut dna = String::new();
    let _ = io::stdin().read_line(&mut dna);

    let dna: Vec<char> = dna.chars().collect();

    let mut longest = 1;
    let mut t = 1;
    for i in 1..dna.len() {
        if dna[i] == dna[i - 1] {
            t += 1;
        } else {
            longest = longest.max(t);
            t = 1;
        }
    }

    longest = longest.max(t);
    println!("{}", longest);
}
