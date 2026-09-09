def validate_cpf(cpf: str) -> bool:
    if cpf is None:
        return False

    normalized = "".join(filter(str.isdigit, cpf))

    if len(normalized) != 11:
        return False

    if all(digit == normalized[0] for digit in normalized):
        return False

    first_check_digit = _calculate_check_digit(normalized[:9], 10)
    if int(normalized[9]) != first_check_digit:
        return False

    second_check_digit = _calculate_check_digit(normalized[:10], 11)
    if int(normalized[10]) != second_check_digit:
        return False

    return True


def _calculate_check_digit(base: str, weight_start: int) -> int:
    total = sum(
        int(digit) * weight for digit, weight in zip(base, range(weight_start, 1, -1))
    )
    remainder = (total * 10) % 11
    return 0 if remainder == 10 else remainder
