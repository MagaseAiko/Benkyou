G = [
dict(
n=41,
jp="決して〜ない",
rd="kesshite ~ nai",
tr="Nunca / Jamais / De forma alguma",
ex="""決して〜ない é usado para fazer uma negação muito forte e firme. Equivale a "nunca", "jamais" ou "de forma alguma".

決して vem antes do verbo ou do adjetivo, e a frase fica sempre na forma negativa. Sem a negação, a frase fica errada.

Ele é usado para promessas sérias ("nunca vou esquecer"), descrições firmes de caráter ("ele jamais mente"), pedidos enfáticos ("de forma alguma vá sozinho") e para corrigir uma impressão ("não é de forma alguma fácil").

O tom é sério e um pouco formal, mais forte que 全然〜ない ou 絶対に〜ない em algumas situações.""",
st="""決して + Verbo na forma negativa
決して + Adjetivo い sem い + くない
決して + Adjetivo な / Substantivo + ではない
決して + Verbo ないでください (pedido forte)

Escrita: 決して / けっして""",
no="""絶対に〜ない também expressa negação forte, mas 絶対に pode aparecer em frases afirmativas, enquanto 決して só aparece com negação.

決して〜ない é comum em promessas, juramentos e textos formais.

Para suavizar uma avaliação negativa, como dizer que algo não é fácil, 決して簡単ではない soa educado e firme ao mesmo tempo.""",
bf="決して",
rx="決して|けっして",
tk=["決して", "ない"],
va=["決して", "けっして"],
E=[
("このご恩は決して忘れません。", "このごおんはけっしてわすれません。", "Jamais vou esquecer esse favor."),
("彼は決してうそをつかない人だ。", "かれはけっしてうそをつかないひとだ。", "Ele é uma pessoa que jamais mente."),
("つらくても、決してあきらめないでください。", "つらくても、けっしてあきらめないでください。", "Mesmo que seja difícil, nunca desista."),
("この仕事は決して簡単ではない。", "このしごとはけっしてかんたんではない。", "Este trabalho não é nada fácil."),
("あなたのしたことを、私は決して許さない。", "あなたのしたことを、わたしはけっしてゆるさない。", "Jamais vou perdoar o que você fez."),
],
R=[
("彼女の優しさは____忘れられない。", "Jamais vou conseguir esquecer a gentileza dela.", ["決して", "けっして"]),
("危ないから、____一人で行かないでください。", "É perigoso, então de forma alguma vá sozinho.", ["決して", "けっして"]),
("私は____あなたを裏切りません。", "Eu jamais vou trair você.", ["決して", "けっして"]),
("心配しないで。日本語は____難しくないですよ。", "Não se preocupe. O japonês não é nada difícil.", ["決して", "けっして"]),
("この秘密は____誰にも言わない。", "Jamais vou contar este segredo a ninguém.", ["決して", "けっして"]),
],
),
dict(
n=42,
jp="〜切れない",
rd="kirenai",
tr="Não conseguir (fazer) por completo / Não dar conta de",
ex="""切れない, ligado a outro verbo, indica que não é possível fazer algo por completo, até o fim. Equivale a "não conseguir... tudo" ou "não dar conta de...".

A estrutura junta o verbo na forma ます sem ます com 切れない, a forma potencial negativa de 切る (que, nesse uso, significa "fazer até o fim").

O motivo costuma ser uma quantidade grande demais: comida demais para comer, estrelas demais para contar, livros demais para ler em um dia.

Também é usado com sentimentos, como em 待ち切れない (não aguentar esperar) e 言い切れない (não conseguir expressar tudo em palavras).""",
st="""Verbo na forma ます sem ます + 切れない
Verbo sem ます + 切れません (educado)
Verbo sem ます + 切れなくて、 + …
Verbo sem ます + 切れない + ほど (tanto que não dá para...)

Escrita: 切れない / きれない""",
no="""A forma afirmativa é 切れる (conseguir fazer até o fim), e a forma ativa é 切る (fazer até o fim).

数え切れない (incontável) é uma expressão muito usada para falar de grandes quantidades.

待ち切れない é comum para expressar ansiedade positiva, como esperar ansiosamente por uma viagem.""",
bf="切れない",
rx="切れな|きれな|切れませ|きれませ",
tk=["切れない"],
va=["切れない", "切れません", "きれない", "切れなくて"],
E=[
("料理が多すぎて、食べ切れない。", "りょうりがおおすぎて、たべきれない。", "É comida demais, não consigo comer tudo."),
("空の星が多すぎて、数え切れない。", "そらのほしがおおすぎて、かぞえきれない。", "As estrelas no céu são tantas que não dá para contar."),
("待ち切れなくて、先に食べてしまった。", "まちきれなくて、さきにたべてしまった。", "Não aguentei esperar e acabei comendo antes."),
("この感謝の気持ちは、言葉では言い切れない。", "このかんしゃのきもちは、ことばではいいきれない。", "Não consigo expressar em palavras toda essa gratidão."),
("図書館には、一日では読み切れないほどの本がある。", "としょかんには、いちにちではよみきれないほどのほんがある。", "A biblioteca tem tantos livros que não daria para ler num dia."),
],
R=[
("こんなにたくさんの荷物は、一人では持ち____。", "Tanta bagagem assim, sozinho, não dá para carregar.", ["切れない", "きれない", "切れません", "きれません"]),
("宿題が多すぎて、今日中にやり____。", "A lição é tanta que não consigo terminar hoje.", ["切れない", "きれない", "切れません", "きれません"]),
("夏休みの旅行が楽しみで、待ち____。", "Estou tão animado com a viagem de férias que não aguento esperar.", ["切れない", "きれない", "切れません", "きれません"]),
("皆さんへの感謝の気持ちは言い____。", "Não consigo expressar toda a minha gratidão a vocês.", ["切れない", "きれない", "切れません", "きれません"]),
("このケーキは大きすぎて、一人では食べ____。", "Este bolo é grande demais, sozinho não dá para comer tudo.", ["切れない", "きれない", "切れません", "きれません"]),
],
),
dict(
n=43,
jp="〜きり",
rd="kiri",
tr="Só / Sozinho(s) / Desde que (e nunca mais)",
ex="""きり tem alguns usos principais, todos ligados à ideia de "limite" ou "ponto final".

O primeiro é "só", indicando um número limitado de pessoas ou vezes. Por exemplo, 二人きり (só os dois) e 一度きり (uma única vez).

O segundo, com o verbo na forma た, significa "desde que... e nunca mais". Indica que algo aconteceu e, depois disso, a situação esperada não voltou a acontecer. Por exemplo, "encontrei-o no ano passado e, desde então, nunca mais nos falamos" ou "meu filho saiu de manhã e ainda não voltou".

O terceiro aparece em expressões fixas, como 寝たきり (acamado), indicando um estado que continua sem mudar.

Na fala, きり costuma virar っきり, como em 二人っきり.""",
st="""Número + きり (só: 二人きり / 一度きり)
Verbo na forma た + きり、 + Frase negativa (desde que... e nunca mais)
Verbo た + きり + だ / になる (estado que continua)

Fala: っきり
Escrita: きり / 切り""",
no="""Com o verbo na forma た, a segunda parte quase sempre é negativa ou mostra que algo não aconteceu de novo.

寝たきり é usado para pessoas que ficam acamadas por doença ou idade.

それっきり significa "depois disso, nunca mais" e é muito usado em conversas.""",
bf="きり",
rx="きり|切り|っきり",
tk=["きり"],
va=["きり", "っきり", "切り"],
E=[
("部屋には私と彼の二人きりだった。", "へやにはわたしとかれのふたりきりだった。", "No quarto, estávamos só eu e ele."),
("彼とは去年会ったきり、連絡していない。", "かれとはきょねんあったきり、れんらくしていない。", "Eu o vi no ano passado e, desde então, nunca mais nos falamos."),
("息子は朝出かけたきり、まだ帰ってこない。", "むすこはあさでかけたきり、まだかえってこない。", "Meu filho saiu de manhã e ainda não voltou."),
("一度きりの人生だから、楽しみたい。", "いちどきりのじんせいだから、たのしみたい。", "A vida é uma só, então quero aproveitar."),
("祖母は病気で寝たきりになった。", "そぼはびょうきでねたきりになった。", "Minha avó ficou acamada por causa da doença."),
],
R=[
("兄は十年前に家を出た____、帰ってこない。", "Meu irmão mais velho saiu de casa há dez anos e nunca mais voltou.", ["きり"]),
("二人____で話したいことがある。", "Tenho uma coisa para falar só com você, a sós.", ["きり"]),
("このチャンスは一回____だ。", "Esta chance é uma só.", ["きり"]),
("彼女とは高校を卒業した____会っていない。", "Desde que me formei no colégio, nunca mais a vi.", ["きり"]),
("先週電話した____、彼から連絡がない。", "Liguei semana passada e, desde então, ele não deu notícias.", ["きり"]),
],
),
dict(
n=44,
jp="〜切る",
rd="kiru",
tr="Fazer por completo / Até o fim / Totalmente",
ex="""切る, ligado a outro verbo, indica que uma ação foi feita completamente, até o fim, sem deixar nada. Equivale a "por completo", "até o fim" ou "totalmente".

A estrutura junta o verbo na forma ます sem ます com 切る. O resultado funciona como um verbo do grupo 1.

Os usos mais comuns são:
• Terminar tudo: usar todo o dinheiro, ler o livro inteiro, correr a distância completa.
• Estado extremo: 疲れ切る (ficar completamente exausto), 冷え切る (ficar completamente gelado).
• Afirmar com convicção: 言い切る significa "afirmar com toda a certeza".

Muitas vezes, há uma ideia de esforço ou de esgotamento, como em "correr os quarenta e dois quilômetros até o fim".""",
st="""Verbo na forma ます sem ます + 切る

Passado: 切った / 切りました
Estado: 切っている / 切った + Substantivo

Combinações comuns: 使い切る / 読み切る / 走り切る / 疲れ切る / 言い切る / 売り切れる""",
no="""売り切れ (esgotado) vem dessa mesma ideia: vender até acabar tudo.

疲れ切った, antes de um substantivo, descreve alguém completamente exausto.

A forma potencial negativa 切れない (não conseguir fazer até o fim) é outra gramática importante do N3.""",
bf="切る",
rx="切っ|切り|切る|切れ|きっ|きり",
tk=["切る"],
va=["切る", "切った", "切りました", "切って"],
E=[
("マラソンで四十二キロを走り切った。", "マラソンでよんじゅうにキロをはしりきった。", "Corri os quarenta e dois quilômetros da maratona até o fim."),
("旅行でお金を全部使い切ってしまった。", "りょこうでおかねをぜんぶつかいきってしまった。", "Na viagem, acabei gastando todo o dinheiro."),
("彼は疲れ切った顔をしていた。", "かれはつかれきったかおをしていた。", "Ele estava com cara de completamente exausto."),
("一晩でこの本を読み切った。", "ひとばんでこのほんをよみきった。", "Li este livro inteiro em uma noite."),
("彼は「絶対に勝つ」と言い切った。", "かれは「ぜったいにかつ」といいきった。", "Ele afirmou com toda a certeza: \"Vou vencer\"."),
],
R=[
("料理で冷蔵庫の野菜を全部使い____。", "Na comida, usei todas as verduras da geladeira.", ["切った", "切りました", "きった"]),
("苦しかったが、最後まで泳ぎ____。", "Foi difícil, mas nadei até o fim.", ["切った", "切りました"]),
("一日中働いて、疲れ____。", "Trabalhei o dia inteiro e fiquei completamente exausto.", ["切った", "切っている", "切っています"]),
("長い小説を三日で読み____。", "Li o romance longo inteiro em três dias.", ["切った", "切りました"]),
("彼は自分が正しいと言い____。", "Ele afirmou com convicção que estava certo.", ["切った", "切りました"]),
],
),
dict(
n=45,
jp="〜っけ",
rd="kke",
tr="Mesmo? / Era... não era? / Como era mesmo?",
ex="""っけ é uma partícula de final de frase usada quando a pessoa tenta lembrar ou confirmar algo de que não tem certeza. Equivale a "como era mesmo?", "era..., não era?".

Ela é usada para perguntar algo que você sabia, mas esqueceu, ou para confirmar uma informação. Por exemplo, "a reunião era a que horas mesmo?" ou "amanhã é folga, não é?".

Também pode ser usada falando consigo mesmo, ao recordar o passado com nostalgia: "quando era criança, brincava muito neste parque, né...".

Com substantivos e adjetivos な, usa-se だっけ ou だったっけ. Com verbos e adjetivos い, usa-se a forma た + っけ.

っけ é informal e muito usada na conversa.""",
st="""Substantivo / Adjetivo な + だっけ / だったっけ
Verbo / Adjetivo い na forma た + っけ
Palavra interrogativa + … + だっけ

Educado: でしたっけ / ましたっけ""",
no="""A forma educada でしたっけ é muito útil para perguntar algo que você esqueceu sem soar mal-educado, como お名前、何でしたっけ.

Mesmo falando do presente, っけ costuma usar o passado, porque a pessoa está tentando lembrar de algo que já sabia.

No uso de nostalgia, っけ é bem comum em conversas sobre a infância.""",
bf="っけ",
rx="っけ|だっけ",
tk=["っけ"],
va=["っけ", "だっけ", "でしたっけ", "たっけ"],
E=[
("会議は何時からだっけ？", "かいぎはなんじからだっけ？", "A reunião é a partir de que horas mesmo?"),
("あの人の名前、何だっけ。", "あのひとのなまえ、なんだっけ。", "Qual é mesmo o nome daquela pessoa?"),
("鍵、どこに置いたっけ？", "かぎ、どこにおいたっけ？", "Onde foi mesmo que eu deixei a chave?"),
("明日は休みだったっけ？", "あしたはやすみだったっけ？", "Amanhã é folga, não é?"),
("子供のころ、よくこの公園で遊んだっけ。", "こどものころ、よくこのこうえんであそんだっけ。", "Quando eu era criança, brincava muito neste parque, né..."),
],
R=[
("田中さんの誕生日はいつだ____。", "Quando é mesmo o aniversário do Tanaka?", ["っけ"]),
("この本、どこで買った____。", "Onde foi mesmo que comprei este livro?", ["っけ"]),
("宿題、もう出した____？", "Eu já entreguei a lição?", ["っけ"]),
("昔はこの辺に大きな川があった____。", "Antigamente tinha um rio grande por aqui, né...", ["っけ"]),
("あれ、今日は何曜日だ____。", "Ué, que dia da semana é hoje mesmo?", ["っけ"]),
],
),
dict(
n=46,
jp="〜込む",
rd="komu",
tr="Para dentro / Profundamente / Por completo",
ex="""込む, ligado a outro verbo, acrescenta a ideia de "para dentro" ou de algo feito de forma intensa e profunda.

A estrutura junta o verbo na forma ます sem ます com 込む. O resultado funciona como um verbo do grupo 1.

Os usos principais são:
• Movimento para dentro: 入り込む (entrar em algum lugar), 飛び込む (pular para dentro), 駆け込む (entrar correndo).
• Inserir algo: 書き込む (preencher, escrever dentro de um espaço), 詰め込む (encher, abarrotar).
• Ação intensa ou prolongada: 考え込む (ficar pensativo, absorto), 話し込む (ficar conversando por muito tempo), 落ち込む (ficar deprimido, abatido).

Algumas combinações viraram palavras próprias, com sentidos que vão além da soma das partes.""",
st="""Verbo na forma ます sem ます + 込む

Passado: 込んだ / 込みました
Forma て: 込んで

Combinações comuns: 飛び込む / 駆け込む / 入り込む / 書き込む / 考え込む / 話し込む / 落ち込む / 申し込む""",
no="""申し込む (inscrever-se, solicitar) e 落ち込む (ficar desanimado) são combinações muito usadas no dia a dia.

Sozinho, 込む significa "ficar lotado", como em 電車が込んでいる (o trem está lotado), geralmente escrito 混む.

Na internet, 書き込み é usado para "postagem" ou "comentário".""",
bf="込む",
rx="込",
tk=["込む"],
va=["込む", "込んだ", "込みました", "込んで"],
E=[
("ドアが閉まる直前に、電車に駆け込んだ。", "ドアがしまるちょくぜんに、でんしゃにかけこんだ。", "Entrei correndo no trem logo antes de as portas fecharem."),
("部屋に知らない人が入り込んでいた。", "へやにしらないひとがはいりこんでいた。", "Uma pessoa desconhecida tinha entrado no quarto."),
("彼は何か考え込んでいる。", "かれはなにかかんがえこんでいる。", "Ele está absorto em algum pensamento."),
("この書類に名前を書き込んでください。", "このしょるいになまえをかきこんでください。", "Preencha seu nome neste documento, por favor."),
("犬が川に飛び込んだ。", "いぬがかわにとびこんだ。", "O cachorro pulou no rio."),
],
R=[
("子供がプールに飛び____。", "A criança pulou na piscina.", ["込んだ", "込みました"]),
("彼女は友達と電話で長い間話し____いた。", "Ela ficou um tempão conversando com a amiga ao telefone.", ["込んで"]),
("雨が窓から吹き____きた。", "A chuva entrou pela janela com o vento.", ["込んで"]),
("申込書に必要事項を書き____ください。", "Preencha os dados necessários no formulário de inscrição.", ["込んで"]),
("授業に遅れそうで、教室に駆け____。", "Estava quase atrasado para a aula e entrei correndo na sala.", ["込んだ", "込みました"]),
],
),
dict(
n=47,
jp="〜こそ",
rd="koso",
tr="Justamente / É que / Desta vez sim",
ex="""こそ é uma partícula de ênfase. Ela destaca uma palavra como a mais importante da frase, com o sentido de "justamente esse", "esse sim" ou "é exatamente isso".

Os usos mais comuns são:
• Determinação: 今度こそ / 今年こそ significam "desta vez sim", "este ano sem falta", mostrando vontade forte depois de tentativas que não deram certo.
• Resposta educada: こちらこそ significa "eu é que agradeço", "igualmente", em resposta a agradecimentos e cumprimentos.
• Destacar o motivo: からこそ significa "justamente porque...", mostrando que aquele motivo é o verdadeiro ou o mais importante.
• Destacar algo como o verdadeiro: これこそ significa "este sim é...", "este é exatamente o...".

こそ substitui は e が, e vem depois de outras partículas, como からこそ e にこそ.""",
st="""Substantivo + こそ
今度 / 今年 / 明日 + こそ (determinação)
こちらこそ (resposta educada)
Frase + からこそ (justamente porque)
これ / それ + こそ + Substantivo + だ""",
no="""こちらこそよろしくお願いします é a resposta mais natural quando alguém diz よろしくお願いします.

からこそ dá uma ideia de que o motivo citado, que poderia parecer negativo, é na verdade o que trouxe o resultado.

こそ não é usado com coisas negativas para criticar diretamente; ele valoriza ou enfatiza.""",
bf="こそ",
rx="こそ",
tk=["こそ"],
va=["こそ", "からこそ", "こちらこそ"],
E=[
("去年は落ちたから、今度こそ合格したい。", "きょねんはおちたから、こんどこそごうかくしたい。", "No ano passado reprovei, então desta vez quero passar sem falta."),
("「よろしくお願いします。」「こちらこそ。」", "「よろしくおねがいします。」「こちらこそ。」", "\"Conto com você.\" \"Eu é que conto com você.\""),
("努力したからこそ、成功できた。", "どりょくしたからこそ、せいこうできた。", "Justamente por ter me esforçado, consegui ter sucesso."),
("これこそ私が探していた本だ。", "これこそわたしがさがしていたほんだ。", "Este é exatamente o livro que eu estava procurando."),
("今年こそ、毎日日記を書こう。", "ことしこそ、まいにちにっきをかこう。", "Este ano, sem falta, vou escrever um diário todos os dias."),
],
R=[
("来年____、日本へ行くぞ。", "Ano que vem, sem falta, vou ao Japão!", ["こそ"]),
("「ありがとう。」「いえ、こちら____ありがとう。」", "\"Obrigado.\" \"Não, eu é que agradeço.\"", ["こそ"]),
("失敗したから____、学べることがある。", "Justamente por ter errado, há coisas que se pode aprender.", ["こそ"]),
("健康____一番大切なものだ。", "A saúde é justamente a coisa mais importante.", ["こそ"]),
("今日も寝坊した。明日____早く起きよう。", "Hoje dormi demais de novo. Amanhã, sem falta, vou acordar cedo.", ["こそ"]),
],
),
dict(
n=48,
jp="〜こと（指示・感嘆）",
rd="koto (shiji / kantan)",
tr="Deve-se (fazer) / É proibido... / Que...! (exclamação)",
ex="""No N3, こと aparece no final da frase com dois usos especiais.

O primeiro, e mais importante, é dar instruções ou regras. Uma frase terminada em こと funciona como uma ordem escrita: "deve-se fazer" ou, com ない, "é proibido fazer". Esse uso é muito comum em regulamentos de escolas, avisos, provas, manuais e listas de regras.

Ele vem depois do verbo na forma de dicionário (para obrigação) ou na forma ない (para proibição).

O segundo uso, menos comum, é exclamativo: expressa admiração ou surpresa, como "que bebê fofo!". Esse uso soa feminino ou antiquado e aparece mais em ficção.""",
st="""Verbo na forma de dicionário + こと (fim de frase: deve-se fazer)
Verbo na forma ない + こと (fim de frase: é proibido)
Adjetivo / Substantivo + だ + こと (exclamação, uso antigo / feminino)""",
no="""Esse uso de こと aparece quase sempre na escrita, como em instruções de provas e regras de dormitórios.

Na fala, esse tipo de ordem soa rígido, como de um professor ou chefe dando instruções.

O uso exclamativo, como まあ、きれいだこと, é típico da fala de mulheres mais velhas ou de personagens elegantes.""",
bf="こと",
rx="こと。|こと！|ことね",
tk=["こと"],
va=["こと"],
E=[
("学校のルール：廊下を走らないこと。", "がっこうのルール：ろうかをはしらないこと。", "Regra da escola: é proibido correr no corredor."),
("レポートは金曜日までに提出すること。", "レポートはきんようびまでにていしゅつすること。", "O relatório deve ser entregue até sexta-feira."),
("図書館では静かにすること。", "としょかんではしずかにすること。", "Na biblioteca, deve-se fazer silêncio."),
("試験中は、携帯電話の電源を切ること。", "しけんちゅうは、けいたいでんわのでんげんをきること。", "Durante a prova, os celulares devem ser desligados."),
("まあ、かわいい赤ちゃんだこと。", "まあ、かわいいあかちゃんだこと。", "Ah, mas que bebê fofinho!"),
],
R=[
("クラスの約束：毎日宿題を出す____。", "Combinado da turma: entregar a lição todos os dias.", ["こと"]),
("ゴミは分別して捨てる____。", "O lixo deve ser separado antes de ser descartado.", ["こと"]),
("寮のルール：授業に遅れない____。", "Regra do dormitório: não chegar atrasado às aulas.", ["こと"]),
("使った物は元の場所に戻す____。", "Os objetos usados devem ser devolvidos ao lugar original.", ["こと"]),
("夜十時以降は大きな音を出さない____。", "Depois das dez da noite, é proibido fazer barulho alto.", ["こと"]),
],
),
dict(
n=49,
jp="〜ことから",
rd="koto kara",
tr="Por causa de / Pelo fato de / A partir do fato de",
ex="""ことから é usado para indicar a origem, o motivo ou a base de uma conclusão. Equivale a "por causa de", "pelo fato de" ou "a partir do fato de".

Ele tem três usos principais:
• Origem de um nome: explicar por que algo se chama assim, como uma cidade que recebeu um nome porque dela se vê o Monte Fuji.
• Base para uma conclusão: a partir de um fato observado, chega-se a uma dedução, como concluir que choveu porque a rua está molhada.
• Ponto de partida de uma consequência: algo pequeno que levou a um resultado maior, como um erro pequeno que virou um grande problema.

A frase antes de ことから fica na forma simples. Com adjetivos な, usa-se な ou である, e com substantivos, である.

É um pouco formal e aparece muito em textos explicativos.""",
st="""Verbo / Adjetivo い (forma simples) + ことから
Adjetivo な + な / である + ことから
Substantivo + である + ことから

… + ことから、 + 〜と呼ばれる / 〜がわかる / 〜になった""",
no="""Comparado a から ou ので, ことから destaca que o motivo é um fato objetivo, observável.

É muito usado para explicar a origem de nomes de lugares, apelidos e expressões.

Em textos de investigação ou dedução, ことから〜と考えられる ("a partir disso, pode-se pensar que...") é comum.""",
bf="ことから",
rx="ことから",
tk=["こと", "から"],
va=["ことから"],
E=[
("富士山が見えることから、この町は「富士見」と呼ばれている。", "ふじさんがみえることから、このまちは「ふじみ」とよばれている。", "Como dá para ver o Monte Fuji, esta cidade é chamada de \"Fujimi\"."),
("道が濡れていることから、雨が降ったとわかる。", "みちがぬれていることから、あめがふったとわかる。", "Pelo fato de a rua estar molhada, dá para saber que choveu."),
("彼は足が速いことから、「チーター」というあだ名がついた。", "かれはあしがはやいことから、「チーター」というあだながついた。", "Por ser rápido, ele ganhou o apelido de \"Guepardo\"."),
("小さなミスをしたことから、大きな問題になった。", "ちいさなミスをしたことから、おおきなもんだいになった。", "A partir de um pequeno erro, virou um grande problema."),
("顔が似ていることから、二人は兄弟だと思われた。", "かおがにていることから、ふたりはきょうだいだとおもわれた。", "Por terem rostos parecidos, os dois foram confundidos com irmãos."),
],
R=[
("星がよく見える____、この丘は人気がある。", "Por dar para ver bem as estrelas, esta colina é popular.", ["ことから"]),
("指紋が残っていた____、犯人がわかった。", "A partir das impressões digitais deixadas, descobriram o culpado.", ["ことから"]),
("形が鶴に似ている____、その池は「鶴池」と呼ばれている。", "Por ter a forma parecida com um grou, esse lago é chamado de \"Lago do Grou\".", ["ことから"]),
("窓が開いていた____、泥棒が入ったと考えられる。", "Pelo fato de a janela estar aberta, acredita-se que um ladrão entrou.", ["ことから"]),
("小さなけんかをした____、二人は口をきかなくなった。", "A partir de uma briguinha, os dois pararam de se falar.", ["ことから"]),
],
),
dict(
n=50,
jp="〜ことになっている",
rd="koto ni natte iru",
tr="Está estabelecido que / É regra que / Está combinado que",
ex="""ことになっている é usado para falar de regras, costumes ou planos já decididos, que não dependem da vontade de quem fala. Equivale a "está estabelecido que", "é regra que" ou "está combinado que".

Ele vem de ことになる (ficar decidido) na forma ている, indicando que a decisão já existe e continua valendo.

Os usos principais são:
• Regras de um lugar ou instituição: horários de um dormitório, normas de uma empresa.
• Costumes sociais: tirar os sapatos ao entrar em casa no Japão.
• Planos já combinados: um encontro marcado.

A diferença em relação a ことにしている é quem decidiu. ことにしている é uma regra pessoal, decidida pela própria pessoa. ことになっている é uma regra externa ou um combinado com outros.""",
st="""Verbo na forma de dicionário + ことになっている
Verbo na forma ない + ことになっている

Educado: ことになっています""",
no="""ことになっている é muito usado para explicar regras de forma educada, sem parecer que é uma ordem pessoal.

Funcionários costumam usar essa forma para explicar normas aos clientes: "segundo as regras, não é possível...".

Para obrigações gerais, como leis, também se usa なければならない, mas ことになっている soa mais suave e explicativo.""",
bf="ことになっている",
rx="ことになっている|ことになっています|ことになってい",
tk=["こと", "に", "なって", "いる"],
va=["ことになっている", "ことになっています"],
E=[
("この会社では、毎朝九時に会議をすることになっている。", "このかいしゃでは、まいあさくじにかいぎをすることになっている。", "Nesta empresa, é regra fazer uma reunião todo dia às nove."),
("この寮では、夜十時以降は外出できないことになっています。", "このりょうでは、よるじゅうじいこうはがいしゅつできないことになっています。", "Neste dormitório, é regra não sair depois das dez da noite."),
("来週、田中さんと会うことになっている。", "らいしゅう、たなかさんとあうことになっている。", "Está combinado que vou me encontrar com o Tanaka na semana que vem."),
("日本では、家に入るとき靴を脱ぐことになっている。", "にほんでは、いえにはいるときくつをぬぐことになっている。", "No Japão, é costume tirar os sapatos ao entrar em casa."),
("遅刻した人は、反省文を書くことになっています。", "ちこくしたひとは、はんせいぶんをかくことになっています。", "Quem chega atrasado tem que escrever uma carta de reflexão, segundo a regra."),
],
R=[
("この学校では、制服を着る____。", "Nesta escola, é regra usar uniforme.", ["ことになっている", "ことになっています"]),
("試験中は、辞書を使ってはいけない____。", "Durante a prova, é regra não usar dicionário.", ["ことになっている", "ことになっています"]),
("明日、社長と会う____。", "Está combinado que vou me encontrar com o presidente amanhã.", ["ことになっている", "ことになっています"]),
("ここではタバコを吸わない____。", "Aqui é regra não fumar.", ["ことになっている", "ことになっています"]),
("この部署では、毎月最後の金曜日に飲み会をする____。", "Neste departamento, é costume fazer uma confraternização na última sexta-feira do mês.", ["ことになっている", "ことになっています"]),
],
),
]
