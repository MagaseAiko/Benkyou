G = [
dict(
n=71,
jp="と",
rd="to",
tr="E / Com",
ex="""と é uma partícula com dois usos principais no N5.

O primeiro é ligar substantivos, com o sentido de "e". Quando se usa と, a lista é completa: são exatamente aquelas coisas, e nada mais. Isso é diferente de や, que dá apenas exemplos.

O segundo é indicar com quem uma ação é feita, com o sentido de "com". A pessoa vem antes de と. Para reforçar a ideia de "junto", pode-se acrescentar 一緒に.

Alguns verbos pedem と porque a ação precisa de duas pessoas, como casar, encontrar-se, conversar e brigar. Nesses casos, と indica a outra parte da ação.

Para comparar duas coisas em perguntas como "A ou B, qual é...?", também se usa と entre as opções.""",
st="""Substantivo A + と + Substantivo B (lista completa)
Pessoa + と + Verbo (com alguém)
Pessoa + と + 一緒に + Verbo
Pessoa + と + 結婚する / 会う / 話す / けんかする
A + と + B + と + どちらが + Adjetivo + ですか""",
no="""と só liga substantivos. Para ligar verbos e adjetivos, usa-se a forma て, e não と.

と também é usada para citar o que alguém disse ou pensou, como em と言う e と思う. Esse uso aparece bastante e tem uma função diferente.

Em listas, o último と antes da partícula é opcional e geralmente omitido.""",
bf="と",
rx="と",
tk=["と"],
va=["と"],
E=[
("パンと牛乳を買いました。", "パンとぎゅうにゅうをかいました。", "Comprei pão e leite."),
("友達と映画を見ました。", "ともだちとえいがをみました。", "Vi um filme com um amigo."),
("私の家族は父と母と弟です。", "わたしのかぞくはちちとははとおとうとです。", "Minha família é meu pai, minha mãe e meu irmão mais novo."),
("昨日、先生と話しました。", "きのう、せんせいとはなしました。", "Ontem conversei com o professor."),
("姉は去年、アメリカ人と結婚しました。", "あねはきょねん、アメリカじんとけっこんしました。", "Minha irmã mais velha se casou com um americano no ano passado."),
],
R=[
("かばんの中には財布____かぎがあります。それだけです。", "Na bolsa tem a carteira e a chave. Só isso.", ["と"]),
("昨日、母____買い物に行きました。", "Ontem fui fazer compras com a minha mãe.", ["と"]),
("日曜日、田中さん____テニスをしました。", "No domingo, joguei tênis com o Tanaka.", ["と"]),
("犬____猫と、どちらが好きですか。", "Cachorro ou gato, de qual você gosta mais?", ["と"]),
("来月、彼女____結婚します。", "Mês que vem, vou me casar com a minha namorada.", ["と"]),
],
),
dict(
n=72,
jp="〜とき",
rd="toki",
tr="Quando / Na hora em que / Na época em que",
ex="""とき significa "quando" e é usado para indicar o momento ou a época em que algo acontece. Literalmente, とき é "tempo" ou "momento".

Ele funciona como um substantivo. Por isso, a palavra que vem antes se liga a ele como se fosse descrever um substantivo: verbos e adjetivos い ficam na forma simples, adjetivos な recebem な, e substantivos recebem の.

Com verbos, o tempo do verbo antes de とき muda o sentido. Com a forma de dicionário, a ação de とき ainda não aconteceu no momento da outra ação. Com a forma た, a ação de とき já aconteceu.

Por exemplo, ao falar de uma viagem, "quando vou" pode indicar algo feito antes de partir, e "quando fui" indica algo feito já no destino.""",
st="""Verbo (forma simples) + とき
Adjetivo い + とき
Adjetivo な + な + とき
Substantivo + の + とき

Escrita: とき / 時""",
no="""O tempo do verbo antes de とき não depende do tempo da frase inteira, e sim da ordem das ações. Esse é um dos pontos que mais confundem estudantes.

とき costuma vir seguido de vírgula ou de partículas como に e は. A forma ときに destaca um momento específico.

Para dizer "quando eu era criança", usa-se 子供のとき ou 子供のころ. ころ dá uma ideia de época mais ampla.""",
bf="とき",
rx="とき|時に|時は|時、|時の",
tk=["とき"],
va=["とき", "時", "ときに", "ときは"],
E=[
("子供のとき、よく川で遊びました。", "こどものとき、よくかわであそびました。", "Quando eu era criança, brincava muito no rio."),
("暇なとき、何をしますか。", "ひまなとき、なにをしますか。", "O que você faz quando tem tempo livre?"),
("寒いとき、温かいスープを飲みます。", "さむいとき、あたたかいスープをのみます。", "Quando está frio, tomo uma sopa quente."),
("日本へ行くとき、新しいかばんを買いました。", "にほんへいくとき、あたらしいかばんをかいました。", "Quando ia viajar para o Japão, comprei uma bolsa nova."),
("日本へ行ったとき、友達におみやげを買いました。", "にほんへいったとき、ともだちにおみやげをかいました。", "Quando fui ao Japão, comprei lembrancinhas para os amigos."),
],
R=[
("学生の____、よく図書館に行きました。", "Quando eu era estudante, ia muito à biblioteca.", ["とき", "時"]),
("頭が痛い____、この薬を飲んでください。", "Quando estiver com dor de cabeça, tome este remédio.", ["とき", "時"]),
("道がわからない____、交番で聞きます。", "Quando não sei o caminho, pergunto no posto policial.", ["とき", "時"]),
("暇な____、遊びに来てください。", "Quando tiver tempo, venha me visitar.", ["とき", "時"]),
("家に帰った____、「ただいま」と言います。", "Quando chego em casa, digo \"tadaima\".", ["とき", "時"]),
],
),
dict(
n=73,
jp="とても",
rd="totemo",
tr="Muito / Bastante",
ex="""とても é um advérbio que significa "muito". Ele aumenta a intensidade de adjetivos, advérbios e alguns verbos.

Ele vem antes da palavra que intensifica. É muito comum antes de adjetivos い e な, como "muito bonito" ou "muito difícil".

とても é neutro e pode ser usado tanto em conversas educadas quanto em informais. Também funciona bem com sentimentos, como "fiquei muito feliz".

Normalmente とても é usado em frases afirmativas. Em frases negativas, para dizer "não muito", o japonês usa あまり.""",
st="""とても + Adjetivo い
とても + Adjetivo な
とても + Advérbio
とても + Verbo de sentimento ou estado""",
no="""Na fala casual, すごく e めっちゃ são muito usados no lugar de とても. すごく é comum em qualquer conversa informal, e めっちゃ é bem jovem e coloquial.

Em níveis mais avançados, とても aparece com verbos no negativo com o sentido de "de jeito nenhum consigo", mas esse uso é diferente do "muito" básico.

Repetir とても várias vezes seguidas pode soar infantil. Para variar, use たいへん em situações formais.""",
bf="とても",
rx="とても",
tk=["とても"],
va=["とても"],
E=[
("この映画はとてもおもしろいです。", "このえいがはとてもおもしろいです。", "Este filme é muito interessante."),
("今日はとても寒いですね。", "きょうはとてもさむいですね。", "Hoje está muito frio, né?"),
("彼女はとても上手に日本語を話します。", "かのじょはとてもじょうずににほんごをはなします。", "Ela fala japonês muito bem."),
("この町はとても静かです。", "このまちはとてもしずかです。", "Esta cidade é muito tranquila."),
("プレゼント、とてもうれしかったです。", "プレゼント、とてもうれしかったです。", "Fiquei muito feliz com o presente."),
],
R=[
("富士山は____高い山です。", "O Monte Fuji é uma montanha muito alta.", ["とても"]),
("このケーキは____おいしいです。", "Este bolo é muito gostoso.", ["とても"]),
("昨日のテストは____難しかったです。", "A prova de ontem foi muito difícil.", ["とても"]),
("田中さんは____親切な人です。", "O Tanaka é uma pessoa muito gentil.", ["とても"]),
("お手紙、____うれしかったです。", "Fiquei muito feliz com a sua carta.", ["とても"]),
],
),
dict(
n=74,
jp="〜つもり",
rd="tsumori",
tr="Pretender / Ter a intenção de / Planejar",
ex="""つもり é usado para falar de planos e intenções. Equivale a "pretender", "ter a intenção de" ou "planejar".

Ele vem depois do verbo na forma de dicionário, para planos de fazer algo, ou na forma ない, para planos de não fazer algo. No final, usa-se です ou だ.

つもり mostra uma decisão que a pessoa já tomou, ainda que não seja definitiva. Por isso, é mais firme que たい, que só expressa vontade.

Para negar a intenção com força, usa-se つもりはない, que significa "não tenho a menor intenção de".

Em perguntas, つもりですか pergunta sobre os planos de alguém, mas pode soar direto quando dito a superiores.""",
st="""Verbo na forma de dicionário + つもりです / つもりだ
Verbo na forma ない + つもりです (planeja não fazer)
Verbo na forma de dicionário + つもりはありません / つもりはない (sem intenção nenhuma)
Pergunta: 〜つもりですか""",
no="""A diferença entre つもり e たい é importante: たい é desejo ("queria"), つもり é plano ("pretendo"). Dá para querer algo sem ter a intenção de fazer.

Com superiores, perguntar つもりですか pode soar como cobrança. É mais natural perguntar de forma indireta, com 予定.

予定 também significa "plano", mas é usado para algo mais concreto e agendado, como uma viagem com data marcada.""",
bf="つもり",
rx="つもり",
tk=["つもり"],
va=["つもり", "つもりです", "つもりだ", "つもりはない"],
E=[
("来年、日本に留学するつもりです。", "らいねん、にほんにりゅうがくするつもりです。", "Ano que vem, pretendo fazer intercâmbio no Japão."),
("夏休みは国に帰るつもりです。", "なつやすみはくににかえるつもりです。", "Nas férias de verão, pretendo voltar para o meu país."),
("今日は甘い物を食べないつもりです。", "きょうはあまいものをたべないつもりです。", "Hoje pretendo não comer doces."),
("週末は何をするつもりですか。", "しゅうまつはなにをするつもりですか。", "O que você pretende fazer no fim de semana?"),
("彼と結婚するつもりはありません。", "かれとけっこんするつもりはありません。", "Não tenho a menor intenção de me casar com ele."),
],
R=[
("明日、図書館に行く____です。", "Amanhã, pretendo ir à biblioteca.", ["つもり"]),
("大学を卒業したら、医者になる____です。", "Depois de me formar na faculdade, pretendo ser médico.", ["つもり"]),
("今年はもうタバコを吸わない____です。", "Este ano, pretendo não fumar mais.", ["つもり"]),
("冬休みはどこへ行く____ですか。", "Aonde você pretende ir nas férias de inverno?", ["つもり"]),
("今の会社をやめる____はありません。", "Não tenho intenção nenhuma de sair da empresa atual.", ["つもり"]),
],
),
dict(
n=75,
jp="は",
rd="wa",
tr="Quanto a / Falando de / Já (contraste)",
ex="""は é a partícula que marca o tema da frase, ou seja, aquilo sobre o que se vai falar. Uma boa forma de entender é pensar em "falando de...", "quanto a...".

Depois de は, vem o comentário sobre esse tema. O tema costuma ser algo já conhecido ou que acabou de ser apresentado na conversa.

は também é usado para contraste. Quando duas coisas são comparadas, cada uma recebe は, mostrando que uma é assim e a outra é diferente.

は pode substituir が e を, ou vir depois de outras partículas, como に, で e と, formando には, では e とは. Nesses casos, ele transforma aquela parte em tema ou em ponto de contraste.

A diferença entre は e が é um dos pontos centrais do japonês: は apresenta o assunto, e が aponta exatamente quem ou o quê.""",
st="""Substantivo + は + Comentário
Substantivo + partícula + は (には / では / とは / へは)
Contraste: A + は + …、B + は + …
Objeto como tema: Substantivo + は + Verbo""",
no="""Como partícula, は é escrita com o caractere は, mas pronunciada "wa".

Em frases negativas, は aparece com frequência porque traz uma ideia de contraste: "isso, não".

Quando se apresenta algo novo, como em uma história, usa-se が na primeira vez e は nas vezes seguintes, porque a coisa já se tornou conhecida.""",
bf="は",
rx="は",
tk=["は"],
va=["は"],
E=[
("私はブラジル人です。", "わたしはブラジルじんです。", "Eu sou brasileiro."),
("今日は天気がいいですね。", "きょうはてんきがいいですね。", "Hoje o tempo está bom, né?"),
("肉は好きですが、魚は好きじゃありません。", "にくはすきですが、さかなはすきじゃありません。", "Carne eu gosto, mas peixe não."),
("東京には友達がたくさんいます。", "とうきょうにはともだちがたくさんいます。", "Em Tóquio, tenho muitos amigos."),
("この本は先週買いました。", "このほんはせんしゅうかいました。", "Este livro, eu comprei semana passada."),
],
R=[
("田中さん____先生です。", "O Tanaka é professor.", ["は"]),
("父は医者ですが、母____看護師です。", "Meu pai é médico, mas minha mãe é enfermeira.", ["は"]),
("今度の日曜日____どこへも行きません。", "No próximo domingo, não vou a lugar nenhum.", ["は"]),
("「コーヒーは飲みますか。」「いいえ、コーヒー____飲みません。」", "\"Você bebe café?\" \"Não, café eu não bebo.\"", ["は"]),
("家では英語を話しますが、学校で____日本語を話します。", "Em casa falo inglês, mas na escola falo japonês.", ["は"]),
],
),
dict(
n=76,
jp="〜は〜より〜です",
rd="wa ~ yori ~ desu",
tr="A é mais... do que B",
ex="""Essa estrutura é usada para comparar duas coisas, dizendo que uma tem mais de certa característica do que a outra. Equivale a "A é mais... do que B".

O primeiro elemento, marcado com は, é o tema: aquilo sobre o que se fala. O segundo, marcado com より, é o ponto de comparação, ou seja, o "do que".

Um detalhe importante: o japonês não precisa de uma palavra para "mais". O próprio より já indica a comparação. Basta colocar o adjetivo depois.

Para reforçar a diferença, usa-se ずっと (muito mais) ou もっと (ainda mais) antes do adjetivo.""",
st="""A + は + B + より + Adjetivo + です
A + は + B + より + Advérbio + Verbo
A + は + B + より + ずっと / もっと + Adjetivo + です""",
no="""Diferente do português, o adjetivo não muda: o mesmo adjetivo que significa "grande" serve para "maior", porque a comparação fica a cargo de より.

A ordem pode parecer estranha no começo, porque "do que B" vem antes do adjetivo. Pensar em "A, comparado a B, é grande" ajuda a acostumar.

Quando a pergunta é "qual é mais...?", a resposta natural usa ほうが, e não esta estrutura.""",
bf="より",
rx="より",
tk=["は", "より"],
va=["より"],
E=[
("東京は大阪より大きいです。", "とうきょうはおおさかよりおおきいです。", "Tóquio é maior do que Osaka."),
("今日は昨日より暖かいです。", "きょうはきのうよりあたたかいです。", "Hoje está mais quente do que ontem."),
("電車はバスより速いです。", "でんしゃはバスよりはやいです。", "O trem é mais rápido do que o ônibus."),
("兄は私よりずっと背が高いです。", "あにはわたしよりずっとせがたかいです。", "Meu irmão mais velho é muito mais alto do que eu."),
("妹は私より上手に料理を作ります。", "いもうとはわたしよりじょうずにりょうりをつくります。", "Minha irmã mais nova cozinha melhor do que eu."),
],
R=[
("夏は冬____暑いです。", "O verão é mais quente do que o inverno.", ["より"]),
("この本はあの本____おもしろいです。", "Este livro é mais interessante do que aquele.", ["より"]),
("飛行機は新幹線____速いです。", "O avião é mais rápido do que o trem-bala.", ["より"]),
("田中さんは山田さん____若いです。", "O Tanaka é mais novo do que o Yamada.", ["より"]),
("この犬はあの猫____ずっと大きいです。", "Este cachorro é muito maior do que aquele gato.", ["より"]),
],
),
dict(
n=77,
jp="〜はどうですか",
rd="wa dou desu ka",
tr="Que tal...? / Como está...? / Como é...?",
ex="""はどうですか é usado para perguntar a opinião ou a impressão de alguém sobre algo. Equivale a "como está...?", "como é...?" ou "o que você acha de...?".

どう significa "como", e a pergunta pede uma avaliação: se algo está bom, ruim, difícil, divertido.

Ela também serve para fazer sugestões e propostas, com o sentido de "que tal...?". Por exemplo, para propor um dia, um lugar ou uma opção.

Para perguntar sobre algo que já passou, usa-se はどうでしたか, como ao perguntar sobre uma viagem ou uma prova.

Para oferecer algo, como comida ou bebida, a forma mais educada é はいかがですか.""",
st="""Substantivo + は + どうですか
Substantivo + は + どうでしたか (passado)
Substantivo + は + いかがですか (mais educado)
Substantivo + は + どう？ (informal)""",
no="""いかが é a versão educada de どう. Atendentes de lojas e restaurantes usam muito いかがですか para oferecer produtos.

Ao sugerir, はどうですか é mais suave do que dizer diretamente "vamos fazer isso", porque deixa o outro decidir.

A resposta pode ser uma opinião curta, como いいですね, ou uma descrição com adjetivos.""",
bf="はどうですか",
rx="はどう|はいかが",
tk=["は", "どう", "ですか"],
va=["はどうですか", "はどうでしたか", "はいかがですか", "はどう"],
E=[
("新しい仕事はどうですか。", "あたらしいしごとはどうですか。", "Como está o novo trabalho?"),
("日本の生活はどうですか。", "にほんのせいかつはどうですか。", "Como é a vida no Japão?"),
("「明日はどうですか。」「明日は大丈夫です。」", "「あしたはどうですか。」「あしたはだいじょうぶです。」", "\"Que tal amanhã?\" \"Amanhã está bom.\""),
("旅行はどうでしたか。", "りょこうはどうでしたか。", "Como foi a viagem?"),
("コーヒーはいかがですか。", "コーヒーはいかがですか。", "Aceita um café?"),
],
R=[
("最近、体の調子____。", "Como anda a sua saúde ultimamente?", ["はどうですか"]),
("「今週の土曜日____。」「いいですよ。」", "\"Que tal este sábado?\" \"Pode ser.\"", ["はどうですか"]),
("昨日のテスト____。", "Como foi a prova de ontem?", ["はどうでしたか"]),
("お茶____。", "Aceita um chá?", ["はいかがですか", "はどうですか"]),
("この赤いシャツ____？", "Que tal esta camisa vermelha?", ["はどう", "はどうですか"]),
],
),
dict(
n=78,
jp="や",
rd="ya",
tr="E (entre outros) / Como... e...",
ex="""や é usado para listar substantivos como exemplos, deixando claro que existem outras coisas além das mencionadas. Equivale a "e" com a ideia de "entre outros".

Essa é a grande diferença em relação a と. Com と, a lista é completa. Com や, a lista é parcial: são só alguns exemplos.

や costuma aparecer junto com など no final da lista, que reforça a ideia de "e outras coisas", "etc.".

Assim como と, や liga apenas substantivos. Para listar ações como exemplos, usa-se たり〜たりする.""",
st="""Substantivo A + や + Substantivo B
Substantivo A + や + Substantivo B + など
Substantivo A + や + Substantivo B + など + partícula""",
no="""Na fala, também é comum usar とか no lugar de や, com um tom mais casual.

Quando se usa や, o ouvinte entende automaticamente que há mais coisas. Por isso, ele é ótimo para descrições gerais, como o que tem em um lugar ou o que se costuma fazer.

や liga substantivos, mas não verbos nem adjetivos.""",
bf="や",
rx="や",
tk=["や"],
va=["や"],
E=[
("かばんの中に本やノートがあります。", "かばんのなかにほんやノートがあります。", "Na bolsa tem livros, cadernos e outras coisas."),
("週末は掃除や洗濯をします。", "しゅうまつはそうじやせんたくをします。", "No fim de semana, faço coisas como limpar a casa e lavar roupa."),
("机の上にペンや鉛筆などがあります。", "つくえのうえにペンやえんぴつなどがあります。", "Em cima da mesa tem canetas, lápis e outras coisas."),
("旅行で京都や奈良に行きました。", "りょこうできょうとやならにいきました。", "Na viagem, fui a lugares como Kyoto e Nara."),
("私はりんごやみかんなど、果物が好きです。", "わたしはりんごやみかんなど、くだものがすきです。", "Eu gosto de frutas, como maçã e mexerica."),
],
R=[
("冷蔵庫に肉____野菜などがあります。", "Na geladeira tem carne, verduras e outras coisas.", ["や"]),
("公園に子供____犬などがいました。", "No parque tinha crianças, cachorros e outros.", ["や"]),
("パーティーで、すし____てんぷらなどを食べました。", "Na festa, comemos sushi, tempurá e outras coisas.", ["や"]),
("机の上に本____雑誌などが置いてあります。", "Em cima da mesa há livros, revistas e outras coisas.", ["や"]),
("夏休みに、北海道____沖縄などへ行きたいです。", "Nas férias de verão, quero ir a lugares como Hokkaido e Okinawa.", ["や"]),
],
),
dict(
n=79,
jp="よ",
rd="yo",
tr="Viu / Sabia? / Olha",
ex="""よ é uma partícula de final de frase usada para transmitir uma informação que o ouvinte provavelmente não sabe. Ela dá um tom de "viu?", "sabia?" ou "olha...".

Com よ, quem fala mostra confiança no que está dizendo e quer que o outro preste atenção. É comum ao dar avisos, recomendações, correções ou informações úteis.

A diferença entre よ e ね é a direção da informação. ね busca concordância sobre algo que os dois já sabem ou sentem. よ apresenta algo novo para o outro.

Com substantivos e adjetivos な na forma simples, usa-se だよ.""",
st="""Frase (forma educada) + よ
Frase (forma simples) + よ
Substantivo / Adjetivo な + ですよ / だよ
よね (informação + confirmação)""",
no="""Usar よ com muita força, ou o tempo todo, pode soar insistente ou mandão. Principalmente com superiores, é bom usar com moderação.

A combinação よね mostra que quem fala tem quase certeza, mas quer a confirmação do outro.

Em avisos de perigo, よ é muito natural e ajuda a chamar a atenção rapidamente.""",
bf="よ",
rx="よ",
tk=["よ"],
va=["よ", "よね"],
E=[
("この店のラーメン、おいしいですよ。", "このみせのラーメン、おいしいですよ。", "O ramen desta loja é gostoso, viu?"),
("もう八時だよ。早く起きて。", "もうはちじだよ。はやくおきて。", "Já são oito horas, viu? Levanta logo."),
("明日は休みですよ。", "あしたはやすみですよ。", "Amanhã é folga, sabia?"),
("「この席、空いていますか。」「ええ、空いていますよ。」", "「このせき、あいていますか。」「ええ、あいていますよ。」", "\"Este lugar está livre?\" \"Sim, está livre.\""),
("危ないよ！", "あぶないよ！", "Cuidado, é perigoso!"),
],
R=[
("すみません、財布が落ちました____。", "Com licença, sua carteira caiu, viu?", ["よ"]),
("その映画、おもしろかった____。", "Esse filme foi bem interessante, viu?", ["よ"]),
("早くしないと、遅れる____。", "Se você não se apressar, vai se atrasar, viu?", ["よ"]),
("「田中さんはどこですか。」「会議室にいます____。」", "\"Onde está o Tanaka?\" \"Ele está na sala de reunião.\"", ["よ"]),
("大丈夫だ____。心配しないで。", "Está tudo bem, viu? Não se preocupe.", ["よ"]),
],
),
dict(
n=80,
jp="〜より〜ほうが",
rd="yori ~ hou ga",
tr="B é mais... do que A / Prefiro B a A",
ex="""より〜ほうが é usado para comparar duas coisas e destacar qual delas tem mais de certa característica. Equivale a "B é mais... do que A".

A palavra ほう significa "lado" ou "opção". Assim, a ideia é: "comparado a A, o lado de B é mais...". A opção destacada recebe ほうが.

Essa estrutura é a resposta natural para perguntas do tipo "A ou B, qual é mais...?", feitas com どちら. Na resposta, muitas vezes a parte com より nem aparece.

Com substantivos, usa-se の antes de ほう. Com verbos, o verbo na forma de dicionário vem direto antes de ほう.

Ela também é muito usada para expressar preferências, com 好き ou いい.""",
st="""A + より + B + の + ほうが + Adjetivo
Verbo A + より + Verbo B + ほうが + Adjetivo
B + の + ほうが + Adjetivo (resposta curta)

Pergunta: A と B と どちらが + Adjetivo + ですか

Escrita: ほう / 方""",
no="""A diferença para は〜より〜です é o foco: aqui, a atenção está na opção escolhida, e não no tema da conversa.

Em perguntas com どちら, não se usa 一番, porque a comparação é entre apenas duas coisas.

A mesma palavra ほう aparece em ほうがいい, usada para conselhos. Nos dois casos, a ideia é "escolher um lado".""",
bf="ほうが",
rx="ほうが|方が",
tk=["より", "ほう", "が"],
va=["ほうが", "方が", "のほうが", "の方が"],
E=[
("バスより電車のほうが速いです。", "バスよりでんしゃのほうがはやいです。", "O trem é mais rápido do que o ônibus."),
("夏より冬のほうが好きです。", "なつよりふゆのほうがすきです。", "Gosto mais do inverno do que do verão."),
("「犬と猫とどちらが好きですか。」「猫のほうが好きです。」", "「いぬとねことどちらがすきですか。」「ねこのほうがすきです。」", "\"De qual você gosta mais, cachorro ou gato?\" \"Gosto mais de gato.\""),
("外で遊ぶより家でゲームをするほうが楽しい。", "そとであそぶよりいえでゲームをするほうがたのしい。", "Jogar videogame em casa é mais divertido do que brincar lá fora."),
("この店より、あの店の方が安いですよ。", "このみせより、あのみせのほうがやすいですよ。", "Aquela loja é mais barata do que esta."),
],
R=[
("東京より大阪の____物価が安いです。", "Em Osaka, o custo de vida é mais barato do que em Tóquio.", ["ほうが", "方が"]),
("私は肉より魚の____好きです。", "Eu gosto mais de peixe do que de carne.", ["ほうが", "方が"]),
("「コーヒーと紅茶とどちらがいいですか。」「紅茶の____いいです。」", "\"Café ou chá, qual você prefere?\" \"Prefiro chá.\"", ["ほうが", "方が"]),
("電話するより、メールを送る____早いです。", "Mandar e-mail é mais rápido do que telefonar.", ["ほうが", "方が"]),
("一人で行くより、みんなで行く____楽しいですよ。", "Ir com todo mundo é mais divertido do que ir sozinho.", ["ほうが", "方が"]),
],
),
]
