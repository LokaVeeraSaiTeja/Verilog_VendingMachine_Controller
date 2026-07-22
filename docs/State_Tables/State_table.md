# State Table

## State Encoding

| State Name | Binary Code | Description |
|------------|-------------|-------------|
| Initial State | `0000` | Default state after reset. Waits for the Start signal. |
| Product Selection State | `0001` | Waits for the user to select a product. |
| Coke Selection State | `0010` | Accepts payment for Coke (₹20). |
| Pepsi Selection State | `0011` | Accepts payment for Pepsi (₹15). |
| Water Bottle Selection State | `0100` | Accepts payment for Water Bottle (₹10). |
| Coffee Selection State | `0101` | Accepts payment for Coffee (₹25). |
| Dispense / Return State | `0110` | Dispenses the selected product and returns any change. |

---

## State Transition Table

| Present State | Condition | Next State |
|---------------|-----------|------------|
| Initial State | `start = 0` | Initial State |
| Initial State | `start = 1` | Product Selection State |
| Product Selection State | `product_code = 000` | Coke Selection State |
| Product Selection State | `product_code = 001` | Pepsi Selection State |
| Product Selection State | `product_code = 010` | Water Bottle Selection State |
| Product Selection State | `product_code = 011` | Coffee Selection State |
| Coke Selection State | Cancel = 1 | Initial State |
| Coke Selection State | Online Payment = 1 | Dispense / Return State |
| Coke Selection State | Total Coins ≥ ₹20 | Dispense / Return State |
| Coke Selection State | Otherwise | Coke Selection State |
| Pepsi Selection State | Cancel = 1 | Initial State |
| Pepsi Selection State | Online Payment = 1 | Dispense / Return State |
| Pepsi Selection State | Total Coins ≥ ₹15 | Dispense / Return State |
| Pepsi Selection State | Otherwise | Pepsi Selection State |
| Water Bottle Selection State | Cancel = 1 | Initial State |
| Water Bottle Selection State | Online Payment = 1 | Dispense / Return State |
| Water Bottle Selection State | Total Coins ≥ ₹10 | Dispense / Return State |
| Water Bottle Selection State | Otherwise | Water Bottle Selection State |
| Coffee Selection State | Cancel = 1 | Initial State |
| Coffee Selection State | Online Payment = 1 | Dispense / Return State |
| Coffee Selection State | Total Coins ≥ ₹25 | Dispense / Return State |
| Coffee Selection State | Otherwise | Coffee Selection State |
| Dispense / Return State | Transaction Complete | Initial State |

---

## Product Information

| Product | Product Code | Price |
|---------|--------------|------:|
| Coke | `000` | ₹20 |
| Pepsi | `001` | ₹15 |
| Water Bottle | `010` | ₹10 |
| Coffee | `011` | ₹25 |

---

## Payment Methods

| Payment Type | Description |
|--------------|-------------|
| Coin Payment | Accepts ₹5 and ₹10 coins until the required amount is reached. |
| Online Payment | Immediately proceeds to the Dispense / Return State. |

---

## Cancel Operation

If the **Cancel** button is pressed while waiting for payment:

- All inserted coins are returned.
- Product dispensing is cancelled.
- Product price is cleared.
- FSM returns to the **Initial State**.

---

## Dispense Operation

When the required payment is completed:

- Dispense the selected product.
- Calculate the return change (if any).
- Clear the accumulated coin value.
- Reset the product price.
- Return to the **Initial State**.