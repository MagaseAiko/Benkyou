G = [
dict(
n=61,
jp="〜すぎる",
rd="sugiru",
tr="Demais / Excessivamente",
ex="""すぎる é usado para dizer que algo passou do limite, ou seja, é "demais". Equivale a "demais" ou "excessivamente".

O verbo すぎる sozinho significa "passar", "ultrapassar". Quando é ligado a outra palavra, ele mostra que aquela ação ou característica foi além do normal ou do adequado.

Com verbos, tira-se ます e acrescenta-se すぎる, como em "comer demais". Com adjetivos い, tira-se o い. Com adjetivos な, basta tirar o な.

Na maioria das vezes, すぎる tem um tom negativo: indica que o excesso causou algum problema. Por isso, é comum aparecer na forma すぎて, ligando o excesso ao resultado.

Depois de ligado, すぎる se conjuga como um verbo comum: すぎます, すぎた, すぎて.""",
st="""Verbo na forma ます sem ます + すぎる
Adjetivo い sem い + すぎる
Adjetivo な (sem な) + すぎる

Exceções: いい → よすぎる / ない → なさすぎる

Educado: すぎます
Passado: すぎた / すぎました
Ligando: すぎて

Escrita: すぎる / 過ぎる""",
no="""Na fala jovem, すぎる às vezes é usado de forma positiva, como em elogios exagerados. Mesmo assim, o sentido básico é "passou do ponto".

O substantivo すぎ também existe, como em 食べすぎ e 飲みすぎ, que significam "o excesso de comer" e "o excesso de beber".

Com adjetivos い terminados em ない, como 少ない, a forma é 少なすぎる, sem さ. O さ aparece apenas com ない sozinho e com adjetivos formados com ない.""",
bf="すぎる",
rx="すぎる|すぎます|すぎました|すぎた|すぎて|過ぎる|過ぎます|過ぎた|過ぎて",
tk=["すぎる"],
va=["すぎる", "すぎます", "すぎた", "すぎました", "すぎて", "過ぎる"],
E=[
("昨日は食べすぎました。", "きのうはたべすぎました。", "Ontem comi demais."),
("このかばんは高すぎます。", "このかばんはたかすぎます。", "Esta bolsa é cara demais."),
("この部屋は静かすぎて、ちょっと怖い。", "このへやはしずかすぎて、ちょっとこわい。", "Este quarto é silencioso demais, dá um pouco de medo."),
("お酒を飲みすぎて、頭が痛いです。", "おさけをのみすぎて、あたまがいたいです。", "Bebi demais e estou com dor de cabeça."),
("この問題は難しすぎて、全然わからない。", "このもんだいはむずかしすぎて、ぜんぜんわからない。", "Esta questão é difícil demais, não entendo nada."),
],
R=[
("このカレーは辛____。", "Este curry é apimentado demais.", ["すぎます", "すぎる"]),
("昨日はテレビを見____、目が痛いです。", "Ontem vi TV demais e estou com os olhos doendo.", ["すぎて"]),
("この靴は私には大き____。", "Estes sapatos são grandes demais para mim.", ["すぎます", "すぎる"]),
("昨日の夜、ゲームをし____。", "Ontem à noite, joguei videogame demais.", ["すぎました", "すぎた"]),
("彼の説明は簡単____、よくわかりませんでした。", "A explicação dele foi simples demais, e eu não entendi direito.", ["すぎて"]),
],
),
dict(
n=62,
jp="〜たことがある",
rd="ta koto ga aru",
tr="Já ter feito / Ter a experiência de",
ex="""たことがある é usado para falar de experiências de vida: coisas que a pessoa já fez pelo menos uma vez. Equivale a "já ter feito".

A estrutura junta o verbo no passado (forma た) com こと, que transforma a ação em "a experiência de ter feito", e がある, que indica que essa experiência existe.

Na forma negativa, たことがない significa "nunca ter feito". Em perguntas, たことがありますか pergunta se a pessoa já teve aquela experiência.

Um ponto importante: essa estrutura fala de experiências em geral, sem um momento específico. Por isso, não costuma ser usada com coisas muito recentes ou do dia a dia, como "já comi hoje". Nesses casos, usa-se apenas o passado.""",
st="""Verbo na forma た + ことがある
Verbo na forma た + ことがあります (educado)

Negativo: たことがない / たことがありません
Pergunta: たことがありますか

Com verbos cuja forma た termina em だ: だことがある""",
no="""Para reforçar "nunca", é comum usar 一度も com a forma negativa.

Para dizer quantas vezes você já fez algo, coloca-se o número de vezes antes de ある, como 二回ある.

Não confunda com a forma de dicionário + ことがある, que aparece no N4 e significa "às vezes acontece de...".""",
bf="たことがある",
rx="たことがある|たことがあります|たことがない|たことがありません|だことがある|だことがあります|だことがない|だことがありません",
tk=["た", "こと", "が", "ある"],
va=["たことがある", "たことがあります", "たことがない", "たことがありません", "だことがある", "だことがない"],
E=[
("富士山に登ったことがあります。", "ふじさんにのぼったことがあります。", "Já subi o Monte Fuji."),
("日本の映画を見たことがありますか。", "にほんのえいがをみたことがありますか。", "Você já viu algum filme japonês?"),
("私は一度も海外に行ったことがない。", "わたしはいちどもかいがいにいったことがない。", "Eu nunca fui ao exterior."),
("この本は前に読んだことがあります。", "このほんはまえによんだことがあります。", "Já li este livro antes."),
("納豆を食べたことがありますが、あまり好きじゃありません。", "なっとうをたべたことがありますが、あまりすきじゃありません。", "Já comi natto, mas não gosto muito."),
],
R=[
("京都に行っ____。", "Já fui a Kyoto.", ["たことがあります", "たことがある"]),
("すしを食べ____か。", "Você já comeu sushi?", ["たことがあります"]),
("私は飛行機に乗っ____。", "Eu nunca andei de avião.", ["たことがありません", "たことがない"]),
("この歌は聞い____けど、名前を知りません。", "Já ouvi esta música, mas não sei o nome.", ["たことがある", "たことがあります"]),
("日本の小説を読ん____か。", "Você já leu algum romance japonês?", ["だことがあります"]),
],
),
dict(
n=63,
jp="〜たい",
rd="tai",
tr="Querer (fazer)",
ex="""たい é usado para dizer que você quer fazer alguma coisa. Equivale a "querer" + verbo.

Ele é formado tirando ます do verbo e acrescentando たい. O resultado funciona como um adjetivo い, então se conjuga como tal: たくない (não quero), たかった (queria) e たくなかった (não queria).

O objeto do verbo pode ser marcado com を ou com が. Usar が dá um pouco mais de destaque ao objeto desejado.

たい expressa o desejo interno de quem fala. Por isso, em afirmações, é usado para "eu quero" e, em perguntas, para "você quer?". Para falar do desejo de outra pessoa, usa-se たがっている, ou cita-se o que ela disse.

Para querer uma coisa (substantivo), e não uma ação, usa-se ほしい.""",
st="""Verbo na forma ます sem ます + たい
Verbo sem ます + たいです (educado)

Negativo: たくない / たくないです / たくありません
Passado: たかった / たかったです
Passado negativo: たくなかった

Objeto: Substantivo + を / が + Verbo たい""",
no="""Perguntar a um superior o que ele quer fazer com たいですか pode soar direto demais. Em situações formais, prefere-se uma pergunta mais indireta.

たい é diferente de つもり: たい expressa vontade, enquanto つもり expressa plano ou intenção.

Como たい é um adjetivo い, não se usa だ depois dele.""",
bf="たい",
rx="たい|たくない|たかった|たくなかった|たくありません",
tk=["たい"],
va=["たい", "たいです", "たくない", "たくありません", "たかった", "たくなかった"],
E=[
("いつか日本へ行きたいです。", "いつかにほんへいきたいです。", "Algum dia quero ir ao Japão."),
("冷たい水が飲みたい。", "つめたいみずがのみたい。", "Quero beber água gelada."),
("今日は何もしたくない。", "きょうはなにもしたくない。", "Hoje não quero fazer nada."),
("子供のころ、パイロットになりたかったです。", "こどものころ、パイロットになりたかったです。", "Quando eu era criança, queria ser piloto."),
("将来、何をしたいですか。", "しょうらい、なにをしたいですか。", "O que você quer fazer no futuro?"),
],
R=[
("新しい車を買い____です。", "Quero comprar um carro novo.", ["たい"]),
("疲れたから、早く寝____。", "Estou cansado, então quero dormir cedo.", ["たい", "たいです"]),
("今日は雨だから、出かけ____。", "Hoje está chovendo, então não quero sair.", ["たくない", "たくないです", "たくありません"]),
("子供のころは医者になり____。", "Quando eu era criança, queria ser médico.", ["たかった", "たかったです"]),
("夏休みに何をし____ですか。", "O que você quer fazer nas férias de verão?", ["たい"]),
],
),
dict(
n=64,
jp="〜たり〜たりする",
rd="tari ~ tari suru",
tr="Fazer coisas como... e... / Às vezes... às vezes...",
ex="""たり〜たりする é usado para listar ações como exemplos, sem dizer que são as únicas. Equivale a "fazer coisas como A e B".

Cada verbo da lista vai para a forma た e recebe り. No final, a frase termina com する, que carrega o tempo e o nível de formalidade: します, しました, しています.

A ordem das ações não importa e não indica sequência. A ideia é apenas mostrar alguns exemplos do que se faz ou fez.

Quando os dois verbos são opostos, como vir e não vir, ou quente e frio, a estrutura indica alternância: "às vezes A, às vezes B".

Também é possível usar só um たり para dar um exemplo, deixando subentendido que há outras coisas.""",
st="""Verbo A na forma た + り + Verbo B na forma た + り + する
Verbo na forma た + り + する (um único exemplo)
Adjetivo い sem い + かったり
Substantivo / Adjetivo な + だったり

Com verbos cuja forma た termina em だ: だり""",
no="""Um erro comum é esquecer o する no final. Sem ele, a frase fica incompleta.

Para listar ações em ordem, uma depois da outra, o japonês usa a forma て, e não たり.

Com substantivos, a lista de exemplos é feita com や, que tem uma ideia parecida.""",
bf="たり",
rx="たり|だり",
tk=["たり", "する"],
va=["たり", "だり", "たりする", "たりします", "たりしました"],
E=[
("週末は掃除をしたり、洗濯をしたりします。", "しゅうまつはそうじをしたり、せんたくをしたりします。", "No fim de semana, faço coisas como limpar a casa e lavar roupa."),
("休みの日は本を読んだり、映画を見たりしています。", "やすみのひはほんをよんだり、えいがをみたりしています。", "Nos dias de folga, fico lendo livros, vendo filmes e coisas assim."),
("パーティーで歌ったり踊ったりしました。", "パーティーでうたったりおどったりしました。", "Na festa, cantamos, dançamos e tudo mais."),
("最近、天気は暑かったり寒かったりします。", "さいきん、てんきはあつかったりさむかったりします。", "Ultimamente, o tempo às vezes está quente, às vezes frio."),
("昨日は友達と買い物をしたりして、楽しかったです。", "きのうはともだちとかいものをしたりして、たのしかったです。", "Ontem fiz compras com amigos, entre outras coisas, e foi divertido."),
],
R=[
("日曜日はテレビを見____、ゲームをしたりします。", "No domingo, faço coisas como ver TV e jogar videogame.", ["たり"]),
("夏休みは海で泳い____、山に登ったりしました。", "Nas férias de verão, nadei no mar, subi montanhas e tudo mais.", ["だり"]),
("電車の中で音楽を聞い____、寝たりします。", "No trem, faço coisas como ouvir música e dormir.", ["たり"]),
("彼は授業に来____来なかったりします。", "Ele às vezes vem à aula, às vezes não.", ["たり"]),
("カフェで友達と話し____、お茶を飲んだりしました。", "Na cafeteria, conversei com amigos, tomei chá e coisas assim.", ["たり"]),
],
),
dict(
n=65,
jp="〜てある",
rd="te aru",
tr="Estar feito / Ter sido deixado / Estar preparado",
ex="""てある é usado para descrever o estado de algo que alguém fez de propósito. A ação já terminou, e o resultado continua visível.

A estrutura usa um verbo transitivo, ou seja, um verbo de ação que alguém faz em alguma coisa, como escrever, abrir, colocar e comprar. Esse verbo vai para a forma て e recebe ある.

Existem dois usos principais. O primeiro é descrever o que se vê: algo está escrito, aberto, colocado em algum lugar. Nesse caso, a coisa é marcada com が. O foco está no resultado, e não em quem fez.

O segundo é mostrar que algo foi feito com antecedência, como preparação. Nesse caso, a coisa costuma ser marcada com を e a frase passa a ideia de "já deixei feito".

É diferente de ている com verbos intransitivos, que só descreve um estado, sem a ideia de que alguém fez aquilo de propósito.""",
st="""Substantivo + が + Verbo transitivo na forma て + ある (estado visível)
Substantivo + を + Verbo transitivo na forma て + ある (preparação)

Educado: てあります
Passado: てあった / てありました""",
no="""Compare: 窓が開いている descreve apenas que a janela está aberta. 窓が開けてある mostra que alguém abriu a janela de propósito, e ela continua assim.

てある não é usado com verbos intransitivos, como 開く ou 閉まる.

No uso de preparação, てある fica parecido com ておく, que aparece no N4. ておく foca na ação de preparar, e てある foca no estado já pronto.""",
bf="てある",
rx="てある|てあります|てあった|てありました",
tk=["て", "ある"],
va=["てある", "てあります", "てあった", "てありました"],
E=[
("壁に絵がかけてあります。", "かべにえがかけてあります。", "Tem um quadro pendurado na parede."),
("部屋の窓が開けてあります。", "へやのまどがあけてあります。", "A janela do quarto foi deixada aberta."),
("机の上にメモが置いてある。", "つくえのうえにメモがおいてある。", "Tem um bilhete deixado em cima da mesa."),
("パーティーの飲み物はもう買ってあります。", "パーティーののみものはもうかってあります。", "As bebidas da festa já estão compradas."),
("ホテルはもう予約してありますから、大丈夫ですよ。", "ホテルはもうよやくしてありますから、だいじょうぶですよ。", "O hotel já está reservado, então pode ficar tranquilo."),
],
R=[
("ドアに名前が書い____。", "O nome está escrito na porta.", ["てあります", "てある"]),
("冷蔵庫にビールが冷やし____。", "Tem cerveja gelando na geladeira.", ["てあります", "てある"]),
("誰もいないのに、部屋の電気がつけ____。", "Não tem ninguém, mas a luz do quarto foi deixada acesa.", ["てあります", "てある"]),
("テーブルの上にお皿が並べ____。", "Os pratos estão arrumados em cima da mesa.", ["てあります", "てある"]),
("旅行の切符はもう買っ____から、心配しないで。", "As passagens da viagem já estão compradas, então não se preocupe.", ["てある", "てあります"]),
],
),
dict(
n=66,
jp="〜ている",
rd="te iru",
tr="Estar fazendo / Estar (em um estado) / Costumar fazer",
ex="""ている é uma das estruturas mais importantes do japonês. Ela é formada pelo verbo na forma て + いる e tem três usos principais.

O primeiro é indicar uma ação em andamento, como o nosso gerúndio: estar comendo, estar lendo, estar chovendo.

O segundo é indicar um estado que resultou de uma ação já terminada. Com verbos como casar, morar, saber, abrir e morrer, ている mostra a situação atual, e não uma ação acontecendo. Por exemplo, estar casado significa que a pessoa casou e continua casada.

O terceiro é indicar hábitos ou atividades que a pessoa faz regularmente, como trabalhar em algum lugar ou praticar um esporte toda semana.

O sentido depende do tipo de verbo. Verbos de ação contínua costumam indicar ação em andamento, e verbos de mudança instantânea costumam indicar estado.""",
st="""Verbo na forma て + いる
Verbo na forma て + います (educado)

Negativo: ていない / ていません
Passado: ていた / ていました

Fala informal: Verbo て + る (てる)""",
no="""知っている é usado para "saber" ou "conhecer", mas o negativo é 知らない, e não 知っていない.

Na fala, ている é muito reduzido para てる, e ています para てます.

Para descrever roupas e acessórios que alguém está usando, também se usa ている, porque a pessoa vestiu e continua vestida.""",
bf="ている",
rx="ている|ています|ていた|ていました|でいる|でいます|でいた|でいました|てる",
tk=["て", "いる"],
va=["ている", "ています", "ていた", "ていました", "でいる", "でいます", "てる"],
E=[
("今、雨が降っています。", "いま、あめがふっています。", "Agora está chovendo."),
("弟は部屋で本を読んでいる。", "おとうとはへやでほんをよんでいる。", "Meu irmão mais novo está lendo um livro no quarto."),
("姉は結婚しています。", "あねはけっこんしています。", "Minha irmã mais velha é casada."),
("私は東京に住んでいます。", "わたしはとうきょうにすんでいます。", "Eu moro em Tóquio."),
("毎朝、ジョギングをしています。", "まいあさ、ジョギングをしています。", "Toda manhã, faço corrida."),
],
R=[
("子供たちは公園で遊ん____。", "As crianças estão brincando no parque.", ["でいます", "でいる"]),
("「今、何をしていますか。」「ご飯を食べ____。」", "\"O que você está fazendo agora?\" \"Estou comendo.\"", ["ています"]),
("父は銀行で働い____。", "Meu pai trabalha no banco.", ["ています", "ている"]),
("田中さんの電話番号を知っ____か。", "Você sabe o número de telefone do Tanaka?", ["ています"]),
("あの店はもう閉まっ____。", "Aquela loja já está fechada.", ["ています", "ている"]),
],
),
dict(
n=67,
jp="〜てから",
rd="te kara",
tr="Depois de / Desde que",
ex="""てから é usado para dizer que uma ação acontece depois de outra. Equivale a "depois de fazer...".

A primeira ação fica na forma て + から, e a segunda vem em seguida. A ideia é que a primeira ação precisa terminar antes de a segunda começar. Por isso, てから destaca bem a ordem.

O tempo da frase, presente ou passado, fica no último verbo.

Com expressões de tempo, como "já faz três anos", てから significa "desde que": desde que algo aconteceu, passou certo tempo.""",
st="""Verbo A na forma て + から + Verbo B
Verbo na forma て + から + Período de tempo (desde que)""",
no="""A forma て sozinha também liga ações em sequência, mas てから deixa a ordem mais clara e enfatiza que uma coisa vem só depois da outra.

Não confunda てから com から (porque). A diferença está na forma do verbo: com てから, o verbo está na forma て.

Para expressar "depois de" com o verbo no passado, existe também たあとで, que aparece no N4.""",
bf="てから",
rx="てから|でから",
tk=["て", "から"],
va=["てから", "でから"],
E=[
("手を洗ってから、ご飯を食べます。", "てをあらってから、ごはんをたべます。", "Como depois de lavar as mãos."),
("宿題をしてから、遊びに行きます。", "しゅくだいをしてから、あそびにいきます。", "Vou brincar depois de fazer a lição."),
("昨日はシャワーを浴びてから寝ました。", "きのうはシャワーをあびてからねました。", "Ontem dormi depois de tomar banho."),
("この本を読んでから、感想を書いてください。", "このほんをよんでから、かんそうをかいてください。", "Depois de ler este livro, escreva sua opinião, por favor."),
("日本に来てから、もう三年になります。", "にほんにきてから、もうさんねんになります。", "Já faz três anos desde que vim para o Japão."),
],
R=[
("毎晩、歯を磨い____寝ます。", "Toda noite, durmo depois de escovar os dentes.", ["てから"]),
("電話をかけ____、友達の家に行きました。", "Depois de ligar, fui à casa do meu amigo.", ["てから"]),
("よく考え____、答えてください。", "Pense bem antes de responder, por favor.", ["てから"]),
("薬を飲ん____、少し休みました。", "Depois de tomar o remédio, descansei um pouco.", ["でから"]),
("大学を卒業し____、ずっとこの会社で働いています。", "Desde que me formei na faculdade, trabalho nesta empresa.", ["てから"]),
],
),
dict(
n=68,
jp="〜てください",
rd="te kudasai",
tr="Por favor (faça) / Faça...",
ex="""てください é usado para pedir que alguém faça alguma coisa. Equivale a "por favor, faça..." ou ao imperativo educado do português.

A estrutura junta o verbo na forma て com ください, que vem de くださる, um verbo respeitoso que significa "dar". A ideia literal é "faça isso por mim, por favor".

É usado em pedidos, instruções, orientações e convites gentis, como "entre, por favor" ou "fique à vontade".

Apesar de educado, てください ainda é um pedido direto. Com superiores ou desconhecidos, em pedidos maiores, o japonês prefere formas mais suaves, como てくださいませんか.

Na fala informal, ください costuma ser omitido, e o pedido fica só com a forma て.""",
st="""Verbo na forma て + ください
Verbo na forma て (informal, entre amigos e família)

Mais suave: てくださいませんか / てくれませんか""",
no="""Em instruções de professores, médicos e funcionários, てください é muito comum e não soa rude, porque faz parte do papel da pessoa orientar.

O oposto, para pedir que alguém não faça algo, é ないでください.

Para pedir uma coisa, e não uma ação, usa-se をください.""",
bf="てください",
rx="てください|でください",
tk=["て", "ください"],
va=["てください", "でください"],
E=[
("ちょっと待ってください。", "ちょっとまってください。", "Espere um pouco, por favor."),
("ここに名前を書いてください。", "ここになまえをかいてください。", "Escreva seu nome aqui, por favor."),
("もう少しゆっくり話してください。", "もうすこしゆっくりはなしてください。", "Fale um pouco mais devagar, por favor."),
("この本を読んでください。", "このほんをよんでください。", "Leia este livro, por favor."),
("駅に着いたら、電話してください。", "えきについたら、でんわしてください。", "Quando chegar à estação, me ligue, por favor."),
],
R=[
("暑いですね。窓を開け____。", "Está quente, né. Abra a janela, por favor.", ["てください"]),
("教科書の十ページを見____。", "Olhem a página dez do livro, por favor.", ["てください"]),
("時間がありません。早く来____。", "Não temos tempo. Venha rápido, por favor.", ["てください"]),
("この薬を一日三回飲ん____。", "Tome este remédio três vezes ao dia, por favor.", ["でください"]),
("わからないときは、いつでも聞い____ね。", "Quando não entender, pode perguntar a qualquer hora, tá?", ["てください"]),
],
),
dict(
n=69,
jp="〜てはいけない",
rd="te wa ikenai",
tr="Não pode / É proibido / Não deve",
ex="""てはいけない é usado para dizer que algo é proibido ou não deve ser feito. Equivale a "não pode" ou "é proibido".

Literalmente, a estrutura significa "fazer isso não está bem". O verbo vai para a forma て, recebe は e depois いけない. Quando a forma て termina em で, a estrutura fica ではいけない.

É usada para regras, leis, proibições e conselhos firmes. Pais, professores e avisos públicos usam muito essa forma.

Na forma educada, fica てはいけません. Na fala do dia a dia, é comum a versão contraída ちゃいけない / じゃいけない.

Por ser forte, てはいけない não costuma ser usado para proibir algo diretamente a um superior. Nesses casos, prefere-se uma forma indireta.""",
st="""Verbo na forma て + は + いけない
Verbo na forma て (terminada em で) + は + いけない

Educado: てはいけません
Contração falada: ちゃいけない / じゃいけない""",
no="""Para responder a um pedido de permissão feito com てもいいですか, a resposta negativa natural é いいえ、〜てはいけません, mas muitas vezes os japoneses suavizam com すみません、ちょっと….

As formas てはだめ e ちゃだめ têm sentido parecido e são mais coloquiais.

O oposto de てはいけない é てもいい (pode fazer).""",
bf="てはいけない",
rx="てはいけない|てはいけません|ではいけない|ではいけません",
tk=["て", "は", "いけない"],
va=["てはいけない", "てはいけません", "ではいけない", "ではいけません"],
E=[
("ここでタバコを吸ってはいけません。", "ここでタバコをすってはいけません。", "Não é permitido fumar aqui."),
("授業中に携帯電話を使ってはいけない。", "じゅぎょうちゅうにけいたいでんわをつかってはいけない。", "Não pode usar o celular durante a aula."),
("この川で泳いではいけません。", "このかわでおよいではいけません。", "Não é permitido nadar neste rio."),
("美術館の中で写真を撮ってはいけません。", "びじゅつかんのなかでしゃしんをとってはいけません。", "Não é permitido tirar fotos dentro do museu."),
("人の悪口を言ってはいけないよ。", "ひとのわるくちをいってはいけないよ。", "Não se deve falar mal dos outros."),
],
R=[
("図書館で食べ物を食べ____。", "Não é permitido comer na biblioteca.", ["てはいけません", "てはいけない"]),
("ここに車を止め____。", "Não é permitido estacionar aqui.", ["てはいけません", "てはいけない"]),
("テストのとき、辞書を見____。", "Durante a prova, não pode olhar o dicionário.", ["てはいけません", "てはいけない"]),
("お酒を飲んだら、車を運転し____。", "Depois de beber, não se deve dirigir.", ["てはいけません", "てはいけない"]),
("このボタンを押し____と言われました。", "Me disseram que não posso apertar este botão.", ["てはいけない"]),
],
),
dict(
n=70,
jp="〜てもいいです",
rd="te mo ii desu",
tr="Pode / É permitido / Tudo bem se",
ex="""てもいいです é usado para dar ou pedir permissão. Equivale a "pode" ou "tudo bem se...".

Literalmente, a estrutura significa "mesmo fazendo isso, está bom". Ou seja, a ação é aceitável.

Em perguntas, てもいいですか é a forma padrão de pedir permissão educadamente, como "posso abrir a janela?". Em afirmações, serve para permitir algo a alguém.

Na fala informal, usa-se てもいい?, sem です. E, para soar mais leve, também se usa ても大丈夫.""",
st="""Verbo na forma て + も + いい / いいです
Pergunta: Verbo て + もいいですか
Informal: Verbo て + もいい？

Variações: ても大丈夫 / てもかまいません (mais formal)""",
no="""Para responder positivamente a um pedido de permissão, as respostas mais comuns são はい、どうぞ e ええ、いいですよ.

Para negar, os japoneses costumam suavizar com すみません、ちょっと…, em vez de dizer てはいけません diretamente.

O oposto de てもいい é てはいけない. E o oposto de "precisar" é なくてもいい.""",
bf="てもいい",
rx="てもいい|でもいい|ても大丈夫|でも大丈夫|てもかまいません|でもかまいません",
tk=["て", "も", "いい"],
va=["てもいい", "てもいいです", "でもいい", "ても大丈夫", "てもかまいません"],
E=[
("窓を開けてもいいですか。", "まどをあけてもいいですか。", "Posso abrir a janela?"),
("ここで写真を撮ってもいいです。", "ここでしゃしんをとってもいいです。", "Pode tirar fotos aqui."),
("この本、借りてもいい？", "このほん、かりてもいい？", "Posso pegar este livro emprestado?"),
("「入ってもいいですか。」「はい、どうぞ。」", "「はいってもいいですか。」「はい、どうぞ。」", "\"Posso entrar?\" \"Sim, fique à vontade.\""),
("鉛筆で書いても大丈夫ですよ。", "えんぴつでかいてもだいじょうぶですよ。", "Tudo bem se escrever a lápis."),
],
R=[
("すみません、ちょっとトイレに行っ____か。", "Com licença, posso ir ao banheiro rapidinho?", ["てもいいです"]),
("ここに座っ____か。", "Posso me sentar aqui?", ["てもいいです"]),
("疲れたら、休ん____ですよ。", "Se ficar cansado, pode descansar.", ["でもいい"]),
("このペン、使っ____？", "Posso usar esta caneta?", ["てもいい"]),
("「タバコを吸っ____か。」「すみません、ここはちょっと…。」", "\"Posso fumar?\" \"Desculpe, aqui não dá...\"", ["てもいいです"]),
],
),
]
