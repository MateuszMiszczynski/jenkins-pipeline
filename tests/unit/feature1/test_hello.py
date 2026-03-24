from src.feature1.hello import greet

def test_greet():
    assert greet("Anyone") == "Hello, Anyone!"
