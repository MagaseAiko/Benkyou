G = [
dict(
n=81,
jp="〜そうだ（様態）",
rd="sou da (youtai)",
tr="Parece que vai / Parece / Tem cara de",
ex="""Nesse uso, そうだ expressa uma impressão baseada no que se vê. Equivale a "parece que vai..." ou "parece...".

Com verbos, indica que algo está prestes a acontecer, segundo a aparência da situação. Por exemplo, ver nuvens escuras e dizer que parece que vai chover.

Com adjetivos, indica a impressão visual de uma qualidade antes de confirmá-la. Por exemplo, olhar um bolo e dizer que parece gostoso, mesmo sem ter provado.

A formação é diferente da そうだ de hearsay. Com verbos, usa-se a forma ます sem ます. Com adjetivos い, tira-se o い. Com adjetivos な, basta tirar o な.

Esse uso não é empregado com coisas que já se veem claramente, como dizer que algo bonito "parece bonito" quando é óbvio. Ele é para impressões e previsões.""",
st="""Verbo na forma ます sem ます + そうだ
Adjetivo い sem い + そうだ
Adjetivo な (sem な) + そうだ

Exceções: いい → よさそう / ない → なさそう
Negativo de verbo: Verbo sem ます + そうにない / そうもない
Educado: そうです""",
no="""Com substantivos, essa そうだ não é usada. Para dizer "parece ser estudante", usa-se みたいだ, ようだ ou らしい.

Com adjetivos de aparência óbvia, como きれい e かわいい, そうだ costuma ser evitado quando a qualidade já é evidente.

A forma そうにない indica que algo provavelmente não vai acontecer, como um trabalho que não parece que vai terminar.""",
bf="そうだ",
rx="そうだ|そうです|そうにない|そうもない",
tk=["そう", "だ"],
va=["そうだ", "そうです", "そうにない", "そうもない"],
E=[
("空が暗い。今にも雨が降りそうだ。", "そらがくらい。いまにもあめがふりそうだ。", "O céu está escuro. Parece que vai chover a qualquer momento."),
("このケーキはおいしそうですね。", "このケーキはおいしそうですね。", "Este bolo parece gostoso, hein."),
("彼は元気そうです。", "かれはげんきそうです。", "Ele parece estar bem."),
("危ない、棚から本が落ちそうです。", "あぶない、たなからほんがおちそうです。", "Cuidado, parece que o livro vai cair da prateleira."),
("この仕事は今日中に終わりそうにない。", "このしごとはきょうじゅうにおわりそうにない。", "Este trabalho não parece que vai terminar hoje."),
],
R=[
("空が暗い。雨が降り____。", "O céu está escuro. Parece que vai chover.", ["そうだ", "そうです"]),
("田中さん、今日は忙し____ですね。", "O Tanaka parece ocupado hoje, né?", ["そう"]),
("このかばんは丈夫____です。", "Esta bolsa parece resistente.", ["そう"]),
("危ない！あの子が転び____。", "Cuidado! Parece que aquela criança vai cair.", ["そうだ", "そうです"]),
("このラーメン、本当においし____。", "Este ramen parece muito gostoso.", ["そうだ", "そうです"]),
],
),
dict(
n=82,
jp="〜そうに・〜そうな",
rd="sou ni / sou na",
tr="Parecendo / Com cara de / Que parece",
ex="""そうに e そうな são formas da そうだ de aparência usadas para modificar outras palavras.

そうな vem antes de um substantivo e descreve como a coisa ou a pessoa parece. Equivale a "que parece..." ou "com cara de...". Por exemplo, "uma maçã que parece gostosa" ou "um rosto com cara de sono".

そうに vem antes de um verbo e descreve o modo como alguém faz algo, segundo a aparência. Equivale a "parecendo..." ou "com cara de...". Por exemplo, "as crianças brincam parecendo se divertir".

Isso acontece porque そう funciona como um adjetivo な: recebe な antes de substantivos e に antes de verbos.

A formação é a mesma de そうだ de aparência: verbos sem ます, adjetivos い sem い e adjetivos な sem な.""",
st="""Verbo sem ます / Adjetivo い sem い / Adjetivo な + そうな + Substantivo
Verbo sem ます / Adjetivo い sem い / Adjetivo な + そうに + Verbo

Exceções: いい → よさそうな / よさそうに; ない → なさそうな / なさそうに""",
no="""そうに é muito usado para descrever emoções de outras pessoas a partir da aparência, como alegria, tristeza e sono, já que em japonês não se afirma diretamente o sentimento dos outros.

A expressão 気持ちよさそうに, "parecendo estar confortável", é comum para descrever animais e pessoas relaxando.

Com verbos, そうな descreve algo prestes a acontecer, como "um céu que parece que vai chover".""",
bf="そうな",
rx="そうに|そうな",
tk=["そう", "に", "な"],
va=["そうに", "そうな"],
E=[
("子供たちが楽しそうに遊んでいます。", "こどもたちがたのしそうにあそんでいます。", "As crianças estão brincando, parecendo se divertir muito."),
("おいしそうなりんごですね。", "おいしそうなりんごですね。", "Que maçã com cara de gostosa!"),
("彼は眠そうな顔をしている。", "かれはねむそうなかおをしている。", "Ele está com cara de sono."),
("彼女はうれしそうに笑った。", "かのじょはうれしそうにわらった。", "Ela sorriu com cara de felicidade."),
("今日は雨が降りそうな空だ。", "きょうはあめがふりそうなそらだ。", "Hoje o céu está com cara de chuva."),
],
R=[
("彼は寂し____顔をしていた。", "Ele estava com uma cara triste.", ["そうな"]),
("猫が気持ちよさ____寝ている。", "O gato está dormindo, parecendo muito confortável.", ["そうに"]),
("それは高____時計ですね。", "Esse relógio parece caro, hein.", ["そうな"]),
("子供がおいし____ご飯を食べている。", "A criança está comendo com cara de quem está adorando.", ["そうに"]),
("彼女は今にも泣き出し____声で話した。", "Ela falou com uma voz de quem ia começar a chorar a qualquer momento.", ["そうな"]),
],
),
dict(
n=83,
jp="〜たばかり",
rd="ta bakari",
tr="Acabar de / Ter acabado de",
ex="""たばかり é usado para dizer que algo aconteceu há pouco tempo. Equivale a "acabar de" ou "ter acabado de".

Ele é formado pelo verbo na forma た + ばかり. A ideia é que a ação está ainda "fresca" na percepção de quem fala.

O ponto importante é que esse "pouco tempo" é subjetivo. Pode ser alguns minutos, alguns dias ou até alguns meses, dependendo de como a pessoa sente. Por exemplo, alguém pode dizer que acabou de chegar ao Japão mesmo já estando lá há um mês.

ばかり funciona como substantivo, então pode ser seguido de です, なので, なのに e の + substantivo.""",
st="""Verbo na forma た + ばかり + です / だ
Verbo na forma た + ばかり + なので / なのに
Verbo na forma た + ばかり + の + Substantivo""",
no="""A diferença para たところ é a precisão: たところ indica que algo acabou de acontecer neste exato momento; たばかり pode cobrir um período maior, de acordo com a sensação de quem fala.

A combinação たばかりなのに mostra surpresa ou frustração, como "acabei de comprar e já quebrou".

Não confunda com ばかり de "só / nada além de", que vem depois de substantivos.""",
bf="たばかり",
rx="たばかり|だばかり",
tk=["た", "ばかり"],
va=["たばかり", "だばかり"],
E=[
("先月、日本に来たばかりです。", "せんげつ、にほんにきたばかりです。", "Acabei de chegar ao Japão no mês passado."),
("さっき起きたばかりなので、まだ眠い。", "さっきおきたばかりなので、まだねむい。", "Acabei de acordar, então ainda estou com sono."),
("買ったばかりの傘をなくしてしまった。", "かったばかりのかさをなくしてしまった。", "Perdi o guarda-chuva que tinha acabado de comprar."),
("この本は昨日読んだばかりです。", "このほんはきのうよんだばかりです。", "Acabei de ler este livro ontem."),
("結婚したばかりの二人は、とても幸せそうだ。", "けっこんしたばかりのふたりは、とてもしあわせそうだ。", "Os dois, que acabaram de se casar, parecem muito felizes."),
],
R=[
("昼ご飯を食べ____なのに、もうお腹がすいた。", "Acabei de almoçar e já estou com fome.", ["たばかり"]),
("先週、この会社に入っ____です。", "Acabei de entrar nesta empresa na semana passada.", ["たばかり"]),
("習っ____の漢字をもう忘れた。", "Já esqueci os kanji que acabei de aprender.", ["たばかり"]),
("この本は先月出____です。", "Este livro acabou de ser lançado no mês passado.", ["たばかり"]),
("薬を飲ん____だから、少し休んでください。", "Você acabou de tomar o remédio, então descanse um pouco.", ["だばかり"]),
],
),
dict(
n=84,
jp="〜たところ",
rd="ta tokoro",
tr="Acabar de (neste exato momento)",
ex="""たところ é usado para dizer que uma ação acabou de terminar, neste exato momento. Equivale a "acabei de" ou "agora mesmo terminei".

Ele é formado pelo verbo na forma た + ところ. ところ significa "ponto" ou "momento", então a ideia é "estou no ponto logo depois de ter feito isso".

Ele é muito usado para responder perguntas sobre o andamento de algo, como "já comeu?" ou "já chegou?", indicando que a ação foi concluída agorinha.

É comum aparecer com palavras como 今, ちょうど e たった今, que reforçam a ideia de algo recentíssimo.

A diferença em relação a たばかり é o tempo. たところ fala do momento imediatamente após a ação. たばかり pode cobrir um período maior, conforme a sensação de quem fala.""",
st="""Verbo na forma た + ところ + です / だ
今 / ちょうど / たった今 + Verbo た + ところです""",
no="""A palavra ところ forma um trio importante: るところ (prestes a fazer), ているところ (no meio de fazer) e たところ (acabou de fazer).

Não confunda com たところ do N3, que significa "quando fiz..., aconteceu tal coisa" e introduz um resultado.

Com たところ, não se usam expressões de tempo amplas como 先週 ou 先月. Para isso, usa-se たばかり.""",
bf="たところ",
rx="たところ|だところ",
tk=["た", "ところ"],
va=["たところ", "だところ"],
E=[
("今、家に着いたところです。", "いま、いえについたところです。", "Acabei de chegar em casa agora."),
("ちょうど今、仕事が終わったところだ。", "ちょうどいま、しごとがおわったところだ。", "O trabalho acabou de terminar agora mesmo."),
("「もう食べた？」「うん、今食べたところ。」", "「もうたべた？」「うん、いまたべたところ。」", "\"Já comeu?\" \"Sim, acabei de comer agora.\""),
("電車はたった今出たところです。", "でんしゃはたったいまでたところです。", "O trem acabou de sair agora mesmo."),
("今、あなたのメールを読んだところです。", "いま、あなたのメールをよんだところです。", "Acabei de ler o seu e-mail agora."),
],
R=[
("「まだ寝ないの？」「今、宿題が終わっ____だよ。」", "\"Ainda não vai dormir?\" \"Acabei de terminar a lição agora.\"", ["たところ"]),
("今、駅に着い____です。", "Acabei de chegar à estação agora.", ["たところ"]),
("映画はちょうど今始まっ____です。", "O filme acabou de começar agora mesmo.", ["たところ"]),
("今、薬を飲ん____です。", "Acabei de tomar o remédio agora.", ["だところ"]),
("「田中さんはいますか。」「たった今、帰っ____です。」", "\"O Tanaka está?\" \"Ele acabou de ir embora agora mesmo.\"", ["たところ"]),
],
),
dict(
n=85,
jp="他動詞・自動詞",
rd="tadoushi / jidoushi",
tr="Verbo transitivo / Verbo intransitivo",
ex="""Em japonês, muitos verbos existem em pares: um transitivo (他動詞) e um intransitivo (自動詞). Os dois falam da mesma mudança, mas com foco diferente.

O verbo transitivo indica que alguém faz uma ação em alguma coisa. A coisa é marcada com を. Por exemplo, "eu abro a janela".

O verbo intransitivo indica que algo muda ou acontece sozinho, sem destacar quem causou. A coisa é marcada com が. Por exemplo, "a janela abre" ou "a janela abriu (com o vento)".

Essa diferença é muito importante no japonês, que muitas vezes prefere descrever o que aconteceu (intransitivo) em vez de dizer quem fez (transitivo).

Os pares mais comuns no N4 são 開ける / 開く, 閉める / 閉まる, つける / つく, 消す / 消える, 始める / 始まる, 止める / 止まる, 落とす / 落ちる, 壊す / 壊れる, 出す / 出る e 入れる / 入る.""",
st="""Transitivo: Pessoa + が + Coisa + を + Verbo transitivo
Intransitivo: Coisa + が + Verbo intransitivo

Pares comuns:
開ける / 開く (abrir)
閉める / 閉まる (fechar)
つける / つく (acender)
消す / 消える (apagar)
始める / 始まる (começar)
止める / 止まる (parar)
落とす / 落ちる (derrubar / cair)
壊す / 壊れる (quebrar)
出す / 出る (tirar / sair)
入れる / 入る (colocar / entrar)""",
no="""Com a forma ている, os verbos intransitivos descrevem um estado: 窓が開いている (a janela está aberta). Com てある, os transitivos indicam que alguém deixou assim de propósito: 窓が開けてある.

Para pedir desculpas, os japoneses às vezes usam o intransitivo para soar menos acusador, como dizer que algo "quebrou" em vez de "eu quebrei". Mas, para assumir a responsabilidade, o transitivo é mais honesto.

Muitos pares seguem padrões, como える (transitivo) e わる / まる (intransitivo), o que ajuda a memorizar.""",
bf="他動詞・自動詞",
rx="を開け|が開|を閉め|が閉ま|をつけ|がつ|を消|が消え|を始め|が始ま|を止め|が止ま|を落と|が落ち|を壊|が壊れ|を出|が出|を入れ|が入",
tk=["を", "が"],
va=["開ける", "開く", "閉める", "閉まる", "つける", "つく", "消す", "消える", "始める", "始まる"],
E=[
("暑いので、私は窓を開けました。", "あついので、わたしはまどをあけました。", "Como estava quente, eu abri a janela."),
("風で窓が開きました。", "かぜでまどがあきました。", "A janela abriu com o vento."),
("先生が授業を始めます。", "せんせいがじゅぎょうをはじめます。", "O professor começa a aula."),
("毎朝九時に授業が始まります。", "まいあさくじにじゅぎょうがはじまります。", "A aula começa às nove toda manhã."),
("部屋の電気が消えています。", "へやのでんきがきえています。", "A luz do quarto está apagada."),
],
R=[
("寒いので、ドアを____ください。", "Está frio, então feche a porta, por favor.", ["閉めて"]),
("風でドアが____。", "A porta fechou com o vento.", ["閉まりました", "閉まった"]),
("暗いから、電気を____ください。", "Está escuro, então acenda a luz, por favor.", ["つけて"]),
("停電で、電気が____。", "Com a queda de energia, a luz apagou.", ["消えました", "消えた"]),
("十時に会議が____。", "A reunião começa às dez.", ["始まります"]),
],
),
dict(
n=86,
jp="〜たがる",
rd="tagaru",
tr="Querer (outra pessoa) / Ter vontade de",
ex="""たがる é usado para falar do desejo de outra pessoa, ou seja, para dizer que um terceiro quer fazer algo. Equivale a "querer" ou "ter vontade de", quando o sujeito não é quem fala.

Em japonês, a forma たい expressa um desejo interno, e só a própria pessoa pode afirmá-lo com certeza. Para falar do desejo de outra pessoa, usa-se たがる, que descreve o desejo a partir do comportamento visível.

Ele é formado tirando o い de たい e acrescentando がる. O resultado funciona como um verbo do grupo 1.

Para um desejo no momento, usa-se たがっている. Para uma tendência geral, como "crianças sempre querem brincar", usa-se たがる.

Como たがる é um verbo de ação, o objeto é marcado com を.""",
st="""Verbo na forma ます sem ます + たがる

Desejo no momento: たがっている / たがっています
Tendência geral: たがる / たがります
Negativo: たがらない""",
no="""Usar たがる para superiores pode soar desrespeitoso, porque descreve o desejo deles como algo observado de fora. Nesses casos, é melhor dizer 〜たいとおっしゃっていました.

Para coisas desejadas, e não ações, usa-se ほしがる.

Para falar de alguém próximo, como familiares, たがっている é muito natural no dia a dia.""",
bf="たがる",
rx="たがる|たがって|たがった|たがります|たがらない",
tk=["たがる"],
va=["たがる", "たがっている", "たがります", "たがらない"],
E=[
("子供はいつも外で遊びたがります。", "こどもはいつもそとであそびたがります。", "As crianças sempre querem brincar lá fora."),
("弟は新しいスマホを買いたがっている。", "おとうとはあたらしいスマホをかいたがっている。", "Meu irmão mais novo está querendo comprar um celular novo."),
("娘は一人で何でもやりたがる。", "むすめはひとりでなんでもやりたがる。", "Minha filha quer fazer tudo sozinha."),
("父は病院に行きたがらない。", "ちちはびょういんにいきたがらない。", "Meu pai não quer ir ao hospital."),
("妻は海外旅行に行きたがっています。", "つまはかいがいりょこうにいきたがっています。", "Minha esposa está querendo fazer uma viagem ao exterior."),
],
R=[
("息子は犬を飼い____います。", "Meu filho está querendo ter um cachorro.", ["たがって"]),
("子供は甘い物を食べ____。", "As crianças querem comer doces.", ["たがります", "たがる"]),
("彼女は最近、誰にも会い____。", "Ultimamente ela não quer ver ninguém.", ["たがらない"]),
("弟は日本へ留学し____いる。", "Meu irmão mais novo está querendo fazer intercâmbio no Japão.", ["たがって"]),
("犬が散歩に行き____。", "O cachorro está querendo passear.", ["たがっている", "たがっています"]),
],
),
dict(
n=87,
jp="〜たら",
rd="tara",
tr="Se / Quando / Depois que",
ex="""たら é a forma condicional mais usada na conversa. Ela pode significar "se", "quando" ou "depois que", dependendo da frase.

No sentido de "se", ela apresenta uma condição hipotética: se algo acontecer, haverá um resultado.

No sentido de "quando" ou "depois que", ela indica que, depois de uma ação acontecer, outra vai acontecer. Nesse caso, a primeira ação certamente vai ocorrer, como chegar à estação.

No passado, たら pode descrever uma descoberta: "quando fiz isso, aconteceu tal coisa". A segunda parte mostra algo inesperado ou uma constatação.

たら é formado com a forma た + ら. Diferente de ば, a segunda parte pode ser um pedido, uma ordem, uma vontade ou uma sugestão.""",
st="""Verbo na forma た + ら
Adjetivo い sem い + かったら
Adjetivo な / Substantivo + だったら
Negativo: Verbo ない → なかったら""",
no="""たら é o "se" mais versátil do japonês. Quando estiver em dúvida, ele costuma ser a opção mais segura na conversa.

Com descobertas no passado, a segunda parte não pode ser uma ação controlada por quem fala.

Em frases como もし〜たら, a palavra もし reforça a ideia de hipótese.""",
bf="たら",
rx="たら|だら",
tk=["たら"],
va=["たら", "だら", "かったら", "だったら", "なかったら"],
E=[
("雨が降ったら、試合は中止です。", "あめがふったら、しあいはちゅうしです。", "Se chover, a partida será cancelada."),
("駅に着いたら、電話してください。", "えきについたら、でんわしてください。", "Quando chegar à estação, me ligue."),
("お金があったら、世界一周したい。", "おかねがあったら、せかいいっしゅうしたい。", "Se eu tivesse dinheiro, queria dar a volta ao mundo."),
("安かったら、買います。", "やすかったら、かいます。", "Se for barato, eu compro."),
("窓を開けたら、富士山が見えた。", "まどをあけたら、ふじさんがみえた。", "Quando abri a janela, deu para ver o Monte Fuji."),
],
R=[
("宿題が終わっ____、遊びに行ってもいいよ。", "Quando terminar a lição, pode ir brincar.", ["たら"]),
("暇だっ____、一緒に映画を見ませんか。", "Se estiver livre, quer ver um filme comigo?", ["たら"]),
("大人になっ____、何になりたい？", "Quando crescer, o que você quer ser?", ["たら"]),
("その薬を飲ん____、すぐ治りました。", "Quando tomei esse remédio, melhorei logo.", ["だら"]),
("家に帰っ____、誰もいなかった。", "Quando voltei para casa, não havia ninguém.", ["たら"]),
],
),
dict(
n=88,
jp="〜たらどう",
rd="tara dou",
tr="Que tal...? / Por que você não...?",
ex="""たらどう é usado para dar uma sugestão ou um conselho. Equivale a "que tal...?" ou "por que você não...?".

Ele junta a forma たら ("se fizer") com どう ("como fica?"). A ideia literal é "se você fizer isso, que tal?".

A forma たらどう？ é informal e usada com amigos e familiares. A forma たらどうですか é educada, e たらいかがですか é ainda mais polida.

O tom é de recomendação, mas, dependendo da entonação, たらどう pode soar como uma cobrança ou um conselho impaciente, como "por que você não faz logo isso?".""",
st="""Verbo na forma た + ら + どう？ (informal)
Verbo na forma た + ら + どうですか (educado)
Verbo na forma た + ら + いかがですか (muito educado)""",
no="""Com superiores, prefira たらいかがですか, que soa respeitoso e suave.

ほうがいい também dá conselhos, mas soa mais firme. たらどう deixa a decisão mais aberta para o outro.

Às vezes, a frase termina só em たら, sem どう, com o mesmo sentido de sugestão.""",
bf="たらどう",
rx="たらどう|だらどう",
tk=["たら", "どう"],
va=["たらどう", "たらどうですか", "たらいかがですか"],
E=[
("疲れているなら、少し休んだらどう？", "つかれているなら、すこしやすんだらどう？", "Se está cansado, que tal descansar um pouco?"),
("先生に相談したらどうですか。", "せんせいにそうだんしたらどうですか。", "Por que você não conversa com o professor?"),
("一度、医者に見てもらったらどう？", "いちど、いしゃにみてもらったらどう？", "Que tal ir ao médico uma vez?"),
("雨が降りそうだから、傘を持って行ったらどうですか。", "あめがふりそうだから、かさをもっていったらどうですか。", "Parece que vai chover, que tal levar um guarda-chuva?"),
("もう少し早く起きたらどう？", "もうすこしはやくおきたらどう？", "Que tal acordar um pouco mais cedo?"),
],
R=[
("わからないなら、辞書で調べ____？", "Se não entende, que tal procurar no dicionário?", ["たらどう"]),
("寒いなら、コートを着____ですか。", "Se está com frio, que tal vestir o casaco?", ["たらどう"]),
("毎日少しずつ練習し____？", "Que tal praticar um pouco todo dia?", ["たらどう"]),
("熱があるなら、病院に行っ____ですか。", "Se está com febre, por que não vai ao hospital?", ["たらどう"]),
("気になるなら、本人に直接聞い____？", "Se está curioso, por que não pergunta direto para a pessoa?", ["たらどう"]),
],
),
dict(
n=89,
jp="〜たらいいですか",
rd="tara ii desu ka",
tr="O que devo...? / Como devo...?",
ex="""たらいいですか é usado para pedir conselho ou instrução. Equivale a "o que devo fazer?", "como devo...?" ou "onde devo...?".

Ele junta a forma たら ("se fizer") com いいですか ("está bom?"). A ideia literal é "se eu fizer..., está bom?".

Quase sempre aparece com palavras interrogativas, como どう, 何, どこ, いつ e 誰, para perguntar qual é a melhor forma de agir.

Dentro de uma frase maior, como "não sei para quem perguntar", usa-se たらいいか, seguido de わからない ou 迷う.

Para ser ainda mais educado, usa-se たらいいでしょうか.""",
st="""Palavra interrogativa + … + Verbo na forma た + らいいですか
Palavra interrogativa + … + Verbo た + らいいか + わからない / 迷う

Mais educado: たらいいでしょうか
Equivalente: ばいいですか""",
no="""どうしたらいいですか é uma das perguntas mais úteis para pedir ajuda em qualquer situação.

ばいいですか tem o mesmo sentido e também é muito usada. A diferença é pequena e muitas vezes as duas podem ser trocadas.

A resposta costuma vir com たらいいですよ ou ばいいですよ, oferecendo a sugestão.""",
bf="たらいいですか",
rx="たらいい|だらいい",
tk=["たら", "いい", "ですか"],
va=["たらいいですか", "たらいいでしょうか", "たらいいか"],
E=[
("すみません、駅までどう行ったらいいですか。", "すみません、えきまでどういったらいいですか。", "Com licença, como faço para ir até a estação?"),
("このボタンはいつ押したらいいですか。", "このボタンはいつおしたらいいですか。", "Quando devo apertar este botão?"),
("誰に聞いたらいいかわからない。", "だれにきいたらいいかわからない。", "Não sei para quem perguntar."),
("母の誕生日に何を買ったらいいでしょうか。", "ははのたんじょうびになにをかったらいいでしょうか。", "O que devo comprar para o aniversário da minha mãe?"),
("この薬は一日何回飲んだらいいですか。", "このくすりはいちにちなんかいのんだらいいですか。", "Quantas vezes por dia devo tomar este remédio?"),
],
R=[
("この書類はどこに出し____。", "Onde devo entregar este documento?", ["たらいいですか"]),
("明日は何時に来____ですか。", "A que horas devo vir amanhã?", ["たらいい"]),
("日本語が上手になるには、どうし____ですか。", "O que devo fazer para melhorar meu japonês?", ["たらいい"]),
("パーティーに何を着て行っ____か、迷っています。", "Estou em dúvida sobre o que vestir para a festa.", ["たらいい"]),
("この漢字は何と読ん____ですか。", "Como devo ler este kanji?", ["だらいい"]),
],
),
dict(
n=90,
jp="〜て・〜で（接続）",
rd="te / de (setsuzoku)",
tr="E / E depois / Por isso",
ex="""A forma て (ou で) é usada para ligar frases e ideias. Ela é uma das ferramentas mais importantes do japonês, e o sentido depende do contexto.

Os usos principais são:
• Sequência de ações: uma ação depois da outra, na ordem em que acontecem.
• Lista de características: ligar adjetivos ou descrições, como "amplo e claro".
• Causa ou motivo: a primeira parte explica o resultado da segunda, como "peguei um resfriado e faltei".
• Modo: como uma ação é feita, como ir a pé ou ir de óculos.

Com verbos, usa-se a forma て. Com adjetivos い, troca-se い por くて. Com adjetivos な e substantivos, usa-se で.

O tempo e a formalidade da frase ficam apenas no último verbo.""",
st="""Verbo na forma て + Frase
Adjetivo い sem い + くて + Frase
Adjetivo な / Substantivo + で + Frase""",
no="""Quando a forma て indica causa, a segunda parte normalmente não pode ser um pedido ou uma vontade. Nesses casos, usa-se から ou ので.

Ao ligar adjetivos, as qualidades devem ter o mesmo tom: duas positivas ou duas negativas. Para contraste, usa-se けど ou が.

O で de substantivos aqui é a forma て de です, e não a partícula で de lugar.""",
bf="て",
rx="て|で",
tk=["て", "で"],
va=["て", "で", "くて"],
E=[
("朝起きて、顔を洗って、ご飯を食べます。", "あさおきて、かおをあらって、ごはんをたべます。", "De manhã, acordo, lavo o rosto e tomo café."),
("この部屋は広くて、明るいです。", "このへやはひろくて、あかるいです。", "Este quarto é amplo e claro."),
("彼は親切で、優しい人です。", "かれはしんせつで、やさしいひとです。", "Ele é atencioso e gentil."),
("風邪をひいて、学校を休みました。", "かぜをひいて、がっこうをやすみました。", "Peguei um resfriado e faltei à escola."),
("雨で、試合が中止になった。", "あめで、しあいがちゅうしになった。", "Por causa da chuva, a partida foi cancelada."),
],
R=[
("デパートへ行っ____、服を買いました。", "Fui à loja de departamentos e comprei roupas.", ["て"]),
("このかばんは安く____、便利です。", "Esta bolsa é barata e prática.", ["て"]),
("姉はきれい____、頭がいい。", "Minha irmã mais velha é bonita e inteligente.", ["で"]),
("宿題が多く____、遊ぶ時間がない。", "Tenho muita lição e não sobra tempo para brincar.", ["て"]),
("その本を読ん____、感想を書きました。", "Li esse livro e escrevi minha opinião.", ["で"]),
],
),
]
