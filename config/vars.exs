use Mix.Config

config :indeals,
  admin_email: System.get_env("APP_ADMIN_EMAIL"),
  locations: %{
    "adana" => "Adana",
    "ankara" => "Ankara",
    "bursa" => "Bursa",
    "Diyarbakır" => "Diyarbakır",
    "mersin" => "Mersin",
    "istanbul" => "İstanbul",
    "izmir" => "İzmir",
    "kayseri" => "Kayseri",
    "kocaeli" => "Kocaeli",
    "konya" => "Konya",
    "sakarya" => "Sakarya"
  },
  salary_ranges: [
    "Not Available",
    "10,000",
    "20,000",
    "30,000",
    "40,000",
    "50,000",
    "60,000",
    "70,000",
    "80,000",
    "90,000",
    "100,000",
    "150,000+"
  ]