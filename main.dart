import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda de Música',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Simulación de autenticación:
    if (password == 'password') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductScreen(username: username),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Credenciales inválidas. Intenta de nuevo.'),
        ),
      );
    }
  }

  void _navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  void _navigateToForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Iniciar Sesión'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: _navigateToRegister,
              child: Text('Registrarse'),
            ),
            TextButton(
              onPressed: _navigateToForgotPassword,
              child: Text('Olvidé mi contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Lógica para registrar un nuevo usuario.
    // Aquí puedes integrar un servicio de autenticación o base de datos.

    // Mostrar un mensaje de éxito.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Usuario registrado con éxito: $username'),
      ),
    );

    // Regresar a la pantalla de inicio de sesión.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _register,
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _usernameController = TextEditingController();

  void _resetPassword() {
    final username = _usernameController.text;

    // Lógica para recuperar la contraseña.
    // Aquí puedes integrar un servicio de correo electrónico o de autenticación.

    // Mostrar un mensaje de éxito.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Instrucciones para recuperar la contraseña enviadas a: $username'),
      ),
    );

    // Regresar a la pantalla de inicio de sesión.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Usuario o Correo Electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _resetPassword,
              child: Text('Recuperar Contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductScreen extends StatefulWidget {
  final String username;

  ProductScreen({required this.username});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Ramones - Ramones',
      'price': 20.0,
      'image': 'assets/ramones.jpg',
      'quantity': 0
    },
    {
      'name': 'The Idiot - Iggy Pop',
      'price': 22.0,
      'image': 'assets/iggy_pop.jpg',
      'quantity': 0
    },
    {
      'name': 'Closer - Joy Division',
      'price': 25.0,
      'image': 'assets/joy_division.jpg',
      'quantity': 0
    },
    {
      'name': 'Viva Hate - Morrissey',
      'price': 23.0,
      'image': 'assets/morrissey.jpg',
      'quantity': 0
    },
    {
      'name': 'Among My Swan - Mazzy Star',
      'price': 24.0,
      'image': 'assets/mazzy_star.jpg',
      'quantity': 0
    },
    {
      'name': 'Garage Inc - Metallica',
      'price': 30.0,
      'image': 'assets/metallica.jpg',
      'quantity': 0
    },
    {
      'name': 'The Color and the Shape - Foo Fighters',
      'price': 25.0,
      'image': 'assets/foo_fighters.jpg',
      'quantity': 0
    },
    {
      'name': 'Never Mind the Bollocks - Sex Pistols',
      'price': 28.0,
      'image': 'assets/sex_pistols.jpg',
      'quantity': 0
    },
    {
      'name': 'Kid A - Radiohead',
      'price': 27.0,
      'image': 'assets/radiohead_kid_a.jpg',
      'quantity': 0
    },
    {
      'name': 'Countdown to Extinction - Megadeth',
      'price': 26.0,
      'image': 'assets/megadeth.jpg',
      'quantity': 0
    },
    {
      'name': 'The Doors - The Doors',
      'price': 29.0,
      'image': 'assets/the_doors.jpg',
      'quantity': 0
    },
    {
      'name': 'The Great Southern Trendkill - Pantera',
      'price': 30.0,
      'image': 'assets/pantera.jpg',
      'quantity': 0
    },
    {
      'name': 'Deftones - Deftones',
      'price': 28.0,
      'image': 'assets/deftones.jpg',
      'quantity': 0
    },
    {
      'name': 'Around the Fur - Deftones',
      'price': 24.0,
      'image': 'assets/deftones_around_the_fur.jpg',
      'quantity': 0
    },
    {
      'name': 'Goodbye Yellow Brick Road - Elton John',
      'price': 27.0,
      'image': 'assets/elton_john.jpg',
      'quantity': 0
    },
    {
      'name': 'Blue Lines - Massive Attack',
      'price': 26.0,
      'image': 'assets/massive_attack.jpg',
      'quantity': 0
    },
    {
      'name': 'Angel Dust - Faith No More',
      'price': 28.0,
      'image': 'assets/faith_no_more.jpg',
      'quantity': 0
    },
    {
      'name': 'The Rise and Fall of Ziggy Stardust - David Bowie',
      'price': 29.0,
      'image': 'assets/david_bowie.jpg',
      'quantity': 0
    },
  ];

  double totalAmount = 0;

  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      product['quantity'] += 1;
      totalAmount += product['price'];
    });
  }

  void _removeFromCart(Map<String, dynamic> product) {
    if (product['quantity'] > 0) {
      setState(() {
        product['quantity'] -= 1;
        totalAmount -= product['price'];
      });
    }
  }

  void _showCartDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Carrito de Compras'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Total: \$${totalAmount.toStringAsFixed(2)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementar lógica de pago
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Pago realizado con éxito!'),
                  ),
                );
              },
              child: Text('Pagar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda de Música'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: _showCartDialog,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Total: \$${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    product['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        product['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('\$${product['price'].toString()}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => _removeFromCart(product),
                            icon: Icon(Icons.remove),
                          ),
                          Text(product['quantity'].toString()),
                          IconButton(
                            onPressed: () => _addToCart(product),
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
