pub fn exec(a: i64, b: i64) -> i64 {
    a + b
}

#[cfg(test)]
mod test {
    use crate::exec;

    #[test]
    fn test_execute() {
        assert_eq!(exec(1, 1), 2);
    }
}
