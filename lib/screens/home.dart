// ignore_for_file: unused_import

import 'package:app/screens/nft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';



class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF9FAFB), Color(0xFFF3F4F6)],
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    _buildHeader(context),
                    _buildHeroSection(context),
                    _buildHowItWorksSection(context),
                    _buildNFTBenefitsSection(context),
                    _buildPartnersSection(context),
                    _buildCTASection(context),
                    _buildFooter(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Header/Navigation
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.shield, size: 32, color: Colors.blue.shade600),
              const SizedBox(width: 8),
              const Text(
                'SafeDash',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          MediaQuery.of(context).size.width > 768
              ? Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'How It Works',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    const SizedBox(width: 24),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'NFT Benefits',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    const SizedBox(width: 24),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Partners',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                )
              : Container(),
              ElevatedButton(
                  onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    textStyle: const TextStyle(fontSize: 25),
                  ),
                  child: const Text('Log in Now'),
                ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.phone, size: 16),
            label: const Text('Emergency Help'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Hero Section
  Widget _buildHeroSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0, bottom: 96.0),
      child: Column(
        children: [
          Text(
            'Turn Dash Cam Footage into Valuable NFTs',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                  height: 1.2,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              'Upload accident footage to our secure webapp, receive tradable NFTs, and unlock exclusive discounts for car repairs & towing services in your local area.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.upload, size: 20),
                  label: const Text('Upload Footage'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.phone, size: 20),
                  label: const Text('Emergency Assistance'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue.shade600,
                    side: BorderSide(color: Colors.blue.shade600),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // How It Works Section
  Widget _buildHowItWorksSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48.0),
      child: Column(
        children: [
          Text(
            'How It Works',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 40.0),
            child: Text(
              'Our platform makes it easy to document accidents, get help, and receive valuable rewards',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 768
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFeatureCard(
                          Icons.upload,
                          'Upload Footage',
                          'Securely upload dash cam footage after an accident has occurred.',
                        ),
                        _buildFeatureCard(
                          Icons.location_on,
                          'GPS Location',
                          'Share precise location with emergency services.',
                        ),
                        _buildFeatureCard(
                          Icons.table_view,
                          'Get NFT',
                          'Receive a unique NFT tied to your accident footage.',
                        ),
                        _buildFeatureCard(
                          Icons.card_giftcard,
                          'Use or Trade',
                          'Redeem for local discounts or trade with others.',
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _buildFeatureCard(
                          Icons.upload,
                          'Upload Footage',
                          'Securely upload dash cam footage after an accident has occurred.',
                        ),
                        _buildFeatureCard(
                          Icons.location_on,
                          'GPS Location',
                          'Share precise location with emergency services.',
                        ),
                        _buildFeatureCard(
                          Icons.table_view,
                          'Get NFT',
                          'Receive a unique NFT tied to your accident footage.',
                        ),
                        _buildFeatureCard(
                          Icons.card_giftcard,
                          'Use or Trade',
                          'Redeem for local discounts or trade with others.',
                        ),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String description) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 8,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 32,
                    color: Colors.blue.shade600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // NFT Benefits Section
  Widget _buildNFTBenefitsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth > 768
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildNFTBenefitsContent(context),
                    ),
                    Expanded(
                      child: _buildNFTImage(),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildNFTImage(),
                    const SizedBox(height: 32),
                    _buildNFTBenefitsContent(context),
                  ],
                );
        },
      ),
    );
  }

  Widget _buildNFTBenefitsContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tradable NFTs with Real-World Value',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
          child: Text(
            'Your accident footage is converted into unique NFTs that provide tangible benefits:',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        _buildBenefitItem(
          'Local Discounts:',
          'Redeem for savings at repair shops and towing services in your area',
        ),
        _buildBenefitItem(
          'Price Estimates:',
          'Get accurate repair quotes for your specific vehicle',
        ),
        _buildBenefitItem(
          'Tradable Assets:',
          'Exchange with other users for different benefits',
        ),
        _buildBenefitItem(
          'Verified Records:',
          'Blockchain-backed proof of your accident for insurance claims',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
            child: const Text('Explore NFT Marketplace'),
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4, right: 12),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              size: 16,
              color: Colors.green.shade600,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
                children: [
                  TextSpan(
                    text: '$title ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNFTImage() {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'NFT Marketplace Preview',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  // Partners Section
  Widget _buildPartnersSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48.0),
      child: Column(
        children: [
          Text(
            'Local Service Partners',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 40.0),
            child: Text(
              'Redeem your NFTs for exclusive deals from our network of local service providers.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 768
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPartnerCard(
                          'Towing Services',
                          'Up to 30% off towing services with your SafeDash NFT.',
                        ),
                        _buildPartnerCard(
                          'Repair Shops',
                          'Exclusive discounts and priority service at certified mechanics.',
                        ),
                        _buildPartnerCard(
                          'Vehicle Appraisers',
                          'Get accurate damage estimates and repair quotes for your vehicle.',
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _buildPartnerCard(
                          'Towing Services',
                          'Up to 30% off towing services with your SafeDash NFT.',
                        ),
                        _buildPartnerCard(
                          'Repair Shops',
                          'Exclusive discounts and priority service at certified mechanics.',
                        ),
                        _buildPartnerCard(
                          'Vehicle Appraisers',
                          'Get accurate damage estimates and repair quotes for your vehicle.',
                        ),
                      ],
                    );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue.shade600,
                side: BorderSide(color: Colors.blue.shade600),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text('View All Local Partners'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartnerCard(String title, String description) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 8,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 64,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Center(
                    child: Container(
                      width: 120,
                      height: 64,
                      color: Colors.grey.shade300,
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // CTA Section
  Widget _buildCTASection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 48.0),
      padding: const EdgeInsets.all(40.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade600,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            'Start Using SafeDash Today',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Our web application works on any device. No downloads required - just sign up and start protecting yourself while earning valuable NFTs.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue.shade100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade600,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Sign Up Now'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.phone, size: 20),
                  label: const Text('Contact Support'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Footer
  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 32.0),
          child: Divider(color: Colors.grey.shade300),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 768) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildFooterBrand()),
                  Expanded(child: _buildFooterLinks('Quick Links', [
                    'Home',
                    'How It Works',
                    'NFT Benefits',
                    'Local Partners'
                  ])),
                  Expanded(child: _buildFooterLinks('Legal', [
                    'Privacy Policy',
                    'Terms of Service',
                    'NFT Ownership'
                  ])),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Contact',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'support@safedash.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Emergency: 1-800-SAFE-DASH',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  _buildFooterBrand(),
                  const SizedBox(height: 32),
                  _buildFooterLinks('Quick Links', [
                    'Home',
                    'How It Works',
                    'NFT Benefits',
                    'Local Partners'
                  ]),
                  const SizedBox(height: 32),
                  _buildFooterLinks('Legal', [
                    'Privacy Policy',
                    'Terms of Service',
                    'NFT Ownership'
                  ]),
                  const SizedBox(height: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'support@safedash.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Emergency: 1-800-SAFE-DASH',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Divider(color: Colors.grey.shade300),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  '© ${DateTime.now().year} SafeDash. All rights reserved.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooterBrand() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shield, size: 24, color: Colors.blue.shade600),
            const SizedBox(width: 8),
            const Text(
              'SafeDash',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Converting accident footage into valuable NFTs with real-world benefits.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildFooterLinks(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  link,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}