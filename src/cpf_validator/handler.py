from .validator import validate_cpf


def handler(event: dict, context) -> dict:
    cpf = event.get("cpf") if isinstance(event, dict) else None
    return {"valid": validate_cpf(cpf) if cpf else False}
