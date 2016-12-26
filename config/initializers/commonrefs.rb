CURRENCIES = { 417=>"сомы",643=>"росс.рубли",840=>"долл.США",978=>"евро" }
CURRENCY_CODES = { 417=>"KGS",643=>"RUB",840=>"USD",978=>"EUR" }
COUNTRIES = Country.all
OFFICES_DETAILS = Office.all
TRANSFER_TYPES =
{1=>[
   {
     name:"Международные системы быстрых денежных переводов",
     image_path:"international_transfers.jpg",
     description:"Международные системы быстрых денежных переводов",
     link: "/products/transfer_types/international_transfers/"
   },{
     name:"Межфилиальные переводы Салам",
     image_path:"local_transfers.png",
     description:"Межфилиальные переводы Салам",
     link: "/products/transfer_types/local_transfers/branch_transfers/"
   },{
     name:"Переводы Клиринг,Гросс",
     image_path:"local_transfers.png",
     description:"Переводы Клиринг,Гросс",
     link: "/products/transfer_types/local_transfers/cliring_gross/"
   },{
     name:"Переводы СВИФТ",
     image_path:"international_transfers.jpg",
     description:"Переводы СВИФТ",
     link: "/products/transfer_types/local_transfers/swift"
   },
 ]
 }
