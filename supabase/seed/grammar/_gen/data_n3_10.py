G = [
dict(
n=91,
jp="〜のでしょうか",
rd="no deshou ka",
tr="Será que...? / Poderia me dizer...? (pergunta educada)",
ex="""のでしょうか é uma forma muito educada e suave de fazer uma pergunta. Equivale a "será que...?" ou "poderia me dizer...?".

Ela junta の (explicação), でしょう (suposição) e か (pergunta). O resultado é uma pergunta indireta, que não pressiona o ouvinte. Quem pergunta mostra que quer entender uma situação, sem exigir uma resposta direta.

É muito usada para pedir informações a desconhecidos, para perguntar algo delicado no trabalho e para expressar dúvidas ou preocupações, inclusive falando consigo mesmo.

Na fala, の costuma virar ん, formando んでしょうか.

Com substantivos e adjetivos な, usa-se なのでしょうか.""",
st="""Verbo / Adjetivo い (forma simples) + のでしょうか
Substantivo / Adjetivo な + な + のでしょうか

Fala: 〜んでしょうか
Pedido de orientação: Verbo ば + いいのでしょうか""",
no="""Comparando: ですか é uma pergunta direta; のですか pede explicação; のでしょうか é a forma mais suave e humilde.

Em reuniões, のでしょうか também serve para levantar uma dúvida sobre uma decisão sem soar como crítica: 本当にこれでいいのでしょうか.

Em textos, a frase pode ficar como uma pergunta retórica, convidando o leitor a refletir.""",
bf="のでしょうか",
rx="のでしょうか|んでしょうか",
tk=["の", "でしょう", "か"],
va=["のでしょうか", "んでしょうか", "なのでしょうか"],
E=[
("すみません、駅はどこにあるのでしょうか。", "すみません、えきはどこにあるのでしょうか。", "Com licença, poderia me dizer onde fica a estação?"),
("どうして彼は来ないのでしょうか。", "どうしてかれはこないのでしょうか。", "Por que será que ele não vem?"),
("この書類は、誰に出せばいいのでしょうか。", "このしょるいは、だれにだせばいいのでしょうか。", "Para quem devo entregar este documento?"),
("明日の会議は何時からなのでしょうか。", "あしたのかいぎはなんじからなのでしょうか。", "A reunião de amanhã é a partir de que horas?"),
("本当にこれでいいのでしょうか。", "ほんとうにこれでいいのでしょうか。", "Será que está mesmo tudo bem assim?"),
],
R=[
("どうすれば日本語が上手になる____。", "O que será que eu devo fazer para melhorar meu japonês?", ["のでしょうか", "んでしょうか"]),
("すみません、この電車は東京駅に止まる____。", "Com licença, este trem para na estação de Tóquio?", ["のでしょうか", "んでしょうか"]),
("先生はいつ戻られる____。", "Quando será que o professor volta?", ["のでしょうか", "んでしょうか"]),
("彼女はなぜ泣いている____。", "Por que será que ela está chorando?", ["のでしょうか", "んでしょうか"]),
("何も変えなくて、このままでいい____。", "Será que está bom deixar assim, sem mudar nada?", ["のでしょうか", "んでしょうか"]),
],
),
dict(
n=92,
jp="〜を中心に",
rd="wo chuushin ni",
tr="Centrado em / Principalmente / Tendo como centro",
ex="""を中心に é usado para indicar o centro, o foco principal ou a parte mais importante de algo. Equivale a "centrado em", "principalmente" ou "tendo como centro".

中心 significa "centro". Assim, a estrutura mostra o ponto em torno do qual algo acontece, se desenvolve ou se organiza.

Ela tem alguns usos: um centro físico (a Terra gira em torno do Sol, uma cidade cresce ao redor da estação), um grupo principal (um jogo popular principalmente entre jovens), uma área principal (chuvas fortes principalmente na região de Kanto) e um foco de atividade (uma aula centrada na gramática).

Antes de um substantivo, usa-se を中心とした ou を中心とする.""",
st="""Substantivo + を中心に + Verbo / Frase
Substantivo + を中心として + Verbo (formal)
Substantivo + を中心とした / を中心とする + Substantivo

Escrita: 中心 / ちゅうしん""",
no="""Em notícias sobre o tempo, を中心に aparece muito para indicar a região mais afetada.

Para pessoas, を中心に indica quem lidera ou é o centro de um grupo, como em 彼を中心にチームができた.

Também é comum em descrições de cursos e programas: o que é o foco principal.""",
bf="を中心に",
rx="を中心に|を中心と|をちゅうしん",
tk=["を", "中心", "に"],
va=["を中心に", "を中心として", "を中心とした"],
E=[
("この町は駅を中心に発展した。", "このまちはえきをちゅうしんにはってんした。", "Esta cidade se desenvolveu em torno da estação."),
("若者を中心に、このゲームが人気だ。", "わかものをちゅうしんに、このゲームがにんきだ。", "Este jogo é popular, principalmente entre os jovens."),
("地球は太陽を中心に回っている。", "ちきゅうはたいようをちゅうしんにまわっている。", "A Terra gira em torno do Sol."),
("今日の授業は文法を中心に進めます。", "きょうのじゅぎょうはぶんぽうをちゅうしんにすすめます。", "A aula de hoje vai ser centrada na gramática."),
("昨日は関東地方を中心に、大雨が降った。", "きのうはかんとうちほうをちゅうしんに、おおあめがふった。", "Ontem choveu forte, principalmente na região de Kanto."),
],
R=[
("新しいリーダーの彼____、新しいチームができた。", "Formou-se uma nova equipe em torno dele, o novo líder.", ["を中心に"]),
("この店は女性____人気がある。", "Esta loja é popular principalmente entre as mulheres.", ["を中心に"]),
("東京____、地震の被害が出た。", "Houve danos do terremoto, principalmente em Tóquio.", ["を中心に"]),
("会議では、来年の計画____話し合った。", "Na reunião, conversamos principalmente sobre o plano do ano que vem.", ["を中心に"]),
("日本の経済は東京____動いている。", "A economia do Japão gira em torno de Tóquio.", ["を中心に"]),
],
),
dict(
n=93,
jp="〜をはじめ",
rd="wo hajime",
tr="A começar por / Incluindo / Como por exemplo",
ex="""をはじめ é usado para citar o exemplo mais importante ou mais representativo de um grupo, e depois indicar que há outros. Equivale a "a começar por", "incluindo" ou "como por exemplo".

O primeiro elemento é o destaque, e a segunda parte fala do grupo inteiro, muitas vezes com palavras como 多くの, いろいろな ou 全員.

Por exemplo, "a começar pelo presidente, todos os funcionários compareceram" ou "a começar pelo sushi, a culinária japonesa é popular no mundo".

A forma をはじめとして é mais formal, e をはじめとする vem antes de um substantivo.

É uma expressão formal, muito usada em discursos, cerimônias, notícias e textos escritos.""",
st="""Substantivo (exemplo principal) + をはじめ、 + Grupo
Substantivo + をはじめとして、 + Grupo (mais formal)
Substantivo + をはじめとする + Substantivo

Escrita: をはじめ / を始め""",
no="""Em discursos de agradecimento, frases como 社長をはじめ、皆様に感謝します são muito comuns.

O elemento citado primeiro costuma ser o mais importante, mais famoso ou de maior hierarquia.

Na conversa casual, os japoneses preferem や〜など ou とか.""",
bf="をはじめ",
rx="をはじめ|を始め",
tk=["を", "はじめ"],
va=["をはじめ", "をはじめとして", "をはじめとする"],
E=[
("東京をはじめ、日本の大都市はどこも人が多い。", "とうきょうをはじめ、にほんのだいとしはどこもひとがおおい。", "A começar por Tóquio, todas as grandes cidades do Japão têm muita gente."),
("会議には社長をはじめ、社員全員が出席した。", "かいぎにはしゃちょうをはじめ、しゃいんぜんいんがしゅっせきした。", "Na reunião, a começar pelo presidente, todos os funcionários compareceram."),
("すしをはじめ、日本料理は世界で人気がある。", "すしをはじめ、にほんりょうりはせかいでにんきがある。", "A começar pelo sushi, a culinária japonesa é popular no mundo."),
("両親をはじめ、多くの人に助けられた。", "りょうしんをはじめ、おおくのひとにたすけられた。", "Fui ajudado por muitas pessoas, a começar pelos meus pais."),
("この町には、お寺をはじめとして古い建物が多い。", "このまちには、おてらをはじめとしてふるいたてものがおおい。", "Esta cidade tem muitos prédios antigos, como por exemplo os templos."),
],
R=[
("式には校長先生____、多くの先生が来た。", "A começar pelo diretor, muitos professores vieram à cerimônia.", ["をはじめ"]),
("私はサッカー____、いろいろなスポーツが好きだ。", "Gosto de vários esportes, a começar pelo futebol.", ["をはじめ"]),
("京都____、日本には有名な観光地がたくさんある。", "A começar por Kyoto, o Japão tem muitos pontos turísticos famosos.", ["をはじめ"]),
("家族____、友達みんなが応援してくれた。", "Todos me apoiaram, a começar pela minha família e pelos amigos.", ["をはじめ"]),
("中国____、アジアの国々との交流が増えている。", "O intercâmbio com os países asiáticos, a começar pela China, está aumentando.", ["をはじめ"]),
],
),
dict(
n=94,
jp="〜を込めて",
rd="wo komete",
tr="Com (sentimento) / Cheio de / Colocando",
ex="""を込めて é usado para dizer que alguém faz algo colocando um sentimento ou uma intenção naquela ação. Equivale a "com", "cheio de" ou "colocando".

込める significa "colocar dentro". Assim, a ideia é "colocar o coração, o amor ou a gratidão dentro daquilo que se faz".

Os substantivos mais comuns antes de を込めて são 心 (coração), 愛 / 愛情 (amor), 感謝 (gratidão), 願い (desejo, prece), 気持ち (sentimento) e 力 (força).

É muito usado ao falar de presentes, cartas, comida feita com carinho, músicas e orações.""",
st="""Substantivo (sentimento) + を込めて + Verbo
Substantivo + を込めた + Substantivo (algo feito com...)

Escrita: を込めて / をこめて""",
no="""心を込めて é uma expressão muito comum e significa "de todo coração", "com todo carinho".

Em cartões e mensagens, frases como 感謝を込めて ("com gratidão") aparecem no final, como assinatura.

力を込めて é usado de forma física, com o sentido de "com toda a força".""",
bf="を込めて",
rx="を込めて|をこめて|を込め",
tk=["を", "込めて"],
va=["を込めて", "をこめて", "を込めた"],
E=[
("心を込めて手紙を書きました。", "こころをこめててがみをかきました。", "Escrevi a carta de todo coração."),
("感謝を込めて、先生にプレゼントを贈った。", "かんしゃをこめて、せんせいにプレゼントをおくった。", "Dei um presente ao professor, cheio de gratidão."),
("母はいつも愛情を込めて料理を作る。", "はははいつもあいじょうをこめてりょうりをつくる。", "Minha mãe sempre cozinha com muito carinho."),
("合格の願いを込めて、お守りを買った。", "ごうかくのねがいをこめて、おまもりをかった。", "Comprei um amuleto, desejando passar na prova."),
("力を込めて、重いドアを押した。", "ちからをこめて、おもいドアをおした。", "Empurrei a porta pesada com toda a força."),
],
R=[
("彼女は気持ち____、歌を歌った。", "Ela cantou a música com todo o sentimento.", ["を込めて", "をこめて"]),
("祖母は愛____、セーターを編んでくれた。", "Minha avó tricotou um suéter para mim com todo o amor.", ["を込めて", "をこめて"]),
("お礼の気持ち____、花を贈ります。", "Envio estas flores em agradecimento.", ["を込めて", "をこめて"]),
("平和への願い____、鐘を鳴らした。", "Tocaram o sino com um desejo de paz.", ["を込めて", "をこめて"]),
("この旅館では、心____お客様をもてなす。", "Nesta pousada, recebemos os hóspedes de todo coração.", ["を込めて", "をこめて"]),
],
),
dict(
n=95,
jp="〜を通じて・〜を通して",
rd="wo tsuujite / wo tooshite",
tr="Por meio de / Através de / Durante todo",
ex="""を通じて e を通して têm dois usos principais.

O primeiro é indicar o meio ou o intermediário: "por meio de" ou "através de". Pode ser uma pessoa (conhecer alguém por meio de um amigo), uma ferramenta (falar com o mundo pela internet) ou uma experiência (aprender muito com o intercâmbio).

O segundo é indicar um período inteiro: "durante todo". Por exemplo, "esta ilha é quente o ano inteiro".

As duas formas são praticamente iguais. を通して soa um pouco mais concreto e é comum para experiências e meios diretos; を通じて soa um pouco mais formal e é comum para intermediários e períodos. Na prática, muitas vezes podem ser trocadas.""",
st="""Substantivo (pessoa / meio / experiência) + を通じて / を通して + Verbo
Período (一年 / 一生) + を通じて / を通して + Estado contínuo

Formal: を通じ""",
no="""Para canais de comunicação, como internet, televisão e rádio, を通じて é muito comum em notícias.

Para experiências pessoais de aprendizado, を通して aparece mais: 経験を通して学ぶ.

O kanji 通 significa "passar através", o que ajuda a lembrar o sentido.""",
bf="を通じて",
rx="を通じて|を通して|をつうじて|をとおして|を通じ",
tk=["を", "通じて", "通して"],
va=["を通じて", "を通して", "を通じ"],
E=[
("友達を通じて、彼女と知り合った。", "ともだちをつうじて、かのじょとしりあった。", "Conheci-a por meio de um amigo."),
("インターネットを通して、世界中の人と話せる。", "インターネットをとおして、せかいじゅうのひととはなせる。", "Pela internet, dá para falar com pessoas do mundo inteiro."),
("この島は一年を通じて暖かい。", "このしまはいちねんをつうじてあたたかい。", "Esta ilha é quente o ano inteiro."),
("留学を通して、多くのことを学んだ。", "りゅうがくをとおして、おおくのことをまなんだ。", "Aprendi muitas coisas por meio do intercâmbio."),
("秘書を通して、社長に会う約束をした。", "ひしょをとおして、しゃちょうにあうやくそくをした。", "Por meio da secretária, marquei um encontro com o presidente."),
],
R=[
("先輩____、今の会社を紹介してもらった。", "Fui apresentado à empresa atual por meio de um veterano.", ["を通じて", "を通して"]),
("ボランティア活動____、たくさんの友達ができた。", "Fiz muitos amigos por meio do trabalho voluntário.", ["を通じて", "を通して"]),
("このあたりは一年____雨が多い。", "Nesta região chove muito o ano inteiro.", ["を通じて", "を通して"]),
("テレビ____、そのニュースを知った。", "Fiquei sabendo dessa notícia pela televisão.", ["を通じて", "を通して"]),
("スポーツ____、協力することの大切さを学んだ。", "Por meio do esporte, aprendi a importância de cooperar.", ["を通じて", "を通して"]),
],
),
dict(
n=96,
jp="〜おかげで",
rd="okage de",
tr="Graças a / Por causa de (positivo)",
ex="""おかげで é usado para indicar que algo bom aconteceu graças a uma pessoa, uma ação ou uma circunstância. Equivale a "graças a".

A primeira parte mostra a causa, e a segunda, o resultado positivo. O tom é de gratidão. Por exemplo, "graças ao professor, passei na prova" ou "graças ao remédio, a febre baixou".

Ele vem depois de substantivos com の, e da forma simples de verbos e adjetivos.

Na forma おかげだ ou おかげです, no final da frase, expressa gratidão diretamente: "consegui graças a todos vocês".

O oposto, para causas negativas, é せいで.""",
st="""Substantivo + の + おかげで + Resultado positivo
Verbo / Adjetivo (forma simples, geralmente passado) + おかげで + Resultado
Adjetivo な + な + おかげで
… + のは + 〜のおかげだ / おかげです

Escrita: おかげ / お陰""",
no="""A expressão おかげさまで é uma resposta educada e muito comum quando alguém pergunta como você está: "graças a Deus / graças a vocês, estou bem".

Às vezes, おかげで é usado com ironia para algo ruim, como "graças a você, me atrasei". Nesse caso, o tom é sarcástico.

A diferença entre おかげで e せいで é só o tom: positivo ou negativo.""",
bf="おかげで",
rx="おかげで|おかげだ|おかげです|お陰で",
tk=["おかげ", "で"],
va=["おかげで", "おかげだ", "おかげです", "おかげさまで"],
E=[
("先生のおかげで、試験に合格できました。", "せんせいのおかげで、しけんにごうかくできました。", "Graças ao professor, consegui passar na prova."),
("薬を飲んだおかげで、熱が下がった。", "くすりをのんだおかげで、ねつがさがった。", "Graças ao remédio que tomei, a febre baixou."),
("天気がよかったおかげで、楽しい旅行になった。", "てんきがよかったおかげで、たのしいりょこうになった。", "Graças ao tempo bom, a viagem foi divertida."),
("友達が手伝ってくれたおかげで、早く終わった。", "ともだちがてつだってくれたおかげで、はやくおわった。", "Graças à ajuda do meu amigo, terminei cedo."),
("成功できたのは、みんなのおかげです。", "せいこうできたのは、みんなのおかげです。", "Se consegui ter sucesso, foi graças a todos vocês."),
],
R=[
("家族の____、元気に暮らしています。", "Graças à minha família, vivo bem e com saúde.", ["おかげで"]),
("毎日練習した____、上手になった。", "Graças ao treino diário, melhorei.", ["おかげで"]),
("地図があった____、道に迷わなかった。", "Graças ao mapa, não me perdi.", ["おかげで"]),
("早く寝た____、今朝は気分がいい。", "Graças a ter dormido cedo, hoje de manhã estou me sentindo bem.", ["おかげで"]),
("田中さんが教えてくれた____、わかりました。", "Graças à explicação do Tanaka, entendi.", ["おかげで"]),
],
),
dict(
n=97,
jp="〜っぱなし",
rd="ppanashi",
tr="Deixar ligado / Deixar aberto / Sem parar",
ex="""っぱなし é usado para indicar que algo foi deixado em um estado, sem ser desfeito, ou que uma ação continua sem parar. Equivale a "deixar ligado", "deixar aberto" ou "sem parar".

A estrutura junta o verbo na forma ます sem ます com っぱなし.

Ela tem dois usos principais. O primeiro é deixar algo como está, quando o normal seria desfazer: deixar a luz acesa, a janela aberta, a água correndo, as roupas jogadas. O tom é de crítica ou de descuido.

O segundo é uma ação ou estado que continua por muito tempo sem interrupção, como ficar de pé o dia inteiro ou falar sem parar.

っぱなし funciona como um substantivo: pode ser seguido de で, に, の e だ.""",
st="""Verbo na forma ます sem ます + っぱなし + で (deixando...)
Verbo sem ます + っぱなし + に + する (deixar assim)
Verbo sem ます + っぱなし + だ (sem parar)

Escrita: っぱなし / っ放し""",
no="""Comparado a まま, っぱなし tem um tom mais negativo e de descuido. つけたまま é neutro; つけっぱなし sugere desleixo.

Expressões como 出しっぱなし e 開けっぱなし são muito usadas em broncas de pais para filhos.

O uso de continuidade, como 立ちっぱなし, é comum para reclamar de cansaço.""",
bf="っぱなし",
rx="っぱなし|っ放し",
tk=["っぱなし"],
va=["っぱなし", "っ放し"],
E=[
("電気をつけっぱなしで寝てしまった。", "でんきをつけっぱなしでねてしまった。", "Acabei dormindo com a luz acesa."),
("窓を開けっぱなしにしないでください。", "まどをあけっぱなしにしないでください。", "Não deixe a janela aberta, por favor."),
("水を出しっぱなしにしてはいけない。", "みずをだしっぱなしにしてはいけない。", "Não se deve deixar a água correndo."),
("今日は一日中立ちっぱなしで、足が痛い。", "きょうはいちにちじゅうたちっぱなしで、あしがいたい。", "Hoje fiquei de pé o dia inteiro, e meus pés doem."),
("彼はいつも服を脱ぎっぱなしにする。", "かれはいつもふくをぬぎっぱなしにする。", "Ele sempre deixa as roupas jogadas depois de tirar."),
],
R=[
("テレビをつけ____で出かけてしまった。", "Saí deixando a TV ligada.", ["っぱなし"]),
("本を出し____にしないで、片付けなさい。", "Não deixe os livros espalhados, guarde-os.", ["っぱなし"]),
("満員電車で一時間立ち____だった。", "Fiquei uma hora de pé no trem lotado.", ["っぱなし"]),
("寒いので、ドアを開け____にしないでください。", "Está frio, então não deixe a porta aberta.", ["っぱなし"]),
("彼は朝から話し____だ。", "Ele está falando sem parar desde de manhã.", ["っぱなし"]),
],
),
dict(
n=98,
jp="〜っぽい",
rd="ppoi",
tr="Com jeito de / Meio / Que tende a",
ex="""っぽい é um sufixo informal com dois usos principais.

O primeiro é indicar que algo parece ou tem características de outra coisa, sem ser exatamente aquilo. Equivale a "com jeito de" ou "meio". Por exemplo, 子供っぽい (infantil, com jeito de criança), 安っぽい (com cara de barato), 熱っぽい (meio febril).

O segundo, com verbos, indica uma tendência a fazer algo com frequência. Por exemplo, 忘れっぽい (esquecido, que esquece fácil), 怒りっぽい (que se irrita fácil), 飽きっぽい (que enjoa das coisas rápido).

Ele vem depois de substantivos, de adjetivos い sem い e de verbos na forma ます sem ます. O resultado funciona como um adjetivo い.

O tom costuma ser casual e, muitas vezes, levemente negativo.""",
st="""Substantivo + っぽい (子供っぽい / 大人っぽい / 熱っぽい)
Adjetivo い sem い + っぽい (安っぽい)
Verbo na forma ます sem ます + っぽい (忘れっぽい / 怒りっぽい / 飽きっぽい)

Conjugação: っぽくない / っぽかった / っぽく""",
no="""大人っぽい (com jeito de adulto, maduro) costuma ser um elogio, enquanto 子供っぽい (infantil) geralmente é uma crítica.

Na fala jovem, っぽい também é usado no fim da frase com o sentido de "parece que", como em 雨っぽい (parece que vai chover).

Comparado a らしい, que significa "típico de" algo ideal, っぽい indica uma semelhança mais superficial.""",
bf="っぽい",
rx="っぽい|っぽく|っぽかった",
tk=["っぽい"],
va=["っぽい", "っぽく", "っぽかった"],
E=[
("彼は大人だが、子供っぽいところがある。", "かれはおとなだが、こどもっぽいところがある。", "Ele é adulto, mas tem um lado meio infantil."),
("最近、忘れっぽくなった。", "さいきん、わすれっぽくなった。", "Ultimamente, fiquei esquecido."),
("この服は少し安っぽい。", "このふくはすこしやすっぽい。", "Esta roupa tem um pouco cara de barata."),
("今日は熱っぽいので、早く帰ります。", "きょうはねつっぽいので、はやくかえります。", "Hoje estou meio febril, então vou embora mais cedo."),
("彼女は怒りっぽい性格だ。", "かのじょはおこりっぽいせいかくだ。", "Ela tem um temperamento que se irrita fácil."),
],
R=[
("弟は飽き____ので、何をしても続かない。", "Meu irmão mais novo enjoa das coisas rápido, então não continua nada.", ["っぽい"]),
("まだ中学生なのに、彼の話し方は大人____。", "Ele ainda está no ginásio, mas fala de um jeito bem maduro.", ["っぽい"]),
("風邪をひいたのか、少し熱____。", "Será que peguei um resfriado? Estou meio febril.", ["っぽい"]),
("年をとって、忘れ____なった。", "Com a idade, fiquei esquecido.", ["っぽく"]),
("このかばんは安____見える。", "Esta bolsa parece meio barata.", ["っぽく"]),
],
),
dict(
n=99,
jp="〜さえ",
rd="sae",
tr="Até mesmo / Nem sequer",
ex="""さえ é uma partícula de ênfase que destaca um caso extremo. Equivale a "até mesmo" ou, em frases negativas, "nem sequer".

A ideia é que, se até aquele caso extremo é verdade, então os outros casos, mais fáceis ou mais óbvios, também são. Por exemplo, "nem o professor sabia" sugere que ninguém mais saberia.

É muito usado em frases negativas, para mostrar uma situação muito ruim ou surpreendente: "não tenho tempo nem para almoçar" ou "não consegui escrever nem o meu nome".

さえ substitui は, が e を. Com outras partículas, fica depois delas, como にさえ e でさえ. Com substantivos que são sujeito, também se usa でさえ, que soa mais enfático.""",
st="""Substantivo + さえ + Frase (geralmente negativa)
Substantivo + でさえ (sujeito, mais enfático)
Substantivo + partícula + さえ (にさえ / とさえ)
Verbo na forma ます sem ます / Verbo て + さえ""",
no="""さえ é parecido com も (até) e すら (até mesmo, mais formal e literário).

Em frases afirmativas, さえ também aparece, como em 子供でさえ知っている (até uma criança sabe).

Com ば, a estrutura さえ〜ば tem outro sentido, "basta que...", e aparece na gramática seguinte.""",
bf="さえ",
rx="さえ",
tk=["さえ"],
va=["さえ", "でさえ", "にさえ"],
E=[
("忙しくて、昼ご飯を食べる時間さえない。", "いそがしくて、ひるごはんをたべるじかんさえない。", "Estou tão ocupado que não tenho tempo nem para almoçar."),
("この問題は先生さえわからなかった。", "このもんだいはせんせいさえわからなかった。", "Nem o professor conseguiu resolver esta questão."),
("それは子供でさえ知っていることだ。", "それはこどもでさえしっていることだ。", "Isso é algo que até uma criança sabe."),
("疲れて、立っていることさえできない。", "つかれて、たっていることさえできない。", "Estou tão cansado que não consigo nem ficar de pé."),
("彼は自分の名前さえ書けなかった。", "かれはじぶんのなまえさえかけなかった。", "Ele não conseguia escrever nem o próprio nome."),
],
R=[
("驚いて、声____出なかった。", "Fiquei tão surpreso que nem sequer consegui falar.", ["さえ"]),
("親友に____言えない秘密がある。", "Tenho um segredo que não consigo contar nem para o meu melhor amigo.", ["さえ"]),
("日本語を始めたばかりで、ひらがな____読めない。", "Acabei de começar japonês e nem consigo ler hiragana.", ["さえ"]),
("水____飲めないほど、喉が痛い。", "Minha garganta dói tanto que nem consigo beber água.", ["さえ"]),
("彼は簡単な料理____作れない。", "Ele não sabe fazer nem uma comida simples.", ["さえ"]),
],
),
dict(
n=100,
jp="〜さえ〜ば",
rd="sae ~ ba",
tr="Basta que / Desde que / Se ao menos",
ex="""さえ〜ば é usado para dizer que uma única condição é suficiente para que algo aconteça. Equivale a "basta que", "desde que" ou "se ao menos".

A ideia é que, se aquela condição for cumprida, todo o resto se resolve. Por exemplo, "se ao menos eu tivesse tempo, poderia estudar mais" ou "basta tomar este remédio para melhorar".

Com substantivos, さえ vem depois do substantivo, e a condição usa ば: 時間さえあれば.

Com verbos, a estrutura fica Verbo sem ます + さえすれば: 飲みさえすれば (basta tomar). Com a forma て, fica てさえいれば.

Com adjetivos, fica Adjetivo + さえ + condição: 天気さえよければ.""",
st="""Substantivo + さえ + Verbo / Adjetivo ば
Verbo na forma ます sem ます + さえすれば
Verbo na forma て + さえいれば
Substantivo / Adjetivo な + さえ + なら / であれば""",
no="""Às vezes, o tom é de crítica a quem acha que uma coisa resolve tudo, como em "achar que basta ter dinheiro".

Em frases com のに no final, さえ〜ば expressa arrependimento: 時間さえあれば、できたのに.

A expressão あなたさえよければ ("se estiver tudo bem para você") é uma forma gentil de fazer um convite.""",
bf="さえ",
rx="さえ",
tk=["さえ", "ば"],
va=["さえ〜ば", "さえすれば", "さえあれば"],
E=[
("時間さえあれば、もっと勉強できるのに。", "じかんさえあれば、もっとべんきょうできるのに。", "Se ao menos eu tivesse tempo, poderia estudar mais."),
("この薬を飲みさえすれば、すぐ治ります。", "このくすりをのみさえすれば、すぐなおります。", "Basta tomar este remédio para melhorar logo."),
("天気さえよければ、ここから富士山が見える。", "てんきさえよければ、ここからふじさんがみえる。", "Desde que o tempo esteja bom, dá para ver o Monte Fuji daqui."),
("お金さえあれば、何でも買えると思うのは間違いだ。", "おかねさえあれば、なんでもかえるとおもうのはまちがいだ。", "É um erro achar que basta ter dinheiro para comprar tudo."),
("あなたさえよければ、一緒に行きましょう。", "あなたさえよければ、いっしょにいきましょう。", "Se estiver tudo bem para você, vamos juntos."),
],
R=[
("君____いれば、何もいらない。", "Basta você estar comigo, não preciso de mais nada.", ["さえ"]),
("地図____あれば、一人で行ける。", "Desde que eu tenha um mapa, consigo ir sozinho.", ["さえ"]),
("毎日練習し____すれば、上手になる。", "Basta praticar todo dia para melhorar.", ["さえ"]),
("体____丈夫なら、どんな仕事もできる。", "Desde que a saúde esteja boa, dá para fazer qualquer trabalho.", ["さえ"]),
("雨____降らなければ、試合はできる。", "Desde que não chova, dá para fazer a partida.", ["さえ"]),
],
),
]
