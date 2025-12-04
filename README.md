# Union Shop - Flutter Coursework

A Flutter based recreation of the University of Portsmouth Student Union shop. This app includes routing, state management, responsive desktop and mobile design, a cart system, products and testing.

## Setup

You'll need Flutter SDK and Chrome.

Install dependencies:
```
flutter pub get
```

Run the app:
```
flutter run -d chrome
```

Run tests:
```
flutter test
```

Then open Chrome DevTools (F12) and switch to mobile view (iPhone 12 Pro works well).

## Features

- Homepage with product highlights
- Product browsing and filtering by collection
- Sorting (A-Z, price)
- Product detail pages with size/color selection
- Shopping cart (add, update quantity, remove items)
- Print Shop for text personalisation
- Sale page for discounted items
- Responsive design

## How it works

Products and collections are loaded from JSON files. The cart is shared across the app so you can add items from any page. Navigation supports deep linking and adapts to screen size (hamburger menu on mobile, full nav bar on desktop).


## File Structure

**Entry Point**
- `lib/main.dart` - App entry point. Sets up routing with `onGenerateRoute` for deep links like `/product/:id` and `/collection/:id`. Uses path-based URLs (no hash).

**Configuration**
- `lib/config/routes.dart` - Defines all route constants and navigation helper methods. Maps route names to screen widgets.

**Models**
- `lib/models/product.dart` - Product model with properties like id, title, price, sizes, colors, stock, and sale discount. Includes helper methods like `isOnSale` and `salePrice`.
- `lib/models/collection.dart` - Collection model that groups products together. Has id, name, description, and asset path.
- `lib/models/cart_item.dart` - Cart item model that wraps a product with quantity, selected size, and selected color. Calculates subtotal.

**Screens**
- `lib/screens/home_screen.dart` - Homepage with hero section and product highlights.
- `lib/screens/product_detail_screen.dart` - Individual product page. Handles size/color selection, quantity adjustment, and add to cart.
- `lib/screens/cart_screen.dart` - Shopping cart with quantity editing, remove items, and checkout. Shows total price.
- Other screens include: `shop_screen.dart`, `collections_list_screen.dart`, `collection_screen.dart`, `sale_screen.dart`, `about_screen.dart`, `account_screen.dart`, `print_shop_screen.dart`, `print_shop_about_screen.dart`

**Services**
- `lib/services/cart_service.dart` - Service using ChangeNotifier for cart state. Handles add, remove, update quantity, and clear operations. Shared across the entire app.

**Utilities**
- `lib/utils/product_loader.dart` - Loads and parses products from `assets/data/products.json`. Returns Product objects.
- `lib/utils/collection_loader.dart` - Loads and parses collections from `assets/data/collections.json`. Returns Collection objects.
- `lib/utils/validation.dart` - Email validation helper for newsletter subscription.

**Widgets**
- `lib/widgets/common/app_header.dart` - Shared header component. Responsive navigation that shows full menu on desktop and hamburger menu on mobile. Includes popup menus for Collections and Print Shop.
- `lib/widgets/common/app_footer.dart` - Shared footer with opening hours, help links, and newsletter subscription form.
- `lib/widgets/shop/product_card.dart` - Reusable product card showing image, title, price, and sale price if applicable. Navigates to product detail on tap.

**Data**
- `assets/data/products.json` - products with variants (sizes, colors), stock levels, pricing, and sale discounts.
- `assets/data/collections.json`

**Tests**

**Screenshots**
