import '../models/product.dart';

final mockProducts = [
  const Product(
    id: '1',
    nameEn: 'Solar Panel 200W',
    nameFr: 'Panneau Solaire 200W',
    descriptionEn: 'High efficiency monocrystalline solar panel.',
    descriptionFr: 'Panneau solaire monocristallin haute efficacité.',
    price: 85000,
    category: 'solar',
    imageUrl:
        'https://images.unsplash.com/photo-1509391366360-2e959784a276?w=400',
    stock: 15,
  ),
  const Product(
    id: '2',
    nameEn: 'Solar Panel 300W',
    nameFr: 'Panneau Solaire 300W',
    descriptionEn: 'Professional grade solar panel for large installations.',
    descriptionFr: 'Panneau solaire professionnel pour grandes installations.',
    price: 120000,
    category: 'solar',
    imageUrl:
        'https://images.unsplash.com/photo-1508514177221-188b1cf16e9d?w=400',
    stock: 8,
  ),
  const Product(
    id: '3',
    nameEn: 'Hybrid Inverter 3kW',
    nameFr: 'Onduleur Hybride 3kW',
    descriptionEn: 'Smart hybrid inverter with MPPT controller.',
    descriptionFr: 'Onduleur hybride intelligent avec contrôleur MPPT.',
    price: 195000,
    category: 'inverter',
    imageUrl:
        'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?w=400',
    stock: 5,
  ),
  const Product(
    id: '4',
    nameEn: 'LiFePO4 Battery 100Ah',
    nameFr: 'Batterie LiFePO4 100Ah',
    descriptionEn: 'Long life lithium battery for solar storage.',
    descriptionFr: 'Batterie lithium longue durée pour stockage solaire.',
    price: 250000,
    category: 'battery',
    imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400',
    stock: 10,
  ),
  const Product(
    id: '5',
    nameEn: 'Solar Charge Controller 40A',
    nameFr: 'Régulateur Solaire 40A',
    descriptionEn: 'MPPT solar charge controller 40A.',
    descriptionFr: 'Régulateur de charge solaire MPPT 40A.',
    price: 45000,
    category: 'controller',
    imageUrl:
        'https://images.unsplash.com/photo-1466611653911-95081537e5b7?w=400',
    stock: 20,
  ),
];
