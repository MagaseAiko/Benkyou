G = [
dict(
n=11,
jp="〜でも",
rd="demo",
tr="Ou algo assim / Até mesmo / Qualquer",
ex="""No N4, でも aparece depois de substantivos com três usos importantes.

O primeiro é dar uma sugestão leve, sem insistir: "um chá ou algo assim". A coisa citada é só um exemplo, e a pessoa fica livre para escolher outra opção. Esse uso é muito comum em convites.

O segundo é "até mesmo": algo é verdade mesmo para um caso extremo ou inesperado, como "até uma criança entende".

O terceiro aparece com palavras interrogativas, como いつ, 何, どこ e 誰. Juntas com でも, elas significam "qualquer": a qualquer hora, qualquer coisa, qualquer lugar, qualquer pessoa.

でも substitui は, が e を. Com outras partículas, ele fica depois delas, como em にでも e からでも.""",
st="""Substantivo + でも + Verbo (sugestão leve)
Substantivo + でも (até mesmo)
Palavra interrogativa + でも (qualquer)
Substantivo + partícula + でも (にでも / からでも)""",
no="""No uso de sugestão, でも deixa o convite mais suave e educado, porque não impõe uma opção específica.

Não confunda com でも no começo da frase, que significa "mas".

Com palavras interrogativas, a combinação com も e negativo significa "nada / ninguém", enquanto a combinação com でも e afirmativo significa "qualquer".""",
bf="でも",
rx="でも",
tk=["でも"],
va=["でも"],
E=[
("お茶でも飲みませんか。", "おちゃでものみませんか。", "Que tal tomarmos um chá ou algo assim?"),
("この問題は子供でもわかります。", "このもんだいはこどもでもわかります。", "Até uma criança entende esta questão."),
("いつでも遊びに来てください。", "いつでもあそびにきてください。", "Venha me visitar quando quiser."),
("日曜日でも、父は働いています。", "にちようびでも、ちちははたらいています。", "Mesmo no domingo, meu pai trabalha."),
("暇なら、映画でも見に行こうか。", "ひまなら、えいがでもみにいこうか。", "Se você estiver livre, vamos ver um filme ou algo assim?"),
],
R=[
("週末、映画____見に行きませんか。", "No fim de semana, quer ir ver um filme ou algo assim?", ["でも"]),
("そんな簡単なこと、小学生____できますよ。", "Uma coisa simples dessas, até um aluno do primário consegue.", ["でも"]),
("飲み物は何____いいです。", "Qualquer bebida serve.", ["でも"]),
("雨の日____、彼は毎朝走ります。", "Mesmo em dias de chuva, ele corre toda manhã.", ["でも"]),
("困ったときは、いつ____電話してね。", "Quando estiver com problemas, me ligue a qualquer hora, tá?", ["でも"]),
],
),
dict(
n=12,
jp="〜ではないか",
rd="dewa nai ka",
tr="Não é...? / Não seria...? / Será que não...",
ex="""ではないか é usado para expressar uma suposição, uma opinião com cautela ou uma surpresa. Equivale a "não é...?", "não seria...?" ou "será que não é...?".

Embora tenha forma de pergunta negativa, o sentido é positivo: quem fala acha que aquilo provavelmente é verdade. Dizer "não seria difícil?" é uma forma suave de dizer "acho que é difícil".

É muito comum com と思う, formando ではないかと思う, que é uma forma educada e cautelosa de dar uma opinião. A versão ではないでしょうか soa ainda mais polida.

Também pode expressar surpresa ao perceber algo, ou repreensão, quando se aponta algo que o outro deveria saber.

ではないか é mais formal e mais usado na escrita. Na fala casual, o equivalente é じゃないか.""",
st="""Substantivo + ではないか
Adjetivo な (sem な) + ではないか
Frase + のではないか (com verbos e adjetivos い)

Educado: ではないでしょうか / ではありませんか
Opinião: 〜ではないかと思う
Forma falada: じゃないか""",
no="""Com verbos e adjetivos い, o natural é usar のではないか, como em 高いのではないか. Sem の, a frase ganha um tom de reclamação ou repreensão.

ではないでしょうか é uma das formas favoritas dos japoneses para dar opinião em reuniões e textos, porque não soa impositiva.

A entonação muda o sentido: descendo, é uma suposição; com ênfase, pode ser surpresa ou crítica.""",
bf="ではないか",
rx="ではないか|ではないでしょうか|ではありませんか",
tk=["では", "ない", "か"],
va=["ではないか", "ではないでしょうか", "ではありませんか", "のではないか"],
E=[
("あの人は田中さんではないか。", "あのひとはたなかさんではないか。", "Aquele ali não é o Tanaka?"),
("この計画は少し無理ではないでしょうか。", "このけいかくはすこしむりではないでしょうか。", "Este plano não seria um pouco impossível?"),
("彼の話は本当ではないかと思う。", "かれのはなしはほんとうではないかとおもう。", "Acho que a história dele pode ser verdade."),
("明日は雨ではないかと心配です。", "あしたはあめではないかとしんぱいです。", "Estou preocupado que amanhã chova."),
("それは君の責任ではありませんか。", "それはきみのせきにんではありませんか。", "Isso não é responsabilidade sua?"),
],
R=[
("この仕事は彼には無理____と思います。", "Acho que este trabalho talvez seja impossível para ele.", ["ではないか"]),
("あそこにいるのは山田さん____。", "Quem está ali não é o Yamada?", ["ではないか", "ではありませんか"]),
("警察は、犯人はあの男____と考えている。", "A polícia acha que o culpado pode ser aquele homem.", ["ではないか"]),
("今の説明は少し複雑____でしょうか。", "A explicação de agora não seria um pouco complicada?", ["ではない"]),
("それでは約束が違う____。", "Assim não é o que tínhamos combinado!", ["ではないか", "ではありませんか"]),
],
),
dict(
n=13,
jp="〜が必要",
rd="ga hitsuyou",
tr="Precisar de / Ser necessário",
ex="""が必要 é usado para dizer que algo é necessário. Equivale a "precisar de" ou "ser necessário".

必要 é um adjetivo な que significa "necessário". A coisa necessária é marcada com が. Para dizer para quem ou para quê ela é necessária, usa-se には.

É muito comum em instruções, regras e explicações, como documentos para um processo, habilidades para um trabalho ou materiais para uma receita.

Para dizer que é preciso fazer uma ação, a estrutura é diferente: usa-se 必要がある com um verbo.""",
st="""Substantivo + が + 必要です / 必要だ
[Pessoa / Finalidade] + には + Substantivo + が + 必要です
Verbo na forma de dicionário + には + Substantivo + が + 必要です
必要な + Substantivo

Negativo: が必要ではない / 必要ありません""",
no="""O oposto é 不要 (desnecessário), mais formal, ou 要らない, na fala do dia a dia.

Antes de um substantivo, 必要 recebe な, como em 必要な物 (coisas necessárias).

A forma 〜には〜が必要 é muito usada para dar requisitos, como em processos de matrícula e emprego.""",
bf="必要",
rx="が必要|がひつよう",
tk=["が", "必要"],
va=["が必要", "が必要です", "が必要だ", "がひつよう"],
E=[
("旅行にはパスポートが必要です。", "りょこうにはパスポートがひつようです。", "Para viajar, é preciso passaporte."),
("この仕事には経験が必要だ。", "このしごとにはけいけんがひつようだ。", "Este trabalho exige experiência."),
("子供には親の愛が必要です。", "こどもにはおやのあいがひつようです。", "As crianças precisam do amor dos pais."),
("入学には健康診断書が必要です。", "にゅうがくにはけんこうしんだんしょがひつようです。", "Para a matrícula, é necessário um atestado médico."),
("もう少し時間が必要かもしれません。", "もうすこしじかんがひつようかもしれません。", "Talvez seja preciso um pouco mais de tempo."),
],
R=[
("車を運転するには免許____です。", "Para dirigir um carro, é preciso carteira de motorista.", ["が必要", "がひつよう"]),
("植物には水と光____です。", "As plantas precisam de água e luz.", ["が必要", "がひつよう"]),
("この料理を作るには、卵____だ。", "Para fazer esta comida, precisa de ovo.", ["が必要", "がひつよう"]),
("今の私には休み____。", "O que eu preciso agora é de descanso.", ["が必要です", "が必要だ"]),
("会員になるには、何____ですか。", "O que é necessário para se tornar sócio?", ["が必要", "がひつよう"]),
],
),
dict(
n=14,
jp="〜がする",
rd="ga suru",
tr="Sentir cheiro / Ouvir som / Sentir sabor / Ter a sensação de",
ex="""がする é usado para falar de algo que percebemos pelos sentidos, como cheiros, sons, sabores e sensações. Equivale a "sentir", "ter cheiro de", "ouvir um som de" ou "ter a sensação de".

O ponto principal é que, nessa estrutura, a percepção vem até a pessoa, sem esforço. O cheiro, o som ou o sabor é marcado com が, e する indica que ele está presente.

As palavras mais comuns com がする são におい (cheiro), 音 (som), 声 (voz), 味 (sabor), 感じ (sensação) e 気 (pressentimento).

Com 気, a expressão 気がする significa "ter a impressão de" ou "sentir que", e é muito usada para expressar intuições.""",
st="""Substantivo de percepção + が + する
におい / 香り + がする (cheiro)
音 / 声 + がする (som / voz)
味 + がする (sabor)
感じ / 気 + がする (sensação / impressão)
Adjetivo / Substantivo + の + Substantivo de percepção + がする""",
no="""Diferente de 聞く ou 見る, que são ações conscientes, がする descreve uma percepção espontânea. Por isso, quem percebe não costuma aparecer como sujeito.

Para cheiros desagradáveis, usa-se o kanji 臭い; para cheiros agradáveis, 匂い, embora em hiragana におい serve para os dois.

Não confunda com する no sentido de "fazer". Aqui ele não indica ação, e sim presença de uma percepção.""",
bf="がする",
rx="がする|がします|がした|がしました|がして",
tk=["が", "する"],
va=["がする", "がします", "がした", "がしました"],
E=[
("いいにおいがしますね。", "いいにおいがしますね。", "Que cheiro bom, né?"),
("隣の部屋から変な音がした。", "となりのへやからへんなおとがした。", "Veio um barulho estranho do quarto ao lado."),
("このスープは不思議な味がする。", "このスープはふしぎなあじがする。", "Esta sopa tem um sabor curioso."),
("今日は何かいいことがある気がします。", "きょうはなにかいいことがあるきがします。", "Tenho a sensação de que hoje vai acontecer algo bom."),
("外で子供の声がしました。", "そとでこどものこえがしました。", "Ouvi uma voz de criança lá fora."),
],
R=[
("台所からカレーのにおい____。", "Vem cheiro de curry da cozinha.", ["がします", "がする"]),
("玄関で誰かの足音____。", "Ouvi passos de alguém na entrada.", ["がした", "がしました"]),
("この薬は苦い味____。", "Este remédio tem um gosto amargo.", ["がする", "がします"]),
("何だか寒気____。", "Estou sentindo um certo calafrio.", ["がする", "がします"]),
("彼は来ないような気____。", "Tenho a impressão de que ele não vem.", ["がする", "がします"]),
],
),
dict(
n=15,
jp="〜がり",
rd="gari",
tr="Pessoa sensível a / Que sente muito",
ex="""がり é um sufixo que transforma certos adjetivos de sentimento ou sensação em um substantivo que descreve uma pessoa com essa tendência.

Por exemplo, alguém que sente frio com facilidade é 寒がり; alguém que tem medo fácil é 怖がり; alguém tímido é 恥ずかしがり. A ideia é "a pessoa que sempre demonstra esse sentimento".

Para formar, tira-se o い do adjetivo e acrescenta-se がり. O resultado funciona como um substantivo, ou como um adjetivo な na prática, sendo usado com です, だ, で e な.

Com alguns adjetivos, é comum acrescentar 屋 (や), formando expressões como 恥ずかしがり屋, que significa "pessoa tímida".""",
st="""Adjetivo de sentimento ou sensação sem い + がり
Adjetivo sem い + がり + 屋 (pessoa assim)
Pessoa + は + 〜がり + です / だ
〜がり + で / な + …

Exemplos de formação: 寒い → 寒がり / 暑い → 暑がり / 怖い → 怖がり / 恥ずかしい → 恥ずかしがり""",
no="""Nem todo adjetivo pode virar がり. Os mais comuns são 寒がり, 暑がり, 怖がり, 恥ずかしがり, 寂しがり e 痛がり.

Essa forma vem do verbo がる, que mostra sentimentos de outras pessoas. がり descreve a característica, e がる descreve a ação de demonstrar o sentimento.

O antônimo de 寒がり é 暑がり, e não "não sentir frio": cada um descreve uma sensibilidade diferente.""",
bf="がり",
rx="がり",
tk=["がり"],
va=["がり", "がり屋", "がりや"],
E=[
("妹は寒がりなので、いつもセーターを着ています。", "いもうとはさむがりなので、いつもセーターをきています。", "Minha irmã mais nova sente muito frio, então sempre usa suéter."),
("弟は怖がりで、一人で寝られません。", "おとうとはこわがりで、ひとりでねられません。", "Meu irmão mais novo é medroso e não consegue dormir sozinho."),
("彼女は恥ずかしがり屋です。", "かのじょははずかしがりやです。", "Ela é tímida."),
("私は暑がりだから、夏が苦手です。", "わたしはあつがりだから、なつがにがてです。", "Eu sinto muito calor, então não me dou bem com o verão."),
("うちの犬はさびしがりで、いつも私の後をついてくる。", "うちのいぬはさびしがりで、いつもわたしのあとをついてくる。", "Nosso cachorro odeia ficar sozinho e sempre me segue."),
],
R=[
("父は寒____で、冬はあまり外に出ません。", "Meu pai sente muito frio e quase não sai no inverno.", ["がり"]),
("息子は怖____なので、お化け屋敷に入れません。", "Meu filho é medroso, então não consegue entrar na casa assombrada.", ["がり"]),
("あの子は恥ずかし____屋で、人前で話せない。", "Aquela criança é tímida e não consegue falar em público.", ["がり"]),
("母は暑____だから、すぐエアコンをつける。", "Minha mãe sente muito calor, então logo liga o ar-condicionado.", ["がり"]),
("一人暮らしの祖母はさびし____なので、よく電話します。", "Minha avó, que mora sozinha, se sente solitária com facilidade, então ligo com frequência.", ["がり"]),
],
),
dict(
n=16,
jp="〜がる・〜がっている",
rd="garu / gatte iru",
tr="Mostrar (sentimento) / Parecer sentir / Querer (outra pessoa)",
ex="""がる é usado para descrever os sentimentos ou desejos de outra pessoa a partir do que ela demonstra. Equivale a "mostrar que sente", "parecer sentir".

Em japonês, sentimentos como querer, ter medo, achar ruim ou sentir saudade são considerados internos. Só a própria pessoa pode afirmar o que sente. Por isso, para falar do sentimento de outra pessoa, o japonês usa がる, que descreve o comportamento visível.

Para formar, tira-se o い do adjetivo e acrescenta-se がる. Com たい e ほしい, formam-se たがる e ほしがる, para dizer o que outra pessoa quer.

Quando se fala de um estado no momento, usa-se がっている. Quando se fala de uma tendência geral, usa-se がる.

Como がる vira um verbo de ação, o objeto passa a ser marcado com を.""",
st="""Adjetivo de sentimento sem い + がる
Adjetivo な + がる (嫌がる)
ほしい → ほしがる
Verbo sem ます + たい → たがる

Estado atual: がっている
Tendência geral: がる

Objeto: Substantivo + を + 〜がる""",
no="""Usar がる para falar de si mesmo é estranho, exceto ao se descrever de fora, como numa história.

Falar de superiores com がる pode soar desrespeitoso, porque descreve o comportamento deles como algo observado. Nesses casos, é melhor usar formas como そうだ ou citar o que eles disseram.

Na negativa, がらない indica que a pessoa não demonstra aquele sentimento, como uma criança que não tem medo de algo.""",
bf="がる",
rx="がる|がって|がった|がります|がりました|がらない",
tk=["がる"],
va=["がる", "がっている", "がります", "がった", "たがる", "ほしがる"],
E=[
("弟は新しいゲームを欲しがっています。", "おとうとはあたらしいゲームをほしがっています。", "Meu irmão mais novo está querendo um jogo novo."),
("子供が注射を怖がっている。", "こどもがちゅうしゃをこわがっている。", "A criança está com medo da injeção."),
("妹は一人で留守番をするのを嫌がった。", "いもうとはひとりでるすばんをするのをいやがった。", "Minha irmã mais nova não quis ficar sozinha em casa."),
("犬が外に出たがっています。", "いぬがそとにでたがっています。", "O cachorro está querendo sair."),
("彼は本当は寂しがっているのかもしれない。", "かれはほんとうはさびしがっているのかもしれない。", "Talvez ele, na verdade, esteja se sentindo sozinho."),
],
R=[
("娘はかわいい服を欲し____います。", "Minha filha está querendo roupas bonitinhas.", ["がって"]),
("子供たちは暗い所を怖____。", "As crianças têm medo de lugares escuros.", ["がります", "がる"]),
("うちの猫は水を嫌____。", "Nosso gato não gosta de água.", ["がります", "がる"]),
("弟はアメリカに行き____います。", "Meu irmão mais novo está querendo ir para os Estados Unidos.", ["たがって"]),
("友達が引っ越して、息子は寂し____いる。", "Um amigo se mudou, e meu filho está se sentindo sozinho.", ["がって"]),
],
),
dict(
n=17,
jp="ございます",
rd="gozaimasu",
tr="Há / Tem (muito formal)",
ex="""ございます é a forma muito educada de あります. Ela significa "há" ou "tem", mas com um nível de respeito bem alto.

É usada principalmente por funcionários de lojas, hotéis, empresas e serviços, quando falam com clientes. Também aparece em discursos e em situações formais.

Ela pertence ao 丁寧語, a linguagem polida que deixa a frase elegante e gentil com quem ouve.

ございます também aparece em expressões fixas muito comuns, como ありがとうございます e おはようございます, além de 申し訳ございません, um pedido de desculpas bem formal.

No dia a dia, com amigos e colegas, o normal é usar あります.""",
st="""Substantivo + が + ございます (há / tem)
Substantivo + は + ございますか (pergunta)

Negativo: ございません
Passado: ございました

Expressões fixas: ありがとうございます / おはようございます / 申し訳ございません / おめでとうございます""",
no="""Com です, a forma muito educada é でございます. Com あります, é ございます. Essa distinção ajuda a saber qual usar.

ございます só substitui ある para coisas. Para pessoas, a forma respeitosa de いる é いらっしゃる, e a humilde é おる.

Em lojas, frases como 〜もございます são usadas para oferecer outras opções ao cliente.""",
bf="ございます",
rx="ございます|ございません|ございました",
tk=["ございます"],
va=["ございます", "ございません", "ございました"],
E=[
("二階にレストランがございます。", "にかいにレストランがございます。", "Há um restaurante no segundo andar."),
("何かご質問はございますか。", "なにかごしつもんはございますか。", "Há alguma pergunta?"),
("お待たせして、申し訳ございません。", "おまたせして、もうしわけございません。", "Pedimos desculpas pela espera."),
("赤いセーターもございますよ。", "あかいセーターもございますよ。", "Também temos suéteres vermelhos."),
("ご来店、ありがとうございます。", "ごらいてん、ありがとうございます。", "Obrigado por visitar nossa loja."),
],
R=[
("駅の近くに駐車場が____。", "Há um estacionamento perto da estação.", ["ございます"]),
("何かご意見は____か。", "Há alguma opinião?", ["ございます"]),
("ご迷惑をおかけして、大変申し訳____。", "Pedimos sinceras desculpas pelo transtorno.", ["ございません"]),
("「Mサイズはありますか。」「はい、____。」", "\"Tem tamanho M?\" \"Sim, temos.\"", ["ございます"]),
("恐れ入りますが、ただいま空いている席が____。", "Lamentamos, mas no momento não há lugares disponíveis.", ["ございません"]),
],
),
dict(
n=18,
jp="〜始める",
rd="hajimeru",
tr="Começar a",
ex="""始める, ligado a outro verbo, indica o começo de uma ação. Equivale a "começar a".

A estrutura junta o verbo na forma ます sem ます com 始める. O resultado funciona como um verbo do grupo 2 e se conjuga normalmente: 始めます, 始めた, 始めて.

Ele pode indicar tanto ações que a pessoa decide começar, como estudar ou trabalhar, quanto mudanças naturais, como começar a chover ou as flores começarem a abrir.

Comparado a 出す, 始める é neutro e serve para qualquer começo. 出す destaca que o começo foi repentino ou inesperado.""",
st="""Verbo na forma ます sem ます + 始める

Educado: 始めます
Passado: 始めた / 始めました

Escrita: 始める / はじめる""",
no="""O oposto de 始める é 終わる (terminar de) ou やむ, no caso da chuva. Com verbos, também se usa 〜終わる, como em 読み終わる (terminar de ler).

Sozinho, 始める significa "começar algo" e é transitivo: 授業を始める (começar a aula). Já 始まる é intransitivo: 授業が始まる (a aula começa).

Com ações de um instante, como chegar ou acordar, 始める normalmente não é usado, porque não faz sentido "começar" uma ação que acontece de uma vez.""",
bf="始める",
rx="始める|始め|はじめ",
tk=["始める"],
va=["始める", "始めます", "始めた", "始めました", "はじめる"],
E=[
("去年から日本語を勉強し始めました。", "きょねんからにほんごをべんきょうしはじめました。", "Comecei a estudar japonês no ano passado."),
("雨が降り始めた。", "あめがふりはじめた。", "Começou a chover."),
("子供が歩き始めました。", "こどもがあるきはじめました。", "A criança começou a andar."),
("この本は昨日読み始めたばかりです。", "このほんはきのうよみはじめたばかりです。", "Acabei de começar a ler este livro ontem."),
("桜が咲き始めると、春が来たと感じます。", "さくらがさきはじめると、はるがきたとかんじます。", "Quando as cerejeiras começam a florir, sinto que a primavera chegou."),
],
R=[
("先月からピアノを習い____。", "Comecei a aprender piano no mês passado.", ["始めました", "はじめました", "始めた", "はじめた"]),
("九月になって、木の葉が赤くなり____。", "Chegou setembro, e as folhas das árvores começaram a ficar vermelhas.", ["始めた", "始めました", "はじめた", "はじめました"]),
("何時から仕事をし____か。", "A que horas você vai começar a trabalhar?", ["始めます", "はじめます"]),
("最近、毎朝ジョギングをし____。", "Recentemente, comecei a correr toda manhã.", ["始めました", "はじめました", "始めた", "はじめた"]),
("冬になると、みんな風邪をひき____。", "Quando chega o inverno, todo mundo começa a pegar resfriado.", ["始める", "始めます", "はじめる", "はじめます"]),
],
),
dict(
n=19,
jp="〜はずだ",
rd="hazu da",
tr="Deve / Deveria / Era para",
ex="""はずだ é usado para dizer que algo deve ser verdade, com base em informações, lógica ou conhecimento. Equivale a "deve", "deveria" ou "era para".

A diferença em relação a だろう e かもしれない é a confiança. はずだ mostra que quem fala tem um motivo concreto para acreditar naquilo: um horário marcado, um fato conhecido, uma lógica clara.

Ele é muito usado para expectativas baseadas em fatos, como "ele já deve ter chegado, porque saiu cedo".

No passado, はずだった indica algo que era esperado, mas não aconteceu. E com のに, はずなのに mostra surpresa ou frustração quando a realidade foi diferente do esperado.

はず funciona como um substantivo, então se liga como tal: verbos e adjetivos na forma simples, adjetivos な com な, substantivos com の.""",
st="""Verbo (forma simples) + はずだ / はずです
Adjetivo い + はずだ
Adjetivo な + な + はずだ
Substantivo + の + はずだ

Passado (era para, mas não foi): はずだった / はずでした
Contraste: はずなのに""",
no="""はずだ não expressa obrigação moral. Para "você deveria fazer isso" no sentido de dever, o japonês usa べきだ ou ほうがいい.

A forma negativa はずがない significa "não tem como", e é bem forte. Já ないはずだ significa "não deve ser" e é mais neutra.

Quando você mesmo não lembra direito, はずだ também serve para dizer "tenho certeza de que fiz isso", como ao procurar algo que tinha guardado.""",
bf="はずだ",
rx="はずだ|はずです|はずだった|はずでした|はずなのに|はずの",
tk=["はず", "だ"],
va=["はずだ", "はずです", "はずだった", "はずでした", "はずなのに"],
E=[
("田中さんはもう家に着いたはずです。", "たなかさんはもういえについたはずです。", "O Tanaka já deve ter chegado em casa."),
("彼は日本に十年住んでいたから、日本語が上手なはずだ。", "かれはにほんにじゅうねんすんでいたから、にほんごがじょうずなはずだ。", "Ele morou dez anos no Japão, então deve falar japonês bem."),
("会議は三時からのはずです。", "かいぎはさんじからのはずです。", "A reunião deve ser a partir das três."),
("かぎはかばんに入れたはずなのに、ない。", "かぎはかばんにいれたはずなのに、ない。", "Eu tinha certeza de que coloquei a chave na bolsa, mas ela não está lá."),
("今日は休みのはずだったが、急に仕事が入った。", "きょうはやすみのはずだったが、きゅうにしごとがはいった。", "Era para hoje ser folga, mas de repente surgiu trabalho."),
],
R=[
("手紙は昨日出したから、明日には届く____。", "Mandei a carta ontem, então deve chegar amanhã.", ["はずです", "はずだ"]),
("彼は毎日練習しているから、上手な____。", "Ele treina todo dia, então deve ser bom.", ["はずです", "はずだ"]),
("店は十時に開く____ですが、まだ閉まっています。", "Era para a loja abrir às dez, mas ainda está fechada.", ["はず"]),
("この薬を飲めば、熱が下がる____。", "Se tomar este remédio, a febre deve baixar.", ["はずです", "はずだ"]),
("確かに机の上に置いた____なのに、見つからない。", "Tenho certeza de que deixei em cima da mesa, mas não encontro.", ["はず"]),
],
),
dict(
n=20,
jp="〜はずがない",
rd="hazu ga nai",
tr="Não tem como / É impossível que / Não pode ser",
ex="""はずがない é usado para dizer, com muita convicção, que algo é impossível ou não pode ser verdade. Equivale a "não tem como" ou "é impossível que".

Ela é a forma negativa forte de はずだ. Quem fala tem um motivo claro para acreditar que aquilo simplesmente não pode acontecer, como um fato conhecido ou uma lógica óbvia.

É comum em situações de descrença, quando alguém ouve algo que contraria tudo o que sabe, ou ao defender alguém de uma acusação.

A ligação é igual à de はずだ: verbos e adjetivos na forma simples, adjetivos な com な, substantivos com の.

A versão com は, はずはない, tem o mesmo sentido e às vezes soa um pouco mais suave.""",
st="""Verbo (forma simples) + はずがない
Adjetivo い + はずがない
Adjetivo な + な + はずがない
Substantivo + の + はずがない

Educado: はずがありません
Variação: はずはない / はずはありません""",
no="""Compare: ないはずだ significa "não deve" (expectativa), enquanto はずがない significa "é impossível" (convicção forte).

Em conversas, a expressão そんなはずはない é muito usada para reagir a algo inacreditável: "não pode ser!".

Por ser tão forte, はずがない pode soar teimoso se usado sem um bom motivo.""",
bf="はずがない",
rx="はずがない|はずがありません|はずはない|はずはありません",
tk=["はず", "が", "ない"],
va=["はずがない", "はずがありません", "はずはない", "はずはありません"],
E=[
("彼がそんなことを言うはずがない。", "かれがそんなことをいうはずがない。", "Não tem como ele dizer uma coisa dessas."),
("あんなに勉強したのだから、落ちるはずがありません。", "あんなにべんきょうしたのだから、おちるはずがありません。", "Com tanto estudo, é impossível ser reprovado."),
("鍵をかけたから、ドアが開いているはずがない。", "かぎをかけたから、ドアがあいているはずがない。", "Eu tranquei, então não tem como a porta estar aberta."),
("田中さんは今アメリカにいるので、ここにいるはずがない。", "たなかさんはいまアメリカにいるので、ここにいるはずがない。", "O Tanaka está nos Estados Unidos agora, então não tem como ele estar aqui."),
("こんなに安いのに、おいしいはずはないと思っていた。", "こんなにやすいのに、おいしいはずはないとおもっていた。", "Achava que, sendo tão barato, não tinha como ser gostoso."),
],
R=[
("彼女は正直な人だから、うそをつく____。", "Ela é uma pessoa honesta, então não tem como mentir.", ["はずがない", "はずがありません", "はずはない", "はずはありません"]),
("まだ朝の六時だから、店が開いている____。", "Ainda são seis da manhã, então não tem como a loja estar aberta.", ["はずがない", "はずがありません", "はずはない", "はずはありません"]),
("初めて作ったのに、そんなに上手にできる____。", "É a primeira vez que faço, não tem como ficar tão bom.", ["はずがない", "はずがありません", "はずはない", "はずはありません"]),
("あの優しい先生が怒る____。", "Não tem como aquele professor tão gentil ficar bravo.", ["はずがない", "はずがありません", "はずはない", "はずはありません"]),
("子供にこんな難しい問題がわかる____。", "Não tem como uma criança entender uma questão tão difícil.", ["はずがない", "はずがありません", "はずはない", "はずはありません"]),
],
),
]
