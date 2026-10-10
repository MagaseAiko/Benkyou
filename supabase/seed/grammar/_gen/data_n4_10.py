G = [
dict(
n=91,
jp="〜てあげる",
rd="te ageru",
tr="Fazer (algo) para alguém / Fazer o favor de",
ex="""てあげる é usado para dizer que você, ou alguém do seu grupo, faz algo em benefício de outra pessoa. Equivale a "fazer algo para alguém".

Ele junta a forma て do verbo com あげる (dar). A ideia é "dar" uma ação como favor: ensinar, ajudar, comprar algo, emprestar.

A pessoa que recebe o favor é marcada com に, e quem faz a ação costuma ser o sujeito.

Um ponto cultural importante: como てあげる destaca que você está fazendo um favor, usá-lo diretamente com superiores, ou ao oferecer ajuda a alguém que não é próximo, pode soar arrogante. Nesses casos, prefere-se ましょうか ou formas humildes como お〜します.

Com pessoas próximas, crianças e animais, てあげる é natural.""",
st="""Pessoa + に + Objeto + を + Verbo na forma て + あげる
Verbo na forma て + あげる

Passado: てあげた / てあげました
Pedido para outra pessoa: てあげてください
Mais humilde: てさしあげる""",
no="""Para crianças, animais e plantas, também se usa てやる, que é mais informal.

Para ações feitas por outros em seu benefício, usa-se てくれる; para ações que você pede ou recebe, usa-se てもらう.

Ao contar algo que você fez por alguém, てあげた é natural entre amigos, mas pode soar como se gabar se exagerado.""",
bf="てあげる",
rx="てあげ|であげ",
tk=["て", "あげる"],
va=["てあげる", "てあげた", "てあげました", "てあげて"],
E=[
("弟に宿題を教えてあげました。", "おとうとにしゅくだいをおしえてあげました。", "Ensinei a lição para o meu irmão mais novo."),
("友達の引っ越しを手伝ってあげた。", "ともだちのひっこしをてつだってあげた。", "Ajudei meu amigo na mudança."),
("母の日に、母に花を買ってあげたいです。", "ははのひに、ははにはなをかってあげたいです。", "No Dia das Mães, quero comprar flores para minha mãe."),
("毎晩、子供に本を読んであげます。", "まいばん、こどもにほんをよんであげます。", "Toda noite, leio um livro para o meu filho."),
("道に迷っている人に、駅までの道を教えてあげた。", "みちにまよっているひとに、えきまでのみちをおしえてあげた。", "Ensinei o caminho até a estação para uma pessoa que estava perdida."),
],
R=[
("妹に新しい服を買っ____。", "Comprei roupas novas para a minha irmã mais nova.", ["てあげました", "てあげた"]),
("駅で、おばあさんの荷物を持っ____。", "Na estação, carreguei a bagagem de uma senhora idosa.", ["てあげました", "てあげた"]),
("友達に私の辞書を貸し____。", "Emprestei meu dicionário para um amigo.", ["てあげました", "てあげた"]),
("毎晩、子供に絵本を読ん____います。", "Toda noite, leio livros ilustrados para o meu filho.", ["であげて"]),
("困っている人がいたら、助け____ください。", "Se houver alguém em dificuldade, ajude, por favor.", ["てあげて"]),
],
),
dict(
n=92,
jp="〜てほしい",
rd="te hoshii",
tr="Querer que (alguém) faça / Gostaria que",
ex="""てほしい é usado para dizer que você quer que outra pessoa faça algo, ou que algo aconteça. Equivale a "querer que..." ou "gostaria que...".

A diferença em relação a たい é quem faz a ação. Com たい, é você que quer fazer. Com てほしい, você quer que outra pessoa faça.

A pessoa de quem se espera a ação é marcada com に. Para desejos sobre coisas que não são pessoas, como o tempo ou uma situação, ela é marcada com が.

Na forma negativa, ないでほしい significa "não quero que...", "gostaria que não...".

Dizer てほしい diretamente a superiores pode soar exigente. Com eles, é melhor usar pedidos como ていただけませんか.""",
st="""Pessoa + に + Verbo na forma て + ほしい
Coisa / Situação + が + Verbo na forma て + ほしい
Verbo na forma ない + で + ほしい (não quero que...)

Educado: てほしいです
Pedido indireto: てほしいんですが…

Escrita: ほしい / 欲しい""",
no="""Terminar com てほしいんですが… é uma forma comum de fazer um pedido de modo indireto, deixando a frase em aberto.

Com superiores, てほしい soa como uma exigência. Prefira ていただきたいです ou ていただけませんか.

Como ほしい é um adjetivo い, てほしい se conjuga como tal: てほしくない, てほしかった.""",
bf="てほしい",
rx="てほしい|でほしい|て欲しい|で欲しい|てほしく|でほしく",
tk=["て", "ほしい"],
va=["てほしい", "てほしいです", "ないでほしい", "て欲しい"],
E=[
("もっとゆっくり話してほしい。", "もっとゆっくりはなしてほしい。", "Queria que você falasse mais devagar."),
("母にはいつまでも元気でいてほしいです。", "ははにはいつまでもげんきでいてほしいです。", "Quero que minha mãe continue saudável para sempre."),
("このことは誰にも言わないでほしい。", "このことはだれにもいわないでほしい。", "Não quero que você conte isso para ninguém."),
("早く春が来てほしいなあ。", "はやくはるがきてほしいなあ。", "Queria que a primavera chegasse logo."),
("すみません、この仕事を手伝ってほしいんですが…。", "すみません、このしごとをてつだってほしいんですが…。", "Com licença, eu queria que você me ajudasse com este trabalho..."),
],
R=[
("明日は早く来____。", "Quero que você venha cedo amanhã.", ["てほしい", "てほしいです"]),
("彼にもっと勉強し____です。", "Quero que ele estude mais.", ["てほしい"]),
("この話は秘密にし____。", "Quero que esta história fique em segredo.", ["てほしい"]),
("部屋でタバコを吸わない____。", "Não quero que você fume no quarto.", ["でほしい"]),
("雨が早くやん____なあ。", "Queria que a chuva parasse logo.", ["でほしい"]),
],
),
dict(
n=93,
jp="〜ていく",
rd="te iku",
tr="Ir (fazendo) / Levar / Daqui em diante",
ex="""ていく junta a forma て de um verbo com 行く (ir). A ideia central é movimento ou mudança que se afasta de quem fala, no espaço ou no tempo.

Os usos principais são:
• Fazer algo e ir: fazer uma ação antes de sair, ou ir de certo modo, como ir a pé.
• Levar algo ou alguém: 持っていく (levar uma coisa), 連れていく (levar uma pessoa).
• Movimento para longe: algo que se afasta de quem fala, como pássaros voando para longe.
• Mudança daqui para o futuro: algo que vai continuar mudando ou acontecendo a partir de agora, como esfriar cada vez mais ou continuar estudando.

O oposto é てくる, que indica movimento ou mudança em direção a quem fala, ou do passado até agora.""",
st="""Verbo na forma て + いく

Educado: ていきます
Passado: ていった / ていきました

Escrita: ていく / て行く""",
no="""No uso de mudança, ていく olha para o futuro: "daqui para frente". てくる olha do passado até agora: "vem mudando até hoje".

Na escrita, quando ていく tem sentido abstrato (mudança no tempo), costuma ser escrito em hiragana.

Na fala casual, ていく às vezes vira てく, como em 持ってく.""",
bf="ていく",
rx="ていく|ていき|ていっ|でいく|でいき|でいっ|て行|で行",
tk=["て", "いく"],
va=["ていく", "ていきます", "ていった", "て行く"],
E=[
("雨が降るから、傘を持っていってください。", "あめがふるから、かさをもっていってください。", "Vai chover, então leve o guarda-chuva."),
("駅まで歩いていきます。", "えきまであるいていきます。", "Vou a pé até a estação."),
("これからも日本語の勉強を続けていきたい。", "これからもにほんごのべんきょうをつづけていきたい。", "Daqui em diante, quero continuar estudando japonês."),
("これから寒くなっていくので、体に気をつけてください。", "これからさむくなっていくので、からだにきをつけてください。", "Daqui para frente vai esfriar cada vez mais, então cuide da saúde."),
("鳥が南へ飛んでいった。", "とりがみなみへとんでいった。", "Os pássaros foram voando para o sul."),
],
R=[
("雨が降りそうだから、傘を持っ____ほうがいいよ。", "Parece que vai chover, então é melhor levar o guarda-chuva.", ["ていった"]),
("学校までバスに乗っ____。", "Vou de ônibus até a escola.", ["ていきます", "ていく"]),
("これから日本の人口は減っ____でしょう。", "Daqui em diante, a população do Japão deve continuar diminuindo.", ["ていく"]),
("子供たちは公園へ走っ____。", "As crianças foram correndo para o parque.", ["ていきました", "ていった"]),
("せっかくだから、ここで朝ご飯を食べ____ませんか。", "Já que estamos aqui, que tal tomar café da manhã antes de ir?", ["ていき"]),
],
),
dict(
n=94,
jp="〜ていた",
rd="te ita",
tr="Estava fazendo / Fazia / Tinha (estado)",
ex="""ていた é o passado de ている. Ele tem os mesmos usos de ている, mas olhando para o passado.

Os usos principais são:
• Ação em andamento no passado: o que alguém estava fazendo em certo momento, como "estava vendo TV quando o telefone tocou".
• Estado no passado: uma situação que durava, como "morava em Osaka quando era criança".
• Hábito no passado: algo que a pessoa fazia regularmente, como "corria todo dia quando era estudante".
• Descoberta de um estado: ao chegar a um lugar, encontrar algo já de certo jeito, como "quando acordei, estava nevando".

É muito usado em histórias e relatos, para dar o contexto em que outra ação aconteceu.""",
st="""Verbo na forma て + いた
Verbo na forma て + いました (educado)

Negativo: ていなかった / ていませんでした
Fala casual: てた""",
no="""Compare: 食べた indica uma ação concluída; 食べていた indica que a ação estava acontecendo naquele momento.

Junto com とき, ていた descreve o pano de fundo de um acontecimento: "quando X aconteceu, eu estava fazendo Y".

Na fala, ていた costuma ser reduzido para てた.""",
bf="ていた",
rx="ていた|でいた|ていました|でいました",
tk=["て", "いた"],
va=["ていた", "ていました", "でいた", "てた"],
E=[
("昨日の夜は、ずっとテレビを見ていた。", "きのうのよるは、ずっとテレビをみていた。", "Ontem à noite, fiquei vendo TV o tempo todo."),
("電話が鳴ったとき、お風呂に入っていました。", "でんわがなったとき、おふろにはいっていました。", "Quando o telefone tocou, eu estava no banho."),
("子供のころ、大阪に住んでいた。", "こどものころ、おおさかにすんでいた。", "Quando eu era criança, morava em Osaka."),
("朝起きたら、雪が降っていました。", "あさおきたら、ゆきがふっていました。", "Quando acordei de manhã, estava nevando."),
("学生のころ、毎日ジョギングをしていました。", "がくせいのころ、まいにちジョギングをしていました。", "Na época de estudante, eu corria todos os dias."),
],
R=[
("昨日の三時ごろ、何をし____か。", "O que você estava fazendo ontem por volta das três?", ["ていました"]),
("彼が来たとき、私は本を読ん____。", "Quando ele chegou, eu estava lendo um livro.", ["でいました", "でいた"]),
("十年前、父は銀行で働い____。", "Dez anos atrás, meu pai trabalhava num banco.", ["ていました", "ていた"]),
("家に帰ったら、ドアが開い____。", "Quando voltei para casa, a porta estava aberta.", ["ていました", "ていた"]),
("昔、この町には大きな川が流れ____。", "Antigamente, passava um rio grande por esta cidade.", ["ていました", "ていた"]),
],
),
dict(
n=95,
jp="〜ていただけませんか",
rd="te itadakemasen ka",
tr="Poderia (fazer) por favor? / O senhor poderia...?",
ex="""ていただけませんか é uma forma muito educada de pedir algo a alguém. Equivale a "poderia, por favor...?" ou "o senhor poderia...?".

Ela vem de ていただく, a forma humilde de てもらう (receber uma ação). A ideia literal é "eu não poderia receber de você o favor de fazer isso?".

A forma negativa com pergunta deixa o pedido ainda mais suave, porque dá liberdade ao outro de recusar. Por isso, é ideal para pedir algo a superiores, clientes, desconhecidos e em situações formais.

ていただけますか também é educada, mas ていただけませんか soa um pouco mais gentil e humilde.""",
st="""Verbo na forma て + いただけませんか
Verbo na forma て + いただけますか (um pouco menos suave)

Do mais casual ao mais formal:
てくれる？ → てくれませんか → てもらえませんか → ていただけますか → ていただけませんか""",
no="""Em e-mails de trabalho, ていただけませんでしょうか é uma versão ainda mais formal.

Quem faz a ação é a outra pessoa, mas quem fala fica como "receptor" do favor. Por isso, é uma forma humilde.

Para aceitar um pedido assim, respostas comuns são はい、いいですよ ou かしこまりました, no atendimento.""",
bf="ていただけませんか",
rx="ていただけませんか|でいただけませんか|ていただけますか|でいただけますか",
tk=["て", "いただけません", "か"],
va=["ていただけませんか", "ていただけますか", "でいただけませんか"],
E=[
("すみません、もう一度説明していただけませんか。", "すみません、もういちどせつめいしていただけませんか。", "Desculpe, poderia explicar mais uma vez?"),
("この書類を見ていただけませんか。", "このしょるいをみていただけませんか。", "O senhor poderia dar uma olhada neste documento?"),
("少し待っていただけますか。", "すこしまっていただけますか。", "Poderia esperar um pouco?"),
("駅までの道を教えていただけませんか。", "えきまでのみちをおしえていただけませんか。", "Poderia me ensinar o caminho até a estação?"),
("この漢字の読み方を教えていただけませんか。", "このかんじのよみかたをおしえていただけませんか。", "Poderia me ensinar como se lê este kanji?"),
],
R=[
("すみません、写真を撮っ____。", "Com licença, poderia tirar uma foto?", ["ていただけませんか", "ていただけますか"]),
("もう少しゆっくり話し____。", "Poderia falar um pouco mais devagar?", ["ていただけませんか", "ていただけますか"]),
("先生、その本を貸し____。", "Professor, poderia me emprestar esse livro?", ["ていただけませんか", "ていただけますか"]),
("明日の会議の資料を読ん____。", "Poderia ler os documentos da reunião de amanhã?", ["でいただけませんか", "でいただけますか"]),
("ここにお名前を書い____。", "Poderia escrever seu nome aqui?", ["ていただけませんか", "ていただけますか"]),
],
),
dict(
n=96,
jp="〜てくれる",
rd="te kureru",
tr="Fazer (algo) por mim / Fazer o favor de",
ex="""てくれる é usado quando outra pessoa faz algo em benefício de quem fala ou do seu grupo. Equivale a "fazer algo por mim" ou "fazer o favor de".

Ele junta a forma て do verbo com くれる (dar para mim). A ideia é que alguém "deu" uma ação em seu favor.

Quem faz a ação é o sujeito, marcado com が ou は. Quem recebe o favor costuma ser "eu", e geralmente não aparece na frase.

Usar てくれる mostra gratidão. Por isso, os japoneses o usam muito ao contar o que outras pessoas fizeram por eles.

Na forma de pergunta negativa, てくれない？ ou てくれませんか, ele vira um pedido: "você poderia...?".""",
st="""Pessoa + が + Verbo na forma て + くれる
Pessoa + が + (私に) + Objeto + を + Verbo て + くれる

Passado: てくれた / てくれました
Pedido: てくれる？ / てくれない？ / てくれませんか
Respeitoso: てくださる""",
no="""A escolha entre てあげる, てくれる e てもらう depende de quem faz e de quem recebe. てくれる sempre tem quem fala (ou seu grupo) como beneficiário.

Sem てくれる, uma frase como "meu amigo me levou até a estação" soaria fria em japonês, como se não houvesse gratidão.

Com superiores, a forma respeitosa é てくださる.""",
bf="てくれる",
rx="てくれ|でくれ",
tk=["て", "くれる"],
va=["てくれる", "てくれた", "てくれました", "てくれない", "てくれませんか"],
E=[
("友達が駅まで送ってくれました。", "ともだちがえきまでおくってくれました。", "Meu amigo me levou até a estação."),
("今朝、母がお弁当を作ってくれた。", "けさ、ははがおべんとうをつくってくれた。", "Hoje de manhã, minha mãe fez marmita para mim."),
("先輩が仕事を手伝ってくれました。", "せんぱいがしごとをてつだってくれました。", "Meu veterano me ajudou no trabalho."),
("彼はいつも私の話を聞いてくれる。", "かれはいつもわたしのはなしをきいてくれる。", "Ele sempre me escuta."),
("ちょっと窓を開けてくれない？", "ちょっとまどをあけてくれない？", "Você pode abrir a janela rapidinho?"),
],
R=[
("雨の日に、田中さんが傘を貸し____。", "Num dia de chuva, o Tanaka me emprestou o guarda-chuva.", ["てくれました", "てくれた"]),
("父が誕生日に時計を買っ____。", "Meu pai me comprou um relógio de aniversário.", ["てくれました", "てくれた"]),
("日本人の友達が日本語を教え____。", "Um amigo japonês me ensinou japonês.", ["てくれました", "てくれた"]),
("ねえ、ちょっと手伝っ____？", "Ei, você pode me ajudar um pouco?", ["てくれない", "てくれる"]),
("姉が私の代わりに荷物を運ん____。", "Minha irmã mais velha carregou a bagagem no meu lugar.", ["でくれました", "でくれた"]),
],
),
dict(
n=97,
jp="〜てくる",
rd="te kuru",
tr="Vir (fazendo) / Ir e voltar / Começar a",
ex="""てくる junta a forma て de um verbo com 来る (vir). A ideia central é movimento ou mudança que se aproxima de quem fala, no espaço ou no tempo.

Os usos principais são:
• Ir, fazer algo e voltar: como "vou comprar algo e já volto". É muito comum em frases do dia a dia.
• Movimento em direção a quem fala: algo ou alguém que vem se aproximando, como uma criança correndo até você.
• Mudança até agora: algo que vem mudando do passado até o presente, como "vem esquentando".
• Começo de um fenômeno: algo que começa a acontecer e é percebido por quem fala, como começar a chover ou começar a doer.

O oposto é ていく, que indica movimento ou mudança se afastando de quem fala ou indo para o futuro.""",
st="""Verbo na forma て + くる

Educado: てきます
Passado: てきた / てきました
Mudança contínua: てきている""",
no="""A frase 行ってきます, dita ao sair de casa, vem desse uso: "vou e volto". A resposta é いってらっしゃい.

No uso de mudança, てくる olha do passado até agora. Para mudanças que vão continuar no futuro, usa-se ていく.

Na escrita, quando o sentido é abstrato, てくる costuma ser escrito em hiragana.""",
bf="てくる",
rx="てくる|てきた|てきま|てきて|でくる|できた",
tk=["て", "くる"],
va=["てくる", "てきます", "てきた", "てきました"],
E=[
("ちょっとコンビニで飲み物を買ってきます。", "ちょっとコンビニでのみものをかってきます。", "Vou rapidinho à loja de conveniência comprar bebida e já volto."),
("子供が私のところに走ってきました。", "こどもがわたしのところにはしってきました。", "A criança veio correndo até mim."),
("最近、暖かくなってきましたね。", "さいきん、あたたかくなってきましたね。", "Ultimamente vem esquentando, né?"),
("あ、雨が降ってきた。", "あ、あめがふってきた。", "Ah, começou a chover."),
("日本に住む外国人が増えてきている。", "にほんにすむがいこくじんがふえてきている。", "O número de estrangeiros morando no Japão vem aumentando."),
],
R=[
("ちょっと郵便局に行っ____。", "Vou rapidinho ao correio e já volto.", ["てきます", "てくる"]),
("向こうから犬が走っ____。", "Um cachorro veio correndo lá do outro lado.", ["てきました", "てきた"]),
("急にお腹が痛くなっ____。", "De repente, minha barriga começou a doer.", ["てきました", "てきた"]),
("寒くなっ____から、セーターを出しましょう。", "Começou a esfriar, então vamos tirar os suéteres.", ["てきた"]),
("窓から虫が入っ____。", "Entrou um inseto pela janela.", ["てきました", "てきた"]),
],
),
dict(
n=98,
jp="〜てみる",
rd="te miru",
tr="Experimentar / Tentar (fazer para ver)",
ex="""てみる é usado para dizer que alguém faz algo para experimentar ou ver como é. Equivale a "experimentar", "tentar" ou "fazer para ver".

Ele junta a forma て do verbo com みる (ver). A ideia literal é "fazer e ver o resultado".

É muito usado para falar de experiências novas: provar uma comida, visitar um lugar, vestir uma roupa, ler um livro.

Com たい, forma てみたい, que expressa vontade de experimentar algo. Com ください, forma てみてください, que convida alguém a experimentar.

No passado, てみた muitas vezes é seguido do resultado da experiência, como "fui ver, mas não era muito bom".""",
st="""Verbo na forma て + みる

Vontade: てみたい
Convite: てみてください
Passado: てみた / てみました
Sugestão: てみたらどう

Escrita: みる (em hiragana, nesse uso)""",
no="""Nesse uso, みる é sempre escrito em hiragana, mesmo que venha do verbo 見る.

てみる não é usado no sentido de "tentar e não conseguir". Para isso, o japonês usa ようとする, que aparece no N3.

A expressão 〜てみてもいいですか é uma forma educada de pedir para experimentar algo, como uma roupa numa loja.""",
bf="てみる",
rx="てみ|でみ",
tk=["て", "みる"],
va=["てみる", "てみたい", "てみた", "てみてください"],
E=[
("このケーキを食べてみてください。", "このケーキをたべてみてください。", "Experimente este bolo, por favor."),
("一度日本に行ってみたいです。", "いちどにほんにいってみたいです。", "Quero ir ao Japão pelo menos uma vez."),
("新しい店に行ってみたけど、あまりおいしくなかった。", "あたらしいみせにいってみたけど、あまりおいしくなかった。", "Fui conhecer a loja nova, mas não era muito gostosa."),
("わからないなら、先生に聞いてみたらどう？", "わからないなら、せんせいにきいてみたらどう？", "Se não entende, que tal perguntar ao professor?"),
("すみません、この服、着てみてもいいですか。", "すみません、このふく、きてみてもいいですか。", "Com licença, posso experimentar esta roupa?"),
],
R=[
("このシャツを着____もいいですか。", "Posso experimentar esta camisa?", ["てみて"]),
("一度、富士山に登っ____たいです。", "Quero subir o Monte Fuji pelo menos uma vez.", ["てみ"]),
("新しいゲームをし____けど、難しかった。", "Experimentei o jogo novo, mas era difícil.", ["てみた"]),
("その本、おもしろそうだから読ん____。", "Esse livro parece interessante, então vou ler para ver.", ["でみます", "でみる", "でみよう"]),
("先週、初めて自分で料理を作っ____ました。", "Semana passada, experimentei cozinhar sozinho pela primeira vez.", ["てみ"]),
],
),
dict(
n=99,
jp="〜てもらう",
rd="te morau",
tr="Receber (o favor de) / Pedir para alguém fazer",
ex="""てもらう é usado quando quem fala recebe uma ação de outra pessoa como favor. Equivale a "receber o favor de" ou "ter alguém que faça algo por você".

Ele junta a forma て do verbo com もらう (receber). A ideia é "recebi de alguém a ação de...".

A diferença em relação a てくれる é o foco. Com てくれる, o sujeito é quem faz o favor ("meu amigo me ajudou"). Com てもらう, o sujeito é quem recebe ("eu recebi ajuda do meu amigo"). A pessoa que fez a ação é marcada com に.

Muitas vezes, てもらう também indica que quem fala pediu a ação, como pedir para alguém cortar o cabelo ou consertar algo.

Com superiores, a forma humilde é ていただく.""",
st="""Pessoa + に + Objeto + を + Verbo na forma て + もらう

Passado: てもらった / てもらいました
Pedido: てもらえませんか / てもらえますか
Humilde: ていただく""",
no="""Para traduzir, muitas vezes é mais natural inverter: 友達に手伝ってもらった vira "meu amigo me ajudou".

Na pergunta てもらえませんか, o pedido soa mais educado que てくれませんか.

Com てもらう, quem fala geralmente é o beneficiário. Por isso, ela expressa gratidão de forma indireta.""",
bf="てもらう",
rx="てもら|でもら",
tk=["て", "もらう"],
va=["てもらう", "てもらった", "てもらいました", "てもらえませんか"],
E=[
("友達に宿題を手伝ってもらいました。", "ともだちにしゅくだいをてつだってもらいました。", "Meu amigo me ajudou com a lição."),
("母に髪を切ってもらった。", "ははにかみをきってもらった。", "Minha mãe cortou meu cabelo."),
("先生に作文を直してもらいました。", "せんせいにさくぶんをなおしてもらいました。", "O professor corrigiu minha redação."),
("医者に診てもらったほうがいいですよ。", "いしゃにみてもらったほうがいいですよ。", "É melhor você se consultar com um médico."),
("兄にパソコンの使い方を教えてもらった。", "あににパソコンのつかいかたをおしえてもらった。", "Meu irmão mais velho me ensinou a usar o computador."),
],
R=[
("田中さんに駅まで送っ____。", "O Tanaka me levou até a estação.", ["てもらいました", "てもらった"]),
("父に自転車を直し____。", "Meu pai consertou minha bicicleta.", ["てもらいました", "てもらった"]),
("友達に写真を撮っ____。", "Pedi para um amigo tirar uma foto minha.", ["てもらいました", "てもらった"]),
("店の人にケーキを箱に入れ____。", "O atendente colocou o bolo numa caixa para mim.", ["てもらいました", "てもらった"]),
("姉に日本語の手紙を読ん____。", "Minha irmã mais velha leu a carta em japonês para mim.", ["でもらいました", "でもらった"]),
],
),
dict(
n=100,
jp="〜ておく",
rd="te oku",
tr="Deixar feito / Fazer com antecedência / Deixar (como está)",
ex="""ておく junta a forma て do verbo com おく (colocar, deixar). Ele tem dois usos principais.

O primeiro é preparação: fazer algo com antecedência, pensando no futuro. Por exemplo, reservar o hotel antes da viagem, ler os documentos antes da reunião, comprar bebidas antes da festa.

O segundo é deixar algo como está, sem mudar, de propósito. Por exemplo, deixar a janela aberta ou deixar algo no lugar.

Ele também é usado para ações de organização, como colocar algo de volta no lugar depois de usar, para que fique pronto para a próxima vez.

Na fala casual, ておく é muito reduzido para とく, e でおく para どく.""",
st="""Verbo na forma て + おく

Educado: ておきます
Passado: ておいた / ておきました
Pedido: ておいてください
Fala casual: とく / といて / といた (でおく → どく)""",
no="""ておく é diferente de てある: ておく foca na ação de preparar; てある foca no estado já pronto.

Formas reduzidas como やっとく e 買っとく são muito comuns entre amigos.

A frase そのままにしておいてください significa "deixe como está, por favor".""",
bf="ておく",
rx="ておく|ておき|ておい|でおく|でおき|でおい|とく|といた|といて",
tk=["て", "おく"],
va=["ておく", "ておきます", "ておいた", "ておいてください", "とく"],
E=[
("旅行の前に、ホテルを予約しておきます。", "りょこうのまえに、ホテルをよやくしておきます。", "Antes da viagem, vou deixar o hotel reservado."),
("会議の前に資料を読んでおいてください。", "かいぎのまえにしりょうをよんでおいてください。", "Leia os documentos antes da reunião, por favor."),
("パーティーのために、飲み物を買っておいた。", "パーティーのために、のみものをかっておいた。", "Deixei as bebidas compradas para a festa."),
("使ったら、元の場所に戻しておいてください。", "つかったら、もとのばしょにもどしておいてください。", "Depois de usar, coloque de volta no lugar, por favor."),
("暑いから、窓は開けておいてもいいですよ。", "あついから、まどはあけておいてもいいですよ。", "Está quente, então pode deixar a janela aberta."),
],
R=[
("お客さんが来る前に、部屋を掃除し____。", "Vou limpar o quarto antes de as visitas chegarem.", ["ておきます", "ておく", "ておきましょう"]),
("試験の前に、よく復習し____ください。", "Revisem bem antes da prova, por favor.", ["ておいて"]),
("寝る前に、明日の準備をし____。", "Antes de dormir, vou deixar tudo pronto para amanhã.", ["ておきます", "ておく"]),
("出かける前に、切符を買っ____。", "Antes de sair, comprei a passagem com antecedência.", ["ておきました", "ておいた"]),
("暑いから、エアコンをつけ____ね。", "Está quente, então vou deixar o ar-condicionado ligado, tá?", ["ておく", "とく"]),
],
),
]
