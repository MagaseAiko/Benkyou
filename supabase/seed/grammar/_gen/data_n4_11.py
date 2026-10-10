G = [
dict(
n=101,
jp="〜てしまう・〜ちゃう",
rd="te shimau / chau",
tr="Acabar fazendo / Fazer sem querer / Terminar completamente",
ex="""てしまう tem dois usos principais.

O primeiro é indicar que uma ação foi concluída completamente, até o fim. Por exemplo, terminar toda a lição ou ler o livro inteiro. Com たい, expressa vontade de acabar logo com algo.

O segundo, muito comum, é expressar arrependimento, lamento ou que algo aconteceu sem querer. Por exemplo, esquecer o guarda-chuva no trem ou quebrar um prato importante. O tom é de "acabei fazendo isso" ou "que pena".

Às vezes, os dois sentidos se misturam, e o contexto mostra se o tom é neutro ou de lamento.

Na fala casual, てしまう é reduzido para ちゃう, e でしまう para じゃう. No passado, ficam ちゃった e じゃった.""",
st="""Verbo na forma て + しまう

Educado: てしまいます
Passado: てしまった / てしまいました
Fala casual: てしまう → ちゃう / でしまう → じゃう
Passado casual: ちゃった / じゃった""",
no="""ちゃった e じゃった são extremamente comuns na conversa do dia a dia, principalmente para contar pequenos acidentes ou erros.

Em algumas regiões, existe ainda a forma てまう, típica do dialeto de Kansai.

Compare: 忘れた apenas informa o fato; 忘れてしまった mostra que a pessoa lamenta ter esquecido.""",
bf="てしまう",
rx="てしま|でしま|ちゃう|ちゃった|じゃう|じゃった|ちゃいま|じゃいま",
tk=["て", "しまう"],
va=["てしまう", "てしまった", "てしまいました", "ちゃう", "ちゃった", "じゃう", "じゃった"],
E=[
("昨日の夜、宿題を全部やってしまいました。", "きのうのよる、しゅくだいをぜんぶやってしまいました。", "Ontem à noite, terminei toda a lição."),
("電車の中に傘を忘れてしまった。", "でんしゃのなかにかさをわすれてしまった。", "Acabei esquecendo o guarda-chuva no trem."),
("ケーキを全部食べちゃった。", "ケーキをぜんぶたべちゃった。", "Acabei comendo o bolo inteiro."),
("大事な皿を割ってしまいました。", "だいじなさらをわってしまいました。", "Acabei quebrando um prato importante."),
("早くこの本を読んでしまいたい。", "はやくこのほんをよんでしまいたい。", "Quero terminar de ler este livro logo."),
],
R=[
("駅で財布をなくし____。", "Acabei perdendo a carteira na estação.", ["てしまいました", "てしまった", "ちゃった"]),
("寝坊して、授業に遅れ____。", "Dormi demais e acabei me atrasando para a aula.", ["てしまいました", "てしまった", "ちゃった"]),
("今日中にこの仕事をやっ____ます。", "Vou terminar este trabalho ainda hoje.", ["てしまい"]),
("つい、友達の秘密を話し____。", "Sem querer, acabei contando o segredo do meu amigo.", ["てしまった", "ちゃった", "てしまいました"]),
("間違えて、人のジュースを飲ん____。", "Por engano, acabei bebendo o suco de outra pessoa.", ["でしまった", "じゃった", "でしまいました"]),
],
),
dict(
n=102,
jp="〜てすみません",
rd="te sumimasen",
tr="Desculpe por / Perdão por",
ex="""てすみません é usado para pedir desculpas por algo que você fez, ou deixou de fazer. Equivale a "desculpe por..." ou "perdão por...".

Ele junta a forma て do verbo, que aqui indica o motivo, com すみません. Assim, a frase explica exatamente pelo que a pessoa está se desculpando.

Para algo que já aconteceu e terminou, como faltar a uma aula ontem, usa-se すみませんでした.

Na forma negativa, なくてすみません pede desculpas por não ter feito algo.

Entre amigos, usa-se てごめん ou てごめんね, que são mais informais.""",
st="""Verbo na forma て + すみません
Verbo na forma て + すみませんでした (fato já concluído)
Verbo na forma ない sem い + くてすみません (por não ter feito)

Informal: 〜てごめん / 〜てごめんね
Mais formal: 〜て申し訳ありません""",
no="""Em situações de trabalho, a forma mais formal é 〜て申し訳ありません ou 〜て申し訳ございません.

お待たせしてすみません é uma frase muito comum quando alguém fez outra pessoa esperar.

Os japoneses pedem desculpas com frequência, inclusive por pequenos incômodos, como interromper alguém.""",
bf="てすみません",
rx="てすみません|んですみません|てごめん|んでごめん",
tk=["て", "すみません"],
va=["てすみません", "てすみませんでした", "てごめん"],
E=[
("遅れてすみません。", "おくれてすみません。", "Desculpe o atraso."),
("お待たせしてすみません。", "おまたせしてすみません。", "Desculpe por fazê-lo esperar."),
("昨日は授業を休んですみませんでした。", "きのうはじゅぎょうをやすんですみませんでした。", "Desculpe por ter faltado à aula ontem."),
("ご迷惑をかけてすみません。", "ごめいわくをかけてすみません。", "Desculpe pelo incômodo."),
("返事が遅くなってごめんね。", "へんじがおそくなってごめんね。", "Desculpa a demora para responder."),
],
R=[
("夜遅くに電話し____。", "Desculpe por ligar tão tarde da noite.", ["てすみません"]),
("約束を忘れ____でした。", "Desculpe por ter esquecido o compromisso.", ["てすみません"]),
("お役に立てなく____。", "Desculpe por não ter podido ajudar.", ["てすみません"]),
("昨日は急に休ん____。", "Desculpe por ter faltado de repente ontem.", ["ですみません"]),
("たくさん待たせ____ね。", "Desculpa por te fazer esperar tanto, tá?", ["てごめん"]),
],
),
dict(
n=103,
jp="〜てやる",
rd="te yaru",
tr="Fazer (algo) para alguém (inferior) / Vou mostrar que...",
ex="""てやる tem dois usos principais.

O primeiro é parecido com てあげる: fazer algo em benefício de alguém. A diferença é que てやる é usado para pessoas em posição inferior ou muito próximas, como filhos, irmãos mais novos, e também para animais e plantas. O tom é informal.

O segundo uso expressa uma determinação forte, muitas vezes com raiva ou desafio. É como dizer "vou mostrar que..." ou "eu vou...!". Por exemplo, "da próxima vez, eu vou ganhar de qualquer jeito!".

Por ser informal e às vezes rude, てやる deve ser usado com cuidado. Com pessoas que não são próximas, o mais adequado é てあげる.""",
st="""Pessoa / Animal + に + Verbo na forma て + やる

Passado: てやった / てやりました
Determinação: 〜てやる！ / 〜てやろう""",
no="""Na fala de alguns pais, てやる é natural ao falar do que fazem pelos filhos. Hoje, muitas pessoas preferem てあげる por soar mais gentil.

No uso de desafio, てやる aparece muito em mangás, animes e filmes, em falas de personagens determinados ou revoltados.

O verbo やる sozinho também significa "dar" para inferiores, animais e plantas, como dar comida ao cachorro ou água às flores.""",
bf="てやる",
rx="てやる|てやった|てやり|てやろう|でやる|でやった|でやり",
tk=["て", "やる"],
va=["てやる", "てやった", "てやりました", "でやる"],
E=[
("弟に宿題を手伝ってやった。", "おとうとにしゅくだいをてつだってやった。", "Ajudei meu irmão mais novo com a lição."),
("毎朝、犬を散歩に連れていってやる。", "まいあさ、いぬをさんぽにつれていってやる。", "Toda manhã, levo o cachorro para passear."),
("息子に新しい自転車を買ってやりました。", "むすこにあたらしいじてんしゃをかってやりました。", "Comprei uma bicicleta nova para o meu filho."),
("今度こそ、絶対に勝ってやる。", "こんどこそ、ぜったいにかってやる。", "Desta vez, eu vou ganhar de qualquer jeito!"),
("寝る前に、子供に絵本を読んでやった。", "ねるまえに、こどもにえほんをよんでやった。", "Antes de dormir, li um livro ilustrado para meu filho."),
],
R=[
("娘におもちゃを買っ____。", "Comprei um brinquedo para minha filha.", ["てやった", "てやりました"]),
("猫に特別なえさを作っ____。", "Fiz uma comida especial para o gato.", ["てやった", "てやりました"]),
("弟にきれいな字の書き方を教え____。", "Ensinei meu irmão mais novo a escrever com letra bonita.", ["てやった", "てやりました"]),
("次の試合では必ず勝っ____。", "No próximo jogo, eu vou ganhar sem falta!", ["てやる"]),
("子供に昔話を読ん____。", "Li uma história antiga para meu filho.", ["でやった", "でやりました"]),
],
),
dict(
n=104,
jp="〜てよかった",
rd="te yokatta",
tr="Que bom que / Ainda bem que",
ex="""てよかった é usado para expressar alívio ou satisfação com algo que aconteceu. Equivale a "que bom que..." ou "ainda bem que...".

Ele junta a forma て, que aqui indica o motivo, com よかった, o passado de いい. A ideia é "por ter acontecido isso, foi bom".

É usado tanto para coisas que a própria pessoa fez, como ter levado um guarda-chuva, quanto para situações em geral, como todos estarem bem.

Na forma negativa, なくてよかった significa "ainda bem que não...", como ainda bem que não houve acidente.

Com substantivos e adjetivos な, usa-se でよかった.""",
st="""Verbo na forma て + よかった
Verbo na forma ない sem い + くてよかった (ainda bem que não)
Adjetivo い sem い + くてよかった
Substantivo / Adjetivo な + でよかった

Educado: てよかったです""",
no="""Para arrependimento, o oposto é ばよかった (devia ter feito), que aparece no N3.

A frase 会えてよかった, "foi bom te conhecer", é muito usada em despedidas.

Muitas vezes, てよかった vem com ね, buscando a concordância do outro: "ainda bem, né?".""",
bf="てよかった",
rx="てよかった|でよかった",
tk=["て", "よかった"],
va=["てよかった", "てよかったです", "でよかった", "なくてよかった"],
E=[
("日本に来てよかったです。", "にほんにきてよかったです。", "Foi muito bom ter vindo ao Japão."),
("早く出かけてよかった。", "はやくでかけてよかった。", "Ainda bem que saí cedo."),
("あなたに会えてよかった。", "あなたにあえてよかった。", "Foi muito bom te conhecer."),
("急に雨が降ったけど、傘を持ってきてよかったね。", "きゅうにあめがふったけど、かさをもってきてよかったね。", "Choveu de repente, mas ainda bem que trouxemos o guarda-chuva, né?"),
("みんな元気でよかった。", "みんなげんきでよかった。", "Que bom que todos estão bem."),
],
R=[
("この大学に入っ____です。", "Que bom que entrei nesta faculdade.", ["てよかった"]),
("試験に合格でき____。", "Ainda bem que consegui passar na prova.", ["てよかった", "てよかったです"]),
("大きな事故がなく____ですね。", "Ainda bem que não houve nenhum acidente grave, né?", ["てよかった"]),
("薬を飲ん____。もう元気だ。", "Ainda bem que tomei o remédio. Já estou bem.", ["でよかった"]),
("雨がやん____ね。", "Que bom que a chuva parou, né?", ["でよかった"]),
],
),
dict(
n=105,
jp="〜ているところ",
rd="te iru tokoro",
tr="Estar fazendo (neste momento) / Estar no meio de",
ex="""ているところ é usado para dizer que uma ação está acontecendo exatamente agora, e que a pessoa está no meio dela. Equivale a "estou fazendo isso neste momento" ou "estou no meio de...".

Ele junta a forma ている com ところ, que significa "ponto" ou "momento". A ideia é "estou no ponto de estar fazendo isso".

Comparado a ている, ているところ destaca mais o momento atual e a ideia de que a ação ainda não terminou. É muito usado para explicar por que você não pode fazer outra coisa agora, ou para responder perguntas sobre o andamento de algo.

Também é usado para atividades em andamento por um período, como estar procurando emprego.""",
st="""Verbo na forma て + いるところ + です / だ
今 + Verbo て + いるところです""",
no="""ているところ completa o trio com ところ: るところ (prestes a fazer), ているところ (no meio de fazer) e たところ (acabou de fazer).

É uma forma educada de pedir que alguém espere, explicando que você está ocupado com algo naquele momento.

Na fala casual, também se ouve てるところ.""",
bf="ているところ",
rx="ているところ|でいるところ",
tk=["ている", "ところ"],
va=["ているところ", "でいるところ", "てるところ"],
E=[
("今、ご飯を食べているところです。", "いま、ごはんをたべているところです。", "Estou comendo agora."),
("母は今、電話をしているところだ。", "はははいま、でんわをしているところだ。", "Minha mãe está ao telefone neste momento."),
("今、その問題について考えているところです。", "いま、そのもんだいについてかんがえているところです。", "Estou pensando nesse problema agora."),
("「宿題は？」「今やっているところ。」", "「しゅくだいは？」「いまやっているところ。」", "\"E a lição?\" \"Estou fazendo agora.\""),
("兄は今、新しい仕事を探しているところです。", "あにはいま、あたらしいしごとをさがしているところです。", "Meu irmão mais velho está procurando um novo emprego no momento."),
],
R=[
("今、メールを書い____です。", "Estou escrevendo um e-mail agora.", ["ているところ"]),
("「もしもし、今大丈夫？」「ごめん、今運転し____なんだ。」", "\"Alô, pode falar agora?\" \"Desculpa, estou dirigindo agora.\"", ["ているところ"]),
("今、駅に向かっ____です。", "Estou indo para a estação agora.", ["ているところ"]),
("弟は今、お風呂に入っ____。", "Meu irmão mais novo está no banho agora.", ["ているところです", "ているところだ"]),
("今、資料を読ん____ですから、少し待ってください。", "Estou lendo os documentos agora, então espere um pouco, por favor.", ["でいるところ"]),
],
),
dict(
n=106,
jp="〜ても",
rd="te mo",
tr="Mesmo que / Ainda que / Por mais que",
ex="""ても é usado para dizer que o resultado não muda, mesmo que uma condição aconteça. Equivale a "mesmo que", "ainda que" ou "por mais que".

Ele é formado pela forma て + も. A primeira parte apresenta uma situação que poderia mudar algo, e a segunda mostra que, mesmo assim, o resultado continua o mesmo.

Com palavras como いくら e 何度, forma expressões como "por mais que coma" ou "por mais vezes que leia", destacando que o esforço não muda o resultado.

Com adjetivos い, usa-se くても. Com substantivos e adjetivos な, usa-se でも.

A condição pode ser hipotética ("mesmo que chova amanhã") ou real ("mesmo tendo tomado remédio").""",
st="""Verbo na forma て + も
Adjetivo い sem い + くても
Substantivo / Adjetivo な + でも
いくら / 何度 / どんなに + … + ても (por mais que)

Negativo: Verbo ない sem い + くても""",
no="""Para reforçar a ideia de hipótese, usa-se たとえ no começo: たとえ雨が降っても.

Não confunda com てもいい (permissão), que usa a mesma forma, mas com いい depois.

Com palavras interrogativas, como 何を食べても, a ideia é "não importa o que...".""",
bf="ても",
rx="ても|でも",
tk=["て", "も"],
va=["ても", "でも", "くても"],
E=[
("明日雨が降っても、試合をします。", "あしたあめがふっても、しあいをします。", "Mesmo que chova amanhã, vamos jogar."),
("彼はいくら食べても、太らない。", "かれはいくらたべても、ふとらない。", "Por mais que coma, ele não engorda."),
("高くても、この本が欲しい。", "たかくても、このほんがほしい。", "Mesmo que seja caro, quero este livro."),
("この店は、日曜日でも開いています。", "このみせは、にちようびでもあいています。", "Esta loja abre mesmo aos domingos."),
("何度読んでも、意味がわからない。", "なんどよんでも、いみがわからない。", "Por mais que eu leia, não entendo o sentido."),
],
R=[
("薬を飲ん____、熱が下がらない。", "Mesmo tomando remédio, a febre não baixa.", ["でも"]),
("疲れ____、毎日走ります。", "Mesmo cansado, corro todo dia.", ["ても"]),
("安く____、品質が悪い物は買いません。", "Mesmo que seja barato, não compro coisas de má qualidade.", ["ても"]),
("この問題は簡単だから、子供____解けます。", "Esta questão é fácil, então até uma criança consegue resolver.", ["でも"]),
("何回電話し____、彼は出ない。", "Por mais que eu ligue, ele não atende.", ["ても"]),
],
),
dict(
n=107,
jp="〜と（条件）",
rd="to (jouken)",
tr="Quando / Sempre que / Se",
ex="""と também funciona como condicional. Ele indica que, quando algo acontece, um resultado vem naturalmente ou automaticamente. Equivale a "quando", "sempre que" ou "se".

A ideia principal é de consequência inevitável: fenômenos naturais, funcionamento de máquinas, caminhos, hábitos e verdades gerais. Por exemplo, "quando chega a primavera, as cerejeiras florescem" ou "se apertar este botão, a porta abre".

Ele vem depois da forma de dicionário do verbo, ou da forma simples de adjetivos e substantivos com だ.

Por causa dessa ideia de "automático", a segunda parte não pode ser um pedido, um convite ou uma vontade.

No passado, と também pode indicar uma descoberta: "quando fiz isso, aconteceu tal coisa".""",
st="""Verbo na forma de dicionário + と
Verbo na forma ない + と
Adjetivo い + と
Substantivo / Adjetivo な + だ + と""",
no="""Para dar instruções de caminho, と é a escolha mais natural: まっすぐ行くと、〜があります.

Se a segunda parte for um pedido ou intenção, troque と por たら.

Não confunda com と de "e" (lista) e com と de "com" (companhia).""",
bf="と",
rx="と",
tk=["と"],
va=["と"],
E=[
("春になると、桜が咲きます。", "はるになると、さくらがさきます。", "Quando chega a primavera, as cerejeiras florescem."),
("このボタンを押すと、ドアが開きます。", "このボタンをおすと、ドアがあきます。", "Se apertar este botão, a porta abre."),
("この道をまっすぐ行くと、右に駅があります。", "このみちをまっすぐいくと、みぎにえきがあります。", "Seguindo reto por esta rua, a estação fica à direita."),
("父はお酒を飲むと、顔が赤くなる。", "ちちはおさけをのむと、かおがあかくなる。", "Sempre que meu pai bebe, o rosto dele fica vermelho."),
("窓を開けると、海が見えた。", "まどをあけると、うみがみえた。", "Quando abri a janela, deu para ver o mar."),
],
R=[
("夏になる____、暑くなります。", "Quando chega o verão, esquenta.", ["と"]),
("この道をまっすぐ行く____、銀行があります。", "Seguindo reto por esta rua, tem um banco.", ["と"]),
("一に二を足す____、三になる。", "Somando dois a um, dá três.", ["と"]),
("母は寝不足だ____、機嫌が悪い。", "Quando minha mãe dorme pouco, fica de mau humor.", ["と"]),
("ドアを開ける____、猫が入ってきた。", "Quando abri a porta, o gato entrou.", ["と"]),
],
),
dict(
n=108,
jp="〜と言ってもいい",
rd="to itte mo ii",
tr="Pode-se dizer que / Não seria exagero dizer que",
ex="""と言ってもいい é usado para fazer uma afirmação forte, mas com um pouco de cautela. Equivale a "pode-se dizer que" ou "não seria exagero dizer que".

A ideia literal é "mesmo dizendo que é assim, está tudo bem". Quem fala reconhece que talvez não seja exatamente aquilo, mas acha que a descrição é justa.

É muito usado para elogiar ou avaliar algo de forma enfática, como dizer que alguém é praticamente um gênio ou que um lugar é o mais bonito do país.

Com でしょう ou くらい, a frase fica ainda mais suave e natural.""",
st="""Substantivo + と言ってもいい
Frase (forma simples) + と言ってもいい
… + と言ってもいいでしょう / と言ってもいいくらいだ

Escrita: と言ってもいい / といってもいい""",
no="""Em textos formais, aparece a forma と言っても過言ではない, que significa "não é exagero dizer que".

Essa estrutura é ótima para dar opiniões fortes sem parecer arrogante.

Não confunda com といっても, que significa "embora se diga que..." e introduz uma ressalva.""",
bf="と言ってもいい",
rx="と言ってもいい|といってもいい|と言ってもよい",
tk=["と", "言って", "も", "いい"],
va=["と言ってもいい", "と言ってもいいでしょう", "といってもいい"],
E=[
("彼はこの町で一番の料理人と言ってもいい。", "かれはこのまちでいちばんのりょうりにんといってもいい。", "Pode-se dizer que ele é o melhor cozinheiro desta cidade."),
("今回の試験は成功と言ってもいいでしょう。", "こんかいのしけんはせいこうといってもいいでしょう。", "Pode-se dizer que o teste desta vez foi um sucesso."),
("ここは日本で最も美しい場所と言ってもいい。", "ここはにほんでもっともうつくしいばしょといってもいい。", "Não seria exagero dizer que aqui é o lugar mais bonito do Japão."),
("彼女はもう家族と言ってもいい存在です。", "かのじょはもうかぞくといってもいいそんざいです。", "Ela já é praticamente da família."),
("毎日練習しているので、もうプロと言ってもいいくらいだ。", "まいにちれんしゅうしているので、もうプロといってもいいくらいだ。", "Ele treina todo dia, então já dá para dizer que é quase profissional."),
],
R=[
("この映画は今年最高の作品____でしょう。", "Pode-se dizer que este filme é a melhor obra do ano.", ["と言ってもいい"]),
("あんなに難しい問題がすぐ解けるなんて、彼は天才____。", "Resolver uma questão tão difícil na hora? Pode-se dizer que ele é um gênio.", ["と言ってもいい", "と言ってもいいでしょう"]),
("このプロジェクトはほぼ完成____。", "Pode-se dizer que este projeto está praticamente concluído.", ["と言ってもいい", "と言ってもいいでしょう"]),
("彼にとって、サッカーは人生そのもの____。", "Para ele, pode-se dizer que o futebol é a própria vida.", ["と言ってもいい", "と言ってもいいでしょう"]),
("東京は世界一便利な町____かもしれない。", "Talvez se possa dizer que Tóquio é a cidade mais prática do mundo.", ["と言ってもいい"]),
],
),
dict(
n=109,
jp="〜という",
rd="to iu",
tr="Chamado / De nome / Que diz que",
ex="""という é usado para dar o nome de algo ou para explicar o conteúdo de algo. Equivale a "chamado", "de nome" ou "que diz que".

O primeiro uso é apresentar nomes de pessoas, lugares, lojas, filmes e coisas que o ouvinte pode não conhecer. Por exemplo, "uma loja chamada Sakura".

O segundo uso é explicar o conteúdo de uma informação, como uma notícia, um boato ou uma ideia. Por exemplo, "a história de que ele vai sair da empresa".

Também aparece em perguntas como 何という〜ですか, para perguntar o nome de algo.

Na fala casual, という costuma virar っていう.""",
st="""Nome + という + Substantivo (chamado...)
Frase (forma simples) + という + Substantivo (話 / 噂 / ニュース)
何 + という + Substantivo + ですか

Fala casual: っていう
Escrita: という / と言う""",
no="""Quando o nome é desconhecido para o ouvinte, usar という é mais natural do que apresentar o nome direto.

Na forma escrita, quando という tem sentido de "chamado" ou de explicação, costuma ser escrito em hiragana.

A pergunta これは日本語で何といいますか, "como se diz isso em japonês?", é uma das frases mais úteis para estudantes.""",
bf="という",
rx="という|と言う|っていう",
tk=["と", "いう"],
va=["という", "と言う", "っていう"],
E=[
("「さくら」という店を知っていますか。", "「さくら」というみせをしっていますか。", "Você conhece uma loja chamada \"Sakura\"?"),
("田中という人から電話がありました。", "たなかというひとからでんわがありました。", "Uma pessoa chamada Tanaka ligou."),
("これは何という花ですか。", "これはなんというはなですか。", "Como se chama esta flor?"),
("北海道の小樽という町に行きました。", "ほっかいどうのおたるというまちにいきました。", "Fui a uma cidade chamada Otaru, em Hokkaido."),
("彼が会社をやめるという話を聞きました。", "かれがかいしゃをやめるというはなしをききました。", "Ouvi a história de que ele vai sair da empresa."),
],
R=[
("「となりのトトロ」____映画を見たことがありますか。", "Você já viu o filme chamado \"Meu Amigo Totoro\"?", ["という"]),
("受付に山田____方がいらっしゃっています。", "Há uma pessoa chamada Yamada na recepção.", ["という"]),
("これは日本語で何____んですか。", "Como se diz isso em japonês?", ["という", "と言う"]),
("来月、駅前に新しい店ができる____うわさがある。", "Há um boato de que vai abrir uma loja nova em frente à estação no mês que vem.", ["という"]),
("鈴木____先生を探しています。", "Estou procurando um professor chamado Suzuki.", ["という"]),
],
),
dict(
n=110,
jp="〜ということ",
rd="to iu koto",
tr="O fato de que / Que / Quer dizer que",
ex="""ということ é usado para transformar uma frase inteira em um substantivo, como "o fato de que...". Ele junta という (que diz que) com こと (fato, coisa).

O primeiro uso é falar de uma informação ou fato como um todo, como ouvir que alguém se casou ou esquecer que amanhã era folga.

O segundo uso é explicar ou definir o sentido de algo. Por exemplo, "o mais importante é continuar todo dia".

O terceiro uso é confirmar uma conclusão, com ということですか: "então quer dizer que...?".

Comparado a こと sozinho, ということ deixa mais claro que se trata de um conteúdo, uma informação ou uma ideia.""",
st="""Frase (forma simples) + ということ + を / が / は
Frase + ということです (explicação / definição)
つまり + … + ということですか (confirmação)

Fala casual: ってこと""",
no="""Com substantivos e adjetivos な, coloca-se だ antes de ということ: 休みだということ.

A expressão つまり〜ということですか é muito útil para confirmar se você entendeu o que alguém disse.

Em níveis seguintes, ということだ também aparece com o sentido de "dizem que".""",
bf="ということ",
rx="ということ|ってこと",
tk=["という", "こと"],
va=["ということ", "ということです", "ってこと"],
E=[
("彼が結婚したということを聞いて、驚いた。", "かれがけっこんしたということをきいて、おどろいた。", "Fiquei surpreso ao saber que ele se casou."),
("明日は休みだということを忘れていた。", "あしたはやすみだということをわすれていた。", "Eu tinha esquecido que amanhã era folga."),
("大切なのは、毎日続けるということです。", "たいせつなのは、まいにちつづけるということです。", "O importante é continuar todo dia."),
("つまり、行けないということですか。", "つまり、いけないということですか。", "Então quer dizer que você não pode ir?"),
("日本語が難しいということは、よくわかっています。", "にほんごがむずかしいということは、よくわかっています。", "Eu sei muito bem que o japonês é difícil."),
],
R=[
("会議が中止になった____を、誰から聞きましたか。", "De quem você ouviu que a reunião foi cancelada?", ["ということ"]),
("健康が一番大切だ____が、病気になってわかった。", "Quando fiquei doente, entendi que a saúde é o mais importante.", ["ということ"]),
("「明日は雨です。」「じゃあ、ピクニックは中止____ですね。」", "\"Amanhã vai chover.\" \"Então quer dizer que o piquenique está cancelado, né?\"", ["ということ"]),
("彼が来ない____は、もう知っています。", "Já sei que ele não vem.", ["ということ"]),
("一番大切なのは、あきらめない____だ。", "O mais importante é não desistir.", ["ということ"]),
],
),
]
