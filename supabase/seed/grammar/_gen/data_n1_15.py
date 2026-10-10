G = [
dict(
n=141,
jp="〜のやら / 〜ものやら / 〜ことやら",
rd="no yara / mono yara / koto yara",
tr="Será que / Quem sabe / Não faço ideia de",
ex="""のやら, ものやら e ことやら expressam dúvida ou incerteza, muitas vezes com preocupação. Equivalem a "será que...?" ou "não faço ideia de...".

A pessoa se pergunta algo para si mesma, sem esperar resposta. Costumam vir com palavras interrogativas, como どこ, 何, いつ ou どう. Por exemplo, "será que ele está bem?" ou "não faço ideia de onde ele foi".

É uma expressão um pouco literária e emotiva.""",
st="""Palavra interrogativa + Verbo (forma simples) + のやら
Palavra interrogativa + Verbo (forma simples) + ものやら
Palavra interrogativa + Verbo (forma simples) + ことやら""",
no="""É parecido com のだろうか e かな, mas のやら expressa mais preocupação ou impaciência.

Muitas vezes termina com わからない ou 心配だ.""",
bf="のやら",
rx="のやら|ものやら|ことやら",
tk=["の", "やら"],
va=["のやら", "ものやら", "ことやら"],
E=[
("彼は今どこにいるのやら。", "かれはいまどこにいるのやら。", "Será que ele está onde agora?"),
("この先どうなることやら。", "このさきどうなることやら。", "Quem sabe o que vai acontecer daqui em diante."),
("何を考えているのやら、さっぱりわからない。", "なにをかんがえているのやら、さっぱりわからない。", "Não faço a menor ideia do que ele está pensando."),
("いつになったら終わるものやら。", "いつになったらおわるものやら。", "Será que isso vai acabar algum dia?"),
("息子は元気でやっているのやら、心配だ。", "むすこはげんきでやっているのやら、しんぱいだ。", "Será que meu filho está bem? Estou preocupado."),
],
R=[
("あの子は誰に似た____。", "Será que essa criança puxou a quem?", ["のやら"]),
("この仕事はいつ終わる____。", "Quem sabe quando este trabalho vai terminar.", ["ことやら", "のやら", "ものやら"]),
("どうすればいい____、わからない。", "Não faço ideia do que devo fazer.", ["のやら", "ものやら"]),
("彼女は何を言いたい____。", "Será que ela quer dizer o quê?", ["のやら"]),
("一体どうなる____。", "Quem sabe o que vai acontecer.", ["ことやら", "のやら"]),
],
),
dict(
n=142,
jp="〜のやら〜のやら",
rd="no yara ~ no yara",
tr="Se... ou se / Não sei se... ou / Entre... e",
ex="""のやら〜のやら apresenta duas possibilidades opostas e mostra que não é possível saber qual é a certa. Equivale a "não sei se... ou se...".

Muitas vezes mostra confusão ou dificuldade em entender a atitude de alguém. Por exemplo, "não sei se ele está bravo ou se está feliz".

Costuma terminar com わからない.""",
st="""Verbo / Adjetivo (forma simples) + のやら + Verbo / Adjetivo (oposto) + のやら + わからない""",
no="""É parecido com のか〜のか, mas のやら〜のやら é mais literário e expressa mais confusão.

Os dois elementos costumam ser opostos.""",
bf="のやら〜のやら",
rx="のやら",
tk=["の", "やら"],
va=["のやら〜のやら"],
E=[
("彼は怒っているのやら喜んでいるのやら、わからない。", "かれはおこっているのやらよろこんでいるのやら、わからない。", "Não sei se ele está bravo ou se está feliz."),
("あの子は本当に聞いているのやらいないのやら。", "あのこはほんとうにきいているのやらいないのやら。", "Não sei se essa criança está ouvindo ou não."),
("彼女は来るのやら来ないのやら、はっきりしない。", "かのじょはくるのやらこないのやら、はっきりしない。", "Não está claro se ela vem ou não."),
("この料理はおいしいのやらまずいのやら、よくわからない味だ。", "このりょうりはおいしいのやらまずいのやら、よくわからないあじだ。", "Não sei se este prato é gostoso ou ruim, é um sabor estranho."),
("彼は勉強しているのやら遊んでいるのやら。", "かれはべんきょうしているのやらあそんでいるのやら。", "Não sei se ele está estudando ou brincando."),
],
R=[
("息子はやる気があるのやらない____、わからない。", "Não sei se meu filho tem vontade ou não.", ["のやら"]),
("彼女は笑っている____泣いているのやら。", "Não sei se ela está rindo ou chorando.", ["のやら"]),
("この話は本当なのやら嘘な____。", "Não sei se esta história é verdade ou mentira.", ["のやら"]),
("彼は賛成なのやら反対な____、はっきり言わない。", "Ele não diz claramente se é a favor ou contra.", ["のやら"]),
("試験はできた____できなかったのやら、自分でもわからない。", "Nem eu sei se fui bem na prova ou não.", ["のやら"]),
],
),
dict(
n=143,
jp="〜を踏まえて",
rd="wo fumaete",
tr="Levando em conta / Com base em / Considerando",
ex="""を踏まえて indica que algo é feito levando em conta uma informação, um resultado ou uma situação anterior. Equivale a "levando em conta" ou "com base em".

É muito usado no trabalho, em reuniões e relatórios. Por exemplo, "com base nos resultados da pesquisa, vamos pensar num novo plano".

É uma expressão formal.""",
st="""Substantivo + を踏まえて / を踏まえ
Substantivo + を踏まえた + Substantivo""",
no="""É parecido com に基づいて e を考慮して.

Costuma vir com palavras como 結果, 経験, 意見, 現状 e 反省.""",
bf="を踏まえて",
rx="を踏まえて|を踏まえ|を踏まえた|をふまえて",
tk=["を", "踏まえて"],
va=["を踏まえて", "を踏まえ", "を踏まえた"],
E=[
("調査の結果を踏まえて、新しい計画を立てよう。", "ちょうさのけっかをふまえて、あたらしいけいかくをたてよう。", "Com base nos resultados da pesquisa, vamos fazer um novo plano."),
("前回の反省を踏まえ、準備を進めた。", "ぜんかいのはんせいをふまえ、じゅんびをすすめた。", "Levando em conta as lições da última vez, avançamos com os preparativos."),
("皆さんの意見を踏まえた上で、決定します。", "みなさんのいけんをふまえたうえで、けっていします。", "Vamos decidir depois de considerar a opinião de todos."),
("現状を踏まえて、対策を考える必要がある。", "げんじょうをふまえて、たいさくをかんがえるひつようがある。", "É preciso pensar em medidas considerando a situação atual."),
("経験を踏まえたアドバイスをもらった。", "けいけんをふまえたアドバイスをもらった。", "Recebi um conselho baseado na experiência."),
],
R=[
("お客様の声____、サービスを改善した。", "Melhoramos o serviço levando em conta a opinião dos clientes.", ["を踏まえて", "を踏まえ", "をふまえて"]),
("過去の失敗____、同じミスをしないようにする。", "Considerando os erros do passado, vamos evitar cometer o mesmo erro.", ["を踏まえて", "を踏まえ", "をふまえて"]),
("話し合いの結果____、方針を決めた。", "Definimos a diretriz com base no resultado da conversa.", ["を踏まえて", "を踏まえ", "をふまえて"]),
("データ____提案をしてください。", "Faça uma proposta baseada nos dados.", ["を踏まえた"]),
("社会の変化____、制度を見直す。", "Vamos rever o sistema levando em conta as mudanças da sociedade.", ["を踏まえて", "を踏まえ", "をふまえて"]),
],
),
dict(
n=144,
jp="〜を経て",
rd="wo hete",
tr="Depois de passar por / Através de / Após",
ex="""を経て indica que algo chegou a um resultado depois de passar por uma etapa, um lugar ou um período. Equivale a "depois de passar por" ou "após".

Pode se referir a um caminho físico, como "chegar a Paris passando por Londres", ou a um processo, como "depois de várias provas, foi contratado".

É uma expressão formal.""",
st="""Substantivo (lugar / etapa / período) + を経て""",
no="""É parecido com を通って e の後で, mas を経て destaca o processo ou a etapa necessária.

Costuma vir com palavras como 審査, 試験, 議論, 年月 e 段階.""",
bf="を経て",
rx="を経て|をへて|を経た",
tk=["を", "経て"],
va=["を経て", "を経た"],
E=[
("この飛行機はソウルを経て、東京に向かう。", "このひこうきはソウルをへて、とうきょうにむかう。", "Este avião vai para Tóquio passando por Seul."),
("三回の面接を経て、採用が決まった。", "さんかいのめんせつをへて、さいようがきまった。", "Depois de passar por três entrevistas, fui contratado."),
("十年の歳月を経て、橋が完成した。", "じゅうねんのさいげつをへて、はしがかんせいした。", "Após dez anos, a ponte ficou pronta."),
("長い議論を経て、法律が成立した。", "ながいぎろんをへて、ほうりつがせいりつした。", "Depois de uma longa discussão, a lei foi aprovada."),
("厳しい審査を経た商品だけが販売される。", "きびしいしんさをへたしょうひんだけがはんばいされる。", "Só são vendidos os produtos que passaram por uma avaliação rigorosa."),
],
R=[
("大阪____、福岡に行く。", "Vou a Fukuoka passando por Osaka.", ["を経て", "をへて"]),
("多くの困難____、夢を実現した。", "Depois de passar por muitas dificuldades, realizou o sonho.", ["を経て", "をへて"]),
("試験と面接____、入学が許可された。", "Após prova e entrevista, a matrícula foi aprovada.", ["を経て", "をへて"]),
("数年の研究____、新しい薬が開発された。", "Após anos de pesquisa, foi desenvolvido um novo remédio.", ["を経て", "をへて"]),
("会議での承認____、計画が実行される。", "Depois da aprovação na reunião, o plano será executado.", ["を経て", "をへて"]),
],
),
dict(
n=145,
jp="〜を控えて",
rd="wo hikaete",
tr="Às vésperas de / Com... pela frente / Diante de",
ex="""を控えて indica que um acontecimento importante está próximo. Equivale a "às vésperas de" ou "com... pela frente".

A segunda parte costuma descrever a preparação ou o estado da pessoa diante desse acontecimento. Por exemplo, "às vésperas da prova, os alunos estão nervosos".

É uma expressão formal.""",
st="""Substantivo (acontecimento / tempo) + を控えて / を控え
Substantivo + を控えた + Substantivo""",
no="""Costuma vir com palavras como 試験, 結婚, 出発, 本番 e 選挙.

Também pode indicar um lugar próximo, como 後ろに山を控えて, "com a montanha atrás".""",
bf="を控えて",
rx="を控えて|を控え|を控えた|に控えて|に控え|をひかえて",
tk=["を", "控えて"],
va=["を控えて", "を控え", "を控えた"],
E=[
("試験を明日に控えて、学生たちは緊張している。", "しけんをあしたにひかえて、がくせいたちはきんちょうしている。", "Com a prova amanhã, os alunos estão nervosos."),
("結婚を来月に控え、準備に忙しい。", "けっこんをらいげつにひかえ、じゅんびにいそがしい。", "Com o casamento no mês que vem, estou ocupado com os preparativos."),
("本番を控えて、最後の練習をした。", "ほんばんをひかえて、さいごのれんしゅうをした。", "Às vésperas da apresentação, fizemos o último ensaio."),
("選挙を控えた候補者たちは、演説を続けている。", "せんきょをひかえたこうほしゃたちは、えんぜつをつづけている。", "Os candidatos, com a eleição pela frente, continuam discursando."),
("出発を一週間後に控えて、荷物をまとめ始めた。", "しゅっぱつをいっしゅうかんごにひかえて、にもつをまとめはじめた。", "Com a partida dali a uma semana, comecei a arrumar a bagagem."),
],
R=[
("卒業____、学生たちは将来について考えている。", "Às vésperas da formatura, os alunos pensam no futuro.", ["を控えて", "を控え", "をひかえて"]),
("手術を明日に____、不安でたまらない。", "Com a cirurgia amanhã, estou extremamente ansioso.", ["控えて", "控え"]),
("大会____、選手たちは毎日練習している。", "Com o campeonato pela frente, os atletas treinam todos os dias.", ["を控えて", "を控え", "をひかえて"]),
("出産____妻のために、部屋を片付けた。", "Arrumei o quarto para minha esposa, que está às vésperas do parto.", ["を控えた"]),
("開店____、スタッフは準備に追われている。", "Às vésperas da inauguração, a equipe está atarefada com os preparativos.", ["を控えて", "を控え", "をひかえて"]),
],
),
dict(
n=146,
jp="〜をいいことに",
rd="wo ii koto ni",
tr="Aproveitando-se de / Tirando proveito de / Já que",
ex="""をいいことに indica que alguém se aproveita de uma situação para fazer algo que não deveria. Equivale a "aproveitando-se de" ou "tirando proveito de".

O tom é sempre de crítica, porque a pessoa age de forma egoísta ou desonesta. Por exemplo, "aproveitando que os pais não estavam, ele deu uma festa".

É uma expressão coloquial.""",
st="""Substantivo + をいいことに
Frase (forma simples) + の + をいいことに""",
no="""A segunda parte costuma ser algo que a pessoa normalmente não poderia fazer.

É parecido com に乗じて, que é mais formal.""",
bf="をいいことに",
rx="をいいことに|を良いことに",
tk=["を", "いい", "こと", "に"],
va=["をいいことに"],
E=[
("親が留守なのをいいことに、彼は友達を呼んで騒いだ。", "おやがるすなのをいいことに、かれはともだちをよんでさわいだ。", "Aproveitando que os pais não estavam, ele chamou os amigos e fez bagunça."),
("先生が優しいのをいいことに、学生たちは宿題をしない。", "せんせいがやさしいのをいいことに、がくせいたちはしゅくだいをしない。", "Tirando proveito da bondade do professor, os alunos não fazem a lição."),
("誰も見ていないのをいいことに、ごみを捨てた。", "だれもみていないのをいいことに、ごみをすてた。", "Aproveitando que ninguém estava olhando, jogou lixo no chão."),
("上司が休みなのをいいことに、早く帰った。", "じょうしがやすみなのをいいことに、はやくかえった。", "Aproveitando a folga do chefe, fui embora cedo."),
("彼の好意をいいことに、何度もお金を借りた。", "かれのこういをいいことに、なんどもおかねをかりた。", "Tirando proveito da gentileza dele, pedi dinheiro emprestado várias vezes."),
],
R=[
("店長がいないの____、店員がさぼっている。", "Aproveitando que o gerente não está, os atendentes estão enrolando.", ["をいいことに"]),
("子供なの____、わがままを言う。", "Aproveitando-se de ser criança, faz birra.", ["をいいことに"]),
("規則があいまいなの____、勝手なことをする人がいる。", "Tem gente que faz o que quer aproveitando que as regras são vagas.", ["をいいことに"]),
("母が何も言わないの____、彼は毎晩遅く帰ってくる。", "Aproveitando que a mãe não diz nada, ele volta tarde toda noite.", ["をいいことに"]),
("雨____、ジョギングをさぼった。", "Aproveitando a chuva, matei a corrida.", ["をいいことに"]),
],
),
dict(
n=147,
jp="〜を顧みず / 〜も顧みず",
rd="wo kaerimizu / mo kaerimizu",
tr="Sem se importar com / Ignorando / Sem levar em conta",
ex="""を顧みず indica que alguém age sem pensar nas consequências ou nos riscos. Equivale a "sem se importar com" ou "ignorando".

Pode ser usado de forma positiva, para elogiar a coragem, como "salvou a criança sem se importar com o perigo", ou de forma negativa, para criticar, como "ignorando a família, só trabalhava".

É uma expressão formal.""",
st="""Substantivo + を顧みず / も顧みず
Verbo / Adjetivo (forma simples) + の + を顧みず""",
no="""Expressões comuns são 危険を顧みず, 家族を顧みず e 周囲の迷惑も顧みず.

É parecido com を気にせず e もかまわず, mas を顧みず é mais formal.""",
bf="を顧みず",
rx="を顧みず|も顧みず|をかえりみず|もかえりみず",
tk=["を", "顧みず"],
va=["を顧みず", "も顧みず"],
E=[
("彼は危険を顧みず、子供を助けた。", "かれはきけんをかえりみず、こどもをたすけた。", "Ele salvou a criança sem se importar com o perigo."),
("父は家族を顧みず、仕事ばかりしていた。", "ちちはかぞくをかえりみず、しごとばかりしていた。", "Meu pai só trabalhava, ignorando a família."),
("周りの迷惑も顧みず、大声で話している。", "まわりのめいわくもかえりみず、おおごえではなしている。", "Está falando alto sem se importar com o incômodo dos outros."),
("自分の体を顧みず、働き続けた。", "じぶんのからだをかえりみず、はたらきつづけた。", "Continuou trabalhando sem se importar com a própria saúde."),
("彼女は反対も顧みず、留学を決めた。", "かのじょははんたいもかえりみず、りゅうがくをきめた。", "Ela decidiu fazer intercâmbio ignorando a oposição."),
],
R=[
("消防士は自分の命____、火の中に飛び込んだ。", "O bombeiro se jogou no fogo sem se importar com a própria vida.", ["を顧みず", "も顧みず"]),
("彼は健康____、毎晩お酒を飲んでいる。", "Ele bebe toda noite sem se importar com a saúde.", ["を顧みず", "も顧みず"]),
("親の心配____、彼は一人で旅に出た。", "Ele viajou sozinho ignorando a preocupação dos pais.", ["も顧みず", "を顧みず"]),
("会社の将来____、社長は自分の利益ばかり考えた。", "O presidente só pensava no próprio lucro, sem levar em conta o futuro da empresa.", ["を顧みず", "も顧みず"]),
("嵐の危険____、漁師たちは海に出た。", "Os pescadores saíram ao mar ignorando o perigo da tempestade.", ["を顧みず", "も顧みず"]),
],
),
dict(
n=148,
jp="〜を限りに",
rd="wo kagiri ni",
tr="A partir de / Até / Com... como último",
ex="""を限りに indica que algo termina em um determinado momento, e depois disso não continua mais. Equivale a "a partir de... não mais" ou "até".

Costuma vir com palavras de tempo, como hoje, este mês ou este ano. Por exemplo, "com o dia de hoje, paro de fumar".

Também aparece em 声を限りに, que significa "com toda a força da voz".""",
st="""Substantivo (tempo) + を限りに
声を限りに + Verbo""",
no="""Expressões comuns são 今日を限りに, 今回を限りに e 本日を限りに.

É parecido com をもって, que também é formal.""",
bf="を限りに",
rx="を限りに|をかぎりに",
tk=["を", "限り", "に"],
va=["を限りに"],
E=[
("今日を限りに、たばこをやめる。", "きょうをかぎりに、たばこをやめる。", "Com o dia de hoje, paro de fumar."),
("今月を限りに、この店は閉店します。", "こんげつをかぎりに、このみせはへいてんします。", "Esta loja fecha ao fim deste mês."),
("彼は今シーズンを限りに引退する。", "かれはこんシーズンをかぎりにいんたいする。", "Ele vai se aposentar com o fim desta temporada."),
("声を限りに助けを求めた。", "こえをかぎりにたすけをもとめた。", "Pediu socorro com toda a força da voz."),
("今回を限りに、もう二度と遅刻しません。", "こんかいをかぎりに、もうにどとちこくしません。", "A partir de agora, nunca mais vou me atrasar."),
],
R=[
("本日____、このサービスは終了いたします。", "Com o dia de hoje, este serviço será encerrado.", ["を限りに", "をかぎりに"]),
("今年____、この大会は中止になる。", "Este campeonato será encerrado com o fim deste ano.", ["を限りに", "をかぎりに"]),
("子供たちは声____応援した。", "As crianças torceram com toda a força da voz.", ["を限りに", "をかぎりに"]),
("今夜____、お酒をやめることにした。", "Decidi parar de beber a partir desta noite.", ["を限りに", "をかぎりに"]),
("この試合____、彼はチームを去る。", "Com esta partida, ele deixa o time.", ["を限りに", "をかぎりに"]),
],
),
dict(
n=149,
jp="〜を兼ねて",
rd="wo kanete",
tr="Para também / Aproveitando para / Servindo também como",
ex="""を兼ねて indica que uma ação serve a dois ou mais objetivos ao mesmo tempo. Equivale a "para também" ou "servindo também como".

Por exemplo, "faço caminhada também como exercício" ou "a viagem a trabalho serviu também de passeio".

É uma expressão comum, usada tanto na fala quanto na escrita.""",
st="""Substantivo + を兼ねて + Verbo
Substantivo + と + Substantivo + を兼ねて""",
no="""Expressões comuns são 趣味と実益を兼ねて, 運動を兼ねて e 観光を兼ねて.

É parecido com がてら e かたがた.""",
bf="を兼ねて",
rx="を兼ねて|を兼ね|をかねて",
tk=["を", "兼ねて"],
va=["を兼ねて", "を兼ね"],
E=[
("運動を兼ねて、毎朝散歩している。", "うんどうをかねて、まいあささんぽしている。", "Caminho toda manhã, também como exercício."),
("出張と観光を兼ねて、京都に行った。", "しゅっちょうとかんこうをかねて、きょうとにいった。", "Fui a Kyoto a trabalho e, ao mesmo tempo, para passear."),
("趣味と実益を兼ねて、家庭菜園を始めた。", "しゅみとじつえきをかねて、かていさいえんをはじめた。", "Comecei uma horta em casa, como hobby e também para ter benefício prático."),
("この部屋は書斎と客間を兼ねている。", "このへやはしょさいときゃくまをかねている。", "Este quarto serve de escritório e também de quarto de hóspedes."),
("お礼を兼ねて、先生の家を訪ねた。", "おれいをかねて、せんせいのいえをたずねた。", "Visitei a casa do professor, aproveitando para agradecer."),
],
R=[
("気分転換____、旅行に出かけた。", "Saí de viagem também para mudar de ares.", ["を兼ねて", "を兼ね", "をかねて"]),
("勉強____、英語の映画を見ている。", "Assisto filmes em inglês também para estudar.", ["を兼ねて", "を兼ね", "をかねて"]),
("下見____、会場に行ってみた。", "Fui ao local também para fazer um reconhecimento.", ["を兼ねて", "を兼ね", "をかねて"]),
("ダイエット____、自転車で通勤している。", "Vou de bicicleta para o trabalho também para emagrecer.", ["を兼ねて", "を兼ね", "をかねて"]),
("挨拶____、新しい近所の人を訪ねた。", "Visitei os novos vizinhos aproveitando para me apresentar.", ["を兼ねて", "を兼ね", "をかねて"]),
],
),
dict(
n=150,
jp="〜を皮切りに",
rd="wo kawakiri ni",
tr="Começando por / A partir de / Tendo como ponto de partida",
ex="""を皮切りに indica que algo começou em um ponto e depois se espalhou ou continuou em sequência. Equivale a "começando por" ou "a partir de".

É muito usado para turnês, campanhas, eventos e séries de acontecimentos. Por exemplo, "começando por Tóquio, a banda fará shows em todo o país".

É uma expressão formal.""",
st="""Substantivo + を皮切りに / を皮切りとして
Verbo (forma simples) + の + を皮切りに""",
no="""Expressões comuns são 東京公演を皮切りに e この発言を皮切りに.

É parecido com をはじめとして e から始まって.""",
bf="を皮切りに",
rx="を皮切りに|を皮切りとして|をかわきりに",
tk=["を", "皮切り", "に"],
va=["を皮切りに", "を皮切りとして"],
E=[
("東京公演を皮切りに、全国ツアーが始まった。", "とうきょうこうえんをかわきりに、ぜんこくツアーがはじまった。", "Começando pelo show em Tóquio, teve início a turnê nacional."),
("彼の発言を皮切りに、次々と反対意見が出た。", "かれのはつげんをかわきりに、つぎつぎとはんたいいけんがでた。", "A partir da declaração dele, surgiram opiniões contrárias uma atrás da outra."),
("この店を皮切りとして、全国に店を増やしていく。", "このみせをかわきりとして、ぜんこくにみせをふやしていく。", "Tendo esta loja como ponto de partida, vamos abrir lojas no país todo."),
("新商品の発売を皮切りに、キャンペーンが始まる。", "しんしょうひんのはつばいをかわきりに、キャンペーンがはじまる。", "A campanha começa a partir do lançamento do novo produto."),
("一人が笑ったのを皮切りに、みんなが笑い出した。", "ひとりがわらったのをかわきりに、みんながわらいだした。", "Começando por uma pessoa que riu, todos começaram a rir."),
],
R=[
("大阪____、各地で講演会を行う。", "Começando por Osaka, faremos palestras em vários lugares.", ["を皮切りに", "を皮切りとして", "をかわきりに"]),
("今日の会議____、話し合いが続けられる。", "A partir da reunião de hoje, as conversas vão continuar.", ["を皮切りに", "を皮切りとして", "をかわきりに"]),
("第一話____、シリーズ全作が放送される。", "Começando pelo primeiro episódio, toda a série será transmitida.", ["を皮切りに", "を皮切りとして", "をかわきりに"]),
("彼女が手を挙げたの____、多くの人が質問した。", "A partir de quando ela levantou a mão, muitas pessoas fizeram perguntas.", ["を皮切りに", "を皮切りとして", "をかわきりに"]),
("ニューヨーク____、世界各地で展示会が開かれる。", "Começando por Nova York, haverá exposições em várias partes do mundo.", ["を皮切りに", "を皮切りとして", "をかわきりに"]),
],
),
]
