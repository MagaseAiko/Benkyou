G = [
dict(
n=61,
jp="〜の中で",
rd="no naka de",
tr="Dentro de / Entre / Em meio a",
ex="""の中で significa literalmente "dentro de". No N4, ele aparece com dois usos principais.

O primeiro é físico: indica o lugar fechado ou o ambiente onde uma ação acontece, como dentro de uma caixa, dentro do carro ou no meio da chuva.

O segundo é delimitar um grupo ou um conjunto, com o sentido de "entre". Ele mostra o grupo dentro do qual se faz uma comparação ou uma observação, como "entre os livros que já li" ou "na minha família".

No segundo uso, ele aparece muito com 一番 e だけ, para destacar um elemento do grupo.

Também pode indicar uma situação ou circunstância ampla, como "em meio a um dia a dia corrido".""",
st="""Substantivo (lugar / espaço) + の中で + Verbo
Substantivo (grupo) + の中で + [A] + が + 一番 / だけ
Frase + Substantivo + の中で (entre os... que...)

Escrita: の中で / のなかで""",
no="""Para indicar apenas que algo está dentro de um lugar, sem ação, usa-se の中に com ある ou いる. の中で é para ações.

Com adjetivos de situação, como em 寒い中, não se usa の: a palavra 中 vem direto depois do adjetivo.

Lido ちゅう ou じゅう, o mesmo kanji 中 forma outras expressões, como 授業中 (durante a aula) e 一日中 (o dia inteiro).""",
bf="の中で",
rx="の中で|のなかで",
tk=["の", "中", "で"],
va=["の中で", "のなかで"],
E=[
("箱の中で猫が寝ています。", "はこのなかでねこがねています。", "O gato está dormindo dentro da caixa."),
("家族の中で、私だけが眼鏡をかけています。", "かぞくのなかで、わたしだけがめがねをかけています。", "Na minha família, só eu uso óculos."),
("忙しい毎日の中で、音楽が私の楽しみです。", "いそがしいまいにちのなかで、おんがくがわたしのたのしみです。", "Em meio ao dia a dia corrido, a música é a minha alegria."),
("雨の中で、子供たちが遊んでいる。", "あめのなかで、こどもたちがあそんでいる。", "As crianças estão brincando debaixo da chuva."),
("今まで読んだ本の中で、これが一番おもしろかった。", "いままでよんだほんのなかで、これがいちばんおもしろかった。", "De todos os livros que já li, este foi o mais interessante."),
],
R=[
("車____音楽を聞きました。", "Ouvi música dentro do carro.", ["の中で", "のなかで"]),
("クラス____、彼だけが日本へ行ったことがある。", "Na turma, só ele já foi ao Japão.", ["の中で", "のなかで"]),
("雪____、二時間も待ちました。", "Esperei duas horas inteiras debaixo da neve.", ["の中で", "のなかで"]),
("私が知っている人____、一番優しいのは祖母です。", "Entre as pessoas que conheço, a mais gentil é minha avó.", ["の中で", "のなかで"]),
("森____、珍しい鳥を見つけました。", "Encontrei um pássaro raro dentro da floresta.", ["の中で", "のなかで"]),
],
),
dict(
n=62,
jp="〜のに（逆接）",
rd="noni (gyakusetsu)",
tr="Mesmo / Apesar de / Embora",
ex="""のに é usado para ligar duas ideias quando o resultado é contrário ao que se esperava. Equivale a "mesmo...", "apesar de..." ou "embora...".

O ponto principal é o sentimento. のに mostra surpresa, frustração, decepção ou reclamação de quem fala. Por exemplo, "estudei tanto e mesmo assim fui reprovado".

Por isso, ele é diferente de けど e が, que apenas indicam contraste de forma neutra. のに sempre carrega emoção.

Como a segunda parte descreve um fato que contraria a expectativa, ela não pode ser um pedido, uma ordem ou uma intenção.

Com substantivos e adjetivos な, usa-se な antes de のに.""",
st="""Verbo / Adjetivo い (forma simples) + のに
Substantivo / Adjetivo な + な + のに""",
no="""No final da frase, のに sozinho expressa arrependimento ou lamento, como "se pelo menos...", "que pena que...".

A palavra せっかく combina muito com のに, reforçando a frustração por um esforço desperdiçado.

Não confunda com のに de finalidade, que significa "para fazer" e vem antes de verbos como 使う e かかる.""",
bf="のに",
rx="のに",
tk=["のに"],
va=["のに", "なのに"],
E=[
("一生懸命勉強したのに、試験に落ちた。", "いっしょうけんめいべんきょうしたのに、しけんにおちた。", "Estudei muito e mesmo assim fui reprovado."),
("約束したのに、彼は来なかった。", "やくそくしたのに、かれはこなかった。", "Ele prometeu, mas não veio."),
("日曜日なのに、会社に行かなければならない。", "にちようびなのに、かいしゃにいかなければならない。", "Mesmo sendo domingo, tenho que ir à empresa."),
("この店は高いのに、あまりおいしくない。", "このみせはたかいのに、あまりおいしくない。", "Este restaurante é caro e mesmo assim não é muito gostoso."),
("せっかく作ったのに、誰も食べてくれない。", "せっかくつくったのに、だれもたべてくれない。", "Eu me dei ao trabalho de fazer, e ninguém come."),
],
R=[
("薬を飲んだ____、熱が下がらない。", "Tomei remédio, mas a febre não baixa.", ["のに"]),
("もう春な____、まだ寒いですね。", "Mesmo já sendo primavera, ainda está frio, né?", ["のに"]),
("何度も説明した____、わかってくれない。", "Expliquei várias vezes, mas ele não entende.", ["のに"]),
("彼はまだ若い____、何でも知っている。", "Apesar de ainda ser jovem, ele sabe de tudo.", ["のに"]),
("早く起きた____、バスに遅れてしまった。", "Acordei cedo e mesmo assim perdi o ônibus.", ["のに"]),
],
),
dict(
n=63,
jp="〜のに（目的）",
rd="noni (mokuteki)",
tr="Para / Para fazer",
ex="""のに também pode indicar finalidade ou uso. Nesse caso, equivale a "para" ou "para fazer".

A estrutura junta o verbo na forma de dicionário com のに. O の transforma a ação em substantivo, e に indica o objetivo.

Esse uso aparece principalmente com algumas palavras específicas: 使う (usar), かかる (levar tempo ou custar), 必要 (necessário), 便利 (prático) e いい (bom).

Por exemplo, "uma tesoura usada para cortar papel", "leva trinta minutos para ir até a estação", "é preciso dinheiro para comprar uma casa".

A diferença em relação a ために é o alcance: のに é mais restrito e aparece com esse grupo de expressões. ために expressa um objetivo de forma mais ampla.""",
st="""Verbo na forma de dicionário + のに + 使う
Verbo na forma de dicionário + のに + Tempo / Dinheiro + かかる
Verbo na forma de dicionário + のに + 必要だ / 便利だ / いい""",
no="""Com substantivos, a mesma ideia é expressa com に: 料理に使う (usar na cozinha).

A melhor forma de distinguir as duas のに é olhar o que vem depois. Se for かかる, 使う, 必要 ou 便利, é finalidade. Se vier um resultado inesperado, é contraste.

Em perguntas como "quanto tempo leva para...", のに é a escolha mais natural.""",
bf="のに",
rx="のに",
tk=["の", "に"],
va=["のに"],
E=[
("このはさみは紙を切るのに使います。", "このはさみはかみをきるのにつかいます。", "Esta tesoura é usada para cortar papel."),
("家から駅まで行くのに三十分かかります。", "いえからえきまでいくのにさんじゅっぷんかかります。", "Leva trinta minutos para ir de casa até a estação."),
("家を買うのにたくさんお金が必要だ。", "いえをかうのにたくさんおかねがひつようだ。", "É preciso muito dinheiro para comprar uma casa."),
("この箱は本を入れるのにちょうどいい。", "このはこはほんをいれるのにちょうどいい。", "Esta caixa é perfeita para guardar livros."),
("このレポートを書くのに一週間かかりました。", "このレポートをかくのにいっしゅうかんかかりました。", "Levei uma semana para escrever este relatório."),
],
R=[
("この部屋を掃除する____二時間かかった。", "Levei duas horas para limpar este quarto.", ["のに"]),
("このかばんは旅行する____便利です。", "Esta bolsa é prática para viajar.", ["のに"]),
("漢字を覚える____、このアプリを使っています。", "Estou usando este aplicativo para decorar kanji.", ["のに"]),
("おいしい料理を作る____、この包丁が必要です。", "Para fazer uma comida gostosa, esta faca é necessária.", ["のに"]),
("日本語が話せるようになる____何年かかりますか。", "Quantos anos leva para conseguir falar japonês?", ["のに"]),
],
),
dict(
n=64,
jp="〜のは〜だ",
rd="no wa ~ da",
tr="O que... é / Quem... é / Foi... que",
ex="""のは〜だ é usado para destacar a informação mais importante da frase. Equivale a estruturas como "o que eu gosto é...", "quem veio foi..." ou "foi por isso que...".

A primeira parte, terminada em のは, apresenta uma situação já conhecida ou fácil de entender. O の transforma essa parte em substantivo, e は a marca como tema.

A segunda parte, antes de だ ou です, traz a informação nova e importante: a pessoa, a coisa, o lugar, o tempo ou o motivo.

Essa estrutura é muito útil para corrigir alguém, responder perguntas com precisão ou dar ênfase a uma parte específica da frase.

Para explicar o motivo, é comum terminar com からです: "o motivo de... é que...".""",
st="""Verbo / Adjetivo (forma simples) + のは + Informação + だ / です
Adjetivo な + な + のは + Informação + だ / です
… + のは + Motivo + からです""",
no="""Nessa estrutura, o sujeito dentro da primeira parte costuma ser marcado com が, e não com は, porque a frase inteira já tem um tema.

É uma forma muito natural de dar ênfase sem mudar a ordem das palavras, algo que o japonês faz com frequência.

Em respostas a perguntas como "quem fez isso?", essa estrutura deixa a resposta clara e enfática.""",
bf="のは",
rx="のは",
tk=["の", "は", "だ"],
va=["のは"],
E=[
("私が好きなのは、日本の歌です。", "わたしがすきなのは、にほんのうたです。", "O que eu gosto é de músicas japonesas."),
("昨日来たのは田中さんです。", "きのうきたのはたなかさんです。", "Quem veio ontem foi o Tanaka."),
("一番大切なのは、健康だ。", "いちばんたいせつなのは、けんこうだ。", "O mais importante é a saúde."),
("私が生まれたのは、小さな村です。", "わたしがうまれたのは、ちいさなむらです。", "O lugar onde nasci é um vilarejo pequeno."),
("彼が会社を休んだのは、病気だったからです。", "かれがかいしゃをやすんだのは、びょうきだったからです。", "Ele faltou ao trabalho porque estava doente."),
],
R=[
("この絵をかいた____、私の妹です。", "Quem pintou este quadro foi minha irmã mais nova.", ["のは"]),
("一番難しかった____、漢字の試験だった。", "O mais difícil foi a prova de kanji.", ["のは"]),
("私が毎朝飲む____、コーヒーです。", "O que eu bebo toda manhã é café.", ["のは"]),
("彼女に初めて会った____、去年の夏です。", "A primeira vez que a encontrei foi no verão passado.", ["のは"]),
("今朝遅れた____、電車が止まったからです。", "Hoje de manhã me atrasei porque o trem parou.", ["のは"]),
],
),
dict(
n=65,
jp="お〜ください",
rd="o ~ kudasai",
tr="Por favor (faça) (muito educado)",
ex="""お〜ください é uma forma muito educada de pedir que alguém faça algo. É mais respeitosa do que てください.

Ela é formada colocando お antes do verbo na forma ます sem ます, e ください depois. Com verbos do tipo "substantivo + する" de origem chinesa, usa-se ご no lugar de お, como em ご連絡ください.

É muito usada por funcionários de lojas, hotéis, estações e empresas, e em avisos públicos. Também aparece em e-mails formais.

Ela pertence ao 尊敬語, porque eleva a pessoa que vai fazer a ação.""",
st="""お + Verbo na forma ます sem ます + ください
ご + Substantivo de ação (origem chinesa) + ください

Exemplos de formação: 待つ → お待ちください / 入る → お入りください / 連絡する → ご連絡ください""",
no="""Alguns verbos têm formas respeitosas especiais e não seguem a regra, como 見る (ご覧ください), 来る (お越しください) e 食べる (お召し上がりください).

Verbos de uma só sílaba na forma ます, como 見る e 寝る, normalmente não usam essa estrutura.

少々お待ちください é uma das frases mais ouvidas no atendimento ao cliente no Japão.""",
bf="お〜ください",
rx="お待ちください|お入りください|お座りください|お掛けください|お使いください|お書きください|お持ちください|お取りください|お降りください|お選びください|お気をつけください|ご連絡ください|ご覧ください|ご確認ください|ご注意ください|ご利用ください",
tk=["お", "ください"],
va=["お〜ください", "ご〜ください"],
E=[
("少々お待ちください。", "しょうしょうおまちください。", "Aguarde um momento, por favor."),
("どうぞお入りください。", "どうぞおはいりください。", "Entre, por favor."),
("こちらにお名前をお書きください。", "こちらにおなまえをおかきください。", "Escreva seu nome aqui, por favor."),
("ご自由にお使いください。", "ごじゆうにおつかいください。", "Fique à vontade para usar."),
("階段では足元にご注意ください。", "かいだんではあしもとにごちゅういください。", "Cuidado com os degraus na escada."),
],
R=[
("どうぞ、こちらに____。", "Sente-se aqui, por favor.", ["お座りください", "お掛けください"]),
("お帰りの際は、どうぞ____。", "Na volta, tome cuidado, por favor.", ["お気をつけください"]),
("こちらのペンを____。", "Use esta caneta, por favor.", ["お使いください"]),
("何かあれば、いつでも____。", "Se precisar de algo, entre em contato a qualquer momento.", ["ご連絡ください"]),
("お客様、次の駅で____。", "Senhor, desça na próxima estação, por favor.", ["お降りください"]),
],
),
dict(
n=66,
jp="お〜になる",
rd="o ~ ni naru",
tr="Fazer (respeitoso)",
ex="""お〜になる é uma forma respeitosa (尊敬語) de falar das ações de outra pessoa, como um cliente, um professor ou um superior. Ela eleva a pessoa que faz a ação.

Ela é formada colocando お antes do verbo na forma ます sem ます, e になる depois. Por exemplo, "voltar" vira お帰りになる, e "ler" vira お読みになる.

O significado do verbo continua o mesmo; só o nível de respeito muda. Ela é muito usada em situações de trabalho, atendimento e com pessoas mais velhas.

Assim como outros verbos respeitosos, ela nunca é usada para as próprias ações.""",
st="""お + Verbo na forma ます sem ます + になる
お + Verbo sem ます + になります (educado)

Passado: お〜になった / お〜になりました""",
no="""Alguns verbos não usam お〜になる porque têm formas respeitosas próprias: いる / 行く / 来る → いらっしゃる, する → なさる, 言う → おっしゃる, 見る → ご覧になる, 食べる → 召し上がる.

Verbos com forma ます de uma só sílaba, como 見る (見ます) e 寝る (寝ます), também não usam essa estrutura.

Para pedir algo respeitosamente, a forma relacionada é お〜ください.""",
bf="お〜になる",
rx="お帰りにな|お待ちにな|お読みにな|お書きにな|お使いにな|お出かけにな|お会いにな|お休みにな|お決めにな|お聞きにな|お持ちにな",
tk=["お", "になる"],
va=["お〜になる", "お〜になります", "お〜になりました"],
E=[
("社長はもうお帰りになりました。", "しゃちょうはもうおかえりになりました。", "O presidente já foi embora."),
("先生はこの本をお読みになりましたか。", "せんせいはこのほんをおよみになりましたか。", "O professor já leu este livro?"),
("部長は何時にお出かけになりますか。", "ぶちょうはなんじにおでかけになりますか。", "A que horas o gerente vai sair?"),
("このペンをお使いになりますか。", "このペンをおつかいになりますか。", "O senhor vai usar esta caneta?"),
("少しお休みになったらいかがですか。", "すこしおやすみになったらいかがですか。", "Que tal o senhor descansar um pouco?"),
],
R=[
("先生は何時ごろ____か。（帰る）", "A que horas o professor volta? (voltar)", ["お帰りになります"]),
("お客様がロビーで____います。（待つ）", "O cliente está esperando no saguão. (esperar)", ["お待ちになって"]),
("社長はこの資料をもう____か。（読む）", "O presidente já leu este documento? (ler)", ["お読みになりました"]),
("田中先生にはもう____か。（会う）", "O senhor já se encontrou com o professor Tanaka? (encontrar)", ["お会いになりました"]),
("どちらの部屋に____か。（決める）", "Qual quarto o senhor escolheu? (decidir)", ["お決めになりました", "お決めになります"]),
],
),
dict(
n=67,
jp="〜おきに",
rd="oki ni",
tr="A cada / De... em...",
ex="""おきに é usado para indicar intervalos regulares. Equivale a "a cada" ou "de... em...".

Ele vem depois de uma quantidade de tempo ou de distância. Por exemplo, um ônibus que passa a cada dez minutos, ou árvores plantadas a cada cinco metros.

Há um detalhe importante com unidades como dias e linhas: 一日おきに significa "dia sim, dia não", ou seja, pula-se um dia entre cada ocorrência. Com horas e minutos, a interpretação costuma ser simplesmente "a cada X tempo".

A palavra vem do verbo 置く, que aqui tem a ideia de "deixar um espaço" entre uma coisa e outra.""",
st="""Quantidade de tempo / distância + おきに + Verbo

Escrita: おきに / 置きに""",
no="""ごとに é parecido e também significa "a cada". Com dias, porém, 一日ごとに significa "todo dia", enquanto 一日おきに significa "dia sim, dia não".

Em horários de transporte e em instruções médicas, おきに aparece com muita frequência.

Para dizer que algo acontece a intervalos de forma geral, sem número, usa-se 定期的に (regularmente).""",
bf="おきに",
rx="おきに|置きに",
tk=["おき", "に"],
va=["おきに", "置きに"],
E=[
("この駅では、バスは十分おきに来ます。", "このえきでは、バスはじゅっぷんおきにきます。", "Nesta estação, o ônibus passa a cada dez minutos."),
("一日おきに運動しています。", "いちにちおきにうんどうしています。", "Faço exercício dia sim, dia não."),
("この薬は六時間おきに飲んでください。", "このくすりはろくじかんおきにのんでください。", "Tome este remédio a cada seis horas."),
("道には五メートルおきに木が植えてある。", "みちにはごメートルおきにきがうえてある。", "Há árvores plantadas a cada cinco metros na rua."),
("ノートには一行おきに書いてください。", "ノートにはいちぎょうおきにかいてください。", "No caderno, escreva pulando uma linha."),
],
R=[
("電車は五分____来ます。", "O trem passa a cada cinco minutos.", ["おきに"]),
("一週間____病院に通っています。", "Vou ao hospital semana sim, semana não.", ["おきに"]),
("この花には二日____水をやってください。", "Regue esta flor a cada dois dias.", ["おきに"]),
("机を一つ____並べてください。", "Arrume as mesas deixando uma de espaço entre elas.", ["おきに"]),
("この大会は四年____開かれる。", "Este campeonato é realizado a cada quatro anos.", ["おきに"]),
],
),
dict(
n=68,
jp="〜終わる",
rd="owaru",
tr="Terminar de / Acabar de (fazer)",
ex="""終わる, ligado a outro verbo, indica que uma ação foi concluída até o fim. Equivale a "terminar de" ou "acabar de fazer".

A estrutura junta o verbo na forma ます sem ます com 終わる. O resultado funciona como um verbo do grupo 1 e se conjuga normalmente: 終わります, 終わった, 終わって.

É usado com ações que têm duração e um fim claro, como ler um livro, escrever uma carta, comer uma refeição ou ver um filme.

O oposto é 始める (começar a). Com 終わる, a ideia é que a ação foi completada.""",
st="""Verbo na forma ます sem ます + 終わる

Educado: 終わります
Passado: 終わった / 終わりました
Ligando: 終わって
Condicional: 終わったら

Escrita: 終わる / おわる""",
no="""Também existe 終える, que é a versão transitiva e soa um pouco mais formal, como em 読み終える.

Com ações de um instante, como chegar ou acordar, 終わる não é usado, porque elas não têm duração.

Para dizer "terminei!" ao concluir uma tarefa, é muito comum ouvir 終わった！ ou できた！.""",
bf="終わる",
rx="終わ|おわ",
tk=["終わる"],
va=["終わる", "終わります", "終わった", "終わりました", "終わって"],
E=[
("やっと宿題をし終わりました。", "やっとしゅくだいをしおわりました。", "Finalmente terminei de fazer a lição."),
("この本を読み終わったら、貸してあげます。", "このほんをよみおわったら、かしてあげます。", "Quando terminar de ler este livro, eu te empresto."),
("食べ終わった人から、外で遊んでいいですよ。", "たべおわったひとから、そとであそんでいいですよ。", "Quem terminar de comer pode ir brincar lá fora."),
("手紙を書き終わって、ほっとした。", "てがみをかきおわって、ほっとした。", "Terminei de escrever a carta e fiquei aliviado."),
("映画を見終わったあとで、感想を話し合った。", "えいがをみおわったあとで、かんそうをはなしあった。", "Depois de terminar de ver o filme, conversamos sobre o que achamos."),
],
R=[
("昨日の夜、やっとレポートを書き____。", "Ontem à noite, finalmente terminei de escrever o relatório.", ["終わりました", "終わった", "おわりました", "おわった"]),
("本を読み____ら、感想を教えてください。", "Quando terminar de ler o livro, me diga o que achou.", ["終わった", "おわった"]),
("全部食べ____人は、お皿を片付けてください。", "Quem terminou de comer tudo, recolha o prato, por favor.", ["終わった", "おわった"]),
("洗濯物を干し____、少し休みました。", "Terminei de estender a roupa e descansei um pouco.", ["終わって", "おわって"]),
("この仕事、何時ごろやり____そうですか。", "A que horas você acha que vai terminar este trabalho?", ["終わり", "おわり"]),
],
),
dict(
n=69,
jp="可能形（〜られる・〜える）",
rd="kanoukei",
tr="Conseguir / Poder / Ser capaz de",
ex="""A forma potencial (可能形) é usada para dizer que alguém consegue ou pode fazer algo. Equivale a "conseguir", "poder" ou "ser capaz de".

Ela expressa tanto habilidade, como saber ler kanji ou nadar, quanto possibilidade, como poder vir a uma festa ou dar para ver algo de um lugar.

A formação depende do grupo do verbo. No grupo 1, o último som muda de "u" para "e" e recebe る. No grupo 2, tira-se る e acrescenta-se られる. Os irregulares ficam できる (de する) e 来られる (こられる).

Depois de formado, o verbo potencial se conjuga como um verbo do grupo 2. E o objeto costuma ser marcado com が, embora を também apareça.

O sentido é o mesmo de ことができる, mas a forma potencial é mais curta e muito mais comum na conversa.""",
st="""Grupo 1: último som "u" → "e" + る (書く → 書ける / 話す → 話せる / 読む → 読める)
Grupo 2: tire る + られる (食べる → 食べられる / 見る → 見られる)
Irregulares: する → できる / 来る → 来られる (こられる)

Objeto: Substantivo + が + Verbo potencial
Negativo: 〜ない (書けない / 食べられない)""",
no="""Na fala, muitos japoneses usam a forma reduzida dos verbos do grupo 2, tirando o ら: 食べれる, 見れる. Ela é comum, mas considerada informal; em provas e textos, use a forma completa.

見える e 聞こえる indicam o que naturalmente se vê ou se ouve, enquanto 見られる e 聞ける indicam possibilidade ou oportunidade de ver ou ouvir.

A forma られる também é usada para a voz passiva e para o respeito, então o contexto é importante.""",
bf="られる",
rx="られる|られない|られます|られません|できる|できない|できます|できません|ける|けない|けます|けません|める|めない|めます|めません|せる|せない|せます|せません|げる|げない|げます|げません|える|えない|えます|えません|れる|れない|れます|れません|てる|てない|てます|てません|べる|べない|べます|べません",
tk=["られる", "える"],
va=["られる", "られない", "える", "ける", "める", "せる", "できる"],
E=[
("私は漢字が少し読めます。", "わたしはかんじがすこしよめます。", "Consigo ler um pouco de kanji."),
("刺身が食べられますか。", "さしみがたべられますか。", "Você consegue comer sashimi?"),
("弟はまだ泳げない。", "おとうとはまだおよげない。", "Meu irmão mais novo ainda não sabe nadar."),
("明日は忙しいので、パーティーに来られません。", "あしたはいそがしいので、パーティーにこられません。", "Amanhã estou ocupado, então não vou poder vir à festa."),
("この部屋からは富士山が見られる。", "このへやからはふじさんがみられる。", "Deste quarto dá para ver o Monte Fuji."),
],
R=[
("彼女はピアノが弾____。", "Ela sabe tocar piano.", ["けます", "ける"]),
("辛い料理は食べ____か。", "Você consegue comer comida apimentada?", ["られます"]),
("やっと日本語で手紙が書____ようになりました。", "Finalmente passei a conseguir escrever cartas em japonês.", ["ける"]),
("明日は七時に来____か。", "Você consegue vir às sete amanhã?", ["られます"]),
("今日は足が痛くて、走____。", "Hoje estou com dor no pé e não consigo correr.", ["れません", "れない"]),
],
),
dict(
n=70,
jp="〜らしい",
rd="rashii",
tr="Parece que / Dizem que / Típico de",
ex="""らしい tem dois usos principais.

O primeiro é indicar uma suposição baseada em informações que a pessoa ouviu ou leu. Equivale a "parece que" ou "dizem que". Quem fala não tem certeza e não se responsabiliza totalmente pela informação. Nesse uso, らしい vem depois da forma simples de verbos e adjetivos, e diretamente depois de substantivos e adjetivos な.

O segundo uso aparece depois de substantivos, com o sentido de "típico de" ou "com as características ideais de". Por exemplo, um dia "bem típico de primavera" ou uma atitude "típica" de alguém. Nesse caso, らしい descreve algo que combina com a imagem esperada daquilo.

Nos dois casos, らしい se conjuga como um adjetivo い: らしくない, らしかった, らしく.""",
st="""Suposição:
Verbo / Adjetivo い (forma simples) + らしい
Substantivo / Adjetivo な (sem だ) + らしい

Típico de:
Substantivo + らしい + Substantivo
Substantivo + らしくない (não é típico de)""",
no="""Comparando suposições: らしい se baseia em informações de fora (algo que se ouviu); ようだ / みたいだ se baseiam em observação direta; そうだ (伝聞) apenas repassa uma informação.

A expressão 〜らしくない é muito usada para dizer que alguém está agindo de um jeito diferente do normal.

No uso de "típico de", らしい costuma ter um tom positivo, como algo que está à altura do esperado.""",
bf="らしい",
rx="らしい|らしく|らしかった",
tk=["らしい"],
va=["らしい", "らしいです", "らしくない", "らしかった"],
E=[
("田中さんは来月結婚するらしい。", "たなかさんはらいげつけっこんするらしい。", "Parece que o Tanaka vai se casar no mês que vem."),
("天気予報によると、明日は雨らしいですね。", "てんきよほうによると、あしたはあめらしいですね。", "Segundo a previsão, parece que amanhã vai chover, né?"),
("あの店のラーメンはとてもおいしいらしい。", "あのみせのラーメンはとてもおいしいらしい。", "Dizem que o ramen daquela loja é muito gostoso."),
("今日は本当に春らしい天気ですね。", "きょうはほんとうにはるらしいてんきですね。", "Hoje está um tempo bem típico de primavera, né?"),
("泣くなんて、君らしくないね。", "なくなんて、きみらしくないね。", "Chorar assim não é do seu feitio."),
],
R=[
("噂では、あの二人は付き合っている____。", "Pelo que dizem, aqueles dois estão namorando.", ["らしい", "らしいです"]),
("部長は今日休む____です。", "Parece que o gerente vai faltar hoje.", ["らしい"]),
("山田さんは昔、歌手だった____。", "Dizem que o Yamada era cantor antigamente.", ["らしい", "らしいです"]),
("今日は夏____暑い日だった。", "Hoje foi um dia quente, bem típico de verão.", ["らしい"]),
("そんなことを言うなんて、彼____ない。", "Dizer uma coisa dessas não é do feitio dele.", ["らしく"]),
],
),
]
