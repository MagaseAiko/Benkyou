G = [
dict(
n=71,
jp="なぜなら",
rd="nazenara",
tr="Porque / Isso porque / A razão é que",
ex="""なぜなら é uma conjunção que introduz o motivo de algo que já foi dito. Equivale a "porque", "isso porque" ou "a razão é que".

Primeiro vem a afirmação ou a decisão. Depois, numa nova frase, なぜなら apresenta a explicação. A frase com なぜなら costuma terminar com からだ ou からです, que reforçam a ideia de motivo.

Por exemplo, "eu ando todo dia. Isso porque faz bem para a saúde".

Esse uso soa formal e lógico. Ele aparece muito em redações, discursos, debates e textos argumentativos, quando a pessoa quer justificar claramente sua opinião.

A forma なぜかというと tem o mesmo sentido e é um pouco mais falada.""",
st="""Frase 1 (afirmação) + なぜなら、 + Motivo + からだ / からです
Frase 1 + なぜかというと、 + Motivo + からだ (mais falado)""",
no="""Na conversa do dia a dia, os japoneses preferem simplesmente usar から ou ので. なぜなら soa mais explicativo, quase como numa apresentação.

O final からだ é importante: sem ele, a frase com なぜなら fica incompleta.

なぜ, sozinho, significa "por quê" e é a forma mais formal de どうして.""",
bf="なぜなら",
rx="なぜなら|なぜかというと",
tk=["なぜなら", "からだ"],
va=["なぜなら", "なぜかというと"],
E=[
("私は毎日歩きます。なぜなら、健康にいいからです。", "わたしはまいにちあるきます。なぜなら、けんこうにいいからです。", "Eu ando todos os dias. Isso porque faz bem para a saúde."),
("今日は休みます。なぜなら、熱があるからです。", "きょうはやすみます。なぜなら、ねつがあるからです。", "Hoje vou faltar. A razão é que estou com febre."),
("私は彼を信じている。なぜなら、一度もうそをついたことがないからだ。", "わたしはかれをしんじている。なぜなら、いちどもうそをついたことがないからだ。", "Eu confio nele. Isso porque ele nunca mentiu."),
("この計画には反対です。なぜなら、お金がかかりすぎるからです。", "このけいかくにははんたいです。なぜなら、おかねがかかりすぎるからです。", "Sou contra este plano. A razão é que ele custa caro demais."),
("日本語を勉強している。なぜかというと、日本で働きたいからだ。", "にほんごをべんきょうしている。なぜかというと、にほんではたらきたいからだ。", "Estou estudando japonês. É que quero trabalhar no Japão."),
],
R=[
("旅行は中止です。____、台風が来るからです。", "A viagem está cancelada. Isso porque vem um tufão.", ["なぜなら"]),
("私は猫が好きだ。____、かわいいからだ。", "Eu gosto de gatos. Isso porque são fofos.", ["なぜなら"]),
("今日は早く寝ます。____、明日は早いからです。", "Hoje vou dormir cedo. A razão é que amanhã acordo cedo.", ["なぜなら"]),
("その意見に賛成です。____、みんなのためになるからです。", "Concordo com essa opinião. Isso porque ela beneficia a todos.", ["なぜなら"]),
("彼は人気がある。____、いつも優しいからだ。", "Ele é popular. Isso porque é sempre gentil.", ["なぜなら"]),
],
),
dict(
n=72,
jp="〜んだって",
rd="n datte",
tr="Dizem que / Ouvi dizer que / É verdade que...?",
ex="""んだって é uma forma casual de repassar uma informação que se ouviu de alguém. Equivale a "dizem que" ou "ouvi dizer que".

Ela junta んだ (explicação) com って (citação). A ideia é "ouvi que é assim".

É muito comum entre amigos e família, para contar novidades, fofocas e notícias. Por exemplo, "o Tanaka vai se casar no mês que vem, ouvi dizer".

Com entonação de pergunta, んだって？ serve para confirmar algo que a pessoa ouviu: "é verdade que você vai se mudar?".

Com substantivos e adjetivos な, usa-se なんだって.""",
st="""Verbo / Adjetivo い (forma simples) + んだって
Substantivo / Adjetivo な + なんだって
… + んだって？ (confirmação: é verdade que...?)

Forma educada equivalente: 〜そうです""",
no="""んだって é bem informal. Em situações educadas, use そうです ou と聞きました.

As mulheres às vezes usam a forma んですって, um pouco mais suave e tradicional.

Na pergunta んだって？, a pessoa geralmente está surpresa e quer saber se a informação é verdadeira.""",
bf="んだって",
rx="んだって|なんだって",
tk=["ん", "だって"],
va=["んだって", "なんだって"],
E=[
("ねえ、田中さん、来月結婚するんだって。", "ねえ、たなかさん、らいげつけっこんするんだって。", "Ei, ouvi dizer que o Tanaka vai se casar no mês que vem."),
("明日は雨なんだって。", "あしたはあめなんだって。", "Dizem que amanhã vai chover."),
("あの店のラーメン、すごくおいしいんだって。", "あのみせのラーメン、すごくおいしいんだって。", "Dizem que o ramen daquela loja é muito gostoso."),
("先生、今日は休みなんだって。", "せんせい、きょうはやすみなんだって。", "Ouvi dizer que o professor está de folga hoje."),
("彼女、アメリカに留学するんだって？", "かのじょ、アメリカにりゅうがくするんだって？", "É verdade que ela vai fazer intercâmbio nos Estados Unidos?"),
],
R=[
("山田さん、会社をやめる____。", "Ouvi dizer que o Yamada vai sair da empresa.", ["んだって"]),
("明日のテストは難しい____。", "Dizem que a prova de amanhã é difícil.", ["んだって"]),
("あの映画、すごくおもしろい____よ。", "Dizem que aquele filme é muito bom.", ["んだって"]),
("部長は今日、出張な____。", "Ouvi dizer que o gerente está em viagem de trabalho hoje.", ["んだって"]),
("君、来月引っ越す____？", "É verdade que você vai se mudar no mês que vem?", ["んだって"]),
],
),
dict(
n=73,
jp="〜に違いない",
rd="ni chigai nai",
tr="Com certeza / Deve ser / Não há dúvida de que",
ex="""に違いない é usado para expressar uma suposição forte, quase uma certeza, baseada em evidências ou em intuição. Equivale a "com certeza", "deve ser" ou "não há dúvida de que".

A ideia literal é "não há diferença", ou seja, "não pode ser outra coisa".

O grau de certeza é alto, maior que だろう e かもしれない. Mas ainda é uma suposição pessoal, e não um fato comprovado.

Ele vem depois da forma simples de verbos e adjetivos い. Com substantivos e adjetivos な, não se usa だ antes: 本当に違いない.

É um pouco formal e aparece muito na escrita, em romances e em deduções.""",
st="""Verbo / Adjetivo い (forma simples) + に違いない
Adjetivo な (sem だ) + に違いない
Substantivo (sem だ) + に違いない

Educado: に違いありません
Escrita: に違いない / にちがいない""",
no="""Na conversa casual, os japoneses costumam preferir きっと〜と思う ou はずだ.

Comparando: はずだ se baseia mais em lógica e fatos; に違いない expressa uma convicção pessoal forte, às vezes baseada em intuição.

É muito usado em histórias de detetive, quando alguém deduz algo.""",
bf="に違いない",
rx="に違いない|に違いありません|にちがいない",
tk=["に", "違い", "ない"],
va=["に違いない", "に違いありません", "にちがいない"],
E=[
("彼はもう家に帰ったに違いない。", "かれはもういえにかえったにちがいない。", "Ele com certeza já foi para casa."),
("この絵は有名な画家が描いたに違いない。", "このえはゆうめいながかがかいたにちがいない。", "Este quadro deve ter sido pintado por um pintor famoso."),
("あんなに練習したのだから、合格するに違いない。", "あんなにれんしゅうしたのだから、ごうかくするにちがいない。", "Com tanto treino, com certeza vai passar."),
("電気がついているから、誰かいるに違いない。", "でんきがついているから、だれかいるにちがいない。", "A luz está acesa, então com certeza tem alguém."),
("彼女の話は本当に違いありません。", "かのじょのはなしはほんとうにちがいありません。", "A história dela com certeza é verdade."),
],
R=[
("彼の顔色を見ると、病気____。", "Pela cor do rosto dele, com certeza está doente.", ["に違いない", "に違いありません"]),
("このブランドのかばんだから、高い____。", "É uma bolsa dessa marca, então com certeza é cara.", ["に違いない", "に違いありません"]),
("証拠から考えると、犯人はあの男____。", "Pelas provas, o culpado com certeza é aquele homem.", ["に違いない", "に違いありません"]),
("このプレゼントを見たら、彼女はきっと喜ぶ____。", "Quando ela vir este presente, com certeza vai ficar feliz.", ["に違いない", "に違いありません"]),
("窓が開いている。泥棒が入った____。", "A janela está aberta. Com certeza um ladrão entrou.", ["に違いない", "に違いありません"]),
],
),
dict(
n=74,
jp="〜に反して",
rd="ni hanshite",
tr="Ao contrário de / Contra / Contrariando",
ex="""に反して é usado para dizer que um resultado foi contrário a uma expectativa, previsão, desejo ou regra. Equivale a "ao contrário de", "contrariando" ou "contra".

反する significa "ir contra" ou "ser oposto a". Assim, a estrutura mostra que a realidade foi na direção oposta.

Ela aparece muito com substantivos como 予想 (previsão), 期待 (expectativa), 意思 (vontade) e 規則 (regra).

Antes de um substantivo, usa-se に反する: 規則に反する行為 (um ato contra as regras).

É uma expressão formal, comum em notícias, relatórios e textos escritos.""",
st="""Substantivo (予想 / 期待 / 意思 / 規則) + に反して + Resultado
Substantivo + に反し + Resultado (mais formal)
Substantivo + に反する + Substantivo""",
no="""予想に反して é uma das combinações mais usadas e equivale a "contra todas as previsões".

Com regras e leis, に反する indica uma violação: 法律に反する (ser contra a lei).

Na fala do dia a dia, os japoneses costumam usar 思ったより ou 予想と違って, que soam mais leves.""",
bf="に反して",
rx="に反して|に反し|に反する",
tk=["に", "反して"],
va=["に反して", "に反し", "に反する"],
E=[
("予想に反して、試験は簡単だった。", "よそうにはんして、しけんはかんたんだった。", "Ao contrário do previsto, a prova foi fácil."),
("親の期待に反して、彼は大学に行かなかった。", "おやのきたいにはんして、かれはだいがくにいかなかった。", "Contrariando as expectativas dos pais, ele não foi para a faculdade."),
("天気予報に反して、一日中晴れた。", "てんきよほうにはんして、いちにちじゅうはれた。", "Ao contrário da previsão do tempo, fez sol o dia inteiro."),
("規則に反する行為は許されない。", "きそくにはんするこういはゆるされない。", "Atos contra as regras não são permitidos."),
("本人の意思に反して、転勤が決まった。", "ほんにんのいしにはんして、てんきんがきまった。", "Contra a vontade dele, a transferência foi decidida."),
],
R=[
("予想____、チームは負けてしまった。", "Ao contrário do previsto, o time acabou perdendo.", ["に反して"]),
("期待____、その映画はつまらなかった。", "Contrariando as expectativas, esse filme foi chato.", ["に反して"]),
("法律____行為をしてはいけない。", "Não se deve praticar atos contra a lei.", ["に反する"]),
("彼の意見は私の考え____いる。", "A opinião dele é contrária ao que eu penso.", ["に反して"]),
("みんなの心配____、手術は成功した。", "Contrariando a preocupação de todos, a cirurgia foi um sucesso.", ["に反して"]),
],
),
dict(
n=75,
jp="〜にかけて",
rd="ni kakete",
tr="Até / Ao longo de / Em direção a",
ex="""Quando aparece sozinho, sem から, にかけて indica que algo se estende ou acontece ao longo de um período até certo ponto, de forma aproximada. Equivale a "até", "ao longo de" ou "em direção a".

Ele é muito usado em previsões do tempo e em descrições de tendências: "até o fim da tarde, a chuva vai ficar mais forte" ou "até o fim do ano, o trabalho vai aumentar".

A ideia é de algo que vai acontecendo ou mudando gradualmente, e não de um limite exato. Para limites exatos, usa-se まで.

Quando aparece com から, forma から〜にかけて, que indica uma faixa completa entre dois pontos.""",
st="""Período / Momento + にかけて + Frase
から + … + にかけて (faixa entre dois pontos)""",
no="""Em previsões do tempo, にかけて aparece quase todos os dias, junto com expressões como 夕方, 夜, 明日の朝 e 週末.

Não confunda com にかけては (N2), que significa "quando se trata de" e fala de habilidades.

にかけて soa um pouco mais formal e vago que まで.""",
bf="にかけて",
rx="にかけて",
tk=["に", "かけて"],
va=["にかけて"],
E=[
("夕方にかけて、雨が強くなるでしょう。", "ゆうがたにかけて、あめがつよくなるでしょう。", "Até o fim da tarde, a chuva deve ficar mais forte."),
("週末にかけて、寒い日が続きます。", "しゅうまつにかけて、さむいひがつづきます。", "Os dias frios vão continuar até o fim de semana."),
("年末にかけて、仕事が忙しくなる。", "ねんまつにかけて、しごとがいそがしくなる。", "Até o fim do ano, o trabalho vai ficar mais corrido."),
("夜にかけて、風が強くなった。", "よるにかけて、かぜがつよくなった。", "Em direção à noite, o vento ficou mais forte."),
("来週にかけて、気温が下がる見込みです。", "らいしゅうにかけて、きおんがさがるみこみです。", "A previsão é de que a temperatura caia até a semana que vem."),
],
R=[
("明日の朝____、雪が降るでしょう。", "Deve nevar até amanhã de manhã.", ["にかけて"]),
("連休____、高速道路が混みます。", "As rodovias vão ficar congestionadas ao longo do feriado prolongado.", ["にかけて"]),
("夏の終わり____、台風が多い。", "Até o fim do verão, há muitos tufões.", ["にかけて"]),
("午後から夜____、雷に注意してください。", "Da tarde até a noite, tenham cuidado com os raios.", ["にかけて"]),
("月末____、忙しくなりそうだ。", "Parece que vou ficar ocupado até o fim do mês.", ["にかけて"]),
],
),
dict(
n=76,
jp="〜に関する・〜に関して",
rd="ni kansuru / ni kanshite",
tr="Sobre / A respeito de / Relativo a",
ex="""に関する e に関して são usados para indicar o assunto ou o tema de algo. Equivalem a "sobre", "a respeito de" ou "relativo a".

に関する vem antes de um substantivo e o descreve: 歴史に関する本 (um livro sobre história).

に関して vem antes de um verbo ou de uma frase: この件に関して質問がある (tenho uma pergunta a respeito deste assunto).

O sentido é parecido com について, mas に関する e に関して soam mais formais e objetivos. Por isso, aparecem muito em documentos, reuniões, notícias e textos acadêmicos.

Com は, a forma に関しては destaca o tema, às vezes com contraste: "em relação a economia, ele entende bem".""",
st="""Substantivo + に関する + Substantivo
Substantivo + に関して + Verbo / Frase
Substantivo + に関しては + … (quanto a...)

Escrita: に関する / にかんする""",
no="""Na conversa casual, について é mais comum. に関して é típico de situações formais.

Antes de substantivos, について usa の (についての本), enquanto に関する se liga direto (に関する本).

Em e-mails de trabalho, 〜に関しまして é uma versão ainda mais polida.""",
bf="に関する",
rx="に関す|に関し|にかんし|にかんす",
tk=["に", "関する"],
va=["に関する", "に関して", "に関しては", "に関しまして"],
E=[
("日本の歴史に関する本を読んでいます。", "にほんのれきしにかんするほんをよんでいます。", "Estou lendo um livro sobre a história do Japão."),
("この件に関して、何か質問はありますか。", "このけんにかんして、なにかしつもんはありますか。", "Há alguma pergunta a respeito deste assunto?"),
("環境問題に関するレポートを書いた。", "かんきょうもんだいにかんするレポートをかいた。", "Escrevi um relatório sobre problemas ambientais."),
("事故に関して、警察が調べている。", "じこにかんして、けいさつがしらべている。", "A polícia está investigando o acidente."),
("彼は経済に関しては詳しい。", "かれはけいざいにかんしてはくわしい。", "Quanto a economia, ele entende bem."),
],
R=[
("留学____情報を集めている。", "Estou reunindo informações sobre intercâmbio.", ["に関する"]),
("その問題____、話し合いましょう。", "Vamos conversar a respeito desse problema.", ["に関して"]),
("最近、健康____ニュースが増えている。", "Ultimamente, as notícias sobre saúde estão aumentando.", ["に関する"]),
("新しい規則____、説明があった。", "Houve uma explicação a respeito das novas regras.", ["に関して"]),
("彼はコンピューター____知識が豊富だ。", "Ele tem muito conhecimento sobre computadores.", ["に関する"]),
],
),
dict(
n=77,
jp="〜に代わって",
rd="ni kawatte",
tr="No lugar de / Em nome de / Substituindo",
ex="""に代わって é usado para dizer que alguém ou algo faz um papel no lugar de outra pessoa ou coisa. Equivale a "no lugar de", "em nome de" ou "substituindo".

Ele tem dois usos principais. O primeiro é substituição de pessoa: alguém faz algo no lugar de outra pessoa, como um funcionário que cumprimenta os convidados em nome do presidente.

O segundo é substituição ao longo do tempo: algo novo toma o lugar de algo antigo, como o e-mail substituindo as cartas ou robôs fazendo o trabalho de pessoas.

É mais formal que の代わりに e aparece muito em discursos, cerimônias e textos escritos.""",
st="""Substantivo + に代わって + Verbo
Substantivo + に代わり + Verbo (mais formal)
Substantivo + に代わる + Substantivo (que substitui)

Escrita: に代わって / にかわって""",
no="""Em cerimônias e discursos, 〜に代わりまして、ご挨拶申し上げます é uma frase muito comum.

に代わる + substantivo, como 石油に代わるエネルギー, significa "uma energia que substitua o petróleo".

Compare com の代わりに: os dois têm sentido parecido, mas に代わって soa mais formal.""",
bf="に代わって",
rx="に代わって|にかわって|に代わり|に代わる",
tk=["に", "代わって"],
va=["に代わって", "に代わり", "に代わる"],
E=[
("社長に代わって、私がご挨拶します。", "しゃちょうにかわって、わたしがごあいさつします。", "Em nome do presidente, eu farei a saudação."),
("病気の母に代わって、姉が料理を作った。", "びょうきのははにかわって、あねがりょうりをつくった。", "No lugar da minha mãe doente, minha irmã mais velha cozinhou."),
("最近は手紙に代わって、メールが使われている。", "さいきんはてがみにかわって、メールがつかわれている。", "Ultimamente, o e-mail está sendo usado no lugar das cartas."),
("人間に代わって、ロボットが働く時代だ。", "にんげんにかわって、ロボットがはたらくじだいだ。", "É uma época em que robôs trabalham no lugar das pessoas."),
("先生に代わって、私が説明します。", "せんせいにかわって、わたしがせつめいします。", "No lugar do professor, eu vou explicar."),
],
R=[
("部長____、課長が会議に出た。", "No lugar do gerente, o chefe de seção participou da reunião.", ["に代わって", "にかわって"]),
("最近は現金____、カードで払う人が増えた。", "Ultimamente, aumentou o número de pessoas que pagam com cartão no lugar do dinheiro.", ["に代わって", "にかわって"]),
("家族____、心からお礼を申し上げます。", "Em nome da família, agradeço de coração.", ["に代わって", "にかわって"]),
("出張中の父____、兄が家のことをした。", "No lugar do meu pai, que estava viajando a trabalho, meu irmão cuidou da casa.", ["に代わって", "にかわって"]),
("これからは石油____、新しいエネルギーが必要だ。", "Daqui em diante, é necessária uma nova energia para substituir o petróleo.", ["に代わって", "にかわって"]),
],
),
dict(
n=78,
jp="〜に比べて",
rd="ni kurabete",
tr="Em comparação com / Comparado a",
ex="""に比べて é usado para comparar duas coisas, colocando uma como referência. Equivale a "em comparação com" ou "comparado a".

A coisa que serve de referência vem antes de に比べて, e a segunda parte descreve a outra coisa, mostrando a diferença.

Por exemplo, "em comparação com o ano passado, este ano chove mais" ou "comparado a Tóquio, a minha cidade é tranquila".

A forma に比べると tem o mesmo sentido e é muito usada na fala. Também é possível usar と比べて, com a partícula と.

É um pouco mais formal que より, mas muito comum tanto na conversa quanto na escrita.""",
st="""Substantivo A + に比べて、 + B + は + Adjetivo
Substantivo A + に比べると、 + …
Substantivo A + と比べて、 + …
Substantivo A + に比べ、 + … (escrito)

Escrita: 比べる / くらべる""",
no="""Comparando com より: 去年より今年は暑い e 去年に比べて今年は暑い têm sentido parecido. に比べて destaca mais a comparação em si.

Para comparações de mudanças no tempo, como "comparado a dez anos atrás", に比べて é muito natural.

に比べ, sem て, é comum em notícias e textos escritos.""",
bf="に比べて",
rx="に比べ|にくらべ|と比べ|とくらべ",
tk=["に", "比べて"],
va=["に比べて", "に比べると", "と比べて", "に比べ"],
E=[
("去年に比べて、今年は雨が多い。", "きょねんにくらべて、ことしはあめがおおい。", "Em comparação com o ano passado, este ano chove mais."),
("東京に比べて、私の町は静かだ。", "とうきょうにくらべて、わたしのまちはしずかだ。", "Comparada a Tóquio, a minha cidade é tranquila."),
("兄に比べて、弟はよく勉強する。", "あににくらべて、おとうとはよくべんきょうする。", "Comparado ao irmão mais velho, o mais novo estuda bastante."),
("昔に比べると、生活が便利になった。", "むかしにくらべると、せいかつがべんりになった。", "Em comparação com antigamente, a vida ficou mais prática."),
("先月と比べて、売り上げが伸びた。", "せんげつとくらべて、うりあげがのびた。", "Comparado ao mês passado, as vendas aumentaram."),
],
R=[
("夏____、冬は電気代が高い。", "Em comparação com o verão, a conta de luz é mais cara no inverno.", ["に比べて", "に比べると"]),
("都会____、田舎は物価が安い。", "Comparado à cidade grande, o custo de vida no interior é mais baixo.", ["に比べて", "に比べると"]),
("十年前____、この町は人口が減った。", "Em comparação com dez anos atrás, a população desta cidade diminuiu.", ["に比べて", "に比べると"]),
("他の店____、この店は安い。", "Comparada às outras lojas, esta loja é barata.", ["に比べて", "に比べると"]),
("昨日____、今日は暖かい。", "Em comparação com ontem, hoje está quente.", ["に比べて", "に比べると"]),
],
),
dict(
n=79,
jp="〜に慣れる",
rd="ni nareru",
tr="Acostumar-se com / Habituar-se a",
ex="""に慣れる é usado para dizer que alguém se acostumou com uma situação, um lugar, uma atividade ou um ambiente. Equivale a "acostumar-se com" ou "habituar-se a".

A coisa com que a pessoa se acostuma é marcada com に. Pode ser um substantivo, como "a vida no Japão", ou uma ação transformada em substantivo com こと, como "usar hashi".

Na forma ている, 慣れている indica que a pessoa já está acostumada. Na forma てきた, 慣れてきた indica que ela está se acostumando aos poucos.

Na forma negativa, まだ慣れていない significa "ainda não me acostumei", muito usado por quem acabou de chegar a algum lugar.""",
st="""Substantivo + に + 慣れる
Verbo + こと + に + 慣れる

Já acostumado: 慣れている / 慣れています
Acostumando-se aos poucos: 慣れてきた
Ainda não: まだ慣れていない

Escrita: 慣れる / なれる""",
no="""A expressão もう慣れました é uma resposta comum quando alguém pergunta se você já se adaptou a um lugar novo.

O substantivo 慣れ significa "costume" ou "prática", como em 慣れが必要だ (é preciso prática).

Para "deixar alguém acostumado", usa-se 慣らす.""",
bf="に慣れる",
rx="慣れ",
tk=["に", "慣れる"],
va=["に慣れる", "に慣れた", "に慣れている", "に慣れてきた"],
E=[
("日本に来て一年、日本の生活に慣れました。", "にほんにきていちねん、にほんのせいかつになれました。", "Faz um ano que vim ao Japão, e me acostumei com a vida aqui."),
("新しい仕事にまだ慣れていない。", "あたらしいしごとにまだなれていない。", "Ainda não me acostumei com o novo trabalho."),
("早く新しい学校に慣れるといいですね。", "はやくあたらしいがっこうになれるといいですね。", "Tomara que você se acostume logo com a nova escola."),
("寒さに慣れるまで、時間がかかった。", "さむさになれるまで、じかんがかかった。", "Levou um tempo até eu me acostumar com o frio."),
("最近、箸を使うことに慣れてきた。", "さいきん、はしをつかうことになれてきた。", "Ultimamente, estou me acostumando a usar hashi."),
],
R=[
("日本の食べ物にもう____。", "Já me acostumei com a comida japonesa.", ["慣れました", "慣れた"]),
("引っ越したばかりで、新しい環境にまだ____。", "Acabei de me mudar e ainda não me acostumei com o novo ambiente.", ["慣れていない", "慣れていません"]),
("早く仕事に____ように頑張ります。", "Vou me esforçar para me acostumar logo com o trabalho.", ["慣れる"]),
("満員電車に____まで、大変だった。", "Até me acostumar com os trens lotados, foi difícil.", ["慣れる"]),
("一人暮らしにも少しずつ____。", "Estou me acostumando aos poucos a morar sozinho.", ["慣れてきた", "慣れてきました"]),
],
),
dict(
n=80,
jp="〜において・〜における",
rd="ni oite / ni okeru",
tr="Em / No âmbito de / Na área de",
ex="""において e における são formas formais de indicar o lugar, a situação ou a área em que algo acontece. Equivalem a "em", "no âmbito de" ou "na área de".

において funciona como a partícula で, mas em linguagem formal. Ele vem antes de verbos: 会議は東京において行われる (a reunião será realizada em Tóquio).

における vem antes de substantivos e os descreve: 日本における外国人 (os estrangeiros no Japão).

Além de lugares físicos, essas formas indicam áreas, campos e situações abstratas, como "na sociedade moderna", "na área da ciência" ou "na educação".

São típicas de textos escritos, notícias, discursos, documentos oficiais e textos acadêmicos.""",
st="""Substantivo (lugar / área / situação) + において + Verbo
Substantivo + における + Substantivo
Substantivo + においては + … (no que diz respeito a...)
Substantivo + においても + … (também em...)""",
no="""Na conversa do dia a dia, usar において soa exageradamente formal. Prefira で.

Em convites oficiais e programas de eventos, aparecem frases como 〜において開催します.

における é muito usado em títulos de trabalhos acadêmicos, como "o papel de X na sociedade".""",
bf="において",
rx="において|における|においては|に於いて",
tk=["に", "おいて"],
va=["において", "における", "においては", "においても"],
E=[
("国際会議は東京において行われる。", "こくさいかいぎはとうきょうにおいておこなわれる。", "A conferência internacional será realizada em Tóquio."),
("現代社会において、インターネットは欠かせない。", "げんだいしゃかいにおいて、インターネットはかかせない。", "Na sociedade moderna, a internet é indispensável."),
("彼は科学の分野において有名だ。", "かれはかがくのぶんやにおいてゆうめいだ。", "Ele é famoso na área da ciência."),
("日本における外国人の数は増えている。", "にほんにおけるがいこくじんのかずはふえている。", "O número de estrangeiros no Japão está aumentando."),
("教育においては、家庭の役割も大切だ。", "きょういくにおいては、かていのやくわりもたいせつだ。", "No que diz respeito à educação, o papel da família também é importante."),
],
R=[
("卒業式は体育館____行われます。", "A cerimônia de formatura será realizada no ginásio.", ["において"]),
("日本____少子化は大きな問題だ。", "A queda da natalidade no Japão é um grande problema.", ["における"]),
("ビジネス____、時間を守ることは大切だ。", "Nos negócios, é importante ser pontual.", ["において"]),
("戦争中____人々の生活について調べた。", "Pesquisei sobre a vida das pessoas durante a guerra.", ["における"]),
("彼女は音楽の世界____活躍している。", "Ela se destaca no mundo da música.", ["において"]),
],
),
]
