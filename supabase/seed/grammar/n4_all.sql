-- n4-grammar-01 — 〜間
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-01',
    'grammar',
    'N4',
    $$〜間$$,
    $$aida$$,
    $$Durante / Enquanto$$,
    $$間 (あいだ) é usado para dizer que algo acontece durante todo um período. Equivale a "durante" ou "enquanto".

A ideia central é continuidade: a ação principal acontece do começo ao fim do período indicado. Por isso, o verbo principal costuma expressar algo contínuo, como estar fazendo algo, ficar em um lugar ou continuar em um estado. É comum aparecer junto com ずっと.

Antes de 間, pode vir um substantivo com の, ou um verbo que indica um estado ou ação contínua, geralmente na forma ている ou com verbos como いる.

Não confunda com 間に: 間 cobre o período inteiro, enquanto 間に indica que algo aconteceu em algum momento dentro desse período.$$,
    $$間 também é usado para espaço físico, com o sentido de "entre", como entre dois prédios ou entre duas pessoas.

Quando a frase com 間 é seguida de は, a ideia de "durante esse tempo, sempre" fica ainda mais destacada.

Lido ま, o mesmo kanji aparece em outras palavras, como 間に合う (chegar a tempo). Lido かん, aparece em 時間 e 週間.$$,
    $$Substantivo + の + 間
Verbo na forma ている + 間
Verbo de estado (いる / ある) + 間
Adjetivo い + 間
Adjetivo な + な + 間

Escrita: 間 / あいだ$$,
    $$間$$,
    $$間、|間は|間ずっと|間中|あいだ$$,
    ARRAY['間']::text[],
    ARRAY['間', 'あいだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-01', $$夏休みの間、ずっと国に帰っていました。$$, $$なつやすみのあいだ、ずっとくににかえっていました。$$, $$Durante as férias de verão, fiquei no meu país o tempo todo.$$),
    ('n4-grammar-01', $$母が料理をしている間、私は部屋を掃除しました。$$, $$ははがりょうりをしているあいだ、わたしはへやをそうじしました。$$, $$Enquanto minha mãe cozinhava, eu limpei o quarto.$$),
    ('n4-grammar-01', $$授業の間は、携帯電話を使わないでください。$$, $$じゅぎょうのあいだは、けいたいでんわをつかわないでください。$$, $$Durante a aula, não usem o celular.$$),
    ('n4-grammar-01', $$日本にいる間、たくさんの所へ行きたいです。$$, $$にほんにいるあいだ、たくさんのところへいきたいです。$$, $$Enquanto estiver no Japão, quero ir a muitos lugares.$$),
    ('n4-grammar-01', $$電車に乗っている間、ずっと音楽を聞いていました。$$, $$でんしゃにのっているあいだ、ずっとおんがくをきいていました。$$, $$Fiquei ouvindo música o tempo todo enquanto estava no trem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供が寝ている____、本を読みました。$$, $$Enquanto a criança dormia, li um livro.$$),
        (2, $$冬休みの____、毎日アルバイトをしました。$$, $$Durante as férias de inverno, trabalhei meio período todos os dias.$$),
        (3, $$先生が話している____は、静かにしてください。$$, $$Enquanto o professor estiver falando, fiquem em silêncio.$$),
        (4, $$両親が旅行している____、私が犬の世話をします。$$, $$Enquanto meus pais estiverem viajando, eu cuido do cachorro.$$),
        (5, $$会議の____、ずっと眠かったです。$$, $$Durante a reunião inteira, fiquei com sono.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-01', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$間$$),
        (1, $$あいだ$$),
        (2, $$間$$),
        (2, $$あいだ$$),
        (3, $$間$$),
        (3, $$あいだ$$),
        (4, $$間$$),
        (4, $$あいだ$$),
        (5, $$間$$),
        (5, $$あいだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-02 — 〜間に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-02',
    'grammar',
    'N4',
    $$〜間に$$,
    $$aida ni$$,
    $$Enquanto / Durante (em algum momento) / Antes que$$,
    $$間に é usado para dizer que algo acontece em algum momento dentro de um período, e não durante o período inteiro. Equivale a "enquanto" ou "durante".

A diferença em relação a 間 é muito importante. Com 間, a ação principal ocupa todo o período. Com 間に, a ação principal acontece uma vez, em algum ponto desse intervalo, e termina antes de o período acabar.

Por isso, o verbo principal costuma ser uma ação pontual, como chegar, terminar, fazer uma tarefa ou acontecer algo.

Muitas vezes, 間に também carrega a ideia de aproveitar uma oportunidade: fazer algo enquanto ainda dá tempo ou enquanto uma situação continua.$$,
    $$A expressão 知らない間に significa "sem perceber" ou "quando vi, já tinha acontecido".

間に é parecido com うちに, que também significa "enquanto", mas うちに destaca mais a ideia de "antes que a situação mude".

Uma dica para escolher: se a ação dura o tempo todo, use 間; se acontece uma vez no meio do período, use 間に.$$,
    $$Substantivo + の + 間に
Verbo na forma ている + 間に
Verbo de estado (いる / ある) + 間に
Adjetivo い + 間に
Adjetivo な + な + 間に

Escrita: 間に / あいだに$$,
    $$間に$$,
    $$間に|あいだに$$,
    ARRAY['間', 'に']::text[],
    ARRAY['間に', 'あいだに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-02', $$留守の間に、友達が来ました。$$, $$るすのあいだに、ともだちがきました。$$, $$Enquanto eu estava fora, um amigo veio.$$),
    ('n4-grammar-02', $$赤ちゃんが寝ている間に、洗濯をします。$$, $$あかちゃんがねているあいだに、せんたくをします。$$, $$Vou lavar a roupa enquanto o bebê dorme.$$),
    ('n4-grammar-02', $$夏休みの間に、運転免許を取りたいです。$$, $$なつやすみのあいだに、うんてんめんきょをとりたいです。$$, $$Quero tirar a carteira de motorista durante as férias de verão.$$),
    ('n4-grammar-02', $$若い間に、いろいろな国へ行ってみたい。$$, $$わかいあいだに、いろいろなくにへいってみたい。$$, $$Quero conhecer vários países enquanto sou jovem.$$),
    ('n4-grammar-02', $$知らない間に、雨がやんでいた。$$, $$しらないあいだに、あめがやんでいた。$$, $$Sem eu perceber, a chuva tinha parado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$母が買い物に行っている____、部屋を片付けました。$$, $$Enquanto minha mãe foi fazer compras, arrumei o quarto.$$),
        (2, $$日本にいる____、富士山に登りたいです。$$, $$Quero subir o Monte Fuji enquanto estiver no Japão.$$),
        (3, $$寝ている____、地震がありました。$$, $$Enquanto eu dormia, houve um terremoto.$$),
        (4, $$休みの____、引っ越しを済ませました。$$, $$Terminei a mudança durante a folga.$$),
        (5, $$気がつかない____、もう夜になっていた。$$, $$Sem eu perceber, já tinha anoitecido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-02', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$間に$$),
        (1, $$あいだに$$),
        (2, $$間に$$),
        (2, $$あいだに$$),
        (3, $$間に$$),
        (3, $$あいだに$$),
        (4, $$間に$$),
        (4, $$あいだに$$),
        (5, $$間に$$),
        (5, $$あいだに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-03 — あまり〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-03',
    'grammar',
    'N4',
    $$あまり〜ない$$,
    $$amari ~ nai$$,
    $$Não muito / Quase não$$,
    $$あまり〜ない é usado para dizer que algo acontece pouco ou que uma característica não é forte. Equivale a "não muito" ou "quase não".

あまり sozinho não é negativo, mas, nesse uso, ele sempre aparece junto com uma forma negativa: verbo na forma ない ou ません, adjetivo い com くない, ou adjetivo な e substantivo com じゃない.

Com verbos, indica frequência baixa, como "não vejo muito" ou "quase não bebo". Com adjetivos, indica intensidade baixa, como "não é muito caro".

É uma forma suave de negar. Em vez de dizer que algo é ruim ou que você não gosta, あまり〜ない suaviza a frase, e por isso é muito usado por educação.$$,
    $$Na fala, あまり muitas vezes vira あんまり, com o mesmo sentido.

Em frases afirmativas, あまり tem outro sentido: "demais", como em あまりにも. Esse uso aparece em níveis seguintes.

Para dizer "nunca" ou "nada", o japonês usa 全然〜ない, que é mais forte que あまり〜ない.$$,
    $$あまり + Verbo na forma ない / ません
あまり + Adjetivo い sem い + くない
あまり + Adjetivo な / Substantivo + じゃない / ではありません

Forma falada: あんまり$$,
    $$あまり$$,
    $$あまり|あんまり$$,
    ARRAY['あまり', 'ない']::text[],
    ARRAY['あまり', 'あんまり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-03', $$私はあまりテレビを見ません。$$, $$わたしはあまりテレビをみません。$$, $$Eu não vejo muita TV.$$),
    ('n4-grammar-03', $$この料理はあまり辛くないです。$$, $$このりょうりはあまりからくないです。$$, $$Esta comida não é muito apimentada.$$),
    ('n4-grammar-03', $$今日はあまり時間がない。$$, $$きょうはあまりじかんがない。$$, $$Hoje não tenho muito tempo.$$),
    ('n4-grammar-03', $$昨日の映画はあんまりおもしろくなかった。$$, $$きのうのえいがはあんまりおもしろくなかった。$$, $$O filme de ontem não foi muito interessante.$$),
    ('n4-grammar-03', $$日本語はまだあまり上手じゃありません。$$, $$にほんごはまだあまりじょうずじゃありません。$$, $$Meu japonês ainda não é muito bom.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$兄は____お酒を飲みません。$$, $$Meu irmão mais velho quase não bebe.$$),
        (2, $$この町は____にぎやかではありません。$$, $$Esta cidade não é muito animada.$$),
        (3, $$最近、____寝ていません。$$, $$Ultimamente, não tenho dormido muito.$$),
        (4, $$「旅行はどうでしたか。」「____楽しくなかったです。」$$, $$"Como foi a viagem?" "Não foi muito divertida."$$),
        (5, $$甘い物は____好きじゃない。$$, $$Não gosto muito de doces.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-03', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あまり$$),
        (1, $$あんまり$$),
        (2, $$あまり$$),
        (2, $$あんまり$$),
        (3, $$あまり$$),
        (3, $$あんまり$$),
        (4, $$あまり$$),
        (4, $$あんまり$$),
        (5, $$あまり$$),
        (5, $$あんまり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-04 — 〜後で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-04',
    'grammar',
    'N4',
    $$〜後で$$,
    $$ato de$$,
    $$Depois de / Mais tarde$$,
    $$後で é usado para dizer que uma ação acontece depois de outra. Equivale a "depois de" ou, sozinho, "mais tarde".

Com verbos, o verbo que vem antes fica sempre na forma た, mesmo que a frase fale do futuro. Isso acontece porque a primeira ação precisa estar terminada antes da segunda.

Com substantivos, usa-se の antes de 後で, como "depois da aula".

Sozinho, no começo da frase, 後で significa "mais tarde" ou "depois", e é muito usado para adiar algo de forma educada.

Comparando com てから: as duas indicam sequência, mas てから destaca mais a ordem obrigatória, enquanto 後で apenas situa a ação depois de outra no tempo.$$,
    $$O oposto de 後で é 前に, que usa o verbo na forma de dicionário. Lembrar desse contraste ajuda: antes = dicionário, depois = た.

A forma 後 sem で também existe, como em 後、〜, e soa um pouco mais escrita.

後で電話します e 後で連絡します são frases muito comuns para dizer que você vai entrar em contato depois.$$,
    $$Verbo na forma た + 後で
Substantivo + の + 後で
後で + Verbo (mais tarde)

Escrita: 後で / あとで$$,
    $$後で$$,
    $$後で|あとで$$,
    ARRAY['後', 'で']::text[],
    ARRAY['後で', 'あとで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-04', $$宿題をした後で、テレビを見ます。$$, $$しゅくだいをしたあとで、テレビをみます。$$, $$Vou ver TV depois de fazer a lição.$$),
    ('n4-grammar-04', $$授業の後で、先生に質問しました。$$, $$じゅぎょうのあとで、せんせいにしつもんしました。$$, $$Depois da aula, fiz uma pergunta ao professor.$$),
    ('n4-grammar-04', $$ご飯を食べた後で、薬を飲んでください。$$, $$ごはんをたべたあとで、くすりをのんでください。$$, $$Tome o remédio depois de comer.$$),
    ('n4-grammar-04', $$今ちょっと忙しいので、後で電話します。$$, $$いまちょっといそがしいので、あとででんわします。$$, $$Agora estou um pouco ocupado, então ligo mais tarde.$$),
    ('n4-grammar-04', $$仕事が終わった後で、一緒に飲みに行きませんか。$$, $$しごとがおわったあとで、いっしょにのみにいきませんか。$$, $$Depois do trabalho, quer ir beber alguma coisa comigo?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$歯を磨いた____、寝ます。$$, $$Vou dormir depois de escovar os dentes.$$),
        (2, $$映画を見た____、レストランで食事をしました。$$, $$Depois de ver o filme, jantamos num restaurante.$$),
        (3, $$会議の____、少し話せますか。$$, $$Podemos conversar um pouco depois da reunião?$$),
        (4, $$今忙しいので、____連絡します。$$, $$Agora estou ocupado, então entro em contato mais tarde.$$),
        (5, $$試験が終わった____、みんなでカラオケに行った。$$, $$Depois que a prova acabou, fomos todos ao karaokê.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-04', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$後で$$),
        (1, $$あとで$$),
        (2, $$後で$$),
        (2, $$あとで$$),
        (3, $$後で$$),
        (3, $$あとで$$),
        (4, $$後で$$),
        (4, $$あとで$$),
        (5, $$後で$$),
        (5, $$あとで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-05 — 〜ば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-05',
    'grammar',
    'N4',
    $$〜ば$$,
    $$ba$$,
    $$Se / Caso / Quando$$,
    $$ば é a forma condicional que expressa "se". Ela mostra que, se uma condição for cumprida, um resultado acontece.

A ideia principal é de condição necessária: para que o resultado aconteça, é preciso que a primeira parte seja verdade. Por isso, ば é muito usado para conselhos, regras gerais, consequências naturais e hipóteses.

A forma muda conforme o tipo de palavra. Nos verbos, o último som muda de "u" para "e" e recebe ば. Nos adjetivos い, troca-se い por ければ. Nos negativos, ない vira なければ. Para substantivos e adjetivos な, usa-se であれば ou なら.

Em geral, quando a primeira parte é afirmativa e descreve uma ação de quem fala, a segunda parte não costuma ser uma ordem ou pedido. Essa restrição não vale quando a primeira parte é um estado, como ある, いる ou adjetivos.$$,
    $$A expressão どうすればいいですか é muito usada para pedir conselho: "o que eu devo fazer?".

O japonês tem várias formas de "se": ば, たら, と e なら. ば destaca a condição; たら é a mais versátil na conversa; と indica consequência automática; なら responde a algo que o outro disse.

A forma よければ, de いい, aparece muito em ofertas educadas, como "se quiser...".$$,
    $$Verbo grupo 1: último som "u" → "e" + ば (行く → 行けば / 飲む → 飲めば)
Verbo grupo 2: tire る + れば (食べる → 食べれば)
Irregulares: する → すれば / 来る → 来れば (くれば)
Adjetivo い: tire い + ければ (安い → 安ければ / いい → よければ)
Negativo: ない → なければ
Substantivo / Adjetivo な: + であれば / なら$$,
    $$ば$$,
    $$えば|けば|げば|せば|てば|べば|めば|れば$$,
    ARRAY['ば']::text[],
    ARRAY['ば', 'れば', 'ければ', 'なければ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-05', $$時間があれば、手伝います。$$, $$じかんがあれば、てつだいます。$$, $$Se eu tiver tempo, ajudo.$$),
    ('n4-grammar-05', $$安ければ、買います。$$, $$やすければ、かいます。$$, $$Se for barato, eu compro.$$),
    ('n4-grammar-05', $$この薬を飲めば、すぐ治りますよ。$$, $$このくすりをのめば、すぐなおりますよ。$$, $$Se tomar este remédio, você vai melhorar logo.$$),
    ('n4-grammar-05', $$急げば、間に合うと思います。$$, $$いそげば、まにあうとおもいます。$$, $$Se nos apressarmos, acho que chegamos a tempo.$$),
    ('n4-grammar-05', $$雨が降らなければ、ピクニックに行きましょう。$$, $$あめがふらなければ、ピクニックにいきましょう。$$, $$Se não chover, vamos fazer um piquenique.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お金があ____、旅行に行きたいです。$$, $$Se eu tivesse dinheiro, queria viajar.$$),
        (2, $$天気がよけ____、ここから山が見えます。$$, $$Se o tempo estiver bom, dá para ver a montanha daqui.$$),
        (3, $$この道をまっすぐ行____、駅に着きます。$$, $$Se seguir reto por esta rua, você chega à estação.$$),
        (4, $$毎日練習す____、上手になりますよ。$$, $$Se praticar todo dia, você vai ficar bom.$$),
        (5, $$わからな____、先生に聞いてください。$$, $$Se não entender, pergunte ao professor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-05', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$れば$$),
        (2, $$れば$$),
        (3, $$けば$$),
        (4, $$れば$$),
        (5, $$ければ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-06 — 〜場合は
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-06',
    'grammar',
    'N4',
    $$〜場合は$$,
    $$baai wa$$,
    $$No caso de / Caso / Se$$,
    $$場合は é usado para falar de uma situação possível e do que deve ser feito se ela acontecer. Equivale a "no caso de" ou "caso".

場合 significa "caso" ou "situação". Assim, a estrutura apresenta uma hipótese e, em seguida, a instrução ou consequência para aquele caso.

É muito comum em avisos, regras, manuais e instruções, principalmente para situações que não são do dia a dia, como emergências, atrasos, perdas ou problemas.

Por isso, soa mais formal e objetivo do que たら ou ば. Ele vem depois de verbos e adjetivos na forma simples, de adjetivos な com な, e de substantivos com の.$$,
    $$場合 normalmente não é usado para coisas que certamente vão acontecer. Ele apresenta um caso possível, não garantido.

Também é comum a forma 場合には, que tem o mesmo sentido, com um pouco mais de ênfase.

A leitura é ばあい, e não ばごう. É uma palavra com leitura que mistura os dois sistemas de leitura dos kanji.$$,
    $$Verbo (forma simples: dicionário / ない / た) + 場合は
Adjetivo い + 場合は
Adjetivo な + な + 場合は
Substantivo + の + 場合は

Escrita: 場合 / ばあい$$,
    $$場合$$,
    $$場合|ばあい$$,
    ARRAY['場合', 'は']::text[],
    ARRAY['場合は', 'ばあいは', '場合には']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-06', $$雨の場合は、試合は中止です。$$, $$あめのばあいは、しあいはちゅうしです。$$, $$Em caso de chuva, a partida será cancelada.$$),
    ('n4-grammar-06', $$火事の場合は、エレベーターを使わないでください。$$, $$かじのばあいは、エレベーターをつかわないでください。$$, $$Em caso de incêndio, não use o elevador.$$),
    ('n4-grammar-06', $$遅れる場合は、電話してください。$$, $$おくれるばあいは、でんわしてください。$$, $$Caso vá se atrasar, ligue, por favor.$$),
    ('n4-grammar-06', $$熱が下がらない場合は、病院へ行ってください。$$, $$ねつがさがらないばあいは、びょういんへいってください。$$, $$Se a febre não baixar, vá ao hospital.$$),
    ('n4-grammar-06', $$カードをなくした場合は、すぐに銀行に連絡してください。$$, $$カードをなくしたばあいは、すぐにぎんこうにれんらくしてください。$$, $$Caso perca o cartão, entre em contato com o banco imediatamente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$地震の____、机の下に入ってください。$$, $$Em caso de terremoto, entre embaixo da mesa.$$),
        (2, $$会議に出られない____、メールで知らせてください。$$, $$Caso não possa participar da reunião, avise por e-mail.$$),
        (3, $$質問がある____、手を挙げてください。$$, $$Caso tenha alguma pergunta, levante a mão.$$),
        (4, $$道に迷った____、この番号に電話してください。$$, $$Caso se perca, ligue para este número.$$),
        (5, $$子供の____、料金は半額です。$$, $$No caso de crianças, o preço é a metade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-06', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$場合は$$),
        (1, $$ばあいは$$),
        (2, $$場合は$$),
        (2, $$ばあいは$$),
        (3, $$場合は$$),
        (3, $$ばあいは$$),
        (4, $$場合は$$),
        (4, $$ばあいは$$),
        (5, $$場合は$$),
        (5, $$ばあいは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-07 — 〜ばかり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-07',
    'grammar',
    'N4',
    $$〜ばかり$$,
    $$bakari$$,
    $$Só / Nada além de / Sempre$$,
    $$ばかり é usado para dizer que algo se repete tanto que parece ser "só aquilo". Equivale a "só", "nada além de" ou "sempre".

Diferente de だけ, que apenas limita de forma neutra, ばかり costuma ter um tom de crítica, reclamação ou surpresa. A ideia é que a quantidade ou a repetição é excessiva.

Ele vem depois do substantivo e pode substituir を e が. Com verbos, aparece na forma てばかりいる, que significa "não faz outra coisa a não ser...".

Também pode descrever um lugar ou grupo formado quase só por um tipo de coisa ou pessoa.$$,
    $$ばかり também tem outros sentidos: depois de verbo na forma た, significa "acabou de" (たばかり); depois de números, significa "cerca de". São usos diferentes.

Na fala, ばっかり reforça o tom de reclamação.

Se a intenção é apenas dizer "só isso", sem crítica, だけ é a escolha mais neutra.$$,
    $$Substantivo + ばかり + Verbo
Substantivo + ばかり + だ / です
Substantivo + ばかり + の + Substantivo
Verbo na forma て + ばかりいる

Forma falada: ばっかり$$,
    $$ばかり$$,
    $$ばかり|ばっかり$$,
    ARRAY['ばかり']::text[],
    ARRAY['ばかり', 'ばっかり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-07', $$弟はゲームばかりしています。$$, $$おとうとはゲームばかりしています。$$, $$Meu irmão mais novo só fica jogando videogame.$$),
    ('n4-grammar-07', $$最近、雨ばかりですね。$$, $$さいきん、あめばかりですね。$$, $$Ultimamente só chove, né?$$),
    ('n4-grammar-07', $$彼は甘い物ばかり食べる。$$, $$かれはあまいものばかりたべる。$$, $$Ele só come doce.$$),
    ('n4-grammar-07', $$文句ばかり言わないで、手伝ってよ。$$, $$もんくばかりいわないで、てつだってよ。$$, $$Pare de só reclamar e me ajude.$$),
    ('n4-grammar-07', $$このクラスは女の子ばかりだ。$$, $$このクラスはおんなのこばかりだ。$$, $$Esta turma é só de meninas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$息子は漫画____読んでいます。$$, $$Meu filho só lê mangá.$$),
        (2, $$今週は失敗____で、疲れました。$$, $$Esta semana foi só erro, estou cansado.$$),
        (3, $$彼女は肉____食べて、野菜を食べません。$$, $$Ela só come carne e não come verdura.$$),
        (4, $$毎日同じ料理____で、飽きてしまった。$$, $$Todo dia é só a mesma comida, já enjoei.$$),
        (5, $$あの店は高い物____売っている。$$, $$Aquela loja só vende coisa cara.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-07', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかり$$),
        (1, $$ばっかり$$),
        (2, $$ばかり$$),
        (2, $$ばっかり$$),
        (3, $$ばかり$$),
        (3, $$ばっかり$$),
        (4, $$ばかり$$),
        (4, $$ばっかり$$),
        (5, $$ばかり$$),
        (5, $$ばっかり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-08 — 〜だけで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-08',
    'grammar',
    'N4',
    $$〜だけで$$,
    $$dake de$$,
    $$Só de / Apenas com / Só por$$,
    $$だけで é usado para dizer que basta uma coisa simples para que um resultado aconteça. Equivale a "só de", "apenas com" ou "só por".

だけ indica o limite ("só isso"), e で indica o meio ou a condição. Juntos, eles mostram que aquele pouco já é suficiente.

É muito usado para sentimentos e reações: só de pensar em algo, a pessoa já fica com medo; só de ouvir uma música, já fica feliz.

Também aparece para indicar que uma ação simples é suficiente para conseguir algo, como apertar um botão ou mostrar um documento.$$,
    $$Muitas vezes, だけで aparece com verbos como 考える, 想像する, 聞く e 見る, para mostrar uma reação forte a algo pequeno.

Com いい, a forma だけでいい significa "basta só...", "é só...".

Na forma negativa, だけでは〜ない indica que aquilo sozinho não é suficiente.$$,
    $$Verbo na forma de dicionário + だけで
Verbo na forma た / ている + だけで
Substantivo + だけで$$,
    $$だけで$$,
    $$だけで$$,
    ARRAY['だけ', 'で']::text[],
    ARRAY['だけで', 'だけでは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-08', $$この歌を聞くだけで、楽しくなります。$$, $$このうたをきくだけで、たのしくなります。$$, $$Só de ouvir esta música, já fico feliz.$$),
    ('n4-grammar-08', $$考えるだけで、怖いです。$$, $$かんがえるだけで、こわいです。$$, $$Só de pensar, já fico com medo.$$),
    ('n4-grammar-08', $$このアプリは、ボタンを押すだけで使えます。$$, $$このアプリは、ボタンをおすだけでつかえます。$$, $$Este aplicativo funciona apenas apertando um botão.$$),
    ('n4-grammar-08', $$一人だけで、この仕事をするのは無理です。$$, $$ひとりだけで、このしごとをするのはむりです。$$, $$É impossível fazer este trabalho sozinho.$$),
    ('n4-grammar-08', $$見ているだけで、お腹がすいてきた。$$, $$みているだけで、おなかがすいてきた。$$, $$Só de olhar, já fiquei com fome.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここに名前を書く____いいです。$$, $$Basta escrever o nome aqui.$$),
        (2, $$彼の声を聞く____、元気になります。$$, $$Só de ouvir a voz dele, já fico animado.$$),
        (3, $$旅行のことを想像する____、わくわくします。$$, $$Só de imaginar a viagem, já fico empolgado.$$),
        (4, $$説明を読んだ____はわかりませんでした。$$, $$Só lendo a explicação, não consegui entender.$$),
        (5, $$この券を見せる____、無料で入れます。$$, $$Basta mostrar este ingresso para entrar de graça.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-08', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけで$$),
        (2, $$だけで$$),
        (3, $$だけで$$),
        (4, $$だけで$$),
        (5, $$だけで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-09 — 〜出す
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-09',
    'grammar',
    'N4',
    $$〜出す$$,
    $$dasu$$,
    $$Começar a (de repente) / Pôr-se a$$,
    $$出す, ligado a outro verbo, indica que uma ação começou de repente, muitas vezes de forma inesperada. Equivale a "começar a" ou "pôr-se a".

A estrutura junta o verbo na forma ます sem ます com 出す. O resultado funciona como um novo verbo do grupo 1 e se conjuga normalmente: 出します, 出した, 出して.

É muito usado com ações que surgem de forma súbita ou fora do controle, como chover, chorar, rir, correr ou começar a se mover.

A diferença para 始める é o tom: 始める indica um começo planejado ou neutro, enquanto 出す destaca que o início foi repentino e muitas vezes inesperado.$$,
    $$Por indicar algo súbito, 出す aparece muito com 急に e 突然 (de repente).

Em geral, 出す não é usado para uma ação que você decide começar com calma, como começar a estudar seguindo um plano. Nesse caso, 始める é mais natural.

Sozinho, 出す significa "tirar", "enviar" ou "entregar". O sentido de "começar a" aparece apenas quando ele vem depois de outro verbo.$$,
    $$Verbo na forma ます sem ます + 出す

Educado: 出します
Passado: 出した / 出しました

Escrita: 出す / だす$$,
    $$出す$$,
    $$出す|出し|だす|だした|だして$$,
    ARRAY['出す']::text[],
    ARRAY['出す', '出します', '出した', '出しました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-09', $$急に雨が降り出しました。$$, $$きゅうにあめがふりだしました。$$, $$De repente, começou a chover.$$),
    ('n4-grammar-09', $$赤ちゃんが泣き出した。$$, $$あかちゃんがなきだした。$$, $$O bebê começou a chorar.$$),
    ('n4-grammar-09', $$話を聞いて、みんなが笑い出しました。$$, $$はなしをきいて、みんながわらいだしました。$$, $$Ao ouvir a história, todos começaram a rir.$$),
    ('n4-grammar-09', $$彼は突然走り出した。$$, $$かれはとつぜんはしりだした。$$, $$Ele começou a correr de repente.$$),
    ('n4-grammar-09', $$犬が急に吠え出したので、びっくりしました。$$, $$いぬがきゅうにほえだしたので、びっくりしました。$$, $$O cachorro começou a latir de repente e eu me assustei.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$映画を見て、妹が泣き____。$$, $$Vendo o filme, minha irmã mais nova começou a chorar.$$),
        (2, $$信号が青になって、車が動き____。$$, $$O sinal ficou verde e os carros começaram a andar.$$),
        (3, $$夜になって、急に風が吹き____。$$, $$À noite, o vento começou a soprar de repente.$$),
        (4, $$先生の冗談に、学生たちが笑い____。$$, $$Com a piada do professor, os alunos começaram a rir.$$),
        (5, $$母の顔を見て、子供は急に泣き____。$$, $$Ao ver o rosto da mãe, a criança começou a chorar de repente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-09', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$出した$$),
        (1, $$出しました$$),
        (1, $$だした$$),
        (2, $$出した$$),
        (2, $$出しました$$),
        (2, $$だした$$),
        (3, $$出した$$),
        (3, $$出しました$$),
        (3, $$だした$$),
        (4, $$出した$$),
        (4, $$出しました$$),
        (4, $$だした$$),
        (5, $$出した$$),
        (5, $$出しました$$),
        (5, $$だした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-10 — 〜でございます
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-10',
    'grammar',
    'N4',
    $$〜でございます$$,
    $$de gozaimasu$$,
    $$É (muito formal) / Trata-se de$$,
    $$でございます é a forma extremamente educada de です. Ela tem o mesmo significado, "é", mas mostra muito respeito pelo ouvinte.

É usada principalmente por funcionários de lojas, hotéis, restaurantes, empresas e serviços de atendimento ao cliente. Também aparece em anúncios, ligações de trabalho e situações muito formais.

Ela faz parte do 丁寧語, a linguagem polida que deixa a frase mais elegante sem elevar nem rebaixar ninguém em especial. Quem fala está sendo gentil com quem ouve.

No dia a dia, entre colegas ou amigos, でございます soaria exagerado. O normal é usar です.$$,
    $$Ao atender o telefone no trabalho, é comum dizer o nome da empresa ou o próprio sobrenome seguido de でございます.

ございます sozinho é a forma polida de あります. Com で, ele substitui です.

Com adjetivos い, não se usa でございます. Existe uma forma especial e rara, mas, no uso comum, basta usar です.$$,
    $$Substantivo + でございます
Adjetivo な (sem な) + でございます

Passado: でございました
Pergunta: でございますか$$,
    $$でございます$$,
    $$でございます|でございました$$,
    ARRAY['で', 'ございます']::text[],
    ARRAY['でございます', 'でございました', 'でございますか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-10', $$こちらが会議室でございます。$$, $$こちらがかいぎしつでございます。$$, $$Esta é a sala de reuniões.$$),
    ('n4-grammar-10', $$お手洗いは二階でございます。$$, $$おてあらいはにかいでございます。$$, $$O banheiro fica no segundo andar.$$),
    ('n4-grammar-10', $$本日は休業日でございます。$$, $$ほんじつはきゅうぎょうびでございます。$$, $$Hoje é dia de folga do estabelecimento.$$),
    ('n4-grammar-10', $$はい、山田でございます。$$, $$はい、やまだでございます。$$, $$Alô, aqui é o Yamada.$$),
    ('n4-grammar-10', $$お会計は三千円でございます。$$, $$おかいけいはさんぜんえんでございます。$$, $$O total da conta é três mil ienes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$受付は一階____。$$, $$A recepção fica no primeiro andar.$$),
        (2, $$こちらが新しい商品____。$$, $$Este é o novo produto.$$),
        (3, $$「はい、さくら銀行____。」$$, $$"Alô, aqui é o Banco Sakura."$$),
        (4, $$エレベーターはあちら____。$$, $$O elevador fica para lá.$$),
        (5, $$申し訳ございません、その商品は売り切れ____。$$, $$Pedimos desculpas, esse produto está esgotado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-10', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でございます$$),
        (2, $$でございます$$),
        (3, $$でございます$$),
        (4, $$でございます$$),
        (5, $$でございます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-11 — 〜でも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-11',
    'grammar',
    'N4',
    $$〜でも$$,
    $$demo$$,
    $$Ou algo assim / Até mesmo / Qualquer$$,
    $$No N4, でも aparece depois de substantivos com três usos importantes.

O primeiro é dar uma sugestão leve, sem insistir: "um chá ou algo assim". A coisa citada é só um exemplo, e a pessoa fica livre para escolher outra opção. Esse uso é muito comum em convites.

O segundo é "até mesmo": algo é verdade mesmo para um caso extremo ou inesperado, como "até uma criança entende".

O terceiro aparece com palavras interrogativas, como いつ, 何, どこ e 誰. Juntas com でも, elas significam "qualquer": a qualquer hora, qualquer coisa, qualquer lugar, qualquer pessoa.

でも substitui は, が e を. Com outras partículas, ele fica depois delas, como em にでも e からでも.$$,
    $$No uso de sugestão, でも deixa o convite mais suave e educado, porque não impõe uma opção específica.

Não confunda com でも no começo da frase, que significa "mas".

Com palavras interrogativas, a combinação com も e negativo significa "nada / ninguém", enquanto a combinação com でも e afirmativo significa "qualquer".$$,
    $$Substantivo + でも + Verbo (sugestão leve)
Substantivo + でも (até mesmo)
Palavra interrogativa + でも (qualquer)
Substantivo + partícula + でも (にでも / からでも)$$,
    $$でも$$,
    $$でも$$,
    ARRAY['でも']::text[],
    ARRAY['でも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-11', $$お茶でも飲みませんか。$$, $$おちゃでものみませんか。$$, $$Que tal tomarmos um chá ou algo assim?$$),
    ('n4-grammar-11', $$この問題は子供でもわかります。$$, $$このもんだいはこどもでもわかります。$$, $$Até uma criança entende esta questão.$$),
    ('n4-grammar-11', $$いつでも遊びに来てください。$$, $$いつでもあそびにきてください。$$, $$Venha me visitar quando quiser.$$),
    ('n4-grammar-11', $$日曜日でも、父は働いています。$$, $$にちようびでも、ちちははたらいています。$$, $$Mesmo no domingo, meu pai trabalha.$$),
    ('n4-grammar-11', $$暇なら、映画でも見に行こうか。$$, $$ひまなら、えいがでもみにいこうか。$$, $$Se você estiver livre, vamos ver um filme ou algo assim?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$週末、映画____見に行きませんか。$$, $$No fim de semana, quer ir ver um filme ou algo assim?$$),
        (2, $$そんな簡単なこと、小学生____できますよ。$$, $$Uma coisa simples dessas, até um aluno do primário consegue.$$),
        (3, $$飲み物は何____いいです。$$, $$Qualquer bebida serve.$$),
        (4, $$雨の日____、彼は毎朝走ります。$$, $$Mesmo em dias de chuva, ele corre toda manhã.$$),
        (5, $$困ったときは、いつ____電話してね。$$, $$Quando estiver com problemas, me ligue a qualquer hora, tá?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-11', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でも$$),
        (2, $$でも$$),
        (3, $$でも$$),
        (4, $$でも$$),
        (5, $$でも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-12 — 〜ではないか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-12',
    'grammar',
    'N4',
    $$〜ではないか$$,
    $$dewa nai ka$$,
    $$Não é...? / Não seria...? / Será que não...$$,
    $$ではないか é usado para expressar uma suposição, uma opinião com cautela ou uma surpresa. Equivale a "não é...?", "não seria...?" ou "será que não é...?".

Embora tenha forma de pergunta negativa, o sentido é positivo: quem fala acha que aquilo provavelmente é verdade. Dizer "não seria difícil?" é uma forma suave de dizer "acho que é difícil".

É muito comum com と思う, formando ではないかと思う, que é uma forma educada e cautelosa de dar uma opinião. A versão ではないでしょうか soa ainda mais polida.

Também pode expressar surpresa ao perceber algo, ou repreensão, quando se aponta algo que o outro deveria saber.

ではないか é mais formal e mais usado na escrita. Na fala casual, o equivalente é じゃないか.$$,
    $$Com verbos e adjetivos い, o natural é usar のではないか, como em 高いのではないか. Sem の, a frase ganha um tom de reclamação ou repreensão.

ではないでしょうか é uma das formas favoritas dos japoneses para dar opinião em reuniões e textos, porque não soa impositiva.

A entonação muda o sentido: descendo, é uma suposição; com ênfase, pode ser surpresa ou crítica.$$,
    $$Substantivo + ではないか
Adjetivo な (sem な) + ではないか
Frase + のではないか (com verbos e adjetivos い)

Educado: ではないでしょうか / ではありませんか
Opinião: 〜ではないかと思う
Forma falada: じゃないか$$,
    $$ではないか$$,
    $$ではないか|ではないでしょうか|ではありませんか$$,
    ARRAY['では', 'ない', 'か']::text[],
    ARRAY['ではないか', 'ではないでしょうか', 'ではありませんか', 'のではないか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-12', $$あの人は田中さんではないか。$$, $$あのひとはたなかさんではないか。$$, $$Aquele ali não é o Tanaka?$$),
    ('n4-grammar-12', $$この計画は少し無理ではないでしょうか。$$, $$このけいかくはすこしむりではないでしょうか。$$, $$Este plano não seria um pouco impossível?$$),
    ('n4-grammar-12', $$彼の話は本当ではないかと思う。$$, $$かれのはなしはほんとうではないかとおもう。$$, $$Acho que a história dele pode ser verdade.$$),
    ('n4-grammar-12', $$明日は雨ではないかと心配です。$$, $$あしたはあめではないかとしんぱいです。$$, $$Estou preocupado que amanhã chova.$$),
    ('n4-grammar-12', $$それは君の責任ではありませんか。$$, $$それはきみのせきにんではありませんか。$$, $$Isso não é responsabilidade sua?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この仕事は彼には無理____と思います。$$, $$Acho que este trabalho talvez seja impossível para ele.$$),
        (2, $$あそこにいるのは山田さん____。$$, $$Quem está ali não é o Yamada?$$),
        (3, $$警察は、犯人はあの男____と考えている。$$, $$A polícia acha que o culpado pode ser aquele homem.$$),
        (4, $$今の説明は少し複雑____でしょうか。$$, $$A explicação de agora não seria um pouco complicada?$$),
        (5, $$それでは約束が違う____。$$, $$Assim não é o que tínhamos combinado!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-12', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ではないか$$),
        (2, $$ではないか$$),
        (2, $$ではありませんか$$),
        (3, $$ではないか$$),
        (4, $$ではない$$),
        (5, $$ではないか$$),
        (5, $$ではありませんか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-13 — 〜が必要
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-13',
    'grammar',
    'N4',
    $$〜が必要$$,
    $$ga hitsuyou$$,
    $$Precisar de / Ser necessário$$,
    $$が必要 é usado para dizer que algo é necessário. Equivale a "precisar de" ou "ser necessário".

必要 é um adjetivo な que significa "necessário". A coisa necessária é marcada com が. Para dizer para quem ou para quê ela é necessária, usa-se には.

É muito comum em instruções, regras e explicações, como documentos para um processo, habilidades para um trabalho ou materiais para uma receita.

Para dizer que é preciso fazer uma ação, a estrutura é diferente: usa-se 必要がある com um verbo.$$,
    $$O oposto é 不要 (desnecessário), mais formal, ou 要らない, na fala do dia a dia.

Antes de um substantivo, 必要 recebe な, como em 必要な物 (coisas necessárias).

A forma 〜には〜が必要 é muito usada para dar requisitos, como em processos de matrícula e emprego.$$,
    $$Substantivo + が + 必要です / 必要だ
[Pessoa / Finalidade] + には + Substantivo + が + 必要です
Verbo na forma de dicionário + には + Substantivo + が + 必要です
必要な + Substantivo

Negativo: が必要ではない / 必要ありません$$,
    $$必要$$,
    $$が必要|がひつよう$$,
    ARRAY['が', '必要']::text[],
    ARRAY['が必要', 'が必要です', 'が必要だ', 'がひつよう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-13', $$旅行にはパスポートが必要です。$$, $$りょこうにはパスポートがひつようです。$$, $$Para viajar, é preciso passaporte.$$),
    ('n4-grammar-13', $$この仕事には経験が必要だ。$$, $$このしごとにはけいけんがひつようだ。$$, $$Este trabalho exige experiência.$$),
    ('n4-grammar-13', $$子供には親の愛が必要です。$$, $$こどもにはおやのあいがひつようです。$$, $$As crianças precisam do amor dos pais.$$),
    ('n4-grammar-13', $$入学には健康診断書が必要です。$$, $$にゅうがくにはけんこうしんだんしょがひつようです。$$, $$Para a matrícula, é necessário um atestado médico.$$),
    ('n4-grammar-13', $$もう少し時間が必要かもしれません。$$, $$もうすこしじかんがひつようかもしれません。$$, $$Talvez seja preciso um pouco mais de tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$車を運転するには免許____です。$$, $$Para dirigir um carro, é preciso carteira de motorista.$$),
        (2, $$植物には水と光____です。$$, $$As plantas precisam de água e luz.$$),
        (3, $$この料理を作るには、卵____だ。$$, $$Para fazer esta comida, precisa de ovo.$$),
        (4, $$今の私には休み____。$$, $$O que eu preciso agora é de descanso.$$),
        (5, $$会員になるには、何____ですか。$$, $$O que é necessário para se tornar sócio?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-13', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$が必要$$),
        (1, $$がひつよう$$),
        (2, $$が必要$$),
        (2, $$がひつよう$$),
        (3, $$が必要$$),
        (3, $$がひつよう$$),
        (4, $$が必要です$$),
        (4, $$が必要だ$$),
        (5, $$が必要$$),
        (5, $$がひつよう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-14 — 〜がする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-14',
    'grammar',
    'N4',
    $$〜がする$$,
    $$ga suru$$,
    $$Sentir cheiro / Ouvir som / Sentir sabor / Ter a sensação de$$,
    $$がする é usado para falar de algo que percebemos pelos sentidos, como cheiros, sons, sabores e sensações. Equivale a "sentir", "ter cheiro de", "ouvir um som de" ou "ter a sensação de".

O ponto principal é que, nessa estrutura, a percepção vem até a pessoa, sem esforço. O cheiro, o som ou o sabor é marcado com が, e する indica que ele está presente.

As palavras mais comuns com がする são におい (cheiro), 音 (som), 声 (voz), 味 (sabor), 感じ (sensação) e 気 (pressentimento).

Com 気, a expressão 気がする significa "ter a impressão de" ou "sentir que", e é muito usada para expressar intuições.$$,
    $$Diferente de 聞く ou 見る, que são ações conscientes, がする descreve uma percepção espontânea. Por isso, quem percebe não costuma aparecer como sujeito.

Para cheiros desagradáveis, usa-se o kanji 臭い; para cheiros agradáveis, 匂い, embora em hiragana におい serve para os dois.

Não confunda com する no sentido de "fazer". Aqui ele não indica ação, e sim presença de uma percepção.$$,
    $$Substantivo de percepção + が + する
におい / 香り + がする (cheiro)
音 / 声 + がする (som / voz)
味 + がする (sabor)
感じ / 気 + がする (sensação / impressão)
Adjetivo / Substantivo + の + Substantivo de percepção + がする$$,
    $$がする$$,
    $$がする|がします|がした|がしました|がして$$,
    ARRAY['が', 'する']::text[],
    ARRAY['がする', 'がします', 'がした', 'がしました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-14', $$いいにおいがしますね。$$, $$いいにおいがしますね。$$, $$Que cheiro bom, né?$$),
    ('n4-grammar-14', $$隣の部屋から変な音がした。$$, $$となりのへやからへんなおとがした。$$, $$Veio um barulho estranho do quarto ao lado.$$),
    ('n4-grammar-14', $$このスープは不思議な味がする。$$, $$このスープはふしぎなあじがする。$$, $$Esta sopa tem um sabor curioso.$$),
    ('n4-grammar-14', $$今日は何かいいことがある気がします。$$, $$きょうはなにかいいことがあるきがします。$$, $$Tenho a sensação de que hoje vai acontecer algo bom.$$),
    ('n4-grammar-14', $$外で子供の声がしました。$$, $$そとでこどものこえがしました。$$, $$Ouvi uma voz de criança lá fora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$台所からカレーのにおい____。$$, $$Vem cheiro de curry da cozinha.$$),
        (2, $$玄関で誰かの足音____。$$, $$Ouvi passos de alguém na entrada.$$),
        (3, $$この薬は苦い味____。$$, $$Este remédio tem um gosto amargo.$$),
        (4, $$何だか寒気____。$$, $$Estou sentindo um certo calafrio.$$),
        (5, $$彼は来ないような気____。$$, $$Tenho a impressão de que ele não vem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-14', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がします$$),
        (1, $$がする$$),
        (2, $$がした$$),
        (2, $$がしました$$),
        (3, $$がする$$),
        (3, $$がします$$),
        (4, $$がする$$),
        (4, $$がします$$),
        (5, $$がする$$),
        (5, $$がします$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-15 — 〜がり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-15',
    'grammar',
    'N4',
    $$〜がり$$,
    $$gari$$,
    $$Pessoa sensível a / Que sente muito$$,
    $$がり é um sufixo que transforma certos adjetivos de sentimento ou sensação em um substantivo que descreve uma pessoa com essa tendência.

Por exemplo, alguém que sente frio com facilidade é 寒がり; alguém que tem medo fácil é 怖がり; alguém tímido é 恥ずかしがり. A ideia é "a pessoa que sempre demonstra esse sentimento".

Para formar, tira-se o い do adjetivo e acrescenta-se がり. O resultado funciona como um substantivo, ou como um adjetivo な na prática, sendo usado com です, だ, で e な.

Com alguns adjetivos, é comum acrescentar 屋 (や), formando expressões como 恥ずかしがり屋, que significa "pessoa tímida".$$,
    $$Nem todo adjetivo pode virar がり. Os mais comuns são 寒がり, 暑がり, 怖がり, 恥ずかしがり, 寂しがり e 痛がり.

Essa forma vem do verbo がる, que mostra sentimentos de outras pessoas. がり descreve a característica, e がる descreve a ação de demonstrar o sentimento.

O antônimo de 寒がり é 暑がり, e não "não sentir frio": cada um descreve uma sensibilidade diferente.$$,
    $$Adjetivo de sentimento ou sensação sem い + がり
Adjetivo sem い + がり + 屋 (pessoa assim)
Pessoa + は + 〜がり + です / だ
〜がり + で / な + …

Exemplos de formação: 寒い → 寒がり / 暑い → 暑がり / 怖い → 怖がり / 恥ずかしい → 恥ずかしがり$$,
    $$がり$$,
    $$がり$$,
    ARRAY['がり']::text[],
    ARRAY['がり', 'がり屋', 'がりや']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-15', $$妹は寒がりなので、いつもセーターを着ています。$$, $$いもうとはさむがりなので、いつもセーターをきています。$$, $$Minha irmã mais nova sente muito frio, então sempre usa suéter.$$),
    ('n4-grammar-15', $$弟は怖がりで、一人で寝られません。$$, $$おとうとはこわがりで、ひとりでねられません。$$, $$Meu irmão mais novo é medroso e não consegue dormir sozinho.$$),
    ('n4-grammar-15', $$彼女は恥ずかしがり屋です。$$, $$かのじょははずかしがりやです。$$, $$Ela é tímida.$$),
    ('n4-grammar-15', $$私は暑がりだから、夏が苦手です。$$, $$わたしはあつがりだから、なつがにがてです。$$, $$Eu sinto muito calor, então não me dou bem com o verão.$$),
    ('n4-grammar-15', $$うちの犬はさびしがりで、いつも私の後をついてくる。$$, $$うちのいぬはさびしがりで、いつもわたしのあとをついてくる。$$, $$Nosso cachorro odeia ficar sozinho e sempre me segue.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は寒____で、冬はあまり外に出ません。$$, $$Meu pai sente muito frio e quase não sai no inverno.$$),
        (2, $$息子は怖____なので、お化け屋敷に入れません。$$, $$Meu filho é medroso, então não consegue entrar na casa assombrada.$$),
        (3, $$あの子は恥ずかし____屋で、人前で話せない。$$, $$Aquela criança é tímida e não consegue falar em público.$$),
        (4, $$母は暑____だから、すぐエアコンをつける。$$, $$Minha mãe sente muito calor, então logo liga o ar-condicionado.$$),
        (5, $$一人暮らしの祖母はさびし____なので、よく電話します。$$, $$Minha avó, que mora sozinha, se sente solitária com facilidade, então ligo com frequência.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-15', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がり$$),
        (2, $$がり$$),
        (3, $$がり$$),
        (4, $$がり$$),
        (5, $$がり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-16 — 〜がる・〜がっている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-16',
    'grammar',
    'N4',
    $$〜がる・〜がっている$$,
    $$garu / gatte iru$$,
    $$Mostrar (sentimento) / Parecer sentir / Querer (outra pessoa)$$,
    $$がる é usado para descrever os sentimentos ou desejos de outra pessoa a partir do que ela demonstra. Equivale a "mostrar que sente", "parecer sentir".

Em japonês, sentimentos como querer, ter medo, achar ruim ou sentir saudade são considerados internos. Só a própria pessoa pode afirmar o que sente. Por isso, para falar do sentimento de outra pessoa, o japonês usa がる, que descreve o comportamento visível.

Para formar, tira-se o い do adjetivo e acrescenta-se がる. Com たい e ほしい, formam-se たがる e ほしがる, para dizer o que outra pessoa quer.

Quando se fala de um estado no momento, usa-se がっている. Quando se fala de uma tendência geral, usa-se がる.

Como がる vira um verbo de ação, o objeto passa a ser marcado com を.$$,
    $$Usar がる para falar de si mesmo é estranho, exceto ao se descrever de fora, como numa história.

Falar de superiores com がる pode soar desrespeitoso, porque descreve o comportamento deles como algo observado. Nesses casos, é melhor usar formas como そうだ ou citar o que eles disseram.

Na negativa, がらない indica que a pessoa não demonstra aquele sentimento, como uma criança que não tem medo de algo.$$,
    $$Adjetivo de sentimento sem い + がる
Adjetivo な + がる (嫌がる)
ほしい → ほしがる
Verbo sem ます + たい → たがる

Estado atual: がっている
Tendência geral: がる

Objeto: Substantivo + を + 〜がる$$,
    $$がる$$,
    $$がる|がって|がった|がります|がりました|がらない$$,
    ARRAY['がる']::text[],
    ARRAY['がる', 'がっている', 'がります', 'がった', 'たがる', 'ほしがる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-16', $$弟は新しいゲームを欲しがっています。$$, $$おとうとはあたらしいゲームをほしがっています。$$, $$Meu irmão mais novo está querendo um jogo novo.$$),
    ('n4-grammar-16', $$子供が注射を怖がっている。$$, $$こどもがちゅうしゃをこわがっている。$$, $$A criança está com medo da injeção.$$),
    ('n4-grammar-16', $$妹は一人で留守番をするのを嫌がった。$$, $$いもうとはひとりでるすばんをするのをいやがった。$$, $$Minha irmã mais nova não quis ficar sozinha em casa.$$),
    ('n4-grammar-16', $$犬が外に出たがっています。$$, $$いぬがそとにでたがっています。$$, $$O cachorro está querendo sair.$$),
    ('n4-grammar-16', $$彼は本当は寂しがっているのかもしれない。$$, $$かれはほんとうはさびしがっているのかもしれない。$$, $$Talvez ele, na verdade, esteja se sentindo sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$娘はかわいい服を欲し____います。$$, $$Minha filha está querendo roupas bonitinhas.$$),
        (2, $$子供たちは暗い所を怖____。$$, $$As crianças têm medo de lugares escuros.$$),
        (3, $$うちの猫は水を嫌____。$$, $$Nosso gato não gosta de água.$$),
        (4, $$弟はアメリカに行き____います。$$, $$Meu irmão mais novo está querendo ir para os Estados Unidos.$$),
        (5, $$友達が引っ越して、息子は寂し____いる。$$, $$Um amigo se mudou, e meu filho está se sentindo sozinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-16', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がって$$),
        (2, $$がります$$),
        (2, $$がる$$),
        (3, $$がります$$),
        (3, $$がる$$),
        (4, $$たがって$$),
        (5, $$がって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-17 — ございます
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-17',
    'grammar',
    'N4',
    $$ございます$$,
    $$gozaimasu$$,
    $$Há / Tem (muito formal)$$,
    $$ございます é a forma muito educada de あります. Ela significa "há" ou "tem", mas com um nível de respeito bem alto.

É usada principalmente por funcionários de lojas, hotéis, empresas e serviços, quando falam com clientes. Também aparece em discursos e em situações formais.

Ela pertence ao 丁寧語, a linguagem polida que deixa a frase elegante e gentil com quem ouve.

ございます também aparece em expressões fixas muito comuns, como ありがとうございます e おはようございます, além de 申し訳ございません, um pedido de desculpas bem formal.

No dia a dia, com amigos e colegas, o normal é usar あります.$$,
    $$Com です, a forma muito educada é でございます. Com あります, é ございます. Essa distinção ajuda a saber qual usar.

ございます só substitui ある para coisas. Para pessoas, a forma respeitosa de いる é いらっしゃる, e a humilde é おる.

Em lojas, frases como 〜もございます são usadas para oferecer outras opções ao cliente.$$,
    $$Substantivo + が + ございます (há / tem)
Substantivo + は + ございますか (pergunta)

Negativo: ございません
Passado: ございました

Expressões fixas: ありがとうございます / おはようございます / 申し訳ございません / おめでとうございます$$,
    $$ございます$$,
    $$ございます|ございません|ございました$$,
    ARRAY['ございます']::text[],
    ARRAY['ございます', 'ございません', 'ございました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-17', $$二階にレストランがございます。$$, $$にかいにレストランがございます。$$, $$Há um restaurante no segundo andar.$$),
    ('n4-grammar-17', $$何かご質問はございますか。$$, $$なにかごしつもんはございますか。$$, $$Há alguma pergunta?$$),
    ('n4-grammar-17', $$お待たせして、申し訳ございません。$$, $$おまたせして、もうしわけございません。$$, $$Pedimos desculpas pela espera.$$),
    ('n4-grammar-17', $$赤いセーターもございますよ。$$, $$あかいセーターもございますよ。$$, $$Também temos suéteres vermelhos.$$),
    ('n4-grammar-17', $$ご来店、ありがとうございます。$$, $$ごらいてん、ありがとうございます。$$, $$Obrigado por visitar nossa loja.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅の近くに駐車場が____。$$, $$Há um estacionamento perto da estação.$$),
        (2, $$何かご意見は____か。$$, $$Há alguma opinião?$$),
        (3, $$ご迷惑をおかけして、大変申し訳____。$$, $$Pedimos sinceras desculpas pelo transtorno.$$),
        (4, $$「Mサイズはありますか。」「はい、____。」$$, $$"Tem tamanho M?" "Sim, temos."$$),
        (5, $$恐れ入りますが、ただいま空いている席が____。$$, $$Lamentamos, mas no momento não há lugares disponíveis.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-17', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ございます$$),
        (2, $$ございます$$),
        (3, $$ございません$$),
        (4, $$ございます$$),
        (5, $$ございません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-18 — 〜始める
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-18',
    'grammar',
    'N4',
    $$〜始める$$,
    $$hajimeru$$,
    $$Começar a$$,
    $$始める, ligado a outro verbo, indica o começo de uma ação. Equivale a "começar a".

A estrutura junta o verbo na forma ます sem ます com 始める. O resultado funciona como um verbo do grupo 2 e se conjuga normalmente: 始めます, 始めた, 始めて.

Ele pode indicar tanto ações que a pessoa decide começar, como estudar ou trabalhar, quanto mudanças naturais, como começar a chover ou as flores começarem a abrir.

Comparado a 出す, 始める é neutro e serve para qualquer começo. 出す destaca que o começo foi repentino ou inesperado.$$,
    $$O oposto de 始める é 終わる (terminar de) ou やむ, no caso da chuva. Com verbos, também se usa 〜終わる, como em 読み終わる (terminar de ler).

Sozinho, 始める significa "começar algo" e é transitivo: 授業を始める (começar a aula). Já 始まる é intransitivo: 授業が始まる (a aula começa).

Com ações de um instante, como chegar ou acordar, 始める normalmente não é usado, porque não faz sentido "começar" uma ação que acontece de uma vez.$$,
    $$Verbo na forma ます sem ます + 始める

Educado: 始めます
Passado: 始めた / 始めました

Escrita: 始める / はじめる$$,
    $$始める$$,
    $$始める|始め|はじめ$$,
    ARRAY['始める']::text[],
    ARRAY['始める', '始めます', '始めた', '始めました', 'はじめる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-18', $$去年から日本語を勉強し始めました。$$, $$きょねんからにほんごをべんきょうしはじめました。$$, $$Comecei a estudar japonês no ano passado.$$),
    ('n4-grammar-18', $$雨が降り始めた。$$, $$あめがふりはじめた。$$, $$Começou a chover.$$),
    ('n4-grammar-18', $$子供が歩き始めました。$$, $$こどもがあるきはじめました。$$, $$A criança começou a andar.$$),
    ('n4-grammar-18', $$この本は昨日読み始めたばかりです。$$, $$このほんはきのうよみはじめたばかりです。$$, $$Acabei de começar a ler este livro ontem.$$),
    ('n4-grammar-18', $$桜が咲き始めると、春が来たと感じます。$$, $$さくらがさきはじめると、はるがきたとかんじます。$$, $$Quando as cerejeiras começam a florir, sinto que a primavera chegou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先月からピアノを習い____。$$, $$Comecei a aprender piano no mês passado.$$),
        (2, $$九月になって、木の葉が赤くなり____。$$, $$Chegou setembro, e as folhas das árvores começaram a ficar vermelhas.$$),
        (3, $$何時から仕事をし____か。$$, $$A que horas você vai começar a trabalhar?$$),
        (4, $$最近、毎朝ジョギングをし____。$$, $$Recentemente, comecei a correr toda manhã.$$),
        (5, $$冬になると、みんな風邪をひき____。$$, $$Quando chega o inverno, todo mundo começa a pegar resfriado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-18', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$始めました$$),
        (1, $$はじめました$$),
        (1, $$始めた$$),
        (1, $$はじめた$$),
        (2, $$始めた$$),
        (2, $$始めました$$),
        (2, $$はじめた$$),
        (2, $$はじめました$$),
        (3, $$始めます$$),
        (3, $$はじめます$$),
        (4, $$始めました$$),
        (4, $$はじめました$$),
        (4, $$始めた$$),
        (4, $$はじめた$$),
        (5, $$始める$$),
        (5, $$始めます$$),
        (5, $$はじめる$$),
        (5, $$はじめます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-19 — 〜はずだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-19',
    'grammar',
    'N4',
    $$〜はずだ$$,
    $$hazu da$$,
    $$Deve / Deveria / Era para$$,
    $$はずだ é usado para dizer que algo deve ser verdade, com base em informações, lógica ou conhecimento. Equivale a "deve", "deveria" ou "era para".

A diferença em relação a だろう e かもしれない é a confiança. はずだ mostra que quem fala tem um motivo concreto para acreditar naquilo: um horário marcado, um fato conhecido, uma lógica clara.

Ele é muito usado para expectativas baseadas em fatos, como "ele já deve ter chegado, porque saiu cedo".

No passado, はずだった indica algo que era esperado, mas não aconteceu. E com のに, はずなのに mostra surpresa ou frustração quando a realidade foi diferente do esperado.

はず funciona como um substantivo, então se liga como tal: verbos e adjetivos na forma simples, adjetivos な com な, substantivos com の.$$,
    $$はずだ não expressa obrigação moral. Para "você deveria fazer isso" no sentido de dever, o japonês usa べきだ ou ほうがいい.

A forma negativa はずがない significa "não tem como", e é bem forte. Já ないはずだ significa "não deve ser" e é mais neutra.

Quando você mesmo não lembra direito, はずだ também serve para dizer "tenho certeza de que fiz isso", como ao procurar algo que tinha guardado.$$,
    $$Verbo (forma simples) + はずだ / はずです
Adjetivo い + はずだ
Adjetivo な + な + はずだ
Substantivo + の + はずだ

Passado (era para, mas não foi): はずだった / はずでした
Contraste: はずなのに$$,
    $$はずだ$$,
    $$はずだ|はずです|はずだった|はずでした|はずなのに|はずの$$,
    ARRAY['はず', 'だ']::text[],
    ARRAY['はずだ', 'はずです', 'はずだった', 'はずでした', 'はずなのに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-19', $$田中さんはもう家に着いたはずです。$$, $$たなかさんはもういえについたはずです。$$, $$O Tanaka já deve ter chegado em casa.$$),
    ('n4-grammar-19', $$彼は日本に十年住んでいたから、日本語が上手なはずだ。$$, $$かれはにほんにじゅうねんすんでいたから、にほんごがじょうずなはずだ。$$, $$Ele morou dez anos no Japão, então deve falar japonês bem.$$),
    ('n4-grammar-19', $$会議は三時からのはずです。$$, $$かいぎはさんじからのはずです。$$, $$A reunião deve ser a partir das três.$$),
    ('n4-grammar-19', $$かぎはかばんに入れたはずなのに、ない。$$, $$かぎはかばんにいれたはずなのに、ない。$$, $$Eu tinha certeza de que coloquei a chave na bolsa, mas ela não está lá.$$),
    ('n4-grammar-19', $$今日は休みのはずだったが、急に仕事が入った。$$, $$きょうはやすみのはずだったが、きゅうにしごとがはいった。$$, $$Era para hoje ser folga, mas de repente surgiu trabalho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$手紙は昨日出したから、明日には届く____。$$, $$Mandei a carta ontem, então deve chegar amanhã.$$),
        (2, $$彼は毎日練習しているから、上手な____。$$, $$Ele treina todo dia, então deve ser bom.$$),
        (3, $$店は十時に開く____ですが、まだ閉まっています。$$, $$Era para a loja abrir às dez, mas ainda está fechada.$$),
        (4, $$この薬を飲めば、熱が下がる____。$$, $$Se tomar este remédio, a febre deve baixar.$$),
        (5, $$確かに机の上に置いた____なのに、見つからない。$$, $$Tenho certeza de que deixei em cima da mesa, mas não encontro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-19', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はずです$$),
        (1, $$はずだ$$),
        (2, $$はずです$$),
        (2, $$はずだ$$),
        (3, $$はず$$),
        (4, $$はずです$$),
        (4, $$はずだ$$),
        (5, $$はず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-20 — 〜はずがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-20',
    'grammar',
    'N4',
    $$〜はずがない$$,
    $$hazu ga nai$$,
    $$Não tem como / É impossível que / Não pode ser$$,
    $$はずがない é usado para dizer, com muita convicção, que algo é impossível ou não pode ser verdade. Equivale a "não tem como" ou "é impossível que".

Ela é a forma negativa forte de はずだ. Quem fala tem um motivo claro para acreditar que aquilo simplesmente não pode acontecer, como um fato conhecido ou uma lógica óbvia.

É comum em situações de descrença, quando alguém ouve algo que contraria tudo o que sabe, ou ao defender alguém de uma acusação.

A ligação é igual à de はずだ: verbos e adjetivos na forma simples, adjetivos な com な, substantivos com の.

A versão com は, はずはない, tem o mesmo sentido e às vezes soa um pouco mais suave.$$,
    $$Compare: ないはずだ significa "não deve" (expectativa), enquanto はずがない significa "é impossível" (convicção forte).

Em conversas, a expressão そんなはずはない é muito usada para reagir a algo inacreditável: "não pode ser!".

Por ser tão forte, はずがない pode soar teimoso se usado sem um bom motivo.$$,
    $$Verbo (forma simples) + はずがない
Adjetivo い + はずがない
Adjetivo な + な + はずがない
Substantivo + の + はずがない

Educado: はずがありません
Variação: はずはない / はずはありません$$,
    $$はずがない$$,
    $$はずがない|はずがありません|はずはない|はずはありません$$,
    ARRAY['はず', 'が', 'ない']::text[],
    ARRAY['はずがない', 'はずがありません', 'はずはない', 'はずはありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-20', $$彼がそんなことを言うはずがない。$$, $$かれがそんなことをいうはずがない。$$, $$Não tem como ele dizer uma coisa dessas.$$),
    ('n4-grammar-20', $$あんなに勉強したのだから、落ちるはずがありません。$$, $$あんなにべんきょうしたのだから、おちるはずがありません。$$, $$Com tanto estudo, é impossível ser reprovado.$$),
    ('n4-grammar-20', $$鍵をかけたから、ドアが開いているはずがない。$$, $$かぎをかけたから、ドアがあいているはずがない。$$, $$Eu tranquei, então não tem como a porta estar aberta.$$),
    ('n4-grammar-20', $$田中さんは今アメリカにいるので、ここにいるはずがない。$$, $$たなかさんはいまアメリカにいるので、ここにいるはずがない。$$, $$O Tanaka está nos Estados Unidos agora, então não tem como ele estar aqui.$$),
    ('n4-grammar-20', $$こんなに安いのに、おいしいはずはないと思っていた。$$, $$こんなにやすいのに、おいしいはずはないとおもっていた。$$, $$Achava que, sendo tão barato, não tinha como ser gostoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は正直な人だから、うそをつく____。$$, $$Ela é uma pessoa honesta, então não tem como mentir.$$),
        (2, $$まだ朝の六時だから、店が開いている____。$$, $$Ainda são seis da manhã, então não tem como a loja estar aberta.$$),
        (3, $$初めて作ったのに、そんなに上手にできる____。$$, $$É a primeira vez que faço, não tem como ficar tão bom.$$),
        (4, $$あの優しい先生が怒る____。$$, $$Não tem como aquele professor tão gentil ficar bravo.$$),
        (5, $$子供にこんな難しい問題がわかる____。$$, $$Não tem como uma criança entender uma questão tão difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-20', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はずがない$$),
        (1, $$はずがありません$$),
        (1, $$はずはない$$),
        (1, $$はずはありません$$),
        (2, $$はずがない$$),
        (2, $$はずがありません$$),
        (2, $$はずはない$$),
        (2, $$はずはありません$$),
        (3, $$はずがない$$),
        (3, $$はずがありません$$),
        (3, $$はずはない$$),
        (3, $$はずはありません$$),
        (4, $$はずがない$$),
        (4, $$はずがありません$$),
        (4, $$はずはない$$),
        (4, $$はずはありません$$),
        (5, $$はずがない$$),
        (5, $$はずがありません$$),
        (5, $$はずはない$$),
        (5, $$はずはありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-21 — 〜必要がある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-21',
    'grammar',
    'N4',
    $$〜必要がある$$,
    $$hitsuyou ga aru$$,
    $$É necessário / Precisar (fazer) / Ter que$$,
    $$必要がある é usado para dizer que é necessário fazer uma ação. Equivale a "é necessário", "é preciso" ou "precisar fazer".

A estrutura junta o verbo na forma de dicionário com 必要がある. A ideia literal é "existe a necessidade de fazer isso".

Comparado a なければならない, 必要がある soa mais objetivo e menos pessoal. Ele apresenta a necessidade como um fato, e não como uma obrigação imposta. Por isso, é comum em explicações, instruções e textos formais.

Na forma negativa, 必要はない significa "não há necessidade" e é uma maneira educada de dizer que algo não precisa ser feito. Nesse caso, が costuma virar は.$$,
    $$Para dizer que uma coisa é necessária, usa-se が必要. Para uma ação, usa-se 必要がある. A diferença é a palavra que vem antes: substantivo ou verbo.

A forma 必要はない é uma ótima opção para tranquilizar alguém, porque soa gentil e objetiva.

Em textos formais, também aparece a forma 必要があると考えられる, usada para fazer recomendações.$$,
    $$Verbo na forma de dicionário + 必要がある
Verbo na forma de dicionário + 必要があります (educado)

Negativo: Verbo + 必要はない / 必要はありません
Variação: 必要がない$$,
    $$必要がある$$,
    $$必要がある|必要があります|必要はない|必要はありません|必要がない|ひつようがある$$,
    ARRAY['必要', 'が', 'ある']::text[],
    ARRAY['必要がある', '必要があります', '必要はない', '必要はありません', '必要がない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-21', $$明日までにレポートを出す必要があります。$$, $$あしたまでにレポートをだすひつようがあります。$$, $$É necessário entregar o relatório até amanhã.$$),
    ('n4-grammar-21', $$海外に行く前に、ビザを申請する必要がある。$$, $$かいがいにいくまえに、ビザをしんせいするひつようがある。$$, $$Antes de ir ao exterior, é preciso pedir o visto.$$),
    ('n4-grammar-21', $$急ぐ必要はありませんよ。$$, $$いそぐひつようはありませんよ。$$, $$Não há necessidade de ter pressa.$$),
    ('n4-grammar-21', $$もう一度確認する必要があると思います。$$, $$もういちどかくにんするひつようがあるとおもいます。$$, $$Acho que é preciso confirmar mais uma vez.$$),
    ('n4-grammar-21', $$日本では、家に入るとき靴を脱ぐ必要があります。$$, $$にほんでは、いえにはいるときくつをぬぐひつようがあります。$$, $$No Japão, é preciso tirar os sapatos ao entrar em casa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$試験の前に、もっと勉強する____。$$, $$Antes da prova, é preciso estudar mais.$$),
        (2, $$このことは、すぐ社長に報告する____。$$, $$É necessário informar isso ao presidente imediatamente.$$),
        (3, $$そんなに心配する____。$$, $$Não há necessidade de se preocupar tanto.$$),
        (4, $$会議に出る前に、資料を読む____。$$, $$Antes de participar da reunião, é preciso ler os documentos.$$),
        (5, $$もう払ったので、お金を持ってくる____。$$, $$Já está pago, então não precisa trazer dinheiro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-21', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$必要があります$$),
        (1, $$必要がある$$),
        (2, $$必要があります$$),
        (2, $$必要がある$$),
        (3, $$必要はありません$$),
        (3, $$必要はない$$),
        (4, $$必要があります$$),
        (4, $$必要がある$$),
        (5, $$必要はありません$$),
        (5, $$必要はない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-22 — 意向形（〜う・〜よう）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-22',
    'grammar',
    'N4',
    $$意向形（〜う・〜よう）$$,
    $$ikoukei$$,
    $$Vamos... / Vou... / Forma volitiva$$,
    $$意向形 é a forma volitiva dos verbos. Ela expressa a vontade de fazer algo e tem dois usos principais.

O primeiro é convidar ou propor algo, de forma informal. É a versão casual de ましょう: "vamos comer", "vamos voltar".

O segundo é expressar a própria decisão ou intenção, muitas vezes falando consigo mesmo: "vou estudar a partir de hoje".

A formação depende do grupo do verbo. No grupo 1, o último som muda de "u" para "o" e recebe う. No grupo 2, tira-se る e acrescenta-se よう. Os irregulares ficam しよう e 来よう (こよう).

Com か no final, a forma volitiva vira uma sugestão em forma de pergunta, como "vamos descansar um pouco?". E ela é a base de outras gramáticas, como ようと思う e ようとする.$$,
    $$Com superiores, a forma volitiva sozinha soa informal demais. Nesses casos, use ましょう ou ましょうか.

Entre amigos, é comum acrescentar よ (行こうよ) para soar mais animado, ou か (行こうか) para soar mais suave.

Verbos como 帰る e 入る são do grupo 1, então ficam 帰ろう e 入ろう.$$,
    $$Grupo 1: último som "u" → "o" + う (行く → 行こう / 飲む → 飲もう / 買う → 買おう)
Grupo 2: tire る + よう (食べる → 食べよう / 見る → 見よう)
Irregulares: する → しよう / 来る → 来よう (こよう)

Convite educado: ましょう
Sugestão: 〜う / 〜よう + か
Intenção: 〜う / 〜よう + と思う$$,
    $$う / よう$$,
    $$おう|こう|ごう|そう|とう|のう|ぼう|もう|ろう|よう$$,
    ARRAY['う', 'よう']::text[],
    ARRAY['う', 'よう', 'おう', 'こう', 'しよう', '来よう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-22', $$もう遅いから、一緒に帰ろう。$$, $$もうおそいから、いっしょにかえろう。$$, $$Já está tarde, vamos voltar juntos.$$),
    ('n4-grammar-22', $$明日は早いから、もう寝よう。$$, $$あしたははやいから、もうねよう。$$, $$Amanhã acordo cedo, vou dormir.$$),
    ('n4-grammar-22', $$今度の休みに、海へ行こうよ。$$, $$こんどのやすみに、うみへいこうよ。$$, $$Na próxima folga, vamos à praia!$$),
    ('n4-grammar-22', $$疲れたね。ちょっと休もうか。$$, $$つかれたね。ちょっとやすもうか。$$, $$Cansamos, né. Vamos descansar um pouco?$$),
    ('n4-grammar-22', $$今日から毎日運動しよう。$$, $$きょうからまいにちうんどうしよう。$$, $$A partir de hoje, vou fazer exercício todo dia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お腹がすいたね。何か食べ____。$$, $$Estou com fome. Vamos comer alguma coisa.$$),
        (2, $$雨がやんだから、外で遊____。$$, $$A chuva parou, vamos brincar lá fora.$$),
        (3, $$時間がないから、急____。$$, $$Não temos tempo, vamos nos apressar.$$),
        (4, $$じゃ、明日駅で会____。$$, $$Então, vamos nos encontrar na estação amanhã.$$),
        (5, $$よし、今日こそ部屋を掃除し____。$$, $$Muito bem, hoje sem falta vou limpar o quarto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-22', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$よう$$),
        (2, $$ぼう$$),
        (3, $$ごう$$),
        (4, $$おう$$),
        (5, $$よう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-23 — いらっしゃる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-23',
    'grammar',
    'N4',
    $$いらっしゃる$$,
    $$irassharu$$,
    $$Estar / Ir / Vir (respeitoso)$$,
    $$いらっしゃる é o verbo respeitoso (尊敬語) usado no lugar de いる (estar), 行く (ir) e 来る (vir), quando o sujeito é alguém que merece respeito, como um cliente, um professor ou um chefe.

No 尊敬語, quem fala eleva a pessoa de quem se fala. Por isso, いらっしゃる nunca é usado para si mesmo.

O sentido exato, estar, ir ou vir, é entendido pelo contexto e pelas partículas da frase.

Na forma ます, ele é irregular: em vez de いらっしゃります, diz-se いらっしゃいます. A saudação いらっしゃいませ, usada em lojas para receber clientes, vem desse verbo.$$,
    $$Para falar de si mesmo ou da própria empresa em situações formais, usa-se a forma humilde: おる no lugar de いる, e 参る no lugar de 行く e 来る.

Também é muito comum a forma いらっしゃってください, para convidar alguém respeitosamente a vir.

Outras formas respeitosas com o mesmo sentido existem, como お越しになる, mais formal, e お見えになる, para "vir".$$,
    $$Pessoa respeitada + が / は + Lugar + に + いらっしゃる (estar)
Pessoa respeitada + が / は + Lugar + へ / に + いらっしゃる (ir / vir)

Educado: いらっしゃいます (forma irregular)
Passado: いらっしゃった / いらっしゃいました
Saudação: いらっしゃいませ$$,
    $$いらっしゃる$$,
    $$いらっしゃ$$,
    ARRAY['いらっしゃる']::text[],
    ARRAY['いらっしゃる', 'いらっしゃいます', 'いらっしゃった', 'いらっしゃいました', 'いらっしゃいませ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-23', $$社長は今、会議室にいらっしゃいます。$$, $$しゃちょうはいま、かいぎしつにいらっしゃいます。$$, $$O presidente está na sala de reuniões agora.$$),
    ('n4-grammar-23', $$先生は明日、京都へいらっしゃるそうです。$$, $$せんせいはあした、きょうとへいらっしゃるそうです。$$, $$Dizem que o professor vai a Kyoto amanhã.$$),
    ('n4-grammar-23', $$いらっしゃいませ。何名様ですか。$$, $$いらっしゃいませ。なんめいさまですか。$$, $$Bem-vindo. Quantas pessoas?$$),
    ('n4-grammar-23', $$田中様がいらっしゃいました。$$, $$たなかさまがいらっしゃいました。$$, $$O senhor Tanaka chegou.$$),
    ('n4-grammar-23', $$週末はどこかへいらっしゃいますか。$$, $$しゅうまつはどこかへいらっしゃいますか。$$, $$O senhor vai a algum lugar no fim de semana?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$部長は今、どちらに____か。$$, $$Onde o gerente está agora?$$),
        (2, $$先ほど、先生がこちらに____。$$, $$Há pouco, o professor veio aqui.$$),
        (3, $$社長は毎朝八時に会社に____。$$, $$O presidente chega à empresa às oito toda manhã.$$),
        (4, $$お客様が____ので、お茶を出してください。$$, $$Chegou um cliente, então sirva o chá, por favor.$$),
        (5, $$「____ませ。」と店員が言った。$$, $$"Bem-vindo!", disse o atendente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-23', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いらっしゃいます$$),
        (2, $$いらっしゃいました$$),
        (3, $$いらっしゃいます$$),
        (4, $$いらっしゃった$$),
        (4, $$いらっしゃいました$$),
        (5, $$いらっしゃい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-24 — いたします
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-24',
    'grammar',
    'N4',
    $$いたします$$,
    $$itashimasu$$,
    $$Fazer (humilde) / Farei$$,
    $$いたします é a forma humilde (謙譲語) de します. Ela significa "fazer", mas quem fala se coloca em posição modesta para mostrar respeito ao ouvinte.

No 謙譲語, a ideia é rebaixar as próprias ações. Por isso, いたします é usado só para ações de quem fala ou do seu grupo, como a própria empresa. Nunca é usado para ações de clientes ou superiores.

É muito comum em situações de trabalho, atendimento ao cliente e anúncios. Também aparece em expressões fixas, como お願いいたします e 失礼いたします.

Com verbos do tipo "substantivo + する", basta trocar する por いたします. A combinação com お / ご, como em ご案内いたします, deixa a frase ainda mais humilde.$$,
    $$よろしくお願いいたします é uma das frases mais usadas em e-mails de trabalho no Japão. É mais formal que よろしくお願いします.

Para ações de outras pessoas que merecem respeito, a forma correta é a respeitosa なさる, e não いたします.

Na escrita, いたします costuma ser escrito em hiragana quando é auxiliar, e com o kanji 致します em alguns contextos.$$,
    $$Substantivo de ação + いたします
お / ご + Substantivo de ação + いたします

Passado: いたしました
Informal humilde: いたす

Expressões fixas: よろしくお願いいたします / 失礼いたします / 承知いたしました$$,
    $$いたす$$,
    $$いたし|致し$$,
    ARRAY['いたします']::text[],
    ARRAY['いたします', 'いたしました', 'いたす', '致します']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-24', $$会場まで私がご案内いたします。$$, $$かいじょうまでわたしがごあんないいたします。$$, $$Eu vou guiá-lo até o local.$$),
    ('n4-grammar-24', $$今後ともよろしくお願いいたします。$$, $$こんごともよろしくおねがいいたします。$$, $$Conto com o seu apoio daqui em diante.$$),
    ('n4-grammar-24', $$明日、こちらからお電話いたします。$$, $$あした、こちらからおでんわいたします。$$, $$Amanhã, nós ligamos para o senhor.$$),
    ('n4-grammar-24', $$会議は十時から開始いたします。$$, $$かいぎはじゅうじからかいしいたします。$$, $$A reunião começará às dez.$$),
    ('n4-grammar-24', $$先ほどは大変失礼いたしました。$$, $$さきほどはたいへんしつれいいたしました。$$, $$Peço desculpas pelo que aconteceu há pouco.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$後ほどご連絡____。$$, $$Entraremos em contato mais tarde.$$),
        (2, $$お荷物は私がお持ち____。$$, $$Eu carrego a sua bagagem.$$),
        (3, $$どうぞよろしくお願い____。$$, $$Muito prazer, conto com o senhor.$$),
        (4, $$昨日は大変失礼____。$$, $$Peço desculpas por ontem.$$),
        (5, $$それでは、会議を始めることに____。$$, $$Então, daremos início à reunião.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-24', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いたします$$),
        (2, $$いたします$$),
        (3, $$いたします$$),
        (4, $$いたしました$$),
        (5, $$いたします$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-25 — 〜じゃないか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-25',
    'grammar',
    'N4',
    $$〜じゃないか$$,
    $$ja nai ka$$,
    $$Não é que...! / Ora / Eu não disse?$$,
    $$じゃないか é uma expressão casual usada no final da frase para mostrar surpresa, chamar atenção para algo óbvio ou repreender alguém. Equivale a "ora!", "não é que...!" ou "eu não disse?".

Apesar de ter forma negativa, o sentido é afirmativo. Quem fala está, na verdade, afirmando algo com ênfase.

Os usos mais comuns são:
• Surpresa ao perceber algo: "ora, se não é o Tanaka!".
• Elogio inesperado: "nossa, é gostoso!".
• Lembrar ou repreender: "eu não te disse?", "você está atrasado!".

Ele é informal e soa um pouco masculino ou direto. A versão じゃないですか é mais educada e muito usada na conversa para buscar concordância.$$,
    $$Na fala dos jovens, じゃん é a forma mais curta e casual, muito usada no dia a dia.

じゃないですか às vezes é usado demais, para apresentar algo como se fosse óbvio para o outro. Em excesso, pode soar presunçoso.

A entonação é importante: descendo, é uma afirmação enfática; subindo, vira uma pergunta de confirmação.$$,
    $$Substantivo / Adjetivo な + じゃないか
Adjetivo い + じゃないか
Verbo (forma simples) + じゃないか

Educado: じゃないですか
Forma escrita / formal: ではないか
Forma muito casual: じゃん$$,
    $$じゃないか$$,
    $$じゃないか|じゃないですか|じゃん$$,
    ARRAY['じゃ', 'ない', 'か']::text[],
    ARRAY['じゃないか', 'じゃないですか', 'じゃん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-25', $$あれ、田中じゃないか。$$, $$あれ、たなかじゃないか。$$, $$Ué, não é o Tanaka?$$),
    ('n4-grammar-25', $$このケーキ、おいしいじゃないか。$$, $$このケーキ、おいしいじゃないか。$$, $$Ora, este bolo é gostoso!$$),
    ('n4-grammar-25', $$だから言ったじゃないか。$$, $$だからいったじゃないか。$$, $$Eu não te disse?$$),
    ('n4-grammar-25', $$遅かったじゃないか。どうしたの？$$, $$おそかったじゃないか。どうしたの？$$, $$Você demorou, hein! O que aconteceu?$$),
    ('n4-grammar-25', $$いい天気じゃないですか。散歩しましょう。$$, $$いいてんきじゃないですか。さんぽしましょう。$$, $$Que dia bonito, não é? Vamos dar uma caminhada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$何だ、山田____。久しぶり。$$, $$Ora, se não é o Yamada! Quanto tempo.$$),
        (2, $$約束の時間はもう過ぎている____。$$, $$Já passou da hora combinada, ora!$$),
        (3, $$君の絵、上手____。$$, $$Seu desenho é bom, hein!$$),
        (4, $$危ない____。気をつけて。$$, $$Que perigo! Tome cuidado.$$),
        (5, $$前にも話した____。忘れたの？$$, $$Eu já te falei antes, não falei? Esqueceu?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-25', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$じゃないか$$),
        (2, $$じゃないか$$),
        (3, $$じゃないか$$),
        (4, $$じゃないか$$),
        (5, $$じゃないか$$),
        (5, $$じゃないですか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-26 — 〜かどうか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-26',
    'grammar',
    'N4',
    $$〜かどうか$$,
    $$ka dou ka$$,
    $$Se... ou não$$,
    $$かどうか é usado para incluir uma pergunta de "sim ou não" dentro de uma frase maior. Equivale a "se... ou não".

Ele aparece quando a pessoa não sabe, quer saber, vai verificar ou vai perguntar se algo é verdade. Por isso, combina muito com verbos como わかる, 知る, 聞く, 確認する e 調べる.

A frase antes de かどうか fica na forma simples. Com substantivos e adjetivos な, o だ desaparece.

Para perguntas com palavras interrogativas, como "onde", "quem" ou "quando", usa-se só か, sem どうか.$$,
    $$かどうか é a forma resumida de "か、〜ないか". Por isso, a estrutura A か A ないか tem o mesmo sentido.

Não use かどうか com palavras interrogativas: para "não sei onde ele está", usa-se どこにいるか.

Em pedidos formais, かどうか aparece em frases como "gostaria de saber se...", seguido de 教えていただけますか.$$,
    $$Verbo (forma simples) + かどうか
Adjetivo い + かどうか
Adjetivo な (sem だ) + かどうか
Substantivo (sem だ) + かどうか

… かどうか + わからない / 知らない / 聞く / 確認する$$,
    $$かどうか$$,
    $$かどうか$$,
    ARRAY['か', 'どう', 'か']::text[],
    ARRAY['かどうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-26', $$明日雨が降るかどうか、わかりません。$$, $$あしたあめがふるかどうか、わかりません。$$, $$Não sei se amanhã vai chover ou não.$$),
    ('n4-grammar-26', $$彼が来るかどうか、聞いてみます。$$, $$かれがくるかどうか、きいてみます。$$, $$Vou perguntar se ele vem ou não.$$),
    ('n4-grammar-26', $$この答えが正しいかどうか、確認してください。$$, $$このこたえがただしいかどうか、かくにんしてください。$$, $$Verifique se esta resposta está correta, por favor.$$),
    ('n4-grammar-26', $$その店がおいしいかどうか、行ってみないとわからない。$$, $$そのみせがおいしいかどうか、いってみないとわからない。$$, $$Só indo lá para saber se a comida é boa ou não.$$),
    ('n4-grammar-26', $$その話が本当かどうか、まだ誰も知らない。$$, $$そのはなしがほんとうかどうか、まだだれもしらない。$$, $$Ninguém sabe ainda se essa história é verdade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$パーティーに行ける____、まだわかりません。$$, $$Ainda não sei se vou poder ir à festa.$$),
        (2, $$このサイズが合う____、着てみてください。$$, $$Experimente para ver se este tamanho serve.$$),
        (3, $$一人暮らしの彼女が元気____、心配です。$$, $$Estou preocupado se ela, que mora sozinha, está bem.$$),
        (4, $$試験に合格した____、来週わかります。$$, $$Semana que vem vou saber se passei na prova.$$),
        (5, $$ドアの鍵を閉めた____、覚えていない。$$, $$Não lembro se tranquei a porta ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-26', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かどうか$$),
        (2, $$かどうか$$),
        (3, $$かどうか$$),
        (4, $$かどうか$$),
        (5, $$かどうか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-27 — 〜かしら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-27',
    'grammar',
    'N4',
    $$〜かしら$$,
    $$kashira$$,
    $$Será que...? / Fico me perguntando$$,
    $$かしら é uma partícula de final de frase que expressa dúvida ou curiosidade, como "será que...?". Muitas vezes, a pessoa fala consigo mesma ou pensa em voz alta.

Ela tem o mesmo sentido de かな, mas é tradicionalmente associada à fala feminina. Por isso, aparece muito em falas de mulheres em filmes, novelas, livros e animes, principalmente de personagens mais maduras ou elegantes.

Também pode ser usada para fazer pedidos de forma delicada e indireta, principalmente com ないかしら, como "será que você não poderia...?".

A frase antes de かしら fica na forma simples. Com substantivos e adjetivos な, o だ costuma ser omitido.$$,
    $$Hoje em dia, かしら é menos comum na fala das mulheres jovens, que preferem かな. Mesmo assim, é muito frequente em ficção.

Homens raramente usam かしら, exceto em contextos específicos ou para efeito de personagem.

O tom de かしら é suave e reflexivo, nunca agressivo.$$,
    $$Verbo / Adjetivo い (forma simples) + かしら
Substantivo / Adjetivo な + かしら
Frase + のかしら
Verbo ない / てもらえない + かしら (pedido delicado)$$,
    $$かしら$$,
    $$かしら$$,
    ARRAY['かしら']::text[],
    ARRAY['かしら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-27', $$明日は晴れるかしら。$$, $$あしたははれるかしら。$$, $$Será que amanhã vai fazer sol?$$),
    ('n4-grammar-27', $$田中さん、もう帰ったのかしら。$$, $$たなかさん、もうかえったのかしら。$$, $$Será que o Tanaka já foi embora?$$),
    ('n4-grammar-27', $$この服、私に似合うかしら。$$, $$このふく、わたしににあうかしら。$$, $$Será que esta roupa fica bem em mim?$$),
    ('n4-grammar-27', $$誰が来たのかしら。$$, $$だれがきたのかしら。$$, $$Quem será que veio?$$),
    ('n4-grammar-27', $$ちょっと手伝ってもらえないかしら。$$, $$ちょっとてつだってもらえないかしら。$$, $$Será que você poderia me ajudar um pouco?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨、早くやむ____。$$, $$Será que a chuva vai parar logo?$$),
        (2, $$あの人は誰____。$$, $$Quem será aquela pessoa?$$),
        (3, $$彼、私のこと覚えている____。$$, $$Será que ele se lembra de mim?$$),
        (4, $$ちょっと窓を開けてもいい____。$$, $$Será que posso abrir um pouco a janela?$$),
        (5, $$鍵、どこに置いたの____。$$, $$Onde será que deixei a chave?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-27', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かしら$$),
        (2, $$かしら$$),
        (3, $$かしら$$),
        (4, $$かしら$$),
        (5, $$かしら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-28 — 〜かい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-28',
    'grammar',
    'N4',
    $$〜かい$$,
    $$kai$$,
    $$Partícula de pergunta (casual)$$,
    $$かい é uma partícula de pergunta usada no final da frase, na fala casual. Ela transforma a frase em uma pergunta de "sim ou não", com um tom amigável.

É associada principalmente à fala masculina e de pessoas mais velhas, como pais, avôs e professores falando com crianças ou jovens. Soa gentil e um pouco paternal.

Ela vem depois da forma simples de verbos e adjetivos, e diretamente depois de substantivos e adjetivos な, sem だ.

Com perguntas que pedem explicação, aparece como のかい.$$,
    $$かい é usado apenas em perguntas de "sim ou não". Em perguntas com palavras interrogativas, como "o que" ou "onde", usa-se だい, como em 何だい.

Na fala de jovens, かい é pouco usado; eles preferem a entonação subindo ou の.

Por ser casual, かい nunca é usado com superiores ou em situações formais.$$,
    $$Verbo / Adjetivo い (forma simples) + かい
Substantivo / Adjetivo な + かい
Frase + のかい$$,
    $$かい$$,
    $$かい$$,
    ARRAY['かい']::text[],
    ARRAY['かい', 'のかい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-28', $$やあ、元気かい？$$, $$やあ、げんきかい？$$, $$E aí, tudo bem?$$),
    ('n4-grammar-28', $$もうご飯を食べたかい？$$, $$もうごはんをたべたかい？$$, $$Já comeu?$$),
    ('n4-grammar-28', $$明日、一緒に行くかい？$$, $$あした、いっしょにいくかい？$$, $$Quer ir junto amanhã?$$),
    ('n4-grammar-28', $$本当にそれでいいのかい？$$, $$ほんとうにそれでいいのかい？$$, $$Tem certeza de que está bom assim?$$),
    ('n4-grammar-28', $$君はここの学生かい？$$, $$きみはここのがくせいかい？$$, $$Você é aluno daqui?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$宿題はもう終わった____？$$, $$Já terminou a lição?$$),
        (2, $$この本、読む____？$$, $$Quer ler este livro?$$),
        (3, $$顔色が悪いね。疲れたの____？$$, $$Você está pálido. Está cansado?$$),
        (4, $$その服で寒くない____？$$, $$Não está com frio com essa roupa?$$),
        (5, $$みんな行くけど、君も行く____？$$, $$Todo mundo vai. Você também vai?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-28', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かい$$),
        (2, $$かい$$),
        (3, $$かい$$),
        (4, $$かい$$),
        (5, $$かい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-29 — 〜かもしれない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-29',
    'grammar',
    'N4',
    $$〜かもしれない$$,
    $$kamo shirenai$$,
    $$Talvez / Pode ser que$$,
    $$かもしれない é usado para dizer que algo é possível, mas sem certeza. Equivale a "talvez" ou "pode ser que".

O grau de certeza é baixo: mais ou menos 50% ou menos. Isso é diferente de だろう e でしょう, que indicam uma suposição mais forte, e de はずだ, que indica uma expectativa baseada em fatos.

Ele vem depois da forma simples de verbos e adjetivos. Com substantivos e adjetivos な, o だ desaparece.

Na forma educada, usa-se かもしれません. Na fala informal, é muito comum encurtar para かも.$$,
    $$Para reforçar a dúvida, é comum usar もしかしたら ou もしかすると no começo da frase.

かも sozinho, no final da frase, é muito usado por jovens e soa bem leve.

Com superiores, かもしれません é uma forma educada de não afirmar algo com certeza, o que é bem valorizado na comunicação japonesa.$$,
    $$Verbo (forma simples) + かもしれない
Adjetivo い + かもしれない
Adjetivo な (sem だ) + かもしれない
Substantivo (sem だ) + かもしれない

Educado: かもしれません
Fala informal: かも$$,
    $$かもしれない$$,
    $$かもしれない|かもしれません|かもしれなかった|かも$$,
    ARRAY['かも', 'しれない']::text[],
    ARRAY['かもしれない', 'かもしれません', 'かも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-29', $$午後から雨が降るかもしれません。$$, $$ごごからあめがふるかもしれません。$$, $$Talvez chova a partir da tarde.$$),
    ('n4-grammar-29', $$彼はもう帰ったかもしれない。$$, $$かれはもうかえったかもしれない。$$, $$Pode ser que ele já tenha ido embora.$$),
    ('n4-grammar-29', $$この問題は少し難しいかもしれません。$$, $$このもんだいはすこしむずかしいかもしれません。$$, $$Esta questão talvez seja um pouco difícil.$$),
    ('n4-grammar-29', $$あの人は先生かもしれない。$$, $$あのひとはせんせいかもしれない。$$, $$Aquela pessoa talvez seja professora.$$),
    ('n4-grammar-29', $$明日は忙しいから、行けないかも。$$, $$あしたはいそがしいから、いけないかも。$$, $$Amanhã estou ocupado, então talvez não consiga ir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道が混んでいるから、少し遅れる____。$$, $$O trânsito está ruim, então talvez eu me atrase um pouco.$$),
        (2, $$彼女は今日、来ない____。$$, $$Talvez ela não venha hoje.$$),
        (3, $$その話は本当____。$$, $$Essa história pode ser verdade.$$),
        (4, $$この服は私には少し大きい____。$$, $$Esta roupa talvez seja um pouco grande para mim.$$),
        (5, $$財布はかばんの中にある____と思って、探しました。$$, $$Achei que a carteira talvez estivesse na bolsa e procurei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-29', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かもしれません$$),
        (1, $$かもしれない$$),
        (1, $$かも$$),
        (2, $$かもしれません$$),
        (2, $$かもしれない$$),
        (2, $$かも$$),
        (3, $$かもしれません$$),
        (3, $$かもしれない$$),
        (3, $$かも$$),
        (4, $$かもしれません$$),
        (4, $$かもしれない$$),
        (4, $$かも$$),
        (5, $$かもしれない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-30 — 〜かな
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-30',
    'grammar',
    'N4',
    $$〜かな$$,
    $$kana$$,
    $$Será que...? / Fico pensando se...$$,
    $$かな é uma partícula de final de frase que expressa dúvida, curiosidade ou reflexão. Equivale a "será que...?" ou "fico pensando se...".

Muitas vezes, a pessoa fala consigo mesma, pensando em voz alta. Mas かな também pode ser usado numa conversa, para fazer uma pergunta de forma leve, sem pressionar o outro.

Com a forma volitiva, como 食べようかな, expressa uma decisão que ainda está sendo pensada: "acho que vou comer...".

Com ないかな, pode expressar um desejo ("tomara que...") ou um pedido indireto ("será que você não poderia...?").

かな é informal e usado por homens e mulheres. A versão かなあ é mais reflexiva.$$,
    $$かな tem o mesmo sentido de かしら, mas かな é neutro quanto ao gênero e muito mais comum hoje.

Em situações formais, o equivalente é でしょうか.

Usar かな numa pergunta direta a alguém deixa a frase mais suave e menos insistente.$$,
    $$Verbo / Adjetivo い (forma simples) + かな
Substantivo / Adjetivo な + かな
Forma volitiva + かな (acho que vou...)
Verbo ない / てくれない + かな (desejo / pedido indireto)

Variação: かなあ$$,
    $$かな$$,
    $$かな|かなあ$$,
    ARRAY['かな']::text[],
    ARRAY['かな', 'かなあ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-30', $$明日は晴れるかな。$$, $$あしたははれるかな。$$, $$Será que amanhã vai fazer sol?$$),
    ('n4-grammar-30', $$田中さんは来るかな。$$, $$たなかさんはくるかな。$$, $$Será que o Tanaka vem?$$),
    ('n4-grammar-30', $$このケーキ、おいしいかな。$$, $$このケーキ、おいしいかな。$$, $$Será que este bolo está gostoso?$$),
    ('n4-grammar-30', $$今日の昼ご飯は何を食べようかな。$$, $$きょうのひるごはんはなにをたべようかな。$$, $$O que será que eu como no almoço hoje?$$),
    ('n4-grammar-30', $$ちょっと手伝ってくれないかな。$$, $$ちょっとてつだってくれないかな。$$, $$Será que você poderia me ajudar um pouco?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$誕生日に何をもらえる____。$$, $$O que será que vou ganhar de aniversário?$$),
        (2, $$この答えで合っている____。$$, $$Será que esta resposta está certa?$$),
        (3, $$次の電車は何時に来る____。$$, $$A que horas será que vem o próximo trem?$$),
        (4, $$週末、どこへ行こう____。$$, $$Aonde será que eu vou no fim de semana?$$),
        (5, $$暑いね。窓を開けてくれない____。$$, $$Está quente. Será que você poderia abrir a janela?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-30', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かな$$),
        (1, $$かなあ$$),
        (2, $$かな$$),
        (2, $$かなあ$$),
        (3, $$かな$$),
        (3, $$かなあ$$),
        (4, $$かな$$),
        (4, $$かなあ$$),
        (5, $$かな$$),
        (5, $$かなあ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-31 — 〜から作る
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-31',
    'grammar',
    'N4',
    $$〜から作る$$,
    $$kara tsukuru$$,
    $$Ser feito de / Fazer a partir de$$,
    $$から作る é usado para dizer de qual matéria-prima algo é feito, quando essa matéria-prima se transforma e não pode mais ser vista no produto final. Equivale a "ser feito de" ou "fazer a partir de".

Por exemplo, o vinho é feito de uvas, mas, ao olhar para o vinho, não se vê mais a uva. O tofu é feito de soja, mas a soja não aparece mais. Nesses casos, usa-se から.

Quando o material continua visível e reconhecível, como a madeira de uma mesa ou o papel de um avião de dobradura, usa-se で no lugar de から.

Essa estrutura aparece muito na forma passiva, 〜から作られる, para explicar como produtos e alimentos são feitos.$$,
    $$A diferença entre から e で é um ponto clássico de provas: から para transformação química ou completa, で para material que continua reconhecível.

Para bebidas alcoólicas e grandes construções, às vezes se usa o kanji 造る no lugar de 作る.

Em textos sobre alimentos, também aparece 原料 (matéria-prima), como em 原料は大豆です.$$,
    $$Produto + は + Matéria-prima + から + 作る / 作ります
Produto + は + Matéria-prima + から + 作られる / 作られています (passiva)

Material visível: Produto + は + Material + で + 作る$$,
    $$から作る$$,
    $$から作|からつく$$,
    ARRAY['から', '作る']::text[],
    ARRAY['から作る', 'から作ります', 'から作られる', 'から作られています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-31', $$ワインはぶどうから作ります。$$, $$ワインはぶどうからつくります。$$, $$O vinho é feito de uvas.$$),
    ('n4-grammar-31', $$豆腐は大豆から作られています。$$, $$とうふはだいずからつくられています。$$, $$O tofu é feito de soja.$$),
    ('n4-grammar-31', $$このお酒は米から作られた。$$, $$このおさけはこめからつくられた。$$, $$Este saquê foi feito de arroz.$$),
    ('n4-grammar-31', $$チーズは牛乳から作ります。$$, $$チーズはぎゅうにゅうからつくります。$$, $$O queijo é feito de leite.$$),
    ('n4-grammar-31', $$紙は木から作られることを知っていますか。$$, $$かみはきからつくられることをしっていますか。$$, $$Você sabia que o papel é feito de madeira?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$バターは牛乳____作ります。$$, $$A manteiga é feita de leite.$$),
        (2, $$しょうゆは大豆____作られています。$$, $$O shoyu é feito de soja.$$),
        (3, $$ビールは麦____作ります。$$, $$A cerveja é feita de cevada.$$),
        (4, $$日本酒は何____作られていますか。$$, $$De que é feito o saquê japonês?$$),
        (5, $$このジャムは庭のいちご____作りました。$$, $$Fiz esta geleia com os morangos do quintal.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-31', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$から$$),
        (2, $$から$$),
        (3, $$から$$),
        (4, $$から$$),
        (5, $$から$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-32 — きっと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-32',
    'grammar',
    'N4',
    $$きっと$$,
    $$kitto$$,
    $$Com certeza / Certamente / Sem falta$$,
    $$きっと é um advérbio que mostra uma forte convicção de quem fala. Equivale a "com certeza", "certamente" ou "tenho certeza de que".

Ele é usado quando a pessoa acredita fortemente que algo vai acontecer ou é verdade, mesmo sem uma prova absoluta. Por isso, combina muito com だろう, でしょう e と思う.

Também é usado para expressar determinação ou fazer um pedido forte, com o sentido de "sem falta": prometer que vai fazer algo ou pedir que alguém faça algo de qualquer jeito.

O tom de きっと é pessoal e emocional, ligado à convicção ou à esperança de quem fala.$$,
    $$きっと é diferente de 必ず. 必ず indica algo que acontece sempre ou uma certeza objetiva; きっと indica uma convicção pessoal.

Por isso, em regras e fatos gerais, como "sempre lave as mãos", usa-se 必ず, e não きっと.

Em frases negativas, きっと também funciona, como em "com certeza ele não vem", desde que a convicção seja de quem fala.$$,
    $$きっと + Verbo / Adjetivo + だろう / でしょう
きっと + … + と思う
きっと + Verbo (promessa / determinação)
きっと + Verbo て + ください (pedido forte)$$,
    $$きっと$$,
    $$きっと$$,
    ARRAY['きっと']::text[],
    ARRAY['きっと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-32', $$明日はきっと晴れるでしょう。$$, $$あしたはきっとはれるでしょう。$$, $$Amanhã com certeza vai fazer sol.$$),
    ('n4-grammar-32', $$彼ならきっと合格しますよ。$$, $$かれならきっとごうかくしますよ。$$, $$Ele com certeza vai passar.$$),
    ('n4-grammar-32', $$きっとまた会いましょう。$$, $$きっとまたあいましょう。$$, $$Vamos nos ver de novo, sem falta.$$),
    ('n4-grammar-32', $$田中さんはきっと忙しいんだと思う。$$, $$たなかさんはきっといそがしいんだとおもう。$$, $$Acho que o Tanaka com certeza está ocupado.$$),
    ('n4-grammar-32', $$パーティーには、きっと来てくださいね。$$, $$パーティーには、きっときてくださいね。$$, $$Venha à festa sem falta, tá?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あんなに練習したんだから、____勝てるよ。$$, $$Você treinou tanto que com certeza vai ganhar.$$),
        (2, $$このプレゼントを見たら、彼女は____喜ぶと思います。$$, $$Acho que ela com certeza vai ficar feliz quando vir este presente.$$),
        (3, $$この薬を飲めば、____よくなりますよ。$$, $$Se tomar este remédio, com certeza vai melhorar.$$),
        (4, $$来年は____日本へ行きます。$$, $$Ano que vem, vou ao Japão sem falta.$$),
        (5, $$電気が消えているから、____もう寝たのだろう。$$, $$As luzes estão apagadas, então com certeza já foram dormir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-32', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$きっと$$),
        (2, $$きっと$$),
        (3, $$きっと$$),
        (4, $$きっと$$),
        (5, $$きっと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-33 — 〜頃・〜ごろ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-33',
    'grammar',
    'N4',
    $$〜頃・〜ごろ$$,
    $$koro / goro$$,
    $$Por volta de / Na época em que / Quando$$,
    $$頃 tem dois usos principais, e a leitura muda conforme o uso.

Lido ごろ, ele vem depois de horários, datas e momentos específicos para indicar um tempo aproximado. Equivale a "por volta de" ou "lá pelas". Por exemplo, "por volta das sete".

Lido ころ, ele indica uma época ou um período, geralmente mais amplo. Equivale a "na época em que" ou "quando". É muito usado para falar da infância, da juventude ou de um tempo do passado.

No uso de época, ころ funciona como substantivo: vem depois de の com substantivos, e diretamente depois de verbos e adjetivos.

Também pode indicar que chegou o momento esperado de algo, como "já está na hora de ele chegar".$$,
    $$Com horários, ごろ já indica aproximação, então não é necessário に depois. Dizer 七時ごろに também é aceito, mas 七時ごろ sozinho é mais comum.

A expressão 子供の頃 é praticamente fixa para falar da infância.

ぐらい / くらい também indica aproximação, mas de quantidade ou duração, como "cerca de uma hora". ごろ é para um ponto no tempo.$$,
    $$Horário / Data + ごろ (por volta de)
Substantivo + の + 頃 (ころ) (na época de)
Verbo / Adjetivo い + 頃 (ころ)
Adjetivo な + な + 頃 (ころ)

Escrita: 頃 / ころ / ごろ$$,
    $$頃$$,
    $$頃|ころ|ごろ$$,
    ARRAY['頃']::text[],
    ARRAY['頃', 'ころ', 'ごろ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-33', $$毎朝七時ごろ起きます。$$, $$まいあさしちじごろおきます。$$, $$Toda manhã acordo por volta das sete.$$),
    ('n4-grammar-33', $$子供の頃、よく海で泳ぎました。$$, $$こどものころ、よくうみでおよぎました。$$, $$Quando eu era criança, nadava muito no mar.$$),
    ('n4-grammar-33', $$三月の終わり頃、桜が咲きます。$$, $$さんがつのおわりごろ、さくらがさきます。$$, $$As cerejeiras florescem lá pelo fim de março.$$),
    ('n4-grammar-33', $$学生の頃は、毎日アルバイトをしていた。$$, $$がくせいのころは、まいにちアルバイトをしていた。$$, $$Na época de estudante, eu trabalhava meio período todo dia.$$),
    ('n4-grammar-33', $$もうそろそろ彼が着く頃です。$$, $$もうそろそろかれがつくころです。$$, $$Já está quase na hora de ele chegar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日は十一時____寝ました。$$, $$Ontem dormi por volta das onze.$$),
        (2, $$若い____、よく旅行をしました。$$, $$Quando era jovem, viajava bastante.$$),
        (3, $$来週の水曜日____、また連絡します。$$, $$Entro em contato de novo lá pela quarta-feira da semana que vem.$$),
        (4, $$小学生の____、犬を飼っていました。$$, $$Na época do primário, eu tinha um cachorro.$$),
        (5, $$桜が咲く____に、日本へ行きたいです。$$, $$Quero ir ao Japão na época em que as cerejeiras florescem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-33', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ごろ$$),
        (1, $$頃$$),
        (2, $$頃$$),
        (2, $$ころ$$),
        (3, $$ごろ$$),
        (3, $$頃$$),
        (4, $$頃$$),
        (4, $$ころ$$),
        (5, $$頃$$),
        (5, $$ころ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-34 — 〜こと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-34',
    'grammar',
    'N4',
    $$〜こと$$,
    $$koto$$,
    $$O ato de / O fato de / Coisa$$,
    $$こと é usado para transformar um verbo ou uma frase em um substantivo. É como dizer "o ato de..." ou "o fato de...".

Isso é necessário porque, em japonês, partículas como は, が e を só se ligam a substantivos. Para dizer coisas como "falar japonês é fácil" ou "meu hobby é ler", o verbo precisa virar substantivo primeiro.

A frase antes de こと fica na forma simples. Com adjetivos な, usa-se な, e com substantivos, である ou だった, conforme o caso.

こと também aparece em muitas outras gramáticas, como ことができる, ことがある, ことにする e ことになる.

の também pode transformar verbos em substantivos, mas こと soa mais abstrato e é obrigatório em alguns casos, como antes de です em definições e com verbos como 話す ou 伝える.$$,
    $$Com verbos de percepção, como 見る e 聞く, usa-se の e não こと, para descrever algo que se viu ou ouviu acontecendo.

Em frases como "meu hobby é...", "meu sonho é...", o natural é こと, e não の.

Sozinho, こと também é um substantivo comum que significa "coisa" no sentido abstrato, como assunto ou fato, diferente de 物, que é coisa concreta.$$,
    $$Verbo (forma simples) + こと + は / が / を / です
Frase + こと + を + 知っている / 忘れる / 聞く
Substantivo + は + Verbo + ことです (趣味 / 夢 / 仕事)$$,
    $$こと$$,
    $$こと$$,
    ARRAY['こと']::text[],
    ARRAY['こと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-34', $$私の趣味は写真を撮ることです。$$, $$わたしのしゅみはしゃしんをとることです。$$, $$Meu hobby é tirar fotos.$$),
    ('n4-grammar-34', $$日本語を話すことは難しくないです。$$, $$にほんごをはなすことはむずかしくないです。$$, $$Falar japonês não é difícil.$$),
    ('n4-grammar-34', $$毎日運動することが大切です。$$, $$まいにちうんどうすることがたいせつです。$$, $$É importante fazer exercício todo dia.$$),
    ('n4-grammar-34', $$彼が結婚したことを知っていますか。$$, $$かれがけっこんしたことをしっていますか。$$, $$Você sabia que ele se casou?$$),
    ('n4-grammar-34', $$私の夢は世界を旅行することだ。$$, $$わたしのゆめはせかいをりょこうすることだ。$$, $$Meu sonho é viajar pelo mundo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私の趣味は本を読む____です。$$, $$Meu hobby é ler livros.$$),
        (2, $$早く寝る____は体にいいです。$$, $$Dormir cedo faz bem para o corpo.$$),
        (3, $$約束を守る____が大切です。$$, $$É importante cumprir as promessas.$$),
        (4, $$先生に言われた____を忘れました。$$, $$Esqueci o que o professor me disse.$$),
        (5, $$彼が会社をやめた____を、誰から聞きましたか。$$, $$De quem você ouviu que ele saiu da empresa?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-34', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こと$$),
        (2, $$こと$$),
        (3, $$こと$$),
        (4, $$こと$$),
        (5, $$こと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-35 — 〜ことがある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-35',
    'grammar',
    'N4',
    $$〜ことがある$$,
    $$koto ga aru$$,
    $$Às vezes acontece de / Há vezes em que$$,
    $$Quando vem depois do verbo na forma de dicionário ou na forma ない, ことがある significa que algo acontece de vez em quando. Equivale a "às vezes" ou "há vezes em que".

A ideia é que a situação não é frequente nem habitual, mas acontece em algumas ocasiões.

É muito comum junto com 時々, たまに ou com a partícula も, formando こともある, que suaviza ainda mais: "também acontece de...".

Não confunda com たことがある, que usa o verbo no passado e fala de experiências de vida: "já fiz isso alguma vez".$$,
    $$A diferença é só a forma do verbo: forma de dicionário = "às vezes acontece"; forma た = "já aconteceu (experiência)".

こともある soa natural quando se quer admitir algo, como "às vezes eu também erro".

Para hábitos regulares, o japonês prefere outras formas, como ことにしている ou simplesmente o verbo com いつも ou よく.$$,
    $$Verbo na forma de dicionário + ことがある
Verbo na forma ない + ことがある
Adjetivo + ことがある

Educado: ことがあります
Mais suave: こともある / こともあります$$,
    $$ことがある$$,
    $$ことがある|ことがあります|こともある|こともあります$$,
    ARRAY['こと', 'が', 'ある']::text[],
    ARRAY['ことがある', 'ことがあります', 'こともある', 'こともあります']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-35', $$時々、朝ご飯を食べないことがあります。$$, $$ときどき、あさごはんをたべないことがあります。$$, $$Às vezes acontece de eu não tomar café da manhã.$$),
    ('n4-grammar-35', $$この電車は遅れることがある。$$, $$このでんしゃはおくれることがある。$$, $$Este trem às vezes atrasa.$$),
    ('n4-grammar-35', $$忙しいときは、夜遅くまで働くこともあります。$$, $$いそがしいときは、よるおそくまではたらくこともあります。$$, $$Quando estou ocupado, às vezes trabalho até tarde da noite.$$),
    ('n4-grammar-35', $$父は休みの日に料理を作ることがあります。$$, $$ちちはやすみのひにりょうりをつくることがあります。$$, $$Meu pai às vezes cozinha nos dias de folga.$$),
    ('n4-grammar-35', $$彼はたまに約束を忘れることがある。$$, $$かれはたまにやくそくをわすれることがある。$$, $$Ele de vez em quando esquece os compromissos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$疲れていると、電車で寝てしまう____。$$, $$Quando estou cansado, às vezes acabo dormindo no trem.$$),
        (2, $$この道は夜、暗くて危ない____。$$, $$Esta rua às vezes fica escura e perigosa à noite.$$),
        (3, $$母は時々、一人で映画を見に行く____。$$, $$Minha mãe às vezes vai ao cinema sozinha.$$),
        (4, $$雪が多い年は、学校が休みになる____。$$, $$Nos anos com muita neve, às vezes as aulas são canceladas.$$),
        (5, $$私も、たまに失敗する____。$$, $$Eu também às vezes erro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-35', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことがあります$$),
        (1, $$ことがある$$),
        (2, $$ことがある$$),
        (2, $$ことがあります$$),
        (3, $$ことがあります$$),
        (3, $$ことがある$$),
        (4, $$ことがあります$$),
        (4, $$ことがある$$),
        (5, $$こともあります$$),
        (5, $$こともある$$),
        (5, $$ことがあります$$),
        (5, $$ことがある$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-36 — 〜ことができる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-36',
    'grammar',
    'N4',
    $$〜ことができる$$,
    $$koto ga dekiru$$,
    $$Poder / Conseguir / Saber (fazer)$$,
    $$ことができる é usado para dizer que alguém é capaz de fazer algo ou que algo é possível. Equivale a "poder", "conseguir" ou "saber fazer".

A estrutura junta o verbo na forma de dicionário com こと, que o transforma em substantivo, e できる, que significa "ser possível". A ideia literal é "fazer isso é possível".

Ela expressa tanto habilidade (saber tocar piano) quanto possibilidade (ser permitido tirar fotos em um lugar).

O sentido é o mesmo da forma potencial (話せる, 食べられる), mas ことができる soa um pouco mais formal e é muito comum em textos, regras e explicações.$$,
    $$Na conversa do dia a dia, a forma potencial é mais curta e natural. ことができる aparece mais em textos, avisos e situações formais.

ことができました expressa a alegria de ter conseguido algo depois de esforço.

Para substantivos, a estrutura é mais simples: Substantivo + ができる.$$,
    $$Verbo na forma de dicionário + ことができる
Verbo na forma de dicionário + ことができます (educado)

Negativo: ことができない / ことができません
Passado: ことができた / ことができました
Passado negativo: ことができなかった / ことができませんでした$$,
    $$ことができる$$,
    $$ことができる|ことができます|ことができない|ことができません|ことができた|ことができました|ことができなかった$$,
    ARRAY['こと', 'が', 'できる']::text[],
    ARRAY['ことができる', 'ことができます', 'ことができない', 'ことができません', 'ことができた', 'ことができました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-36', $$私はピアノを弾くことができます。$$, $$わたしはピアノをひくことができます。$$, $$Eu sei tocar piano.$$),
    ('n4-grammar-36', $$ここで写真を撮ることができますか。$$, $$ここでしゃしんをとることができますか。$$, $$É possível tirar fotos aqui?$$),
    ('n4-grammar-36', $$この図書館では、本を二週間借りることができる。$$, $$このとしょかんでは、ほんをにしゅうかんかりることができる。$$, $$Nesta biblioteca, é possível pegar livros emprestados por duas semanas.$$),
    ('n4-grammar-36', $$足が痛くて、走ることができません。$$, $$あしがいたくて、はしることができません。$$, $$Estou com dor no pé e não consigo correr.$$),
    ('n4-grammar-36', $$やっと日本語で手紙を書くことができました。$$, $$やっとにほんごでてがみをかくことができました。$$, $$Finalmente consegui escrever uma carta em japonês.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は五か国語を話す____。$$, $$Ele sabe falar cinco idiomas.$$),
        (2, $$このホテルでは、無料でインターネットを使う____。$$, $$Neste hotel, é possível usar a internet de graça.$$),
        (3, $$昨日は熱があって、学校に行く____。$$, $$Ontem eu estava com febre e não consegui ir à escola.$$),
        (4, $$このカードで、電車に乗る____か。$$, $$É possível pegar o trem com este cartão?$$),
        (5, $$一生懸命練習して、試合に勝つ____。$$, $$Treinei muito e consegui vencer a partida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-36', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことができます$$),
        (1, $$ことができる$$),
        (2, $$ことができます$$),
        (2, $$ことができる$$),
        (3, $$ことができませんでした$$),
        (3, $$ことができなかった$$),
        (4, $$ことができます$$),
        (5, $$ことができました$$),
        (5, $$ことができた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-37 — 〜ことになる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-37',
    'grammar',
    'N4',
    $$〜ことになる$$,
    $$koto ni naru$$,
    $$Ficar decidido que / Acabar sendo / Ter que$$,
    $$ことになる é usado para dizer que algo foi decidido, mas não necessariamente por quem fala. A decisão veio de fora: da empresa, da escola, de outras pessoas ou das circunstâncias. Equivale a "ficou decidido que" ou "vai acontecer que".

A ideia é que a situação "virou" assim, como resultado de algo. Por isso, ela é muito usada para anunciar mudanças, como transferências de trabalho, casamentos e eventos.

Muitas vezes, ことになりました também é usado por modéstia, mesmo quando a própria pessoa tomou a decisão. Assim, ela evita parecer que está se exibindo ou impondo algo.

Também pode indicar uma consequência: se algo continuar, "vai acabar resultando em...".$$,
    $$A diferença entre ことにする e ことになる é quem decide. ことにする indica uma decisão de quem fala; ことになる indica uma decisão externa ou que "acabou acontecendo".

Para regras ou costumes já estabelecidos, usa-se ことになっている, que aparece no N3.

Em anúncios pessoais, como casamento ou mudança, ことになりました é a forma mais natural e educada.$$,
    $$Verbo na forma de dicionário + ことになる
Verbo na forma ない + ことになる

Decisão anunciada: ことになりました / ことになった
Consequência: 〜ことになる / ことになります$$,
    $$ことになる$$,
    $$ことになる|ことになりました|ことになった|ことになります|ことになって$$,
    ARRAY['こと', 'に', 'なる']::text[],
    ARRAY['ことになる', 'ことになった', 'ことになりました', 'ことになります']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-37', $$来月、大阪に転勤することになりました。$$, $$らいげつ、おおさかにてんきんすることになりました。$$, $$Ficou decidido que vou ser transferido para Osaka no mês que vem.$$),
    ('n4-grammar-37', $$会議は金曜日に行うことになった。$$, $$かいぎはきんようびにおこなうことになった。$$, $$Ficou decidido que a reunião será na sexta-feira.$$),
    ('n4-grammar-37', $$今度、結婚することになりました。$$, $$こんど、けっこんすることになりました。$$, $$Vou me casar em breve.$$),
    ('n4-grammar-37', $$このまま続けると、大変なことになるよ。$$, $$このままつづけると、たいへんなことになるよ。$$, $$Se continuar assim, vai dar problema sério.$$),
    ('n4-grammar-37', $$雨のため、試合は中止することになりました。$$, $$あめのため、しあいはちゅうしすることになりました。$$, $$Por causa da chuva, ficou decidido cancelar a partida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$来週から、アメリカへ出張する____。$$, $$Ficou decidido que vou viajar a trabalho para os Estados Unidos a partir da semana que vem.$$),
        (2, $$父の仕事で、家族で引っ越す____。$$, $$Por causa do trabalho do meu pai, nossa família vai se mudar.$$),
        (3, $$話し合いの結果、私がリーダーをやる____。$$, $$Depois da conversa, ficou decidido que eu serei o líder.$$),
        (4, $$会社の決まりで、毎週月曜日に会議をする____。$$, $$Por regra da empresa, ficou decidido que haverá reunião toda segunda-feira.$$),
        (5, $$嘘をつき続けると、困る____よ。$$, $$Se continuar mentindo, você vai acabar se complicando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-37', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことになりました$$),
        (1, $$ことになった$$),
        (2, $$ことになりました$$),
        (2, $$ことになった$$),
        (3, $$ことになりました$$),
        (3, $$ことになった$$),
        (4, $$ことになりました$$),
        (4, $$ことになった$$),
        (5, $$ことになる$$),
        (5, $$ことになります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-38 — 〜ことにする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-38',
    'grammar',
    'N4',
    $$〜ことにする$$,
    $$koto ni suru$$,
    $$Decidir (fazer) / Resolver$$,
    $$ことにする é usado para dizer que a própria pessoa decidiu fazer ou não fazer algo. Equivale a "decidir" ou "resolver".

A estrutura junta o verbo na forma de dicionário ou na forma ない com こと e にする. A ideia é "escolher essa ação" entre as opções possíveis.

No passado, ことにした / ことにしました indica uma decisão já tomada. No presente, ことにする / ことにします indica uma decisão tomada naquele momento.

A diferença em relação a ことになる é importante: ことにする mostra uma decisão pessoal, de quem fala; ことになる mostra algo decidido por fatores externos.$$,
    $$Quando a decisão vira um hábito, usa-se ことにしている, que aparece mais adiante no N4.

ことにする também pode significar "fingir que" ou "considerar como", em frases como "vamos considerar que isso não aconteceu". Esse uso é mais avançado.

Compare com つもり: つもり é uma intenção, ことにする é uma decisão já tomada.$$,
    $$Verbo na forma de dicionário + ことにする
Verbo na forma ない + ことにする

Decisão tomada: ことにした / ことにしました
Decisão agora: ことにする / ことにします
Proposta: ことにしよう$$,
    $$ことにする$$,
    $$ことにする|ことにします|ことにした|ことにしました|ことにしよう$$,
    ARRAY['こと', 'に', 'する']::text[],
    ARRAY['ことにする', 'ことにします', 'ことにした', 'ことにしました', 'ことにしよう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-38', $$明日から毎日走ることにしました。$$, $$あしたからまいにちはしることにしました。$$, $$Decidi correr todos os dias a partir de amanhã.$$),
    ('n4-grammar-38', $$今年は国に帰らないことにした。$$, $$ことしはくににかえらないことにした。$$, $$Decidi não voltar para o meu país este ano.$$),
    ('n4-grammar-38', $$体のために、お酒をやめることにします。$$, $$からだのために、おさけをやめることにします。$$, $$Pela minha saúde, vou parar de beber.$$),
    ('n4-grammar-38', $$よく考えて、この会社に入ることにしました。$$, $$よくかんがえて、このかいしゃにはいることにしました。$$, $$Depois de pensar bem, decidi entrar nesta empresa.$$),
    ('n4-grammar-38', $$雨だから、今日は出かけないことにしよう。$$, $$あめだから、きょうはでかけないことにしよう。$$, $$Está chovendo, então vamos decidir não sair hoje.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$健康のために、毎朝野菜ジュースを飲む____。$$, $$Pela saúde, decidi tomar suco de verduras toda manhã.$$),
        (2, $$夏休みは北海道へ行く____。$$, $$Decidi ir a Hokkaido nas férias de verão.$$),
        (3, $$もうタバコは吸わない____。$$, $$Decidi não fumar mais.$$),
        (4, $$今日は疲れたから、外で食べる____。$$, $$Hoje estou cansado, então vou comer fora.$$),
        (5, $$迷ったけど、新しいパソコンを買う____。$$, $$Fiquei em dúvida, mas decidi comprar um computador novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-38', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことにしました$$),
        (1, $$ことにした$$),
        (2, $$ことにしました$$),
        (2, $$ことにした$$),
        (2, $$ことにします$$),
        (3, $$ことにしました$$),
        (3, $$ことにした$$),
        (3, $$ことにします$$),
        (3, $$ことにする$$),
        (4, $$ことにする$$),
        (4, $$ことにします$$),
        (4, $$ことにしよう$$),
        (5, $$ことにしました$$),
        (5, $$ことにした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-39 — 〜くする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-39',
    'grammar',
    'N4',
    $$〜くする$$,
    $$ku suru$$,
    $$Tornar / Deixar (mais...)$$,
    $$くする é usado com adjetivos い para dizer que alguém muda algo de propósito, deixando aquilo com uma nova característica. Equivale a "tornar" ou "deixar".

Para formar, tira-se o い do adjetivo e acrescenta-se く, seguido de する. Por exemplo, deixar o quarto claro, deixar o som baixo, deixar o cabelo curto.

A diferença em relação a くなる é quem causa a mudança. Com くなる, a mudança acontece naturalmente ("ficou escuro"). Com くする, alguém faz a mudança acontecer ("deixei escuro").

Por isso, a coisa que muda é marcada com を, como objeto da ação.

Com adjetivos な e substantivos, a estrutura equivalente é にする, como em きれいにする (deixar limpo).$$,
    $$Compare: 部屋が明るくなった (o quarto ficou claro, por exemplo porque amanheceu) e 部屋を明るくした (eu deixei o quarto claro, acendendo a luz).

Em lojas, pedir desconto com 安くしてください ou 安くしてもらえませんか é bem comum em alguns contextos.

くする é muito usado em pedidos práticos, como aumentar ou diminuir o volume.$$,
    $$Substantivo + を + Adjetivo い sem い + く + する
Exceção: いい → よくする

Pedido: 〜くしてください
Passado: 〜くした / 〜くしました

Equivalente com adjetivos な: Adjetivo な + に + する$$,
    $$くする$$,
    $$くする|くします|くした|くしました|くして$$,
    ARRAY['く', 'する']::text[],
    ARRAY['くする', 'くします', 'くした', 'くしました', 'くして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-39', $$カーテンを開けて、部屋を明るくしました。$$, $$カーテンをあけて、へやをあかるくしました。$$, $$Abri a cortina e deixei o quarto claro.$$),
    ('n4-grammar-39', $$すみません、音を小さくしてください。$$, $$すみません、おとをちいさくしてください。$$, $$Com licença, abaixe o som, por favor.$$),
    ('n4-grammar-39', $$夏だから、髪を短くしたいです。$$, $$なつだから、かみをみじかくしたいです。$$, $$Como é verão, quero deixar o cabelo curto.$$),
    ('n4-grammar-39', $$今日は料理を少し辛くしました。$$, $$きょうはりょうりをすこしからくしました。$$, $$Hoje deixei a comida um pouco mais apimentada.$$),
    ('n4-grammar-39', $$値段をもう少し安くしてくれませんか。$$, $$ねだんをもうすこしやすくしてくれませんか。$$, $$Não pode deixar o preço um pouco mais barato?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$テレビの音を大き____ください。$$, $$Aumente o volume da TV, por favor.$$),
        (2, $$子供のために、カレーを甘____。$$, $$Deixei o curry mais suave por causa das crianças.$$),
        (3, $$部屋が暗いから、もう少し明る____ください。$$, $$O quarto está escuro, então deixe-o um pouco mais claro, por favor.$$),
        (4, $$冬は部屋を暖か____寝ます。$$, $$No inverno, durmo com o quarto aquecido.$$),
        (5, $$文章を短____、読みやすくしました。$$, $$Encurtei o texto e o deixei mais fácil de ler.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-39', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くして$$),
        (2, $$くしました$$),
        (2, $$くした$$),
        (3, $$くして$$),
        (4, $$くして$$),
        (5, $$くして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-40 — 急に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-40',
    'grammar',
    'N4',
    $$急に$$,
    $$kyuu ni$$,
    $$De repente / Repentinamente / Sem aviso$$,
    $$急に é um advérbio que significa "de repente". Ele indica que algo aconteceu de forma súbita, sem aviso, ou que uma mudança foi muito rápida.

Ele vem antes do verbo ou da expressão que descreve a mudança. É muito usado com fenômenos do tempo, mudanças de estado, imprevistos e reações inesperadas.

A palavra vem do adjetivo な 急 (súbito, urgente). Com に, ela vira advérbio.

Comparado a 突然, que também significa "de repente", 急に é mais comum na conversa e destaca a rapidez da mudança. 突然 soa um pouco mais formal e destaca o elemento de surpresa.$$,
    $$急 também aparece em palavras como 急ぐ (apressar-se), 急行 (trem expresso) e 急用 (assunto urgente). A ideia comum é velocidade ou urgência.

Combinações muito frequentes são 急に雨が降る, 急に寒くなる e 急に用事ができる.

急に também combina bem com 出す, que reforça a ideia de algo que começou de repente.$$,
    $$急に + Verbo
急に + Adjetivo + なる

Escrita: 急に / きゅうに$$,
    $$急に$$,
    $$急に|きゅうに$$,
    ARRAY['急', 'に']::text[],
    ARRAY['急に', 'きゅうに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-40', $$急に雨が降ってきました。$$, $$きゅうにあめがふってきました。$$, $$De repente, começou a chover.$$),
    ('n4-grammar-40', $$前の車が急に止まった。$$, $$まえのくるまがきゅうにとまった。$$, $$O carro da frente parou de repente.$$),
    ('n4-grammar-40', $$急に用事ができて、行けなくなりました。$$, $$きゅうにようじができて、いけなくなりました。$$, $$Surgiu um compromisso de repente, e não vou poder ir.$$),
    ('n4-grammar-40', $$彼女は急に泣き出した。$$, $$かのじょはきゅうになきだした。$$, $$Ela começou a chorar de repente.$$),
    ('n4-grammar-40', $$急に寒くなったので、風邪をひいてしまった。$$, $$きゅうにさむくなったので、かぜをひいてしまった。$$, $$Esfriou de repente, e acabei pegando um resfriado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____電気が消えました。$$, $$De repente, a luz apagou.$$),
        (2, $$子供が____道に飛び出した。$$, $$A criança saiu correndo para a rua de repente.$$),
        (3, $$食事の後、____お腹が痛くなりました。$$, $$Depois da refeição, de repente fiquei com dor de barriga.$$),
        (4, $$彼は____会社をやめた。$$, $$Ele saiu da empresa de repente.$$),
        (5, $$午後から天気が____悪くなりました。$$, $$A partir da tarde, o tempo piorou de repente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-40', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$急に$$),
        (1, $$きゅうに$$),
        (2, $$急に$$),
        (2, $$きゅうに$$),
        (3, $$急に$$),
        (3, $$きゅうに$$),
        (4, $$急に$$),
        (4, $$きゅうに$$),
        (5, $$急に$$),
        (5, $$きゅうに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-41 — 〜までに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-41',
    'grammar',
    'N4',
    $$〜までに$$,
    $$made ni$$,
    $$Até (prazo) / Antes de / No máximo até$$,
    $$までに é usado para indicar um prazo, ou seja, o momento limite até o qual algo deve acontecer. Equivale a "até" no sentido de "antes de" ou "no máximo até".

A ação acontece uma vez, em algum momento antes do limite. Por exemplo, entregar um relatório até sexta significa entregar em qualquer momento antes de sexta acabar.

Isso é muito diferente de まで. まで indica que a ação continua o tempo todo até o limite, como trabalhar até as cinco. までに indica um prazo para uma ação pontual.

Ele vem depois de substantivos de tempo e de verbos na forma de dicionário.$$,
    $$Uma forma prática de escolher: se dá para dizer "antes de", use までに; se a ação dura o tempo todo até ali, use まで.

Em e-mails de trabalho, までに aparece o tempo todo para pedir entregas com prazo, como 金曜日までにお願いします.

Com verbos, a ação de までに ainda não aconteceu, por isso o verbo fica sempre na forma de dicionário.$$,
    $$Substantivo de tempo + までに
Verbo na forma de dicionário + までに$$,
    $$までに$$,
    $$までに$$,
    ARRAY['まで', 'に']::text[],
    ARRAY['までに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-41', $$金曜日までにレポートを出してください。$$, $$きんようびまでにレポートをだしてください。$$, $$Entregue o relatório até sexta-feira, por favor.$$),
    ('n4-grammar-41', $$今日は五時までに帰ります。$$, $$きょうはごじまでにかえります。$$, $$Hoje volto para casa até as cinco.$$),
    ('n4-grammar-41', $$夏休みが終わるまでに、宿題を全部します。$$, $$なつやすみがおわるまでに、しゅくだいをぜんぶします。$$, $$Vou fazer toda a lição antes de as férias de verão acabarem.$$),
    ('n4-grammar-41', $$来年までに日本語能力試験に合格したい。$$, $$らいねんまでににほんごのうりょくしけんにごうかくしたい。$$, $$Quero passar no exame de proficiência em japonês até o ano que vem.$$),
    ('n4-grammar-41', $$会議が始まるまでに、資料を準備しておきます。$$, $$かいぎがはじまるまでに、しりょうをじゅんびしておきます。$$, $$Vou preparar os documentos antes de a reunião começar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日の朝____この仕事を終わらせます。$$, $$Vou terminar este trabalho até amanhã de manhã.$$),
        (2, $$十時____駅に来てください。$$, $$Chegue à estação até as dez, por favor.$$),
        (3, $$月末____家賃を払わなければなりません。$$, $$Tenho que pagar o aluguel até o fim do mês.$$),
        (4, $$両親が帰ってくる____、部屋を片付けよう。$$, $$Vamos arrumar o quarto antes de nossos pais voltarem.$$),
        (5, $$三十歳になる____結婚したいです。$$, $$Quero me casar antes de fazer trinta anos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-41', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$までに$$),
        (2, $$までに$$),
        (3, $$までに$$),
        (4, $$までに$$),
        (5, $$までに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-42 — 〜まま
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-42',
    'grammar',
    'N4',
    $$〜まま$$,
    $$mama$$,
    $$Do jeito que está / Sem mudar / Deixando$$,
    $$まま é usado para dizer que um estado continua igual, sem mudança, enquanto outra coisa acontece. Equivale a "do jeito que está", "sem mudar" ou "deixando...".

Com verbos na forma た, まま indica que uma ação foi feita e o resultado continuou, quando o normal seria desfazê-lo. Por exemplo, dormir com a luz acesa, sair com a janela aberta, entrar de sapatos.

Muitas vezes, essa situação é vista como estranha, inadequada ou descuidada. Por isso, まま aparece bastante em avisos e reclamações.

Com substantivos (com の) e adjetivos, まま indica que algo continua no mesmo estado de antes, como "continua do jeito antigo".$$,
    $$A expressão このまま significa "assim mesmo" ou "do jeito que está", e そのまま significa "desse jeito", "sem mexer".

Com verbos, まま quase sempre usa a forma た, porque indica o resultado de uma ação que já aconteceu.

〜たままにする significa "deixar como está", de propósito.$$,
    $$Verbo na forma た + まま
Verbo na forma ない + まま
Substantivo + の + まま
Adjetivo い + まま
Adjetivo な + な + まま

Com partículas: まま + で / に$$,
    $$まま$$,
    $$まま$$,
    ARRAY['まま']::text[],
    ARRAY['まま', 'ままで', 'ままに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-42', $$靴を履いたまま、部屋に入らないでください。$$, $$くつをはいたまま、へやにはいらないでください。$$, $$Não entre no quarto de sapatos, por favor.$$),
    ('n4-grammar-42', $$昨日は電気をつけたまま寝てしまった。$$, $$きのうはでんきをつけたままねてしまった。$$, $$Ontem acabei dormindo com a luz acesa.$$),
    ('n4-grammar-42', $$窓を開けたまま出かけました。$$, $$まどをあけたままでかけました。$$, $$Saí deixando a janela aberta.$$),
    ('n4-grammar-42', $$この町は昔のままです。$$, $$このまちはむかしのままです。$$, $$Esta cidade continua como era antigamente.$$),
    ('n4-grammar-42', $$このスープは冷たいままで食べてもおいしいです。$$, $$このスープはつめたいままでたべてもおいしいです。$$, $$Esta sopa é gostosa mesmo comida fria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$テレビをつけた____、寝てしまいました。$$, $$Acabei dormindo com a TV ligada.$$),
        (2, $$帽子をかぶった____、話してはいけません。$$, $$Não se deve conversar de chapéu.$$),
        (3, $$ドアを開けた____にしないでください。$$, $$Não deixe a porta aberta, por favor.$$),
        (4, $$彼女は十年前と同じ____ですね。$$, $$Ela continua igualzinha a dez anos atrás, né?$$),
        (5, $$この野菜は生の____食べられます。$$, $$Esta verdura pode ser comida crua.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-42', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まま$$),
        (2, $$まま$$),
        (3, $$まま$$),
        (4, $$まま$$),
        (5, $$まま$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-43 — または
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-43',
    'grammar',
    'N4',
    $$または$$,
    $$mata wa$$,
    $$Ou / Ou então$$,
    $$または é uma conjunção que significa "ou". Ela apresenta duas ou mais opções, das quais se escolhe uma.

É usada principalmente em linguagem formal e escrita: instruções, formulários, regras, avisos e explicações oficiais. Na conversa do dia a dia, os japoneses costumam usar か ou それか.

または pode ligar substantivos, como "caneta preta ou azul", e também frases inteiras.

Muitas vezes, aparece com vírgula antes, principalmente quando liga frases ou expressões mais longas.$$,
    $$または e あるいは têm sentido parecido. あるいは soa ainda mais formal e literário.

Em provas e formulários japoneses, または aparece muito em instruções sobre o que escolher ou levar.

Na fala informal, a forma mais natural de dizer "ou" entre substantivos é か.$$,
    $$Substantivo A + または + Substantivo B
Frase A、または + Frase B

Escrita: または / 又は$$,
    $$または$$,
    $$または|又は$$,
    ARRAY['または']::text[],
    ARRAY['または', '又は']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-43', $$黒または青のペンで書いてください。$$, $$くろまたはあおのペンでかいてください。$$, $$Escreva com caneta preta ou azul.$$),
    ('n4-grammar-43', $$電話またはメールで連絡してください。$$, $$でんわまたはメールでれんらくしてください。$$, $$Entre em contato por telefone ou e-mail.$$),
    ('n4-grammar-43', $$月曜日または火曜日に来てください。$$, $$げつようびまたはかようびにきてください。$$, $$Venha na segunda ou na terça-feira.$$),
    ('n4-grammar-43', $$お支払いは、現金またはカードでお願いします。$$, $$おしはらいは、げんきんまたはカードでおねがいします。$$, $$O pagamento pode ser feito em dinheiro ou cartão.$$),
    ('n4-grammar-43', $$申し込みは、駅の窓口、またはインターネットでできます。$$, $$もうしこみは、えきのまどぐち、またはインターネットでできます。$$, $$A inscrição pode ser feita no guichê da estação ou pela internet.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$鉛筆____ボールペンを使ってください。$$, $$Use lápis ou caneta esferográfica.$$),
        (2, $$答えはAかBのどちらか、____両方を選んでください。$$, $$Escolha A ou B, ou então as duas.$$),
        (3, $$受付は、平日____土曜日です。$$, $$O atendimento é em dias úteis ou aos sábados.$$),
        (4, $$来週の水曜日、____木曜日に会いましょう。$$, $$Vamos nos encontrar na quarta ou na quinta da semana que vem.$$),
        (5, $$運転免許証、____パスポートを持ってきてください。$$, $$Traga a carteira de motorista ou o passaporte.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-43', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$または$$),
        (2, $$または$$),
        (3, $$または$$),
        (4, $$または$$),
        (5, $$または$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-44 — 〜みたいだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-44',
    'grammar',
    'N4',
    $$〜みたいだ$$,
    $$mitai da$$,
    $$Parece que / Parece / Como se fosse$$,
    $$みたいだ tem dois usos principais e é a forma falada e casual de ようだ.

O primeiro é fazer uma suposição baseada no que você vê, ouve ou percebe. Equivale a "parece que". Por exemplo, ver o chão molhado e concluir que choveu.

O segundo é fazer uma comparação, dizendo que algo se parece com outra coisa, mesmo não sendo. Equivale a "parece" ou "como se fosse". Por exemplo, dizer que uma situação parece um sonho.

みたい funciona como um adjetivo な. Ele vem diretamente depois de substantivos (sem の) e depois da forma simples de verbos e adjetivos.

Na fala, é muito comum usar só みたい no final da frase, sem だ.$$,
    $$みたいだ é casual. Em textos e situações formais, prefere-se ようだ, que tem o mesmo sentido.

Diferente de ようだ, みたい se liga diretamente ao substantivo, sem の: 夢みたい, e não 夢のみたい.

Para reforçar a comparação, usa-se まるで antes, como em "parece até...".$$,
    $$Verbo (forma simples) + みたいだ
Adjetivo い + みたいだ
Adjetivo な (sem な) + みたいだ
Substantivo + みたいだ

Educado: みたいです
Fala casual: みたい$$,
    $$みたいだ$$,
    $$みたいだ|みたいです|みたい$$,
    ARRAY['みたい', 'だ']::text[],
    ARRAY['みたいだ', 'みたいです', 'みたい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-44', $$道が濡れている。外は雨みたいだ。$$, $$みちがぬれている。そとはあめみたいだ。$$, $$A rua está molhada. Parece que está chovendo lá fora.$$),
    ('n4-grammar-44', $$田中さんは今日休みみたいです。$$, $$たなかさんはきょうやすみみたいです。$$, $$Parece que o Tanaka está de folga hoje.$$),
    ('n4-grammar-44', $$彼女はもう帰ったみたい。$$, $$かのじょはもうかえったみたい。$$, $$Parece que ela já foi embora.$$),
    ('n4-grammar-44', $$この部屋、誰もいないみたいだね。$$, $$このへや、だれもいないみたいだね。$$, $$Parece que não tem ninguém neste quarto, né?$$),
    ('n4-grammar-44', $$こんなにいい天気、夢みたいだ。$$, $$こんなにいいてんき、ゆめみたいだ。$$, $$Um tempo tão bom assim parece um sonho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道が濡れている。昨日の夜、雨が降った____。$$, $$A rua está molhada. Parece que choveu ontem à noite.$$),
        (2, $$彼は風邪をひいている____です。$$, $$Parece que ele está resfriado.$$),
        (3, $$山田さんはお酒が好き____。$$, $$Parece que o Yamada gosta de bebida.$$),
        (4, $$この店、今日は休み____ですね。$$, $$Parece que esta loja está fechada hoje, né?$$),
        (5, $$そんなことで泣くなんて、まるで子供____。$$, $$Chorar por uma coisa dessas? Parece até uma criança.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-44', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$みたいだ$$),
        (1, $$みたいです$$),
        (2, $$みたい$$),
        (3, $$みたいだ$$),
        (3, $$みたいです$$),
        (3, $$みたい$$),
        (4, $$みたい$$),
        (5, $$みたいだ$$),
        (5, $$みたい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-45 — 〜みたいな
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-45',
    'grammar',
    'N4',
    $$〜みたいな$$,
    $$mitai na$$,
    $$Como / Igual a / Do tipo de$$,
    $$みたいな é usado antes de um substantivo para comparar ou dar um exemplo. Equivale a "como", "igual a" ou "do tipo de".

Como みたい funciona como um adjetivo な, ele recebe な quando vem antes de um substantivo. Assim, "uma pessoa como ele" ou "uma cidade grande como Tóquio".

Ele tem dois sentidos principais. O primeiro é comparação: algo que se parece com outra coisa, como "uma história que parece um sonho". O segundo é exemplo: algo do tipo daquilo que foi citado, como "quero morar numa cidade como Tóquio".

É uma forma casual, muito usada na conversa. Em textos formais, usa-se のような.$$,
    $$Na fala jovem, みたいな também é usado no final da frase como uma espécie de "tipo assim", para suavizar ou resumir algo que se disse. Esse uso é bem coloquial.

A versão formal equivalente é のような: 彼のような人.

Muitas vezes, みたいな com uma pessoa expressa admiração, como querer ser alguém parecido com ela.$$,
    $$Substantivo + みたいな + Substantivo
Verbo / Adjetivo (forma simples) + みたいな + Substantivo$$,
    $$みたいな$$,
    $$みたいな$$,
    ARRAY['みたい', 'な']::text[],
    ARRAY['みたいな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-45', $$私は彼みたいな人になりたいです。$$, $$わたしはかれみたいなひとになりたいです。$$, $$Quero ser uma pessoa como ele.$$),
    ('n4-grammar-45', $$東京みたいな大きい町に住みたい。$$, $$とうきょうみたいなおおきいまちにすみたい。$$, $$Quero morar numa cidade grande como Tóquio.$$),
    ('n4-grammar-45', $$子供みたいなことを言わないで。$$, $$こどもみたいなことをいわないで。$$, $$Não diga coisas de criança.$$),
    ('n4-grammar-45', $$それは夢みたいな話ですね。$$, $$それはゆめみたいなはなしですね。$$, $$Essa é uma história que parece um sonho, hein.$$),
    ('n4-grammar-45', $$桜みたいなピンクの服を買いました。$$, $$さくらみたいなピンクのふくをかいました。$$, $$Comprei uma roupa de um rosa como o das cerejeiras.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$母は天使____人です。$$, $$Minha mãe é uma pessoa que parece um anjo.$$),
        (2, $$私もあなた____先生になりたいです。$$, $$Eu também quero ser um professor como você.$$),
        (3, $$冗談____話だけど、本当なんだ。$$, $$Parece uma piada, mas é verdade.$$),
        (4, $$わあ、お城____家ですね。$$, $$Nossa, é uma casa que parece um castelo!$$),
        (5, $$雪____白いケーキを作りました。$$, $$Fiz um bolo branco como a neve.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-45', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$みたいな$$),
        (2, $$みたいな$$),
        (3, $$みたいな$$),
        (4, $$みたいな$$),
        (5, $$みたいな$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-46 — 〜みたいに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-46',
    'grammar',
    'N4',
    $$〜みたいに$$,
    $$mitai ni$$,
    $$Como / Igual a / Do jeito de$$,
    $$みたいに é usado antes de verbos e adjetivos para dizer que algo é feito ou acontece de um jeito parecido com outra coisa. Equivale a "como", "igual a" ou "do jeito de".

Como みたい funciona como um adjetivo な, ele recebe に para virar advérbio e modificar uma ação ou uma característica. Assim: "falar como um japonês", "quente como no verão".

Ele pode expressar uma comparação, mostrando que algo se parece com outra coisa sem ser, ou um modelo a seguir, como "quero cantar bem como minha irmã".

É casual e muito comum na conversa. Em textos formais, o equivalente é のように.$$,
    $$Para reforçar a comparação, é comum colocar まるで antes, como em "como se fosse...".

A versão formal é のように: 鳥のように飛ぶ.

Cuidado com elogios usando みたいに. Dizer que alguém fala "como um japonês" é um elogio comum, mas em alguns contextos pode soar como surpresa exagerada.$$,
    $$Substantivo + みたいに + Verbo / Adjetivo
Verbo / Adjetivo (forma simples) + みたいに + Verbo / Adjetivo$$,
    $$みたいに$$,
    $$みたいに$$,
    ARRAY['みたい', 'に']::text[],
    ARRAY['みたいに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-46', $$彼は日本人みたいに日本語を話します。$$, $$かれはにほんじんみたいににほんごをはなします。$$, $$Ele fala japonês como um japonês.$$),
    ('n4-grammar-46', $$子供みたいに泣かないでよ。$$, $$こどもみたいになかないでよ。$$, $$Não chore como uma criança.$$),
    ('n4-grammar-46', $$今日は夏みたいに暑い。$$, $$きょうはなつみたいにあつい。$$, $$Hoje está quente como no verão.$$),
    ('n4-grammar-46', $$私も姉みたいに上手に歌いたい。$$, $$わたしもあねみたいにじょうずにうたいたい。$$, $$Também quero cantar bem como minha irmã mais velha.$$),
    ('n4-grammar-46', $$魚みたいに速く泳げたらいいな。$$, $$さかなみたいにはやくおよげたらいいな。$$, $$Seria bom se eu pudesse nadar rápido como um peixe.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女はモデル____きれいだ。$$, $$Ela é bonita como uma modelo.$$),
        (2, $$鳥____空を飛びたい。$$, $$Quero voar pelo céu como um pássaro.$$),
        (3, $$今日は春____暖かいですね。$$, $$Hoje está quentinho como na primavera, né?$$),
        (4, $$うちの猫は、犬____私についてくる。$$, $$Nosso gato me segue como se fosse um cachorro.$$),
        (5, $$プロ____上手に料理ができたらいいなあ。$$, $$Seria ótimo saber cozinhar bem como um profissional.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-46', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$みたいに$$),
        (2, $$みたいに$$),
        (3, $$みたいに$$),
        (4, $$みたいに$$),
        (5, $$みたいに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-47 — 〜も（強調）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-47',
    'grammar',
    'N4',
    $$〜も（強調）$$,
    $$mo (kyouchou)$$,
    $$Nada menos que / Até / Nem um sequer$$,
    $$No N4, も aparece depois de números e quantidades com um sentido de ênfase, diferente do "também" do N5.

Em frases afirmativas, número + も mostra que a quantidade é maior do que o esperado. Equivale a "nada menos que", "até" ou "todo esse tanto". Por exemplo, estudar oito horas, ter mil livros.

Em frases negativas, "um" + contador + も significa "nem um sequer". Por exemplo, não ter nem um iene, não ter rido nem uma vez. A negação fica total.

Nos dois casos, quem fala está expressando surpresa ou destacando que a quantidade é extrema, para mais ou para menos.$$,
    $$A entonação ajuda a mostrar surpresa: o número costuma ser destacado na fala.

Para expressar que a quantidade é pequena, o japonês usa しか〜ない ("só"). も faz o contrário: destaca que é muito.

Expressões como 一人も, 一つも e 一度も são muito frequentes em frases negativas.$$,
    $$Número + Contador + も + Verbo afirmativo (nada menos que)
一 + Contador + も + Verbo negativo (nem um sequer)
一度も / 一回も + negativo (nem uma vez)
少しも + negativo (nem um pouco)$$,
    $$も$$,
    $$も$$,
    ARRAY['も']::text[],
    ARRAY['も']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-47', $$昨日は八時間も勉強しました。$$, $$きのうははちじかんもべんきょうしました。$$, $$Ontem estudei oito horas inteiras.$$),
    ('n4-grammar-47', $$彼は本を千冊も持っている。$$, $$かれはほんをせんさつももっている。$$, $$Ele tem nada menos que mil livros.$$),
    ('n4-grammar-47', $$パーティーに百人も来ました。$$, $$パーティーにひゃくにんもきました。$$, $$Vieram até cem pessoas à festa.$$),
    ('n4-grammar-47', $$財布にお金が一円もない。$$, $$さいふにおかねがいちえんもない。$$, $$Não tenho nem um iene na carteira.$$),
    ('n4-grammar-47', $$今日は一度も笑わなかった。$$, $$きょうはいちどもわらわなかった。$$, $$Hoje não ri nem uma vez.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅まで二時間____かかりました。$$, $$Levou duas horas inteiras até a estação.$$),
        (2, $$あのかばんは五十万円____するそうです。$$, $$Dizem que aquela bolsa custa nada menos que quinhentos mil ienes.$$),
        (3, $$テストの漢字は一つ____わかりませんでした。$$, $$Não entendi nem um kanji da prova.$$),
        (4, $$彼は一日に十杯____コーヒーを飲む。$$, $$Ele toma até dez xícaras de café por dia.$$),
        (5, $$夏休みの間、一日____休みませんでした。$$, $$Durante as férias de verão, não descansei nem um dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-47', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$も$$),
        (2, $$も$$),
        (3, $$も$$),
        (4, $$も$$),
        (5, $$も$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-48 — 〜な（禁止）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-48',
    'grammar',
    'N4',
    $$〜な（禁止）$$,
    $$na (kinshi)$$,
    $$Não faça! / Proibido$$,
    $$な, depois do verbo na forma de dicionário, forma uma proibição forte e direta. Equivale a "não faça!" ou "proibido".

É uma ordem negativa, sem nenhuma suavização. Por isso, soa muito forte e até rude em conversas comuns.

Ela aparece em situações específicas: placas e avisos curtos, ordens de pais para filhos em momentos de perigo, falas entre amigos homens muito próximos, treinadores e esportes, e em citações de ordens dentro de frases.

Na fala educada, a forma correta de pedir que alguém não faça algo é ないでください.$$,
    $$Não confunda essa な com a partícula なあ, de emoção, nem com o な dos adjetivos. Aqui ela vem logo depois do verbo na forma de dicionário.

Em placas, é comum ver frases curtas como 入るな ou 触るな, que soam como avisos claros e diretos.

O oposto, a ordem afirmativa forte, é a forma imperativa (命令形), como 行け ou 食べろ.$$,
    $$Verbo na forma de dicionário + な

Mais suave (informal): Verbo na forma de dicionário + なよ
Educado: Verbo na forma ない + でください$$,
    $$な$$,
    $$るな|うな|くな|ぐな|すな|つな|ぬな|ぶな|むな$$,
    ARRAY['な']::text[],
    ARRAY['な', 'なよ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-48', $$ここで泳ぐな。$$, $$ここでおよぐな。$$, $$Não nade aqui!$$),
    ('n4-grammar-48', $$危ないから、触るな。$$, $$あぶないから、さわるな。$$, $$É perigoso, não toque!$$),
    ('n4-grammar-48', $$大丈夫だから、心配するな。$$, $$だいじょうぶだから、しんぱいするな。$$, $$Está tudo bem, não se preocupe.$$),
    ('n4-grammar-48', $$「廊下を走るな」と先生に言われた。$$, $$「ろうかをはしるな」とせんせいにいわれた。$$, $$O professor me disse: "Não corra no corredor!"$$),
    ('n4-grammar-48', $$最後まで、絶対に諦めるな。$$, $$さいごまで、ぜったいにあきらめるな。$$, $$Nunca desista até o fim!$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$うるさい。大きい声を出す____。$$, $$Que barulho! Não grite!$$),
        (2, $$看板に「芝生に入る____」と書いてある。$$, $$Na placa está escrito "Proibido pisar na grama".$$),
        (3, $$もう泣く____。大丈夫だから。$$, $$Pare de chorar. Está tudo bem.$$),
        (4, $$この部屋には入る____と言われました。$$, $$Me disseram para não entrar neste quarto.$$),
        (5, $$明日の約束、忘れる____よ。$$, $$Não esqueça o compromisso de amanhã, hein!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-48', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$な$$),
        (2, $$な$$),
        (3, $$な$$),
        (4, $$な$$),
        (5, $$な$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-49 — 〜など
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-49',
    'grammar',
    'N4',
    $$〜など$$,
    $$nado$$,
    $$Etc. / E outros / Coisas como$$,
    $$など é usado depois de substantivos para indicar que existem outras coisas além das mencionadas. Equivale a "etc.", "e outros" ou "coisas como".

É muito comum no final de uma lista feita com や, reforçando a ideia de que os itens citados são apenas exemplos. Mas também pode vir depois de um único substantivo.

Depois de など, vêm as partículas normalmente, como が, を, に e の.

など também é usado para dar uma sugestão de forma suave, como oferecer "um chá ou algo assim", deixando a outra pessoa à vontade para escolher.$$,
    $$Na fala casual, など costuma virar なんか, que também pode ter um tom de desprezo em alguns contextos, como "uma coisa dessas".

など também aparece com sentido de modéstia ou desvalorização, como dizer que algo seu não é grande coisa. Esse uso é mais avançado.

Em textos formais, など aparece muito em listas de exemplos, como em instruções e explicações.$$,
    $$Substantivo A + や + Substantivo B + など + partícula
Substantivo + など + partícula
Substantivo + など + の + Substantivo
Substantivo + など + いかがですか (sugestão suave)$$,
    $$など$$,
    $$など$$,
    ARRAY['など']::text[],
    ARRAY['など']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-49', $$机の上に本やノートなどがあります。$$, $$つくえのうえにほんやノートなどがあります。$$, $$Em cima da mesa tem livros, cadernos e outras coisas.$$),
    ('n4-grammar-49', $$旅行で京都や奈良などに行きました。$$, $$りょこうできょうとやならなどにいきました。$$, $$Na viagem, fui a lugares como Kyoto e Nara.$$),
    ('n4-grammar-49', $$私はりんごやバナナなどの果物が好きです。$$, $$わたしはりんごやバナナなどのくだものがすきです。$$, $$Gosto de frutas como maçã e banana.$$),
    ('n4-grammar-49', $$週末は掃除や洗濯などをします。$$, $$しゅうまつはそうじやせんたくなどをします。$$, $$No fim de semana, faço limpeza, lavo roupa e outras coisas.$$),
    ('n4-grammar-49', $$お茶などいかがですか。$$, $$おちゃなどいかがですか。$$, $$Aceita um chá ou algo assim?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冷蔵庫に肉や魚____が入っています。$$, $$Na geladeira tem carne, peixe e outras coisas.$$),
        (2, $$スポーツはサッカーやテニス____をします。$$, $$De esportes, jogo futebol, tênis e outros.$$),
        (3, $$学校で日本語や英語____を勉強しています。$$, $$Na escola estudo japonês, inglês e outras matérias.$$),
        (4, $$東京や大阪____の大きい町に住みたい。$$, $$Quero morar numa cidade grande como Tóquio ou Osaka.$$),
        (5, $$食後に、コーヒー____いかがですか。$$, $$Depois da refeição, aceita um café ou algo assim?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-49', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$など$$),
        (2, $$など$$),
        (3, $$など$$),
        (4, $$など$$),
        (5, $$など$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-50 — 〜ながら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-50',
    'grammar',
    'N4',
    $$〜ながら$$,
    $$nagara$$,
    $$Enquanto / Ao mesmo tempo que$$,
    $$ながら é usado para dizer que uma pessoa faz duas ações ao mesmo tempo. Equivale a "enquanto" ou "ao mesmo tempo que".

Ele é formado tirando ます do verbo e acrescentando ながら. A ação com ながら é a secundária, que acompanha. A ação principal vem no final da frase.

Por exemplo, em "estudar ouvindo música", a ação principal é estudar, e ouvir música é o que acompanha.

As duas ações precisam ser feitas pela mesma pessoa. Para ações de pessoas diferentes ao mesmo tempo, usa-se 間 ou とき.

Também é usado para atividades de longo prazo feitas em paralelo, como trabalhar enquanto estuda na faculdade.$$,
    $$Um erro comum é colocar a ação principal com ながら. Pense sempre: a ação mais importante fica no final.

ながら só funciona com o mesmo sujeito. Para "enquanto minha mãe cozinhava, eu limpei", usa-se 間.

Em níveis mais avançados, ながら também pode significar "apesar de", como em 残念ながら (infelizmente).$$,
    $$Verbo na forma ます sem ます + ながら + Verbo principal$$,
    $$ながら$$,
    $$ながら$$,
    ARRAY['ながら']::text[],
    ARRAY['ながら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-50', $$音楽を聞きながら勉強します。$$, $$おんがくをききながらべんきょうします。$$, $$Estudo ouvindo música.$$),
    ('n4-grammar-50', $$テレビを見ながらご飯を食べないでください。$$, $$テレビをみながらごはんをたべないでください。$$, $$Não coma vendo TV, por favor.$$),
    ('n4-grammar-50', $$歩きながら電話するのは危ないです。$$, $$あるきながらでんわするのはあぶないです。$$, $$É perigoso falar ao telefone enquanto anda.$$),
    ('n4-grammar-50', $$彼は働きながら大学に通っています。$$, $$かれははたらきながらだいがくにかよっています。$$, $$Ele trabalha enquanto faz faculdade.$$),
    ('n4-grammar-50', $$笑いながら話す人が好きです。$$, $$わらいながらはなすひとがすきです。$$, $$Gosto de pessoas que falam sorrindo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎朝、コーヒーを飲み____新聞を読みます。$$, $$Toda manhã, leio o jornal tomando café.$$),
        (2, $$母は歌を歌い____料理をします。$$, $$Minha mãe cozinha cantando.$$),
        (3, $$運転し____携帯電話を使ってはいけません。$$, $$Não se deve usar o celular enquanto dirige.$$),
        (4, $$彼女は子供を育て____仕事を続けています。$$, $$Ela continua trabalhando enquanto cria os filhos.$$),
        (5, $$地図を見____歩きました。$$, $$Andei olhando o mapa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-50', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ながら$$),
        (2, $$ながら$$),
        (3, $$ながら$$),
        (4, $$ながら$$),
        (5, $$ながら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-51 — なかなか〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-51',
    'grammar',
    'N4',
    $$なかなか〜ない$$,
    $$nakanaka ~ nai$$,
    $$Não... de jeito nenhum / Custa a / Demora para$$,
    $$なかなか〜ない é usado para dizer que algo não acontece, ou demora muito para acontecer, mesmo que a pessoa espere ou se esforce. Equivale a "custa a...", "demora para..." ou "não... de jeito nenhum".

なかなか vem antes do verbo, e o verbo fica na forma negativa. A ideia é de frustração ou dificuldade: a pessoa quer que algo aconteça, mas não acontece com facilidade.

É muito usado com ações que se espera que aconteçam, como o ônibus chegar, a chuva parar, conseguir dormir, decorar algo ou um resfriado melhorar.

Com a forma potencial, ele expressa dificuldade para conseguir fazer algo, como "não consigo decorar de jeito nenhum".$$,
    $$Em frases afirmativas, なかなか tem outro sentido: "bastante", "muito", geralmente como elogio, como em "é bem gostoso". Esse uso aparece no N3.

Comparado a あまり〜ない, que indica pouca frequência ou intensidade, なかなか〜ない destaca a dificuldade e a espera.

É comum usar なかなか com てくれない para reclamar que alguém ou algo não colabora, como uma criança que não dorme.$$,
    $$なかなか + Verbo na forma negativa
なかなか + Verbo potencial negativo (não consegue... de jeito nenhum)$$,
    $$なかなか$$,
    $$なかなか$$,
    ARRAY['なかなか', 'ない']::text[],
    ARRAY['なかなか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-51', $$バスがなかなか来ません。$$, $$バスがなかなかきません。$$, $$O ônibus está demorando muito para chegar.$$),
    ('n4-grammar-51', $$この漢字はなかなか覚えられない。$$, $$このかんじはなかなかおぼえられない。$$, $$Não consigo decorar este kanji de jeito nenhum.$$),
    ('n4-grammar-51', $$昨日の夜は、なかなか眠れませんでした。$$, $$きのうのよるは、なかなかねむれませんでした。$$, $$Ontem à noite, custei a pegar no sono.$$),
    ('n4-grammar-51', $$仕事がなかなか終わらない。$$, $$しごとがなかなかおわらない。$$, $$O trabalho não termina nunca.$$),
    ('n4-grammar-51', $$風邪がなかなか治らなくて困っています。$$, $$かぜがなかなかなおらなくてこまっています。$$, $$O resfriado não passa de jeito nenhum, e estou sofrendo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨が____やみませんね。$$, $$A chuva não para de jeito nenhum, né?$$),
        (2, $$毎日勉強しているのに、日本語が____上手になりません。$$, $$Estudo todo dia, mas meu japonês custa a melhorar.$$),
        (3, $$子供が____寝てくれない。$$, $$A criança não dorme de jeito nenhum.$$),
        (4, $$彼からの返事が____来ない。$$, $$A resposta dele está demorando muito para chegar.$$),
        (5, $$この問題は難しくて、答えが____わからない。$$, $$Esta questão é difícil, e não consigo achar a resposta de jeito nenhum.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-51', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なかなか$$),
        (2, $$なかなか$$),
        (3, $$なかなか$$),
        (4, $$なかなか$$),
        (5, $$なかなか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-52 — 〜なければいけない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-52',
    'grammar',
    'N4',
    $$〜なければいけない$$,
    $$nakereba ikenai$$,
    $$Ter que / Precisar / Dever$$,
    $$なければいけない é usado para dizer que algo é obrigatório ou necessário. Equivale a "ter que" ou "precisar".

Ela vem da condicional なければ ("se não fizer") + いけない ("não está bem"). A ideia literal é "se não fizer, não está bem", ou seja, é preciso fazer.

なければいけない costuma expressar uma obrigação ligada à situação ou ao senso pessoal de dever, como compromissos, tarefas e coisas que a pessoa sente que precisa fazer. Por isso, é muito comum na conversa.

Para formar, tira-se o い da forma ない e acrescenta-se ければいけない. Na fala casual, なければ costuma virar なきゃ.$$,
    $$なければいけない e なくてはいけない têm o mesmo sentido. A primeira aparece um pouco mais na conversa do dia a dia.

Na fala muito informal, a frase pode terminar só com なきゃ, omitindo いけない.

Para dizer que algo não é necessário, o oposto é なくてもいい.$$,
    $$Verbo na forma ない sem い + ければいけない
Adjetivo い sem い + くなければいけない
Substantivo / Adjetivo な + でなければいけない

Educado: なければいけません
Passado: なければいけなかった / なければいけませんでした
Fala casual: なきゃいけない / なきゃ$$,
    $$なければいけない$$,
    $$なければいけない|なければいけません|なければいけなかった|なきゃいけない$$,
    ARRAY['なければ', 'いけない']::text[],
    ARRAY['なければいけない', 'なければいけません', 'なければいけなかった', 'なきゃいけない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-52', $$明日は早く起きなければいけません。$$, $$あしたははやくおきなければいけません。$$, $$Amanhã tenho que acordar cedo.$$),
    ('n4-grammar-52', $$今日は宿題をしなければいけない。$$, $$きょうはしゅくだいをしなければいけない。$$, $$Hoje tenho que fazer a lição.$$),
    ('n4-grammar-52', $$毎日薬を飲まなければいけません。$$, $$まいにちくすりをのまなければいけません。$$, $$Tenho que tomar remédio todo dia.$$),
    ('n4-grammar-52', $$昨日は残業しなければいけなかった。$$, $$きのうはざんぎょうしなければいけなかった。$$, $$Ontem tive que fazer hora extra.$$),
    ('n4-grammar-52', $$あ、もう帰らなきゃいけない。$$, $$あ、もうかえらなきゃいけない。$$, $$Ah, já tenho que ir embora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日中にこの本を返さ____。$$, $$Tenho que devolver este livro ainda hoje.$$),
        (2, $$来週までに、引っ越しの準備をし____。$$, $$Tenho que preparar a mudança até a semana que vem.$$),
        (3, $$試験の前に、もっと勉強し____。$$, $$Antes da prova, tenho que estudar mais.$$),
        (4, $$昨日は病院に行か____。$$, $$Ontem tive que ir ao hospital.$$),
        (5, $$明日は六時に起き____から、早く寝ます。$$, $$Amanhã tenho que acordar às seis, então vou dormir cedo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-52', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なければいけません$$),
        (1, $$なければいけない$$),
        (2, $$なければいけません$$),
        (2, $$なければいけない$$),
        (3, $$なければいけません$$),
        (3, $$なければいけない$$),
        (4, $$なければいけなかった$$),
        (4, $$なければいけませんでした$$),
        (5, $$なければいけない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-53 — 〜なければならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-53',
    'grammar',
    'N4',
    $$〜なければならない$$,
    $$nakereba naranai$$,
    $$Ter que / Ser obrigatório / Dever$$,
    $$なければならない também expressa obrigação, como なければいけない. Equivale a "ter que", "ser obrigatório" ou "dever".

A ideia literal é "se não fizer, não dá". O tom, porém, é mais formal e objetivo. Por isso, ela é muito usada para obrigações gerais, regras, leis, deveres sociais e necessidades que não dependem da vontade de quem fala.

Também é a forma mais comum em textos escritos, notícias, regulamentos e discursos.

A formação é igual à de なければいけない: tira-se o い da forma ない e acrescenta-se ければならない.$$,
    $$Na prática, なければならない e なければいけない muitas vezes podem ser trocadas. A diferença é o tom: ならない é mais formal e objetivo; いけない é mais pessoal.

Em leis e regulamentos, é muito comum ver a forma escrita ねばならない, mais literária.

Na fala, a forma longa pode soar rígida. Entre amigos, prefere-se なきゃ.$$,
    $$Verbo na forma ない sem い + ければならない
Adjetivo い sem い + くなければならない
Substantivo / Adjetivo な + でなければならない

Educado: なければなりません
Passado: なければならなかった / なければなりませんでした$$,
    $$なければならない$$,
    $$なければならない|なければなりません|なければならなかった$$,
    ARRAY['なければ', 'ならない']::text[],
    ARRAY['なければならない', 'なければなりません', 'なければならなかった', 'なければなりませんでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-53', $$学生は学校の規則を守らなければならない。$$, $$がくせいはがっこうのきそくをまもらなければならない。$$, $$Os alunos devem seguir as regras da escola.$$),
    ('n4-grammar-53', $$外国人は在留カードを持っていなければなりません。$$, $$がいこくじんはざいりゅうカードをもっていなければなりません。$$, $$Os estrangeiros devem portar o cartão de residência.$$),
    ('n4-grammar-53', $$車に乗るときは、シートベルトをしなければならない。$$, $$くるまにのるときは、シートベルトをしなければならない。$$, $$Quando se anda de carro, é obrigatório usar o cinto de segurança.$$),
    ('n4-grammar-53', $$来月までにビザを更新しなければなりません。$$, $$らいげつまでにビザをこうしんしなければなりません。$$, $$Tenho que renovar o visto até o mês que vem.$$),
    ('n4-grammar-53', $$昨日は雨の中を歩いて帰らなければならなかった。$$, $$きのうはあめのなかをあるいてかえらなければならなかった。$$, $$Ontem tive que voltar para casa a pé debaixo de chuva.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$税金は必ず払わ____。$$, $$Os impostos têm que ser pagos sem falta.$$),
        (2, $$選手は毎日練習し____。$$, $$Os atletas têm que treinar todos os dias.$$),
        (3, $$国民は法律を守ら____。$$, $$Os cidadãos devem cumprir a lei.$$),
        (4, $$先週は毎日早く出勤し____。$$, $$Semana passada, tive que chegar cedo ao trabalho todo dia.$$),
        (5, $$この書類は、黒いペンで書か____。$$, $$Este documento deve ser preenchido com caneta preta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-53', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なければならない$$),
        (1, $$なければなりません$$),
        (2, $$なければならない$$),
        (2, $$なければなりません$$),
        (3, $$なければならない$$),
        (3, $$なければなりません$$),
        (4, $$なければならなかった$$),
        (4, $$なければなりませんでした$$),
        (5, $$なければならない$$),
        (5, $$なければなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-54 — 〜なら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-54',
    'grammar',
    'N4',
    $$〜なら$$,
    $$nara$$,
    $$Se / Se for o caso de / Quanto a$$,
    $$なら é uma forma condicional usada para responder ou reagir a algo: uma situação mencionada pelo outro, uma intenção ou um tema da conversa. Equivale a "se", "se for o caso de" ou "quanto a".

O uso mais característico é dar conselhos ou opiniões sobre algo que a outra pessoa disse. Por exemplo, se alguém diz que quer ir ao Japão, você responde: "se for ao Japão, recomendo Kyoto".

Outro uso é apresentar um tema, com o sentido de "falando de...", "quanto a...". Por exemplo, "computadores, aquela loja é barata".

Diferente de たら, com なら a condição não precisa ter acontecido antes. Por isso, a segunda parte pode ser algo que acontece antes da primeira, como preparar algo antes de viajar.

なら vem depois de substantivos e adjetivos な diretamente, e depois da forma simples de verbos e adjetivos い.$$,
    $$なら é muito natural em conversas quando se responde a algo que o outro acabou de dizer.

Com verbos, a frase com なら pode significar "se você vai fazer isso...", e o conselho pode ser algo para fazer antes, como levar um guarda-chuva se for sair.

A forma のなら também existe, com o mesmo sentido e um tom mais explicativo.$$,
    $$Substantivo + なら
Adjetivo な + なら
Verbo (forma simples) + なら
Adjetivo い + なら$$,
    $$なら$$,
    $$なら$$,
    ARRAY['なら']::text[],
    ARRAY['なら', 'のなら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-54', $$日本へ行くなら、京都がおすすめです。$$, $$にほんへいくなら、きょうとがおすすめです。$$, $$Se você vai ao Japão, recomendo Kyoto.$$),
    ('n4-grammar-54', $$「パソコンが欲しいんです。」「パソコンなら、あの店が安いですよ。」$$, $$「パソコンがほしいんです。」「パソコンなら、あのみせがやすいですよ。」$$, $$"Quero um computador." "Se é computador, aquela loja é barata."$$),
    ('n4-grammar-54', $$疲れているなら、休んだほうがいい。$$, $$つかれているなら、やすんだほうがいい。$$, $$Se você está cansado, é melhor descansar.$$),
    ('n4-grammar-54', $$明日雨なら、試合は中止です。$$, $$あしたあめなら、しあいはちゅうしです。$$, $$Se chover amanhã, a partida será cancelada.$$),
    ('n4-grammar-54', $$あなたが行くなら、私も行きます。$$, $$あなたがいくなら、わたしもいきます。$$, $$Se você for, eu também vou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「すしが食べたい。」「すし____、駅前の店がいいよ。」$$, $$"Quero comer sushi." "Se é sushi, a loja em frente à estação é boa."$$),
        (2, $$車で行く____、お酒は飲まないでください。$$, $$Se for de carro, não beba álcool.$$),
        (3, $$暇____、ちょっと手伝ってくれませんか。$$, $$Se você estiver livre, pode me ajudar um pouco?$$),
        (4, $$英語の先生を探している____、いい人を知っていますよ。$$, $$Se você está procurando um professor de inglês, conheço uma pessoa boa.$$),
        (5, $$君がそう言う____、信じるよ。$$, $$Se você diz isso, eu acredito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-54', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なら$$),
        (2, $$なら$$),
        (3, $$なら$$),
        (4, $$なら$$),
        (5, $$なら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-55 — 〜なさい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-55',
    'grammar',
    'N4',
    $$〜なさい$$,
    $$nasai$$,
    $$Faça! / Vá fazer (ordem)$$,
    $$なさい é usado para dar ordens. Equivale a "faça!" ou ao imperativo com tom de autoridade.

Ele é formado tirando ます do verbo e acrescentando なさい. Embora venha de なさる, que é um verbo respeitoso, なさい não soa respeitoso: ele é usado por quem está em posição de autoridade.

Os usos mais comuns são pais falando com filhos, professores falando com alunos e instruções em provas e exercícios escritos.

É mais suave que a forma imperativa (命令形), mas mais forte que てください. Por isso, nunca é usado com superiores ou com pessoas mais velhas.$$,
    $$Em provas japonesas, como o JLPT, as instruções usam muito なさい, como em "escolha a resposta correta".

Uma forma ainda mais suave, também usada por pais, é なさいね ou なさいよ.

Nas expressões おかえりなさい e おやすみなさい, なさい aparece com sentido de cumprimento, sem tom de ordem.$$,
    $$Verbo na forma ます sem ます + なさい
Substantivo de ação + しなさい$$,
    $$なさい$$,
    $$なさい$$,
    ARRAY['なさい']::text[],
    ARRAY['なさい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-55', $$もう七時よ。早く起きなさい。$$, $$もうしちじよ。はやくおきなさい。$$, $$Já são sete horas. Levante logo!$$),
    ('n4-grammar-55', $$ちゃんと野菜を食べなさい。$$, $$ちゃんとやさいをたべなさい。$$, $$Coma direito as verduras.$$),
    ('n4-grammar-55', $$授業中ですよ。静かにしなさい。$$, $$じゅぎょうちゅうですよ。しずかにしなさい。$$, $$Estamos em aula. Fiquem em silêncio.$$),
    ('n4-grammar-55', $$次の質問に答えなさい。$$, $$つぎのしつもんにこたえなさい。$$, $$Responda às perguntas a seguir.$$),
    ('n4-grammar-55', $$宿題をしてから遊びなさい。$$, $$しゅくだいをしてからあそびなさい。$$, $$Vá brincar depois de fazer a lição.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$もう九時だよ。早く寝____。$$, $$Já são nove horas. Vá dormir!$$),
        (2, $$ご飯の前に、手を洗い____。$$, $$Lave as mãos antes de comer.$$),
        (3, $$正しい答えを選び____。$$, $$Escolha a resposta correta.$$),
        (4, $$部屋が汚いわね。片付け____。$$, $$Seu quarto está bagunçado. Arrume-o!$$),
        (5, $$遅れないように、急ぎ____。$$, $$Apresse-se para não se atrasar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-55', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なさい$$),
        (2, $$なさい$$),
        (3, $$なさい$$),
        (4, $$なさい$$),
        (5, $$なさい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-56 — なさる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-56',
    'grammar',
    'N4',
    $$なさる$$,
    $$nasaru$$,
    $$Fazer (respeitoso)$$,
    $$なさる é o verbo respeitoso (尊敬語) usado no lugar de する (fazer), quando o sujeito é alguém que merece respeito, como um cliente, um professor ou um superior.

No 尊敬語, quem fala eleva a pessoa que faz a ação. Por isso, なさる nunca é usado para falar das próprias ações. Para isso, usa-se a forma humilde いたす.

Com verbos do tipo "substantivo + する", basta trocar する por なさる, como em 研究なさる e 結婚なさる.

Na forma ます, ele é irregular: em vez de なさります, diz-se なさいます. É muito comum em atendimento ao cliente, como na pergunta "o que o senhor vai querer?".$$,
    $$Lembre o par: する → なさる (respeitoso) e する → いたす (humilde).

Em restaurantes e lojas, 何になさいますか é a forma educada de perguntar o que o cliente vai escolher.

Também existe a forma お / ご + verbo + になる, que tem função respeitosa parecida, como em お待ちになる.$$,
    $$Pessoa respeitada + が / は + Substantivo + を + なさる
Substantivo de ação + なさる

Educado: なさいます (forma irregular)
Passado: なさった / なさいました
Pergunta: 何になさいますか$$,
    $$なさる$$,
    $$なさ$$,
    ARRAY['なさる']::text[],
    ARRAY['なさる', 'なさいます', 'なさった', 'なさいました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-56', $$社長は週末によくゴルフをなさいます。$$, $$しゃちょうはしゅうまつによくゴルフをなさいます。$$, $$O presidente costuma jogar golfe nos fins de semana.$$),
    ('n4-grammar-56', $$先生は何を研究なさっているのですか。$$, $$せんせいはなにをけんきゅうなさっているのですか。$$, $$O que o professor está pesquisando?$$),
    ('n4-grammar-56', $$週末は何をなさいますか。$$, $$しゅうまつはなにをなさいますか。$$, $$O que o senhor vai fazer no fim de semana?$$),
    ('n4-grammar-56', $$お客様、お飲み物はどちらになさいますか。$$, $$おきゃくさま、おのみものはどちらになさいますか。$$, $$Senhor, qual bebida vai querer?$$),
    ('n4-grammar-56', $$部長は来月、結婚なさるそうです。$$, $$ぶちょうはらいげつ、けっこんなさるそうです。$$, $$Dizem que o gerente vai se casar no mês que vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生はよく旅行を____か。$$, $$O professor costuma viajar?$$),
        (2, $$社長は今、電話を____います。$$, $$O presidente está ao telefone agora.$$),
        (3, $$お飲み物は何に____か。$$, $$O que o senhor vai querer de bebida?$$),
        (4, $$田中様は先月、退院____そうです。$$, $$Dizem que o senhor Tanaka teve alta no mês passado.$$),
        (5, $$明日、課長は何時に出発____んですか。$$, $$Amanhã, a que horas o chefe de seção vai partir?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-56', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なさいます$$),
        (2, $$なさって$$),
        (3, $$なさいます$$),
        (4, $$なさった$$),
        (5, $$なさる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-57 — 〜に気がつく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-57',
    'grammar',
    'N4',
    $$〜に気がつく$$,
    $$ni ki ga tsuku$$,
    $$Perceber / Notar / Dar-se conta de$$,
    $$に気がつく é usado para dizer que alguém percebeu ou notou algo. Equivale a "perceber", "notar" ou "dar-se conta de".

A coisa percebida vem antes de に. Pode ser um substantivo, como um erro ou uma mudança, ou uma frase inteira transformada em substantivo com こと, como "perceber que esqueci o guarda-chuva".

A expressão indica um momento de percepção: antes a pessoa não sabia, e de repente notou. Por isso, é muito usada no passado, com 気がついた.

A forma curta 気づく tem exatamente o mesmo sentido e é muito comum tanto na fala quanto na escrita.$$,
    $$気がつく também pode descrever uma pessoa atenciosa, que percebe o que os outros precisam, como em よく気がつく人.

Não confunda com 気をつける, que significa "tomar cuidado". A partícula e o verbo mudam o sentido.

Em histórias, a frase 気がつくと significa "quando dei por mim..." e introduz algo que aconteceu sem a pessoa perceber.$$,
    $$Substantivo + に + 気がつく
Frase (forma simples) + こと + に + 気がつく

Forma curta: に気づく
Passado: に気がついた / に気がつきました
Negativo: に気がつかない

Escrita: 気がつく / 気が付く / 気づく / 気付く$$,
    $$に気がつく$$,
    $$気がつ|気が付|気づ|気付$$,
    ARRAY['に', '気', 'が', 'つく']::text[],
    ARRAY['に気がつく', 'に気づく', 'に気が付く', 'に気付く']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-57', $$財布がないことに気がつきました。$$, $$さいふがないことにきがつきました。$$, $$Percebi que estava sem a carteira.$$),
    ('n4-grammar-57', $$彼は自分の間違いに気がついた。$$, $$かれはじぶんのまちがいにきがついた。$$, $$Ele percebeu o próprio erro.$$),
    ('n4-grammar-57', $$電車を降りてから、傘を忘れたことに気がついた。$$, $$でんしゃをおりてから、かさをわすれたことにきがついた。$$, $$Depois de descer do trem, percebi que tinha esquecido o guarda-chuva.$$),
    ('n4-grammar-57', $$先生は私の変化にすぐ気づいた。$$, $$せんせいはわたしのへんかにすぐきづいた。$$, $$O professor notou logo a minha mudança.$$),
    ('n4-grammar-57', $$家に着いて、鍵をかけていないことに気がつきました。$$, $$いえについて、かぎをかけていないことにきがつきました。$$, $$Cheguei em casa e me dei conta de que não tinha trancado a porta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅に着いて、切符をなくしたことに____。$$, $$Cheguei à estação e percebi que tinha perdido a passagem.$$),
        (2, $$誰も私のミスに____なかった。$$, $$Ninguém percebeu o meu erro.$$),
        (3, $$彼女が髪を切ったことに、すぐ____。$$, $$Percebi logo que ela tinha cortado o cabelo.$$),
        (4, $$後ろに人がいることに____、びっくりした。$$, $$Percebi que havia alguém atrás de mim e levei um susto.$$),
        (5, $$間違いに____ら、すぐ直してください。$$, $$Se notar algum erro, corrija imediatamente, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-57', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$気がつきました$$),
        (1, $$気がついた$$),
        (1, $$気づきました$$),
        (1, $$気づいた$$),
        (2, $$気がつか$$),
        (2, $$気づか$$),
        (3, $$気がつきました$$),
        (3, $$気がついた$$),
        (3, $$気づきました$$),
        (3, $$気づいた$$),
        (4, $$気がついて$$),
        (4, $$気づいて$$),
        (5, $$気がついた$$),
        (5, $$気づいた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-58 — 〜に見える
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-58',
    'grammar',
    'N4',
    $$〜に見える$$,
    $$ni mieru$$,
    $$Parecer / Dar a impressão de$$,
    $$に見える é usado para dizer como algo ou alguém parece, a partir da aparência. Equivale a "parecer" ou "dar a impressão de".

O julgamento é visual: quem fala está descrevendo a impressão que tem ao olhar. Muitas vezes, a aparência é diferente da realidade, como alguém que parece jovem, mas não é.

A forma de ligar depende da palavra. Com substantivos e adjetivos な, usa-se に antes de 見える. Com adjetivos い, troca-se o い por く, formando く見える.

Diferente de そうだ (aparência de algo prestes a acontecer ou de uma qualidade), 見える fala do aspecto visual geral, e é muito usado para comparar aparência com idade, profissão ou estado.$$,
    $$Para dizer que alguém parece mais jovem que a idade real, é muito comum a frase 年より若く見える.

見える sozinho também significa "ser visível", "dar para ver", como em 山が見える. O contexto mostra qual sentido é usado.

Para aparência baseada em algo que se ouviu, usa-se そうだ (hearsay) ou らしい, e não 見える.$$,
    $$Substantivo + に + 見える
Adjetivo な + に + 見える
Adjetivo い sem い + く + 見える

Educado: に見えます / く見えます
Escrita: 見える / みえる$$,
    $$に見える$$,
    $$に見え|く見え|にみえ|くみえ$$,
    ARRAY['に', '見える']::text[],
    ARRAY['に見える', 'く見える', 'に見えます', 'く見えます']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-58', $$彼は年より若く見えます。$$, $$かれはとしよりわかくみえます。$$, $$Ele parece mais jovem do que é.$$),
    ('n4-grammar-58', $$あの人は先生に見える。$$, $$あのひとはせんせいにみえる。$$, $$Aquela pessoa parece professora.$$),
    ('n4-grammar-58', $$家具が少ないから、この部屋は広く見えますね。$$, $$かぐがすくないから、このへやはひろくみえますね。$$, $$Como tem poucos móveis, este quarto parece amplo, né?$$),
    ('n4-grammar-58', $$彼女は元気に見えるけど、本当は疲れている。$$, $$かのじょはげんきにみえるけど、ほんとうはつかれている。$$, $$Ela parece bem, mas na verdade está cansada.$$),
    ('n4-grammar-58', $$遠くから見ると、あの雲は魚に見える。$$, $$とおくからみると、あのくもはさかなにみえる。$$, $$Vista de longe, aquela nuvem parece um peixe.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は年より若____。$$, $$Meu pai parece mais jovem do que é.$$),
        (2, $$このかばんは本物____けど、偽物です。$$, $$Esta bolsa parece verdadeira, mas é falsa.$$),
        (3, $$眼鏡をかけると、頭がよ____。$$, $$Usando óculos, a pessoa parece inteligente.$$),
        (4, $$あの子は静か____けど、本当はよく話す。$$, $$Aquela criança parece quieta, mas na verdade fala bastante.$$),
        (5, $$ここから見ると、人がアリ____。$$, $$Vistas daqui, as pessoas parecem formigas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-58', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$く見えます$$),
        (1, $$く見える$$),
        (2, $$に見える$$),
        (3, $$く見える$$),
        (3, $$く見えます$$),
        (4, $$に見える$$),
        (5, $$に見える$$),
        (5, $$に見えます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-59 — 〜にする（変化）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-59',
    'grammar',
    'N4',
    $$〜にする（変化）$$,
    $$ni suru (henka)$$,
    $$Tornar / Deixar / Transformar em$$,
    $$No N4, にする aparece com o sentido de mudar algo de propósito, deixando aquilo com uma nova característica ou transformando-o em outra coisa. Equivale a "tornar", "deixar" ou "transformar em".

Ela é usada com adjetivos な e substantivos. A coisa que muda é marcada com を, e o novo estado ou resultado vem antes de に.

Por exemplo, deixar o quarto limpo, ficar em silêncio, transformar um quarto vazio em quarto das crianças.

A diferença em relação a になる é quem causa a mudança. になる indica uma mudança natural ("ficou limpo"); にする indica que alguém fez a mudança ("deixei limpo").

Com adjetivos い, a estrutura equivalente é くする.$$,
    $$Não confunda com a にする do N5, que significa "escolher", como em "vou de café". Aqui, にする indica transformação.

静かにしてください e 大切にしてください são pedidos muito frequentes no dia a dia.

A expressão 〜を大切にする significa "cuidar bem de" ou "valorizar", e aparece muito em mensagens de cuidado.$$,
    $$Substantivo + を + Adjetivo な + に + する
Substantivo A + を + Substantivo B + に + する (transformar A em B)
Adjetivo な + に + する (sem objeto: 静かにする)

Pedido: 〜にしてください
Equivalente com adjetivos い: Adjetivo sem い + く + する$$,
    $$にする$$,
    $$にする|にします|にした|にしました|にして|にしよう|にしましょう$$,
    ARRAY['に', 'する']::text[],
    ARRAY['にする', 'にします', 'にした', 'にしました', 'にして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-59', $$お客さんが来るので、部屋をきれいにしました。$$, $$おきゃくさんがくるので、へやをきれいにしました。$$, $$Como vai vir visita, deixei o quarto limpo.$$),
    ('n4-grammar-59', $$図書館では静かにしてください。$$, $$としょかんではしずかにしてください。$$, $$Fiquem em silêncio na biblioteca.$$),
    ('n4-grammar-59', $$息子を医者にしたいと思っています。$$, $$むすこをいしゃにしたいとおもっています。$$, $$Quero que meu filho seja médico.$$),
    ('n4-grammar-59', $$空いている部屋を子供部屋にしました。$$, $$あいているへやをこどもべやにしました。$$, $$Transformei o quarto vazio em quarto das crianças.$$),
    ('n4-grammar-59', $$体を大切にしてくださいね。$$, $$からだをたいせつにしてくださいね。$$, $$Cuide bem da sua saúde, tá?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$授業中は静か____ください。$$, $$Durante a aula, fiquem em silêncio.$$),
        (2, $$お客さんが来るから、部屋をきれい____。$$, $$Vai vir visita, então vamos deixar o quarto limpo.$$),
        (3, $$古いシャツを雑巾____。$$, $$Transformei a camisa velha em pano de chão.$$),
        (4, $$お金は大切____ください。$$, $$Cuide bem do seu dinheiro.$$),
        (5, $$美容院で、髪の色を茶色____。$$, $$No salão, deixei o cabelo castanho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-59', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にして$$),
        (2, $$にしましょう$$),
        (2, $$にしよう$$),
        (2, $$にします$$),
        (3, $$にしました$$),
        (3, $$にした$$),
        (4, $$にして$$),
        (5, $$にしました$$),
        (5, $$にした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-60 — 〜にくい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-60',
    'grammar',
    'N4',
    $$〜にくい$$,
    $$nikui$$,
    $$Difícil de / Ruim de$$,
    $$にくい é usado para dizer que algo é difícil de fazer. Equivale a "difícil de" ou "ruim de".

Ele é formado tirando ます do verbo e acrescentando にくい. O resultado funciona como um adjetivo い, então se conjuga como tal: にくくない, にくかった, にくくて.

A dificuldade costuma vir de uma característica da coisa, como letras pequenas que tornam um livro difícil de ler, ou sapatos que deixam o andar desconfortável.

Também é usado para situações em que é difícil fazer algo por motivos psicológicos, como ser difícil fazer uma pergunta a alguém.

O oposto de にくい é やすい, que significa "fácil de".$$,
    $$Para dificuldades emocionais ou situações delicadas, também se usa づらい, que destaca mais o desconforto pessoal.

Não confunda com o adjetivo 憎い, que significa "odioso". Apenas a pronúncia é igual.

Com verbos que não dependem da vontade, como acontecimentos naturais, にくい também funciona: algo que "não quebra facilmente", por exemplo.$$,
    $$Verbo na forma ます sem ます + にくい

Negativo: にくくない
Passado: にくかった
Ligando: にくくて$$,
    $$にくい$$,
    $$にくい|にくく|にくかった$$,
    ARRAY['にくい']::text[],
    ARRAY['にくい', 'にくくない', 'にくかった', 'にくくて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-60', $$この本は字が小さくて読みにくいです。$$, $$このほんはじがちいさくてよみにくいです。$$, $$Este livro tem letras pequenas e é difícil de ler.$$),
    ('n4-grammar-60', $$この靴は歩きにくい。$$, $$このくつはあるきにくい。$$, $$Estes sapatos são ruins para andar.$$),
    ('n4-grammar-60', $$彼の説明はわかりにくかった。$$, $$かれのせつめいはわかりにくかった。$$, $$A explicação dele foi difícil de entender.$$),
    ('n4-grammar-60', $$この薬は苦くて飲みにくいです。$$, $$このくすりはにがくてのみにくいです。$$, $$Este remédio é amargo e difícil de tomar.$$),
    ('n4-grammar-60', $$あの先生には質問しにくいです。$$, $$あのせんせいにはしつもんしにくいです。$$, $$É difícil fazer perguntas para aquele professor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このペンは書き____です。$$, $$Esta caneta é ruim de escrever.$$),
        (2, $$骨が多い魚は食べ____。$$, $$Peixe com muita espinha é difícil de comer.$$),
        (3, $$彼の字は小さくて読み____。$$, $$A letra dele é pequena e difícil de ler.$$),
        (4, $$このドアは開け____から、気をつけて。$$, $$Esta porta é difícil de abrir, então tome cuidado.$$),
        (5, $$説明がわかり____て、困りました。$$, $$A explicação era difícil de entender, e fiquei perdido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-60', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にくい$$),
        (2, $$にくい$$),
        (2, $$にくいです$$),
        (3, $$にくい$$),
        (3, $$にくいです$$),
        (4, $$にくい$$),
        (5, $$にくく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-61 — 〜の中で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-61',
    'grammar',
    'N4',
    $$〜の中で$$,
    $$no naka de$$,
    $$Dentro de / Entre / Em meio a$$,
    $$の中で significa literalmente "dentro de". No N4, ele aparece com dois usos principais.

O primeiro é físico: indica o lugar fechado ou o ambiente onde uma ação acontece, como dentro de uma caixa, dentro do carro ou no meio da chuva.

O segundo é delimitar um grupo ou um conjunto, com o sentido de "entre". Ele mostra o grupo dentro do qual se faz uma comparação ou uma observação, como "entre os livros que já li" ou "na minha família".

No segundo uso, ele aparece muito com 一番 e だけ, para destacar um elemento do grupo.

Também pode indicar uma situação ou circunstância ampla, como "em meio a um dia a dia corrido".$$,
    $$Para indicar apenas que algo está dentro de um lugar, sem ação, usa-se の中に com ある ou いる. の中で é para ações.

Com adjetivos de situação, como em 寒い中, não se usa の: a palavra 中 vem direto depois do adjetivo.

Lido ちゅう ou じゅう, o mesmo kanji 中 forma outras expressões, como 授業中 (durante a aula) e 一日中 (o dia inteiro).$$,
    $$Substantivo (lugar / espaço) + の中で + Verbo
Substantivo (grupo) + の中で + [A] + が + 一番 / だけ
Frase + Substantivo + の中で (entre os... que...)

Escrita: の中で / のなかで$$,
    $$の中で$$,
    $$の中で|のなかで$$,
    ARRAY['の', '中', 'で']::text[],
    ARRAY['の中で', 'のなかで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-61', $$箱の中で猫が寝ています。$$, $$はこのなかでねこがねています。$$, $$O gato está dormindo dentro da caixa.$$),
    ('n4-grammar-61', $$家族の中で、私だけが眼鏡をかけています。$$, $$かぞくのなかで、わたしだけがめがねをかけています。$$, $$Na minha família, só eu uso óculos.$$),
    ('n4-grammar-61', $$忙しい毎日の中で、音楽が私の楽しみです。$$, $$いそがしいまいにちのなかで、おんがくがわたしのたのしみです。$$, $$Em meio ao dia a dia corrido, a música é a minha alegria.$$),
    ('n4-grammar-61', $$雨の中で、子供たちが遊んでいる。$$, $$あめのなかで、こどもたちがあそんでいる。$$, $$As crianças estão brincando debaixo da chuva.$$),
    ('n4-grammar-61', $$今まで読んだ本の中で、これが一番おもしろかった。$$, $$いままでよんだほんのなかで、これがいちばんおもしろかった。$$, $$De todos os livros que já li, este foi o mais interessante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$車____音楽を聞きました。$$, $$Ouvi música dentro do carro.$$),
        (2, $$クラス____、彼だけが日本へ行ったことがある。$$, $$Na turma, só ele já foi ao Japão.$$),
        (3, $$雪____、二時間も待ちました。$$, $$Esperei duas horas inteiras debaixo da neve.$$),
        (4, $$私が知っている人____、一番優しいのは祖母です。$$, $$Entre as pessoas que conheço, a mais gentil é minha avó.$$),
        (5, $$森____、珍しい鳥を見つけました。$$, $$Encontrei um pássaro raro dentro da floresta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-61', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の中で$$),
        (1, $$のなかで$$),
        (2, $$の中で$$),
        (2, $$のなかで$$),
        (3, $$の中で$$),
        (3, $$のなかで$$),
        (4, $$の中で$$),
        (4, $$のなかで$$),
        (5, $$の中で$$),
        (5, $$のなかで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-62 — 〜のに（逆接）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-62',
    'grammar',
    'N4',
    $$〜のに（逆接）$$,
    $$noni (gyakusetsu)$$,
    $$Mesmo / Apesar de / Embora$$,
    $$のに é usado para ligar duas ideias quando o resultado é contrário ao que se esperava. Equivale a "mesmo...", "apesar de..." ou "embora...".

O ponto principal é o sentimento. のに mostra surpresa, frustração, decepção ou reclamação de quem fala. Por exemplo, "estudei tanto e mesmo assim fui reprovado".

Por isso, ele é diferente de けど e が, que apenas indicam contraste de forma neutra. のに sempre carrega emoção.

Como a segunda parte descreve um fato que contraria a expectativa, ela não pode ser um pedido, uma ordem ou uma intenção.

Com substantivos e adjetivos な, usa-se な antes de のに.$$,
    $$No final da frase, のに sozinho expressa arrependimento ou lamento, como "se pelo menos...", "que pena que...".

A palavra せっかく combina muito com のに, reforçando a frustração por um esforço desperdiçado.

Não confunda com のに de finalidade, que significa "para fazer" e vem antes de verbos como 使う e かかる.$$,
    $$Verbo / Adjetivo い (forma simples) + のに
Substantivo / Adjetivo な + な + のに$$,
    $$のに$$,
    $$のに$$,
    ARRAY['のに']::text[],
    ARRAY['のに', 'なのに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-62', $$一生懸命勉強したのに、試験に落ちた。$$, $$いっしょうけんめいべんきょうしたのに、しけんにおちた。$$, $$Estudei muito e mesmo assim fui reprovado.$$),
    ('n4-grammar-62', $$約束したのに、彼は来なかった。$$, $$やくそくしたのに、かれはこなかった。$$, $$Ele prometeu, mas não veio.$$),
    ('n4-grammar-62', $$日曜日なのに、会社に行かなければならない。$$, $$にちようびなのに、かいしゃにいかなければならない。$$, $$Mesmo sendo domingo, tenho que ir à empresa.$$),
    ('n4-grammar-62', $$この店は高いのに、あまりおいしくない。$$, $$このみせはたかいのに、あまりおいしくない。$$, $$Este restaurante é caro e mesmo assim não é muito gostoso.$$),
    ('n4-grammar-62', $$せっかく作ったのに、誰も食べてくれない。$$, $$せっかくつくったのに、だれもたべてくれない。$$, $$Eu me dei ao trabalho de fazer, e ninguém come.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$薬を飲んだ____、熱が下がらない。$$, $$Tomei remédio, mas a febre não baixa.$$),
        (2, $$もう春な____、まだ寒いですね。$$, $$Mesmo já sendo primavera, ainda está frio, né?$$),
        (3, $$何度も説明した____、わかってくれない。$$, $$Expliquei várias vezes, mas ele não entende.$$),
        (4, $$彼はまだ若い____、何でも知っている。$$, $$Apesar de ainda ser jovem, ele sabe de tudo.$$),
        (5, $$早く起きた____、バスに遅れてしまった。$$, $$Acordei cedo e mesmo assim perdi o ônibus.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-62', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のに$$),
        (2, $$のに$$),
        (3, $$のに$$),
        (4, $$のに$$),
        (5, $$のに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-63 — 〜のに（目的）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-63',
    'grammar',
    'N4',
    $$〜のに（目的）$$,
    $$noni (mokuteki)$$,
    $$Para / Para fazer$$,
    $$のに também pode indicar finalidade ou uso. Nesse caso, equivale a "para" ou "para fazer".

A estrutura junta o verbo na forma de dicionário com のに. O の transforma a ação em substantivo, e に indica o objetivo.

Esse uso aparece principalmente com algumas palavras específicas: 使う (usar), かかる (levar tempo ou custar), 必要 (necessário), 便利 (prático) e いい (bom).

Por exemplo, "uma tesoura usada para cortar papel", "leva trinta minutos para ir até a estação", "é preciso dinheiro para comprar uma casa".

A diferença em relação a ために é o alcance: のに é mais restrito e aparece com esse grupo de expressões. ために expressa um objetivo de forma mais ampla.$$,
    $$Com substantivos, a mesma ideia é expressa com に: 料理に使う (usar na cozinha).

A melhor forma de distinguir as duas のに é olhar o que vem depois. Se for かかる, 使う, 必要 ou 便利, é finalidade. Se vier um resultado inesperado, é contraste.

Em perguntas como "quanto tempo leva para...", のに é a escolha mais natural.$$,
    $$Verbo na forma de dicionário + のに + 使う
Verbo na forma de dicionário + のに + Tempo / Dinheiro + かかる
Verbo na forma de dicionário + のに + 必要だ / 便利だ / いい$$,
    $$のに$$,
    $$のに$$,
    ARRAY['の', 'に']::text[],
    ARRAY['のに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-63', $$このはさみは紙を切るのに使います。$$, $$このはさみはかみをきるのにつかいます。$$, $$Esta tesoura é usada para cortar papel.$$),
    ('n4-grammar-63', $$家から駅まで行くのに三十分かかります。$$, $$いえからえきまでいくのにさんじゅっぷんかかります。$$, $$Leva trinta minutos para ir de casa até a estação.$$),
    ('n4-grammar-63', $$家を買うのにたくさんお金が必要だ。$$, $$いえをかうのにたくさんおかねがひつようだ。$$, $$É preciso muito dinheiro para comprar uma casa.$$),
    ('n4-grammar-63', $$この箱は本を入れるのにちょうどいい。$$, $$このはこはほんをいれるのにちょうどいい。$$, $$Esta caixa é perfeita para guardar livros.$$),
    ('n4-grammar-63', $$このレポートを書くのに一週間かかりました。$$, $$このレポートをかくのにいっしゅうかんかかりました。$$, $$Levei uma semana para escrever este relatório.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋を掃除する____二時間かかった。$$, $$Levei duas horas para limpar este quarto.$$),
        (2, $$このかばんは旅行する____便利です。$$, $$Esta bolsa é prática para viajar.$$),
        (3, $$漢字を覚える____、このアプリを使っています。$$, $$Estou usando este aplicativo para decorar kanji.$$),
        (4, $$おいしい料理を作る____、この包丁が必要です。$$, $$Para fazer uma comida gostosa, esta faca é necessária.$$),
        (5, $$日本語が話せるようになる____何年かかりますか。$$, $$Quantos anos leva para conseguir falar japonês?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-63', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のに$$),
        (2, $$のに$$),
        (3, $$のに$$),
        (4, $$のに$$),
        (5, $$のに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-64 — 〜のは〜だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-64',
    'grammar',
    'N4',
    $$〜のは〜だ$$,
    $$no wa ~ da$$,
    $$O que... é / Quem... é / Foi... que$$,
    $$のは〜だ é usado para destacar a informação mais importante da frase. Equivale a estruturas como "o que eu gosto é...", "quem veio foi..." ou "foi por isso que...".

A primeira parte, terminada em のは, apresenta uma situação já conhecida ou fácil de entender. O の transforma essa parte em substantivo, e は a marca como tema.

A segunda parte, antes de だ ou です, traz a informação nova e importante: a pessoa, a coisa, o lugar, o tempo ou o motivo.

Essa estrutura é muito útil para corrigir alguém, responder perguntas com precisão ou dar ênfase a uma parte específica da frase.

Para explicar o motivo, é comum terminar com からです: "o motivo de... é que...".$$,
    $$Nessa estrutura, o sujeito dentro da primeira parte costuma ser marcado com が, e não com は, porque a frase inteira já tem um tema.

É uma forma muito natural de dar ênfase sem mudar a ordem das palavras, algo que o japonês faz com frequência.

Em respostas a perguntas como "quem fez isso?", essa estrutura deixa a resposta clara e enfática.$$,
    $$Verbo / Adjetivo (forma simples) + のは + Informação + だ / です
Adjetivo な + な + のは + Informação + だ / です
… + のは + Motivo + からです$$,
    $$のは$$,
    $$のは$$,
    ARRAY['の', 'は', 'だ']::text[],
    ARRAY['のは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-64', $$私が好きなのは、日本の歌です。$$, $$わたしがすきなのは、にほんのうたです。$$, $$O que eu gosto é de músicas japonesas.$$),
    ('n4-grammar-64', $$昨日来たのは田中さんです。$$, $$きのうきたのはたなかさんです。$$, $$Quem veio ontem foi o Tanaka.$$),
    ('n4-grammar-64', $$一番大切なのは、健康だ。$$, $$いちばんたいせつなのは、けんこうだ。$$, $$O mais importante é a saúde.$$),
    ('n4-grammar-64', $$私が生まれたのは、小さな村です。$$, $$わたしがうまれたのは、ちいさなむらです。$$, $$O lugar onde nasci é um vilarejo pequeno.$$),
    ('n4-grammar-64', $$彼が会社を休んだのは、病気だったからです。$$, $$かれがかいしゃをやすんだのは、びょうきだったからです。$$, $$Ele faltou ao trabalho porque estava doente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この絵をかいた____、私の妹です。$$, $$Quem pintou este quadro foi minha irmã mais nova.$$),
        (2, $$一番難しかった____、漢字の試験だった。$$, $$O mais difícil foi a prova de kanji.$$),
        (3, $$私が毎朝飲む____、コーヒーです。$$, $$O que eu bebo toda manhã é café.$$),
        (4, $$彼女に初めて会った____、去年の夏です。$$, $$A primeira vez que a encontrei foi no verão passado.$$),
        (5, $$今朝遅れた____、電車が止まったからです。$$, $$Hoje de manhã me atrasei porque o trem parou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-64', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のは$$),
        (2, $$のは$$),
        (3, $$のは$$),
        (4, $$のは$$),
        (5, $$のは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-65 — お〜ください
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-65',
    'grammar',
    'N4',
    $$お〜ください$$,
    $$o ~ kudasai$$,
    $$Por favor (faça) (muito educado)$$,
    $$お〜ください é uma forma muito educada de pedir que alguém faça algo. É mais respeitosa do que てください.

Ela é formada colocando お antes do verbo na forma ます sem ます, e ください depois. Com verbos do tipo "substantivo + する" de origem chinesa, usa-se ご no lugar de お, como em ご連絡ください.

É muito usada por funcionários de lojas, hotéis, estações e empresas, e em avisos públicos. Também aparece em e-mails formais.

Ela pertence ao 尊敬語, porque eleva a pessoa que vai fazer a ação.$$,
    $$Alguns verbos têm formas respeitosas especiais e não seguem a regra, como 見る (ご覧ください), 来る (お越しください) e 食べる (お召し上がりください).

Verbos de uma só sílaba na forma ます, como 見る e 寝る, normalmente não usam essa estrutura.

少々お待ちください é uma das frases mais ouvidas no atendimento ao cliente no Japão.$$,
    $$お + Verbo na forma ます sem ます + ください
ご + Substantivo de ação (origem chinesa) + ください

Exemplos de formação: 待つ → お待ちください / 入る → お入りください / 連絡する → ご連絡ください$$,
    $$お〜ください$$,
    $$お待ちください|お入りください|お座りください|お掛けください|お使いください|お書きください|お持ちください|お取りください|お降りください|お選びください|お気をつけください|ご連絡ください|ご覧ください|ご確認ください|ご注意ください|ご利用ください$$,
    ARRAY['お', 'ください']::text[],
    ARRAY['お〜ください', 'ご〜ください']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-65', $$少々お待ちください。$$, $$しょうしょうおまちください。$$, $$Aguarde um momento, por favor.$$),
    ('n4-grammar-65', $$どうぞお入りください。$$, $$どうぞおはいりください。$$, $$Entre, por favor.$$),
    ('n4-grammar-65', $$こちらにお名前をお書きください。$$, $$こちらにおなまえをおかきください。$$, $$Escreva seu nome aqui, por favor.$$),
    ('n4-grammar-65', $$ご自由にお使いください。$$, $$ごじゆうにおつかいください。$$, $$Fique à vontade para usar.$$),
    ('n4-grammar-65', $$階段では足元にご注意ください。$$, $$かいだんではあしもとにごちゅういください。$$, $$Cuidado com os degraus na escada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$どうぞ、こちらに____。$$, $$Sente-se aqui, por favor.$$),
        (2, $$お帰りの際は、どうぞ____。$$, $$Na volta, tome cuidado, por favor.$$),
        (3, $$こちらのペンを____。$$, $$Use esta caneta, por favor.$$),
        (4, $$何かあれば、いつでも____。$$, $$Se precisar de algo, entre em contato a qualquer momento.$$),
        (5, $$お客様、次の駅で____。$$, $$Senhor, desça na próxima estação, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-65', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$お座りください$$),
        (1, $$お掛けください$$),
        (2, $$お気をつけください$$),
        (3, $$お使いください$$),
        (4, $$ご連絡ください$$),
        (5, $$お降りください$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-66 — お〜になる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-66',
    'grammar',
    'N4',
    $$お〜になる$$,
    $$o ~ ni naru$$,
    $$Fazer (respeitoso)$$,
    $$お〜になる é uma forma respeitosa (尊敬語) de falar das ações de outra pessoa, como um cliente, um professor ou um superior. Ela eleva a pessoa que faz a ação.

Ela é formada colocando お antes do verbo na forma ます sem ます, e になる depois. Por exemplo, "voltar" vira お帰りになる, e "ler" vira お読みになる.

O significado do verbo continua o mesmo; só o nível de respeito muda. Ela é muito usada em situações de trabalho, atendimento e com pessoas mais velhas.

Assim como outros verbos respeitosos, ela nunca é usada para as próprias ações.$$,
    $$Alguns verbos não usam お〜になる porque têm formas respeitosas próprias: いる / 行く / 来る → いらっしゃる, する → なさる, 言う → おっしゃる, 見る → ご覧になる, 食べる → 召し上がる.

Verbos com forma ます de uma só sílaba, como 見る (見ます) e 寝る (寝ます), também não usam essa estrutura.

Para pedir algo respeitosamente, a forma relacionada é お〜ください.$$,
    $$お + Verbo na forma ます sem ます + になる
お + Verbo sem ます + になります (educado)

Passado: お〜になった / お〜になりました$$,
    $$お〜になる$$,
    $$お帰りにな|お待ちにな|お読みにな|お書きにな|お使いにな|お出かけにな|お会いにな|お休みにな|お決めにな|お聞きにな|お持ちにな$$,
    ARRAY['お', 'になる']::text[],
    ARRAY['お〜になる', 'お〜になります', 'お〜になりました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-66', $$社長はもうお帰りになりました。$$, $$しゃちょうはもうおかえりになりました。$$, $$O presidente já foi embora.$$),
    ('n4-grammar-66', $$先生はこの本をお読みになりましたか。$$, $$せんせいはこのほんをおよみになりましたか。$$, $$O professor já leu este livro?$$),
    ('n4-grammar-66', $$部長は何時にお出かけになりますか。$$, $$ぶちょうはなんじにおでかけになりますか。$$, $$A que horas o gerente vai sair?$$),
    ('n4-grammar-66', $$このペンをお使いになりますか。$$, $$このペンをおつかいになりますか。$$, $$O senhor vai usar esta caneta?$$),
    ('n4-grammar-66', $$少しお休みになったらいかがですか。$$, $$すこしおやすみになったらいかがですか。$$, $$Que tal o senhor descansar um pouco?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生は何時ごろ____か。（帰る）$$, $$A que horas o professor volta? (voltar)$$),
        (2, $$お客様がロビーで____います。（待つ）$$, $$O cliente está esperando no saguão. (esperar)$$),
        (3, $$社長はこの資料をもう____か。（読む）$$, $$O presidente já leu este documento? (ler)$$),
        (4, $$田中先生にはもう____か。（会う）$$, $$O senhor já se encontrou com o professor Tanaka? (encontrar)$$),
        (5, $$どちらの部屋に____か。（決める）$$, $$Qual quarto o senhor escolheu? (decidir)$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-66', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$お帰りになります$$),
        (2, $$お待ちになって$$),
        (3, $$お読みになりました$$),
        (4, $$お会いになりました$$),
        (5, $$お決めになりました$$),
        (5, $$お決めになります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-67 — 〜おきに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-67',
    'grammar',
    'N4',
    $$〜おきに$$,
    $$oki ni$$,
    $$A cada / De... em...$$,
    $$おきに é usado para indicar intervalos regulares. Equivale a "a cada" ou "de... em...".

Ele vem depois de uma quantidade de tempo ou de distância. Por exemplo, um ônibus que passa a cada dez minutos, ou árvores plantadas a cada cinco metros.

Há um detalhe importante com unidades como dias e linhas: 一日おきに significa "dia sim, dia não", ou seja, pula-se um dia entre cada ocorrência. Com horas e minutos, a interpretação costuma ser simplesmente "a cada X tempo".

A palavra vem do verbo 置く, que aqui tem a ideia de "deixar um espaço" entre uma coisa e outra.$$,
    $$ごとに é parecido e também significa "a cada". Com dias, porém, 一日ごとに significa "todo dia", enquanto 一日おきに significa "dia sim, dia não".

Em horários de transporte e em instruções médicas, おきに aparece com muita frequência.

Para dizer que algo acontece a intervalos de forma geral, sem número, usa-se 定期的に (regularmente).$$,
    $$Quantidade de tempo / distância + おきに + Verbo

Escrita: おきに / 置きに$$,
    $$おきに$$,
    $$おきに|置きに$$,
    ARRAY['おき', 'に']::text[],
    ARRAY['おきに', '置きに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-67', $$この駅では、バスは十分おきに来ます。$$, $$このえきでは、バスはじゅっぷんおきにきます。$$, $$Nesta estação, o ônibus passa a cada dez minutos.$$),
    ('n4-grammar-67', $$一日おきに運動しています。$$, $$いちにちおきにうんどうしています。$$, $$Faço exercício dia sim, dia não.$$),
    ('n4-grammar-67', $$この薬は六時間おきに飲んでください。$$, $$このくすりはろくじかんおきにのんでください。$$, $$Tome este remédio a cada seis horas.$$),
    ('n4-grammar-67', $$道には五メートルおきに木が植えてある。$$, $$みちにはごメートルおきにきがうえてある。$$, $$Há árvores plantadas a cada cinco metros na rua.$$),
    ('n4-grammar-67', $$ノートには一行おきに書いてください。$$, $$ノートにはいちぎょうおきにかいてください。$$, $$No caderno, escreva pulando uma linha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$電車は五分____来ます。$$, $$O trem passa a cada cinco minutos.$$),
        (2, $$一週間____病院に通っています。$$, $$Vou ao hospital semana sim, semana não.$$),
        (3, $$この花には二日____水をやってください。$$, $$Regue esta flor a cada dois dias.$$),
        (4, $$机を一つ____並べてください。$$, $$Arrume as mesas deixando uma de espaço entre elas.$$),
        (5, $$この大会は四年____開かれる。$$, $$Este campeonato é realizado a cada quatro anos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-67', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$おきに$$),
        (2, $$おきに$$),
        (3, $$おきに$$),
        (4, $$おきに$$),
        (5, $$おきに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-68 — 〜終わる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-68',
    'grammar',
    'N4',
    $$〜終わる$$,
    $$owaru$$,
    $$Terminar de / Acabar de (fazer)$$,
    $$終わる, ligado a outro verbo, indica que uma ação foi concluída até o fim. Equivale a "terminar de" ou "acabar de fazer".

A estrutura junta o verbo na forma ます sem ます com 終わる. O resultado funciona como um verbo do grupo 1 e se conjuga normalmente: 終わります, 終わった, 終わって.

É usado com ações que têm duração e um fim claro, como ler um livro, escrever uma carta, comer uma refeição ou ver um filme.

O oposto é 始める (começar a). Com 終わる, a ideia é que a ação foi completada.$$,
    $$Também existe 終える, que é a versão transitiva e soa um pouco mais formal, como em 読み終える.

Com ações de um instante, como chegar ou acordar, 終わる não é usado, porque elas não têm duração.

Para dizer "terminei!" ao concluir uma tarefa, é muito comum ouvir 終わった！ ou できた！.$$,
    $$Verbo na forma ます sem ます + 終わる

Educado: 終わります
Passado: 終わった / 終わりました
Ligando: 終わって
Condicional: 終わったら

Escrita: 終わる / おわる$$,
    $$終わる$$,
    $$終わ|おわ$$,
    ARRAY['終わる']::text[],
    ARRAY['終わる', '終わります', '終わった', '終わりました', '終わって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-68', $$やっと宿題をし終わりました。$$, $$やっとしゅくだいをしおわりました。$$, $$Finalmente terminei de fazer a lição.$$),
    ('n4-grammar-68', $$この本を読み終わったら、貸してあげます。$$, $$このほんをよみおわったら、かしてあげます。$$, $$Quando terminar de ler este livro, eu te empresto.$$),
    ('n4-grammar-68', $$食べ終わった人から、外で遊んでいいですよ。$$, $$たべおわったひとから、そとであそんでいいですよ。$$, $$Quem terminar de comer pode ir brincar lá fora.$$),
    ('n4-grammar-68', $$手紙を書き終わって、ほっとした。$$, $$てがみをかきおわって、ほっとした。$$, $$Terminei de escrever a carta e fiquei aliviado.$$),
    ('n4-grammar-68', $$映画を見終わったあとで、感想を話し合った。$$, $$えいがをみおわったあとで、かんそうをはなしあった。$$, $$Depois de terminar de ver o filme, conversamos sobre o que achamos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日の夜、やっとレポートを書き____。$$, $$Ontem à noite, finalmente terminei de escrever o relatório.$$),
        (2, $$本を読み____ら、感想を教えてください。$$, $$Quando terminar de ler o livro, me diga o que achou.$$),
        (3, $$全部食べ____人は、お皿を片付けてください。$$, $$Quem terminou de comer tudo, recolha o prato, por favor.$$),
        (4, $$洗濯物を干し____、少し休みました。$$, $$Terminei de estender a roupa e descansei um pouco.$$),
        (5, $$この仕事、何時ごろやり____そうですか。$$, $$A que horas você acha que vai terminar este trabalho?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-68', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$終わりました$$),
        (1, $$終わった$$),
        (1, $$おわりました$$),
        (1, $$おわった$$),
        (2, $$終わった$$),
        (2, $$おわった$$),
        (3, $$終わった$$),
        (3, $$おわった$$),
        (4, $$終わって$$),
        (4, $$おわって$$),
        (5, $$終わり$$),
        (5, $$おわり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-69 — 可能形（〜られる・〜える）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-69',
    'grammar',
    'N4',
    $$可能形（〜られる・〜える）$$,
    $$kanoukei$$,
    $$Conseguir / Poder / Ser capaz de$$,
    $$A forma potencial (可能形) é usada para dizer que alguém consegue ou pode fazer algo. Equivale a "conseguir", "poder" ou "ser capaz de".

Ela expressa tanto habilidade, como saber ler kanji ou nadar, quanto possibilidade, como poder vir a uma festa ou dar para ver algo de um lugar.

A formação depende do grupo do verbo. No grupo 1, o último som muda de "u" para "e" e recebe る. No grupo 2, tira-se る e acrescenta-se られる. Os irregulares ficam できる (de する) e 来られる (こられる).

Depois de formado, o verbo potencial se conjuga como um verbo do grupo 2. E o objeto costuma ser marcado com が, embora を também apareça.

O sentido é o mesmo de ことができる, mas a forma potencial é mais curta e muito mais comum na conversa.$$,
    $$Na fala, muitos japoneses usam a forma reduzida dos verbos do grupo 2, tirando o ら: 食べれる, 見れる. Ela é comum, mas considerada informal; em provas e textos, use a forma completa.

見える e 聞こえる indicam o que naturalmente se vê ou se ouve, enquanto 見られる e 聞ける indicam possibilidade ou oportunidade de ver ou ouvir.

A forma られる também é usada para a voz passiva e para o respeito, então o contexto é importante.$$,
    $$Grupo 1: último som "u" → "e" + る (書く → 書ける / 話す → 話せる / 読む → 読める)
Grupo 2: tire る + られる (食べる → 食べられる / 見る → 見られる)
Irregulares: する → できる / 来る → 来られる (こられる)

Objeto: Substantivo + が + Verbo potencial
Negativo: 〜ない (書けない / 食べられない)$$,
    $$られる$$,
    $$られる|られない|られます|られません|できる|できない|できます|できません|ける|けない|けます|けません|める|めない|めます|めません|せる|せない|せます|せません|げる|げない|げます|げません|える|えない|えます|えません|れる|れない|れます|れません|てる|てない|てます|てません|べる|べない|べます|べません$$,
    ARRAY['られる', 'える']::text[],
    ARRAY['られる', 'られない', 'える', 'ける', 'める', 'せる', 'できる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-69', $$私は漢字が少し読めます。$$, $$わたしはかんじがすこしよめます。$$, $$Consigo ler um pouco de kanji.$$),
    ('n4-grammar-69', $$刺身が食べられますか。$$, $$さしみがたべられますか。$$, $$Você consegue comer sashimi?$$),
    ('n4-grammar-69', $$弟はまだ泳げない。$$, $$おとうとはまだおよげない。$$, $$Meu irmão mais novo ainda não sabe nadar.$$),
    ('n4-grammar-69', $$明日は忙しいので、パーティーに来られません。$$, $$あしたはいそがしいので、パーティーにこられません。$$, $$Amanhã estou ocupado, então não vou poder vir à festa.$$),
    ('n4-grammar-69', $$この部屋からは富士山が見られる。$$, $$このへやからはふじさんがみられる。$$, $$Deste quarto dá para ver o Monte Fuji.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女はピアノが弾____。$$, $$Ela sabe tocar piano.$$),
        (2, $$辛い料理は食べ____か。$$, $$Você consegue comer comida apimentada?$$),
        (3, $$やっと日本語で手紙が書____ようになりました。$$, $$Finalmente passei a conseguir escrever cartas em japonês.$$),
        (4, $$明日は七時に来____か。$$, $$Você consegue vir às sete amanhã?$$),
        (5, $$今日は足が痛くて、走____。$$, $$Hoje estou com dor no pé e não consigo correr.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-69', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$けます$$),
        (1, $$ける$$),
        (2, $$られます$$),
        (3, $$ける$$),
        (4, $$られます$$),
        (5, $$れません$$),
        (5, $$れない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-70 — 〜らしい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-70',
    'grammar',
    'N4',
    $$〜らしい$$,
    $$rashii$$,
    $$Parece que / Dizem que / Típico de$$,
    $$らしい tem dois usos principais.

O primeiro é indicar uma suposição baseada em informações que a pessoa ouviu ou leu. Equivale a "parece que" ou "dizem que". Quem fala não tem certeza e não se responsabiliza totalmente pela informação. Nesse uso, らしい vem depois da forma simples de verbos e adjetivos, e diretamente depois de substantivos e adjetivos な.

O segundo uso aparece depois de substantivos, com o sentido de "típico de" ou "com as características ideais de". Por exemplo, um dia "bem típico de primavera" ou uma atitude "típica" de alguém. Nesse caso, らしい descreve algo que combina com a imagem esperada daquilo.

Nos dois casos, らしい se conjuga como um adjetivo い: らしくない, らしかった, らしく.$$,
    $$Comparando suposições: らしい se baseia em informações de fora (algo que se ouviu); ようだ / みたいだ se baseiam em observação direta; そうだ (伝聞) apenas repassa uma informação.

A expressão 〜らしくない é muito usada para dizer que alguém está agindo de um jeito diferente do normal.

No uso de "típico de", らしい costuma ter um tom positivo, como algo que está à altura do esperado.$$,
    $$Suposição:
Verbo / Adjetivo い (forma simples) + らしい
Substantivo / Adjetivo な (sem だ) + らしい

Típico de:
Substantivo + らしい + Substantivo
Substantivo + らしくない (não é típico de)$$,
    $$らしい$$,
    $$らしい|らしく|らしかった$$,
    ARRAY['らしい']::text[],
    ARRAY['らしい', 'らしいです', 'らしくない', 'らしかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-70', $$田中さんは来月結婚するらしい。$$, $$たなかさんはらいげつけっこんするらしい。$$, $$Parece que o Tanaka vai se casar no mês que vem.$$),
    ('n4-grammar-70', $$天気予報によると、明日は雨らしいですね。$$, $$てんきよほうによると、あしたはあめらしいですね。$$, $$Segundo a previsão, parece que amanhã vai chover, né?$$),
    ('n4-grammar-70', $$あの店のラーメンはとてもおいしいらしい。$$, $$あのみせのラーメンはとてもおいしいらしい。$$, $$Dizem que o ramen daquela loja é muito gostoso.$$),
    ('n4-grammar-70', $$今日は本当に春らしい天気ですね。$$, $$きょうはほんとうにはるらしいてんきですね。$$, $$Hoje está um tempo bem típico de primavera, né?$$),
    ('n4-grammar-70', $$泣くなんて、君らしくないね。$$, $$なくなんて、きみらしくないね。$$, $$Chorar assim não é do seu feitio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$噂では、あの二人は付き合っている____。$$, $$Pelo que dizem, aqueles dois estão namorando.$$),
        (2, $$部長は今日休む____です。$$, $$Parece que o gerente vai faltar hoje.$$),
        (3, $$山田さんは昔、歌手だった____。$$, $$Dizem que o Yamada era cantor antigamente.$$),
        (4, $$今日は夏____暑い日だった。$$, $$Hoje foi um dia quente, bem típico de verão.$$),
        (5, $$そんなことを言うなんて、彼____ない。$$, $$Dizer uma coisa dessas não é do feitio dele.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-70', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$らしい$$),
        (1, $$らしいです$$),
        (2, $$らしい$$),
        (3, $$らしい$$),
        (3, $$らしいです$$),
        (4, $$らしい$$),
        (5, $$らしく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-71 — 〜さ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-71',
    'grammar',
    'N4',
    $$〜さ$$,
    $$sa$$,
    $$Grau de / Qualidade de (substantivação)$$,
    $$さ é um sufixo que transforma adjetivos em substantivos. Ele indica o grau ou a medida de uma característica. Por exemplo, 高い (alto) vira 高さ (altura), e 重い (pesado) vira 重さ (peso).

Com adjetivos い, tira-se o い e acrescenta-se さ. Com adjetivos な, basta acrescentar さ, sem な.

O substantivo formado pode ser usado como qualquer outro, com partículas como は, が, を e に.

Ele é muito usado para falar de medidas, como altura, profundidade e tamanho, e também de qualidades abstratas, como gentileza, importância e beleza.$$,
    $$Existe também o sufixo み, que forma substantivos a partir de alguns adjetivos, como 甘み e 楽しみ. A diferença é que さ indica grau ou medida, enquanto み indica a sensação ou o aspecto percebido.

さ pode ser usado com quase todos os adjetivos, enquanto み é usado com poucos.

Para perguntar uma medida, é comum usar どのくらい, como em "qual é a altura?".$$,
    $$Adjetivo い sem い + さ (高い → 高さ / 重い → 重さ)
Adjetivo な + さ (大切 → 大切さ / 静か → 静かさ)
Exceção: いい → よさ$$,
    $$さ$$,
    $$さが|さは|さを|さに|さで|さの|さです$$,
    ARRAY['さ']::text[],
    ARRAY['さ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-71', $$富士山の高さは三千七百七十六メートルです。$$, $$ふじさんのたかさはさんぜんななひゃくななじゅうろくメートルです。$$, $$A altura do Monte Fuji é de três mil setecentos e setenta e seis metros.$$),
    ('n4-grammar-71', $$この箱の重さを測ってください。$$, $$このはこのおもさをはかってください。$$, $$Meça o peso desta caixa, por favor.$$),
    ('n4-grammar-71', $$彼女の優しさに感動しました。$$, $$かのじょのやさしさにかんどうしました。$$, $$Fiquei emocionado com a gentileza dela.$$),
    ('n4-grammar-71', $$健康の大切さは、病気になってわかる。$$, $$けんこうのたいせつさは、びょうきになってわかる。$$, $$A importância da saúde a gente só entende quando fica doente.$$),
    ('n4-grammar-71', $$この部屋の広さはどのくらいですか。$$, $$このへやのひろさはどのくらいですか。$$, $$Qual é o tamanho deste quarto?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この川の深____はどのくらいですか。$$, $$Qual é a profundidade deste rio?$$),
        (2, $$日本の夏の暑____にはもう慣れました。$$, $$Já me acostumei com o calor do verão japonês.$$),
        (3, $$母の料理のおいし____は忘れられない。$$, $$Não consigo esquecer o sabor da comida da minha mãe.$$),
        (4, $$失敗して、友達の大切____がわかった。$$, $$Depois de errar, entendi a importância dos amigos.$$),
        (5, $$このかばんの大き____がちょうどいい。$$, $$O tamanho desta bolsa é perfeito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-71', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さ$$),
        (2, $$さ$$),
        (3, $$さ$$),
        (4, $$さ$$),
        (5, $$さ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-72 — さっき
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-72',
    'grammar',
    'N4',
    $$さっき$$,
    $$sakki$$,
    $$Há pouco / Agora há pouco / Ainda agora$$,
    $$さっき significa "há pouco" ou "agora há pouco". Ele indica algo que aconteceu pouco tempo atrás, normalmente no mesmo dia, de minutos a algumas horas antes.

Ele é usado como advérbio, antes do verbo, e pode ser combinado com partículas: さっきまで (até há pouco), さっきから (desde há pouco) e さっきの (de há pouco).

さっき é informal e muito comum na conversa. Em situações formais, usa-se 先ほど, que tem o mesmo sentido.

É diferente de 今 (agora) e de この前 (outro dia): さっき fala de um passado bem recente.$$,
    $$さっきから com a forma ている indica algo que começou há pouco e continua até agora, muitas vezes com um tom de impaciência.

Em e-mails de trabalho e falas com clientes, troque さっき por 先ほど.

Para algo que acabou de acontecer, segundos atrás, o japonês também usa たった今.$$,
    $$さっき + Verbo no passado
さっき + まで (até há pouco)
さっき + から (desde há pouco, até agora)
さっき + の + Substantivo (o... de há pouco)

Formal: 先ほど$$,
    $$さっき$$,
    $$さっき$$,
    ARRAY['さっき']::text[],
    ARRAY['さっき']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-72', $$さっき田中さんから電話がありました。$$, $$さっきたなかさんからでんわがありました。$$, $$Há pouco, o Tanaka ligou.$$),
    ('n4-grammar-72', $$さっき食べたばかりなのに、もうお腹がすいた。$$, $$さっきたべたばかりなのに、もうおなかがすいた。$$, $$Acabei de comer agora há pouco e já estou com fome.$$),
    ('n4-grammar-72', $$さっきの話の続きを聞かせてください。$$, $$さっきのはなしのつづきをきかせてください。$$, $$Me conte o resto daquela história de agora há pouco.$$),
    ('n4-grammar-72', $$彼はさっきまでここにいました。$$, $$かれはさっきまでここにいました。$$, $$Ele estava aqui até agora há pouco.$$),
    ('n4-grammar-72', $$さっきから雨が降っている。$$, $$さっきからあめがふっている。$$, $$Está chovendo desde agora há pouco.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____言ったことは忘れてください。$$, $$Esqueça o que eu disse há pouco.$$),
        (2, $$____までいい天気だったのに、急に雨が降ってきた。$$, $$Até agora há pouco o tempo estava bom, mas de repente começou a chover.$$),
        (3, $$____の人は誰ですか。$$, $$Quem era aquela pessoa de agora há pouco?$$),
        (4, $$「宿題、終わった？」「うん、____終わったよ。」$$, $$"Terminou a lição?" "Sim, terminei agora há pouco."$$),
        (5, $$____から同じところを歩いている気がする。$$, $$Tenho a impressão de que estamos andando pelo mesmo lugar há um tempinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-72', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さっき$$),
        (2, $$さっき$$),
        (3, $$さっき$$),
        (4, $$さっき$$),
        (5, $$さっき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-73 — 〜させられる（使役受身）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-73',
    'grammar',
    'N4',
    $$〜させられる（使役受身）$$,
    $$saserareru (shieki ukemi)$$,
    $$Ser obrigado a / Ser forçado a$$,
    $$させられる é a forma causativa-passiva. Ela é usada para dizer que alguém foi obrigado a fazer algo que não queria. Equivale a "ser obrigado a" ou "ser forçado a".

Ela junta duas ideias: o causativo (fazer alguém fazer algo) e o passivo (sofrer a ação de alguém). O resultado é: "alguém me fez fazer isso", com o foco em quem foi obrigado.

A pessoa que obrigou é marcada com に, e quem foi obrigado costuma ser o sujeito, muitas vezes oculto. O tom costuma ser de incômodo, reclamação ou memória desagradável.

Nos verbos do grupo 1, existe uma forma curta muito usada: troca-se せられる por される, como em 待たされる e 飲まされる. Essa forma curta não é usada com verbos terminados em す.$$,
    $$A forma curta される é mais comum na fala. Por exemplo, 待たされる é muito mais frequente do que 待たせられる.

Essa forma aparece muito em reclamações sobre trabalho, escola e infância.

Às vezes, させられる também expressa um sentimento provocado sem querer, como em 考えさせられる (fazer refletir), com sentido positivo.$$,
    $$Grupo 1: último som "u" → "a" + せられる / される (待つ → 待たせられる / 待たされる)
Grupo 1 terminados em す: só せられる (話す → 話させられる)
Grupo 2: tire る + させられる (食べる → 食べさせられる)
Irregulares: する → させられる / 来る → 来させられる (こさせられる)

Pessoa que obriga + に + Verbo causativo-passivo$$,
    $$させられる$$,
    $$させられ|せられ|かされ|がされ|たされ|まされ|らされ|わされ|ばされ$$,
    ARRAY['させ', 'られる']::text[],
    ARRAY['させられる', 'させられた', 'される', 'された']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-73', $$子供のころ、母に野菜を食べさせられました。$$, $$こどものころ、ははにやさいをたべさせられました。$$, $$Quando criança, minha mãe me obrigava a comer verdura.$$),
    ('n4-grammar-73', $$駅で一時間も待たされた。$$, $$えきでいちじかんもまたされた。$$, $$Me fizeram esperar uma hora inteira na estação.$$),
    ('n4-grammar-73', $$飲み会で、部長にお酒を飲まされました。$$, $$のみかいで、ぶちょうにおさけをのまされました。$$, $$Na confraternização, o gerente me fez beber.$$),
    ('n4-grammar-73', $$先生にみんなの前で歌を歌わされた。$$, $$せんせいにみんなのまえでうたをうたわされた。$$, $$O professor me fez cantar na frente de todo mundo.$$),
    ('n4-grammar-73', $$毎日、遅くまで残業させられている。$$, $$まいにち、おそくまでざんぎょうさせられている。$$, $$Todo dia sou obrigado a fazer hora extra até tarde.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供のころ、毎日ピアノを練習さ____。$$, $$Quando criança, eu era obrigado a praticar piano todo dia.$$),
        (2, $$レストランで三十分も待____。$$, $$No restaurante, me fizeram esperar trinta minutos inteiros.$$),
        (3, $$先輩に重い荷物を持____。$$, $$O veterano me fez carregar uma bagagem pesada.$$),
        (4, $$授業で、作文をみんなの前で読ま____。$$, $$Na aula, me fizeram ler a redação na frente de todos.$$),
        (5, $$嫌いなのに、毎朝牛乳を飲____。$$, $$Mesmo eu não gostando, me fazem tomar leite toda manhã.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-73', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せられました$$),
        (1, $$せられた$$),
        (2, $$たされました$$),
        (2, $$たされた$$),
        (3, $$たされました$$),
        (3, $$たされた$$),
        (4, $$されました$$),
        (4, $$された$$),
        (5, $$まされます$$),
        (5, $$まされる$$),
        (5, $$まされました$$),
        (5, $$まされた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-74 — 〜させる（使役）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-74',
    'grammar',
    'N4',
    $$〜させる（使役）$$,
    $$saseru (shieki)$$,
    $$Fazer (alguém) fazer / Deixar (alguém) fazer$$,
    $$させる é a forma causativa. Ela tem dois sentidos principais, que dependem do contexto.

O primeiro é obrigar ou mandar alguém fazer algo: "fazer alguém fazer". Por exemplo, a mãe fez o filho limpar o quarto.

O segundo é permitir que alguém faça algo: "deixar alguém fazer". Por exemplo, deixar a criança fazer o que gosta. Esse sentido fica mais claro com てあげる, てくれる ou てもらう.

Também é usado para provocar sentimentos ou reações em alguém, como fazer as pessoas rirem ou deixar a família preocupada.

A pessoa que faz a ação é marcada com に quando o verbo tem objeto (を). Com verbos sem objeto, como ir ou correr, a pessoa pode ser marcada com を.$$,
    $$O causativo não costuma ser usado com superiores como "obrigar". Para pedir algo a um superior, usa-se てもらう ou ていただく.

A forma させてください, muito comum, usa o causativo para pedir permissão: "me deixe fazer".

Em níveis seguintes, aparecem formas como させてもらう e させていただく, muito usadas em linguagem formal.$$,
    $$Grupo 1: último som "u" → "a" + せる (書く → 書かせる / 待つ → 待たせる / 言う → 言わせる)
Grupo 2: tire る + させる (食べる → 食べさせる)
Irregulares: する → させる / 来る → 来させる (こさせる)

Pessoa + に + Objeto + を + Verbo causativo
Pessoa + を + Verbo intransitivo causativo$$,
    $$させる$$,
    $$させる|させ|かせ|がせ|たせ|らせ|わせ|ばせ|ませる|ませた|ませて$$,
    ARRAY['させる']::text[],
    ARRAY['させる', 'させます', 'させた', 'させました', 'させて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-74', $$母は弟に部屋を掃除させました。$$, $$はははおとうとにへやをそうじさせました。$$, $$Minha mãe fez meu irmão mais novo limpar o quarto.$$),
    ('n4-grammar-74', $$先生は学生に作文を書かせた。$$, $$せんせいはがくせいにさくぶんをかかせた。$$, $$O professor fez os alunos escreverem uma redação.$$),
    ('n4-grammar-74', $$子供には好きなことをさせてあげたい。$$, $$こどもにはすきなことをさせてあげたい。$$, $$Quero deixar meus filhos fazerem o que gostam.$$),
    ('n4-grammar-74', $$彼は冗談を言って、みんなを笑わせた。$$, $$かれはじょうだんをいって、みんなをわらわせた。$$, $$Ele contou uma piada e fez todo mundo rir.$$),
    ('n4-grammar-74', $$帰りが遅くなって、家族を心配させてしまった。$$, $$かえりがおそくなって、かぞくをしんぱいさせてしまった。$$, $$Cheguei tarde e acabei deixando minha família preocupada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は私に車を運転さ____くれた。$$, $$Meu pai me deixou dirigir o carro.$$),
        (2, $$コーチは選手を毎日走ら____。$$, $$O treinador faz os atletas correrem todos os dias.$$),
        (3, $$母は子供に野菜を食べさ____。$$, $$A mãe fez a criança comer verdura.$$),
        (4, $$彼はいつも面白い話で私を笑わ____。$$, $$Ele sempre me faz rir com histórias engraçadas.$$),
        (5, $$社長は新人にお茶を入れさ____。$$, $$O presidente mandou o funcionário novo preparar o chá.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-74', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せて$$),
        (2, $$せます$$),
        (2, $$せる$$),
        (2, $$せました$$),
        (2, $$せた$$),
        (3, $$せました$$),
        (3, $$せた$$),
        (4, $$せる$$),
        (4, $$せます$$),
        (5, $$せた$$),
        (5, $$せました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-75 — 〜させてください
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-75',
    'grammar',
    'N4',
    $$〜させてください$$,
    $$sasete kudasai$$,
    $$Deixe-me (fazer) / Permita-me$$,
    $$させてください é usado para pedir permissão para fazer algo. Equivale a "deixe-me fazer" ou "permita-me".

Ele junta a forma causativa (させる, "deixar fazer") com てください (pedido). A ideia literal é "por favor, me deixe fazer isso".

É usado quando quem fala quer fazer algo e pede a autorização de outra pessoa, como descansar, ir embora mais cedo, assumir uma tarefa ou dar uma opinião.

Também é uma forma educada e humilde de se oferecer para fazer algo, mostrando vontade e respeito.

Para soar mais suave, usa-se させてもらえませんか ou させていただけませんか.$$,
    $$ちょっと考えさせてください é uma forma educada e muito comum de dizer que você precisa pensar antes de responder.

Com superiores, させていただけませんか é a forma mais adequada para pedir permissão.

A diferença para てもいいですか é o tom: させてください soa mais como um pedido firme, mostrando que você realmente quer fazer aquilo.$$,
    $$Verbo causativo na forma て + ください

Grupo 1: 休む → 休ませてください / 帰る → 帰らせてください
Grupo 2: 考える → 考えさせてください
する → させてください

Mais suave: 〜させてもらえませんか / 〜させていただけませんか$$,
    $$させてください$$,
    $$せてください|せてくださいませんか|せてもらえませんか|せてもらえますか$$,
    ARRAY['させて', 'ください']::text[],
    ARRAY['させてください', 'させてもらえませんか', 'させていただけませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-75', $$すみません、少し休ませてください。$$, $$すみません、すこしやすませてください。$$, $$Com licença, me deixe descansar um pouco.$$),
    ('n4-grammar-75', $$その仕事は私にやらせてください。$$, $$そのしごとはわたしにやらせてください。$$, $$Deixe esse trabalho comigo, por favor.$$),
    ('n4-grammar-75', $$ちょっと考えさせてください。$$, $$ちょっとかんがえさせてください。$$, $$Me deixe pensar um pouco.$$),
    ('n4-grammar-75', $$今日は早く帰らせてもらえませんか。$$, $$きょうははやくかえらせてもらえませんか。$$, $$Poderia me deixar ir embora mais cedo hoje?$$),
    ('n4-grammar-75', $$私にも一言言わせてください。$$, $$わたしにもひとこといわせてください。$$, $$Me deixe dizer uma palavra também.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$頭が痛いので、早退さ____。$$, $$Estou com dor de cabeça, então me deixe sair mais cedo.$$),
        (2, $$その荷物、私に持た____。$$, $$Deixe-me carregar essa bagagem.$$),
        (3, $$一度、私に説明さ____。$$, $$Deixe-me explicar uma vez.$$),
        (4, $$この写真、コピーさ____か。$$, $$Você poderia me deixar copiar esta foto?$$),
        (5, $$ぜひ、私にも手伝わ____。$$, $$Por favor, deixe-me ajudar também.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-75', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せてください$$),
        (2, $$せてください$$),
        (3, $$せてください$$),
        (4, $$せてもらえません$$),
        (5, $$せてください$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-76 — さすが
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-76',
    'grammar',
    'N4',
    $$さすが$$,
    $$sasuga$$,
    $$Como esperado / Não é à toa / Realmente$$,
    $$さすが é usado para expressar admiração quando alguém ou algo corresponde exatamente à reputação ou à expectativa. Equivale a "como esperado de...", "não é à toa" ou "realmente".

Ele é muito usado para elogiar: quando um profissional faz algo muito bem, quando alguém confirma sua fama, quando um produto é tão bom quanto dizem.

Com に, na forma さすがに, o sentido muda um pouco. Ele passa a indicar "até mesmo" ou "como era de se esperar", geralmente para algo que chegou ao limite, como "até eu fiquei cansado depois de tudo isso".

Sozinho, さすが! também funciona como exclamação de elogio, parecida com "mandou bem!".$$,
    $$Com superiores, dizer apenas さすがですね pode soar como se você estivesse avaliando a pessoa. Em situações formais, é melhor elogiar de forma mais indireta.

さすがに aparece muito com negativas ou limites, como 疲れた e 無理だ.

O kanji 流石 é pouco usado no dia a dia; o mais comum é escrever em hiragana.$$,
    $$さすが + Substantivo + だ / です (como esperado de...)
さすが + だ / です / ね (exclamação de elogio)
さすがに + Adjetivo / Verbo (até mesmo / era de se esperar)

Escrita: さすが / 流石$$,
    $$さすが$$,
    $$さすが|流石$$,
    ARRAY['さすが']::text[],
    ARRAY['さすが', 'さすがに', '流石']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-76', $$さすがプロですね。とても上手です。$$, $$さすがプロですね。とてもじょうずです。$$, $$Não é à toa que é profissional. Muito bom.$$),
    ('n4-grammar-76', $$一回で合格するなんて、さすがだね。$$, $$いっかいでごうかくするなんて、さすがだね。$$, $$Passar de primeira? Mandou bem!$$),
    ('n4-grammar-76', $$一日中歩いて、さすがに疲れました。$$, $$いちにちじゅうあるいて、さすがにつかれました。$$, $$Andei o dia inteiro, e até eu fiquei cansado.$$),
    ('n4-grammar-76', $$このお茶、さすが静岡のお茶ですね。$$, $$このおちゃ、さすがしずおかのおちゃですね。$$, $$Este chá é realmente digno de Shizuoka.$$),
    ('n4-grammar-76', $$三日も寝ていないので、さすがに眠い。$$, $$みっかもねていないので、さすがにねむい。$$, $$Fiquei três dias sem dormir, então é claro que estou com sono.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$全部正解なんて、____田中さんだね。$$, $$Acertar tudo? Como esperado do Tanaka.$$),
        (2, $$____先生ですね。説明がとてもわかりやすい。$$, $$Não é à toa que é professor. A explicação é muito clara.$$),
        (3, $$十時間も歩いたので、____に足が痛い。$$, $$Andei dez horas inteiras, então é claro que meus pés doem.$$),
        (4, $$一人で全部作ったの？____だね。$$, $$Você fez tudo sozinho? Mandou bem!$$),
        (5, $$いつも元気な彼も、今日は____に疲れているようだ。$$, $$Até ele, que está sempre animado, parece cansado hoje.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-76', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さすが$$),
        (2, $$さすが$$),
        (3, $$さすが$$),
        (4, $$さすが$$),
        (5, $$さすが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-77 — 〜し
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-77',
    'grammar',
    'N4',
    $$〜し$$,
    $$shi$$,
    $$E também / Além disso / E (motivos)$$,
    $$し é usado para listar razões ou características, mostrando que há mais de uma. Equivale a "e também" ou "além disso".

Quando aparece mais de uma vez, ele enumera vários motivos ou qualidades que, juntos, levam a uma conclusão. Por exemplo, "é barato, é gostoso, então venho sempre".

Quando aparece só uma vez, ele dá uma razão e deixa subentendido que existem outras. Isso torna a frase mais suave e natural.

É comum usar も junto, reforçando a ideia de acúmulo: "não tenho dinheiro, e também não tenho tempo".

し vem depois da forma simples de verbos e adjetivos. Com substantivos e adjetivos な, coloca-se だ antes de し.$$,
    $$Comparado a から, し é mais suave e deixa a explicação aberta, como se houvesse outros motivos além dos citados.

No final da frase, し sozinho pode funcionar como uma justificativa informal, deixando a conclusão subentendida.

Com a forma educada (です / ます) antes de し, a frase fica um pouco mais formal, mas a forma simples é a mais comum.$$,
    $$Verbo / Adjetivo い (forma simples) + し
Substantivo / Adjetivo な + だ + し
A + し + B + し + Conclusão
Substantivo + も + … + し$$,
    $$し$$,
    $$し、|し。|しね$$,
    ARRAY['し']::text[],
    ARRAY['し']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-77', $$この店は安いし、おいしいし、よく来ます。$$, $$このみせはやすいし、おいしいし、よくきます。$$, $$Esta loja é barata, é gostosa, então venho sempre.$$),
    ('n4-grammar-77', $$雨も降っているし、今日は家にいよう。$$, $$あめもふっているし、きょうはいえにいよう。$$, $$Está chovendo, entre outras coisas, então vou ficar em casa hoje.$$),
    ('n4-grammar-77', $$彼は頭もいいし、優しいし、人気がある。$$, $$かれはあたまもいいし、やさしいし、にんきがある。$$, $$Ele é inteligente, gentil e por isso é popular.$$),
    ('n4-grammar-77', $$もう遅いし、帰りましょう。$$, $$もうおそいし、かえりましょう。$$, $$Já está tarde, vamos embora.$$),
    ('n4-grammar-77', $$この部屋は駅から近いし、静かだし、気に入っています。$$, $$このへやはえきからちかいし、しずかだし、きにいっています。$$, $$Este apartamento é perto da estação, é silencioso, e eu gosto muito dele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お金もない____、時間もないし、旅行は無理です。$$, $$Não tenho dinheiro, nem tempo, então viajar é impossível.$$),
        (2, $$熱もある____、今日は学校を休みます。$$, $$Estou com febre, entre outras coisas, então vou faltar à escola hoje.$$),
        (3, $$彼女はきれいだ____、料理も上手だ。$$, $$Ela é bonita e, além disso, cozinha bem.$$),
        (4, $$この町は便利だ____、人も親切です。$$, $$Esta cidade é prática, e as pessoas também são gentis.$$),
        (5, $$明日は休みだ____、映画でも見に行こうか。$$, $$Amanhã é folga, então vamos ver um filme ou algo assim?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-77', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$し$$),
        (2, $$し$$),
        (3, $$し$$),
        (4, $$し$$),
        (5, $$し$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-78 — そんなに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-78',
    'grammar',
    'N4',
    $$そんなに$$,
    $$sonna ni$$,
    $$Tanto / Tão / Não tão$$,
    $$そんなに significa "tanto" ou "tão". Ele indica um grau ou uma quantidade relacionada ao que foi dito ou ao que se vê na situação.

Em frases afirmativas, そんなに expressa surpresa ou preocupação com algo exagerado, como "por que você está tão bravo?" ou "se comer tanto, vai passar mal".

Em frases negativas, そんなに〜ない significa "não tão..." ou "não muito". É uma forma suave de dizer que algo não é tão grande, difícil ou caro quanto se poderia imaginar.

そんなに faz parte da família こんなに, そんなに, あんなに e どんなに, que seguem a lógica de distância de こ・そ・あ・ど.$$,
    $$そんなに〜ない é parecido com あまり〜ない, mas compara com uma expectativa: "não é tão... quanto você pensa".

こんなに é usado para algo que está perto de quem fala ("tanto assim"), e あんなに para algo distante ou lembrado ("tanto daquele jeito").

そんなに também combina com なくてもいい para tranquilizar alguém, como "não precisa se apressar tanto".$$,
    $$そんなに + Adjetivo / Verbo (tão / tanto)
そんなに + Adjetivo / Verbo negativo (não tão / não muito)

Família: こんなに / そんなに / あんなに / どんなに$$,
    $$そんなに$$,
    $$そんなに$$,
    ARRAY['そんなに']::text[],
    ARRAY['そんなに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-78', $$そんなに急がなくてもいいですよ。$$, $$そんなにいそがなくてもいいですよ。$$, $$Não precisa ter tanta pressa.$$),
    ('n4-grammar-78', $$この料理はそんなに辛くない。$$, $$このりょうりはそんなにからくない。$$, $$Esta comida não é tão apimentada.$$),
    ('n4-grammar-78', $$そんなに食べたら、お腹をこわすよ。$$, $$そんなにたべたら、おなかをこわすよ。$$, $$Se comer tanto, vai passar mal da barriga.$$),
    ('n4-grammar-78', $$試験はそんなに難しくなかった。$$, $$しけんはそんなにむずかしくなかった。$$, $$A prova não foi tão difícil.$$),
    ('n4-grammar-78', $$どうしてそんなに怒っているの？$$, $$どうしてそんなにおこっているの？$$, $$Por que você está tão bravo?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____心配しないでください。$$, $$Não se preocupe tanto.$$),
        (2, $$この映画は____おもしろくなかった。$$, $$Este filme não foi tão interessante.$$),
        (3, $$どうして____たくさん買ったの？$$, $$Por que você comprou tanto?$$),
        (4, $$駅は____遠くないですよ。$$, $$A estação não é tão longe.$$),
        (5, $$毎日____働いたら、病気になりますよ。$$, $$Se trabalhar tanto todo dia, vai ficar doente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-78', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そんなに$$),
        (2, $$そんなに$$),
        (3, $$そんなに$$),
        (4, $$そんなに$$),
        (5, $$そんなに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-79 — それでも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-79',
    'grammar',
    'N4',
    $$それでも$$,
    $$soredemo$$,
    $$Mesmo assim / Ainda assim / Apesar disso$$,
    $$それでも é uma conjunção que significa "mesmo assim" ou "ainda assim". Ela liga duas frases quando a segunda acontece apesar da primeira.

A primeira frase apresenta uma situação que normalmente impediria algo. Depois, それでも introduz o resultado que aconteceu mesmo com essa dificuldade.

Por exemplo, "falhei várias vezes. Mesmo assim, não desisti".

Ela costuma mostrar persistência, determinação ou surpresa. É diferente de でも e しかし, que apenas introduzem um contraste. それでも destaca que algo continuou apesar do obstáculo.$$,
    $$それでも também é usado sozinho em conversas, como uma reação: "mesmo assim (eu quero / eu vou)".

Na escrita mais formal, expressões como にもかかわらず têm sentido parecido, mas são usadas dentro da mesma frase.

Uma frase com それでも muitas vezes transmite emoção ou força de vontade, por isso é comum em histórias e discursos motivacionais.$$,
    $$Frase 1 (com ponto final) + それでも、 + Frase 2$$,
    $$それでも$$,
    $$それでも$$,
    ARRAY['それでも']::text[],
    ARRAY['それでも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-79', $$何度も失敗した。それでも、彼は諦めなかった。$$, $$なんどもしっぱいした。それでも、かれはあきらめなかった。$$, $$Ele falhou várias vezes. Mesmo assim, não desistiu.$$),
    ('n4-grammar-79', $$雨が強く降っていた。それでも、試合は続いた。$$, $$あめがつよくふっていた。それでも、しあいはつづいた。$$, $$Chovia forte. Ainda assim, a partida continuou.$$),
    ('n4-grammar-79', $$値段は高い。それでも、買いたい。$$, $$ねだんはたかい。それでも、かいたい。$$, $$O preço é alto. Mesmo assim, quero comprar.$$),
    ('n4-grammar-79', $$医者に止められた。それでも、父はタバコをやめない。$$, $$いしゃにとめられた。それでも、ちちはタバコをやめない。$$, $$O médico proibiu. Mesmo assim, meu pai não para de fumar.$$),
    ('n4-grammar-79', $$みんなに反対されました。それでも、私は留学することにしました。$$, $$みんなにはんたいされました。それでも、わたしはりゅうがくすることにしました。$$, $$Todos foram contra. Mesmo assim, decidi fazer intercâmbio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は熱があった。____、会社に行った。$$, $$Ele estava com febre. Mesmo assim, foi à empresa.$$),
        (2, $$この仕事は大変だ。____、私は好きだ。$$, $$Este trabalho é pesado. Mesmo assim, eu gosto.$$),
        (3, $$何度も説明した。____、彼はわからなかった。$$, $$Expliquei várias vezes. Ainda assim, ele não entendeu.$$),
        (4, $$道はとても混んでいた。____、時間に間に合った。$$, $$O trânsito estava muito ruim. Mesmo assim, cheguei a tempo.$$),
        (5, $$夜遅くまで勉強しました。____、試験に落ちてしまいました。$$, $$Estudei até tarde da noite. Mesmo assim, fui reprovado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-79', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それでも$$),
        (2, $$それでも$$),
        (3, $$それでも$$),
        (4, $$それでも$$),
        (5, $$それでも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-80 — 〜そうだ（伝聞）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-80',
    'grammar',
    'N4',
    $$〜そうだ（伝聞）$$,
    $$sou da (denbun)$$,
    $$Dizem que / Ouvi dizer que$$,
    $$Nesse uso, そうだ serve para repassar uma informação que a pessoa ouviu ou leu em algum lugar. Equivale a "dizem que" ou "ouvi dizer que".

Quem fala não está dando a própria opinião: está apenas transmitindo o que outra fonte disse, como a previsão do tempo, uma notícia ou um amigo.

É comum indicar a fonte no começo da frase, com によると ("segundo...") ou の話では ("pelo que... disse").

そうだ vem depois da forma simples completa. Com substantivos e adjetivos な, é preciso colocar だ antes: 静かだそうだ, 医者だそうだ.

Não confunda com そうだ de aparência (様態), que significa "parece que vai..." e se liga de outra forma ao verbo e ao adjetivo.$$,
    $$A diferença entre as duas そうだ está na ligação: na de hearsay, usa-se a forma completa, como 降るそうだ (dizem que vai chover); na de aparência, usa-se a base do verbo, como 降りそうだ (parece que vai chover).

そうだ de hearsay não se conjuga no passado nem no negativo: o tempo e a negação ficam na parte antes de そうだ.

らしい também repassa informação, mas acrescenta um pouco de suposição de quem fala.$$,
    $$Verbo (forma simples) + そうだ / そうです
Adjetivo い + そうだ
Adjetivo な + だ + そうだ
Substantivo + だ + そうだ

Fonte: 〜によると / 〜の話では$$,
    $$そうだ$$,
    $$そうだ|そうです$$,
    ARRAY['そう', 'だ']::text[],
    ARRAY['そうだ', 'そうです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-80', $$天気予報によると、明日は雨が降るそうです。$$, $$てんきよほうによると、あしたはあめがふるそうです。$$, $$Segundo a previsão do tempo, dizem que vai chover amanhã.$$),
    ('n4-grammar-80', $$田中さんは来月結婚するそうだ。$$, $$たなかさんはらいげつけっこんするそうだ。$$, $$Ouvi dizer que o Tanaka vai se casar no mês que vem.$$),
    ('n4-grammar-80', $$あのレストランはとてもおいしいそうです。$$, $$あのレストランはとてもおいしいそうです。$$, $$Dizem que aquele restaurante é muito gostoso.$$),
    ('n4-grammar-80', $$ニュースによると、昨日大きな地震があったそうだ。$$, $$ニュースによると、きのうおおきなじしんがあったそうだ。$$, $$Segundo o noticiário, ontem houve um grande terremoto.$$),
    ('n4-grammar-80', $$彼の話では、その町はとても静かだそうです。$$, $$かれのはなしでは、そのまちはとてもしずかだそうです。$$, $$Pelo que ele disse, essa cidade é muito tranquila.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新聞によると、来年から電車の料金が上がる____。$$, $$Segundo o jornal, a tarifa do trem vai subir a partir do ano que vem.$$),
        (2, $$友達の話では、あの映画はおもしろい____。$$, $$Pelo que meu amigo disse, aquele filme é interessante.$$),
        (3, $$先生は来週休む____。$$, $$Dizem que o professor vai faltar semana que vem.$$),
        (4, $$山田さんのお父さんは医者だ____。$$, $$Dizem que o pai do Yamada é médico.$$),
        (5, $$友達によると、昨日のテストは難しかった____です。$$, $$Segundo meu amigo, a prova de ontem foi difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-80', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そうです$$),
        (1, $$そうだ$$),
        (2, $$そうです$$),
        (2, $$そうだ$$),
        (3, $$そうです$$),
        (3, $$そうだ$$),
        (4, $$そうです$$),
        (4, $$そうだ$$),
        (5, $$そう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-81 — 〜そうだ（様態）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-81',
    'grammar',
    'N4',
    $$〜そうだ（様態）$$,
    $$sou da (youtai)$$,
    $$Parece que vai / Parece / Tem cara de$$,
    $$Nesse uso, そうだ expressa uma impressão baseada no que se vê. Equivale a "parece que vai..." ou "parece...".

Com verbos, indica que algo está prestes a acontecer, segundo a aparência da situação. Por exemplo, ver nuvens escuras e dizer que parece que vai chover.

Com adjetivos, indica a impressão visual de uma qualidade antes de confirmá-la. Por exemplo, olhar um bolo e dizer que parece gostoso, mesmo sem ter provado.

A formação é diferente da そうだ de hearsay. Com verbos, usa-se a forma ます sem ます. Com adjetivos い, tira-se o い. Com adjetivos な, basta tirar o な.

Esse uso não é empregado com coisas que já se veem claramente, como dizer que algo bonito "parece bonito" quando é óbvio. Ele é para impressões e previsões.$$,
    $$Com substantivos, essa そうだ não é usada. Para dizer "parece ser estudante", usa-se みたいだ, ようだ ou らしい.

Com adjetivos de aparência óbvia, como きれい e かわいい, そうだ costuma ser evitado quando a qualidade já é evidente.

A forma そうにない indica que algo provavelmente não vai acontecer, como um trabalho que não parece que vai terminar.$$,
    $$Verbo na forma ます sem ます + そうだ
Adjetivo い sem い + そうだ
Adjetivo な (sem な) + そうだ

Exceções: いい → よさそう / ない → なさそう
Negativo de verbo: Verbo sem ます + そうにない / そうもない
Educado: そうです$$,
    $$そうだ$$,
    $$そうだ|そうです|そうにない|そうもない$$,
    ARRAY['そう', 'だ']::text[],
    ARRAY['そうだ', 'そうです', 'そうにない', 'そうもない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-81', $$空が暗い。今にも雨が降りそうだ。$$, $$そらがくらい。いまにもあめがふりそうだ。$$, $$O céu está escuro. Parece que vai chover a qualquer momento.$$),
    ('n4-grammar-81', $$このケーキはおいしそうですね。$$, $$このケーキはおいしそうですね。$$, $$Este bolo parece gostoso, hein.$$),
    ('n4-grammar-81', $$彼は元気そうです。$$, $$かれはげんきそうです。$$, $$Ele parece estar bem.$$),
    ('n4-grammar-81', $$危ない、棚から本が落ちそうです。$$, $$あぶない、たなからほんがおちそうです。$$, $$Cuidado, parece que o livro vai cair da prateleira.$$),
    ('n4-grammar-81', $$この仕事は今日中に終わりそうにない。$$, $$このしごとはきょうじゅうにおわりそうにない。$$, $$Este trabalho não parece que vai terminar hoje.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$空が暗い。雨が降り____。$$, $$O céu está escuro. Parece que vai chover.$$),
        (2, $$田中さん、今日は忙し____ですね。$$, $$O Tanaka parece ocupado hoje, né?$$),
        (3, $$このかばんは丈夫____です。$$, $$Esta bolsa parece resistente.$$),
        (4, $$危ない！あの子が転び____。$$, $$Cuidado! Parece que aquela criança vai cair.$$),
        (5, $$このラーメン、本当においし____。$$, $$Este ramen parece muito gostoso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-81', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そうだ$$),
        (1, $$そうです$$),
        (2, $$そう$$),
        (3, $$そう$$),
        (4, $$そうだ$$),
        (4, $$そうです$$),
        (5, $$そうだ$$),
        (5, $$そうです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-82 — 〜そうに・〜そうな
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-82',
    'grammar',
    'N4',
    $$〜そうに・〜そうな$$,
    $$sou ni / sou na$$,
    $$Parecendo / Com cara de / Que parece$$,
    $$そうに e そうな são formas da そうだ de aparência usadas para modificar outras palavras.

そうな vem antes de um substantivo e descreve como a coisa ou a pessoa parece. Equivale a "que parece..." ou "com cara de...". Por exemplo, "uma maçã que parece gostosa" ou "um rosto com cara de sono".

そうに vem antes de um verbo e descreve o modo como alguém faz algo, segundo a aparência. Equivale a "parecendo..." ou "com cara de...". Por exemplo, "as crianças brincam parecendo se divertir".

Isso acontece porque そう funciona como um adjetivo な: recebe な antes de substantivos e に antes de verbos.

A formação é a mesma de そうだ de aparência: verbos sem ます, adjetivos い sem い e adjetivos な sem な.$$,
    $$そうに é muito usado para descrever emoções de outras pessoas a partir da aparência, como alegria, tristeza e sono, já que em japonês não se afirma diretamente o sentimento dos outros.

A expressão 気持ちよさそうに, "parecendo estar confortável", é comum para descrever animais e pessoas relaxando.

Com verbos, そうな descreve algo prestes a acontecer, como "um céu que parece que vai chover".$$,
    $$Verbo sem ます / Adjetivo い sem い / Adjetivo な + そうな + Substantivo
Verbo sem ます / Adjetivo い sem い / Adjetivo な + そうに + Verbo

Exceções: いい → よさそうな / よさそうに; ない → なさそうな / なさそうに$$,
    $$そうな$$,
    $$そうに|そうな$$,
    ARRAY['そう', 'に', 'な']::text[],
    ARRAY['そうに', 'そうな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-82', $$子供たちが楽しそうに遊んでいます。$$, $$こどもたちがたのしそうにあそんでいます。$$, $$As crianças estão brincando, parecendo se divertir muito.$$),
    ('n4-grammar-82', $$おいしそうなりんごですね。$$, $$おいしそうなりんごですね。$$, $$Que maçã com cara de gostosa!$$),
    ('n4-grammar-82', $$彼は眠そうな顔をしている。$$, $$かれはねむそうなかおをしている。$$, $$Ele está com cara de sono.$$),
    ('n4-grammar-82', $$彼女はうれしそうに笑った。$$, $$かのじょはうれしそうにわらった。$$, $$Ela sorriu com cara de felicidade.$$),
    ('n4-grammar-82', $$今日は雨が降りそうな空だ。$$, $$きょうはあめがふりそうなそらだ。$$, $$Hoje o céu está com cara de chuva.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は寂し____顔をしていた。$$, $$Ele estava com uma cara triste.$$),
        (2, $$猫が気持ちよさ____寝ている。$$, $$O gato está dormindo, parecendo muito confortável.$$),
        (3, $$それは高____時計ですね。$$, $$Esse relógio parece caro, hein.$$),
        (4, $$子供がおいし____ご飯を食べている。$$, $$A criança está comendo com cara de quem está adorando.$$),
        (5, $$彼女は今にも泣き出し____声で話した。$$, $$Ela falou com uma voz de quem ia começar a chorar a qualquer momento.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-82', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そうな$$),
        (2, $$そうに$$),
        (3, $$そうな$$),
        (4, $$そうに$$),
        (5, $$そうな$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-83 — 〜たばかり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-83',
    'grammar',
    'N4',
    $$〜たばかり$$,
    $$ta bakari$$,
    $$Acabar de / Ter acabado de$$,
    $$たばかり é usado para dizer que algo aconteceu há pouco tempo. Equivale a "acabar de" ou "ter acabado de".

Ele é formado pelo verbo na forma た + ばかり. A ideia é que a ação está ainda "fresca" na percepção de quem fala.

O ponto importante é que esse "pouco tempo" é subjetivo. Pode ser alguns minutos, alguns dias ou até alguns meses, dependendo de como a pessoa sente. Por exemplo, alguém pode dizer que acabou de chegar ao Japão mesmo já estando lá há um mês.

ばかり funciona como substantivo, então pode ser seguido de です, なので, なのに e の + substantivo.$$,
    $$A diferença para たところ é a precisão: たところ indica que algo acabou de acontecer neste exato momento; たばかり pode cobrir um período maior, de acordo com a sensação de quem fala.

A combinação たばかりなのに mostra surpresa ou frustração, como "acabei de comprar e já quebrou".

Não confunda com ばかり de "só / nada além de", que vem depois de substantivos.$$,
    $$Verbo na forma た + ばかり + です / だ
Verbo na forma た + ばかり + なので / なのに
Verbo na forma た + ばかり + の + Substantivo$$,
    $$たばかり$$,
    $$たばかり|だばかり$$,
    ARRAY['た', 'ばかり']::text[],
    ARRAY['たばかり', 'だばかり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-83', $$先月、日本に来たばかりです。$$, $$せんげつ、にほんにきたばかりです。$$, $$Acabei de chegar ao Japão no mês passado.$$),
    ('n4-grammar-83', $$さっき起きたばかりなので、まだ眠い。$$, $$さっきおきたばかりなので、まだねむい。$$, $$Acabei de acordar, então ainda estou com sono.$$),
    ('n4-grammar-83', $$買ったばかりの傘をなくしてしまった。$$, $$かったばかりのかさをなくしてしまった。$$, $$Perdi o guarda-chuva que tinha acabado de comprar.$$),
    ('n4-grammar-83', $$この本は昨日読んだばかりです。$$, $$このほんはきのうよんだばかりです。$$, $$Acabei de ler este livro ontem.$$),
    ('n4-grammar-83', $$結婚したばかりの二人は、とても幸せそうだ。$$, $$けっこんしたばかりのふたりは、とてもしあわせそうだ。$$, $$Os dois, que acabaram de se casar, parecem muito felizes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昼ご飯を食べ____なのに、もうお腹がすいた。$$, $$Acabei de almoçar e já estou com fome.$$),
        (2, $$先週、この会社に入っ____です。$$, $$Acabei de entrar nesta empresa na semana passada.$$),
        (3, $$習っ____の漢字をもう忘れた。$$, $$Já esqueci os kanji que acabei de aprender.$$),
        (4, $$この本は先月出____です。$$, $$Este livro acabou de ser lançado no mês passado.$$),
        (5, $$薬を飲ん____だから、少し休んでください。$$, $$Você acabou de tomar o remédio, então descanse um pouco.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-83', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たばかり$$),
        (2, $$たばかり$$),
        (3, $$たばかり$$),
        (4, $$たばかり$$),
        (5, $$だばかり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-84 — 〜たところ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-84',
    'grammar',
    'N4',
    $$〜たところ$$,
    $$ta tokoro$$,
    $$Acabar de (neste exato momento)$$,
    $$たところ é usado para dizer que uma ação acabou de terminar, neste exato momento. Equivale a "acabei de" ou "agora mesmo terminei".

Ele é formado pelo verbo na forma た + ところ. ところ significa "ponto" ou "momento", então a ideia é "estou no ponto logo depois de ter feito isso".

Ele é muito usado para responder perguntas sobre o andamento de algo, como "já comeu?" ou "já chegou?", indicando que a ação foi concluída agorinha.

É comum aparecer com palavras como 今, ちょうど e たった今, que reforçam a ideia de algo recentíssimo.

A diferença em relação a たばかり é o tempo. たところ fala do momento imediatamente após a ação. たばかり pode cobrir um período maior, conforme a sensação de quem fala.$$,
    $$A palavra ところ forma um trio importante: るところ (prestes a fazer), ているところ (no meio de fazer) e たところ (acabou de fazer).

Não confunda com たところ do N3, que significa "quando fiz..., aconteceu tal coisa" e introduz um resultado.

Com たところ, não se usam expressões de tempo amplas como 先週 ou 先月. Para isso, usa-se たばかり.$$,
    $$Verbo na forma た + ところ + です / だ
今 / ちょうど / たった今 + Verbo た + ところです$$,
    $$たところ$$,
    $$たところ|だところ$$,
    ARRAY['た', 'ところ']::text[],
    ARRAY['たところ', 'だところ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-84', $$今、家に着いたところです。$$, $$いま、いえについたところです。$$, $$Acabei de chegar em casa agora.$$),
    ('n4-grammar-84', $$ちょうど今、仕事が終わったところだ。$$, $$ちょうどいま、しごとがおわったところだ。$$, $$O trabalho acabou de terminar agora mesmo.$$),
    ('n4-grammar-84', $$「もう食べた？」「うん、今食べたところ。」$$, $$「もうたべた？」「うん、いまたべたところ。」$$, $$"Já comeu?" "Sim, acabei de comer agora."$$),
    ('n4-grammar-84', $$電車はたった今出たところです。$$, $$でんしゃはたったいまでたところです。$$, $$O trem acabou de sair agora mesmo.$$),
    ('n4-grammar-84', $$今、あなたのメールを読んだところです。$$, $$いま、あなたのメールをよんだところです。$$, $$Acabei de ler o seu e-mail agora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「まだ寝ないの？」「今、宿題が終わっ____だよ。」$$, $$"Ainda não vai dormir?" "Acabei de terminar a lição agora."$$),
        (2, $$今、駅に着い____です。$$, $$Acabei de chegar à estação agora.$$),
        (3, $$映画はちょうど今始まっ____です。$$, $$O filme acabou de começar agora mesmo.$$),
        (4, $$今、薬を飲ん____です。$$, $$Acabei de tomar o remédio agora.$$),
        (5, $$「田中さんはいますか。」「たった今、帰っ____です。」$$, $$"O Tanaka está?" "Ele acabou de ir embora agora mesmo."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-84', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たところ$$),
        (2, $$たところ$$),
        (3, $$たところ$$),
        (4, $$だところ$$),
        (5, $$たところ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-85 — 他動詞・自動詞
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-85',
    'grammar',
    'N4',
    $$他動詞・自動詞$$,
    $$tadoushi / jidoushi$$,
    $$Verbo transitivo / Verbo intransitivo$$,
    $$Em japonês, muitos verbos existem em pares: um transitivo (他動詞) e um intransitivo (自動詞). Os dois falam da mesma mudança, mas com foco diferente.

O verbo transitivo indica que alguém faz uma ação em alguma coisa. A coisa é marcada com を. Por exemplo, "eu abro a janela".

O verbo intransitivo indica que algo muda ou acontece sozinho, sem destacar quem causou. A coisa é marcada com が. Por exemplo, "a janela abre" ou "a janela abriu (com o vento)".

Essa diferença é muito importante no japonês, que muitas vezes prefere descrever o que aconteceu (intransitivo) em vez de dizer quem fez (transitivo).

Os pares mais comuns no N4 são 開ける / 開く, 閉める / 閉まる, つける / つく, 消す / 消える, 始める / 始まる, 止める / 止まる, 落とす / 落ちる, 壊す / 壊れる, 出す / 出る e 入れる / 入る.$$,
    $$Com a forma ている, os verbos intransitivos descrevem um estado: 窓が開いている (a janela está aberta). Com てある, os transitivos indicam que alguém deixou assim de propósito: 窓が開けてある.

Para pedir desculpas, os japoneses às vezes usam o intransitivo para soar menos acusador, como dizer que algo "quebrou" em vez de "eu quebrei". Mas, para assumir a responsabilidade, o transitivo é mais honesto.

Muitos pares seguem padrões, como える (transitivo) e わる / まる (intransitivo), o que ajuda a memorizar.$$,
    $$Transitivo: Pessoa + が + Coisa + を + Verbo transitivo
Intransitivo: Coisa + が + Verbo intransitivo

Pares comuns:
開ける / 開く (abrir)
閉める / 閉まる (fechar)
つける / つく (acender)
消す / 消える (apagar)
始める / 始まる (começar)
止める / 止まる (parar)
落とす / 落ちる (derrubar / cair)
壊す / 壊れる (quebrar)
出す / 出る (tirar / sair)
入れる / 入る (colocar / entrar)$$,
    $$他動詞・自動詞$$,
    $$を開け|が開|を閉め|が閉ま|をつけ|がつ|を消|が消え|を始め|が始ま|を止め|が止ま|を落と|が落ち|を壊|が壊れ|を出|が出|を入れ|が入$$,
    ARRAY['を', 'が']::text[],
    ARRAY['開ける', '開く', '閉める', '閉まる', 'つける', 'つく', '消す', '消える', '始める', '始まる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-85', $$暑いので、私は窓を開けました。$$, $$あついので、わたしはまどをあけました。$$, $$Como estava quente, eu abri a janela.$$),
    ('n4-grammar-85', $$風で窓が開きました。$$, $$かぜでまどがあきました。$$, $$A janela abriu com o vento.$$),
    ('n4-grammar-85', $$先生が授業を始めます。$$, $$せんせいがじゅぎょうをはじめます。$$, $$O professor começa a aula.$$),
    ('n4-grammar-85', $$毎朝九時に授業が始まります。$$, $$まいあさくじにじゅぎょうがはじまります。$$, $$A aula começa às nove toda manhã.$$),
    ('n4-grammar-85', $$部屋の電気が消えています。$$, $$へやのでんきがきえています。$$, $$A luz do quarto está apagada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寒いので、ドアを____ください。$$, $$Está frio, então feche a porta, por favor.$$),
        (2, $$風でドアが____。$$, $$A porta fechou com o vento.$$),
        (3, $$暗いから、電気を____ください。$$, $$Está escuro, então acenda a luz, por favor.$$),
        (4, $$停電で、電気が____。$$, $$Com a queda de energia, a luz apagou.$$),
        (5, $$十時に会議が____。$$, $$A reunião começa às dez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-85', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$閉めて$$),
        (2, $$閉まりました$$),
        (2, $$閉まった$$),
        (3, $$つけて$$),
        (4, $$消えました$$),
        (4, $$消えた$$),
        (5, $$始まります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-86 — 〜たがる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-86',
    'grammar',
    'N4',
    $$〜たがる$$,
    $$tagaru$$,
    $$Querer (outra pessoa) / Ter vontade de$$,
    $$たがる é usado para falar do desejo de outra pessoa, ou seja, para dizer que um terceiro quer fazer algo. Equivale a "querer" ou "ter vontade de", quando o sujeito não é quem fala.

Em japonês, a forma たい expressa um desejo interno, e só a própria pessoa pode afirmá-lo com certeza. Para falar do desejo de outra pessoa, usa-se たがる, que descreve o desejo a partir do comportamento visível.

Ele é formado tirando o い de たい e acrescentando がる. O resultado funciona como um verbo do grupo 1.

Para um desejo no momento, usa-se たがっている. Para uma tendência geral, como "crianças sempre querem brincar", usa-se たがる.

Como たがる é um verbo de ação, o objeto é marcado com を.$$,
    $$Usar たがる para superiores pode soar desrespeitoso, porque descreve o desejo deles como algo observado de fora. Nesses casos, é melhor dizer 〜たいとおっしゃっていました.

Para coisas desejadas, e não ações, usa-se ほしがる.

Para falar de alguém próximo, como familiares, たがっている é muito natural no dia a dia.$$,
    $$Verbo na forma ます sem ます + たがる

Desejo no momento: たがっている / たがっています
Tendência geral: たがる / たがります
Negativo: たがらない$$,
    $$たがる$$,
    $$たがる|たがって|たがった|たがります|たがらない$$,
    ARRAY['たがる']::text[],
    ARRAY['たがる', 'たがっている', 'たがります', 'たがらない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-86', $$子供はいつも外で遊びたがります。$$, $$こどもはいつもそとであそびたがります。$$, $$As crianças sempre querem brincar lá fora.$$),
    ('n4-grammar-86', $$弟は新しいスマホを買いたがっている。$$, $$おとうとはあたらしいスマホをかいたがっている。$$, $$Meu irmão mais novo está querendo comprar um celular novo.$$),
    ('n4-grammar-86', $$娘は一人で何でもやりたがる。$$, $$むすめはひとりでなんでもやりたがる。$$, $$Minha filha quer fazer tudo sozinha.$$),
    ('n4-grammar-86', $$父は病院に行きたがらない。$$, $$ちちはびょういんにいきたがらない。$$, $$Meu pai não quer ir ao hospital.$$),
    ('n4-grammar-86', $$妻は海外旅行に行きたがっています。$$, $$つまはかいがいりょこうにいきたがっています。$$, $$Minha esposa está querendo fazer uma viagem ao exterior.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$息子は犬を飼い____います。$$, $$Meu filho está querendo ter um cachorro.$$),
        (2, $$子供は甘い物を食べ____。$$, $$As crianças querem comer doces.$$),
        (3, $$彼女は最近、誰にも会い____。$$, $$Ultimamente ela não quer ver ninguém.$$),
        (4, $$弟は日本へ留学し____いる。$$, $$Meu irmão mais novo está querendo fazer intercâmbio no Japão.$$),
        (5, $$犬が散歩に行き____。$$, $$O cachorro está querendo passear.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-86', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たがって$$),
        (2, $$たがります$$),
        (2, $$たがる$$),
        (3, $$たがらない$$),
        (4, $$たがって$$),
        (5, $$たがっている$$),
        (5, $$たがっています$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-87 — 〜たら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-87',
    'grammar',
    'N4',
    $$〜たら$$,
    $$tara$$,
    $$Se / Quando / Depois que$$,
    $$たら é a forma condicional mais usada na conversa. Ela pode significar "se", "quando" ou "depois que", dependendo da frase.

No sentido de "se", ela apresenta uma condição hipotética: se algo acontecer, haverá um resultado.

No sentido de "quando" ou "depois que", ela indica que, depois de uma ação acontecer, outra vai acontecer. Nesse caso, a primeira ação certamente vai ocorrer, como chegar à estação.

No passado, たら pode descrever uma descoberta: "quando fiz isso, aconteceu tal coisa". A segunda parte mostra algo inesperado ou uma constatação.

たら é formado com a forma た + ら. Diferente de ば, a segunda parte pode ser um pedido, uma ordem, uma vontade ou uma sugestão.$$,
    $$たら é o "se" mais versátil do japonês. Quando estiver em dúvida, ele costuma ser a opção mais segura na conversa.

Com descobertas no passado, a segunda parte não pode ser uma ação controlada por quem fala.

Em frases como もし〜たら, a palavra もし reforça a ideia de hipótese.$$,
    $$Verbo na forma た + ら
Adjetivo い sem い + かったら
Adjetivo な / Substantivo + だったら
Negativo: Verbo ない → なかったら$$,
    $$たら$$,
    $$たら|だら$$,
    ARRAY['たら']::text[],
    ARRAY['たら', 'だら', 'かったら', 'だったら', 'なかったら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-87', $$雨が降ったら、試合は中止です。$$, $$あめがふったら、しあいはちゅうしです。$$, $$Se chover, a partida será cancelada.$$),
    ('n4-grammar-87', $$駅に着いたら、電話してください。$$, $$えきについたら、でんわしてください。$$, $$Quando chegar à estação, me ligue.$$),
    ('n4-grammar-87', $$お金があったら、世界一周したい。$$, $$おかねがあったら、せかいいっしゅうしたい。$$, $$Se eu tivesse dinheiro, queria dar a volta ao mundo.$$),
    ('n4-grammar-87', $$安かったら、買います。$$, $$やすかったら、かいます。$$, $$Se for barato, eu compro.$$),
    ('n4-grammar-87', $$窓を開けたら、富士山が見えた。$$, $$まどをあけたら、ふじさんがみえた。$$, $$Quando abri a janela, deu para ver o Monte Fuji.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$宿題が終わっ____、遊びに行ってもいいよ。$$, $$Quando terminar a lição, pode ir brincar.$$),
        (2, $$暇だっ____、一緒に映画を見ませんか。$$, $$Se estiver livre, quer ver um filme comigo?$$),
        (3, $$大人になっ____、何になりたい？$$, $$Quando crescer, o que você quer ser?$$),
        (4, $$その薬を飲ん____、すぐ治りました。$$, $$Quando tomei esse remédio, melhorei logo.$$),
        (5, $$家に帰っ____、誰もいなかった。$$, $$Quando voltei para casa, não havia ninguém.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-87', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たら$$),
        (2, $$たら$$),
        (3, $$たら$$),
        (4, $$だら$$),
        (5, $$たら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-88 — 〜たらどう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-88',
    'grammar',
    'N4',
    $$〜たらどう$$,
    $$tara dou$$,
    $$Que tal...? / Por que você não...?$$,
    $$たらどう é usado para dar uma sugestão ou um conselho. Equivale a "que tal...?" ou "por que você não...?".

Ele junta a forma たら ("se fizer") com どう ("como fica?"). A ideia literal é "se você fizer isso, que tal?".

A forma たらどう？ é informal e usada com amigos e familiares. A forma たらどうですか é educada, e たらいかがですか é ainda mais polida.

O tom é de recomendação, mas, dependendo da entonação, たらどう pode soar como uma cobrança ou um conselho impaciente, como "por que você não faz logo isso?".$$,
    $$Com superiores, prefira たらいかがですか, que soa respeitoso e suave.

ほうがいい também dá conselhos, mas soa mais firme. たらどう deixa a decisão mais aberta para o outro.

Às vezes, a frase termina só em たら, sem どう, com o mesmo sentido de sugestão.$$,
    $$Verbo na forma た + ら + どう？ (informal)
Verbo na forma た + ら + どうですか (educado)
Verbo na forma た + ら + いかがですか (muito educado)$$,
    $$たらどう$$,
    $$たらどう|だらどう$$,
    ARRAY['たら', 'どう']::text[],
    ARRAY['たらどう', 'たらどうですか', 'たらいかがですか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-88', $$疲れているなら、少し休んだらどう？$$, $$つかれているなら、すこしやすんだらどう？$$, $$Se está cansado, que tal descansar um pouco?$$),
    ('n4-grammar-88', $$先生に相談したらどうですか。$$, $$せんせいにそうだんしたらどうですか。$$, $$Por que você não conversa com o professor?$$),
    ('n4-grammar-88', $$一度、医者に見てもらったらどう？$$, $$いちど、いしゃにみてもらったらどう？$$, $$Que tal ir ao médico uma vez?$$),
    ('n4-grammar-88', $$雨が降りそうだから、傘を持って行ったらどうですか。$$, $$あめがふりそうだから、かさをもっていったらどうですか。$$, $$Parece que vai chover, que tal levar um guarda-chuva?$$),
    ('n4-grammar-88', $$もう少し早く起きたらどう？$$, $$もうすこしはやくおきたらどう？$$, $$Que tal acordar um pouco mais cedo?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$わからないなら、辞書で調べ____？$$, $$Se não entende, que tal procurar no dicionário?$$),
        (2, $$寒いなら、コートを着____ですか。$$, $$Se está com frio, que tal vestir o casaco?$$),
        (3, $$毎日少しずつ練習し____？$$, $$Que tal praticar um pouco todo dia?$$),
        (4, $$熱があるなら、病院に行っ____ですか。$$, $$Se está com febre, por que não vai ao hospital?$$),
        (5, $$気になるなら、本人に直接聞い____？$$, $$Se está curioso, por que não pergunta direto para a pessoa?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-88', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たらどう$$),
        (2, $$たらどう$$),
        (3, $$たらどう$$),
        (4, $$たらどう$$),
        (5, $$たらどう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-89 — 〜たらいいですか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-89',
    'grammar',
    'N4',
    $$〜たらいいですか$$,
    $$tara ii desu ka$$,
    $$O que devo...? / Como devo...?$$,
    $$たらいいですか é usado para pedir conselho ou instrução. Equivale a "o que devo fazer?", "como devo...?" ou "onde devo...?".

Ele junta a forma たら ("se fizer") com いいですか ("está bom?"). A ideia literal é "se eu fizer..., está bom?".

Quase sempre aparece com palavras interrogativas, como どう, 何, どこ, いつ e 誰, para perguntar qual é a melhor forma de agir.

Dentro de uma frase maior, como "não sei para quem perguntar", usa-se たらいいか, seguido de わからない ou 迷う.

Para ser ainda mais educado, usa-se たらいいでしょうか.$$,
    $$どうしたらいいですか é uma das perguntas mais úteis para pedir ajuda em qualquer situação.

ばいいですか tem o mesmo sentido e também é muito usada. A diferença é pequena e muitas vezes as duas podem ser trocadas.

A resposta costuma vir com たらいいですよ ou ばいいですよ, oferecendo a sugestão.$$,
    $$Palavra interrogativa + … + Verbo na forma た + らいいですか
Palavra interrogativa + … + Verbo た + らいいか + わからない / 迷う

Mais educado: たらいいでしょうか
Equivalente: ばいいですか$$,
    $$たらいいですか$$,
    $$たらいい|だらいい$$,
    ARRAY['たら', 'いい', 'ですか']::text[],
    ARRAY['たらいいですか', 'たらいいでしょうか', 'たらいいか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-89', $$すみません、駅までどう行ったらいいですか。$$, $$すみません、えきまでどういったらいいですか。$$, $$Com licença, como faço para ir até a estação?$$),
    ('n4-grammar-89', $$このボタンはいつ押したらいいですか。$$, $$このボタンはいつおしたらいいですか。$$, $$Quando devo apertar este botão?$$),
    ('n4-grammar-89', $$誰に聞いたらいいかわからない。$$, $$だれにきいたらいいかわからない。$$, $$Não sei para quem perguntar.$$),
    ('n4-grammar-89', $$母の誕生日に何を買ったらいいでしょうか。$$, $$ははのたんじょうびになにをかったらいいでしょうか。$$, $$O que devo comprar para o aniversário da minha mãe?$$),
    ('n4-grammar-89', $$この薬は一日何回飲んだらいいですか。$$, $$このくすりはいちにちなんかいのんだらいいですか。$$, $$Quantas vezes por dia devo tomar este remédio?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この書類はどこに出し____。$$, $$Onde devo entregar este documento?$$),
        (2, $$明日は何時に来____ですか。$$, $$A que horas devo vir amanhã?$$),
        (3, $$日本語が上手になるには、どうし____ですか。$$, $$O que devo fazer para melhorar meu japonês?$$),
        (4, $$パーティーに何を着て行っ____か、迷っています。$$, $$Estou em dúvida sobre o que vestir para a festa.$$),
        (5, $$この漢字は何と読ん____ですか。$$, $$Como devo ler este kanji?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-89', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たらいいですか$$),
        (2, $$たらいい$$),
        (3, $$たらいい$$),
        (4, $$たらいい$$),
        (5, $$だらいい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-90 — 〜て・〜で（接続）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-90',
    'grammar',
    'N4',
    $$〜て・〜で（接続）$$,
    $$te / de (setsuzoku)$$,
    $$E / E depois / Por isso$$,
    $$A forma て (ou で) é usada para ligar frases e ideias. Ela é uma das ferramentas mais importantes do japonês, e o sentido depende do contexto.

Os usos principais são:
• Sequência de ações: uma ação depois da outra, na ordem em que acontecem.
• Lista de características: ligar adjetivos ou descrições, como "amplo e claro".
• Causa ou motivo: a primeira parte explica o resultado da segunda, como "peguei um resfriado e faltei".
• Modo: como uma ação é feita, como ir a pé ou ir de óculos.

Com verbos, usa-se a forma て. Com adjetivos い, troca-se い por くて. Com adjetivos な e substantivos, usa-se で.

O tempo e a formalidade da frase ficam apenas no último verbo.$$,
    $$Quando a forma て indica causa, a segunda parte normalmente não pode ser um pedido ou uma vontade. Nesses casos, usa-se から ou ので.

Ao ligar adjetivos, as qualidades devem ter o mesmo tom: duas positivas ou duas negativas. Para contraste, usa-se けど ou が.

O で de substantivos aqui é a forma て de です, e não a partícula で de lugar.$$,
    $$Verbo na forma て + Frase
Adjetivo い sem い + くて + Frase
Adjetivo な / Substantivo + で + Frase$$,
    $$て$$,
    $$て|で$$,
    ARRAY['て', 'で']::text[],
    ARRAY['て', 'で', 'くて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-90', $$朝起きて、顔を洗って、ご飯を食べます。$$, $$あさおきて、かおをあらって、ごはんをたべます。$$, $$De manhã, acordo, lavo o rosto e tomo café.$$),
    ('n4-grammar-90', $$この部屋は広くて、明るいです。$$, $$このへやはひろくて、あかるいです。$$, $$Este quarto é amplo e claro.$$),
    ('n4-grammar-90', $$彼は親切で、優しい人です。$$, $$かれはしんせつで、やさしいひとです。$$, $$Ele é atencioso e gentil.$$),
    ('n4-grammar-90', $$風邪をひいて、学校を休みました。$$, $$かぜをひいて、がっこうをやすみました。$$, $$Peguei um resfriado e faltei à escola.$$),
    ('n4-grammar-90', $$雨で、試合が中止になった。$$, $$あめで、しあいがちゅうしになった。$$, $$Por causa da chuva, a partida foi cancelada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$デパートへ行っ____、服を買いました。$$, $$Fui à loja de departamentos e comprei roupas.$$),
        (2, $$このかばんは安く____、便利です。$$, $$Esta bolsa é barata e prática.$$),
        (3, $$姉はきれい____、頭がいい。$$, $$Minha irmã mais velha é bonita e inteligente.$$),
        (4, $$宿題が多く____、遊ぶ時間がない。$$, $$Tenho muita lição e não sobra tempo para brincar.$$),
        (5, $$その本を読ん____、感想を書きました。$$, $$Li esse livro e escrevi minha opinião.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-90', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$て$$),
        (2, $$て$$),
        (3, $$で$$),
        (4, $$て$$),
        (5, $$で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-91 — 〜てあげる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-91',
    'grammar',
    'N4',
    $$〜てあげる$$,
    $$te ageru$$,
    $$Fazer (algo) para alguém / Fazer o favor de$$,
    $$てあげる é usado para dizer que você, ou alguém do seu grupo, faz algo em benefício de outra pessoa. Equivale a "fazer algo para alguém".

Ele junta a forma て do verbo com あげる (dar). A ideia é "dar" uma ação como favor: ensinar, ajudar, comprar algo, emprestar.

A pessoa que recebe o favor é marcada com に, e quem faz a ação costuma ser o sujeito.

Um ponto cultural importante: como てあげる destaca que você está fazendo um favor, usá-lo diretamente com superiores, ou ao oferecer ajuda a alguém que não é próximo, pode soar arrogante. Nesses casos, prefere-se ましょうか ou formas humildes como お〜します.

Com pessoas próximas, crianças e animais, てあげる é natural.$$,
    $$Para crianças, animais e plantas, também se usa てやる, que é mais informal.

Para ações feitas por outros em seu benefício, usa-se てくれる; para ações que você pede ou recebe, usa-se てもらう.

Ao contar algo que você fez por alguém, てあげた é natural entre amigos, mas pode soar como se gabar se exagerado.$$,
    $$Pessoa + に + Objeto + を + Verbo na forma て + あげる
Verbo na forma て + あげる

Passado: てあげた / てあげました
Pedido para outra pessoa: てあげてください
Mais humilde: てさしあげる$$,
    $$てあげる$$,
    $$てあげ|であげ$$,
    ARRAY['て', 'あげる']::text[],
    ARRAY['てあげる', 'てあげた', 'てあげました', 'てあげて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-91', $$弟に宿題を教えてあげました。$$, $$おとうとにしゅくだいをおしえてあげました。$$, $$Ensinei a lição para o meu irmão mais novo.$$),
    ('n4-grammar-91', $$友達の引っ越しを手伝ってあげた。$$, $$ともだちのひっこしをてつだってあげた。$$, $$Ajudei meu amigo na mudança.$$),
    ('n4-grammar-91', $$母の日に、母に花を買ってあげたいです。$$, $$ははのひに、ははにはなをかってあげたいです。$$, $$No Dia das Mães, quero comprar flores para minha mãe.$$),
    ('n4-grammar-91', $$毎晩、子供に本を読んであげます。$$, $$まいばん、こどもにほんをよんであげます。$$, $$Toda noite, leio um livro para o meu filho.$$),
    ('n4-grammar-91', $$道に迷っている人に、駅までの道を教えてあげた。$$, $$みちにまよっているひとに、えきまでのみちをおしえてあげた。$$, $$Ensinei o caminho até a estação para uma pessoa que estava perdida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$妹に新しい服を買っ____。$$, $$Comprei roupas novas para a minha irmã mais nova.$$),
        (2, $$駅で、おばあさんの荷物を持っ____。$$, $$Na estação, carreguei a bagagem de uma senhora idosa.$$),
        (3, $$友達に私の辞書を貸し____。$$, $$Emprestei meu dicionário para um amigo.$$),
        (4, $$毎晩、子供に絵本を読ん____います。$$, $$Toda noite, leio livros ilustrados para o meu filho.$$),
        (5, $$困っている人がいたら、助け____ください。$$, $$Se houver alguém em dificuldade, ajude, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-91', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てあげました$$),
        (1, $$てあげた$$),
        (2, $$てあげました$$),
        (2, $$てあげた$$),
        (3, $$てあげました$$),
        (3, $$てあげた$$),
        (4, $$であげて$$),
        (5, $$てあげて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-92 — 〜てほしい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-92',
    'grammar',
    'N4',
    $$〜てほしい$$,
    $$te hoshii$$,
    $$Querer que (alguém) faça / Gostaria que$$,
    $$てほしい é usado para dizer que você quer que outra pessoa faça algo, ou que algo aconteça. Equivale a "querer que..." ou "gostaria que...".

A diferença em relação a たい é quem faz a ação. Com たい, é você que quer fazer. Com てほしい, você quer que outra pessoa faça.

A pessoa de quem se espera a ação é marcada com に. Para desejos sobre coisas que não são pessoas, como o tempo ou uma situação, ela é marcada com が.

Na forma negativa, ないでほしい significa "não quero que...", "gostaria que não...".

Dizer てほしい diretamente a superiores pode soar exigente. Com eles, é melhor usar pedidos como ていただけませんか.$$,
    $$Terminar com てほしいんですが… é uma forma comum de fazer um pedido de modo indireto, deixando a frase em aberto.

Com superiores, てほしい soa como uma exigência. Prefira ていただきたいです ou ていただけませんか.

Como ほしい é um adjetivo い, てほしい se conjuga como tal: てほしくない, てほしかった.$$,
    $$Pessoa + に + Verbo na forma て + ほしい
Coisa / Situação + が + Verbo na forma て + ほしい
Verbo na forma ない + で + ほしい (não quero que...)

Educado: てほしいです
Pedido indireto: てほしいんですが…

Escrita: ほしい / 欲しい$$,
    $$てほしい$$,
    $$てほしい|でほしい|て欲しい|で欲しい|てほしく|でほしく$$,
    ARRAY['て', 'ほしい']::text[],
    ARRAY['てほしい', 'てほしいです', 'ないでほしい', 'て欲しい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-92', $$もっとゆっくり話してほしい。$$, $$もっとゆっくりはなしてほしい。$$, $$Queria que você falasse mais devagar.$$),
    ('n4-grammar-92', $$母にはいつまでも元気でいてほしいです。$$, $$ははにはいつまでもげんきでいてほしいです。$$, $$Quero que minha mãe continue saudável para sempre.$$),
    ('n4-grammar-92', $$このことは誰にも言わないでほしい。$$, $$このことはだれにもいわないでほしい。$$, $$Não quero que você conte isso para ninguém.$$),
    ('n4-grammar-92', $$早く春が来てほしいなあ。$$, $$はやくはるがきてほしいなあ。$$, $$Queria que a primavera chegasse logo.$$),
    ('n4-grammar-92', $$すみません、この仕事を手伝ってほしいんですが…。$$, $$すみません、このしごとをてつだってほしいんですが…。$$, $$Com licença, eu queria que você me ajudasse com este trabalho...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日は早く来____。$$, $$Quero que você venha cedo amanhã.$$),
        (2, $$彼にもっと勉強し____です。$$, $$Quero que ele estude mais.$$),
        (3, $$この話は秘密にし____。$$, $$Quero que esta história fique em segredo.$$),
        (4, $$部屋でタバコを吸わない____。$$, $$Não quero que você fume no quarto.$$),
        (5, $$雨が早くやん____なあ。$$, $$Queria que a chuva parasse logo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-92', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てほしい$$),
        (1, $$てほしいです$$),
        (2, $$てほしい$$),
        (3, $$てほしい$$),
        (4, $$でほしい$$),
        (5, $$でほしい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-93 — 〜ていく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-93',
    'grammar',
    'N4',
    $$〜ていく$$,
    $$te iku$$,
    $$Ir (fazendo) / Levar / Daqui em diante$$,
    $$ていく junta a forma て de um verbo com 行く (ir). A ideia central é movimento ou mudança que se afasta de quem fala, no espaço ou no tempo.

Os usos principais são:
• Fazer algo e ir: fazer uma ação antes de sair, ou ir de certo modo, como ir a pé.
• Levar algo ou alguém: 持っていく (levar uma coisa), 連れていく (levar uma pessoa).
• Movimento para longe: algo que se afasta de quem fala, como pássaros voando para longe.
• Mudança daqui para o futuro: algo que vai continuar mudando ou acontecendo a partir de agora, como esfriar cada vez mais ou continuar estudando.

O oposto é てくる, que indica movimento ou mudança em direção a quem fala, ou do passado até agora.$$,
    $$No uso de mudança, ていく olha para o futuro: "daqui para frente". てくる olha do passado até agora: "vem mudando até hoje".

Na escrita, quando ていく tem sentido abstrato (mudança no tempo), costuma ser escrito em hiragana.

Na fala casual, ていく às vezes vira てく, como em 持ってく.$$,
    $$Verbo na forma て + いく

Educado: ていきます
Passado: ていった / ていきました

Escrita: ていく / て行く$$,
    $$ていく$$,
    $$ていく|ていき|ていっ|でいく|でいき|でいっ|て行|で行$$,
    ARRAY['て', 'いく']::text[],
    ARRAY['ていく', 'ていきます', 'ていった', 'て行く']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-93', $$雨が降るから、傘を持っていってください。$$, $$あめがふるから、かさをもっていってください。$$, $$Vai chover, então leve o guarda-chuva.$$),
    ('n4-grammar-93', $$駅まで歩いていきます。$$, $$えきまであるいていきます。$$, $$Vou a pé até a estação.$$),
    ('n4-grammar-93', $$これからも日本語の勉強を続けていきたい。$$, $$これからもにほんごのべんきょうをつづけていきたい。$$, $$Daqui em diante, quero continuar estudando japonês.$$),
    ('n4-grammar-93', $$これから寒くなっていくので、体に気をつけてください。$$, $$これからさむくなっていくので、からだにきをつけてください。$$, $$Daqui para frente vai esfriar cada vez mais, então cuide da saúde.$$),
    ('n4-grammar-93', $$鳥が南へ飛んでいった。$$, $$とりがみなみへとんでいった。$$, $$Os pássaros foram voando para o sul.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨が降りそうだから、傘を持っ____ほうがいいよ。$$, $$Parece que vai chover, então é melhor levar o guarda-chuva.$$),
        (2, $$学校までバスに乗っ____。$$, $$Vou de ônibus até a escola.$$),
        (3, $$これから日本の人口は減っ____でしょう。$$, $$Daqui em diante, a população do Japão deve continuar diminuindo.$$),
        (4, $$子供たちは公園へ走っ____。$$, $$As crianças foram correndo para o parque.$$),
        (5, $$せっかくだから、ここで朝ご飯を食べ____ませんか。$$, $$Já que estamos aqui, que tal tomar café da manhã antes de ir?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-93', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていった$$),
        (2, $$ていきます$$),
        (2, $$ていく$$),
        (3, $$ていく$$),
        (4, $$ていきました$$),
        (4, $$ていった$$),
        (5, $$ていき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-94 — 〜ていた
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-94',
    'grammar',
    'N4',
    $$〜ていた$$,
    $$te ita$$,
    $$Estava fazendo / Fazia / Tinha (estado)$$,
    $$ていた é o passado de ている. Ele tem os mesmos usos de ている, mas olhando para o passado.

Os usos principais são:
• Ação em andamento no passado: o que alguém estava fazendo em certo momento, como "estava vendo TV quando o telefone tocou".
• Estado no passado: uma situação que durava, como "morava em Osaka quando era criança".
• Hábito no passado: algo que a pessoa fazia regularmente, como "corria todo dia quando era estudante".
• Descoberta de um estado: ao chegar a um lugar, encontrar algo já de certo jeito, como "quando acordei, estava nevando".

É muito usado em histórias e relatos, para dar o contexto em que outra ação aconteceu.$$,
    $$Compare: 食べた indica uma ação concluída; 食べていた indica que a ação estava acontecendo naquele momento.

Junto com とき, ていた descreve o pano de fundo de um acontecimento: "quando X aconteceu, eu estava fazendo Y".

Na fala, ていた costuma ser reduzido para てた.$$,
    $$Verbo na forma て + いた
Verbo na forma て + いました (educado)

Negativo: ていなかった / ていませんでした
Fala casual: てた$$,
    $$ていた$$,
    $$ていた|でいた|ていました|でいました$$,
    ARRAY['て', 'いた']::text[],
    ARRAY['ていた', 'ていました', 'でいた', 'てた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-94', $$昨日の夜は、ずっとテレビを見ていた。$$, $$きのうのよるは、ずっとテレビをみていた。$$, $$Ontem à noite, fiquei vendo TV o tempo todo.$$),
    ('n4-grammar-94', $$電話が鳴ったとき、お風呂に入っていました。$$, $$でんわがなったとき、おふろにはいっていました。$$, $$Quando o telefone tocou, eu estava no banho.$$),
    ('n4-grammar-94', $$子供のころ、大阪に住んでいた。$$, $$こどものころ、おおさかにすんでいた。$$, $$Quando eu era criança, morava em Osaka.$$),
    ('n4-grammar-94', $$朝起きたら、雪が降っていました。$$, $$あさおきたら、ゆきがふっていました。$$, $$Quando acordei de manhã, estava nevando.$$),
    ('n4-grammar-94', $$学生のころ、毎日ジョギングをしていました。$$, $$がくせいのころ、まいにちジョギングをしていました。$$, $$Na época de estudante, eu corria todos os dias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日の三時ごろ、何をし____か。$$, $$O que você estava fazendo ontem por volta das três?$$),
        (2, $$彼が来たとき、私は本を読ん____。$$, $$Quando ele chegou, eu estava lendo um livro.$$),
        (3, $$十年前、父は銀行で働い____。$$, $$Dez anos atrás, meu pai trabalhava num banco.$$),
        (4, $$家に帰ったら、ドアが開い____。$$, $$Quando voltei para casa, a porta estava aberta.$$),
        (5, $$昔、この町には大きな川が流れ____。$$, $$Antigamente, passava um rio grande por esta cidade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-94', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていました$$),
        (2, $$でいました$$),
        (2, $$でいた$$),
        (3, $$ていました$$),
        (3, $$ていた$$),
        (4, $$ていました$$),
        (4, $$ていた$$),
        (5, $$ていました$$),
        (5, $$ていた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-95 — 〜ていただけませんか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-95',
    'grammar',
    'N4',
    $$〜ていただけませんか$$,
    $$te itadakemasen ka$$,
    $$Poderia (fazer) por favor? / O senhor poderia...?$$,
    $$ていただけませんか é uma forma muito educada de pedir algo a alguém. Equivale a "poderia, por favor...?" ou "o senhor poderia...?".

Ela vem de ていただく, a forma humilde de てもらう (receber uma ação). A ideia literal é "eu não poderia receber de você o favor de fazer isso?".

A forma negativa com pergunta deixa o pedido ainda mais suave, porque dá liberdade ao outro de recusar. Por isso, é ideal para pedir algo a superiores, clientes, desconhecidos e em situações formais.

ていただけますか também é educada, mas ていただけませんか soa um pouco mais gentil e humilde.$$,
    $$Em e-mails de trabalho, ていただけませんでしょうか é uma versão ainda mais formal.

Quem faz a ação é a outra pessoa, mas quem fala fica como "receptor" do favor. Por isso, é uma forma humilde.

Para aceitar um pedido assim, respostas comuns são はい、いいですよ ou かしこまりました, no atendimento.$$,
    $$Verbo na forma て + いただけませんか
Verbo na forma て + いただけますか (um pouco menos suave)

Do mais casual ao mais formal:
てくれる？ → てくれませんか → てもらえませんか → ていただけますか → ていただけませんか$$,
    $$ていただけませんか$$,
    $$ていただけませんか|でいただけませんか|ていただけますか|でいただけますか$$,
    ARRAY['て', 'いただけません', 'か']::text[],
    ARRAY['ていただけませんか', 'ていただけますか', 'でいただけませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-95', $$すみません、もう一度説明していただけませんか。$$, $$すみません、もういちどせつめいしていただけませんか。$$, $$Desculpe, poderia explicar mais uma vez?$$),
    ('n4-grammar-95', $$この書類を見ていただけませんか。$$, $$このしょるいをみていただけませんか。$$, $$O senhor poderia dar uma olhada neste documento?$$),
    ('n4-grammar-95', $$少し待っていただけますか。$$, $$すこしまっていただけますか。$$, $$Poderia esperar um pouco?$$),
    ('n4-grammar-95', $$駅までの道を教えていただけませんか。$$, $$えきまでのみちをおしえていただけませんか。$$, $$Poderia me ensinar o caminho até a estação?$$),
    ('n4-grammar-95', $$この漢字の読み方を教えていただけませんか。$$, $$このかんじのよみかたをおしえていただけませんか。$$, $$Poderia me ensinar como se lê este kanji?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、写真を撮っ____。$$, $$Com licença, poderia tirar uma foto?$$),
        (2, $$もう少しゆっくり話し____。$$, $$Poderia falar um pouco mais devagar?$$),
        (3, $$先生、その本を貸し____。$$, $$Professor, poderia me emprestar esse livro?$$),
        (4, $$明日の会議の資料を読ん____。$$, $$Poderia ler os documentos da reunião de amanhã?$$),
        (5, $$ここにお名前を書い____。$$, $$Poderia escrever seu nome aqui?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-95', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていただけませんか$$),
        (1, $$ていただけますか$$),
        (2, $$ていただけませんか$$),
        (2, $$ていただけますか$$),
        (3, $$ていただけませんか$$),
        (3, $$ていただけますか$$),
        (4, $$でいただけませんか$$),
        (4, $$でいただけますか$$),
        (5, $$ていただけませんか$$),
        (5, $$ていただけますか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-96 — 〜てくれる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-96',
    'grammar',
    'N4',
    $$〜てくれる$$,
    $$te kureru$$,
    $$Fazer (algo) por mim / Fazer o favor de$$,
    $$てくれる é usado quando outra pessoa faz algo em benefício de quem fala ou do seu grupo. Equivale a "fazer algo por mim" ou "fazer o favor de".

Ele junta a forma て do verbo com くれる (dar para mim). A ideia é que alguém "deu" uma ação em seu favor.

Quem faz a ação é o sujeito, marcado com が ou は. Quem recebe o favor costuma ser "eu", e geralmente não aparece na frase.

Usar てくれる mostra gratidão. Por isso, os japoneses o usam muito ao contar o que outras pessoas fizeram por eles.

Na forma de pergunta negativa, てくれない？ ou てくれませんか, ele vira um pedido: "você poderia...?".$$,
    $$A escolha entre てあげる, てくれる e てもらう depende de quem faz e de quem recebe. てくれる sempre tem quem fala (ou seu grupo) como beneficiário.

Sem てくれる, uma frase como "meu amigo me levou até a estação" soaria fria em japonês, como se não houvesse gratidão.

Com superiores, a forma respeitosa é てくださる.$$,
    $$Pessoa + が + Verbo na forma て + くれる
Pessoa + が + (私に) + Objeto + を + Verbo て + くれる

Passado: てくれた / てくれました
Pedido: てくれる？ / てくれない？ / てくれませんか
Respeitoso: てくださる$$,
    $$てくれる$$,
    $$てくれ|でくれ$$,
    ARRAY['て', 'くれる']::text[],
    ARRAY['てくれる', 'てくれた', 'てくれました', 'てくれない', 'てくれませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-96', $$友達が駅まで送ってくれました。$$, $$ともだちがえきまでおくってくれました。$$, $$Meu amigo me levou até a estação.$$),
    ('n4-grammar-96', $$今朝、母がお弁当を作ってくれた。$$, $$けさ、ははがおべんとうをつくってくれた。$$, $$Hoje de manhã, minha mãe fez marmita para mim.$$),
    ('n4-grammar-96', $$先輩が仕事を手伝ってくれました。$$, $$せんぱいがしごとをてつだってくれました。$$, $$Meu veterano me ajudou no trabalho.$$),
    ('n4-grammar-96', $$彼はいつも私の話を聞いてくれる。$$, $$かれはいつもわたしのはなしをきいてくれる。$$, $$Ele sempre me escuta.$$),
    ('n4-grammar-96', $$ちょっと窓を開けてくれない？$$, $$ちょっとまどをあけてくれない？$$, $$Você pode abrir a janela rapidinho?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨の日に、田中さんが傘を貸し____。$$, $$Num dia de chuva, o Tanaka me emprestou o guarda-chuva.$$),
        (2, $$父が誕生日に時計を買っ____。$$, $$Meu pai me comprou um relógio de aniversário.$$),
        (3, $$日本人の友達が日本語を教え____。$$, $$Um amigo japonês me ensinou japonês.$$),
        (4, $$ねえ、ちょっと手伝っ____？$$, $$Ei, você pode me ajudar um pouco?$$),
        (5, $$姉が私の代わりに荷物を運ん____。$$, $$Minha irmã mais velha carregou a bagagem no meu lugar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-96', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てくれました$$),
        (1, $$てくれた$$),
        (2, $$てくれました$$),
        (2, $$てくれた$$),
        (3, $$てくれました$$),
        (3, $$てくれた$$),
        (4, $$てくれない$$),
        (4, $$てくれる$$),
        (5, $$でくれました$$),
        (5, $$でくれた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-97 — 〜てくる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-97',
    'grammar',
    'N4',
    $$〜てくる$$,
    $$te kuru$$,
    $$Vir (fazendo) / Ir e voltar / Começar a$$,
    $$てくる junta a forma て de um verbo com 来る (vir). A ideia central é movimento ou mudança que se aproxima de quem fala, no espaço ou no tempo.

Os usos principais são:
• Ir, fazer algo e voltar: como "vou comprar algo e já volto". É muito comum em frases do dia a dia.
• Movimento em direção a quem fala: algo ou alguém que vem se aproximando, como uma criança correndo até você.
• Mudança até agora: algo que vem mudando do passado até o presente, como "vem esquentando".
• Começo de um fenômeno: algo que começa a acontecer e é percebido por quem fala, como começar a chover ou começar a doer.

O oposto é ていく, que indica movimento ou mudança se afastando de quem fala ou indo para o futuro.$$,
    $$A frase 行ってきます, dita ao sair de casa, vem desse uso: "vou e volto". A resposta é いってらっしゃい.

No uso de mudança, てくる olha do passado até agora. Para mudanças que vão continuar no futuro, usa-se ていく.

Na escrita, quando o sentido é abstrato, てくる costuma ser escrito em hiragana.$$,
    $$Verbo na forma て + くる

Educado: てきます
Passado: てきた / てきました
Mudança contínua: てきている$$,
    $$てくる$$,
    $$てくる|てきた|てきま|てきて|でくる|できた$$,
    ARRAY['て', 'くる']::text[],
    ARRAY['てくる', 'てきます', 'てきた', 'てきました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-97', $$ちょっとコンビニで飲み物を買ってきます。$$, $$ちょっとコンビニでのみものをかってきます。$$, $$Vou rapidinho à loja de conveniência comprar bebida e já volto.$$),
    ('n4-grammar-97', $$子供が私のところに走ってきました。$$, $$こどもがわたしのところにはしってきました。$$, $$A criança veio correndo até mim.$$),
    ('n4-grammar-97', $$最近、暖かくなってきましたね。$$, $$さいきん、あたたかくなってきましたね。$$, $$Ultimamente vem esquentando, né?$$),
    ('n4-grammar-97', $$あ、雨が降ってきた。$$, $$あ、あめがふってきた。$$, $$Ah, começou a chover.$$),
    ('n4-grammar-97', $$日本に住む外国人が増えてきている。$$, $$にほんにすむがいこくじんがふえてきている。$$, $$O número de estrangeiros morando no Japão vem aumentando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ちょっと郵便局に行っ____。$$, $$Vou rapidinho ao correio e já volto.$$),
        (2, $$向こうから犬が走っ____。$$, $$Um cachorro veio correndo lá do outro lado.$$),
        (3, $$急にお腹が痛くなっ____。$$, $$De repente, minha barriga começou a doer.$$),
        (4, $$寒くなっ____から、セーターを出しましょう。$$, $$Começou a esfriar, então vamos tirar os suéteres.$$),
        (5, $$窓から虫が入っ____。$$, $$Entrou um inseto pela janela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-97', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てきます$$),
        (1, $$てくる$$),
        (2, $$てきました$$),
        (2, $$てきた$$),
        (3, $$てきました$$),
        (3, $$てきた$$),
        (4, $$てきた$$),
        (5, $$てきました$$),
        (5, $$てきた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-98 — 〜てみる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-98',
    'grammar',
    'N4',
    $$〜てみる$$,
    $$te miru$$,
    $$Experimentar / Tentar (fazer para ver)$$,
    $$てみる é usado para dizer que alguém faz algo para experimentar ou ver como é. Equivale a "experimentar", "tentar" ou "fazer para ver".

Ele junta a forma て do verbo com みる (ver). A ideia literal é "fazer e ver o resultado".

É muito usado para falar de experiências novas: provar uma comida, visitar um lugar, vestir uma roupa, ler um livro.

Com たい, forma てみたい, que expressa vontade de experimentar algo. Com ください, forma てみてください, que convida alguém a experimentar.

No passado, てみた muitas vezes é seguido do resultado da experiência, como "fui ver, mas não era muito bom".$$,
    $$Nesse uso, みる é sempre escrito em hiragana, mesmo que venha do verbo 見る.

てみる não é usado no sentido de "tentar e não conseguir". Para isso, o japonês usa ようとする, que aparece no N3.

A expressão 〜てみてもいいですか é uma forma educada de pedir para experimentar algo, como uma roupa numa loja.$$,
    $$Verbo na forma て + みる

Vontade: てみたい
Convite: てみてください
Passado: てみた / てみました
Sugestão: てみたらどう

Escrita: みる (em hiragana, nesse uso)$$,
    $$てみる$$,
    $$てみ|でみ$$,
    ARRAY['て', 'みる']::text[],
    ARRAY['てみる', 'てみたい', 'てみた', 'てみてください']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-98', $$このケーキを食べてみてください。$$, $$このケーキをたべてみてください。$$, $$Experimente este bolo, por favor.$$),
    ('n4-grammar-98', $$一度日本に行ってみたいです。$$, $$いちどにほんにいってみたいです。$$, $$Quero ir ao Japão pelo menos uma vez.$$),
    ('n4-grammar-98', $$新しい店に行ってみたけど、あまりおいしくなかった。$$, $$あたらしいみせにいってみたけど、あまりおいしくなかった。$$, $$Fui conhecer a loja nova, mas não era muito gostosa.$$),
    ('n4-grammar-98', $$わからないなら、先生に聞いてみたらどう？$$, $$わからないなら、せんせいにきいてみたらどう？$$, $$Se não entende, que tal perguntar ao professor?$$),
    ('n4-grammar-98', $$すみません、この服、着てみてもいいですか。$$, $$すみません、このふく、きてみてもいいですか。$$, $$Com licença, posso experimentar esta roupa?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このシャツを着____もいいですか。$$, $$Posso experimentar esta camisa?$$),
        (2, $$一度、富士山に登っ____たいです。$$, $$Quero subir o Monte Fuji pelo menos uma vez.$$),
        (3, $$新しいゲームをし____けど、難しかった。$$, $$Experimentei o jogo novo, mas era difícil.$$),
        (4, $$その本、おもしろそうだから読ん____。$$, $$Esse livro parece interessante, então vou ler para ver.$$),
        (5, $$先週、初めて自分で料理を作っ____ました。$$, $$Semana passada, experimentei cozinhar sozinho pela primeira vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-98', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てみて$$),
        (2, $$てみ$$),
        (3, $$てみた$$),
        (4, $$でみます$$),
        (4, $$でみる$$),
        (4, $$でみよう$$),
        (5, $$てみ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-99 — 〜てもらう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-99',
    'grammar',
    'N4',
    $$〜てもらう$$,
    $$te morau$$,
    $$Receber (o favor de) / Pedir para alguém fazer$$,
    $$てもらう é usado quando quem fala recebe uma ação de outra pessoa como favor. Equivale a "receber o favor de" ou "ter alguém que faça algo por você".

Ele junta a forma て do verbo com もらう (receber). A ideia é "recebi de alguém a ação de...".

A diferença em relação a てくれる é o foco. Com てくれる, o sujeito é quem faz o favor ("meu amigo me ajudou"). Com てもらう, o sujeito é quem recebe ("eu recebi ajuda do meu amigo"). A pessoa que fez a ação é marcada com に.

Muitas vezes, てもらう também indica que quem fala pediu a ação, como pedir para alguém cortar o cabelo ou consertar algo.

Com superiores, a forma humilde é ていただく.$$,
    $$Para traduzir, muitas vezes é mais natural inverter: 友達に手伝ってもらった vira "meu amigo me ajudou".

Na pergunta てもらえませんか, o pedido soa mais educado que てくれませんか.

Com てもらう, quem fala geralmente é o beneficiário. Por isso, ela expressa gratidão de forma indireta.$$,
    $$Pessoa + に + Objeto + を + Verbo na forma て + もらう

Passado: てもらった / てもらいました
Pedido: てもらえませんか / てもらえますか
Humilde: ていただく$$,
    $$てもらう$$,
    $$てもら|でもら$$,
    ARRAY['て', 'もらう']::text[],
    ARRAY['てもらう', 'てもらった', 'てもらいました', 'てもらえませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-99', $$友達に宿題を手伝ってもらいました。$$, $$ともだちにしゅくだいをてつだってもらいました。$$, $$Meu amigo me ajudou com a lição.$$),
    ('n4-grammar-99', $$母に髪を切ってもらった。$$, $$ははにかみをきってもらった。$$, $$Minha mãe cortou meu cabelo.$$),
    ('n4-grammar-99', $$先生に作文を直してもらいました。$$, $$せんせいにさくぶんをなおしてもらいました。$$, $$O professor corrigiu minha redação.$$),
    ('n4-grammar-99', $$医者に診てもらったほうがいいですよ。$$, $$いしゃにみてもらったほうがいいですよ。$$, $$É melhor você se consultar com um médico.$$),
    ('n4-grammar-99', $$兄にパソコンの使い方を教えてもらった。$$, $$あににパソコンのつかいかたをおしえてもらった。$$, $$Meu irmão mais velho me ensinou a usar o computador.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さんに駅まで送っ____。$$, $$O Tanaka me levou até a estação.$$),
        (2, $$父に自転車を直し____。$$, $$Meu pai consertou minha bicicleta.$$),
        (3, $$友達に写真を撮っ____。$$, $$Pedi para um amigo tirar uma foto minha.$$),
        (4, $$店の人にケーキを箱に入れ____。$$, $$O atendente colocou o bolo numa caixa para mim.$$),
        (5, $$姉に日本語の手紙を読ん____。$$, $$Minha irmã mais velha leu a carta em japonês para mim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-99', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもらいました$$),
        (1, $$てもらった$$),
        (2, $$てもらいました$$),
        (2, $$てもらった$$),
        (3, $$てもらいました$$),
        (3, $$てもらった$$),
        (4, $$てもらいました$$),
        (4, $$てもらった$$),
        (5, $$でもらいました$$),
        (5, $$でもらった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-100 — 〜ておく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-100',
    'grammar',
    'N4',
    $$〜ておく$$,
    $$te oku$$,
    $$Deixar feito / Fazer com antecedência / Deixar (como está)$$,
    $$ておく junta a forma て do verbo com おく (colocar, deixar). Ele tem dois usos principais.

O primeiro é preparação: fazer algo com antecedência, pensando no futuro. Por exemplo, reservar o hotel antes da viagem, ler os documentos antes da reunião, comprar bebidas antes da festa.

O segundo é deixar algo como está, sem mudar, de propósito. Por exemplo, deixar a janela aberta ou deixar algo no lugar.

Ele também é usado para ações de organização, como colocar algo de volta no lugar depois de usar, para que fique pronto para a próxima vez.

Na fala casual, ておく é muito reduzido para とく, e でおく para どく.$$,
    $$ておく é diferente de てある: ておく foca na ação de preparar; てある foca no estado já pronto.

Formas reduzidas como やっとく e 買っとく são muito comuns entre amigos.

A frase そのままにしておいてください significa "deixe como está, por favor".$$,
    $$Verbo na forma て + おく

Educado: ておきます
Passado: ておいた / ておきました
Pedido: ておいてください
Fala casual: とく / といて / といた (でおく → どく)$$,
    $$ておく$$,
    $$ておく|ておき|ておい|でおく|でおき|でおい|とく|といた|といて$$,
    ARRAY['て', 'おく']::text[],
    ARRAY['ておく', 'ておきます', 'ておいた', 'ておいてください', 'とく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-100', $$旅行の前に、ホテルを予約しておきます。$$, $$りょこうのまえに、ホテルをよやくしておきます。$$, $$Antes da viagem, vou deixar o hotel reservado.$$),
    ('n4-grammar-100', $$会議の前に資料を読んでおいてください。$$, $$かいぎのまえにしりょうをよんでおいてください。$$, $$Leia os documentos antes da reunião, por favor.$$),
    ('n4-grammar-100', $$パーティーのために、飲み物を買っておいた。$$, $$パーティーのために、のみものをかっておいた。$$, $$Deixei as bebidas compradas para a festa.$$),
    ('n4-grammar-100', $$使ったら、元の場所に戻しておいてください。$$, $$つかったら、もとのばしょにもどしておいてください。$$, $$Depois de usar, coloque de volta no lugar, por favor.$$),
    ('n4-grammar-100', $$暑いから、窓は開けておいてもいいですよ。$$, $$あついから、まどはあけておいてもいいですよ。$$, $$Está quente, então pode deixar a janela aberta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お客さんが来る前に、部屋を掃除し____。$$, $$Vou limpar o quarto antes de as visitas chegarem.$$),
        (2, $$試験の前に、よく復習し____ください。$$, $$Revisem bem antes da prova, por favor.$$),
        (3, $$寝る前に、明日の準備をし____。$$, $$Antes de dormir, vou deixar tudo pronto para amanhã.$$),
        (4, $$出かける前に、切符を買っ____。$$, $$Antes de sair, comprei a passagem com antecedência.$$),
        (5, $$暑いから、エアコンをつけ____ね。$$, $$Está quente, então vou deixar o ar-condicionado ligado, tá?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-100', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ておきます$$),
        (1, $$ておく$$),
        (1, $$ておきましょう$$),
        (2, $$ておいて$$),
        (3, $$ておきます$$),
        (3, $$ておく$$),
        (4, $$ておきました$$),
        (4, $$ておいた$$),
        (5, $$ておく$$),
        (5, $$とく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-101 — 〜てしまう・〜ちゃう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-101',
    'grammar',
    'N4',
    $$〜てしまう・〜ちゃう$$,
    $$te shimau / chau$$,
    $$Acabar fazendo / Fazer sem querer / Terminar completamente$$,
    $$てしまう tem dois usos principais.

O primeiro é indicar que uma ação foi concluída completamente, até o fim. Por exemplo, terminar toda a lição ou ler o livro inteiro. Com たい, expressa vontade de acabar logo com algo.

O segundo, muito comum, é expressar arrependimento, lamento ou que algo aconteceu sem querer. Por exemplo, esquecer o guarda-chuva no trem ou quebrar um prato importante. O tom é de "acabei fazendo isso" ou "que pena".

Às vezes, os dois sentidos se misturam, e o contexto mostra se o tom é neutro ou de lamento.

Na fala casual, てしまう é reduzido para ちゃう, e でしまう para じゃう. No passado, ficam ちゃった e じゃった.$$,
    $$ちゃった e じゃった são extremamente comuns na conversa do dia a dia, principalmente para contar pequenos acidentes ou erros.

Em algumas regiões, existe ainda a forma てまう, típica do dialeto de Kansai.

Compare: 忘れた apenas informa o fato; 忘れてしまった mostra que a pessoa lamenta ter esquecido.$$,
    $$Verbo na forma て + しまう

Educado: てしまいます
Passado: てしまった / てしまいました
Fala casual: てしまう → ちゃう / でしまう → じゃう
Passado casual: ちゃった / じゃった$$,
    $$てしまう$$,
    $$てしま|でしま|ちゃう|ちゃった|じゃう|じゃった|ちゃいま|じゃいま$$,
    ARRAY['て', 'しまう']::text[],
    ARRAY['てしまう', 'てしまった', 'てしまいました', 'ちゃう', 'ちゃった', 'じゃう', 'じゃった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-101', $$昨日の夜、宿題を全部やってしまいました。$$, $$きのうのよる、しゅくだいをぜんぶやってしまいました。$$, $$Ontem à noite, terminei toda a lição.$$),
    ('n4-grammar-101', $$電車の中に傘を忘れてしまった。$$, $$でんしゃのなかにかさをわすれてしまった。$$, $$Acabei esquecendo o guarda-chuva no trem.$$),
    ('n4-grammar-101', $$ケーキを全部食べちゃった。$$, $$ケーキをぜんぶたべちゃった。$$, $$Acabei comendo o bolo inteiro.$$),
    ('n4-grammar-101', $$大事な皿を割ってしまいました。$$, $$だいじなさらをわってしまいました。$$, $$Acabei quebrando um prato importante.$$),
    ('n4-grammar-101', $$早くこの本を読んでしまいたい。$$, $$はやくこのほんをよんでしまいたい。$$, $$Quero terminar de ler este livro logo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅で財布をなくし____。$$, $$Acabei perdendo a carteira na estação.$$),
        (2, $$寝坊して、授業に遅れ____。$$, $$Dormi demais e acabei me atrasando para a aula.$$),
        (3, $$今日中にこの仕事をやっ____ます。$$, $$Vou terminar este trabalho ainda hoje.$$),
        (4, $$つい、友達の秘密を話し____。$$, $$Sem querer, acabei contando o segredo do meu amigo.$$),
        (5, $$間違えて、人のジュースを飲ん____。$$, $$Por engano, acabei bebendo o suco de outra pessoa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-101', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てしまいました$$),
        (1, $$てしまった$$),
        (1, $$ちゃった$$),
        (2, $$てしまいました$$),
        (2, $$てしまった$$),
        (2, $$ちゃった$$),
        (3, $$てしまい$$),
        (4, $$てしまった$$),
        (4, $$ちゃった$$),
        (4, $$てしまいました$$),
        (5, $$でしまった$$),
        (5, $$じゃった$$),
        (5, $$でしまいました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-102 — 〜てすみません
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-102',
    'grammar',
    'N4',
    $$〜てすみません$$,
    $$te sumimasen$$,
    $$Desculpe por / Perdão por$$,
    $$てすみません é usado para pedir desculpas por algo que você fez, ou deixou de fazer. Equivale a "desculpe por..." ou "perdão por...".

Ele junta a forma て do verbo, que aqui indica o motivo, com すみません. Assim, a frase explica exatamente pelo que a pessoa está se desculpando.

Para algo que já aconteceu e terminou, como faltar a uma aula ontem, usa-se すみませんでした.

Na forma negativa, なくてすみません pede desculpas por não ter feito algo.

Entre amigos, usa-se てごめん ou てごめんね, que são mais informais.$$,
    $$Em situações de trabalho, a forma mais formal é 〜て申し訳ありません ou 〜て申し訳ございません.

お待たせしてすみません é uma frase muito comum quando alguém fez outra pessoa esperar.

Os japoneses pedem desculpas com frequência, inclusive por pequenos incômodos, como interromper alguém.$$,
    $$Verbo na forma て + すみません
Verbo na forma て + すみませんでした (fato já concluído)
Verbo na forma ない sem い + くてすみません (por não ter feito)

Informal: 〜てごめん / 〜てごめんね
Mais formal: 〜て申し訳ありません$$,
    $$てすみません$$,
    $$てすみません|んですみません|てごめん|んでごめん$$,
    ARRAY['て', 'すみません']::text[],
    ARRAY['てすみません', 'てすみませんでした', 'てごめん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-102', $$遅れてすみません。$$, $$おくれてすみません。$$, $$Desculpe o atraso.$$),
    ('n4-grammar-102', $$お待たせしてすみません。$$, $$おまたせしてすみません。$$, $$Desculpe por fazê-lo esperar.$$),
    ('n4-grammar-102', $$昨日は授業を休んですみませんでした。$$, $$きのうはじゅぎょうをやすんですみませんでした。$$, $$Desculpe por ter faltado à aula ontem.$$),
    ('n4-grammar-102', $$ご迷惑をかけてすみません。$$, $$ごめいわくをかけてすみません。$$, $$Desculpe pelo incômodo.$$),
    ('n4-grammar-102', $$返事が遅くなってごめんね。$$, $$へんじがおそくなってごめんね。$$, $$Desculpa a demora para responder.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夜遅くに電話し____。$$, $$Desculpe por ligar tão tarde da noite.$$),
        (2, $$約束を忘れ____でした。$$, $$Desculpe por ter esquecido o compromisso.$$),
        (3, $$お役に立てなく____。$$, $$Desculpe por não ter podido ajudar.$$),
        (4, $$昨日は急に休ん____。$$, $$Desculpe por ter faltado de repente ontem.$$),
        (5, $$たくさん待たせ____ね。$$, $$Desculpa por te fazer esperar tanto, tá?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-102', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てすみません$$),
        (2, $$てすみません$$),
        (3, $$てすみません$$),
        (4, $$ですみません$$),
        (5, $$てごめん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-103 — 〜てやる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-103',
    'grammar',
    'N4',
    $$〜てやる$$,
    $$te yaru$$,
    $$Fazer (algo) para alguém (inferior) / Vou mostrar que...$$,
    $$てやる tem dois usos principais.

O primeiro é parecido com てあげる: fazer algo em benefício de alguém. A diferença é que てやる é usado para pessoas em posição inferior ou muito próximas, como filhos, irmãos mais novos, e também para animais e plantas. O tom é informal.

O segundo uso expressa uma determinação forte, muitas vezes com raiva ou desafio. É como dizer "vou mostrar que..." ou "eu vou...!". Por exemplo, "da próxima vez, eu vou ganhar de qualquer jeito!".

Por ser informal e às vezes rude, てやる deve ser usado com cuidado. Com pessoas que não são próximas, o mais adequado é てあげる.$$,
    $$Na fala de alguns pais, てやる é natural ao falar do que fazem pelos filhos. Hoje, muitas pessoas preferem てあげる por soar mais gentil.

No uso de desafio, てやる aparece muito em mangás, animes e filmes, em falas de personagens determinados ou revoltados.

O verbo やる sozinho também significa "dar" para inferiores, animais e plantas, como dar comida ao cachorro ou água às flores.$$,
    $$Pessoa / Animal + に + Verbo na forma て + やる

Passado: てやった / てやりました
Determinação: 〜てやる！ / 〜てやろう$$,
    $$てやる$$,
    $$てやる|てやった|てやり|てやろう|でやる|でやった|でやり$$,
    ARRAY['て', 'やる']::text[],
    ARRAY['てやる', 'てやった', 'てやりました', 'でやる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-103', $$弟に宿題を手伝ってやった。$$, $$おとうとにしゅくだいをてつだってやった。$$, $$Ajudei meu irmão mais novo com a lição.$$),
    ('n4-grammar-103', $$毎朝、犬を散歩に連れていってやる。$$, $$まいあさ、いぬをさんぽにつれていってやる。$$, $$Toda manhã, levo o cachorro para passear.$$),
    ('n4-grammar-103', $$息子に新しい自転車を買ってやりました。$$, $$むすこにあたらしいじてんしゃをかってやりました。$$, $$Comprei uma bicicleta nova para o meu filho.$$),
    ('n4-grammar-103', $$今度こそ、絶対に勝ってやる。$$, $$こんどこそ、ぜったいにかってやる。$$, $$Desta vez, eu vou ganhar de qualquer jeito!$$),
    ('n4-grammar-103', $$寝る前に、子供に絵本を読んでやった。$$, $$ねるまえに、こどもにえほんをよんでやった。$$, $$Antes de dormir, li um livro ilustrado para meu filho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$娘におもちゃを買っ____。$$, $$Comprei um brinquedo para minha filha.$$),
        (2, $$猫に特別なえさを作っ____。$$, $$Fiz uma comida especial para o gato.$$),
        (3, $$弟にきれいな字の書き方を教え____。$$, $$Ensinei meu irmão mais novo a escrever com letra bonita.$$),
        (4, $$次の試合では必ず勝っ____。$$, $$No próximo jogo, eu vou ganhar sem falta!$$),
        (5, $$子供に昔話を読ん____。$$, $$Li uma história antiga para meu filho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-103', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てやった$$),
        (1, $$てやりました$$),
        (2, $$てやった$$),
        (2, $$てやりました$$),
        (3, $$てやった$$),
        (3, $$てやりました$$),
        (4, $$てやる$$),
        (5, $$でやった$$),
        (5, $$でやりました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-104 — 〜てよかった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-104',
    'grammar',
    'N4',
    $$〜てよかった$$,
    $$te yokatta$$,
    $$Que bom que / Ainda bem que$$,
    $$てよかった é usado para expressar alívio ou satisfação com algo que aconteceu. Equivale a "que bom que..." ou "ainda bem que...".

Ele junta a forma て, que aqui indica o motivo, com よかった, o passado de いい. A ideia é "por ter acontecido isso, foi bom".

É usado tanto para coisas que a própria pessoa fez, como ter levado um guarda-chuva, quanto para situações em geral, como todos estarem bem.

Na forma negativa, なくてよかった significa "ainda bem que não...", como ainda bem que não houve acidente.

Com substantivos e adjetivos な, usa-se でよかった.$$,
    $$Para arrependimento, o oposto é ばよかった (devia ter feito), que aparece no N3.

A frase 会えてよかった, "foi bom te conhecer", é muito usada em despedidas.

Muitas vezes, てよかった vem com ね, buscando a concordância do outro: "ainda bem, né?".$$,
    $$Verbo na forma て + よかった
Verbo na forma ない sem い + くてよかった (ainda bem que não)
Adjetivo い sem い + くてよかった
Substantivo / Adjetivo な + でよかった

Educado: てよかったです$$,
    $$てよかった$$,
    $$てよかった|でよかった$$,
    ARRAY['て', 'よかった']::text[],
    ARRAY['てよかった', 'てよかったです', 'でよかった', 'なくてよかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-104', $$日本に来てよかったです。$$, $$にほんにきてよかったです。$$, $$Foi muito bom ter vindo ao Japão.$$),
    ('n4-grammar-104', $$早く出かけてよかった。$$, $$はやくでかけてよかった。$$, $$Ainda bem que saí cedo.$$),
    ('n4-grammar-104', $$あなたに会えてよかった。$$, $$あなたにあえてよかった。$$, $$Foi muito bom te conhecer.$$),
    ('n4-grammar-104', $$急に雨が降ったけど、傘を持ってきてよかったね。$$, $$きゅうにあめがふったけど、かさをもってきてよかったね。$$, $$Choveu de repente, mas ainda bem que trouxemos o guarda-chuva, né?$$),
    ('n4-grammar-104', $$みんな元気でよかった。$$, $$みんなげんきでよかった。$$, $$Que bom que todos estão bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この大学に入っ____です。$$, $$Que bom que entrei nesta faculdade.$$),
        (2, $$試験に合格でき____。$$, $$Ainda bem que consegui passar na prova.$$),
        (3, $$大きな事故がなく____ですね。$$, $$Ainda bem que não houve nenhum acidente grave, né?$$),
        (4, $$薬を飲ん____。もう元気だ。$$, $$Ainda bem que tomei o remédio. Já estou bem.$$),
        (5, $$雨がやん____ね。$$, $$Que bom que a chuva parou, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-104', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てよかった$$),
        (2, $$てよかった$$),
        (2, $$てよかったです$$),
        (3, $$てよかった$$),
        (4, $$でよかった$$),
        (5, $$でよかった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-105 — 〜ているところ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-105',
    'grammar',
    'N4',
    $$〜ているところ$$,
    $$te iru tokoro$$,
    $$Estar fazendo (neste momento) / Estar no meio de$$,
    $$ているところ é usado para dizer que uma ação está acontecendo exatamente agora, e que a pessoa está no meio dela. Equivale a "estou fazendo isso neste momento" ou "estou no meio de...".

Ele junta a forma ている com ところ, que significa "ponto" ou "momento". A ideia é "estou no ponto de estar fazendo isso".

Comparado a ている, ているところ destaca mais o momento atual e a ideia de que a ação ainda não terminou. É muito usado para explicar por que você não pode fazer outra coisa agora, ou para responder perguntas sobre o andamento de algo.

Também é usado para atividades em andamento por um período, como estar procurando emprego.$$,
    $$ているところ completa o trio com ところ: るところ (prestes a fazer), ているところ (no meio de fazer) e たところ (acabou de fazer).

É uma forma educada de pedir que alguém espere, explicando que você está ocupado com algo naquele momento.

Na fala casual, também se ouve てるところ.$$,
    $$Verbo na forma て + いるところ + です / だ
今 + Verbo て + いるところです$$,
    $$ているところ$$,
    $$ているところ|でいるところ$$,
    ARRAY['ている', 'ところ']::text[],
    ARRAY['ているところ', 'でいるところ', 'てるところ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-105', $$今、ご飯を食べているところです。$$, $$いま、ごはんをたべているところです。$$, $$Estou comendo agora.$$),
    ('n4-grammar-105', $$母は今、電話をしているところだ。$$, $$はははいま、でんわをしているところだ。$$, $$Minha mãe está ao telefone neste momento.$$),
    ('n4-grammar-105', $$今、その問題について考えているところです。$$, $$いま、そのもんだいについてかんがえているところです。$$, $$Estou pensando nesse problema agora.$$),
    ('n4-grammar-105', $$「宿題は？」「今やっているところ。」$$, $$「しゅくだいは？」「いまやっているところ。」$$, $$"E a lição?" "Estou fazendo agora."$$),
    ('n4-grammar-105', $$兄は今、新しい仕事を探しているところです。$$, $$あにはいま、あたらしいしごとをさがしているところです。$$, $$Meu irmão mais velho está procurando um novo emprego no momento.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今、メールを書い____です。$$, $$Estou escrevendo um e-mail agora.$$),
        (2, $$「もしもし、今大丈夫？」「ごめん、今運転し____なんだ。」$$, $$"Alô, pode falar agora?" "Desculpa, estou dirigindo agora."$$),
        (3, $$今、駅に向かっ____です。$$, $$Estou indo para a estação agora.$$),
        (4, $$弟は今、お風呂に入っ____。$$, $$Meu irmão mais novo está no banho agora.$$),
        (5, $$今、資料を読ん____ですから、少し待ってください。$$, $$Estou lendo os documentos agora, então espere um pouco, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-105', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ているところ$$),
        (2, $$ているところ$$),
        (3, $$ているところ$$),
        (4, $$ているところです$$),
        (4, $$ているところだ$$),
        (5, $$でいるところ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-106 — 〜ても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-106',
    'grammar',
    'N4',
    $$〜ても$$,
    $$te mo$$,
    $$Mesmo que / Ainda que / Por mais que$$,
    $$ても é usado para dizer que o resultado não muda, mesmo que uma condição aconteça. Equivale a "mesmo que", "ainda que" ou "por mais que".

Ele é formado pela forma て + も. A primeira parte apresenta uma situação que poderia mudar algo, e a segunda mostra que, mesmo assim, o resultado continua o mesmo.

Com palavras como いくら e 何度, forma expressões como "por mais que coma" ou "por mais vezes que leia", destacando que o esforço não muda o resultado.

Com adjetivos い, usa-se くても. Com substantivos e adjetivos な, usa-se でも.

A condição pode ser hipotética ("mesmo que chova amanhã") ou real ("mesmo tendo tomado remédio").$$,
    $$Para reforçar a ideia de hipótese, usa-se たとえ no começo: たとえ雨が降っても.

Não confunda com てもいい (permissão), que usa a mesma forma, mas com いい depois.

Com palavras interrogativas, como 何を食べても, a ideia é "não importa o que...".$$,
    $$Verbo na forma て + も
Adjetivo い sem い + くても
Substantivo / Adjetivo な + でも
いくら / 何度 / どんなに + … + ても (por mais que)

Negativo: Verbo ない sem い + くても$$,
    $$ても$$,
    $$ても|でも$$,
    ARRAY['て', 'も']::text[],
    ARRAY['ても', 'でも', 'くても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-106', $$明日雨が降っても、試合をします。$$, $$あしたあめがふっても、しあいをします。$$, $$Mesmo que chova amanhã, vamos jogar.$$),
    ('n4-grammar-106', $$彼はいくら食べても、太らない。$$, $$かれはいくらたべても、ふとらない。$$, $$Por mais que coma, ele não engorda.$$),
    ('n4-grammar-106', $$高くても、この本が欲しい。$$, $$たかくても、このほんがほしい。$$, $$Mesmo que seja caro, quero este livro.$$),
    ('n4-grammar-106', $$この店は、日曜日でも開いています。$$, $$このみせは、にちようびでもあいています。$$, $$Esta loja abre mesmo aos domingos.$$),
    ('n4-grammar-106', $$何度読んでも、意味がわからない。$$, $$なんどよんでも、いみがわからない。$$, $$Por mais que eu leia, não entendo o sentido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$薬を飲ん____、熱が下がらない。$$, $$Mesmo tomando remédio, a febre não baixa.$$),
        (2, $$疲れ____、毎日走ります。$$, $$Mesmo cansado, corro todo dia.$$),
        (3, $$安く____、品質が悪い物は買いません。$$, $$Mesmo que seja barato, não compro coisas de má qualidade.$$),
        (4, $$この問題は簡単だから、子供____解けます。$$, $$Esta questão é fácil, então até uma criança consegue resolver.$$),
        (5, $$何回電話し____、彼は出ない。$$, $$Por mais que eu ligue, ele não atende.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-106', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でも$$),
        (2, $$ても$$),
        (3, $$ても$$),
        (4, $$でも$$),
        (5, $$ても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-107 — 〜と（条件）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-107',
    'grammar',
    'N4',
    $$〜と（条件）$$,
    $$to (jouken)$$,
    $$Quando / Sempre que / Se$$,
    $$と também funciona como condicional. Ele indica que, quando algo acontece, um resultado vem naturalmente ou automaticamente. Equivale a "quando", "sempre que" ou "se".

A ideia principal é de consequência inevitável: fenômenos naturais, funcionamento de máquinas, caminhos, hábitos e verdades gerais. Por exemplo, "quando chega a primavera, as cerejeiras florescem" ou "se apertar este botão, a porta abre".

Ele vem depois da forma de dicionário do verbo, ou da forma simples de adjetivos e substantivos com だ.

Por causa dessa ideia de "automático", a segunda parte não pode ser um pedido, um convite ou uma vontade.

No passado, と também pode indicar uma descoberta: "quando fiz isso, aconteceu tal coisa".$$,
    $$Para dar instruções de caminho, と é a escolha mais natural: まっすぐ行くと、〜があります.

Se a segunda parte for um pedido ou intenção, troque と por たら.

Não confunda com と de "e" (lista) e com と de "com" (companhia).$$,
    $$Verbo na forma de dicionário + と
Verbo na forma ない + と
Adjetivo い + と
Substantivo / Adjetivo な + だ + と$$,
    $$と$$,
    $$と$$,
    ARRAY['と']::text[],
    ARRAY['と']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-107', $$春になると、桜が咲きます。$$, $$はるになると、さくらがさきます。$$, $$Quando chega a primavera, as cerejeiras florescem.$$),
    ('n4-grammar-107', $$このボタンを押すと、ドアが開きます。$$, $$このボタンをおすと、ドアがあきます。$$, $$Se apertar este botão, a porta abre.$$),
    ('n4-grammar-107', $$この道をまっすぐ行くと、右に駅があります。$$, $$このみちをまっすぐいくと、みぎにえきがあります。$$, $$Seguindo reto por esta rua, a estação fica à direita.$$),
    ('n4-grammar-107', $$父はお酒を飲むと、顔が赤くなる。$$, $$ちちはおさけをのむと、かおがあかくなる。$$, $$Sempre que meu pai bebe, o rosto dele fica vermelho.$$),
    ('n4-grammar-107', $$窓を開けると、海が見えた。$$, $$まどをあけると、うみがみえた。$$, $$Quando abri a janela, deu para ver o mar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏になる____、暑くなります。$$, $$Quando chega o verão, esquenta.$$),
        (2, $$この道をまっすぐ行く____、銀行があります。$$, $$Seguindo reto por esta rua, tem um banco.$$),
        (3, $$一に二を足す____、三になる。$$, $$Somando dois a um, dá três.$$),
        (4, $$母は寝不足だ____、機嫌が悪い。$$, $$Quando minha mãe dorme pouco, fica de mau humor.$$),
        (5, $$ドアを開ける____、猫が入ってきた。$$, $$Quando abri a porta, o gato entrou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-107', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と$$),
        (2, $$と$$),
        (3, $$と$$),
        (4, $$と$$),
        (5, $$と$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-108 — 〜と言ってもいい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-108',
    'grammar',
    'N4',
    $$〜と言ってもいい$$,
    $$to itte mo ii$$,
    $$Pode-se dizer que / Não seria exagero dizer que$$,
    $$と言ってもいい é usado para fazer uma afirmação forte, mas com um pouco de cautela. Equivale a "pode-se dizer que" ou "não seria exagero dizer que".

A ideia literal é "mesmo dizendo que é assim, está tudo bem". Quem fala reconhece que talvez não seja exatamente aquilo, mas acha que a descrição é justa.

É muito usado para elogiar ou avaliar algo de forma enfática, como dizer que alguém é praticamente um gênio ou que um lugar é o mais bonito do país.

Com でしょう ou くらい, a frase fica ainda mais suave e natural.$$,
    $$Em textos formais, aparece a forma と言っても過言ではない, que significa "não é exagero dizer que".

Essa estrutura é ótima para dar opiniões fortes sem parecer arrogante.

Não confunda com といっても, que significa "embora se diga que..." e introduz uma ressalva.$$,
    $$Substantivo + と言ってもいい
Frase (forma simples) + と言ってもいい
… + と言ってもいいでしょう / と言ってもいいくらいだ

Escrita: と言ってもいい / といってもいい$$,
    $$と言ってもいい$$,
    $$と言ってもいい|といってもいい|と言ってもよい$$,
    ARRAY['と', '言って', 'も', 'いい']::text[],
    ARRAY['と言ってもいい', 'と言ってもいいでしょう', 'といってもいい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-108', $$彼はこの町で一番の料理人と言ってもいい。$$, $$かれはこのまちでいちばんのりょうりにんといってもいい。$$, $$Pode-se dizer que ele é o melhor cozinheiro desta cidade.$$),
    ('n4-grammar-108', $$今回の試験は成功と言ってもいいでしょう。$$, $$こんかいのしけんはせいこうといってもいいでしょう。$$, $$Pode-se dizer que o teste desta vez foi um sucesso.$$),
    ('n4-grammar-108', $$ここは日本で最も美しい場所と言ってもいい。$$, $$ここはにほんでもっともうつくしいばしょといってもいい。$$, $$Não seria exagero dizer que aqui é o lugar mais bonito do Japão.$$),
    ('n4-grammar-108', $$彼女はもう家族と言ってもいい存在です。$$, $$かのじょはもうかぞくといってもいいそんざいです。$$, $$Ela já é praticamente da família.$$),
    ('n4-grammar-108', $$毎日練習しているので、もうプロと言ってもいいくらいだ。$$, $$まいにちれんしゅうしているので、もうプロといってもいいくらいだ。$$, $$Ele treina todo dia, então já dá para dizer que é quase profissional.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この映画は今年最高の作品____でしょう。$$, $$Pode-se dizer que este filme é a melhor obra do ano.$$),
        (2, $$あんなに難しい問題がすぐ解けるなんて、彼は天才____。$$, $$Resolver uma questão tão difícil na hora? Pode-se dizer que ele é um gênio.$$),
        (3, $$このプロジェクトはほぼ完成____。$$, $$Pode-se dizer que este projeto está praticamente concluído.$$),
        (4, $$彼にとって、サッカーは人生そのもの____。$$, $$Para ele, pode-se dizer que o futebol é a própria vida.$$),
        (5, $$東京は世界一便利な町____かもしれない。$$, $$Talvez se possa dizer que Tóquio é a cidade mais prática do mundo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-108', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と言ってもいい$$),
        (2, $$と言ってもいい$$),
        (2, $$と言ってもいいでしょう$$),
        (3, $$と言ってもいい$$),
        (3, $$と言ってもいいでしょう$$),
        (4, $$と言ってもいい$$),
        (4, $$と言ってもいいでしょう$$),
        (5, $$と言ってもいい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-109 — 〜という
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-109',
    'grammar',
    'N4',
    $$〜という$$,
    $$to iu$$,
    $$Chamado / De nome / Que diz que$$,
    $$という é usado para dar o nome de algo ou para explicar o conteúdo de algo. Equivale a "chamado", "de nome" ou "que diz que".

O primeiro uso é apresentar nomes de pessoas, lugares, lojas, filmes e coisas que o ouvinte pode não conhecer. Por exemplo, "uma loja chamada Sakura".

O segundo uso é explicar o conteúdo de uma informação, como uma notícia, um boato ou uma ideia. Por exemplo, "a história de que ele vai sair da empresa".

Também aparece em perguntas como 何という〜ですか, para perguntar o nome de algo.

Na fala casual, という costuma virar っていう.$$,
    $$Quando o nome é desconhecido para o ouvinte, usar という é mais natural do que apresentar o nome direto.

Na forma escrita, quando という tem sentido de "chamado" ou de explicação, costuma ser escrito em hiragana.

A pergunta これは日本語で何といいますか, "como se diz isso em japonês?", é uma das frases mais úteis para estudantes.$$,
    $$Nome + という + Substantivo (chamado...)
Frase (forma simples) + という + Substantivo (話 / 噂 / ニュース)
何 + という + Substantivo + ですか

Fala casual: っていう
Escrita: という / と言う$$,
    $$という$$,
    $$という|と言う|っていう$$,
    ARRAY['と', 'いう']::text[],
    ARRAY['という', 'と言う', 'っていう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-109', $$「さくら」という店を知っていますか。$$, $$「さくら」というみせをしっていますか。$$, $$Você conhece uma loja chamada "Sakura"?$$),
    ('n4-grammar-109', $$田中という人から電話がありました。$$, $$たなかというひとからでんわがありました。$$, $$Uma pessoa chamada Tanaka ligou.$$),
    ('n4-grammar-109', $$これは何という花ですか。$$, $$これはなんというはなですか。$$, $$Como se chama esta flor?$$),
    ('n4-grammar-109', $$北海道の小樽という町に行きました。$$, $$ほっかいどうのおたるというまちにいきました。$$, $$Fui a uma cidade chamada Otaru, em Hokkaido.$$),
    ('n4-grammar-109', $$彼が会社をやめるという話を聞きました。$$, $$かれがかいしゃをやめるというはなしをききました。$$, $$Ouvi a história de que ele vai sair da empresa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「となりのトトロ」____映画を見たことがありますか。$$, $$Você já viu o filme chamado "Meu Amigo Totoro"?$$),
        (2, $$受付に山田____方がいらっしゃっています。$$, $$Há uma pessoa chamada Yamada na recepção.$$),
        (3, $$これは日本語で何____んですか。$$, $$Como se diz isso em japonês?$$),
        (4, $$来月、駅前に新しい店ができる____うわさがある。$$, $$Há um boato de que vai abrir uma loja nova em frente à estação no mês que vem.$$),
        (5, $$鈴木____先生を探しています。$$, $$Estou procurando um professor chamado Suzuki.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-109', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$という$$),
        (2, $$という$$),
        (3, $$という$$),
        (3, $$と言う$$),
        (4, $$という$$),
        (5, $$という$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-110 — 〜ということ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-110',
    'grammar',
    'N4',
    $$〜ということ$$,
    $$to iu koto$$,
    $$O fato de que / Que / Quer dizer que$$,
    $$ということ é usado para transformar uma frase inteira em um substantivo, como "o fato de que...". Ele junta という (que diz que) com こと (fato, coisa).

O primeiro uso é falar de uma informação ou fato como um todo, como ouvir que alguém se casou ou esquecer que amanhã era folga.

O segundo uso é explicar ou definir o sentido de algo. Por exemplo, "o mais importante é continuar todo dia".

O terceiro uso é confirmar uma conclusão, com ということですか: "então quer dizer que...?".

Comparado a こと sozinho, ということ deixa mais claro que se trata de um conteúdo, uma informação ou uma ideia.$$,
    $$Com substantivos e adjetivos な, coloca-se だ antes de ということ: 休みだということ.

A expressão つまり〜ということですか é muito útil para confirmar se você entendeu o que alguém disse.

Em níveis seguintes, ということだ também aparece com o sentido de "dizem que".$$,
    $$Frase (forma simples) + ということ + を / が / は
Frase + ということです (explicação / definição)
つまり + … + ということですか (confirmação)

Fala casual: ってこと$$,
    $$ということ$$,
    $$ということ|ってこと$$,
    ARRAY['という', 'こと']::text[],
    ARRAY['ということ', 'ということです', 'ってこと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-110', $$彼が結婚したということを聞いて、驚いた。$$, $$かれがけっこんしたということをきいて、おどろいた。$$, $$Fiquei surpreso ao saber que ele se casou.$$),
    ('n4-grammar-110', $$明日は休みだということを忘れていた。$$, $$あしたはやすみだということをわすれていた。$$, $$Eu tinha esquecido que amanhã era folga.$$),
    ('n4-grammar-110', $$大切なのは、毎日続けるということです。$$, $$たいせつなのは、まいにちつづけるということです。$$, $$O importante é continuar todo dia.$$),
    ('n4-grammar-110', $$つまり、行けないということですか。$$, $$つまり、いけないということですか。$$, $$Então quer dizer que você não pode ir?$$),
    ('n4-grammar-110', $$日本語が難しいということは、よくわかっています。$$, $$にほんごがむずかしいということは、よくわかっています。$$, $$Eu sei muito bem que o japonês é difícil.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会議が中止になった____を、誰から聞きましたか。$$, $$De quem você ouviu que a reunião foi cancelada?$$),
        (2, $$健康が一番大切だ____が、病気になってわかった。$$, $$Quando fiquei doente, entendi que a saúde é o mais importante.$$),
        (3, $$「明日は雨です。」「じゃあ、ピクニックは中止____ですね。」$$, $$"Amanhã vai chover." "Então quer dizer que o piquenique está cancelado, né?"$$),
        (4, $$彼が来ない____は、もう知っています。$$, $$Já sei que ele não vem.$$),
        (5, $$一番大切なのは、あきらめない____だ。$$, $$O mais importante é não desistir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-110', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ということ$$),
        (2, $$ということ$$),
        (3, $$ということ$$),
        (4, $$ということ$$),
        (5, $$ということ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-111 — 〜と言われている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-111',
    'grammar',
    'N4',
    $$〜と言われている$$,
    $$to iwarete iru$$,
    $$Diz-se que / Acredita-se que / Fala-se que$$,
    $$と言われている é usado para apresentar uma opinião geral, uma crença popular ou algo que muitas pessoas dizem. Equivale a "diz-se que", "acredita-se que" ou "fala-se que".

Ele vem de 言う (dizer) na forma passiva (言われる) + ている. A ideia é "isso é dito por muitas pessoas", sem indicar quem exatamente.

É muito usado em textos informativos, notícias, explicações sobre cultura, história, saúde e costumes.

Diferente de そうだ, que repassa uma informação de uma fonte específica, と言われている fala de algo amplamente aceito ou comentado pela sociedade.$$,
    $$Em textos acadêmicos e jornalísticos, também aparecem formas como とされている e と考えられている, com sentido parecido.

Essa estrutura deixa a informação mais objetiva e evita que quem fala pareça estar dando sua opinião pessoal.

É comum em frases sobre lendas e histórias antigas, como a origem de templos e tradições.$$,
    $$Frase (forma simples) + と言われている
Substantivo / Adjetivo な + だ + と言われている

Educado: と言われています
Escrita: と言われている / といわれている$$,
    $$と言われている$$,
    $$と言われてい|といわれてい$$,
    ARRAY['と', '言われて', 'いる']::text[],
    ARRAY['と言われている', 'と言われています', 'といわれている']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-111', $$日本人は時間に厳しいと言われている。$$, $$にほんじんはじかんにきびしいといわれている。$$, $$Diz-se que os japoneses são rigorosos com o horário.$$),
    ('n4-grammar-111', $$この寺は千年前に建てられたと言われています。$$, $$このてらはせんねんまえにたてられたといわれています。$$, $$Diz-se que este templo foi construído há mil anos.$$),
    ('n4-grammar-111', $$緑茶は体にいいと言われています。$$, $$りょくちゃはからだにいいといわれています。$$, $$Acredita-se que o chá verde faz bem para o corpo.$$),
    ('n4-grammar-111', $$この町は日本で一番雨が多いと言われている。$$, $$このまちはにほんでいちばんあめがおおいといわれている。$$, $$Diz-se que esta é a cidade onde mais chove no Japão.$$),
    ('n4-grammar-111', $$朝ご飯を食べると、頭がよく働くと言われています。$$, $$あさごはんをたべると、あたまがよくはたらくといわれています。$$, $$Diz-se que tomar café da manhã faz o cérebro funcionar melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$富士山は日本一美しい山だ____。$$, $$Diz-se que o Monte Fuji é a montanha mais bonita do Japão.$$),
        (2, $$よく笑うことは健康にいい____。$$, $$Diz-se que rir bastante faz bem para a saúde.$$),
        (3, $$この池には大きな魚がいる____。$$, $$Dizem que há um peixe enorme neste lago.$$),
        (4, $$猫は人ではなく家につく____。$$, $$Diz-se que os gatos se apegam à casa, e não às pessoas.$$),
        (5, $$一日に八時間寝るのがいい____。$$, $$Diz-se que o ideal é dormir oito horas por dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-111', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と言われています$$),
        (1, $$と言われている$$),
        (2, $$と言われています$$),
        (2, $$と言われている$$),
        (3, $$と言われています$$),
        (3, $$と言われている$$),
        (4, $$と言われています$$),
        (4, $$と言われている$$),
        (5, $$と言われています$$),
        (5, $$と言われている$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-112 — 〜と聞いた
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-112',
    'grammar',
    'N4',
    $$〜と聞いた$$,
    $$to kiita$$,
    $$Ouvi dizer que / Fiquei sabendo que$$,
    $$と聞いた é usado para dizer que você ouviu uma informação de alguém. Equivale a "ouvi dizer que" ou "fiquei sabendo que".

Ele junta a citação (と) com o verbo 聞く (ouvir) no passado. O conteúdo ouvido vem antes de と, na forma simples.

Comparado a そうだ, と聞いた deixa mais claro que quem fala ouviu aquilo pessoalmente, de alguém. Por isso, é muito comum na conversa.

A forma と聞いている (ou と聞いています) indica uma informação que a pessoa recebeu e que continua considerando válida.

Na fala casual, と聞いた costuma virar って聞いた.$$,
    $$Para mencionar de quem você ouviu, usa-se から ou に antes: 田中さんから聞いた.

と聞いて, na forma て, liga a informação ouvida a uma reação ou ação: "ao saber que..., fiz tal coisa".

Em situações formais, também se usa 伺いました, a forma humilde de 聞いた.$$,
    $$Frase (forma simples) + と聞いた / と聞きました
Substantivo / Adjetivo な + だ + と聞いた
Frase + と聞いている (informação que se tem)
Frase + と聞いて、 + Frase (ao ouvir que...)

Fala casual: って聞いた$$,
    $$と聞いた$$,
    $$と聞|ときい|って聞$$,
    ARRAY['と', '聞いた']::text[],
    ARRAY['と聞いた', 'と聞きました', 'と聞いている', 'って聞いた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-112', $$田中さんが入院したと聞きました。$$, $$たなかさんがにゅういんしたとききました。$$, $$Ouvi dizer que o Tanaka foi internado.$$),
    ('n4-grammar-112', $$明日は雨が降ると聞いた。$$, $$あしたはあめがふるときいた。$$, $$Ouvi dizer que vai chover amanhã.$$),
    ('n4-grammar-112', $$この店のケーキはおいしいと聞いて、来てみました。$$, $$このみせのケーキはおいしいときいて、きてみました。$$, $$Ouvi dizer que o bolo desta loja é gostoso e vim experimentar.$$),
    ('n4-grammar-112', $$彼女は来月日本へ帰ると聞いています。$$, $$かのじょはらいげつにほんへかえるときいています。$$, $$Fiquei sabendo que ela volta ao Japão no mês que vem.$$),
    ('n4-grammar-112', $$試験が延期になったって聞いたよ。$$, $$しけんがえんきになったってきいたよ。$$, $$Ouvi dizer que a prova foi adiada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$山田さんが来月結婚する____。$$, $$Ouvi dizer que o Yamada vai se casar no mês que vem.$$),
        (2, $$あの映画はおもしろい____ので、見に行きます。$$, $$Ouvi dizer que aquele filme é bom, então vou assistir.$$),
        (3, $$部長は今日休みだ____けど、本当？$$, $$Ouvi dizer que o gerente está de folga hoje. É verdade?$$),
        (4, $$この辺に新しい駅ができる____います。$$, $$Fiquei sabendo que vão construir uma estação nova por aqui.$$),
        (5, $$先生が病気だ____、心配しています。$$, $$Soube que o professor está doente e estou preocupado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-112', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と聞きました$$),
        (1, $$と聞いた$$),
        (2, $$と聞いた$$),
        (3, $$と聞いた$$),
        (3, $$って聞いた$$),
        (4, $$と聞いて$$),
        (5, $$と聞いて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-113 — 〜と思う
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-113',
    'grammar',
    'N4',
    $$〜と思う$$,
    $$to omou$$,
    $$Achar que / Pensar que / Acreditar que$$,
    $$と思う é usado para expressar opinião, suposição ou impressão. Equivale a "achar que", "pensar que" ou "acreditar que".

A opinião vem antes de と, na forma simples. Com substantivos e adjetivos な, é preciso colocar だ antes de と.

と思います é uma forma muito usada pelos japoneses para suavizar afirmações. Em vez de dizer algo de forma categórica, a pessoa apresenta como uma opinião pessoal.

Para falar da opinião de outra pessoa, usa-se と思っている, que indica uma opinião que ela tem há algum tempo.

Na fala casual, と思う pode virar って思う.$$,
    $$Para dizer "acho que não", o japonês costuma negar dentro da frase: 来ないと思う ("acho que não vem"), e não 来ると思わない.

と思う é uma ótima forma de soar educado ao dar opiniões, mesmo sobre coisas que você tem bastante certeza.

Com a forma volitiva, ようと思う expressa uma intenção, como "estou pensando em fazer...".$$,
    $$Verbo / Adjetivo い (forma simples) + と思う
Substantivo / Adjetivo な + だ + と思う

Educado: と思います
Opinião de outra pessoa: と思っている
Fala casual: って思う$$,
    $$と思う$$,
    $$と思|とおも|って思$$,
    ARRAY['と', '思う']::text[],
    ARRAY['と思う', 'と思います', 'と思っている', 'って思う']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-113', $$明日は雨が降ると思います。$$, $$あしたはあめがふるとおもいます。$$, $$Acho que vai chover amanhã.$$),
    ('n4-grammar-113', $$この本はおもしろいと思う。$$, $$このほんはおもしろいとおもう。$$, $$Acho este livro interessante.$$),
    ('n4-grammar-113', $$彼は来ないと思います。$$, $$かれはこないとおもいます。$$, $$Acho que ele não vem.$$),
    ('n4-grammar-113', $$日本語は難しいけど、楽しいと思っています。$$, $$にほんごはむずかしいけど、たのしいとおもっています。$$, $$Japonês é difícil, mas acho divertido.$$),
    ('n4-grammar-113', $$あの人は先生だと思う。$$, $$あのひとはせんせいだとおもう。$$, $$Acho que aquela pessoa é professora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この計画はいい____。$$, $$Acho que este plano é bom.$$),
        (2, $$田中さんはもう帰った____。$$, $$Acho que o Tanaka já foi embora.$$),
        (3, $$明日は晴れる____。$$, $$Acho que amanhã vai fazer sol.$$),
        (4, $$東京は便利な町だ____。$$, $$Acho que Tóquio é uma cidade prática.$$),
        (5, $$彼はたぶん来ない____。$$, $$Acho que ele provavelmente não vem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-113', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と思います$$),
        (1, $$と思う$$),
        (2, $$と思います$$),
        (2, $$と思う$$),
        (3, $$と思います$$),
        (3, $$と思う$$),
        (4, $$と思います$$),
        (4, $$と思う$$),
        (5, $$と思います$$),
        (5, $$と思う$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-114 — 〜とか〜とか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-114',
    'grammar',
    'N4',
    $$〜とか〜とか$$,
    $$toka ~ toka$$,
    $$Coisas como... e... / Tipo... e...$$,
    $$とか〜とか é usado para dar exemplos, deixando claro que existem outras possibilidades. Equivale a "coisas como... e..." ou "tipo... e...".

Ele é parecido com や〜など, mas é mais casual e muito comum na conversa.

Uma diferença importante: とか pode ligar não só substantivos, mas também verbos, adjetivos e frases inteiras. Por isso, é muito usado para dar exemplos de ações, como "ler livros, ver filmes e coisas assim".

Com 言う, a estrutura とか〜とか言う serve para citar desculpas ou comentários de alguém, muitas vezes com tom de crítica ou cansaço.$$,
    $$Na fala dos jovens, とか às vezes é usado sozinho para suavizar a frase, como "tipo...". Esse uso é bem coloquial.

Em textos formais, prefira や〜など para substantivos e たり〜たりする para ações.

O último とか pode ser omitido, principalmente na fala rápida.$$,
    $$Substantivo A + とか + Substantivo B + とか
Verbo A (forma simples) + とか + Verbo B + とか + する
Frase A + とか + Frase B + とか + 言う

Também com um só exemplo: Substantivo + とか$$,
    $$とか$$,
    $$とか$$,
    ARRAY['とか']::text[],
    ARRAY['とか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-114', $$休みの日は、映画を見るとか、本を読むとかしています。$$, $$やすみのひは、えいがをみるとか、ほんをよむとかしています。$$, $$Nos dias de folga, faço coisas como ver filmes e ler livros.$$),
    ('n4-grammar-114', $$りんごとかバナナとか、果物が好きです。$$, $$りんごとかバナナとか、くだものがすきです。$$, $$Gosto de frutas, tipo maçã e banana.$$),
    ('n4-grammar-114', $$日本語の勉強には、アニメとか漫画とかが役に立つ。$$, $$にほんごのべんきょうには、アニメとかまんがとかがやくにたつ。$$, $$Para estudar japonês, coisas como anime e mangá ajudam.$$),
    ('n4-grammar-114', $$疲れたときは、お風呂に入るとか、早く寝るとかしたほうがいい。$$, $$つかれたときは、おふろにはいるとか、はやくねるとかしたほうがいい。$$, $$Quando estiver cansado, é melhor fazer coisas como tomar banho de banheira ou dormir cedo.$$),
    ('n4-grammar-114', $$彼は忙しいとか時間がないとか言って、いつも来ない。$$, $$かれはいそがしいとかじかんがないとかいって、いつもこない。$$, $$Ele sempre diz coisas como estar ocupado ou sem tempo e nunca vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$週末はテニス____サッカーとかをします。$$, $$No fim de semana, jogo tênis, futebol e coisas assim.$$),
        (2, $$寿司____天ぷらとか、日本料理が好きです。$$, $$Gosto de comida japonesa, tipo sushi e tempurá.$$),
        (3, $$休みの日は掃除をする____、洗濯をするとかしています。$$, $$Nos dias de folga, faço coisas como limpar a casa e lavar roupa.$$),
        (4, $$東京とか大阪____の大きい町は人が多い。$$, $$Cidades grandes como Tóquio e Osaka têm muita gente.$$),
        (5, $$彼女は寒い____眠いとか、文句ばかり言う。$$, $$Ela só reclama, dizendo coisas como que está com frio ou com sono.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-114', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とか$$),
        (2, $$とか$$),
        (3, $$とか$$),
        (4, $$とか$$),
        (5, $$とか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-115 — 〜るところ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-115',
    'grammar',
    'N4',
    $$〜るところ$$,
    $$ru tokoro$$,
    $$Estar prestes a / Ia (fazer) agora$$,
    $$Quando ところ vem depois do verbo na forma de dicionário, ele indica que a ação está prestes a acontecer. Equivale a "estou prestes a..." ou "eu ia fazer isso agora".

ところ significa "ponto" ou "momento". Com a forma de dicionário, a ideia é "estou no ponto logo antes de fazer isso".

É muito comum com palavras como 今から, これから e ちょうど, que reforçam que a ação vai começar imediatamente.

No passado, るところだった indica que algo estava prestes a acontecer naquele momento. Em alguns contextos, também significa "quase aconteceu", como algo ruim que por pouco não ocorreu.$$,
    $$Esta é a primeira parte do trio com ところ: るところ (prestes a fazer), ているところ (fazendo agora) e たところ (acabou de fazer).

A forma ところだった também aparece com sentido de "quase", como em 遅れるところだった (quase me atrasei).

É uma resposta comum quando alguém pergunta se você já fez algo, e você está prestes a fazer.$$,
    $$Verbo na forma de dicionário + ところ + です / だ
今から / これから / ちょうど + Verbo + ところです
Passado: Verbo + ところだった$$,
    $$ところ$$,
    $$ところ$$,
    ARRAY['る', 'ところ']::text[],
    ARRAY['ところ', 'ところです', 'ところだった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-115', $$今から出かけるところです。$$, $$いまからでかけるところです。$$, $$Estou prestes a sair agora.$$),
    ('n4-grammar-115', $$今、ちょうどご飯を食べるところだ。$$, $$いま、ちょうどごはんをたべるところだ。$$, $$Estou justamente prestes a comer agora.$$),
    ('n4-grammar-115', $$これから会議が始まるところです。$$, $$これからかいぎがはじまるところです。$$, $$A reunião está prestes a começar.$$),
    ('n4-grammar-115', $$「もう寝た？」「今から寝るところ。」$$, $$「もうねた？」「いまからねるところ。」$$, $$"Já dormiu?" "Estou indo dormir agora."$$),
    ('n4-grammar-115', $$そのとき、電車がちょうど駅に着くところだった。$$, $$そのとき、でんしゃがちょうどえきにつくところだった。$$, $$Naquele momento, o trem estava prestes a chegar à estação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今から家を出る____です。$$, $$Estou prestes a sair de casa agora.$$),
        (2, $$これから映画が始まる____だから、静かにして。$$, $$O filme está prestes a começar, então fique quieto.$$),
        (3, $$ちょうど今、あなたに電話をかける____でした。$$, $$Eu ia te ligar justamente agora.$$),
        (4, $$「宿題、もうした？」「今からする____。」$$, $$"Já fez a lição?" "Vou fazer agora."$$),
        (5, $$今、お風呂に入る____なので、後で電話します。$$, $$Estou prestes a entrar no banho, então ligo depois.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-115', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところ$$),
        (2, $$ところ$$),
        (3, $$ところ$$),
        (4, $$ところ$$),
        (5, $$ところ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-116 — 〜続ける
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-116',
    'grammar',
    'N4',
    $$〜続ける$$,
    $$tsuzukeru$$,
    $$Continuar a / Continuar fazendo / Seguir$$,
    $$続ける, ligado a outro verbo, indica que uma ação continua por um tempo, sem parar. Equivale a "continuar a" ou "continuar fazendo".

A estrutura junta o verbo na forma ます sem ます com 続ける. O resultado funciona como um verbo do grupo 2 e se conjuga normalmente: 続けます, 続けた, 続けている.

É usado para ações que duram e se repetem, como falar, andar, chover, trabalhar ou estudar.

É muito comum junto com expressões de tempo, como "três horas", "o dia inteiro" ou "dez anos", destacando a duração.

Sozinho, 続ける significa "continuar algo", como continuar os estudos. Já 続く é intransitivo: "algo continua".$$,
    $$Com ações de um instante, como chegar ou acordar, 続ける normalmente não é usado, porque elas não podem "durar".

Para fenômenos naturais, como a chuva, tanto 降り続ける quanto 降り続く são usados. 降り続く soa mais natural em descrições do tempo.

続ける também aparece em frases de incentivo, como "o importante é continuar".$$,
    $$Verbo na forma ます sem ます + 続ける

Educado: 続けます
Passado: 続けた / 続けました
Em andamento: 続けている

Escrita: 続ける / つづける$$,
    $$続ける$$,
    $$続け|つづけ$$,
    ARRAY['続ける']::text[],
    ARRAY['続ける', '続けます', '続けた', '続けている']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-116', $$彼は三時間も話し続けた。$$, $$かれはさんじかんもはなしつづけた。$$, $$Ele continuou falando por três horas inteiras.$$),
    ('n4-grammar-116', $$雨が一日中降り続けています。$$, $$あめがいちにちじゅうふりつづけています。$$, $$A chuva continua caindo o dia inteiro.$$),
    ('n4-grammar-116', $$日本語の勉強を続けることが大切です。$$, $$にほんごのべんきょうをつづけることがたいせつです。$$, $$O importante é continuar estudando japonês.$$),
    ('n4-grammar-116', $$父は十年間この会社で働き続けている。$$, $$ちちはじゅうねんかんこのかいしゃではたらきつづけている。$$, $$Meu pai trabalha nesta empresa há dez anos sem parar.$$),
    ('n4-grammar-116', $$赤ちゃんが朝まで泣き続けた。$$, $$あかちゃんがあさまでなきつづけた。$$, $$O bebê continuou chorando até de manhã.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は二時間も歩き____。$$, $$Ela continuou andando por duas horas inteiras.$$),
        (2, $$子供のころから、ピアノを習い____います。$$, $$Continuo aprendendo piano desde criança.$$),
        (3, $$昨日の夜は、ずっと雪が降り____。$$, $$Ontem à noite, a neve continuou caindo sem parar.$$),
        (4, $$毎日、日記を書き____ことは難しい。$$, $$Continuar escrevendo um diário todo dia é difícil.$$),
        (5, $$彼は何も言わずに、走り____。$$, $$Ele continuou correndo sem dizer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-116', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$続けました$$),
        (1, $$続けた$$),
        (2, $$続けて$$),
        (3, $$続けた$$),
        (3, $$続けました$$),
        (4, $$続ける$$),
        (5, $$続けた$$),
        (5, $$続けました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-117 — 〜って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-117',
    'grammar',
    'N4',
    $$〜って$$,
    $$tte$$,
    $$Dizem que / Chamado / Quanto a / Que$$,
    $$って é uma partícula muito comum na fala casual. Ela substitui várias formas mais longas e tem alguns usos principais.

• Citar o que alguém disse: substitui と (de と言う) e também そうだ, como em "ele disse que não vem" ou "dizem que...".
• Dar nome: substitui という, como em "uma loja chamada Sakura".
• Apresentar um tema: substitui は, com um tom de "falando de..." ou "esse tal de...", como em "japonês é difícil, né?".
• Perguntar o significado de algo: como em "o que é ramen?".

Por ser informal, って é usado com amigos, família e em conversas do dia a dia. Em situações formais, usa-se a forma completa, como と, という ou は.$$,
    $$No final da frase, って sozinho já indica que a informação foi ouvida de alguém: 来ないって = "disse que não vem".

Às vezes って aparece duplicado como ってば, para insistir ou mostrar impaciência, num uso mais avançado.

Em mensagens de texto e redes sociais, って é extremamente frequente.$$,
    $$Frase + って (dizem que / disse que)
Frase + って + 言う / 聞く (citação)
Nome + って + Substantivo (chamado...)
Substantivo + って + Comentário (tema)
〜って + 何ですか (o que é...?)$$,
    $$って$$,
    $$って$$,
    ARRAY['って']::text[],
    ARRAY['って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-117', $$田中さん、明日来ないって。$$, $$たなかさん、あしたこないって。$$, $$O Tanaka disse que não vem amanhã.$$),
    ('n4-grammar-117', $$「さくら」って店、知ってる？$$, $$「さくら」ってみせ、しってる？$$, $$Você conhece uma loja chamada "Sakura"?$$),
    ('n4-grammar-117', $$日本語って難しいね。$$, $$にほんごってむずかしいね。$$, $$Japonês é difícil, né?$$),
    ('n4-grammar-117', $$先生が明日テストがあるって言ってたよ。$$, $$せんせいがあしたテストがあるっていってたよ。$$, $$O professor disse que amanhã tem prova.$$),
    ('n4-grammar-117', $$すみません、「ラーメン」って何ですか。$$, $$すみません、「ラーメン」ってなんですか。$$, $$Com licença, o que é "ramen"?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女、来月結婚する____。$$, $$Ela disse que vai se casar no mês que vem.$$),
        (2, $$「すき焼き」____何ですか。$$, $$O que é "sukiyaki"?$$),
        (3, $$母が早く帰ってきなさい____言ってた。$$, $$Minha mãe disse para eu voltar logo.$$),
        (4, $$東京____人が多いですね。$$, $$Tóquio tem muita gente, né?$$),
        (5, $$「ポチ」____名前の犬を飼っています。$$, $$Tenho um cachorro chamado "Pochi".$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-117', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$って$$),
        (2, $$って$$),
        (3, $$って$$),
        (4, $$って$$),
        (5, $$って$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-118 — 受身形（〜られる）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-118',
    'grammar',
    'N4',
    $$受身形（〜られる）$$,
    $$ukemikei$$,
    $$Ser (feito) / Voz passiva / Sofrer (uma ação)$$,
    $$A forma passiva (受身形) é usada quando o foco está em quem recebe a ação, e não em quem a faz. Equivale a "ser + particípio" do português, como "ser elogiado".

A pessoa que faz a ação é marcada com に, e quem recebe a ação é o sujeito.

O japonês tem três usos principais da passiva:
• Passiva direta: alguém recebe a ação diretamente, como "fui elogiado pelo professor".
• Passiva de incômodo (迷惑の受身): a pessoa é afetada negativamente por algo que alguém fez, como "meu irmão comeu meu bolo" (e isso me incomodou). Também funciona com verbos sem objeto, como "fui pego pela chuva".
• Passiva neutra: para fatos objetivos, quando quem fez não importa, como "este templo foi construído há oitocentos anos".

A passiva de incômodo é muito característica do japonês e expressa o sentimento de quem foi prejudicado.$$,
    $$A passiva dos verbos do grupo 2 tem a mesma forma da potencial (食べられる). O contexto mostra qual é o sentido.

Em notícias e textos formais, a passiva neutra é muito comum, com expressões como 〜によって作られた.

Quando a ação é positiva, como receber ajuda, os japoneses preferem てもらう à passiva.$$,
    $$Grupo 1: último som "u" → "a" + れる (書く → 書かれる / 言う → 言われる)
Grupo 2: tire る + られる (食べる → 食べられる)
Irregulares: する → される / 来る → 来られる (こられる)

Pessoa afetada + は / が + Quem fez + に + Verbo passivo
Pessoa + は + Quem fez + に + Objeto + を + Verbo passivo (incômodo)$$,
    $$られる$$,
    $$られ|かれ|がれ|され|たれ|まれ|われ|ばれ|なれ$$,
    ARRAY['られる', 'れる']::text[],
    ARRAY['られる', 'れる', 'られた', 'れた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-118', $$テストでいい点を取って、先生に褒められました。$$, $$テストでいいてんをとって、せんせいにほめられました。$$, $$Tirei uma nota boa na prova e fui elogiado pelo professor.$$),
    ('n4-grammar-118', $$弟にケーキを食べられた。$$, $$おとうとにケーキをたべられた。$$, $$Meu irmão mais novo comeu o meu bolo.$$),
    ('n4-grammar-118', $$電車の中で足を踏まれました。$$, $$でんしゃのなかであしをふまれました。$$, $$Pisaram no meu pé dentro do trem.$$),
    ('n4-grammar-118', $$雨に降られて、服が濡れてしまった。$$, $$あめにふられて、ふくがぬれてしまった。$$, $$Fui pego pela chuva e minhas roupas ficaram molhadas.$$),
    ('n4-grammar-118', $$この寺は八百年前に建てられました。$$, $$このてらははっぴゃくねんまえにたてられました。$$, $$Este templo foi construído há oitocentos anos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供のころ、よく母に叱____。$$, $$Quando criança, eu levava muita bronca da minha mãe.$$),
        (2, $$駅で知らない人に名前を呼____。$$, $$Na estação, uma pessoa desconhecida me chamou pelo nome.$$),
        (3, $$電車の中で財布を盗____。$$, $$Roubaram minha carteira dentro do trem.$$),
        (4, $$このお祭りは毎年八月に行わ____。$$, $$Este festival é realizado todo ano em agosto.$$),
        (5, $$友達に秘密を話____て、困った。$$, $$Meu amigo contou o meu segredo, e fiquei numa situação difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-118', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$られました$$),
        (1, $$られた$$),
        (2, $$ばれました$$),
        (2, $$ばれた$$),
        (3, $$まれました$$),
        (3, $$まれた$$),
        (4, $$れます$$),
        (4, $$れる$$),
        (5, $$され$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-119 — 〜は〜が、〜は〜
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-119',
    'grammar',
    'N4',
    $$〜は〜が、〜は〜$$,
    $$wa ~ ga, ~ wa ~$$,
    $$A é... mas B é... / Já (contraste)$$,
    $$Essa estrutura usa は duas vezes para comparar ou contrastar duas coisas. Equivale a "A é..., mas B é..." ou "quanto a A..., já B...".

Além de marcar o tema, は tem uma função importante de contraste. Quando aparece com dois elementos diferentes na mesma frase, ele destaca que um é de um jeito e o outro é de outro.

As duas partes são ligadas por が ou けど, que significam "mas".

Esse uso de は é muito comum com coisas que se gosta e não se gosta, que se sabe e não se sabe, que acontece em um momento e não em outro.

Também aparece em frases negativas, quando se quer deixar claro que a negação vale só para aquele elemento.$$,
    $$Muitas vezes, a segunda parte fica subentendida. Dizer apenas 肉は好きです pode sugerir que outras coisas a pessoa não gosta tanto.

Com partículas como に, で e と, o は contrastivo forma には, では e とは.

Esse uso explica por que は aparece tanto em frases negativas: ele marca o contraste com outras possibilidades.$$,
    $$A + は + …が / けど、 + B + は + …
A + は + Afirmativo + が、 + B + は + Negativo$$,
    $$は$$,
    $$は$$,
    ARRAY['は', 'が']::text[],
    ARRAY['は']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-119', $$肉は好きですが、魚は好きではありません。$$, $$にくはすきですが、さかなはすきではありません。$$, $$Carne eu gosto, mas peixe não.$$),
    ('n4-grammar-119', $$兄は背が高いが、弟は低い。$$, $$あにはせがたかいが、おとうとはひくい。$$, $$Meu irmão mais velho é alto, mas o mais novo é baixo.$$),
    ('n4-grammar-119', $$平日は忙しいですが、週末は暇です。$$, $$へいじつはいそがしいですが、しゅうまつはひまです。$$, $$Durante a semana estou ocupado, mas no fim de semana fico livre.$$),
    ('n4-grammar-119', $$ひらがなは読めますが、漢字はまだ読めません。$$, $$ひらがなはよめますが、かんじはまだよめません。$$, $$Consigo ler hiragana, mas kanji ainda não.$$),
    ('n4-grammar-119', $$東京は人が多いけど、私の町は少ない。$$, $$とうきょうはひとがおおいけど、わたしのまちはすくない。$$, $$Tóquio tem muita gente, mas a minha cidade tem pouca.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏は暑いですが、冬____寒いです。$$, $$O verão é quente, mas o inverno é frio.$$),
        (2, $$英語は話せますが、日本語____話せません。$$, $$Falo inglês, mas japonês não.$$),
        (3, $$コーヒーは飲みますが、紅茶____飲みません。$$, $$Café eu bebo, mas chá não.$$),
        (4, $$姉は料理が上手だが、私____下手だ。$$, $$Minha irmã cozinha bem, mas eu cozinho mal.$$),
        (5, $$昼____暖かいけど、夜は寒い。$$, $$De dia está quente, mas à noite faz frio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-119', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$は$$),
        (2, $$は$$),
        (3, $$は$$),
        (4, $$は$$),
        (5, $$は$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-120 — 〜やすい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-120',
    'grammar',
    'N4',
    $$〜やすい$$,
    $$yasui$$,
    $$Fácil de / Tende a / Propenso a$$,
    $$やすい é usado para dizer que algo é fácil de fazer. Equivale a "fácil de".

Ele é formado tirando ます do verbo e acrescentando やすい. O resultado funciona como um adjetivo い e se conjuga como tal: やすくない, やすかった, やすくて.

O uso principal é falar de facilidade, como uma caneta fácil de escrever ou uma explicação fácil de entender.

Outro uso importante é indicar tendência. Com verbos que descrevem algo que acontece sem querer, como pegar resfriado, quebrar ou escorregar, やすい significa "tender a" ou "ser propenso a".

O oposto de やすい é にくい, que significa "difícil de".$$,
    $$Não confunda com o adjetivo 安い (barato). Os dois têm a mesma pronúncia, mas este やすい vem sempre depois de um verbo.

No sentido de tendência, やすい costuma aparecer com coisas negativas, como doenças e acidentes.

A expressão わかりやすい (fácil de entender) é um dos elogios mais comuns para explicações e professores.$$,
    $$Verbo na forma ます sem ます + やすい

Negativo: やすくない
Passado: やすかった
Ligando: やすくて
Mudança: やすくなる$$,
    $$やすい$$,
    $$やすい|やすく|やすかった$$,
    ARRAY['やすい']::text[],
    ARRAY['やすい', 'やすくない', 'やすかった', 'やすくて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-120', $$このペンは書きやすいです。$$, $$このペンはかきやすいです。$$, $$Esta caneta é fácil de escrever.$$),
    ('n4-grammar-120', $$先生の説明はわかりやすい。$$, $$せんせいのせつめいはわかりやすい。$$, $$A explicação do professor é fácil de entender.$$),
    ('n4-grammar-120', $$この靴は軽くて歩きやすい。$$, $$このくつはかるくてあるきやすい。$$, $$Estes sapatos são leves e confortáveis para andar.$$),
    ('n4-grammar-120', $$冬は風邪をひきやすいので、気をつけてください。$$, $$ふゆはかぜをひきやすいので、きをつけてください。$$, $$No inverno a gente pega resfriado com facilidade, então tome cuidado.$$),
    ('n4-grammar-120', $$この町は住みやすくて、気に入っています。$$, $$このまちはすみやすくて、きにいっています。$$, $$Esta cidade é boa de morar e eu gosto muito dela.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この本は字が大きくて読み____です。$$, $$Este livro tem letras grandes e é fácil de ler.$$),
        (2, $$このアプリは使い____。$$, $$Este aplicativo é fácil de usar.$$),
        (3, $$ガラスは割れ____から、気をつけて。$$, $$Vidro quebra fácil, então tome cuidado.$$),
        (4, $$このかばんは軽くて持ち____。$$, $$Esta bolsa é leve e fácil de carregar.$$),
        (5, $$雨の日は道が滑り____なります。$$, $$Em dias de chuva, as ruas ficam escorregadias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-120', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やすい$$),
        (2, $$やすい$$),
        (2, $$やすいです$$),
        (3, $$やすい$$),
        (4, $$やすい$$),
        (4, $$やすいです$$),
        (5, $$やすく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-121 — やっと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-121',
    'grammar',
    'N4',
    $$やっと$$,
    $$yatto$$,
    $$Finalmente / Enfim / Por fim$$,
    $$やっと é um advérbio que significa "finalmente" ou "enfim". Ele é usado quando algo desejado acontece depois de muito tempo de espera ou de bastante esforço.

O tom é de alívio ou satisfação: a pessoa esperou, tentou ou se esforçou, e o resultado chegou. Por exemplo, terminar uma lição longa, passar numa prova depois de várias tentativas ou o ônibus chegar depois de muita espera.

Ele costuma aparecer com o verbo no passado ou com expressões de mudança, como ようになった.

やっと é diferente de ついに. ついに também significa "finalmente", mas soa mais formal e dramático, e pode ser usado para resultados bons ou ruins. やっと é usado quase sempre para algo desejado.$$,
    $$Por ter um tom de alívio, やっと não combina bem com resultados negativos. Para algo ruim que finalmente aconteceu, usa-se ついに.

Também existe a expressão やっと〜できる, para algo que se consegue fazer com muito custo.

Na fala, やっと pode aparecer sozinho, como um suspiro de alívio: "finalmente!".$$,
    $$やっと + Verbo (passado)
やっと + Verbo potencial + ようになった
やっと + Substantivo + になった$$,
    $$やっと$$,
    $$やっと$$,
    ARRAY['やっと']::text[],
    ARRAY['やっと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-121', $$やっと宿題が終わった。$$, $$やっとしゅくだいがおわった。$$, $$Finalmente terminei a lição.$$),
    ('n4-grammar-121', $$三十分待って、やっとバスが来た。$$, $$さんじゅっぷんまって、やっとバスがきた。$$, $$Depois de esperar trinta minutos, o ônibus finalmente chegou.$$),
    ('n4-grammar-121', $$三回目の試験で、やっと合格しました。$$, $$さんかいめのしけんで、やっとごうかくしました。$$, $$Na terceira tentativa, finalmente passei na prova.$$),
    ('n4-grammar-121', $$長い冬が終わって、やっと春になりましたね。$$, $$ながいふゆがおわって、やっとはるになりましたね。$$, $$O longo inverno acabou e finalmente chegou a primavera, né?$$),
    ('n4-grammar-121', $$長い間探していた本が、やっと見つかった。$$, $$ながいあいださがしていたほんが、やっとみつかった。$$, $$Finalmente achei o livro que estava procurando havia muito tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一時間並んで、____店に入れた。$$, $$Depois de uma hora na fila, finalmente consegui entrar na loja.$$),
        (2, $$三日間降り続いた雨が、____やみました。$$, $$A chuva que caiu por três dias finalmente parou.$$),
        (3, $$長い仕事が____終わった。$$, $$O trabalho longo finalmente terminou.$$),
        (4, $$何度も練習して、____自転車に乗れるようになった。$$, $$Pratiquei muitas vezes e finalmente aprendi a andar de bicicleta.$$),
        (5, $$ずっと待っていた荷物が____届いた。$$, $$A encomenda que eu esperava havia tanto tempo finalmente chegou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-121', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やっと$$),
        (2, $$やっと$$),
        (3, $$やっと$$),
        (4, $$やっと$$),
        (5, $$やっと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-122 — 〜より
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-122',
    'grammar',
    'N4',
    $$〜より$$,
    $$yori$$,
    $$Do que / Mais (do que)$$,
    $$No N4, より aparece em comparações de forma mais livre do que no N5. Ele marca o ponto de comparação, como "do que".

Além das estruturas básicas, より é muito usado com verbos e expressões de expectativa: 思ったより (do que eu pensava), 予定より (do que o planejado), いつもより (do que de costume).

Ele também liga ações: "em vez de telefonar, é melhor conversar pessoalmente", com より depois da primeira ação.

Antes de um adjetivo, sem ponto de comparação explícito, より funciona como advérbio e significa "mais", como em "uma vida melhor" ou "mais pessoas". Esse uso é mais comum na escrita e em discursos.$$,
    $$思ったより é uma das expressões mais úteis do japonês para falar de surpresas: "foi mais fácil do que eu pensava".

O uso de より como "mais", antes de adjetivos, é influência da escrita e soa um pouco formal.

Na escrita formal, より também pode significar "a partir de", como em horários de eventos.$$,
    $$A + より + Adjetivo (mais... do que A)
思った / 予定 / いつも + より + Adjetivo
Verbo A + より + Verbo B + ほうが + Adjetivo
より + Adjetivo + Substantivo (mais...)$$,
    $$より$$,
    $$より$$,
    ARRAY['より']::text[],
    ARRAY['より']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-122', $$今日の試験は思ったより簡単でした。$$, $$きょうのしけんはおもったよりかんたんでした。$$, $$A prova de hoje foi mais fácil do que eu pensava.$$),
    ('n4-grammar-122', $$去年より今年のほうが雪が多い。$$, $$きょねんよりことしのほうがゆきがおおい。$$, $$Este ano tem mais neve do que o ano passado.$$),
    ('n4-grammar-122', $$より良い生活のために、毎日頑張っています。$$, $$よりよいせいかつのために、まいにちがんばっています。$$, $$Eu me esforço todo dia por uma vida melhor.$$),
    ('n4-grammar-122', $$飛行機は予定より早く着きました。$$, $$ひこうきはよていよりはやくつきました。$$, $$O avião chegou mais cedo do que o previsto.$$),
    ('n4-grammar-122', $$電話するより、会って話したほうがいい。$$, $$でんわするより、あってはなしたほうがいい。$$, $$É melhor conversar pessoalmente do que telefonar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$テストは思った____難しかった。$$, $$A prova foi mais difícil do que eu pensava.$$),
        (2, $$今朝はいつも____早く起きました。$$, $$Hoje de manhã, acordei mais cedo do que de costume.$$),
        (3, $$新しいパソコンは前のもの____ずっと速い。$$, $$O computador novo é muito mais rápido do que o anterior.$$),
        (4, $$____多くの人に、この本を読んでほしい。$$, $$Quero que mais pessoas leiam este livro.$$),
        (5, $$外で食べる____、家で作るほうが安い。$$, $$Fazer comida em casa é mais barato do que comer fora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-122', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$より$$),
        (2, $$より$$),
        (3, $$より$$),
        (4, $$より$$),
        (5, $$より$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-123 — 〜予定だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-123',
    'grammar',
    'N4',
    $$〜予定だ$$,
    $$yotei da$$,
    $$Estar previsto / Ter planejado / Estar programado$$,
    $$予定だ é usado para falar de planos e programações já definidos. Equivale a "está previsto que", "tenho planejado" ou "está programado".

予定 significa "plano" ou "programação". Ele indica algo concreto e agendado, como uma viagem com data marcada, o horário de uma reunião ou a chegada de um voo.

Ele vem depois do verbo na forma de dicionário. Com substantivos, usa-se の: 出張の予定.

A diferença em relação a つもり é o grau de concretude. つもり é uma intenção pessoal; 予定 é um plano mais definido, muitas vezes compartilhado com outras pessoas ou com data marcada.

No passado, 予定でした indica algo que estava programado, mas que muitas vezes não aconteceu como previsto.$$,
    $$Como substantivo, 予定 é muito usado em perguntas como 明日の予定は? ("quais são os planos para amanhã?").

Para dizer que você está livre, usa-se 予定がない ou 予定はありません.

Em avisos e notícias, 予定 aparece muito para informar horários e datas oficiais.$$,
    $$Verbo na forma de dicionário + 予定だ / 予定です
Substantivo + の + 予定だ
Passado: 予定だった / 予定でした

Escrita: 予定 / よてい$$,
    $$予定$$,
    $$予定|よてい$$,
    ARRAY['予定', 'だ']::text[],
    ARRAY['予定だ', '予定です', '予定だった', '予定でした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-123', $$来月、京都へ行く予定です。$$, $$らいげつ、きょうとへいくよていです。$$, $$Mês que vem, vou a Kyoto, está planejado.$$),
    ('n4-grammar-123', $$会議は三時に始まる予定だ。$$, $$かいぎはさんじにはじまるよていだ。$$, $$A reunião está prevista para começar às três.$$),
    ('n4-grammar-123', $$明日の予定は何ですか。$$, $$あしたのよていはなんですか。$$, $$Quais são os planos para amanhã?$$),
    ('n4-grammar-123', $$飛行機は十時に着く予定でしたが、遅れました。$$, $$ひこうきはじゅうじにつくよていでしたが、おくれました。$$, $$O avião estava previsto para chegar às dez, mas atrasou.$$),
    ('n4-grammar-123', $$来年の春、結婚する予定です。$$, $$らいねんのはる、けっこんするよていです。$$, $$Está previsto que eu me case na primavera do ano que vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$来週、大阪に出張する____です。$$, $$Semana que vem, está prevista uma viagem a trabalho para Osaka.$$),
        (2, $$新しい駅は来年完成する____だ。$$, $$A nova estação está prevista para ficar pronta no ano que vem.$$),
        (3, $$夏休みは北海道を旅行する____です。$$, $$Nas férias de verão, tenho planejado viajar por Hokkaido.$$),
        (4, $$電車は八時に出発する____でしたが、遅れています。$$, $$O trem estava previsto para sair às oito, mas está atrasado.$$),
        (5, $$週末は何をする____ですか。$$, $$O que você tem planejado para o fim de semana?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-123', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$予定$$),
        (1, $$よてい$$),
        (2, $$予定$$),
        (2, $$よてい$$),
        (3, $$予定$$),
        (3, $$よてい$$),
        (4, $$予定$$),
        (4, $$よてい$$),
        (5, $$予定$$),
        (5, $$よてい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-124 — 〜ようだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-124',
    'grammar',
    'N4',
    $$〜ようだ$$,
    $$you da$$,
    $$Parece que / Parece / Como se fosse$$,
    $$ようだ tem dois usos principais e é a versão mais formal de みたいだ.

O primeiro é fazer uma suposição baseada no que a pessoa percebe com os próprios sentidos ou em informações que tem. Equivale a "parece que". Por exemplo, ver as luzes apagadas e concluir que todos já foram dormir.

O segundo é fazer uma comparação, dizendo que algo se parece com outra coisa. Equivale a "parece" ou "como se fosse". É comum junto com まるで.

ようだ funciona como um substantivo. Por isso, vem depois de substantivos com の, depois de adjetivos な com な, e depois da forma simples de verbos e adjetivos い.

É mais comum na escrita e em situações formais. Na conversa casual, みたいだ é mais usado.$$,
    $$A diferença de ligação é importante: com ようだ, usa-se の depois de substantivos (休みのようだ); com みたいだ, não (休みみたいだ).

Comparando suposições: ようだ se baseia em observação direta; らしい, em informação ouvida; そうだ (aparência), na impressão visual imediata.

ようです é uma forma educada e cautelosa de dar uma informação sem afirmar com certeza absoluta.$$,
    $$Verbo / Adjetivo い (forma simples) + ようだ
Adjetivo な + な + ようだ
Substantivo + の + ようだ

Educado: ようです
Comparação: まるで + Substantivo + の + ようだ$$,
    $$ようだ$$,
    $$ようだ|ようです$$,
    ARRAY['よう', 'だ']::text[],
    ARRAY['ようだ', 'ようです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-124', $$玄関で音がした。誰か来たようです。$$, $$げんかんでおとがした。だれかきたようです。$$, $$Teve um barulho na entrada. Parece que alguém chegou.$$),
    ('n4-grammar-124', $$彼は風邪をひいているようだ。$$, $$かれはかぜをひいているようだ。$$, $$Parece que ele está resfriado.$$),
    ('n4-grammar-124', $$みんなコートを着ている。外は寒いようですね。$$, $$みんなコートをきている。そとはさむいようですね。$$, $$Todo mundo está de casaco. Parece que está frio lá fora, né?$$),
    ('n4-grammar-124', $$電気が消えている。この店は今日休みのようだ。$$, $$でんきがきえている。このみせはきょうやすみのようだ。$$, $$As luzes estão apagadas. Parece que esta loja está fechada hoje.$$),
    ('n4-grammar-124', $$彼女はまるで人形のようだ。$$, $$かのじょはまるでにんぎょうのようだ。$$, $$Ela parece até uma boneca.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$電気が消えている。みんなもう寝た____。$$, $$As luzes estão apagadas. Parece que todos já foram dormir.$$),
        (2, $$道が濡れているから、雨が降った____。$$, $$A rua está molhada, então parece que choveu.$$),
        (3, $$田中さんは今日、忙しい____です。$$, $$Parece que o Tanaka está ocupado hoje.$$),
        (4, $$いつも人が並んでいる。あの店は人気がある____。$$, $$Sempre tem fila. Parece que aquela loja é popular.$$),
        (5, $$この部屋は静かで、まるで図書館の____。$$, $$Este quarto é tão silencioso que parece uma biblioteca.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-124', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようだ$$),
        (1, $$ようです$$),
        (2, $$ようだ$$),
        (2, $$ようです$$),
        (3, $$よう$$),
        (4, $$ようだ$$),
        (4, $$ようです$$),
        (5, $$ようだ$$),
        (5, $$ようです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-125 — 〜ように・〜ような
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-125',
    'grammar',
    'N4',
    $$〜ように・〜ような$$,
    $$you ni / you na$$,
    $$Como / Igual a / Do mesmo jeito que$$,
    $$ように e ような são formas de ようだ usadas para fazer comparações, dar exemplos ou indicar conformidade.

ような vem antes de um substantivo. Ela compara ou dá um exemplo: "uma pessoa como o professor", "uma cidade grande como Tóquio", "um dia que parece um sonho".

ように vem antes de um verbo ou adjetivo. Ela descreve o modo como algo é feito, comparando com outra coisa: "riu como uma criança", "bonita como uma flor".

ように também indica conformidade, ou seja, "do jeito que" ou "conforme", como em "faça como o professor disse".

São versões mais formais de みたいな e みたいに. Com substantivos, usa-se の antes: 先生のような.$$,
    $$A expressão 前にも話したように ("como já falei antes") é muito comum em explicações.

Na fala casual, みたいな e みたいに são mais frequentes, mas ような e ように são preferidos na escrita.

ように também tem outro uso importante: indicar objetivo ("para que..."), que aparece no N3.$$,
    $$Substantivo + の + ような + Substantivo
Substantivo + の + ように + Verbo / Adjetivo
Verbo (forma simples) + ように + Verbo (conforme / do jeito que)
Verbo + ような + Substantivo$$,
    $$ような$$,
    $$ように|ような$$,
    ARRAY['よう', 'に', 'な']::text[],
    ARRAY['ように', 'ような']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-125', $$私も先生のような人になりたい。$$, $$わたしもせんせいのようなひとになりたい。$$, $$Eu também quero ser uma pessoa como o professor.$$),
    ('n4-grammar-125', $$彼は子供のように笑った。$$, $$かれはこどものようにわらった。$$, $$Ele riu como uma criança.$$),
    ('n4-grammar-125', $$東京のような大きい町に住みたい。$$, $$とうきょうのようなおおきいまちにすみたい。$$, $$Quero morar numa cidade grande como Tóquio.$$),
    ('n4-grammar-125', $$先生が言ったように、もう一度やってみます。$$, $$せんせいがいったように、もういちどやってみます。$$, $$Vou tentar mais uma vez, como o professor disse.$$),
    ('n4-grammar-125', $$昨日は夢のような一日でした。$$, $$きのうはゆめのようないちにちでした。$$, $$Ontem foi um dia que pareceu um sonho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は花の____美しい。$$, $$Ela é bonita como uma flor.$$),
        (2, $$母の____優しい人になりたい。$$, $$Quero ser uma pessoa gentil como a minha mãe.$$),
        (3, $$前に話した____、明日は休みです。$$, $$Como falei antes, amanhã é folga.$$),
        (4, $$雪の____白いケーキを作りました。$$, $$Fiz um bolo branco como a neve.$$),
        (5, $$鳥の____空を飛んでみたい。$$, $$Quero experimentar voar pelo céu como um pássaro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-125', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ように$$),
        (2, $$ような$$),
        (3, $$ように$$),
        (4, $$ような$$),
        (5, $$ように$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-126 — 〜ようになる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-126',
    'grammar',
    'N4',
    $$〜ようになる$$,
    $$you ni naru$$,
    $$Passar a / Começar a / Conseguir (com o tempo)$$,
    $$ようになる é usado para indicar uma mudança gradual de capacidade ou de hábito. Equivale a "passar a", "começar a" ou "conseguir, com o tempo".

Com a forma potencial, mostra que a pessoa ganhou uma habilidade depois de algum tempo ou esforço. Por exemplo, "passei a conseguir falar japonês" ou "aprendi a nadar".

Com a forma de dicionário, mostra que um hábito mudou. Por exemplo, "passei a acordar cedo" ou "meu filho passou a comer verdura".

Com a forma ない, indica que algo deixou de acontecer: なくなる ou ないようになる.

A ideia central é que a situação antes era diferente e foi mudando até chegar ao estado atual.$$,
    $$Para dizer que alguém deixou de fazer algo, a forma なくなる é mais comum que ないようになる: タバコを吸わなくなった.

A diferença entre ようになる e ようにする está em quem controla a mudança: ようになる é uma mudança que aconteceu; ようにする é um esforço consciente.

É muito usado para falar do próprio progresso nos estudos.$$,
    $$Verbo potencial + ようになる (passar a conseguir)
Verbo na forma de dicionário + ようになる (passar a fazer)
Verbo na forma ない + ようになる (deixar de fazer)

Passado: ようになった / ようになりました$$,
    $$ようになる$$,
    $$ようになる|ようになった|ようになりました|ようになって|ようになります$$,
    ARRAY['よう', 'に', 'なる']::text[],
    ARRAY['ようになる', 'ようになった', 'ようになりました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-126', $$一年勉強して、日本語が話せるようになりました。$$, $$いちねんべんきょうして、にほんごがはなせるようになりました。$$, $$Depois de um ano estudando, passei a conseguir falar japonês.$$),
    ('n4-grammar-126', $$最近、毎朝早く起きるようになった。$$, $$さいきん、まいあさはやくおきるようになった。$$, $$Ultimamente, passei a acordar cedo toda manhã.$$),
    ('n4-grammar-126', $$たくさん練習して、泳げるようになった。$$, $$たくさんれんしゅうして、およげるようになった。$$, $$Treinei bastante e aprendi a nadar.$$),
    ('n4-grammar-126', $$子供が野菜を食べるようになりました。$$, $$こどもがやさいをたべるようになりました。$$, $$Meu filho passou a comer verdura.$$),
    ('n4-grammar-126', $$引っ越してから、あまり車に乗らないようになった。$$, $$ひっこしてから、あまりくるまにのらないようになった。$$, $$Depois da mudança, deixei de andar muito de carro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$漢字が少し読める____。$$, $$Passei a conseguir ler um pouco de kanji.$$),
        (2, $$毎日練習して、ピアノが弾ける____。$$, $$Pratiquei todo dia e aprendi a tocar piano.$$),
        (3, $$弟は最近、よく勉強する____。$$, $$Ultimamente, meu irmão mais novo passou a estudar bastante.$$),
        (4, $$日本に来てから、納豆が食べられる____。$$, $$Desde que vim ao Japão, passei a conseguir comer natto.$$),
        (5, $$結婚してから、夫はタバコを吸わない____。$$, $$Depois do casamento, meu marido deixou de fumar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-126', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようになりました$$),
        (1, $$ようになった$$),
        (2, $$ようになりました$$),
        (2, $$ようになった$$),
        (3, $$ようになりました$$),
        (3, $$ようになった$$),
        (4, $$ようになりました$$),
        (4, $$ようになった$$),
        (5, $$ようになりました$$),
        (5, $$ようになった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-127 — 〜ようにする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-127',
    'grammar',
    'N4',
    $$〜ようにする$$,
    $$you ni suru$$,
    $$Procurar (fazer) / Tentar sempre / Fazer questão de$$,
    $$ようにする é usado para dizer que alguém se esforça para fazer, ou não fazer, algo. Equivale a "procurar fazer", "tentar sempre" ou "fazer questão de".

A ideia é de esforço consciente para criar ou manter um hábito, mesmo que nem sempre dê certo.

Na forma ようにしている, indica um hábito que a pessoa vem mantendo com esforço, como comer verdura todo dia ou usar a escada.

Na forma ようにしてください, é um pedido educado para que alguém tome cuidado ou se esforce, como "procure não se atrasar".

Com a forma ない, indica o esforço para evitar algo: ないようにする.$$,
    $$Compare: ことにする é uma decisão pontual; ようにする é um esforço contínuo para que algo aconteça.

ようにしてください é mais suave que てください, porque pede um esforço, e não uma ação imediata.

É uma estrutura muito comum para falar de cuidados com a saúde e de boas práticas.$$,
    $$Verbo na forma de dicionário + ようにする
Verbo na forma ない + ようにする

Hábito: ようにしている / ようにしています
Pedido: ようにしてください
Decisão: ようにします$$,
    $$ようにする$$,
    $$ようにする|ようにします|ようにしている|ようにしています|ようにして|ようにした|ようにしました$$,
    ARRAY['よう', 'に', 'する']::text[],
    ARRAY['ようにする', 'ようにしている', 'ようにしてください', 'ようにします']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-127', $$健康のために、毎日野菜を食べるようにしています。$$, $$けんこうのために、まいにちやさいをたべるようにしています。$$, $$Pela saúde, procuro comer verdura todo dia.$$),
    ('n4-grammar-127', $$夜遅くまでゲームをしないようにします。$$, $$よるおそくまでゲームをしないようにします。$$, $$Vou procurar não jogar videogame até tarde da noite.$$),
    ('n4-grammar-127', $$約束の時間に遅れないようにしてください。$$, $$やくそくのじかんにおくれないようにしてください。$$, $$Procure não se atrasar para o horário combinado.$$),
    ('n4-grammar-127', $$できるだけ階段を使うようにしている。$$, $$できるだけかいだんをつかうようにしている。$$, $$Procuro usar a escada sempre que possível.$$),
    ('n4-grammar-127', $$忘れないように、メモするようにしました。$$, $$わすれないように、メモするようにしました。$$, $$Para não esquecer, passei a anotar tudo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日三十分歩く____います。$$, $$Procuro caminhar trinta minutos todo dia.$$),
        (2, $$寝る前にスマホを見ない____。$$, $$Procuro não olhar o celular antes de dormir.$$),
        (3, $$明日は遅れない____ください。$$, $$Procure não se atrasar amanhã, por favor.$$),
        (4, $$健康のために、早く寝る____。$$, $$Pela saúde, procuro dormir cedo.$$),
        (5, $$わからない言葉は、すぐ辞書で調べる____。$$, $$Faço questão de procurar logo no dicionário as palavras que não entendo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-127', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようにして$$),
        (2, $$ようにします$$),
        (2, $$ようにしている$$),
        (2, $$ようにしています$$),
        (3, $$ようにして$$),
        (4, $$ようにしています$$),
        (4, $$ようにしている$$),
        (5, $$ようにしています$$),
        (5, $$ようにしている$$),
        (5, $$ようにします$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-128 — 〜ようと思う
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-128',
    'grammar',
    'N4',
    $$〜ようと思う$$,
    $$you to omou$$,
    $$Pensar em (fazer) / Estar pensando em / Pretender$$,
    $$ようと思う é usado para dizer que você está pensando em fazer algo, ou que tem a intenção de fazer. Equivale a "estou pensando em..." ou "pretendo...".

Ele junta a forma volitiva do verbo (行こう, 食べよう) com と思う. A ideia literal é "penso: vou fazer isso".

A forma ようと思います expressa uma intenção no momento da fala. A forma ようと思っています indica uma intenção que a pessoa já tem há algum tempo, mais firme.

Comparado a つもり, ようと思う soa mais suave e flexível, como uma ideia que ainda está sendo considerada.$$,
    $$Para falar da intenção de outra pessoa, usa-se ようと思っている, e não ようと思う.

Na pergunta, 〜ようと思っていますか é uma forma educada de perguntar os planos de alguém.

ようと思ったけど significa "eu ia fazer, mas...", indicando uma intenção que não se concretizou.$$,
    $$Forma volitiva + と思う / と思います
Forma volitiva + と思っている / と思っています (intenção que se mantém)

Exemplos: 行く → 行こうと思う / 食べる → 食べようと思う / する → しようと思う$$,
    $$ようと思う$$,
    $$うと思|うとおも$$,
    ARRAY['よう', 'と', '思う']::text[],
    ARRAY['ようと思う', 'ようと思います', 'ようと思っている', 'おうと思う']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-128', $$来年、日本へ留学しようと思います。$$, $$らいねん、にほんへりゅうがくしようとおもいます。$$, $$Estou pensando em fazer intercâmbio no Japão no ano que vem.$$),
    ('n4-grammar-128', $$週末は家でゆっくり休もうと思う。$$, $$しゅうまつはいえでゆっくりやすもうとおもう。$$, $$No fim de semana, penso em descansar em casa com calma.$$),
    ('n4-grammar-128', $$新しいパソコンを買おうと思っています。$$, $$あたらしいパソコンをかおうとおもっています。$$, $$Estou pensando em comprar um computador novo.$$),
    ('n4-grammar-128', $$疲れたから、今日は早く寝ようと思います。$$, $$つかれたから、きょうははやくねようとおもいます。$$, $$Estou cansado, então penso em dormir cedo hoje.$$),
    ('n4-grammar-128', $$将来、自分の店を開こうと思っている。$$, $$しょうらい、じぶんのみせをひらこうとおもっている。$$, $$No futuro, pretendo abrir minha própria loja.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏休みに北海道へ行こ____います。$$, $$Estou pensando em ir a Hokkaido nas férias de verão.$$),
        (2, $$明日から毎朝走ろ____。$$, $$Estou pensando em correr toda manhã a partir de amanhã.$$),
        (3, $$来月、駅の近くに引っ越そ____います。$$, $$Estou pensando em me mudar para perto da estação no mês que vem.$$),
        (4, $$今夜はカレーを作ろ____。$$, $$Hoje à noite, penso em fazer curry.$$),
        (5, $$大学を卒業したら、日本で働こ____いる。$$, $$Depois de me formar na faculdade, pretendo trabalhar no Japão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-128', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$うと思って$$),
        (2, $$うと思います$$),
        (2, $$うと思う$$),
        (3, $$うと思って$$),
        (4, $$うと思います$$),
        (4, $$うと思う$$),
        (5, $$うと思って$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-129 — ぜひ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-129',
    'grammar',
    'N4',
    $$ぜひ$$,
    $$zehi$$,
    $$Sem falta / Com certeza / Por favor (insistindo)$$,
    $$ぜひ é um advérbio que expressa um desejo forte ou um convite sincero. Equivale a "sem falta", "com certeza" ou "por favor, não deixe de...".

Ele é usado com expressões de desejo, pedido ou convite, como たい, てほしい, てください e ませんか. Isso porque ぜひ fala de algo que a pessoa quer muito que aconteça.

Por exemplo, convidar alguém dizendo "venha nos visitar sem falta" ou dizer "quero muito ir ao Japão um dia".

Sozinho, como resposta, ぜひ significa "com certeza!" ou "eu adoraria!", aceitando um convite com entusiasmo.$$,
    $$ぜひ não combina com frases negativas nem com simples fatos. Ele precisa de desejo, pedido ou convite.

Em convites, ぜひ deixa claro que o convite é sincero, e não apenas por educação.

O kanji 是非 também é usado na expressão 是非とも, que é ainda mais enfática.$$,
    $$ぜひ + Verbo たい (querer muito)
ぜひ + Verbo て + ください (por favor, não deixe de...)
ぜひ + Verbo て + ほしい
ぜひ + Verbo ませんか
ええ、ぜひ (resposta: com certeza!)

Escrita: ぜひ / 是非$$,
    $$ぜひ$$,
    $$ぜひ|是非$$,
    ARRAY['ぜひ']::text[],
    ARRAY['ぜひ', '是非']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-129', $$今度、ぜひ遊びに来てください。$$, $$こんど、ぜひあそびにきてください。$$, $$Da próxima vez, venha nos visitar sem falta.$$),
    ('n4-grammar-129', $$一度ぜひ日本へ行きたいです。$$, $$いちどぜひにほんへいきたいです。$$, $$Quero muito ir ao Japão pelo menos uma vez.$$),
    ('n4-grammar-129', $$この映画はぜひ見てほしい。$$, $$このえいがはぜひみてほしい。$$, $$Quero muito que você veja este filme.$$),
    ('n4-grammar-129', $$「今度一緒に食事しませんか。」「ええ、ぜひ。」$$, $$「こんどいっしょにしょくじしませんか。」「ええ、ぜひ。」$$, $$"Vamos comer juntos da próxima vez?" "Claro, eu adoraria."$$),
    ('n4-grammar-129', $$ぜひ私に手伝わせてください。$$, $$ぜひわたしにてつだわせてください。$$, $$Por favor, deixe-me ajudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$京都に来たら、____この寺を見てください。$$, $$Se vier a Kyoto, não deixe de ver este templo.$$),
        (2, $$機会があれば、____富士山に登りたい。$$, $$Se tiver a oportunidade, quero muito subir o Monte Fuji.$$),
        (3, $$「パーティーに来ませんか。」「____行きたいです。」$$, $$"Quer vir à festa?" "Quero muito ir."$$),
        (4, $$この本はおもしろいから、____読んでみてください。$$, $$Este livro é interessante, então não deixe de ler.$$),
        (5, $$「また会いましょう。」「はい、____。」$$, $$"Vamos nos ver de novo." "Sim, com certeza."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-129', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぜひ$$),
        (2, $$ぜひ$$),
        (3, $$ぜひ$$),
        (4, $$ぜひ$$),
        (5, $$ぜひ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-130 — 全然〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-130',
    'grammar',
    'N4',
    $$全然〜ない$$,
    $$zenzen ~ nai$$,
    $$Nada / Nem um pouco / De jeito nenhum$$,
    $$全然〜ない é usado para negar algo completamente. Equivale a "nada", "nem um pouco" ou "de jeito nenhum".

全然 vem antes do verbo ou do adjetivo, e a frase fica na forma negativa. A ideia é de negação total, a mais forte entre os advérbios de frequência e intensidade.

Por exemplo, "não entendo nada de japonês", "não é nem um pouco apimentado" ou "não dormi nada".

Comparando: あまり〜ない significa "não muito", e 全然〜ない significa "nada". É uma diferença de intensidade.$$,
    $$Na fala jovem, 全然 também aparece em frases afirmativas, como 全然大丈夫 ("está tudo bem, sem problema nenhum"). Esse uso é coloquial e muitas pessoas consideram informal, mas é muito comum.

Em provas e textos formais, use 全然 sempre com negativa.

Outras expressões de negação total são 少しも〜ない e ちっとも〜ない, que têm sentido parecido.$$,
    $$全然 + Verbo na forma negativa
全然 + Adjetivo い sem い + くない
全然 + Adjetivo な / Substantivo + じゃない

Escrita: 全然 / ぜんぜん$$,
    $$全然$$,
    $$全然|ぜんぜん$$,
    ARRAY['全然', 'ない']::text[],
    ARRAY['全然', 'ぜんぜん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-130', $$すみません、日本語が全然わかりません。$$, $$すみません、にほんごがぜんぜんわかりません。$$, $$Desculpe, não entendo nada de japonês.$$),
    ('n4-grammar-130', $$昨日は全然寝られなかった。$$, $$きのうはぜんぜんねられなかった。$$, $$Ontem não consegui dormir nada.$$),
    ('n4-grammar-130', $$この料理は全然辛くない。$$, $$このりょうりはぜんぜんからくない。$$, $$Esta comida não é nem um pouco apimentada.$$),
    ('n4-grammar-130', $$最近、全然運動していない。$$, $$さいきん、ぜんぜんうんどうしていない。$$, $$Ultimamente, não tenho feito nenhum exercício.$$),
    ('n4-grammar-130', $$彼の話は全然おもしろくなかった。$$, $$かれのはなしはぜんぜんおもしろくなかった。$$, $$A história dele não teve graça nenhuma.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お酒は____飲みません。$$, $$Não bebo nada de álcool.$$),
        (2, $$この問題は____難しくない。$$, $$Esta questão não é nem um pouco difícil.$$),
        (3, $$彼女のことは____知りません。$$, $$Não sei nada sobre ela.$$),
        (4, $$もう夜なのに、宿題が____終わっていない。$$, $$Já é noite e a lição não está nem perto de terminar.$$),
        (5, $$昨日の試験は____できなかった。$$, $$Não consegui fazer nada na prova de ontem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-130', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$全然$$),
        (1, $$ぜんぜん$$),
        (2, $$全然$$),
        (2, $$ぜんぜん$$),
        (3, $$全然$$),
        (3, $$ぜんぜん$$),
        (4, $$全然$$),
        (4, $$ぜんぜん$$),
        (5, $$全然$$),
        (5, $$ぜんぜん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-131 — 〜づらい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-131',
    'grammar',
    'N4',
    $$〜づらい$$,
    $$zurai$$,
    $$Difícil de / Desconfortável de / Custoso de$$,
    $$づらい é usado para dizer que algo é difícil ou desconfortável de fazer. Equivale a "difícil de" ou "custoso de".

Ele é formado tirando ます do verbo e acrescentando づらい, que vem do adjetivo 辛い (penoso). O resultado funciona como um adjetivo い.

A diferença em relação a にくい é sutil. にくい indica uma dificuldade mais objetiva, ligada à característica da coisa. づらい destaca o desconforto ou o sofrimento de quem faz, físico ou emocional.

Por isso, づらい é muito usado em situações emocionais, como ser difícil recusar um pedido, ser difícil dizer a verdade ou pedir algo a alguém.$$,
    $$Para situações físicas, como ler letras pequenas, づらい e にくい muitas vezes podem ser trocados.

Para situações emocionais, como 言いづらい e 断りづらい, づらい soa mais natural.

づらい geralmente não é usado para coisas que acontecem sozinhas, como algo que "não quebra fácil". Nesse caso, usa-se にくい.$$,
    $$Verbo na forma ます sem ます + づらい

Negativo: づらくない
Passado: づらかった
Ligando: づらくて
Mudança: づらくなる$$,
    $$づらい$$,
    $$づらい|づらく|づらかった$$,
    ARRAY['づらい']::text[],
    ARRAY['づらい', 'づらくない', 'づらかった', 'づらくて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-131', $$この靴はきつくて歩きづらい。$$, $$このくつはきつくてあるきづらい。$$, $$Estes sapatos são apertados e desconfortáveis para andar.$$),
    ('n4-grammar-131', $$先輩のお願いは、断りづらいです。$$, $$せんぱいのおねがいは、ことわりづらいです。$$, $$É difícil recusar um pedido do veterano.$$),
    ('n4-grammar-131', $$字が小さくて読みづらい。$$, $$じがちいさくてよみづらい。$$, $$As letras são pequenas e difíceis de ler.$$),
    ('n4-grammar-131', $$本当のことは言いづらかった。$$, $$ほんとうのことはいいづらかった。$$, $$Foi difícil dizer a verdade.$$),
    ('n4-grammar-131', $$骨が多くて、この魚は食べづらい。$$, $$ほねがおおくて、このさかなはたべづらい。$$, $$Este peixe tem muita espinha e é difícil de comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の前では、そのことは話し____。$$, $$Na frente dela, é difícil falar sobre isso.$$),
        (2, $$部長には相談し____です。$$, $$É difícil pedir conselho ao gerente.$$),
        (3, $$この部屋は暗くて、本が読み____。$$, $$Este quarto é escuro, e é difícil ler.$$),
        (4, $$喉が痛くて、薬が飲み込み____。$$, $$Estou com dor de garganta e é difícil engolir o remédio.$$),
        (5, $$一度断ると、もう一度頼み____なる。$$, $$Depois de recusar uma vez, fica difícil pedir de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-131', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$づらい$$),
        (1, $$づらいです$$),
        (2, $$づらい$$),
        (3, $$づらい$$),
        (3, $$づらいです$$),
        (4, $$づらい$$),
        (4, $$づらいです$$),
        (5, $$づらく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-132 — あげる・くれる・もらう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-132',
    'grammar',
    'N4',
    $$あげる・くれる・もらう$$,
    $$ageru / kureru / morau$$,
    $$Dar / Dar (para mim) / Receber$$,
    $$あげる, くれる e もらう são os verbos de dar e receber. A escolha depende da direção da coisa e de quem está envolvido.

• あげる: dar algo para outra pessoa. A coisa sai de quem fala (ou do seu grupo) e vai para alguém de fora, ou vai de uma terceira pessoa para outra.
• くれる: dar algo para quem fala ou para alguém do seu grupo, como a família. A coisa vem de fora em direção a "mim".
• もらう: receber algo de alguém. O sujeito é quem recebe, e quem deu é marcado com に ou から.

O ponto mais importante é que, quando alguém dá algo para você, não se usa あげる: usa-se くれる. Isso mostra o ponto de vista de quem fala.

Esses mesmos verbos aparecem com a forma て (てあげる, てくれる, てもらう) para falar de favores.$$,
    $$Com pessoas da sua família, くれる também é usado quando alguém dá algo para um familiar seu, porque a família é vista como parte do seu grupo.

Para dar algo a animais e plantas, usa-se やる, que é mais informal.

Quando o presente vem de uma instituição, como uma empresa ou escola, もらう costuma usar から, e não に.$$,
    $$Quem dá + は / が + Quem recebe + に + Coisa + を + あげる
Quem dá + が + (私に) + Coisa + を + くれる
Quem recebe + は / が + Quem dá + に / から + Coisa + を + もらう

Formas respeitosas e humildes:
あげる → さしあげる (para superiores)
くれる → くださる (de superiores)
もらう → いただく (de superiores)$$,
    $$あげる$$,
    $$あげ|くれ|もら$$,
    ARRAY['あげる', 'くれる', 'もらう']::text[],
    ARRAY['あげる', 'くれる', 'もらう', 'さしあげる', 'くださる', 'いただく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-132', $$私は友達に誕生日プレゼントをあげました。$$, $$わたしはともだちにたんじょうびプレゼントをあげました。$$, $$Dei um presente de aniversário para meu amigo.$$),
    ('n4-grammar-132', $$母が私に時計をくれました。$$, $$ははがわたしにとけいをくれました。$$, $$Minha mãe me deu um relógio.$$),
    ('n4-grammar-132', $$私は先生から本をもらいました。$$, $$わたしはせんせいからほんをもらいました。$$, $$Ganhei um livro do professor.$$),
    ('n4-grammar-132', $$弟は田中さんにお菓子をもらった。$$, $$おとうとはたなかさんにおかしをもらった。$$, $$Meu irmão mais novo ganhou doces do Tanaka.$$),
    ('n4-grammar-132', $$友達が妹に花をくれた。$$, $$ともだちがいもうとにはなをくれた。$$, $$Meu amigo deu flores para a minha irmã mais nova.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私は妹にケーキを____。$$, $$Dei um bolo para a minha irmã mais nova.$$),
        (2, $$誕生日に父が私にかばんを____。$$, $$No meu aniversário, meu pai me deu uma bolsa.$$),
        (3, $$私は友達から手紙を____。$$, $$Recebi uma carta de um amigo.$$),
        (4, $$隣の人が私の家族に野菜を____。$$, $$O vizinho deu verduras para a minha família.$$),
        (5, $$田中さんは山田さんに本を____。$$, $$O Tanaka deu um livro para o Yamada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-132', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あげました$$),
        (1, $$あげた$$),
        (2, $$くれました$$),
        (2, $$くれた$$),
        (3, $$もらいました$$),
        (3, $$もらった$$),
        (4, $$くれました$$),
        (4, $$くれた$$),
        (5, $$あげました$$),
        (5, $$あげた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-133 — 〜てもらえませんか・〜てくれませんか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-133',
    'grammar',
    'N4',
    $$〜てもらえませんか・〜てくれませんか$$,
    $$te moraemasen ka / te kuremasen ka$$,
    $$Poderia (fazer) para mim? / Você poderia...?$$,
    $$てもらえませんか e てくれませんか são formas educadas de pedir que alguém faça algo para você. Equivalem a "poderia...?" ou "você poderia...?".

As duas usam a forma negativa com pergunta, o que deixa o pedido suave, porque dá ao outro a liberdade de recusar.

A diferença está no ponto de vista. てくれませんか foca em quem vai fazer o favor: "você não faria isso por mim?". てもらえませんか usa a forma potencial de もらう e foca em quem recebe: "eu não poderia receber de você esse favor?". Por isso, てもらえませんか costuma soar um pouco mais educado.

As versões ますか (てくれますか, てもらえますか) também são educadas, mas um pouco mais diretas.

Para superiores e situações muito formais, usa-se ていただけませんか.$$,
    $$Entre amigos, a forma casual てくれない？ é muito comum e soa natural.

Com superiores, てくれませんか pode soar um pouco direto. Prefira ていただけませんか.

Para recusar um pedido assim, os japoneses costumam dizer すみません、ちょっと… e explicar o motivo.$$,
    $$Verbo na forma て + くれませんか / くれますか
Verbo na forma て + もらえませんか / もらえますか

Do mais casual ao mais formal:
てくれる？ → てくれない？ → てくれませんか → てもらえませんか → ていただけませんか$$,
    $$てもらえませんか$$,
    $$てもらえませんか|でもらえませんか|てくれませんか|でくれませんか|てもらえますか|てくれますか|でもらえますか|でくれますか$$,
    ARRAY['て', 'もらえません', 'くれません', 'か']::text[],
    ARRAY['てもらえませんか', 'てくれませんか', 'てもらえますか', 'てくれますか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-133', $$すみません、ちょっと手伝ってもらえませんか。$$, $$すみません、ちょっとてつだってもらえませんか。$$, $$Com licença, você poderia me ajudar um pouco?$$),
    ('n4-grammar-133', $$暑いので、窓を開けてくれませんか。$$, $$あついので、まどをあけてくれませんか。$$, $$Está quente, você poderia abrir a janela?$$),
    ('n4-grammar-133', $$この荷物を少し預かってもらえませんか。$$, $$このにもつをすこしあずかってもらえませんか。$$, $$Você poderia guardar esta bagagem um pouco para mim?$$),
    ('n4-grammar-133', $$もう少し静かにしてくれませんか。$$, $$もうすこししずかにしてくれませんか。$$, $$Você poderia fazer um pouco menos de barulho?$$),
    ('n4-grammar-133', $$駅まで車で送ってもらえますか。$$, $$えきまでくるまでおくってもらえますか。$$, $$Você poderia me levar de carro até a estação?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、ペンを貸し____。$$, $$Com licença, você poderia me emprestar uma caneta?$$),
        (2, $$この字の読み方を教え____。$$, $$Você poderia me ensinar como se lê esta letra?$$),
        (3, $$トイレに行くので、ちょっとここで待っ____。$$, $$Vou ao banheiro, você poderia me esperar aqui um pouco?$$),
        (4, $$この手紙を読ん____。$$, $$Você poderia ler esta carta para mim?$$),
        (5, $$明日、少し早く来____。$$, $$Você poderia vir um pouco mais cedo amanhã?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-133', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもらえませんか$$),
        (1, $$てくれませんか$$),
        (1, $$てもらえますか$$),
        (1, $$てくれますか$$),
        (2, $$てもらえませんか$$),
        (2, $$てくれませんか$$),
        (2, $$てもらえますか$$),
        (2, $$てくれますか$$),
        (3, $$てもらえませんか$$),
        (3, $$てくれませんか$$),
        (3, $$てもらえますか$$),
        (3, $$てくれますか$$),
        (4, $$でもらえませんか$$),
        (4, $$でくれませんか$$),
        (4, $$でもらえますか$$),
        (4, $$でくれますか$$),
        (5, $$てもらえませんか$$),
        (5, $$てくれませんか$$),
        (5, $$てもらえますか$$),
        (5, $$てくれますか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-134 — お〜する・お〜いたす
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-134',
    'grammar',
    'N4',
    $$お〜する・お〜いたす$$,
    $$o ~ suru / o ~ itasu$$,
    $$Fazer (humilde) / Permita-me (fazer)$$,
    $$お〜する e お〜いたす são formas humildes (謙譲語) usadas para falar das próprias ações quando elas afetam ou beneficiam uma pessoa que merece respeito, como um cliente ou um superior.

No 謙譲語, quem fala se coloca em posição modesta, rebaixando a própria ação para mostrar respeito ao outro.

A estrutura coloca お antes do verbo na forma ます sem ます, e する ou いたす depois. Com verbos de origem chinesa do tipo "substantivo + する", usa-se ご: ご案内する, ご説明する.

いたす é mais humilde que する. Por isso, お〜いたします é a forma mais formal, muito usada no atendimento ao cliente e em e-mails de trabalho.

Essas formas só são usadas para ações de quem fala ou do seu grupo, e que envolvem a outra pessoa.$$,
    $$A frase お待ちしております ("estamos esperando pelo senhor") é muito comum em convites e lojas.

Essas formas não são usadas para ações que não envolvem a outra pessoa. Por exemplo, para "eu vou dormir", não faz sentido usar お寝します.

Alguns verbos têm formas humildes especiais, como 行く → 参る / 伺う e 言う → 申す.$$,
    $$お + Verbo na forma ます sem ます + する / します
お + Verbo na forma ます sem ます + いたす / いたします (mais humilde)
ご + Substantivo de ação + する / いたす

Exemplos: 持つ → お持ちします / 送る → お送りします / 案内する → ご案内します$$,
    $$お〜する$$,
    $$お持ちし|お持ちいた|お送りし|お送りいた|お待ちし|お待ちいた|お知らせし|お知らせいた|お手伝いし|お手伝いいた|ご案内し|ご案内いた|ご説明し|ご説明いた|ご連絡し|ご連絡いた|お届けし|お届けいた|お手伝い$$,
    ARRAY['お', 'する', 'いたす']::text[],
    ARRAY['お〜する', 'お〜します', 'お〜いたします', 'ご〜します']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-134', $$重いでしょう。お荷物をお持ちします。$$, $$おもいでしょう。おにもつをおもちします。$$, $$Deve estar pesado. Eu carrego sua bagagem.$$),
    ('n4-grammar-134', $$駅までお送りしましょうか。$$, $$えきまでおおくりしましょうか。$$, $$Quer que eu o leve até a estação?$$),
    ('n4-grammar-134', $$結果は後ほどお知らせいたします。$$, $$けっかはのちほどおしらせいたします。$$, $$Informaremos o resultado mais tarde.$$),
    ('n4-grammar-134', $$会場までご案内します。$$, $$かいじょうまでごあんないします。$$, $$Vou guiá-lo até o local.$$),
    ('n4-grammar-134', $$皆様のお越しをお待ちしております。$$, $$みなさまのおこしをおまちしております。$$, $$Aguardamos a visita de todos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$重そうですね。私が____。（持つ）$$, $$Parece pesado. Eu carrego. (carregar)$$),
        (2, $$詳しいことは私から____。（説明する）$$, $$Eu explico os detalhes. (explicar)$$),
        (3, $$後でこちらから____。（連絡する）$$, $$Mais tarde, entraremos em contato. (contatar)$$),
        (4, $$明日、資料を____。（届ける）$$, $$Amanhã, entregaremos os documentos. (entregar)$$),
        (5, $$何か____ことはありますか。（手伝う）$$, $$Há algo em que eu possa ajudar? (ajudar)$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-134', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$お持ちします$$),
        (1, $$お持ちいたします$$),
        (2, $$ご説明します$$),
        (2, $$ご説明いたします$$),
        (3, $$ご連絡します$$),
        (3, $$ご連絡いたします$$),
        (4, $$お届けします$$),
        (4, $$お届けいたします$$),
        (5, $$お手伝いする$$),
        (5, $$お手伝いできる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-135 — 〜ていただく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-135',
    'grammar',
    'N4',
    $$〜ていただく$$,
    $$te itadaku$$,
    $$Receber (o favor de) (humilde) / Ter a honra de$$,
    $$ていただく é a forma humilde de てもらう. Ela é usada quando quem fala recebe uma ação de alguém que merece respeito, como um professor, um superior ou um cliente.

いただく é a forma humilde de もらう (receber). Assim, ていただく significa "recebi de alguém respeitado o favor de...".

A pessoa que fez a ação é marcada com に. Quem fala é quem recebe, e geralmente não aparece na frase.

É muito usada para agradecer e para relatar favores recebidos em situações formais, como no trabalho e na escola.

Na forma ていただいて、ありがとうございます, ela expressa um agradecimento muito educado.$$,
    $$Para traduzir, muitas vezes é mais natural inverter a frase: 先生に直していただいた vira "o professor corrigiu para mim".

Em textos de negócios, a forma させていただく (fazer com a permissão de alguém) aparece muito, às vezes até em excesso.

Com pessoas próximas, a forma comum てもらう é suficiente.$$,
    $$Pessoa respeitada + に + Verbo na forma て + いただく

Passado: ていただいた / ていただきました
Agradecimento: 〜ていただいて、ありがとうございます
Pedido: ていただけませんか$$,
    $$ていただく$$,
    $$ていただ|でいただ$$,
    ARRAY['て', 'いただく']::text[],
    ARRAY['ていただく', 'ていただいた', 'ていただきました', 'ていただいて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-135', $$先生に作文を直していただきました。$$, $$せんせいにさくぶんをなおしていただきました。$$, $$O professor corrigiu minha redação.$$),
    ('n4-grammar-135', $$部長に駅まで送っていただいた。$$, $$ぶちょうにえきまでおくっていただいた。$$, $$O gerente me levou até a estação.$$),
    ('n4-grammar-135', $$田中先生に日本語を教えていただいています。$$, $$たなかせんせいににほんごをおしえていただいています。$$, $$O professor Tanaka está me ensinando japonês.$$),
    ('n4-grammar-135', $$お客様に、アンケートに答えていただきました。$$, $$おきゃくさまに、アンケートにこたえていただきました。$$, $$Os clientes responderam ao questionário.$$),
    ('n4-grammar-135', $$社長に褒めていただいて、うれしかったです。$$, $$しゃちょうにほめていただいて、うれしかったです。$$, $$Fiquei feliz por ter sido elogiado pelo presidente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生に推薦状を書い____。$$, $$O professor escreveu uma carta de recomendação para mim.$$),
        (2, $$課長に仕事を手伝っ____。$$, $$O chefe de seção me ajudou no trabalho.$$),
        (3, $$お忙しいところ、来____、ありがとうございます。$$, $$Obrigado por ter vindo, mesmo estando tão ocupado.$$),
        (4, $$先輩にいいレストランを教え____。$$, $$O veterano me indicou um bom restaurante.$$),
        (5, $$先生に私の作文を読ん____。$$, $$O professor leu a minha redação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-135', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていただきました$$),
        (2, $$ていただきました$$),
        (3, $$ていただいて$$),
        (4, $$ていただきました$$),
        (5, $$でいただきました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-136 — 〜てくださる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-136',
    'grammar',
    'N4',
    $$〜てくださる$$,
    $$te kudasaru$$,
    $$Fazer (algo) por mim (respeitoso)$$,
    $$てくださる é a forma respeitosa de てくれる. Ela é usada quando alguém que merece respeito, como um professor ou um superior, faz algo em benefício de quem fala.

くださる é a forma respeitosa de くれる (dar para mim). Assim, てくださる significa "alguém respeitado fez o favor de... por mim".

Quem faz a ação é o sujeito, marcado com が. Quem fala é o beneficiário.

Na forma ます, ela é irregular: em vez de くださります, diz-se くださいます. No passado, くださいました.

A forma てくださって、ありがとうございます é uma maneira muito educada de agradecer.$$,
    $$A forma てください, usada para pedidos, vem justamente de くださる no imperativo.

Comparando: 先生が教えてくださった (foco em quem fez) e 先生に教えていただいた (foco em quem recebeu) têm praticamente o mesmo sentido.

Com colegas e amigos, a forma comum てくれる é suficiente.$$,
    $$Pessoa respeitada + が + Verbo na forma て + くださる

Educado: てくださいます (forma irregular)
Passado: てくださった / てくださいました
Agradecimento: 〜てくださって、ありがとうございます$$,
    $$てくださる$$,
    $$てくださる|てくださった|てくださいました|てくださって|でくださる|でくださった|でくださいました|でくださって$$,
    ARRAY['て', 'くださる']::text[],
    ARRAY['てくださる', 'てくださいました', 'てくださった', 'てくださって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-136', $$雨の日に、先生が駅まで送ってくださいました。$$, $$あめのひに、せんせいがえきまでおくってくださいました。$$, $$Num dia de chuva, o professor me levou até a estação.$$),
    ('n4-grammar-136', $$社長がお土産を買ってくださった。$$, $$しゃちょうがおみやげをかってくださった。$$, $$O presidente comprou uma lembrancinha para nós.$$),
    ('n4-grammar-136', $$知らない方が道を教えてくださいました。$$, $$しらないかたがみちをおしえてくださいました。$$, $$Uma pessoa desconhecida me ensinou o caminho.$$),
    ('n4-grammar-136', $$いつも親切にしてくださって、ありがとうございます。$$, $$いつもしんせつにしてくださって、ありがとうございます。$$, $$Obrigado por ser sempre tão gentil comigo.$$),
    ('n4-grammar-136', $$部長が私の意見を聞いてくださった。$$, $$ぶちょうがわたしのいけんをきいてくださった。$$, $$O gerente ouviu a minha opinião.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生が私の作文を直し____。$$, $$O professor corrigiu a minha redação.$$),
        (2, $$先輩が昼ご飯をごちそうし____。$$, $$O veterano me pagou o almoço.$$),
        (3, $$お忙しいのに、手伝っ____ありがとうございます。$$, $$Obrigado por me ajudar, mesmo estando ocupado.$$),
        (4, $$部長が新しい仕事を任せ____。$$, $$O gerente me confiou um novo trabalho.$$),
        (5, $$社長が私の話を最後まで聞い____。$$, $$O presidente ouviu o que eu tinha a dizer até o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-136', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てくださいました$$),
        (1, $$てくださった$$),
        (2, $$てくださいました$$),
        (2, $$てくださった$$),
        (3, $$てくださって$$),
        (4, $$てくださいました$$),
        (4, $$てくださった$$),
        (5, $$てくださいました$$),
        (5, $$てくださった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-137 — おっしゃる・申す
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-137',
    'grammar',
    'N4',
    $$おっしゃる・申す$$,
    $$ossharu / mousu$$,
    $$Dizer (respeitoso) / Dizer (humilde) / Chamar-se$$,
    $$おっしゃる e 申す são formas especiais do verbo 言う (dizer).

おっしゃる é a forma respeitosa (尊敬語). Ela é usada quando alguém que merece respeito diz algo, como um professor, um cliente ou um superior. Também aparece na pergunta educada sobre o nome de alguém: お名前は何とおっしゃいますか.

申す é a forma humilde (謙譲語). Ela é usada para as próprias palavras, ou de alguém do seu grupo, ao falar com uma pessoa respeitada. O uso mais comum é na apresentação: 〜と申します (meu nome é...).

Na forma ます, おっしゃる é irregular: diz-se おっしゃいます, e não おっしゃります.$$,
    $$申し上げる é uma forma ainda mais humilde, usada para falar diretamente com alguém muito importante, como em お礼を申し上げます.

Na apresentação em situações formais, como entrevistas de emprego, 〜と申します é a forma padrão.

Também se usa 申す em expressões fixas, como 申し訳ありません.$$,
    $$Pessoa respeitada + が + おっしゃる (respeitoso)
お名前は何とおっしゃいますか (pergunta educada)
Eu / Meu grupo + が + 申す (humilde)
〜と申します (apresentação)

Formas: おっしゃいます / おっしゃった; 申します / 申しました / 申しております$$,
    $$おっしゃる$$,
    $$おっしゃ|申し|申す$$,
    ARRAY['おっしゃる', '申す']::text[],
    ARRAY['おっしゃる', 'おっしゃいます', 'おっしゃった', '申す', '申します']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-137', $$先生がそうおっしゃいました。$$, $$せんせいがそうおっしゃいました。$$, $$O professor disse isso.$$),
    ('n4-grammar-137', $$失礼ですが、お名前は何とおっしゃいますか。$$, $$しつれいですが、おなまえはなんとおっしゃいますか。$$, $$Com licença, qual é o seu nome?$$),
    ('n4-grammar-137', $$はじめまして。私は田中と申します。$$, $$はじめまして。わたしはたなかともうします。$$, $$Muito prazer. Meu nome é Tanaka.$$),
    ('n4-grammar-137', $$部長がおっしゃったとおりにします。$$, $$ぶちょうがおっしゃったとおりにします。$$, $$Vou fazer do jeito que o gerente disse.$$),
    ('n4-grammar-137', $$父が先生によろしくと申しておりました。$$, $$ちちがせんせいによろしくともうしておりました。$$, $$Meu pai mandou lembranças ao professor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$はじめまして。ブラジルから来たマリアと____。$$, $$Muito prazer. Meu nome é Maria e vim do Brasil.$$),
        (2, $$社長が明日休むと____。$$, $$O presidente disse que vai faltar amanhã.$$),
        (3, $$失礼ですが、お名前は何と____か。$$, $$Com licença, qual é o seu nome?$$),
        (4, $$先生が____ことを、よく覚えています。$$, $$Lembro bem do que o professor disse.$$),
        (5, $$母がよろしくと____おりました。$$, $$Minha mãe mandou lembranças.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-137', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$申します$$),
        (2, $$おっしゃいました$$),
        (2, $$おっしゃった$$),
        (3, $$おっしゃいます$$),
        (4, $$おっしゃった$$),
        (5, $$申して$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-138 — 伺う・参る
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-138',
    'grammar',
    'N4',
    $$伺う・参る$$,
    $$ukagau / mairu$$,
    $$Visitar / Perguntar / Ir / Vir (humilde)$$,
    $$伺う e 参る são formas humildes (謙譲語) usadas para as próprias ações, quando se fala com alguém que merece respeito.

伺う tem dois sentidos principais. O primeiro é "visitar" ou "ir" à casa ou ao local de alguém respeitado. O segundo é "perguntar" ou "ouvir", como em "queria perguntar uma coisa" ou "ouvi a palestra do professor".

参る é a forma humilde de 行く (ir) e 来る (vir). Ela é muito usada no trabalho e em anúncios, como avisos em estações de trem. Também aparece na apresentação: 〜から参りました ("vim de...").

A diferença é que 伺う tem uma pessoa respeitada como destino ou fonte, enquanto 参る é mais geral e soa formal e educado.$$,
    $$Nas estações, o aviso 電車がまいります ("o trem está chegando") usa 参る de forma polida, mesmo sem uma pessoa humilde envolvida.

A expressão お話を伺う significa "ouvir o que alguém tem a dizer" de forma respeitosa.

Para o "ir / vir" de outras pessoas respeitadas, usa-se いらっしゃる, e nunca 参る.$$,
    $$Lugar de alguém respeitado + に + 伺う (visitar)
Pessoa respeitada + に + 伺う (perguntar / ouvir)
Lugar + に / へ + 参る (ir / vir, humilde)

Formas: 伺います / 伺いました; 参ります / 参りました

Escrita: 伺う / うかがう, 参る / まいる$$,
    $$伺う$$,
    $$伺|うかが|参り|参る|まいり|まいる$$,
    ARRAY['伺う', '参る']::text[],
    ARRAY['伺う', '伺います', '参る', '参ります', '参りました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-138', $$明日、先生のお宅に伺います。$$, $$あした、せんせいのおたくにうかがいます。$$, $$Amanhã, vou visitar a casa do professor.$$),
    ('n4-grammar-138', $$ちょっと伺いたいことがあるのですが。$$, $$ちょっとうかがいたいことがあるのですが。$$, $$Eu gostaria de perguntar uma coisa.$$),
    ('n4-grammar-138', $$来週、御社に参ります。$$, $$らいしゅう、おんしゃにまいります。$$, $$Semana que vem, irei à sua empresa.$$),
    ('n4-grammar-138', $$まもなく電車がまいります。ご注意ください。$$, $$まもなくでんしゃがまいります。ごちゅういください。$$, $$O trem está chegando. Tenham cuidado.$$),
    ('n4-grammar-138', $$先生のお話を伺って、勉強になりました。$$, $$せんせいのおはなしをうかがって、べんきょうになりました。$$, $$Ouvir o que o professor disse foi muito instrutivo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日の午後、事務所に____。$$, $$Amanhã à tarde, irei ao escritório.$$),
        (2, $$すみません、ちょっと____たいことがあります。$$, $$Com licença, gostaria de perguntar uma coisa.$$),
        (3, $$部長、すぐ____。$$, $$Gerente, já estou indo.$$),
        (4, $$先生のお話を____、とても感動しました。$$, $$Fiquei muito emocionado ao ouvir o que o professor disse.$$),
        (5, $$はじめまして。ブラジルから____ました。$$, $$Muito prazer. Vim do Brasil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-138', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$伺います$$),
        (1, $$参ります$$),
        (2, $$伺い$$),
        (3, $$参ります$$),
        (3, $$伺います$$),
        (4, $$伺って$$),
        (5, $$参り$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-139 — 召し上がる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-139',
    'grammar',
    'N4',
    $$召し上がる$$,
    $$meshiagaru$$,
    $$Comer / Beber (respeitoso)$$,
    $$召し上がる é a forma respeitosa (尊敬語) de 食べる (comer) e 飲む (beber). Ela é usada quando alguém que merece respeito come ou bebe, como um cliente, um professor ou um superior.

É muito comum em restaurantes, lojas e ao oferecer comida para alguém. A frase どうぞ召し上がってください significa "por favor, sirva-se".

Existe também a forma お召し上がりください, que é ainda mais polida e aparece muito em embalagens de alimentos e restaurantes.

Como é respeitosa, nunca é usada para falar de si mesmo. Para a própria ação de comer de forma humilde, usa-se いただく.$$,
    $$O par respeitoso e humilde é: 召し上がる (o outro come) e いただく (eu como).

いただきます, dito antes das refeições, vem justamente da forma humilde de "receber" e "comer".

Na pergunta 何を召し上がりますか, um atendente pergunta educadamente o que o cliente vai comer ou beber.$$,
    $$Pessoa respeitada + が / は + Comida + を + 召し上がる

Educado: 召し上がります
Passado: 召し上がった / 召し上がりました
Convite: 召し上がってください / お召し上がりください

Escrita: 召し上がる / めしあがる$$,
    $$召し上がる$$,
    $$召し上が|めしあが$$,
    ARRAY['召し上がる']::text[],
    ARRAY['召し上がる', '召し上がります', '召し上がった', '召し上がってください']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-139', $$先生は何を召し上がりますか。$$, $$せんせいはなにをめしあがりますか。$$, $$O que o professor vai comer?$$),
    ('n4-grammar-139', $$どうぞ、召し上がってください。$$, $$どうぞ、めしあがってください。$$, $$Por favor, sirva-se.$$),
    ('n4-grammar-139', $$社長はもう昼ご飯を召し上がりました。$$, $$しゃちょうはもうひるごはんをめしあがりました。$$, $$O presidente já almoçou.$$),
    ('n4-grammar-139', $$冷めないうちに、お召し上がりください。$$, $$さめないうちに、おめしあがりください。$$, $$Por favor, coma antes que esfrie.$$),
    ('n4-grammar-139', $$お客様はコーヒーを召し上がりますか。$$, $$おきゃくさまはコーヒーをめしあがりますか。$$, $$O senhor vai querer café?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$温かいうちに、どうぞ____ください。$$, $$Por favor, sirva-se enquanto está quente.$$),
        (2, $$先生、お茶を____か。$$, $$Professor, aceita um chá?$$),
        (3, $$社長はケーキを二つも____。$$, $$O presidente comeu dois pedaços inteiros de bolo.$$),
        (4, $$お客様、お飲み物は何を____か。$$, $$Senhor, o que vai querer beber?$$),
        (5, $$部長は昨日、お寿司を____そうです。$$, $$Dizem que o gerente comeu sushi ontem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-139', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$召し上がって$$),
        (2, $$召し上がります$$),
        (3, $$召し上がりました$$),
        (4, $$召し上がります$$),
        (5, $$召し上がった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-140 — 〜ことにしている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-140',
    'grammar',
    'N4',
    $$〜ことにしている$$,
    $$koto ni shite iru$$,
    $$Ter como regra / Ter o hábito de (por decisão)$$,
    $$ことにしている é usado para falar de um hábito ou de uma regra pessoal que a própria pessoa decidiu seguir. Equivale a "tenho como regra" ou "tenho o costume de".

Ele vem de ことにする (decidir), na forma ている. A ideia é que a pessoa tomou uma decisão no passado e continua seguindo essa decisão até hoje.

Por exemplo, decidir acordar às seis todos os dias, não comer doces à noite ou passar os fins de semana com a família.

Com a forma ない, indica uma regra de não fazer algo: ないことにしている.

A diferença em relação a ようにしている é que ことにしている soa mais firme, como uma regra fixa. ようにしている indica um esforço para manter um hábito, mesmo que nem sempre dê certo.$$,
    $$Compare: ことにする (decisão no momento), ことにしている (regra pessoal contínua) e ことになっている (regra externa, que aparece no N3).

É muito usado ao explicar rotinas e princípios pessoais em entrevistas ou conversas.

Para hábitos que não foram decididos conscientemente, basta usar ている ou いつも.$$,
    $$Verbo na forma de dicionário + ことにしている
Verbo na forma ない + ことにしている

Educado: ことにしています$$,
    $$ことにしている$$,
    $$ことにしている|ことにしています$$,
    ARRAY['こと', 'に', 'している']::text[],
    ARRAY['ことにしている', 'ことにしています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-140', $$毎朝、六時に起きることにしています。$$, $$まいあさ、ろくじにおきることにしています。$$, $$Tenho como regra acordar às seis toda manhã.$$),
    ('n4-grammar-140', $$夜は甘い物を食べないことにしている。$$, $$よるはあまいものをたべないことにしている。$$, $$Tenho como regra não comer doces à noite.$$),
    ('n4-grammar-140', $$週末は家族と過ごすことにしています。$$, $$しゅうまつはかぞくとすごすことにしています。$$, $$Tenho o costume de passar os fins de semana com a família.$$),
    ('n4-grammar-140', $$寝る前に日記を書くことにしている。$$, $$ねるまえににっきをかくことにしている。$$, $$Tenho o hábito de escrever um diário antes de dormir.$$),
    ('n4-grammar-140', $$健康のために、エレベーターを使わないことにしています。$$, $$けんこうのために、エレベーターをつかわないことにしています。$$, $$Pela saúde, tenho como regra não usar o elevador.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日、日本語のニュースを聞く____。$$, $$Tenho como regra ouvir notícias em japonês todos os dias.$$),
        (2, $$お酒は週末だけ飲む____。$$, $$Tenho como regra beber só nos fins de semana.$$),
        (3, $$仕事のメールは夜は見ない____。$$, $$Tenho como regra não olhar e-mails de trabalho à noite.$$),
        (4, $$月に一度、両親に電話する____。$$, $$Tenho o costume de ligar para os meus pais uma vez por mês.$$),
        (5, $$一か月に一冊、本を読む____。$$, $$Tenho como regra ler um livro por mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-140', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことにしています$$),
        (1, $$ことにしている$$),
        (2, $$ことにしています$$),
        (2, $$ことにしている$$),
        (3, $$ことにしています$$),
        (3, $$ことにしている$$),
        (4, $$ことにしています$$),
        (4, $$ことにしている$$),
        (5, $$ことにしています$$),
        (5, $$ことにしている$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-141 — 〜ようにしている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-141',
    'grammar',
    'N4',
    $$〜ようにしている$$,
    $$you ni shite iru$$,
    $$Procurar sempre / Esforçar-se para (manter um hábito)$$,
    $$ようにしている é usado para falar de um hábito que a pessoa se esforça para manter. Equivale a "procuro sempre..." ou "me esforço para...".

Ele vem de ようにする (esforçar-se para que algo aconteça), na forma ている. A ideia é um esforço contínuo, que faz parte da rotina, mas que nem sempre é perfeito.

Por exemplo, procurar beber bastante água, procurar dormir cedo ou procurar não comer doces demais.

Comparado a ことにしている, ようにしている soa mais flexível. ことにしている é uma regra fixa; ようにしている é um esforço, uma tentativa constante.

É muito usado ao falar de saúde, estudos e boas práticas do dia a dia.$$,
    $$Expressões como できるだけ e なるべく ("sempre que possível") combinam muito bem com ようにしている.

Para conselhos a outras pessoas, a forma ようにしてください é a mais natural.

ようにしている descreve o seu esforço; ようになった descreve uma mudança que já aconteceu.$$,
    $$Verbo na forma de dicionário + ようにしている
Verbo na forma ない + ようにしている

Educado: ようにしています$$,
    $$ようにしている$$,
    $$ようにしている|ようにしています$$,
    ARRAY['よう', 'に', 'している']::text[],
    ARRAY['ようにしている', 'ようにしています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-141', $$毎日水をたくさん飲むようにしています。$$, $$まいにちみずをたくさんのむようにしています。$$, $$Procuro beber bastante água todos os dias.$$),
    ('n4-grammar-141', $$できるだけ早く寝るようにしている。$$, $$できるだけはやくねるようにしている。$$, $$Procuro dormir o mais cedo possível.$$),
    ('n4-grammar-141', $$甘い物を食べすぎないようにしています。$$, $$あまいものをたべすぎないようにしています。$$, $$Procuro não comer doces demais.$$),
    ('n4-grammar-141', $$毎日少しでも日本語を話すようにしている。$$, $$まいにちすこしでもにほんごをはなすようにしている。$$, $$Procuro falar pelo menos um pouco de japonês todo dia.$$),
    ('n4-grammar-141', $$人の話を最後まで聞くようにしています。$$, $$ひとのはなしをさいごまできくようにしています。$$, $$Procuro sempre ouvir as pessoas até o fim.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎朝、野菜ジュースを飲む____。$$, $$Procuro tomar suco de verduras toda manhã.$$),
        (2, $$駅まではなるべく歩く____。$$, $$Procuro ir a pé até a estação sempre que possível.$$),
        (3, $$夜遅く食べない____。$$, $$Procuro não comer tarde da noite.$$),
        (4, $$授業の前に予習する____。$$, $$Procuro estudar a matéria antes da aula.$$),
        (5, $$会議では、必ず意見を言う____。$$, $$Nas reuniões, faço questão de sempre dar minha opinião.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-141', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようにしています$$),
        (1, $$ようにしている$$),
        (2, $$ようにしています$$),
        (2, $$ようにしている$$),
        (3, $$ようにしています$$),
        (3, $$ようにしている$$),
        (4, $$ようにしています$$),
        (4, $$ようにしている$$),
        (5, $$ようにしています$$),
        (5, $$ようにしている$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-142 — 〜ように言う・〜ように頼む
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-142',
    'grammar',
    'N4',
    $$〜ように言う・〜ように頼む$$,
    $$you ni iu / you ni tanomu$$,
    $$Dizer para (fazer) / Pedir para (fazer)$$,
    $$ように言う e ように頼む são usados para relatar ordens, conselhos ou pedidos feitos a alguém de forma indireta. Equivalem a "dizer para fazer" e "pedir para fazer".

O conteúdo do pedido vem antes de ように, com o verbo na forma de dicionário ou na forma ない. A pessoa que recebe o pedido é marcada com に.

Além de 言う e 頼む, a mesma estrutura funciona com verbos como 注意する (avisar, chamar a atenção), 伝える (transmitir) e お願いする (pedir educadamente).

Na forma passiva, ように言われる significa "me disseram para..." e é muito usada para contar o que alguém pediu ou mandou você fazer.

Essa estrutura é uma forma de citação indireta: ela transmite o sentido do pedido, sem repetir as palavras exatas.$$,
    $$Para citar as palavras exatas, usa-se 「〜てください」と言う. Com ように, a citação fica indireta e mais natural na narração.

Com ない, a estrutura indica um aviso ou proibição: 遅れないように言われた (me disseram para não me atrasar).

伝えてください é muito útil para deixar recados, como pedir que avisem alguém.$$,
    $$Pessoa + に + Verbo (dicionário / ない) + ように + 言う / 頼む / 注意する / 伝える
Pessoa + に + Verbo + ように + 言われる (passiva: me disseram para...)$$,
    $$ように言う$$,
    $$ように言|ようにいい|ようにいう|ように頼|ようにたの|ように注意|ように伝え$$,
    ARRAY['ように', '言う', '頼む']::text[],
    ARRAY['ように言う', 'ように頼む', 'ように言われる', 'ように注意する', 'ように伝える']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-142', $$先生は学生に静かにするように言いました。$$, $$せんせいはがくせいにしずかにするようにいいました。$$, $$O professor disse aos alunos para ficarem em silêncio.$$),
    ('n4-grammar-142', $$母に早く寝るように言われた。$$, $$ははにはやくねるようにいわれた。$$, $$Minha mãe me disse para dormir cedo.$$),
    ('n4-grammar-142', $$友達に引っ越しを手伝ってくれるように頼みました。$$, $$ともだちにひっこしをてつだってくれるようにたのみました。$$, $$Pedi a um amigo para me ajudar na mudança.$$),
    ('n4-grammar-142', $$医者にお酒を飲まないように注意されました。$$, $$いしゃにおさけをのまないようにちゅういされました。$$, $$O médico me avisou para não beber álcool.$$),
    ('n4-grammar-142', $$田中さんに後で電話するように伝えてください。$$, $$たなかさんにあとででんわするようにつたえてください。$$, $$Diga ao Tanaka para me ligar mais tarde, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$部長は私に資料を準備する____。$$, $$O gerente me disse para preparar os documentos.$$),
        (2, $$母に部屋を片付ける____。$$, $$Minha mãe me disse para arrumar o quarto.$$),
        (3, $$隣の人に音楽を小さくする____。$$, $$Pedi ao vizinho para abaixar a música.$$),
        (4, $$先生に遅刻しない____。$$, $$O professor me avisou para não chegar atrasado.$$),
        (5, $$山田さんに明日来る____ください。$$, $$Diga ao Yamada para vir amanhã, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-142', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ように言いました$$),
        (1, $$ように言った$$),
        (2, $$ように言われました$$),
        (2, $$ように言われた$$),
        (3, $$ように頼みました$$),
        (3, $$ように頼んだ$$),
        (4, $$ように注意されました$$),
        (4, $$ように注意された$$),
        (4, $$ように言われました$$),
        (4, $$ように言われた$$),
        (5, $$ように伝えて$$),
        (5, $$ように言って$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-143 — 命令形
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-143',
    'grammar',
    'N4',
    $$命令形$$,
    $$meireikei$$,
    $$Imperativo / Faça! (ordem direta)$$,
    $$命令形 é a forma imperativa dos verbos. Ela expressa uma ordem direta e forte, como "faça!", "vá!", "pare!".

Por ser muito direta, essa forma soa rude em conversas comuns. Ela aparece em situações específicas: emergências, esportes e torcidas, ordens de superiores para subordinados em contextos rígidos, placas de trânsito, falas masculinas muito informais, citações e personagens de mangá e anime.

Um uso positivo e comum é na torcida, como 頑張れ! ("vamos lá!", "força!").

A formação depende do grupo do verbo. No grupo 1, o último som muda de "u" para "e". No grupo 2, troca-se る por ろ. Os irregulares ficam しろ (de する) e 来い (こい, de 来る).$$,
    $$Para ordens mais suaves, usa-se なさい (pais e professores) ou てください (educado).

Em placas de trânsito, 止まれ ("pare") é um exemplo famoso de imperativo.

Mulheres e pessoas em situações educadas raramente usam o imperativo na fala do dia a dia, exceto em citações ou torcidas.$$,
    $$Grupo 1: último som "u" → "e" (行く → 行け / 待つ → 待て / 頑張る → 頑張れ)
Grupo 2: troque る por ろ (食べる → 食べろ / 起きる → 起きろ)
Irregulares: する → しろ (escrito: せよ) / 来る → 来い (こい)$$,
    $$命令形$$,
    $$ろ！|ろ。|け！|け。|れ！|れ。|め！|め。|げ！|げ。|せ！|せ。|べ！|べ。|て！|て。|い！|い。$$,
    ARRAY['え', 'ろ']::text[],
    ARRAY['け', 'れ', 'め', 'ろ', 'しろ', '来い']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-143', $$もう八時だぞ。早く起きろ！$$, $$もうはちじだぞ。はやくおきろ！$$, $$Já são oito horas! Levanta logo!$$),
    ('n4-grammar-143', $$あと少しだ。頑張れ！$$, $$あとすこしだ。がんばれ！$$, $$Falta pouco. Força!$$),
    ('n4-grammar-143', $$交差点の前に、止まれ。$$, $$こうさてんのまえに、とまれ。$$, $$Pare antes do cruzamento.$$),
    ('n4-grammar-143', $$危ないから、ここへ来い！$$, $$あぶないから、ここへこい！$$, $$É perigoso, venha para cá!$$),
    ('n4-grammar-143', $$「火事だ！逃げろ！」と彼は叫んだ。$$, $$「かじだ！にげろ！」とかれはさけんだ。$$, $$"É fogo! Corram!", ele gritou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅れるぞ。もっと速く走____！$$, $$Vamos nos atrasar! Corra mais rápido!$$),
        (2, $$うるさい。静かにし____！$$, $$Que barulho! Fique quieto!$$),
        (3, $$危ない！逃げ____！$$, $$Perigo! Fuja!$$),
        (4, $$時間がない。早く来____！$$, $$Não temos tempo. Venha logo!$$),
        (5, $$最後まで頑張____！$$, $$Força até o fim!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-143', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$れ$$),
        (2, $$ろ$$),
        (3, $$ろ$$),
        (4, $$い$$),
        (5, $$れ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-144 — 疑問詞＋か
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-144',
    'grammar',
    'N4',
    $$疑問詞＋か$$,
    $$gimonshi + ka$$,
    $$Algo / Alguém / Algum lugar / Algum dia$$,
    $$Quando uma palavra interrogativa recebe か, ela deixa de ser uma pergunta e passa a indicar algo indefinido. Equivale a "algo", "alguém", "algum lugar", "algum dia".

• 何か: alguma coisa, algo.
• 誰か: alguém.
• どこか: algum lugar.
• いつか: algum dia, alguma hora.
• どれか: algum (entre várias opções).

Essas formas aparecem em frases afirmativas, perguntas e convites. Por exemplo, "quer beber alguma coisa?" ou "algum dia quero morar no Japão".

As partículas が e を costumam ser omitidas depois dessas palavras. Outras partículas, como へ, に e で, ficam depois de か: どこかへ, 誰かに.$$,
    $$Compare: 何か (algo) e 何も〜ない (nada). Com か, a ideia é indefinida; com も e negativo, é negação total.

Em perguntas, 何か食べましたか significa "você comeu alguma coisa?", e a resposta pode ser はい ou いいえ, diferente de 何を食べましたか, que pede o que foi comido.

いつか costuma expressar um desejo ou plano vago para o futuro.$$,
    $$何か / 誰か / どこか / いつか / どれか + Verbo
どこか + へ / に / で + Verbo
誰か + に / と + Verbo$$,
    $$何か$$,
    $$何か|誰か|どこか|いつか|どれか|なにか|だれか$$,
    ARRAY['何', 'か']::text[],
    ARRAY['何か', '誰か', 'どこか', 'いつか', 'どれか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-144', $$のどが渇きましたね。何か飲みませんか。$$, $$のどがかわきましたね。なにかのみませんか。$$, $$Que sede, né? Quer beber alguma coisa?$$),
    ('n4-grammar-144', $$私がいない間に、誰か来ましたか。$$, $$わたしがいないあいだに、だれかきましたか。$$, $$Veio alguém enquanto eu não estava?$$),
    ('n4-grammar-144', $$週末、どこかへ行きたいです。$$, $$しゅうまつ、どこかへいきたいです。$$, $$No fim de semana, quero ir a algum lugar.$$),
    ('n4-grammar-144', $$いつか日本に住みたい。$$, $$いつかにほんにすみたい。$$, $$Algum dia, quero morar no Japão.$$),
    ('n4-grammar-144', $$この中からどれか一つ選んでください。$$, $$このなかからどれかひとつえらんでください。$$, $$Escolha uma destas opções, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お腹がすいた。____食べたい。$$, $$Estou com fome. Quero comer alguma coisa.$$),
        (2, $$暑いですね。____窓を開けてくれませんか。$$, $$Está quente, né? Alguém poderia abrir a janela?$$),
        (3, $$夏休みは____へ旅行に行きますか。$$, $$Nas férias de verão, você vai viajar para algum lugar?$$),
        (4, $$____また会いましょう。$$, $$Vamos nos ver de novo algum dia.$$),
        (5, $$赤と青と白の中から、____を選んでください。$$, $$Escolha uma entre a vermelha, a azul e a branca.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-144', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$何か$$),
        (1, $$なにか$$),
        (2, $$誰か$$),
        (2, $$だれか$$),
        (3, $$どこか$$),
        (4, $$いつか$$),
        (5, $$どれか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-145 — 疑問詞＋も〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-145',
    'grammar',
    'N4',
    $$疑問詞＋も〜ない$$,
    $$gimonshi + mo ~ nai$$,
    $$Nada / Ninguém / Nenhum lugar / Nenhum$$,
    $$Quando uma palavra interrogativa recebe も e o verbo fica na forma negativa, a frase expressa uma negação total. Equivale a "nada", "ninguém", "nenhum lugar" ou "nenhum".

• 何も〜ない: nada.
• 誰も〜ない: ninguém.
• どこにも / どこへも〜ない: nenhum lugar.
• どれも〜ない: nenhum (entre várias opções).

O verbo precisa estar sempre na forma negativa. Por exemplo, "não comi nada", "não tem ninguém", "não fui a lugar nenhum".

Com partículas como に, へ e と, elas ficam entre a palavra interrogativa e も: 誰にも, どこにも, 誰とも.

Isso é diferente de 疑問詞+か, que indica algo indefinido em frases afirmativas ("algo", "alguém").$$,
    $$いつも não segue esse padrão: いつも significa "sempre", e não "nunca". Para "nunca", usa-se 一度も〜ない ou 決して〜ない.

Em frases afirmativas, どれも e 誰も também podem significar "todos", como em どれもおいしい (todos são gostosos).

A resposta curta 何も significa "nada", e é muito comum em conversas.$$,
    $$何も + Verbo negativo (nada)
誰も + Verbo negativo (ninguém)
どこにも / どこへも + Verbo negativo (nenhum lugar)
どれも + Adjetivo / Verbo negativo (nenhum)
誰にも / 誰とも + Verbo negativo$$,
    $$何も$$,
    $$何も|誰も|どこにも|どこへも|どこも|どれも|なにも|だれも|一度も|誰にも|誰とも|だれにも$$,
    ARRAY['何', 'も', 'ない']::text[],
    ARRAY['何も', '誰も', 'どこにも', 'どこへも', 'どれも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-145', $$今日は忙しくて、何も食べていません。$$, $$きょうはいそがしくて、なにもたべていません。$$, $$Hoje estive ocupado e não comi nada.$$),
    ('n4-grammar-145', $$教室には誰もいない。$$, $$きょうしつにはだれもいない。$$, $$Não tem ninguém na sala de aula.$$),
    ('n4-grammar-145', $$週末はどこにも行きませんでした。$$, $$しゅうまつはどこにもいきませんでした。$$, $$No fim de semana, não fui a lugar nenhum.$$),
    ('n4-grammar-145', $$この中のどれも好きじゃない。$$, $$このなかのどれもすきじゃない。$$, $$Não gosto de nenhum destes.$$),
    ('n4-grammar-145', $$彼のことは誰にも言わないで。$$, $$かれのことはだれにもいわないで。$$, $$Não conte para ninguém sobre ele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冷蔵庫に____ありません。$$, $$Não tem nada na geladeira.$$),
        (2, $$この部屋には____いません。$$, $$Não tem ninguém neste quarto.$$),
        (3, $$昨日は____行かないで、家にいました。$$, $$Ontem não fui a lugar nenhum e fiquei em casa.$$),
        (4, $$彼は____言わないで帰った。$$, $$Ele foi embora sem dizer nada.$$),
        (5, $$この店の料理は、____おいしくない。$$, $$Nenhum prato deste restaurante é gostoso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-145', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$何も$$),
        (1, $$なにも$$),
        (2, $$誰も$$),
        (2, $$だれも$$),
        (3, $$どこにも$$),
        (3, $$どこへも$$),
        (4, $$何も$$),
        (4, $$なにも$$),
        (5, $$どれも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
