use std::{
    cmp::Ordering,
    collections::{BinaryHeap, HashMap},
    io,
};

#[derive(Eq, PartialEq, Debug)]
struct Entry {
    key: char,
    value: i32,
}

impl Ord for Entry {
    fn cmp(&self, other: &Self) -> Ordering {
        self.value.cmp(&other.value)
    }
}

impl PartialOrd for Entry {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

fn main() {
    let mut line = String::new();
    io::stdin().read_line(&mut line).unwrap();

    let mut choices: HashMap<char, i32> = line.trim().chars().fold(HashMap::new(), |mut acc, x| {
        acc.insert(x, acc.get(&x).unwrap_or(&0_i32) + 1 as i32);
        acc
    });

    let mut left: Vec<char> = Vec::new();

    while choices.values().sum::<i32>() > 0 {
        let heap: BinaryHeap<Entry> = choices
            .iter()
            .map(|(key, value)| Entry {
                key: key.clone(),
                value: value.clone(),
            })
            .collect();
        let e = heap.peek().unwrap();

        if e.value >= 2 {
            left.extend([e.key].repeat((e.value / 2) as usize));
            choices.entry(e.key).and_modify(|v| *v -= (e.value / 2) * 2);
        } else if e.value == 1 {
            left.push(e.key);
            choices.entry(e.key).and_modify(|v| *v -= 1);
            break;
        }
    }

    let &c = choices.values().max().unwrap();

    if c == 0 {
        left.iter().for_each(|x| print!("{}", x));
        let skip = if line.len() & 0x1 == 0 { 1 } else { 0 };
        left.iter().rev().skip(skip).for_each(|x| print!("{}", x));
        println!("");
    } else {
        println!("NO SOLUTION");
    }
}
