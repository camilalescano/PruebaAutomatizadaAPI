Feature: Consulta y creación de órdenes en la tienda

  Scenario Outline: Creación de orden
    Given url "https://petstore.swagger.io/v2"
    And path "store/order"
    And request

    """
    {
      "id": <ORDER_ID>,
      "petId": <ID_MASCOTA>,
      "quantity": 5,
      "shipDate": "2024-07-02T15:17:02.823Z",
      "status": "placed",
      "complete": true
    }
    """
    Then method post
    And status 200
    And print response.name
    Examples:
      | ID_MASCOTA| ORDER_ID |
      |     1     |    5     |
      |     2     |    6     |

  Scenario Outline: Consulta de orden
    Given url "https://petstore.swagger.io/v2"
    And path "store/order/<ORDER_ID>"
    When method get
    And status 200
    Examples:
      | ORDER_ID |
      |   5      |
      |   6      |