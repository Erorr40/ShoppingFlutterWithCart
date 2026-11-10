import 'package:flutter_test/flutter_test.dart';
import 'package:textformfieldex/cart_manager.dart';
import 'package:textformfieldex/main.dart';

void main() {
  setUp(() {
    CartManager.instance.clearCart();
  });

  testWidgets('Add to cart updates total at bottom and cart items', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Initially total is $0.00
    expect(find.text('Total: \$0.00'), findsOneWidget);

    // Tap first Add to Cart button (Smart Watch - 120.0)
    final addButtons = find.text('Add to Cart');
    expect(addButtons, findsWidgets);

    await tester.tap(addButtons.first);
    await tester.pumpAndSettle();

    // Total should update to $120.00
    expect(find.text('Total: \$120.00'), findsOneWidget);
  });
}
