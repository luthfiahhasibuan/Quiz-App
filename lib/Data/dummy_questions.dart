import '../models/questions.dart';

const List<Question> dummyQuestions = [
  Question(
    text: 'Kapan Proklamasi Kemerdekaan Indonesia dibacakan?',
    options: [
      '1 Juni 1945',
      '18 Agustus 1945',
      '17 Agustus 1945',
      '10 November 1945',
    ],
    correctIndex: 2,
    category: QuizCategory.sejarah,
    explanation: 'Soekarno membacakan teks Proklamasi didampingi Mohammad Hatta di Jakarta.',
  ),

  Question(
    text: 'Apa bunyi sila keempat Pancasila?',
    options: [
      'Persatuan Indonesia',
      'Kerakyatan yang dipimpin oleh hikmat kebijaksanaan dalam permusyawaratan/perwakilan',
      'Keadilan sosial bagi seluruh rakyat Indonesia',
      'Kemanusiaan yang adil dan beradab',
    ],
    correctIndex: 1,
    category: QuizCategory.pancasila,
    explanation: 'Medan adalah ibu kota Sumatera Utara dan kota terbesar di Pulau Sumatera.',
  ),

  Question(
    text: 'Apa lambang sila pertama Pancasila?',
    options: ['Pohon beringin', 'Rantai', 'Bintang', 'Kepala banteng'],
    correctIndex: 2,
    category: QuizCategory.pancasila,
    explanation: 'Bintang merupakan lambang sila pertama Pancasila, yaitu Ketuhanan Yang Maha Esa.',
  ),

  Question(
    text: 'Sila kedua Pancasila berbunyi apa?',
    options: [
      'Kemanusiaan yang adil dan beradab',
      'Persatuan Indonesia',
      'Keadilan sosial bagi seluruh rakyat Indonesia',
      'Ketuhanan Yang Maha Esa',
    ],
    correctIndex: 0,
    category: QuizCategory.pancasila,
    explanation:
        'Sila kedua Pancasila berbunyi Kemanusiaan yang adil dan beradab.',
  ),

  Question(
    text: 'Apa lambang sila ketiga Pancasila?',
    options: ['Padi dan kapas', 'Pohon beringin', 'Bintang', 'Rantai'],
    correctIndex: 1,
    category: QuizCategory.pancasila,
    explanation: 'Pohon beringin merupakan lambang sila ketiga Pancasila, yaitu Persatuan Indonesia.',
  ),

  Question(
    text: 'Sikap manakah yang mencerminkan sila keempat Pancasila?',
    options: [
      'Memaksakan pendapat kepada orang lain',
      'Mengutamakan kepentingan pribadi',
      'Menolak pendapat yang berbeda',
      'Mengutamakan musyawarah untuk mencapai mufakat',
    ],
    correctIndex: 3,
    category: QuizCategory.pancasila,
    explanation: 'Musyawarah untuk mencapai mufakat mencerminkan nilai kerakyatan dan permusyawaratan dalam sila keempat Pancasila.',
  ),

  Question(
    text: 'Apa tiga fungsi utama DPR menurut UUD NRI Tahun 1945?',
    options: [
      'Legislasi, anggaran, dan pengawasan',
      'Peradilan, diplomasi, dan pertahanan',
      'Moneter, yudisial, dan eksekutif',
      'Audit, penuntutan, dan penyidikan',
    ],
    correctIndex: 0,
    category: QuizCategory.lembaga,
    explanation: 'DPR menjalankan fungsi legislasi, anggaran, dan pengawasan dalam sistem ketatanegaraan Indonesia.',
  ),

  Question(
    text: 'Berapa syarat usia minimal seseorang untuk dapat menggunakan hak pilih dalam Pemilu di Indonesia?',
    options: [
      '15 tahun',
      'Berusia minimal 17 tahun atau sudah/pernah menikah',
      '18 tahun tanpa syarat lain',
      '20 tahun',
    ],
    correctIndex: 1,
    category: QuizCategory.pemilu,
    explanation: 'DPR menjalankan fungsi legislasi, anggaran, dan pengawasan dalam sistem ketatanegaraan Indonesia.',
  ),
];
