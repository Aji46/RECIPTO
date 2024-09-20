import 'package:flutter/material.dart';

class PageMockup extends StatelessWidget {
  const PageMockup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 150.0), 
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Claim Deals',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildDealsGrid(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildProofOfTransaction(), 
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const Row(
          children: [
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Magnolia Bakery', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('3% cashback • ₹250 Welcome Bonus'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDealsGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildDealCard(
          Image.asset(
            'asset/Pay at store.png', 
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: 'Pay using my',
          subtitle: ' Balance 500',
          buttonText: 'Pay Bill',
          color: Colors.blue[50]!,
        ),
        _buildDealCard(
          Image.asset(
            'asset/Buy Coins.png', 
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: 'Buy 500',
          subtitle: ' for just ₹450',
          buttonText: 'Get for ₹450',
          color: Colors.purple[50]!,
        ),
        _buildDealCard(
          Image.asset(
            'asset/Offers.png',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: 'Shop above ₹899',
          subtitle: '& get 50',
          buttonText: '',
          color: Colors.orange[50]!,
        ),
        _buildDealCard(
          Image.asset(
            'asset/Store Cashback.png', 
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: 'Purchase at store',
          subtitle: '& get 5% back',
          buttonText: '',
          color: Colors.blue[50]!,
        ),
      ],
    );
  }

  Widget _buildDealCard(
    Image image, {
    required String title,
    required String subtitle,
    required String buttonText,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            const SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center,),
            Text(subtitle, textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
           Row(
  children: List.generate(40, (index) => 
    Expanded(
      child: Container(
        height: 1,
        color: index.isEven 
          ? const Color.fromARGB(255, 58, 58, 58) 
          : Colors.transparent, // Dash and gap effect
      ),
    ),
  ),
),
const SizedBox(height: 10,),


            
            if (buttonText.isNotEmpty)
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                child: Text(buttonText,style: const TextStyle(fontWeight: FontWeight.bold),),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProofOfTransaction() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 10,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Proof of transaction',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                   Text(
              'Scan Receipt?share payment screenshot to earn',
              style: TextStyle(fontSize:10, ),
            ),
              ],
            ),
         
          ),
        Positioned(
  top: 50,
  left: 16,
  right: 16,
  child: OutlinedButton(
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 8),
        const Text(
          'Share Payment image',
          style: TextStyle(color: Colors.blue),
        ),
        const SizedBox(width: 8), 
        Image.asset(
          'asset/UPI Image.png', 
          width: 100,
          height: 20,
          
        ),
      ],
    ),
  ),
),

          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Scan Receipt',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
