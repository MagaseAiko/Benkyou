G = [
dict(
n=51,
jp="なかなか〜ない",
rd="nakanaka ~ nai",
tr="Não... de jeito nenhum / Custa a / Demora para",
ex="""なかなか〜ない é usado para dizer que algo não acontece, ou demora muito para acontecer, mesmo que a pessoa espere ou se esforce. Equivale a "custa a...", "demora para..." ou "não... de jeito nenhum".

なかなか vem antes do verbo, e o verbo fica na forma negativa. A ideia é de frustração ou dificuldade: a pessoa quer que algo aconteça, mas não acontece com facilidade.

É muito usado com ações que se espera que aconteçam, como o ônibus chegar, a chuva parar, conseguir dormir, decorar algo ou um resfriado melhorar.

Com a forma potencial, ele expressa dificuldade para conseguir fazer algo, como "não consigo decorar de jeito nenhum".""",
st="""なかなか + Verbo na forma negativa
なかなか + Verbo potencial negativo (não consegue... de jeito nenhum)""",
no="""Em frases afirmativas, なかなか tem outro sentido: "bastante", "muito", geralmente como elogio, como em "é bem gostoso". Esse uso aparece no N3.

Comparado a あまり〜ない, que indica pouca frequência ou intensidade, なかなか〜ない destaca a dificuldade e a espera.

É comum usar なかなか com てくれない para reclamar que alguém ou algo não colabora, como uma criança que não dorme.""",
bf="なかなか",
rx="なかなか",
tk=["なかなか", "ない"],
va=["なかなか"],
E=[
("バスがなかなか来ません。", "バスがなかなかきません。", "O ônibus está demorando muito para chegar."),
("この漢字はなかなか覚えられない。", "このかんじはなかなかおぼえられない。", "Não consigo decorar este kanji de jeito nenhum."),
("昨日の夜は、なかなか眠れませんでした。", "きのうのよるは、なかなかねむれませんでした。", "Ontem à noite, custei a pegar no sono."),
("仕事がなかなか終わらない。", "しごとがなかなかおわらない。", "O trabalho não termina nunca."),
("風邪がなかなか治らなくて困っています。", "かぜがなかなかなおらなくてこまっています。", "O resfriado não passa de jeito nenhum, e estou sofrendo."),
],
R=[
("雨が____やみませんね。", "A chuva não para de jeito nenhum, né?", ["なかなか"]),
("毎日勉強しているのに、日本語が____上手になりません。", "Estudo todo dia, mas meu japonês custa a melhorar.", ["なかなか"]),
("子供が____寝てくれない。", "A criança não dorme de jeito nenhum.", ["なかなか"]),
("彼からの返事が____来ない。", "A resposta dele está demorando muito para chegar.", ["なかなか"]),
("この問題は難しくて、答えが____わからない。", "Esta questão é difícil, e não consigo achar a resposta de jeito nenhum.", ["なかなか"]),
],
),
dict(
n=52,
jp="〜なければいけない",
rd="nakereba ikenai",
tr="Ter que / Precisar / Dever",
ex="""なければいけない é usado para dizer que algo é obrigatório ou necessário. Equivale a "ter que" ou "precisar".

Ela vem da condicional なければ ("se não fizer") + いけない ("não está bem"). A ideia literal é "se não fizer, não está bem", ou seja, é preciso fazer.

なければいけない costuma expressar uma obrigação ligada à situação ou ao senso pessoal de dever, como compromissos, tarefas e coisas que a pessoa sente que precisa fazer. Por isso, é muito comum na conversa.

Para formar, tira-se o い da forma ない e acrescenta-se ければいけない. Na fala casual, なければ costuma virar なきゃ.""",
st="""Verbo na forma ない sem い + ければいけない
Adjetivo い sem い + くなければいけない
Substantivo / Adjetivo な + でなければいけない

Educado: なければいけません
Passado: なければいけなかった / なければいけませんでした
Fala casual: なきゃいけない / なきゃ""",
no="""なければいけない e なくてはいけない têm o mesmo sentido. A primeira aparece um pouco mais na conversa do dia a dia.

Na fala muito informal, a frase pode terminar só com なきゃ, omitindo いけない.

Para dizer que algo não é necessário, o oposto é なくてもいい.""",
bf="なければいけない",
rx="なければいけない|なければいけません|なければいけなかった|なきゃいけない",
tk=["なければ", "いけない"],
va=["なければいけない", "なければいけません", "なければいけなかった", "なきゃいけない"],
E=[
("明日は早く起きなければいけません。", "あしたははやくおきなければいけません。", "Amanhã tenho que acordar cedo."),
("今日は宿題をしなければいけない。", "きょうはしゅくだいをしなければいけない。", "Hoje tenho que fazer a lição."),
("毎日薬を飲まなければいけません。", "まいにちくすりをのまなければいけません。", "Tenho que tomar remédio todo dia."),
("昨日は残業しなければいけなかった。", "きのうはざんぎょうしなければいけなかった。", "Ontem tive que fazer hora extra."),
("あ、もう帰らなきゃいけない。", "あ、もうかえらなきゃいけない。", "Ah, já tenho que ir embora."),
],
R=[
("今日中にこの本を返さ____。", "Tenho que devolver este livro ainda hoje.", ["なければいけません", "なければいけない"]),
("来週までに、引っ越しの準備をし____。", "Tenho que preparar a mudança até a semana que vem.", ["なければいけません", "なければいけない"]),
("試験の前に、もっと勉強し____。", "Antes da prova, tenho que estudar mais.", ["なければいけません", "なければいけない"]),
("昨日は病院に行か____。", "Ontem tive que ir ao hospital.", ["なければいけなかった", "なければいけませんでした"]),
("明日は六時に起き____から、早く寝ます。", "Amanhã tenho que acordar às seis, então vou dormir cedo.", ["なければいけない"]),
],
),
dict(
n=53,
jp="〜なければならない",
rd="nakereba naranai",
tr="Ter que / Ser obrigatório / Dever",
ex="""なければならない também expressa obrigação, como なければいけない. Equivale a "ter que", "ser obrigatório" ou "dever".

A ideia literal é "se não fizer, não dá". O tom, porém, é mais formal e objetivo. Por isso, ela é muito usada para obrigações gerais, regras, leis, deveres sociais e necessidades que não dependem da vontade de quem fala.

Também é a forma mais comum em textos escritos, notícias, regulamentos e discursos.

A formação é igual à de なければいけない: tira-se o い da forma ない e acrescenta-se ければならない.""",
st="""Verbo na forma ない sem い + ければならない
Adjetivo い sem い + くなければならない
Substantivo / Adjetivo な + でなければならない

Educado: なければなりません
Passado: なければならなかった / なければなりませんでした""",
no="""Na prática, なければならない e なければいけない muitas vezes podem ser trocadas. A diferença é o tom: ならない é mais formal e objetivo; いけない é mais pessoal.

Em leis e regulamentos, é muito comum ver a forma escrita ねばならない, mais literária.

Na fala, a forma longa pode soar rígida. Entre amigos, prefere-se なきゃ.""",
bf="なければならない",
rx="なければならない|なければなりません|なければならなかった",
tk=["なければ", "ならない"],
va=["なければならない", "なければなりません", "なければならなかった", "なければなりませんでした"],
E=[
("学生は学校の規則を守らなければならない。", "がくせいはがっこうのきそくをまもらなければならない。", "Os alunos devem seguir as regras da escola."),
("外国人は在留カードを持っていなければなりません。", "がいこくじんはざいりゅうカードをもっていなければなりません。", "Os estrangeiros devem portar o cartão de residência."),
("車に乗るときは、シートベルトをしなければならない。", "くるまにのるときは、シートベルトをしなければならない。", "Quando se anda de carro, é obrigatório usar o cinto de segurança."),
("来月までにビザを更新しなければなりません。", "らいげつまでにビザをこうしんしなければなりません。", "Tenho que renovar o visto até o mês que vem."),
("昨日は雨の中を歩いて帰らなければならなかった。", "きのうはあめのなかをあるいてかえらなければならなかった。", "Ontem tive que voltar para casa a pé debaixo de chuva."),
],
R=[
("税金は必ず払わ____。", "Os impostos têm que ser pagos sem falta.", ["なければならない", "なければなりません"]),
("選手は毎日練習し____。", "Os atletas têm que treinar todos os dias.", ["なければならない", "なければなりません"]),
("国民は法律を守ら____。", "Os cidadãos devem cumprir a lei.", ["なければならない", "なければなりません"]),
("先週は毎日早く出勤し____。", "Semana passada, tive que chegar cedo ao trabalho todo dia.", ["なければならなかった", "なければなりませんでした"]),
("この書類は、黒いペンで書か____。", "Este documento deve ser preenchido com caneta preta.", ["なければならない", "なければなりません"]),
],
),
dict(
n=54,
jp="〜なら",
rd="nara",
tr="Se / Se for o caso de / Quanto a",
ex="""なら é uma forma condicional usada para responder ou reagir a algo: uma situação mencionada pelo outro, uma intenção ou um tema da conversa. Equivale a "se", "se for o caso de" ou "quanto a".

O uso mais característico é dar conselhos ou opiniões sobre algo que a outra pessoa disse. Por exemplo, se alguém diz que quer ir ao Japão, você responde: "se for ao Japão, recomendo Kyoto".

Outro uso é apresentar um tema, com o sentido de "falando de...", "quanto a...". Por exemplo, "computadores, aquela loja é barata".

Diferente de たら, com なら a condição não precisa ter acontecido antes. Por isso, a segunda parte pode ser algo que acontece antes da primeira, como preparar algo antes de viajar.

なら vem depois de substantivos e adjetivos な diretamente, e depois da forma simples de verbos e adjetivos い.""",
st="""Substantivo + なら
Adjetivo な + なら
Verbo (forma simples) + なら
Adjetivo い + なら""",
no="""なら é muito natural em conversas quando se responde a algo que o outro acabou de dizer.

Com verbos, a frase com なら pode significar "se você vai fazer isso...", e o conselho pode ser algo para fazer antes, como levar um guarda-chuva se for sair.

A forma のなら também existe, com o mesmo sentido e um tom mais explicativo.""",
bf="なら",
rx="なら",
tk=["なら"],
va=["なら", "のなら"],
E=[
("日本へ行くなら、京都がおすすめです。", "にほんへいくなら、きょうとがおすすめです。", "Se você vai ao Japão, recomendo Kyoto."),
("「パソコンが欲しいんです。」「パソコンなら、あの店が安いですよ。」", "「パソコンがほしいんです。」「パソコンなら、あのみせがやすいですよ。」", "\"Quero um computador.\" \"Se é computador, aquela loja é barata.\""),
("疲れているなら、休んだほうがいい。", "つかれているなら、やすんだほうがいい。", "Se você está cansado, é melhor descansar."),
("明日雨なら、試合は中止です。", "あしたあめなら、しあいはちゅうしです。", "Se chover amanhã, a partida será cancelada."),
("あなたが行くなら、私も行きます。", "あなたがいくなら、わたしもいきます。", "Se você for, eu também vou."),
],
R=[
("「すしが食べたい。」「すし____、駅前の店がいいよ。」", "\"Quero comer sushi.\" \"Se é sushi, a loja em frente à estação é boa.\"", ["なら"]),
("車で行く____、お酒は飲まないでください。", "Se for de carro, não beba álcool.", ["なら"]),
("暇____、ちょっと手伝ってくれませんか。", "Se você estiver livre, pode me ajudar um pouco?", ["なら"]),
("英語の先生を探している____、いい人を知っていますよ。", "Se você está procurando um professor de inglês, conheço uma pessoa boa.", ["なら"]),
("君がそう言う____、信じるよ。", "Se você diz isso, eu acredito.", ["なら"]),
],
),
dict(
n=55,
jp="〜なさい",
rd="nasai",
tr="Faça! / Vá fazer (ordem)",
ex="""なさい é usado para dar ordens. Equivale a "faça!" ou ao imperativo com tom de autoridade.

Ele é formado tirando ます do verbo e acrescentando なさい. Embora venha de なさる, que é um verbo respeitoso, なさい não soa respeitoso: ele é usado por quem está em posição de autoridade.

Os usos mais comuns são pais falando com filhos, professores falando com alunos e instruções em provas e exercícios escritos.

É mais suave que a forma imperativa (命令形), mas mais forte que てください. Por isso, nunca é usado com superiores ou com pessoas mais velhas.""",
st="""Verbo na forma ます sem ます + なさい
Substantivo de ação + しなさい""",
no="""Em provas japonesas, como o JLPT, as instruções usam muito なさい, como em "escolha a resposta correta".

Uma forma ainda mais suave, também usada por pais, é なさいね ou なさいよ.

Nas expressões おかえりなさい e おやすみなさい, なさい aparece com sentido de cumprimento, sem tom de ordem.""",
bf="なさい",
rx="なさい",
tk=["なさい"],
va=["なさい"],
E=[
("もう七時よ。早く起きなさい。", "もうしちじよ。はやくおきなさい。", "Já são sete horas. Levante logo!"),
("ちゃんと野菜を食べなさい。", "ちゃんとやさいをたべなさい。", "Coma direito as verduras."),
("授業中ですよ。静かにしなさい。", "じゅぎょうちゅうですよ。しずかにしなさい。", "Estamos em aula. Fiquem em silêncio."),
("次の質問に答えなさい。", "つぎのしつもんにこたえなさい。", "Responda às perguntas a seguir."),
("宿題をしてから遊びなさい。", "しゅくだいをしてからあそびなさい。", "Vá brincar depois de fazer a lição."),
],
R=[
("もう九時だよ。早く寝____。", "Já são nove horas. Vá dormir!", ["なさい"]),
("ご飯の前に、手を洗い____。", "Lave as mãos antes de comer.", ["なさい"]),
("正しい答えを選び____。", "Escolha a resposta correta.", ["なさい"]),
("部屋が汚いわね。片付け____。", "Seu quarto está bagunçado. Arrume-o!", ["なさい"]),
("遅れないように、急ぎ____。", "Apresse-se para não se atrasar.", ["なさい"]),
],
),
dict(
n=56,
jp="なさる",
rd="nasaru",
tr="Fazer (respeitoso)",
ex="""なさる é o verbo respeitoso (尊敬語) usado no lugar de する (fazer), quando o sujeito é alguém que merece respeito, como um cliente, um professor ou um superior.

No 尊敬語, quem fala eleva a pessoa que faz a ação. Por isso, なさる nunca é usado para falar das próprias ações. Para isso, usa-se a forma humilde いたす.

Com verbos do tipo "substantivo + する", basta trocar する por なさる, como em 研究なさる e 結婚なさる.

Na forma ます, ele é irregular: em vez de なさります, diz-se なさいます. É muito comum em atendimento ao cliente, como na pergunta "o que o senhor vai querer?".""",
st="""Pessoa respeitada + が / は + Substantivo + を + なさる
Substantivo de ação + なさる

Educado: なさいます (forma irregular)
Passado: なさった / なさいました
Pergunta: 何になさいますか""",
no="""Lembre o par: する → なさる (respeitoso) e する → いたす (humilde).

Em restaurantes e lojas, 何になさいますか é a forma educada de perguntar o que o cliente vai escolher.

Também existe a forma お / ご + verbo + になる, que tem função respeitosa parecida, como em お待ちになる.""",
bf="なさる",
rx="なさ",
tk=["なさる"],
va=["なさる", "なさいます", "なさった", "なさいました"],
E=[
("社長は週末によくゴルフをなさいます。", "しゃちょうはしゅうまつによくゴルフをなさいます。", "O presidente costuma jogar golfe nos fins de semana."),
("先生は何を研究なさっているのですか。", "せんせいはなにをけんきゅうなさっているのですか。", "O que o professor está pesquisando?"),
("週末は何をなさいますか。", "しゅうまつはなにをなさいますか。", "O que o senhor vai fazer no fim de semana?"),
("お客様、お飲み物はどちらになさいますか。", "おきゃくさま、おのみものはどちらになさいますか。", "Senhor, qual bebida vai querer?"),
("部長は来月、結婚なさるそうです。", "ぶちょうはらいげつ、けっこんなさるそうです。", "Dizem que o gerente vai se casar no mês que vem."),
],
R=[
("先生はよく旅行を____か。", "O professor costuma viajar?", ["なさいます"]),
("社長は今、電話を____います。", "O presidente está ao telefone agora.", ["なさって"]),
("お飲み物は何に____か。", "O que o senhor vai querer de bebida?", ["なさいます"]),
("田中様は先月、退院____そうです。", "Dizem que o senhor Tanaka teve alta no mês passado.", ["なさった"]),
("明日、課長は何時に出発____んですか。", "Amanhã, a que horas o chefe de seção vai partir?", ["なさる"]),
],
),
dict(
n=57,
jp="〜に気がつく",
rd="ni ki ga tsuku",
tr="Perceber / Notar / Dar-se conta de",
ex="""に気がつく é usado para dizer que alguém percebeu ou notou algo. Equivale a "perceber", "notar" ou "dar-se conta de".

A coisa percebida vem antes de に. Pode ser um substantivo, como um erro ou uma mudança, ou uma frase inteira transformada em substantivo com こと, como "perceber que esqueci o guarda-chuva".

A expressão indica um momento de percepção: antes a pessoa não sabia, e de repente notou. Por isso, é muito usada no passado, com 気がついた.

A forma curta 気づく tem exatamente o mesmo sentido e é muito comum tanto na fala quanto na escrita.""",
st="""Substantivo + に + 気がつく
Frase (forma simples) + こと + に + 気がつく

Forma curta: に気づく
Passado: に気がついた / に気がつきました
Negativo: に気がつかない

Escrita: 気がつく / 気が付く / 気づく / 気付く""",
no="""気がつく também pode descrever uma pessoa atenciosa, que percebe o que os outros precisam, como em よく気がつく人.

Não confunda com 気をつける, que significa "tomar cuidado". A partícula e o verbo mudam o sentido.

Em histórias, a frase 気がつくと significa "quando dei por mim..." e introduz algo que aconteceu sem a pessoa perceber.""",
bf="に気がつく",
rx="気がつ|気が付|気づ|気付",
tk=["に", "気", "が", "つく"],
va=["に気がつく", "に気づく", "に気が付く", "に気付く"],
E=[
("財布がないことに気がつきました。", "さいふがないことにきがつきました。", "Percebi que estava sem a carteira."),
("彼は自分の間違いに気がついた。", "かれはじぶんのまちがいにきがついた。", "Ele percebeu o próprio erro."),
("電車を降りてから、傘を忘れたことに気がついた。", "でんしゃをおりてから、かさをわすれたことにきがついた。", "Depois de descer do trem, percebi que tinha esquecido o guarda-chuva."),
("先生は私の変化にすぐ気づいた。", "せんせいはわたしのへんかにすぐきづいた。", "O professor notou logo a minha mudança."),
("家に着いて、鍵をかけていないことに気がつきました。", "いえについて、かぎをかけていないことにきがつきました。", "Cheguei em casa e me dei conta de que não tinha trancado a porta."),
],
R=[
("駅に着いて、切符をなくしたことに____。", "Cheguei à estação e percebi que tinha perdido a passagem.", ["気がつきました", "気がついた", "気づきました", "気づいた"]),
("誰も私のミスに____なかった。", "Ninguém percebeu o meu erro.", ["気がつか", "気づか"]),
("彼女が髪を切ったことに、すぐ____。", "Percebi logo que ela tinha cortado o cabelo.", ["気がつきました", "気がついた", "気づきました", "気づいた"]),
("後ろに人がいることに____、びっくりした。", "Percebi que havia alguém atrás de mim e levei um susto.", ["気がついて", "気づいて"]),
("間違いに____ら、すぐ直してください。", "Se notar algum erro, corrija imediatamente, por favor.", ["気がついた", "気づいた"]),
],
),
dict(
n=58,
jp="〜に見える",
rd="ni mieru",
tr="Parecer / Dar a impressão de",
ex="""に見える é usado para dizer como algo ou alguém parece, a partir da aparência. Equivale a "parecer" ou "dar a impressão de".

O julgamento é visual: quem fala está descrevendo a impressão que tem ao olhar. Muitas vezes, a aparência é diferente da realidade, como alguém que parece jovem, mas não é.

A forma de ligar depende da palavra. Com substantivos e adjetivos な, usa-se に antes de 見える. Com adjetivos い, troca-se o い por く, formando く見える.

Diferente de そうだ (aparência de algo prestes a acontecer ou de uma qualidade), 見える fala do aspecto visual geral, e é muito usado para comparar aparência com idade, profissão ou estado.""",
st="""Substantivo + に + 見える
Adjetivo な + に + 見える
Adjetivo い sem い + く + 見える

Educado: に見えます / く見えます
Escrita: 見える / みえる""",
no="""Para dizer que alguém parece mais jovem que a idade real, é muito comum a frase 年より若く見える.

見える sozinho também significa "ser visível", "dar para ver", como em 山が見える. O contexto mostra qual sentido é usado.

Para aparência baseada em algo que se ouviu, usa-se そうだ (hearsay) ou らしい, e não 見える.""",
bf="に見える",
rx="に見え|く見え|にみえ|くみえ",
tk=["に", "見える"],
va=["に見える", "く見える", "に見えます", "く見えます"],
E=[
("彼は年より若く見えます。", "かれはとしよりわかくみえます。", "Ele parece mais jovem do que é."),
("あの人は先生に見える。", "あのひとはせんせいにみえる。", "Aquela pessoa parece professora."),
("家具が少ないから、この部屋は広く見えますね。", "かぐがすくないから、このへやはひろくみえますね。", "Como tem poucos móveis, este quarto parece amplo, né?"),
("彼女は元気に見えるけど、本当は疲れている。", "かのじょはげんきにみえるけど、ほんとうはつかれている。", "Ela parece bem, mas na verdade está cansada."),
("遠くから見ると、あの雲は魚に見える。", "とおくからみると、あのくもはさかなにみえる。", "Vista de longe, aquela nuvem parece um peixe."),
],
R=[
("父は年より若____。", "Meu pai parece mais jovem do que é.", ["く見えます", "く見える"]),
("このかばんは本物____けど、偽物です。", "Esta bolsa parece verdadeira, mas é falsa.", ["に見える"]),
("眼鏡をかけると、頭がよ____。", "Usando óculos, a pessoa parece inteligente.", ["く見える", "く見えます"]),
("あの子は静か____けど、本当はよく話す。", "Aquela criança parece quieta, mas na verdade fala bastante.", ["に見える"]),
("ここから見ると、人がアリ____。", "Vistas daqui, as pessoas parecem formigas.", ["に見える", "に見えます"]),
],
),
dict(
n=59,
jp="〜にする（変化）",
rd="ni suru (henka)",
tr="Tornar / Deixar / Transformar em",
ex="""No N4, にする aparece com o sentido de mudar algo de propósito, deixando aquilo com uma nova característica ou transformando-o em outra coisa. Equivale a "tornar", "deixar" ou "transformar em".

Ela é usada com adjetivos な e substantivos. A coisa que muda é marcada com を, e o novo estado ou resultado vem antes de に.

Por exemplo, deixar o quarto limpo, ficar em silêncio, transformar um quarto vazio em quarto das crianças.

A diferença em relação a になる é quem causa a mudança. になる indica uma mudança natural ("ficou limpo"); にする indica que alguém fez a mudança ("deixei limpo").

Com adjetivos い, a estrutura equivalente é くする.""",
st="""Substantivo + を + Adjetivo な + に + する
Substantivo A + を + Substantivo B + に + する (transformar A em B)
Adjetivo な + に + する (sem objeto: 静かにする)

Pedido: 〜にしてください
Equivalente com adjetivos い: Adjetivo sem い + く + する""",
no="""Não confunda com a にする do N5, que significa "escolher", como em "vou de café". Aqui, にする indica transformação.

静かにしてください e 大切にしてください são pedidos muito frequentes no dia a dia.

A expressão 〜を大切にする significa "cuidar bem de" ou "valorizar", e aparece muito em mensagens de cuidado.""",
bf="にする",
rx="にする|にします|にした|にしました|にして|にしよう|にしましょう",
tk=["に", "する"],
va=["にする", "にします", "にした", "にしました", "にして"],
E=[
("お客さんが来るので、部屋をきれいにしました。", "おきゃくさんがくるので、へやをきれいにしました。", "Como vai vir visita, deixei o quarto limpo."),
("図書館では静かにしてください。", "としょかんではしずかにしてください。", "Fiquem em silêncio na biblioteca."),
("息子を医者にしたいと思っています。", "むすこをいしゃにしたいとおもっています。", "Quero que meu filho seja médico."),
("空いている部屋を子供部屋にしました。", "あいているへやをこどもべやにしました。", "Transformei o quarto vazio em quarto das crianças."),
("体を大切にしてくださいね。", "からだをたいせつにしてくださいね。", "Cuide bem da sua saúde, tá?"),
],
R=[
("授業中は静か____ください。", "Durante a aula, fiquem em silêncio.", ["にして"]),
("お客さんが来るから、部屋をきれい____。", "Vai vir visita, então vamos deixar o quarto limpo.", ["にしましょう", "にしよう", "にします"]),
("古いシャツを雑巾____。", "Transformei a camisa velha em pano de chão.", ["にしました", "にした"]),
("お金は大切____ください。", "Cuide bem do seu dinheiro.", ["にして"]),
("美容院で、髪の色を茶色____。", "No salão, deixei o cabelo castanho.", ["にしました", "にした"]),
],
),
dict(
n=60,
jp="〜にくい",
rd="nikui",
tr="Difícil de / Ruim de",
ex="""にくい é usado para dizer que algo é difícil de fazer. Equivale a "difícil de" ou "ruim de".

Ele é formado tirando ます do verbo e acrescentando にくい. O resultado funciona como um adjetivo い, então se conjuga como tal: にくくない, にくかった, にくくて.

A dificuldade costuma vir de uma característica da coisa, como letras pequenas que tornam um livro difícil de ler, ou sapatos que deixam o andar desconfortável.

Também é usado para situações em que é difícil fazer algo por motivos psicológicos, como ser difícil fazer uma pergunta a alguém.

O oposto de にくい é やすい, que significa "fácil de".""",
st="""Verbo na forma ます sem ます + にくい

Negativo: にくくない
Passado: にくかった
Ligando: にくくて""",
no="""Para dificuldades emocionais ou situações delicadas, também se usa づらい, que destaca mais o desconforto pessoal.

Não confunda com o adjetivo 憎い, que significa "odioso". Apenas a pronúncia é igual.

Com verbos que não dependem da vontade, como acontecimentos naturais, にくい também funciona: algo que "não quebra facilmente", por exemplo.""",
bf="にくい",
rx="にくい|にくく|にくかった",
tk=["にくい"],
va=["にくい", "にくくない", "にくかった", "にくくて"],
E=[
("この本は字が小さくて読みにくいです。", "このほんはじがちいさくてよみにくいです。", "Este livro tem letras pequenas e é difícil de ler."),
("この靴は歩きにくい。", "このくつはあるきにくい。", "Estes sapatos são ruins para andar."),
("彼の説明はわかりにくかった。", "かれのせつめいはわかりにくかった。", "A explicação dele foi difícil de entender."),
("この薬は苦くて飲みにくいです。", "このくすりはにがくてのみにくいです。", "Este remédio é amargo e difícil de tomar."),
("あの先生には質問しにくいです。", "あのせんせいにはしつもんしにくいです。", "É difícil fazer perguntas para aquele professor."),
],
R=[
("このペンは書き____です。", "Esta caneta é ruim de escrever.", ["にくい"]),
("骨が多い魚は食べ____。", "Peixe com muita espinha é difícil de comer.", ["にくい", "にくいです"]),
("彼の字は小さくて読み____。", "A letra dele é pequena e difícil de ler.", ["にくい", "にくいです"]),
("このドアは開け____から、気をつけて。", "Esta porta é difícil de abrir, então tome cuidado.", ["にくい"]),
("説明がわかり____て、困りました。", "A explicação era difícil de entender, e fiquei perdido.", ["にくく"]),
],
),
]
