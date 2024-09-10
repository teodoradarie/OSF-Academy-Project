@isTest
private class DiscountCalculatorTest {
    @isTest static void testCalculateDiscount() {
        DiscountCalculator calculator = new DiscountCalculator();
        // Test amount with no discount
        System.assertEquals(99, calculator.calculateDiscount(99, null), 'Amounts less than 100 should not receive a discount.');
        // Test amount with 10% discount
        Decimal expectedAmountFor200 = 200 - (200 * 0.1); // 10% discount
        System.assertEquals(expectedAmountFor200, calculator.calculateDiscount(200, null), 'Amounts between 100 and 200 should receive a 10% discount.');
        // Test amount with 15% discount
        Decimal expectedAmountFor400 = 400 - (400 * 0.15); // 15% discount
        System.assertEquals(expectedAmountFor400, calculator.calculateDiscount(400, null), 'Amounts between 200 and 500 should receive a 15% discount.');
        // Test amount with 20% discount
        Decimal expectedAmountFor1000 = 1000 - (1000 * 0.2); // 20% discount
        System.assertEquals(expectedAmountFor1000, calculator.calculateDiscount(1000, null), 'Amounts of 500 and above should receive a 20% discount.');
        // Test amount with special discount code
        Decimal expectedAmountFor200WithCode = (200 - (200 * 0.1)) * 0.95; // 10% discount and additional 5% discount
        System.assertEquals(expectedAmountFor200WithCode, calculator.calculateDiscount(200, 'OSF5'), 'Amounts with the special discount code should receive an additional 5% discount.');
        // Test null amount
        System.assertEquals(0, calculator.calculateDiscount(null, null), 'Null amounts should result in a 0 return value.');
        // Test null discount code with eligible amount
        System.assertEquals(expectedAmountFor200, calculator.calculateDiscount(200, null), 'Null discount code should not affect the discount calculation.');
    }
}