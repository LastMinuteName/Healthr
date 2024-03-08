import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrandSearchPage extends StatefulWidget {

  @override
  State<BrandSearchPage> createState() => _BrandSearchPageState();
}

class _BrandSearchPageState extends State<BrandSearchPage>{
  List<String> brandsList = ["a2","AB's","Aerogard","Aeroplane","AFL","AFS","Air Wick","Akta-Vite","Allens","Almond Breeze","Altimate","Anchor","Angas Park","Anticol","Ardmona","Arkadia","Arnotts","Artwrap","Ascool","Aspro","Aunt Betty's","Aussie Bodies","Aussie Drops","Aussiemite","Australian Made","Avalanche","Ayam","Baby Mum Mum","Bailey's","Balnea","Balter","Banana Boat","Barista Bros","Barkers","Be Natural","Beacon","Beechworth","Beerenberg","Bega","Belvoir","BentSpoke","Berocca","Berri","Best Foods","Betadine","Bhuja","Bickfords","Big Lolly","Big W","Billy Tea","Biosota Organics","Blackmores","Blue M","Bluey","Body Science","Bonox","Bonsoy","Boom Up Souvenirs","Bosistos","Bovril","Bramwells","Brut","BSC","Buderim","Bundaberg","Bunnings","Burger Rings","Burgerman","Bushells","Bushman","Bushmans","Byron Bay Chilli Co.","Byron Bay Cookies","Byron Bay Peanut Butter Company","Cadbury","Campbells","Campos","Cancer Council","Candle Bark","Capilano","Care Packages","Carefree","Carlton","Carmans","CC's","Celebrate Health","Changs","Cheetos","Cheezels","Chicken Tonight","Chocolatier","Chris Dips","Chunky Funkeez","Chupa Chups","Chux","Clive of India","Cobs","Coca-Cola","Cocobella","Codral","Coles","Colgate","Continental","Cooks","Coopers","Copha","Cornwells","Cosmic","Cottage Candy","Cottees","Cottons","CSR","CTC","Cussons","Dairylea","Darrell Lea","Deep Heat","Design Group","Dettol","Devondale","Diet Rite","Dilmah","Disprin","Dollar Sweets","Doritos","Double D","Dunkaroos","Earth Choice","Edgell","Ego","Emu Logic","Emu Spirit","Eskal","ETA","Europe","F. Whitlock & Sons","Fabulon","Fads","Fanta","Fantastic","Farmers Co","Ferrero Rocher","Fisiocrem","Foster Clarks","Fountain","Fray Bentos","Freedom Foods","French Fries","Fyna","G & M","G & M Australian","Gaviscon","Gaytime","Glucojel","Golden","Golden Circle","Golden Days","Goodnessme","Grain Waves","Gravox","Greens","Gumption","Hamper","Haribo","Hart & Soul","Health Lab","Health Rite","Healtheries","Heinz","Help@hand","Heritage Mill","Holbrooks","HP","Hubba Bubba","Huggies","Hugo's Confectionery","Hydralyte","I Love Aus","Imperial Leather","In A Biskit","Indo Mie","Infuzions","International Roast","Irrewarra","IS Gifts","It Girl Magazine","James Boag's","James Squire","Jarrah","Jelly Belly","Jj","John West","Johnsons","Jumpy's","Kaiju","Kan Tong","Keens","Kelloggs","Kettle","Kez's Kitchen","Kinder","Kinnerton","Kirks","Kleenex","Kookas","Kotex","Kraft","Krummies","L&P","La Costena","La La Land","La Zuppa","Lakanto","Lambertz","Lazzio","Leatherwood","Lee Kum Kee","Leggos","Lemsip","LeTan","Libra","Liddells","Life Savers","Lift","Lillies","Lillies of the Field","Lindt","Lingo","Lions Club","Lipton","Lo-fo","Loacker","Lolly Go Round","Loma Linda","Lotus","Loving Earth","Lucas","Macleans","Macro","Madura","Maggi","Maggie Beer","Mamee","Marions","Mars","Marvels","Massel","Masterfoods","Matthew Walker","Mayvers","McKenzies","McVitie's","Menz","Messy Monkeys","Milk Lab","Mission","Mitani","Mitch Dowd","Moccona","Monetta","Monster","Morning Sun","Moro","Mother","Mountain Bread","Mountain Dew","Mr Kipling","Mum","Murray River Gormet","Nando's","Napisan","Natio","Nature Nate's","Nature's Own","Nature's Way","Natvia","Negrita","Nerada","Nerds","Nescafe","Nesquik","Nestle","Nexba","Nice & Natural","Nice N' Tasty","Niulife","Nivea","Nobbys","Nomo","Norsca","Noshu","NRL","Nurofen","Nutella","Nuttvia","Ocean Spray","Old El Paso","Olinas","Only Organic","Orgran","OsteVit-D","Our Mate","Ovaltine","Oxo","Ozesauce","Palmolive","Pana Organic","Panadol","Paradise","Pascall","Paul Newmans Own","Peckish","Pecks","Pepsi","Pink Lady","Plantitude","Poppin","Praise","Pringles","Promite","Queen","Quick-Eze","Radox","Real Foods","Red Bull","Red Rock Deli","Red Seal","Red Tractor","Red Tulip","Redwin","Reef","Rexona","Ribena","Ridiculously Delicious","Ritz","Riviera","Robert Timms","Robertsons","Rosella","Rowntrees","Sakata","Salvital","Samboy","San Churros","San Remo","Sanitarium","Sard","Savlon","Saxa","Schweppes","Sharwoods","Shine","Sirena","Skittles","SM-33","Smiths","Snack Brands Australia","Souvenir Australia","Spam","SPC","Spring Gully","Starburst","Stargifts","Steradent","Sticker and Craft World","Stone & Wood","Strepsils","Sugarine","Suimin","Sukin","Sunbeam","Sunkist","Sunny Days","Sunrice","Sunshine","Sustagen","Sweet William","Sweetmans","Sweetworld","Swisse","T2","Tabasco","Talyala","Tandaco","Tasti","Taylors Of Harrogate","Terry's","Tetley","Thankyou","The Bar Counter","The Natural Chip Co.","The Natural Confectionery Co.","The Paw Grocer","The Three Threes","Thins","Thursday Plantation","Tip Top","Toblerone","Tom & Luke","Tom Organic","Tom Piper","Tooheys","Topps","Trident","Trolli","Tru Blu","Tunnocks","Twinings","Twisties","Tyrells","Tyrrells","Uncle Tobys","Unibic","V Energy Drink","Valcom","Vege Chips","Vegemite","Vegeta","Vegie Delights","Vicks","Victoria Bitter","Violet Crumble","Vitaustralia","Walkers","Waradaa","Warheads","Waterfords","Wattie's","Well Naturally","Werthers","Wet Stuff","White Wings","Whittakers","Wild Hibiscus","Wild's","Winn","Wizz Fizz","Woolworths","Wow","Wrigleys","X-Treme","XXXX","Yackandandah","Yeos","Young Henrys","z All other brands","Zappo","Zooper Dooper"];
  late List<String> searchResult;
  TextEditingController _searchBarController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  int listIndex = 40;

  void initState() {
    searchResult = brandsList;

    /*Simulate lazy loading to prevent initial large render of listTiles, create additional listTiles
    as you go*/
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (!isTop) {
          if (searchResult.length >= listIndex + 20) {
            setState(() {
              listIndex = listIndex + 20;
            });
          }
          else {
            setState(() {
              listIndex = listIndex + (searchResult.length - listIndex);
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: pageAppBar(context),
      child: SafeArea(
        child: body(context),
      ),
    );
  }

  CupertinoNavigationBar pageAppBar(BuildContext context) {
    return CupertinoNavigationBar(
      automaticallyImplyLeading: false,
      middle: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SizedBox(
          height: 37,
          width: 325,
          child: CupertinoSearchTextField(
            controller: _searchBarController,
            placeholder: AppLocalizations.of(context)!.searchFieldText,
            onChanged:(String value) {
              RegExp exp = RegExp(value, caseSensitive: false);
              List<String> matches = [];
              for (String brand in brandsList) {
                if (exp.hasMatch(brand)) matches.add(brand);
              }

              setState(() {
                searchResult = matches;
                searchResult.length > 40 ? listIndex = 40 : listIndex = searchResult.length;
              });
            },
          ),
        ),
      ),
      trailing: CupertinoButton(
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/product_details'));
        },
        padding: const EdgeInsets.all(0),
        child: Text(AppLocalizations.of(context)!.cancelButtonText),
      ),
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      controller: _scrollController,
      child: CupertinoListSection(
        header: Text("Test"),
        children: () {
          List<Widget> listTiles = [];

          for(var i = 0; i < listIndex; i++) {
            var listTile = CupertinoListTile(
              title: Text(searchResult[i]),
              onTap: () {

              },
            );

            listTiles.add(listTile);
          }

          return listTiles;
        }()
      ),
    );
  }
}

