import pytest
from function_app import updatecount

def test_updatecount_logic():
    """
    Test that the updatecount helper function correctly increments 
    the string value in the dictionary.
    """
    # Arrange
    initial_item = {"id": "1", "count": "5"}
    
    # Act
    updated_item = updatecount(initial_item)
    
    # Assert
    assert updated_item["count"] == "6"
    assert isinstance(updated_item["count"], str)

def test_updatecount_initial_zero():
    """Test incrementing from zero."""
    initial_item = {"id": "1", "count": "0"}
    updated_item = updatecount(initial_item)
    assert updated_item["count"] == "1"