# Design Explanation

## FSM Architecture

The vending machine controller is implemented using a Moore Finite State Machine.

Every state represents one stage of the vending process.

---

## State Description

### 1. Initial State

- Default state after reset.
- Waits for the Start signal.
- Clears previous transaction data.

---

### 2. Product Selection State

After the Start signal, the machine waits for the user to select one of the available products.

According to the selected product code, the FSM moves to the corresponding product state.

| Product Code | Product |
|--------------|---------|
|000|Coke|
|001|Pepsi|
|010|Water Bottle|
|011|Coffee|

---

### 3. Product Waiting States

Each product has its own payment state.

Responsibilities:

- Display selected product price
- Accept ₹5 coin
- Accept ₹10 coin
- Accept Online Payment
- Accept Cancel request

The total inserted amount is continuously updated.

---

### 4. Payment Verification

If

Inserted Amount ≥ Product Price

the FSM moves to the Dispense State.

If Online Payment is successful,

the FSM directly moves to the Dispense State.

Otherwise,

the machine continues waiting for payment.

---

### 5. Cancel Operation

If the Cancel button is pressed,

- All inserted coins are returned.
- Transaction is cancelled.
- Product price is cleared.
- FSM returns to the Initial State.

---

### 6. Dispense State

Responsibilities:

- Dispense selected product
- Calculate return change
- Reset total coin value
- Clear product price
- Return to Initial State

---

## Coin Handling

Supported coins:

- ₹5
- ₹10

Coin values are accumulated using an internal register.

Example:

Water Bottle Price = ₹10

Inserted Coins:

₹5 + ₹10

Total = ₹15

Returned Change = ₹5

---

## Online Payment

If Online Payment is selected,

- Coin payment is skipped
- Product is dispensed
- No change is returned

---

## Outputs

| Output | Description |
|----------|------------|
|dispense_product|High during dispense state|
|return_change|Displays returned amount|
|product_price|Displays selected product price|
|out_state|Current FSM State|

---

## Verification

The design has been verified using a dedicated Verilog Testbench covering:

- Reset
- Online Payment
- Coin Payment
- Cancel Operation
- Return Change
- Exact Payment
- Multiple Coin Insertions
- Insufficient Funds