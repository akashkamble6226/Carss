import '../models/comapany_data_model.dart';


const companies = const [
  CompanyInfo(
    companyName: "Lamborghini",
    companyLogo:"assets/images/lambo1.png" ,
    companyHeadquart: "Itely",
    founderName: "Ferruccio Lamborghini",
    nearbyStore: "https://www.google.com/maps?q=lamborghini&rlz=1C1CHBD_enIN944IN944&um=1&ie=UTF-8&sa=X&ved=2ahUKEwiKyf6176LwAhXDbCsKHS43Bp8Q_AUoAHoECAEQCg",
    details: "Automobili Lamborghini S.p.A. (Italian pronunciation: [lamborˈɡiːni]) is an Italian brand and manufacturer of luxury sports cars and SUVs based in Sant'Agata Bolognese. The company is owned by the Volkswagen Group through its subsidiary Audi. Ferruccio Lamborghini, an Italian manufacturing magnate. ",
    
    modelImage: 'assets/images/lambModels2.png',

  ),

  CompanyInfo(
    companyName: "Ferrari S.p.A.",
    companyLogo:"assets/images/ferari1.png",
    companyHeadquart: "Itely",
    founderName: "Enzo Ferrari",
    nearbyStore: "https://www.google.com/maps?q=ferrari+near+me&rlz=1C1CHBD_enIN944IN944&biw=1366&bih=657&sxsrf=ALeKk00VhV-B7yzbrBcEmkTwqxmN3G7xdw:1619616261825&gs_lcp=Cgdnd3Mtd2l6EAMYADIFCAAQyQMyBQgAEJIDMgUIABCSAzIGCAAQFhAeMgYIABAWEB4yBggAEBYQHjIGCAAQFhAeMgYIABAWEB4yBggAEBYQHjIGCAAQFhAeOgcIIxCwAxAnOgcIABBHELADOgcIABCxAxBDOgUIABCRAjoHCAAQhwIQFDoCCAA6CAguEMcBEK8BOggIABAWEAoQHlDkyBNY_NETYKHfE2gBcAJ4AIABgQOIAcANkgEFMi0zLjOYAQCgAQGqAQdnd3Mtd2l6yAEJwAEB&um=1&ie=UTF-8&sa=X&ved=2ahUKEwj9q7mqhqHwAhVq7XMBHY_9B4sQ_AUoAnoECAIQBA",
    details: "Ferrari S.p.A. (/fəˈrɑːri/; Italian: [ferˈraːri]) is an Italian luxury sports car manufacturer based in Maranello, Italy. Founded by Enzo Ferrari in 1939 out of the Alfa Romeo race division as Auto Avio Costruzioni, the company built its first car in 1940, and produced its first Ferrari-badged car in 1947.",
    modelImage: 'assets/images/ferModels2.png',
  ),

    CompanyInfo(
    companyName: "Porsche",
    companyLogo:"assets/images/porche1.png",
    companyHeadquart: "Germany",
    founderName: "Ferdinand Porsche",
    nearbyStore: "https://www.google.com/maps/search/Porsche/@18.097108,74.5445987,12z/data=!3m1!4b1",
    details: "Dr.-Ing. h.c. F. Porsche AG, usually shortened to Porsche AG (German pronunciation: [ˈpɔɐ̯ʃə] (About this soundlisten); see below), is a German automobile manufacturer specializing in high-performance sports cars, SUVs and sedans. ",
    modelImage: 'assets/images/porModels2.png',
  ),

  // CompanyInfo(
  //   companyName: "Bugatti",
  //   companyLogo:"assets/images/bugati.png",
  //   companyHeadquart: "French",
  //   founderName: "Ettore Bugatti",
  //   nearbyStore: "https://www.google.com/maps/search/Bugatti/@38.9723407,66.7158118,3z/data=!3m1!4b1",
  //   details: "Automobiles Ettore Bugatti was a French car manufacturer of high-performance automobiles, founded in 1909 in the then-German city of Molsheim, Alsace by the Italian-born industrial designer Ettore Bugatti. The cars were known for their design beauty and for their many race victories. Famous Bugattis include the Type 35 Grand Prix cars, the Type 41 Royale, the Type 57 Atlantic and the Type 55 sports car.",
  //   modelNameAndBackColor:{'Centodieci': "#DA0914", 'DIVO': "#FCDE03", 'LA VOITURE': "#630356"},
  // ),

  // CompanyInfo(
  //   companyName: "Jaguar",
  //   companyLogo:"assets/images/jagvar.png",
  //   companyHeadquart: "UK",
  //   founderName: "William Lyons",
  //   nearbyStore: "https://www.google.com/maps?rlz=1C1CHBD_enIN944IN944&sxsrf=ALeKk03ERsQMcAoOqgfqLjzgM-ddqBE5SQ:1619616980871&q=Jaguar+Cars&stick=H4sIAAAAAAAAAONgFuLQz9U3MMktyVHiBLEMjSqMTbT4nPNzc_PzgjNTUssTK4sXsXJ7JaaXJhYpOCcWFe9gZZzAxggAlFtjADsAAAA&biw=1366&bih=600&um=1&ie=UTF-8&sa=X&ved=2ahUKEwjB7eKgiKHwAhXD73MBHeeoBw4Q_AUoBHoECAEQBg",
  //   details: "The jaguar (Panthera onca) is a large felid species and the only living member of the genus Panthera native to the Americas. Its distinctively marked coat features pale yellow to tan colored fur covered by spots that transition to darker rosettes on the sides. With a body length of up to 1.85 m (6 ft 1 in), it is the largest cat species in the Americas and the third largest in the world.",
  //   modelNameAndBackColor:{'F-TYPE': "#DA0914", 'XF': "#FCDE03", 'XE': "#630356"},
  // ),

  //  CompanyInfo(
  //   companyName: "BMW",
  //   companyLogo:"assets/images/bmw1.png",
  //   companyHeadquart: "Germany",
  //   founderName: " Karl Rapp",
  //   nearbyStore: "https://www.google.com/maps?rlz=1C1CHBD_enIN944IN944&sxsrf=ALeKk01MnNExYj-h_SvHiqQtS0tb2A5NDQ:1619617203674&q=BMW&stick=H4sIAAAAAAAAAONgFuLQz9U3MMktyVECswzNKzO0-Jzzc3Pz84IzU1LLEyuLF7EyO_mG72BlnMDGCACgNMGLMgAAAA&biw=1366&bih=600&um=1&ie=UTF-8&sa=X&ved=2ahUKEwj18f6FiaHwAhXE8HMBHSq6AnoQ_AUoBHoECAEQBg",
  //   details: "Bayerische Motoren Werke AG, commonly referred to as BMW (German pronunciation: [ˈbeːˈʔɛmˈveː] (About this soundlisten)), is a German multinational corporation which produces luxury vehicles and motorcycles. The company was founded in 1916 as a manufacturer of aircraft engines, which it produced from 1917 until 1918 and again from 1933 to 1945.",
  //   modelNameAndBackColor:{'3 Series': "#DA0914", 'X5': "#FCDE03", 'X6': "#630356"},

  // ),

  //  CompanyInfo(
  //   companyName: "Audi",
  //   companyLogo:"assets/images/audi.png",
  //   companyHeadquart: "Germany",
  //   founderName: "August Horch",
  //   nearbyStore: "https://www.google.com/maps?rlz=1C1CHBD_enIN944IN944&sxsrf=ALeKk006Cv8qSOeVI89TgC_HZp8fGfiHlA:1619617415945&q=Audi&stick=H4sIAAAAAAAAAONgFuLQz9U3MMktyVFiB7GyTQ20-Jzzc3Pz84IzU1LLEyuLF7GyOJamZO5gZZzAxggA4g1q_TIAAAA&biw=1366&bih=600&um=1&ie=UTF-8&sa=X&ved=2ahUKEwjwvOjoiaHwAhVL63MBHUtCDm8Q_AUoA3oECAEQBQ",
  //   details: "Audi AG (German: [ˈaʊ̯di ʔaːˈɡeː] (About this soundlisten)) is a German automobile manufacturer that designs, engineers, produces, markets and distributes luxury vehicles. Audi is a wholly owned subsidiary of the Volkswagen Group and has its roots at Ingolstadt, Bavaria, Germany. Audi-branded vehicles are produced in nine production facilities worldwide.",
  //   modelNameAndBackColor:{'A6': "#DA0914", 'Q8': "#FCDE03", 'RS Q8': "#630356"},
  // ),




];
