G = [
dict(
n=31,
jp="〜ませんか",
rd="masen ka",
tr="Que tal...? / Você não quer...? / Vamos...?",
ex="""ませんか é usado para fazer convites de forma educada. Equivale a "você não quer...?" ou "que tal...?".

A forma é negativa (ません) com か de pergunta, mas o sentido não é negativo. Perguntar "você não vai...?" deixa a outra pessoa livre para recusar, e por isso soa gentil e respeitoso.

Esse é o jeito mais educado e comum de convidar alguém no nível N5. Ele combina muito com 一緒に, quando você quer fazer algo junto com a pessoa.

Na fala informal, entre amigos, o mesmo convite é feito com a forma ない e entonação de pergunta, como "não quer ir?".""",
st="""Verbo na forma ます sem ます + ませんか
一緒に + Verbo ませんか

Informal: Verbo na forma ない + ？ (com entonação de pergunta)""",
no="""A diferença entre ませんか e ましょう está na pressão: ませんか pergunta a vontade do outro, enquanto ましょう já propõe a ação como se estivesse decidido. Por isso, ませんか é mais adequado para convidar alguém pela primeira vez.

Para recusar um convite de forma educada, os japoneses raramente dizem "não" diretamente. É comum usar ちょっと… e deixar a frase incompleta.

Quando alguém aceita um convite feito com ませんか, a resposta natural é いいですね ou ええ、〜ましょう.""",
bf="ませんか",
rx="ませんか",
tk=["ません", "か"],
va=["ませんか"],
E=[
("一緒に昼ご飯を食べませんか。", "いっしょにひるごはんをたべませんか。", "Quer almoçar comigo?"),
("週末、映画を見に行きませんか。", "しゅうまつ、えいがをみにいきませんか。", "Que tal irmos ver um filme no fim de semana?"),
("ちょっと休みませんか。", "ちょっとやすみませんか。", "Que tal descansarmos um pouco?"),
("今度、うちに遊びに来ませんか。", "こんど、うちにあそびにきませんか。", "Da próxima vez, não quer vir aqui em casa?"),
("「お茶でも飲みませんか。」「いいですね。」", "「おちゃでものみませんか。」「いいですね。」", "\"Que tal tomarmos um chá?\" \"Boa ideia.\""),
],
R=[
("明日、一緒にテニスをし____。", "Amanhã, quer jogar tênis comigo?", ["ませんか"]),
("日曜日、公園に行き____。", "Que tal irmos ao parque no domingo?", ["ませんか"]),
("駅の前のカフェでコーヒーを飲み____。", "Que tal tomarmos um café na cafeteria em frente à estação?", ["ませんか"]),
("「今晩、一緒にご飯を食べ____。」「すみません、今晩はちょっと…。」", "\"Quer jantar comigo hoje?\" \"Desculpe, hoje não dá...\"", ["ませんか"]),
("夏休みに、一緒に沖縄へ行き____。", "Nas férias de verão, não quer ir a Okinawa comigo?", ["ませんか"]),
],
),
dict(
n=32,
jp="〜ましょう",
rd="mashou",
tr="Vamos... / Façamos...",
ex="""ましょう é usado para propor ou combinar uma ação que será feita junto com outras pessoas. Equivale a "vamos...".

Ele tem um tom mais decidido que ませんか: em vez de perguntar se o outro quer, ele já sugere que todos façam a ação. Por isso, é muito usado quando a ideia já foi aceita, ou quando a pessoa está organizando um grupo.

Também é a resposta natural para aceitar um convite. Se alguém pergunta "vamos?" com ませんか, responder com ましょう significa "sim, vamos".

Em avisos, regras e instruções educadas, ましょう também aparece com o sentido de "vamos fazer assim", indicando um comportamento esperado de todos.""",
st="""Verbo na forma ます sem ます + ましょう
一緒に + Verbo ましょう

Informal: forma volitiva do verbo (う / よう)""",
no="""Para convidar alguém pela primeira vez, ませんか costuma soar mais gentil. ましょう funciona melhor quando o grupo já está de acordo ou quando quem fala está liderando.

Em escolas e lugares públicos, avisos com ましょう são muito comuns, como lembretes de boas maneiras.

A forma informal de ましょう é a forma volitiva, que aparece no N4. Entre amigos, ela é muito mais comum do que ましょう.""",
bf="ましょう",
rx="ましょう",
tk=["ましょう"],
va=["ましょう"],
E=[
("さあ、始めましょう。", "さあ、はじめましょう。", "Bom, vamos começar."),
("駅の前で会いましょう。", "えきのまえであいましょう。", "Vamos nos encontrar em frente à estação."),
("疲れましたね。少し休みましょう。", "つかれましたね。すこしやすみましょう。", "Cansamos, né. Vamos descansar um pouco."),
("「何か食べに行きませんか。」「ええ、行きましょう。」", "「なにかたべにいきませんか。」「ええ、いきましょう。」", "\"Quer ir comer alguma coisa?\" \"Sim, vamos.\""),
("図書館の中では静かにしましょう。", "としょかんのなかではしずかにしましょう。", "Dentro da biblioteca, vamos fazer silêncio."),
],
R=[
("もう時間ですね。じゃ、帰り____。", "Já está na hora, né. Então, vamos voltar.", ["ましょう"]),
("「一緒に写真を撮りませんか。」「ええ、撮り____。」", "\"Quer tirar uma foto juntos?\" \"Sim, vamos tirar.\"", ["ましょう"]),
("明日は七時に駅で会い____。", "Amanhã, vamos nos encontrar na estação às sete.", ["ましょう"]),
("みんなで一緒に歌を歌い____。", "Vamos todos cantar uma música juntos.", ["ましょう"]),
("ゴミは決められた日に出し____。", "Vamos colocar o lixo para fora nos dias determinados.", ["ましょう"]),
],
),
dict(
n=33,
jp="〜ましょうか",
rd="mashou ka",
tr="Vamos...? / Quer que eu...? / Devo...?",
ex="""ましょうか é ましょう com か de pergunta. Ele tem dois usos principais.

O primeiro é oferecer ajuda. Quando a ação é feita por quem fala, a frase significa "quer que eu faça isso?". É um jeito educado de se oferecer para carregar algo, abrir uma janela, chamar um táxi.

O segundo é sugerir algo ao grupo de forma mais suave que ましょう. A pessoa propõe e, ao mesmo tempo, pergunta a opinião dos outros: "vamos...?".

Com palavras interrogativas, como 何, いつ e どこ, ましょうか serve para combinar detalhes junto com o outro, como "o que vamos comer?" ou "onde nos encontramos?".""",
st="""Verbo na forma ます sem ます + ましょうか
Palavra interrogativa + … + Verbo ましょうか

Informal: forma volitiva do verbo + か""",
no="""Quando alguém se oferece com ましょうか, as respostas mais comuns são お願いします para aceitar e 大丈夫です ou いいえ、けっこうです para recusar com educação.

Para oferecer ajuda a um superior, ましょうか é natural e respeitoso. Em níveis mais altos, existem formas ainda mais formais, como お〜しましょうか.

O contexto mostra se a ação é de quem fala ou do grupo: se só quem fala vai agir, é uma oferta; se todos vão agir, é uma sugestão.""",
bf="ましょうか",
rx="ましょうか",
tk=["ましょう", "か"],
va=["ましょうか"],
E=[
("荷物を持ちましょうか。", "にもつをもちましょうか。", "Quer que eu carregue a bagagem?"),
("窓を開けましょうか。", "まどをあけましょうか。", "Quer que eu abra a janela?"),
("そろそろ帰りましょうか。", "そろそろかえりましょうか。", "Vamos indo?"),
("明日は何時に会いましょうか。", "あしたはなんじにあいましょうか。", "Amanhã, que horas a gente se encontra?"),
("「タクシーを呼びましょうか。」「ええ、お願いします。」", "「タクシーをよびましょうか。」「ええ、おねがいします。」", "\"Quer que eu chame um táxi?\" \"Sim, por favor.\""),
],
R=[
("暑いですね。エアコンをつけ____。", "Está quente, né. Quer que eu ligue o ar-condicionado?", ["ましょうか"]),
("その箱、重いでしょう。手伝い____。", "Essa caixa deve estar pesada. Quer que eu ajude?", ["ましょうか"]),
("次はどこへ行き____。", "Aonde vamos agora?", ["ましょうか"]),
("疲れましたね。ちょっと休み____。", "Cansamos, né. Vamos descansar um pouco?", ["ましょうか"]),
("「駅まで送り____。」「ありがとうございます。助かります。」", "\"Quer que eu te leve até a estação?\" \"Obrigado. Ajuda muito.\"", ["ましょうか"]),
],
),
dict(
n=34,
jp="も",
rd="mo",
tr="Também / Nem / Tanto... quanto...",
ex="""も é uma partícula que significa "também". Ela mostra que a mesma coisa vale para mais de um elemento.

も ocupa o lugar de は, が e を: em vez de usar essas partículas, você coloca も. Já com outras partículas, como に, で e と, も fica depois delas, formando にも, でも e とも.

Quando aparece duas vezes, na forma A も B も, significa "tanto A quanto B" em frases afirmativas, e "nem A nem B" em frases negativas.

Depois de palavras interrogativas, como 何, 誰 e どこ, e com o verbo no negativo, も forma ideias como "nada", "ninguém" e "nenhum lugar".

Depois de uma quantidade, も dá ênfase, mostrando que o número é maior do que o esperado.""",
st="""Substantivo + も (no lugar de は / が / を)
Substantivo + partícula + も (にも / でも / とも / へも)
A + も + B + も + afirmativo (tanto A quanto B)
A + も + B + も + negativo (nem A nem B)
Palavra interrogativa + も + negativo (nada / ninguém / nenhum lugar)
Quantidade + も (ênfase: "todo esse tanto")""",
no="""Dizer 何もありません é a forma natural de "não tem nada". Com 何 e も, o verbo precisa estar no negativo.

Um erro comum é juntar も com は, が ou を, como dizer 私はも. O correto é só 私も.

Na resposta curta, 私も sozinho significa "eu também", e é muito usado em conversas.""",
bf="も",
rx="も",
tk=["も"],
va=["も"],
E=[
("私も学生です。", "わたしもがくせいです。", "Eu também sou estudante."),
("兄も姉も東京に住んでいます。", "あにもあねもとうきょうにすんでいます。", "Tanto meu irmão quanto minha irmã moram em Tóquio."),
("今日は何も食べていません。", "きょうはなにもたべていません。", "Hoje não comi nada."),
("旅行で京都にも行きました。", "りょこうできょうとにもいきました。", "Na viagem, também fui a Kyoto."),
("昨日は十時間も寝ました。", "きのうはじゅうじかんもねました。", "Ontem dormi dez horas inteiras."),
],
R=[
("田中さんは医者です。山田さん____医者です。", "O Tanaka é médico. O Yamada também é médico.", ["も"]),
("教室には誰____いません。", "Não tem ninguém na sala de aula.", ["も"]),
("肉____魚も好きです。", "Gosto tanto de carne quanto de peixe.", ["も"]),
("「私はコーヒーが好きです。」「私____。」", "\"Eu gosto de café.\" \"Eu também.\"", ["も"]),
("駅まで一時間____かかりました。", "Levou uma hora inteira até a estação.", ["も"]),
],
),
dict(
n=35,
jp="もう",
rd="mou",
tr="Já / Mais / Não mais",
ex="""もう é um advérbio com sentidos que dependem da frase, mas que giram em torno da ideia de "mudança de situação".

Com o verbo no passado, もう significa "já": a ação aconteceu e a situação mudou. Em perguntas, もう〜ましたか pergunta se algo já foi feito.

Antes de números e quantidades, もう significa "mais", como em mais um, mais uma vez, mais um pouco.

Com o verbo no negativo, もう significa "não mais": algo que acontecia antes deixou de acontecer.

O oposto de もう (já) é まだ (ainda). Por isso, para responder "ainda não" a uma pergunta com もう, usa-se まだ.""",
st="""もう + Verbo na forma ました / た (já fez)
もう + Verbo ましたか (pergunta: já fez?)
もう + Quantidade (mais um / mais uma vez)
もう + Verbo negativo (não mais)
もう + Horário / Situação + です (já é...)""",
no="""Na resposta afirmativa, é comum repetir もう: はい、もう〜ました.

A expressão もう一度 significa "mais uma vez" e é muito usada para pedir que alguém repita algo.

Dito sozinho e com certo tom, もう também expressa irritação, algo como "ah, poxa!". Esse uso é bem coloquial.""",
bf="もう",
rx="もう",
tk=["もう"],
va=["もう"],
E=[
("もう宿題をしました。", "もうしゅくだいをしました。", "Já fiz a lição."),
("「もう昼ご飯を食べましたか。」「はい、もう食べました。」", "「もうひるごはんをたべましたか。」「はい、もうたべました。」", "\"Você já almoçou?\" \"Sim, já almocei.\""),
("もう一度言ってください。", "もういちどいってください。", "Diga mais uma vez, por favor."),
("もう十時ですよ。早く寝ましょう。", "もうじゅうじですよ。はやくねましょう。", "Já são dez horas. Vamos dormir cedo."),
("もうタバコは吸いません。", "もうタバコはすいません。", "Não fumo mais."),
],
R=[
("父は____会社に行きました。", "Meu pai já foi para a empresa.", ["もう"]),
("すみません、____一つください。", "Com licença, me dê mais um, por favor.", ["もう"]),
("「映画は始まりましたか。」「はい、____始まりましたよ。」", "\"O filme já começou?\" \"Sim, já começou.\"", ["もう"]),
("____遅いから、帰りましょう。", "Já está tarde, vamos voltar.", ["もう"]),
("あの店には____行きたくないです。", "Não quero mais ir àquela loja.", ["もう"]),
],
),
dict(
n=36,
jp="な形容詞",
rd="na-keiyoushi",
tr="Adjetivo な / Adjetivo com な",
ex="""Os adjetivos な são adjetivos que recebem な quando vêm antes de um substantivo. Eles descrevem qualidades e estados, como tranquilo, famoso, bonito e prático.

Diferente dos adjetivos い, os adjetivos な não se conjugam sozinhos. Eles funcionam de um jeito parecido com os substantivos: quem muda é o que vem depois. Para o presente usa-se だ ou です, para o negativo じゃない ou ではありません, e para o passado だった ou でした.

O な só aparece quando o adjetivo está diretamente antes de um substantivo. No final da frase, o な desaparece e entra だ ou です.

Para ligar um adjetivo な a outra qualidade, usa-se で. E para transformá-lo em advérbio, usa-se に, como "fazer algo de forma tranquila".""",
st="""Antes de substantivo: Adjetivo + な + Substantivo
Afirmativo: Adjetivo + だ / です
Negativo: Adjetivo + じゃない / ではない / じゃありません / ではありません
Passado: Adjetivo + だった / でした
Passado negativo: Adjetivo + じゃなかった / ではなかった / じゃありませんでした / ではありませんでした
Ligando qualidades: Adjetivo + で
Advérbio: Adjetivo + に""",
no="""Alguns adjetivos な terminam em い e confundem estudantes, como きれい, 嫌い e 有名. Eles nunca usam くない ou かった: o negativo de きれい é きれいじゃない.

Muitos adjetivos な vêm do chinês e são escritos com dois kanji, como 有名, 便利 e 親切.

O adjetivo 同じ é especial: antes de substantivo, ele não recebe な.""",
bf="な",
rx="な|です|でした|だった|じゃない|ではない|じゃなかった|ではなかった|じゃありません|ではありません",
tk=["な", "だ", "です"],
va=["な", "だ", "です", "じゃない", "ではない", "だった", "でした", "じゃなかった", "ではなかった", "で", "に"],
E=[
("ここは静かな町です。", "ここはしずかなまちです。", "Aqui é uma cidade tranquila."),
("田中さんはとても親切です。", "たなかさんはとてもしんせつです。", "O Tanaka é muito gentil."),
("この公園はあまりきれいじゃないです。", "このこうえんはあまりきれいじゃないです。", "Este parque não é muito limpo."),
("昨日のテストは簡単でした。", "きのうのテストはかんたんでした。", "A prova de ontem foi fácil."),
("この町はにぎやかで、楽しいです。", "このまちはにぎやかで、たのしいです。", "Esta cidade é animada e divertida."),
],
R=[
("ここは有名____レストランです。", "Aqui é um restaurante famoso.", ["な"]),
("昨日の仕事はあまり大変____。", "O trabalho de ontem não foi muito puxado.", ["じゃなかった", "ではなかった", "じゃありませんでした", "ではありませんでした", "じゃなかったです", "ではなかったです"]),
("子供のころ、野菜が嫌い____。", "Quando eu era criança, não gostava de verdura.", ["でした", "だった"]),
("彼女はきれい____、優しい人です。", "Ela é bonita e é uma pessoa gentil.", ["で"]),
("この部屋はあまりきれい____。", "Este quarto não está muito limpo.", ["じゃない", "ではない", "じゃありません", "ではありません", "じゃないです", "ではないです"]),
],
),
dict(
n=37,
jp="〜なあ",
rd="naa",
tr="Que... / Nossa / Como... (exclamação)",
ex="""なあ é uma partícula de final de frase que expressa um sentimento forte, como admiração, surpresa, desejo ou desabafo. É como dizer "que...!", "nossa, como...!" ou um suspiro em voz alta.

Normalmente é usada quando a pessoa fala consigo mesma ou comenta algo em voz alta, sem esperar resposta. Por isso, ela soa espontânea e emotiva.

Ela vem depois da forma simples da frase. Com substantivos e adjetivos な, coloca-se だ antes de なあ.

Junto com たい, なあ expressa um desejo, quase como um sonho: "como eu queria...".""",
st="""Verbo / Adjetivo い (forma simples) + なあ
Substantivo / Adjetivo な + だ + なあ
Verbo na forma たい + なあ (desejo)

Variações: な / なー""",
no="""なあ é diferente de ね: ね busca a concordância do outro, enquanto なあ é mais um sentimento expresso para si mesmo.

A forma curta な também é usada, principalmente na fala masculina e casual. Não confunda com a proibição な (como em "não faça"), que vem depois do verbo na forma de dicionário e tem tom de ordem.

Por ser informal e emotiva, なあ não é usada em situações formais.""",
bf="なあ",
rx="なあ|なー",
tk=["なあ"],
va=["なあ", "なー", "な"],
E=[
("きれいだなあ。", "きれいだなあ。", "Que lindo!"),
("今日は暑いなあ。", "きょうはあついなあ。", "Que calor hoje!"),
("日本に行きたいなあ。", "にほんにいきたいなあ。", "Como eu queria ir ao Japão..."),
("この料理、おいしいなあ。", "このりょうり、おいしいなあ。", "Nossa, esta comida é gostosa!"),
("田中さん、遅いなあ。", "たなかさん、おそいなあ。", "O Tanaka está demorando, hein..."),
],
R=[
("この景色、すごい____。", "Nossa, esta paisagem é incrível!", ["なあ", "なー"]),
("もう少し寝たい____。", "Queria dormir mais um pouco...", ["なあ", "なー"]),
("今日はいい天気だ____。", "Que dia bonito hoje!", ["なあ", "なー"]),
("あーあ、お腹がすいた____。", "Ai, que fome...", ["なあ", "なー"]),
("彼は本当に日本語が上手だ____。", "Ele fala japonês muito bem, hein.", ["なあ", "なー"]),
],
),
dict(
n=38,
jp="〜ないで",
rd="naide",
tr="Sem / Sem fazer / Em vez de",
ex="""ないで é usado para dizer que uma ação é feita sem fazer outra. Equivale a "sem" ou "sem fazer".

A estrutura liga dois verbos: o primeiro, na forma ない + で, mostra o que não foi feito; o segundo mostra o que foi feito, nessas condições.

Também pode indicar uma escolha, com o sentido de "em vez de": em vez de fazer A, a pessoa fez B.

O tempo da frase, presente ou passado, fica no último verbo. O verbo com ないで não muda.""",
st="""Verbo na forma ない + で + Verbo
Verbo na forma ない + で、 + Verbo (em vez de)""",
no="""ないで é diferente de なくて, que também liga frases, mas indica causa, como "por não ter feito, aconteceu algo". ないで indica o modo ou a escolha.

No final da frase, ないで sozinho vira um pedido informal, como "não faça isso". Esse uso é a forma curta de ないでください.

Na fala, a forma ずに tem o mesmo sentido de ないで, mas é mais formal e aparece em níveis seguintes.""",
bf="ないで",
rx="ないで",
tk=["ない", "で"],
va=["ないで"],
E=[
("朝ご飯を食べないで学校に行きました。", "あさごはんをたべないでがっこうにいきました。", "Fui para a escola sem tomar café da manhã."),
("傘を持たないで出かけました。", "かさをもたないででかけました。", "Saí sem levar guarda-chuva."),
("辞書を使わないで新聞を読みます。", "じしょをつかわないでしんぶんをよみます。", "Leio o jornal sem usar dicionário."),
("昨日は寝ないで勉強しました。", "きのうはねないでべんきょうしました。", "Ontem estudei sem dormir."),
("電車に乗らないで、歩いて帰りました。", "でんしゃにのらないで、あるいてかえりました。", "Em vez de pegar o trem, voltei a pé."),
],
R=[
("砂糖を入れ____コーヒーを飲みます。", "Tomo café sem colocar açúcar.", ["ないで"]),
("昨日は宿題をし____寝ました。", "Ontem dormi sem fazer a lição.", ["ないで"]),
("手を洗わ____ご飯を食べてはいけません。", "Não pode comer sem lavar as mãos.", ["ないで"]),
("誰にも言わ____家を出ました。", "Saí de casa sem dizer nada a ninguém.", ["ないで"]),
("バスに乗ら____、自転車で行きました。", "Em vez de pegar o ônibus, fui de bicicleta.", ["ないで"]),
],
),
dict(
n=39,
jp="〜ないでください",
rd="naide kudasai",
tr="Não faça... / Por favor não... / Evite...",
ex="""ないでください é usado para pedir educadamente que alguém não faça alguma coisa. Equivale a "por favor, não...".

Ele é formado pela forma ない do verbo, seguida de でください. É o oposto de てください, que pede para fazer algo.

É muito usado em avisos, regras, instruções e pedidos do dia a dia. Também aparece em frases de cuidado e gentileza, como "não se preocupe" e "não se esqueça".

Na fala informal, entre amigos e família, ください costuma ser omitido, e a frase termina só com ないで, muitas vezes com ね ou よ para suavizar.""",
st="""Verbo na forma ない + でください (educado)
Verbo na forma ない + で (informal)
Verbo na forma ない + でね / でよ (informal, mais suave)""",
no="""Mesmo sendo educado, ないでください é um pedido direto. Com superiores, os japoneses costumam suavizar com explicações antes, como dizer o motivo com から.

A expressão 心配しないでください é uma das mais comuns e serve para tranquilizar alguém.

Em placas e avisos escritos, também é comum ver formas mais curtas e firmes, mas na conversa ないでください é a forma padrão.""",
bf="ないでください",
rx="ないでください|ないで。|ないでね|ないでよ",
tk=["ない", "で", "ください"],
va=["ないでください", "ないで", "ないでね", "ないでよ"],
E=[
("ここで写真を撮らないでください。", "ここでしゃしんをとらないでください。", "Por favor, não tire fotos aqui."),
("心配しないでください。", "しんぱいしないでください。", "Não se preocupe."),
("授業中に話さないでください。", "じゅぎょうちゅうにはなさないでください。", "Por favor, não converse durante a aula."),
("このことは誰にも言わないでね。", "このことはだれにもいわないでね。", "Não conte isso para ninguém, tá?"),
("明日の約束を忘れないでください。", "あしたのやくそくをわすれないでください。", "Não se esqueça do compromisso de amanhã, por favor."),
],
R=[
("ここに車を止め____。", "Por favor, não estacione aqui.", ["ないでください"]),
("危ないですから、押さ____。", "É perigoso, então não empurre, por favor.", ["ないでください"]),
("図書館で食べ物を食べ____。", "Por favor, não coma na biblioteca.", ["ないでください"]),
("まだ帰ら____。", "Não vá embora ainda, por favor.", ["ないでください", "ないで"]),
("泣か____よ。", "Não chore.", ["ないで", "ないでください"]),
],
),
dict(
n=40,
jp="〜なくてもいい",
rd="nakute mo ii",
tr="Não precisa / Não é necessário",
ex="""なくてもいい é usado para dizer que algo não é necessário. Equivale a "não precisa" ou "não é preciso".

Literalmente, a estrutura quer dizer "mesmo não fazendo, está tudo bem". Ou seja, a pessoa tem liberdade para não fazer aquilo.

Ela é formada pela forma ない do verbo, trocando o い final por くても, e depois いい. Em perguntas, なくてもいいですか serve para pedir permissão para não fazer algo.

Com adjetivos い, usa-se くなくてもいい ("não precisa ser..."). Com substantivos e adjetivos な, usa-se じゃなくてもいい.

É o oposto de なければならない e なくてはいけない, que indicam obrigação.""",
st="""Verbo na forma ない sem い + くてもいい
Adjetivo い sem い + くなくてもいい
Substantivo / Adjetivo な + じゃなくてもいい

Educado: なくてもいいです
Pergunta: なくてもいいですか
Variações: なくても大丈夫 / なくてもかまわない""",
no="""Na conversa, なくても大丈夫 é tão comum quanto なくてもいい e soa um pouco mais leve e simpático.

なくてもかまわない tem o mesmo sentido, mas soa mais formal.

Quando alguém pergunta なければなりませんか ("tenho que...?"), a resposta negativa natural é いいえ、〜なくてもいいです.""",
bf="なくてもいい",
rx="なくてもいい|なくても大丈夫|なくてもかまわない",
tk=["なくて", "も", "いい"],
va=["なくてもいい", "なくてもいいです", "なくても大丈夫", "なくてもかまわない"],
E=[
("明日は来なくてもいいです。", "あしたはこなくてもいいです。", "Amanhã você não precisa vir."),
("全部食べなくてもいいよ。", "ぜんぶたべなくてもいいよ。", "Não precisa comer tudo."),
("ここでは靴を脱がなくてもいいですか。", "ここではくつをぬがなくてもいいですか。", "Aqui eu não preciso tirar os sapatos?"),
("急がなくても大丈夫ですよ。", "いそがなくてもだいじょうぶですよ。", "Não precisa ter pressa."),
("高くなくてもいいから、丈夫なかばんがほしいです。", "たかくなくてもいいから、じょうぶなかばんがほしいです。", "Não precisa ser cara, só quero uma bolsa resistente."),
],
R=[
("今日は宿題をし____です。", "Hoje não precisa fazer a lição.", ["なくてもいい"]),
("ここに名前は書か____ですよ。", "Aqui não precisa escrever o nome.", ["なくてもいい"]),
("「お金を払わなくてもいいですか。」「はい、払わ____。」", "\"Não preciso pagar?\" \"Isso, não precisa pagar.\"", ["なくてもいいです", "なくてもいい", "なくても大丈夫です", "なくても大丈夫"]),
("明日は休みだから、早く起き____。", "Amanhã é folga, então não precisa acordar cedo.", ["なくてもいい", "なくてもいいです", "なくても大丈夫", "なくても大丈夫です"]),
("この仕事は日本語が上手____いいです。", "Para este trabalho, não precisa ser bom em japonês.", ["じゃなくても", "でなくても"]),
],
),
]
