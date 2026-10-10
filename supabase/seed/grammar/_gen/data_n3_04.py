G = [
dict(
n=31,
jp="いくら〜ても",
rd="ikura ~ te mo",
tr="Por mais que / Não importa quanto",
ex="""いくら〜ても é usado para dizer que, por mais que algo aconteça ou seja feito, o resultado não muda. Equivale a "por mais que" ou "não importa quanto".

いくら, que normalmente significa "quanto", aqui indica um grau ou uma quantidade sem limite. O verbo ou adjetivo vai para a forma ても.

A segunda parte mostra que o resultado continua o mesmo. Pode ser algo negativo, como uma frustração ("por mais que eu chame, ninguém responde"), ou uma determinação ("por mais caro que seja, quero").

É muito parecido com どんなに〜ても. いくら costuma destacar quantidade e repetição, como esforço repetido ou dinheiro, enquanto どんなに destaca a intensidade de um estado.""",
st="""いくら + Verbo na forma て + も
いくら + Adjetivo い sem い + くても
いくら + Adjetivo な / Substantivo + でも""",
no="""Com dinheiro, いくら〜ても aparece em frases como いくらお金があっても ("por mais dinheiro que se tenha").

A segunda parte geralmente expressa um resultado que não muda, então frases com いくら〜ても costumam ter tom de resignação, crítica ou persistência.

Sem ても, いくら sozinho continua significando "quanto (custa)".""",
bf="いくら",
rx="いくら",
tk=["いくら", "ても"],
va=["いくら〜ても"],
E=[
("彼はいくら食べても太らない。", "かれはいくらたべてもふとらない。", "Por mais que ele coma, não engorda."),
("いくら呼んでも、返事がない。", "いくらよんでも、へんじがない。", "Por mais que eu chame, ninguém responde."),
("いくら高くても、この車が欲しい。", "いくらたかくても、このくるまがほしい。", "Por mais caro que seja, quero este carro."),
("いくら説明しても、彼はわかってくれなかった。", "いくらせつめいしても、かれはわかってくれなかった。", "Por mais que eu explicasse, ele não entendeu."),
("いくら忙しくても、朝ご飯は食べたほうがいい。", "いくらいそがしくても、あさごはんはたべたほうがいい。", "Por mais ocupado que esteja, é melhor tomar café da manhã."),
],
R=[
("____練習しても、上手にならない。", "Por mais que eu pratique, não melhoro.", ["いくら"]),
("____探しても、鍵が見つからない。", "Por mais que eu procure, não acho a chave.", ["いくら"]),
("____寒くても、彼は毎朝走る。", "Por mais frio que esteja, ele corre toda manhã.", ["いくら"]),
("____お金があっても、幸せとは限らない。", "Por mais dinheiro que se tenha, isso não garante a felicidade.", ["いくら"]),
("____電話しても、つながらない。", "Por mais que eu ligue, a ligação não completa.", ["いくら"]),
],
),
dict(
n=32,
jp="〜一方だ",
rd="ippou da",
tr="Só aumentar / Só piorar / Continuar cada vez mais",
ex="""一方だ é usado para dizer que uma situação muda continuamente em uma única direção, sem parar. Equivale a "só aumenta", "só piora" ou "fica cada vez mais...".

Ele vem depois do verbo na forma de dicionário, geralmente verbos de mudança, como 増える (aumentar), 減る (diminuir), 上がる (subir), 悪くなる (piorar).

O tom costuma ser negativo, indicando preocupação com uma tendência que não para, como preços que só sobem ou uma doença que só piora.

一方 significa "um lado só" ou "uma direção". Por isso, a ideia é que a mudança segue sempre o mesmo caminho.""",
st="""Verbo de mudança (forma de dicionário) + 一方だ / 一方です
Passado: 一方だった
Contraste: 一方なのに""",
no="""一方だ é diferente de 一方で, que aparece no N2 e significa "por outro lado".

Em notícias e textos sobre economia e sociedade, 一方だ é muito usado para descrever tendências.

Para mudanças positivas, também é possível usar, mas o tom de preocupação é o mais comum.""",
bf="一方だ",
rx="一方だ|一方です|一方な|一方だった",
tk=["一方", "だ"],
va=["一方だ", "一方です", "一方だった"],
E=[
("最近、物価は上がる一方だ。", "さいきん、ぶっかはあがるいっぽうだ。", "Ultimamente, os preços só sobem."),
("彼の病気は悪くなる一方です。", "かれのびょうきはわるくなるいっぽうです。", "A doença dele só piora."),
("この町の人口は減る一方だ。", "このまちのじんこうはへるいっぽうだ。", "A população desta cidade só diminui."),
("仕事は増える一方なのに、給料は上がらない。", "しごとはふえるいっぽうなのに、きゅうりょうはあがらない。", "O trabalho só aumenta, mas o salário não sobe."),
("夜になって、雨は強くなる一方だった。", "よるになって、あめはつよくなるいっぽうだった。", "À noite, a chuva só ficava mais forte."),
],
R=[
("カードを使いすぎて、借金は増える____。", "Usei demais o cartão, e a dívida só aumenta.", ["一方だ", "一方です"]),
("この町を訪れる外国人観光客は増える____。", "Os turistas estrangeiros que visitam esta cidade só aumentam.", ["一方だ", "一方です"]),
("夏になって、気温は上がる____です。", "Com a chegada do verão, a temperatura só sobe.", ["一方"]),
("けんかの後、彼との関係は悪くなる____だった。", "Depois da briga, a relação com ele só piorava.", ["一方"]),
("日本の子供の数は減る____。", "O número de crianças no Japão só diminui.", ["一方だ", "一方です"]),
],
),
dict(
n=33,
jp="一体",
rd="ittai",
tr="Afinal / Mas que / Diabos (ênfase em pergunta)",
ex="""一体 é usado em perguntas para dar ênfase, mostrando surpresa, irritação, curiosidade forte ou confusão. Equivale a "afinal", "mas que..." ou "diabos" em perguntas como "o que diabos aconteceu?".

Ele sempre aparece junto com uma palavra interrogativa, como 何, 誰, どうして, いつ e どこ.

Também é usado em perguntas indiretas ou em frases de reflexão, como "não sei o que diabos ele está pensando".

O tom é forte e emocional. Por isso, deve ser usado com cuidado em situações formais, pois pode soar como uma cobrança.""",
st="""一体 + Palavra interrogativa (何 / 誰 / どうして / いつ / どこ) + …か
一体 + … + のか、わからない (pergunta indireta)

Escrita: 一体 / いったい""",
no="""Sozinho, 一体 também significa "um corpo" ou "uma unidade", como em 一体になる (tornar-se um só). Esse uso é diferente.

一体全体 é uma forma ainda mais enfática, com tom quase cômico.

Em textos literários, 一体 aparece em monólogos internos e momentos de surpresa.""",
bf="一体",
rx="一体|いったい",
tk=["一体"],
va=["一体", "いったい"],
E=[
("一体何が起きたんですか。", "いったいなにがおきたんですか。", "Afinal, o que aconteceu?"),
("こんな時間に一体誰だろう。", "こんなじかんにいったいだれだろう。", "Quem diabos será a esta hora?"),
("一体どうしてそんなことをしたの？", "いったいどうしてそんなことをしたの？", "Mas por que diabos você fez uma coisa dessas?"),
("彼は一体何を考えているのか、わからない。", "かれはいったいなにをかんがえているのか、わからない。", "Não sei o que diabos ele está pensando."),
("この仕事は一体いつになったら終わるんだろう。", "このしごとはいったいいつになったらおわるんだろう。", "Quando é que, afinal, este trabalho vai terminar?"),
],
R=[
("____ここはどこですか。", "Afinal, onde estamos?", ["一体", "いったい"]),
("そんなに慌てて、____何があったの？", "Tão afobado assim, o que diabos aconteceu?", ["一体", "いったい"]),
("____誰がこんなことをしたんだ。", "Quem diabos fez uma coisa dessas?", ["一体", "いったい"]),
("この問題は____どうすればいいんだろう。", "Afinal, o que devo fazer com este problema?", ["一体", "いったい"]),
("修理に____いくらかかるのか心配だ。", "Estou preocupado com quanto, afinal, vai custar o conserto.", ["一体", "いったい"]),
],
),
dict(
n=34,
jp="〜じゃない（確認・驚き）",
rd="ja nai (kakunin / odoroki)",
tr="Não é? / Ora mas é... / Não acha?",
ex="""No N3, じゃない aparece no final da frase não como negação, mas como uma forma de afirmar algo com ênfase, buscar concordância ou expressar surpresa. Equivale a "não é?", "ora, mas é..." ou "não acha?".

Com entonação subindo, じゃない? pede confirmação, como "aquele ali não é o Tanaka?".

Com entonação descendo, じゃない expressa surpresa ou elogio inesperado, como "nossa, mas está gostoso!", ou uma leve repreensão, como "eu não disse?".

Também aparece em いいじゃない, usado para incentivar ou convencer alguém: "que mal tem?", "vamos lá!".

Essa forma é neutra quanto ao gênero e muito usada no dia a dia, mais suave que じゃないか, que soa mais masculina.""",
st="""Frase (forma simples) + じゃない (↓ surpresa / ênfase)
Frase (forma simples) + じゃない？ (↑ confirmação)
いいじゃない (incentivo)

Fala muito casual: じゃん""",
no="""O sentido depende muito da entonação. Na escrita, o contexto e o ponto de interrogação ajudam a entender.

じゃん, comum na região de Tóquio, é a versão mais casual e jovem.

Não confunda com じゃない de negação, como em 学生じゃない ("não é estudante"). Aqui, a frase é afirmativa na intenção.""",
bf="じゃない",
rx="じゃない|じゃん",
tk=["じゃ", "ない"],
va=["じゃない", "じゃない？", "じゃん"],
E=[
("このケーキ、おいしいじゃない。", "このケーキ、おいしいじゃない。", "Nossa, este bolo está gostoso!"),
("あれ、田中さんじゃない？", "あれ、たなかさんじゃない？", "Ué, aquele não é o Tanaka?"),
("いいじゃない、一緒に行こうよ。", "いいじゃない、いっしょにいこうよ。", "Que mal tem? Vamos juntos!"),
("そんなこと、当たり前じゃない。", "そんなこと、あたりまえじゃない。", "Isso é óbvio, ora!"),
("だから言ったじゃない。", "だからいったじゃない。", "Eu não te disse?"),
],
R=[
("その服、よく似合う____。", "Essa roupa fica ótima em você, hein!", ["じゃない", "じゃん"]),
("もう十時____。早く寝なさい。", "Já são dez horas, ora! Vá dormir.", ["じゃない", "じゃん"]),
("それ、私のペン____？", "Essa não é a minha caneta?", ["じゃない"]),
("初めてなのに、上手に描けた____。", "É a primeira vez e ficou bem desenhado, hein!", ["じゃない", "じゃん"]),
("約束したのに、来なかった____。", "Você prometeu e não veio, ora!", ["じゃない", "じゃん"]),
],
),
dict(
n=35,
jp="〜か何か",
rd="ka nanika",
tr="Ou algo assim / Ou alguma coisa do tipo",
ex="""か何か é usado depois de um substantivo para dar um exemplo, deixando claro que pode ser aquilo ou algo parecido. Equivale a "ou algo assim" ou "ou alguma coisa do tipo".

Ele é útil quando a pessoa não quer ou não consegue ser exata. Por exemplo, ao oferecer "um café ou algo assim", ao supor que alguém faltou "por causa de um resfriado ou algo do tipo", ou ao pedir "uma caneta ou alguma coisa para escrever".

As partículas como を, が e で vêm depois de か何か.

É uma forma natural e informal de deixar a frase mais vaga e flexível.""",
st="""Substantivo + か何か + partícula + Verbo
Substantivo + か何か + で (motivo vago)
Substantivo + か何か + Substantivo descritivo (書くもの / 飲むもの)""",
no="""Para pessoas, usa-se か誰か ("ou alguém"), e para lugares, かどこか ("ou algum lugar").

か何か deixa a frase mais suave, especialmente em ofertas e pedidos.

Em suposições, か何かで aparece muito para explicar ausências: 病気か何かで休んでいる.""",
bf="か何か",
rx="か何か|かなにか",
tk=["か", "何", "か"],
va=["か何か", "かなにか"],
E=[
("コーヒーか何か飲みませんか。", "コーヒーかなにかのみませんか。", "Quer beber um café ou algo assim?"),
("風邪か何かで、彼は休んでいる。", "かぜかなにかで、かれはやすんでいる。", "Ele faltou por causa de um resfriado ou algo do tipo."),
("誕生日に本か何かをあげたい。", "たんじょうびにほんかなにかをあげたい。", "Quero dar um livro ou alguma coisa assim de aniversário."),
("ペンか何か、書くものを貸してください。", "ペンかなにか、かくものをかしてください。", "Me empresta uma caneta ou alguma coisa para escrever, por favor."),
("駅前で事故か何かがあったようだ。", "えきまえでじこかなにかがあったようだ。", "Parece que houve um acidente ou algo assim em frente à estação."),
],
R=[
("雑誌____、読むものはありますか。", "Tem uma revista ou alguma coisa para ler?", ["か何か", "かなにか"]),
("疲れたから、お茶____飲みましょうか。", "Estou cansado, vamos tomar um chá ou algo assim?", ["か何か", "かなにか"]),
("田中さんは病気____で、学校を休んだらしい。", "Parece que o Tanaka faltou à escola por causa de alguma doença ou algo do tipo.", ["か何か", "かなにか"]),
("ハンカチ____、拭くものを持っていますか。", "Você tem um lenço ou alguma coisa para enxugar?", ["か何か", "かなにか"]),
("駅前で祭り____をやっている。", "Está acontecendo um festival ou algo assim em frente à estação.", ["か何か", "かなにか"]),
],
),
dict(
n=36,
jp="〜かける",
rd="kakeru",
tr="Começar a (e parar) / Pela metade / Quase",
ex="""かける, ligado a outro verbo, indica que uma ação começou mas não foi concluída, ou que algo esteve prestes a acontecer. Equivale a "começar a e parar", "pela metade" ou "quase".

A estrutura junta o verbo na forma ます sem ます com かける. O resultado funciona como um verbo do grupo 2.

Os usos mais comuns são:
• Ação interrompida: começar a dizer algo e parar, começar a ler e não terminar.
• Estado pela metade: com かけの + substantivo, indica algo que ficou incompleto, como 読みかけの本 (livro lido pela metade) ou 食べかけのパン (pão mordido).
• Quase acontecer: com verbos de mudança, como 死ぬ ou 転ぶ, indica que algo quase aconteceu.""",
st="""Verbo na forma ます sem ます + かける
Verbo sem ます + かけ + の + Substantivo (pela metade)
Verbo sem ます + かけた (quase aconteceu / começou e parou)
Verbo sem ます + かけて、 + … (começou a... e então...)""",
no="""Não confunda com かける sozinho, que tem muitos sentidos, como "pendurar", "telefonar" e "sentar-se".

A forma かけの + substantivo é muito usada para objetos deixados pela metade, como bebidas, comidas, livros e cartas.

Com 死ぬ, 死にかける significa "quase morrer" e aparece em relatos de acidentes ou doenças graves.""",
bf="かける",
rx="かけ",
tk=["かける"],
va=["かける", "かけ", "かけた", "かけて", "かけの"],
E=[
("読みかけの本が机の上にある。", "よみかけのほんがつくえのうえにある。", "Há um livro lido pela metade em cima da mesa."),
("何か言いかけて、彼は黙った。", "なにかいいかけて、かれはだまった。", "Ele começou a dizer algo e ficou calado."),
("食べかけのパンを捨てないで。", "たべかけのパンをすてないで。", "Não jogue fora o pão comido pela metade."),
("私は事故で死にかけたことがある。", "わたしはじこでしにかけたことがある。", "Eu já quase morri num acidente."),
("宿題をやりかけたまま、寝てしまった。", "しゅくだいをやりかけたまま、ねてしまった。", "Acabei dormindo com a lição feita pela metade."),
],
R=[
("書き____の手紙を引き出しにしまった。", "Guardei na gaveta a carta escrita pela metade.", ["かけ"]),
("彼女は何か言い____、やめた。", "Ela começou a dizer algo, mas parou.", ["かけて"]),
("冷蔵庫に飲み____のジュースが残っている。", "Tem um suco tomado pela metade na geladeira.", ["かけ"]),
("雪の道で転び____が、大丈夫だった。", "Quase caí na rua com neve, mas fiquei bem.", ["かけた"]),
("作り____の料理を置いて、電話に出た。", "Deixei a comida pela metade e atendi o telefone.", ["かけ"]),
],
),
dict(
n=37,
jp="〜から〜にかけて",
rd="kara ~ ni kakete",
tr="De... até... (aproximadamente) / Entre... e...",
ex="""から〜にかけて é usado para indicar um intervalo de tempo ou de espaço de forma aproximada. Equivale a "de... até..." ou "entre... e...".

A diferença em relação a から〜まで é a precisão. から〜まで marca um começo e um fim exatos. から〜にかけて indica uma faixa mais ampla e aproximada, sem limites rígidos.

Por isso, ele é muito usado em previsões do tempo ("de hoje à noite até amanhã"), estações do ano ("de março a abril"), regiões geográficas ("da região de Kanto até Tohoku") e partes do corpo ("do pescoço aos ombros").

O que acontece nesse intervalo é descrito de forma geral, como algo que se espalha por toda aquela faixa.""",
st="""Tempo A + から + Tempo B + にかけて
Lugar A + から + Lugar B + にかけて
Parte do corpo A + から + Parte do corpo B + にかけて""",
no="""Em previsões do tempo, essa estrutura aparece praticamente todos os dias.

Também existe a forma にかけて sozinha, com um único ponto, como 週末にかけて ("até o fim de semana").

Não confunda com にかけては, do N2, que significa "quando se trata de" (habilidade).""",
bf="にかけて",
rx="にかけて",
tk=["から", "に", "かけて"],
va=["にかけて", "から〜にかけて"],
E=[
("今夜から明日にかけて、雨が降るでしょう。", "こんやからあしたにかけて、あめがふるでしょう。", "De hoje à noite até amanhã, deve chover."),
("三月から四月にかけて、桜が咲きます。", "さんがつからしがつにかけて、さくらがさきます。", "As cerejeiras florescem entre março e abril."),
("関東から東北にかけて、大雪になった。", "かんとうからとうほくにかけて、おおゆきになった。", "Nevou muito da região de Kanto até Tohoku."),
("この店は昼から夕方にかけて、とても混む。", "このみせはひるからゆうがたにかけて、とてもこむ。", "Esta loja fica muito cheia entre o meio-dia e o fim da tarde."),
("首から肩にかけて痛い。", "くびからかたにかけていたい。", "Estou com dor do pescoço até os ombros."),
],
R=[
("十二月から二月____、寒い日が続く。", "Entre dezembro e fevereiro, os dias frios continuam.", ["にかけて"]),
("九州から四国____、台風が通過した。", "O tufão passou de Kyushu até Shikoku.", ["にかけて"]),
("夜から朝____、強い風が吹いた。", "Da noite até a manhã, soprou um vento forte.", ["にかけて"]),
("日本では、六月から七月____梅雨の季節です。", "No Japão, de junho a julho é a estação das chuvas.", ["にかけて"]),
("背中から腰____痛みがある。", "Tenho dor das costas até a cintura.", ["にかけて"]),
],
),
dict(
n=38,
jp="〜代わりに",
rd="kawari ni",
tr="No lugar de / Em vez de / Em troca de",
ex="""代わりに tem três usos principais.

O primeiro é substituição de pessoa ou coisa: "no lugar de...". Por exemplo, "cozinhei no lugar da minha mãe" ou "comi pão em vez de arroz". Com substantivos, usa-se の antes.

O segundo é troca: "em troca de...". A pessoa faz algo em compensação por outra coisa. Por exemplo, "em troca de me ajudar, paguei o jantar". Com verbos, eles vêm na forma simples antes de 代わりに.

O terceiro é compensação de características: algo tem um lado bom e um lado ruim. Por exemplo, "esta cidade é prática, mas em compensação o aluguel é caro".

Sozinho, no começo da frase, 代わりに significa "em vez disso" ou "em compensação".""",
st="""Substantivo + の + 代わりに (no lugar de)
Verbo (forma simples) + 代わりに (em troca de / em vez de)
Adjetivo い + 代わりに (em compensação)
Adjetivo な + な + 代わりに

Escrita: 代わりに / かわりに""",
no="""O verbo 代わる significa "substituir" e aparece em expressões como 電話を代わる ("passar o telefone").

Em reuniões de trabalho, 〜の代わりに参りました significa "vim no lugar de...".

Não confunda com 変わりに (de 変わる, mudar). O kanji correto aqui é 代.""",
bf="代わりに",
rx="代わりに|かわりに|代わりの",
tk=["代わり", "に"],
va=["代わりに", "かわりに", "代わりの"],
E=[
("母の代わりに、私が料理を作った。", "ははのかわりに、わたしがりょうりをつくった。", "Cozinhei no lugar da minha mãe."),
("今日は課長の代わりに会議に出ます。", "きょうはかちょうのかわりにかいぎにでます。", "Hoje vou à reunião no lugar do chefe de seção."),
("米の代わりにパンを食べた。", "こめのかわりにパンをたべた。", "Comi pão em vez de arroz."),
("引っ越しを手伝ってもらう代わりに、晩ご飯をごちそうした。", "ひっこしをてつだってもらうかわりに、ばんごはんをごちそうした。", "Em troca da ajuda com a mudança, paguei o jantar."),
("この町は便利な代わりに、家賃が高い。", "このまちはべんりなかわりに、やちんがたかい。", "Esta cidade é prática, mas em compensação o aluguel é caro."),
],
R=[
("病気の先生の____、別の先生が授業をした。", "No lugar do professor doente, outro professor deu a aula.", ["代わりに", "かわりに"]),
("このケーキは砂糖の____蜂蜜を使った。", "Neste bolo, usei mel em vez de açúcar.", ["代わりに", "かわりに"]),
("英語を教える____、日本語を教えてもらった。", "Em troca de ensinar inglês, aprendi japonês.", ["代わりに", "かわりに"]),
("今日はバスの____、自転車で来た。", "Hoje vim de bicicleta em vez de ônibus.", ["代わりに", "かわりに"]),
("この仕事は大変な____、給料がいい。", "Este trabalho é pesado, mas em compensação o salário é bom.", ["代わりに", "かわりに"]),
],
),
dict(
n=39,
jp="〜結果",
rd="kekka",
tr="Como resultado de / Depois de / O resultado",
ex="""結果 significa "resultado". Como gramática, ele é usado para dizer que algo aconteceu como consequência de uma ação ou de um processo. Equivale a "como resultado de" ou "depois de".

Com verbos na forma た, indica que, depois de fazer algo, chegou-se a um resultado. Por exemplo, "depois de pensar bem, decidi estudar no exterior".

Com substantivos, usa-se の antes: 調査の結果 (como resultado da pesquisa), 話し合いの結果 (como resultado da conversa).

É uma forma objetiva e um pouco formal, muito usada em relatórios, notícias, explicações e decisões importantes.""",
st="""Verbo na forma た + 結果、 + Resultado
Substantivo + の + 結果、 + Resultado
Substantivo + の + 結果 + は + … (o resultado de... é...)

Escrita: 結果 / けっか""",
no="""結果的に significa "no fim das contas" ou "como resultado" e aparece muito em análises.

Para resultados de provas e exames, 結果 é usado como substantivo comum: 試験の結果.

Na linguagem de negócios, 〜の結果 é uma forma clara de apresentar conclusões.""",
bf="結果",
rx="結果|けっか",
tk=["結果"],
va=["結果", "けっか"],
E=[
("よく考えた結果、留学することにした。", "よくかんがえたけっか、りゅうがくすることにした。", "Depois de pensar bem, decidi fazer intercâmbio."),
("調査の結果、新しいことがわかった。", "ちょうさのけっか、あたらしいことがわかった。", "Como resultado da pesquisa, descobriu-se algo novo."),
("話し合いの結果、計画を変更した。", "はなしあいのけっか、けいかくをへんこうした。", "Depois da conversa, mudamos o plano."),
("毎日練習した結果、試合に勝てた。", "まいにちれんしゅうしたけっか、しあいにかてた。", "Como resultado de treinar todo dia, conseguimos vencer a partida."),
("試験の結果は来週発表されます。", "しけんのけっかはらいしゅうはっぴょうされます。", "O resultado da prova será divulgado na semana que vem."),
],
R=[
("検査の____、問題はありませんでした。", "O resultado do exame não mostrou nenhum problema.", ["結果", "けっか"]),
("家族と相談した____、仕事をやめることにした。", "Depois de conversar com a família, decidi sair do emprego.", ["結果", "けっか"]),
("一生懸命勉強した____、合格できた。", "Como resultado de estudar muito, consegui passar.", ["結果", "けっか"]),
("アンケートの____、多くの人が賛成した。", "Pelo resultado do questionário, a maioria concordou.", ["結果", "けっか"]),
("医者に診てもらった____、ただの風邪だとわかった。", "Depois de me consultar com o médico, descobri que era só um resfriado.", ["結果", "けっか"]),
],
),
dict(
n=40,
jp="結局",
rd="kekkyoku",
tr="No fim / Afinal / No final das contas",
ex="""結局 é um advérbio que indica o resultado final de uma situação, depois de várias possibilidades, esforços ou dúvidas. Equivale a "no fim", "afinal" ou "no final das contas".

Muitas vezes, o resultado é diferente do esperado ou não compensa o esforço. Por exemplo, "esperei uma hora, mas no fim ele não veio" ou "pensei muito, mas no fim não fui".

Também pode indicar que, depois de muitas opções, voltou-se ao ponto inicial: "no fim, decidimos pela primeira proposta".

No começo de uma frase, 結局 pode introduzir uma conclusão geral: "no fim das contas, o mais importante é a saúde". E, em perguntas, pode pedir que alguém vá direto ao ponto: "afinal, o que você quer dizer?".""",
st="""…が / けど、 + 結局 + Resultado
結局、 + Conclusão
結局 + Palavra interrogativa + … + か (afinal, o que...?)

Escrita: 結局 / けっきょく""",
no="""Comparado a やっと, que traz alívio por um resultado desejado, 結局 é neutro ou até um pouco decepcionado.

ついに também indica um resultado final, mas com um tom de "finalmente aconteceu", enquanto 結局 tem um tom de "no fim, foi isso".

Em discussões, 結局 pode soar impaciente quando usado em perguntas.""",
bf="結局",
rx="結局|けっきょく",
tk=["結局"],
va=["結局", "けっきょく"],
E=[
("いろいろ考えたが、結局行かなかった。", "いろいろかんがえたが、けっきょくいかなかった。", "Pensei muito, mas no fim não fui."),
("一時間待ったけど、結局彼は来なかった。", "いちじかんまったけど、けっきょくかれはこなかった。", "Esperei uma hora, mas no fim ele não veio."),
("結局、最初の案に決まった。", "けっきょく、さいしょのあんにきまった。", "No fim, decidimos pela primeira proposta."),
("何度も話し合ったが、結局問題は解決しなかった。", "なんどもはなしあったが、けっきょくもんだいはかいけつしなかった。", "Conversamos várias vezes, mas no fim o problema não foi resolvido."),
("結局、何が言いたいんですか。", "けっきょく、なにがいいたいんですか。", "Afinal, o que você quer dizer?"),
],
R=[
("迷ったけど、____買わなかった。", "Fiquei em dúvida, mas no fim não comprei.", ["結局", "けっきょく"]),
("雨が降って、____試合は中止になった。", "Choveu e, no fim, a partida foi cancelada.", ["結局", "けっきょく"]),
("三日間探したが、____見つからなかった。", "Procurei por três dias, mas no fim não encontrei.", ["結局", "けっきょく"]),
("いろいろあるけど、____、一番大切なのは健康だ。", "Há muitas coisas, mas no fim das contas o mais importante é a saúde.", ["結局", "けっきょく"]),
("色々な店を見て、____最初の店で買った。", "Olhei várias lojas e, no fim, comprei na primeira.", ["結局", "けっきょく"]),
],
),
]
