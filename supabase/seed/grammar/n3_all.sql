-- n3-grammar-01 — 〜上げる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-01',
    'grammar',
    'N3',
    $$〜上げる$$,
    $$ageru$$,
    $$Terminar de (por completo) / Concluir / Finalizar$$,
    $$上げる, ligado a outro verbo, indica que uma ação foi concluída por completo, com cuidado ou esforço, até chegar a um resultado final. Equivale a "terminar de" ou "concluir".

A estrutura junta o verbo na forma ます sem ます com 上げる. O resultado funciona como um verbo do grupo 2.

A ideia é de algo que foi construído ou produzido até ficar pronto: escrever um relatório inteiro, terminar de tricotar um suéter, construir uma equipe. Por isso, aparece muito com verbos de criação, como 書く, 作る, 編む e 仕上げる.

Comparado a 終わる, que só indica que a ação terminou, 上げる destaca o esforço e a qualidade do resultado final.$$,
    $$Alguns verbos com 上げる têm outros sentidos, por causa da ideia original de "levantar". 読み上げる significa "ler em voz alta", e 持ち上げる significa "levantar algo".

仕上げる já é uma palavra própria e significa "dar o acabamento final".

Em contextos de trabalho, 書き上げる e 仕上げる são muito usados para falar da conclusão de documentos e projetos.$$,
    $$Verbo na forma ます sem ます + 上げる

Passado: 上げた / 上げました
Forma て: 上げて

Combinações comuns: 書き上げる / 作り上げる / 仕上げる / 編み上げる / 育て上げる$$,
    $$上げる$$,
    $$上げ$$,
    ARRAY['上げる']::text[],
    ARRAY['上げる', '上げた', '上げました', '上げて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-01', $$徹夜して、やっとレポートを書き上げた。$$, $$てつやして、やっとレポートをかきあげた。$$, $$Virei a noite e finalmente terminei de escrever o relatório.$$),
    ('n3-grammar-01', $$三日でこの絵を仕上げました。$$, $$みっかでこのえをしあげました。$$, $$Finalizei este quadro em três dias.$$),
    ('n3-grammar-01', $$彼女は一人でこのセーターを編み上げた。$$, $$かのじょはひとりでこのセーターをあみあげた。$$, $$Ela tricotou este suéter inteiro sozinha.$$),
    ('n3-grammar-01', $$一年かけて、この家を作り上げました。$$, $$いちねんかけて、このいえをつくりあげました。$$, $$Levamos um ano para construir esta casa por completo.$$),
    ('n3-grammar-01', $$みんなで力を合わせて、いいチームを作り上げた。$$, $$みんなでちからをあわせて、いいチームをつくりあげた。$$, $$Todos juntaram forças e construíram uma ótima equipe.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$徹夜して、卒業論文を書き____。$$, $$Virei a noite e terminei de escrever o TCC.$$),
        (2, $$料理人は三時間かけてスープを作り____。$$, $$O cozinheiro levou três horas para preparar a sopa por completo.$$),
        (3, $$祖母は一週間でマフラーを編み____。$$, $$Minha avó terminou de tricotar o cachecol em uma semana.$$),
        (4, $$締め切りまでに作品を仕____ください。$$, $$Finalize a obra até o prazo, por favor.$$),
        (5, $$父は長い時間をかけて、この会社を築き____。$$, $$Meu pai levou muito tempo para construir esta empresa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-01', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$上げた$$),
        (1, $$上げました$$),
        (2, $$上げた$$),
        (2, $$上げました$$),
        (3, $$上げた$$),
        (3, $$上げました$$),
        (4, $$上げて$$),
        (5, $$上げた$$),
        (5, $$上げました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-02 — 〜あまり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-02',
    'grammar',
    'N3',
    $$〜あまり$$,
    $$amari$$,
    $$Tanto que / De tanto / Por excesso de$$,
    $$No N3, あまり aparece com o sentido de "por excesso de", indicando que um sentimento ou estado foi tão forte que causou um resultado, geralmente inesperado ou negativo. Equivale a "tanto que", "de tanto" ou "por excesso de".

Ele vem depois de substantivos com の (como 心配のあまり, "de tanta preocupação") e depois de verbos na forma simples (como 緊張したあまり).

Também existe a forma あまりの + Substantivo + に, que significa "com tanto... que". Por exemplo, "com tanto calor, passei mal".

Os substantivos usados costumam ser sentimentos ou estados, como alegria, preocupação, tristeza, surpresa, nervosismo e cansaço.

O resultado, na segunda parte, é algo que a pessoa não conseguiu controlar, como chorar, não conseguir dormir ou não conseguir falar.$$,
    $$Esse uso é bem diferente de あまり〜ない (não muito), aprendido no N4. Aqui, あまり indica excesso.

A segunda parte não costuma ser uma ação planejada, mas uma reação involuntária.

Muitos substantivos usados aqui terminam em さ, como 嬉しさ, 悲しさ e 暑さ.$$,
    $$Substantivo + の + あまり、 + Resultado
Verbo (forma simples) + あまり、 + Resultado
あまりの + Substantivo + に、 + Resultado$$,
    $$あまり$$,
    $$あまり$$,
    ARRAY['あまり']::text[],
    ARRAY['あまり', 'のあまり', 'あまりの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-02', $$合格の知らせを聞いて、嬉しさのあまり、泣いてしまった。$$, $$ごうかくのしらせをきいて、うれしさのあまり、ないてしまった。$$, $$Ao saber da aprovação, chorei de tanta alegria.$$),
    ('n3-grammar-02', $$母は心配のあまり、夜も眠れなかった。$$, $$はははしんぱいのあまり、よるもねむれなかった。$$, $$De tanta preocupação, minha mãe não conseguiu dormir à noite.$$),
    ('n3-grammar-02', $$面接で緊張したあまり、何も話せなかった。$$, $$めんせつできんちょうしたあまり、なにもはなせなかった。$$, $$Fiquei tão nervoso na entrevista que não consegui falar nada.$$),
    ('n3-grammar-02', $$あまりの暑さに、気分が悪くなった。$$, $$あまりのあつさに、きぶんがわるくなった。$$, $$Com tanto calor, passei mal.$$),
    ('n3-grammar-02', $$彼は仕事に熱中するあまり、食事を忘れてしまった。$$, $$かれはしごとにねっちゅうするあまり、しょくじをわすれてしまった。$$, $$Ele estava tão concentrado no trabalho que se esqueceu de comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$驚きの____、声が出なかった。$$, $$De tanto susto, não consegui falar.$$),
        (2, $$疲れの____、電車で寝てしまった。$$, $$De tanto cansaço, acabei dormindo no trem.$$),
        (3, $$____の痛さに、思わず叫んだ。$$, $$Com tanta dor, gritei sem querer.$$),
        (4, $$合格を喜ぶ____、彼は飛び上がった。$$, $$De tanta alegria pela aprovação, ele pulou.$$),
        (5, $$恥ずかしさの____、顔が真っ赤になった。$$, $$De tanta vergonha, fiquei com o rosto vermelho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-02', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あまり$$),
        (2, $$あまり$$),
        (3, $$あまり$$),
        (4, $$あまり$$),
        (5, $$あまり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-03 — あまりにも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-03',
    'grammar',
    'N3',
    $$あまりにも$$,
    $$amari ni mo$$,
    $$Demais / Excessivamente / Tão... que$$,
    $$あまりにも é um advérbio que indica que algo está além do normal, em um grau excessivo. Equivale a "demais", "excessivamente" ou "tão... que".

Ele vem antes de adjetivos e de outras expressões de grau, intensificando-as muito. Muitas vezes, a frase continua mostrando a consequência desse excesso, como não conseguir comprar algo caro demais.

O tom costuma ser de surpresa, crítica ou espanto, mas também pode expressar admiração, como uma paisagem tão bonita que deixa a pessoa sem palavras.

A forma あまりに, sem も, tem o mesmo sentido e é um pouco menos enfática.$$,
    $$あまりにも é mais forte que とても. とても é neutro ("muito"); あまりにも indica que passou do ponto.

Também pode aparecer com verbos que indicam grau, como あまりにも違う (é diferente demais).

Na fala, あまりにも pode soar dramático, por isso aparece muito em reclamações e reações de surpresa.$$,
    $$あまりにも + Adjetivo
あまりにも + Adjetivo + て、 + Consequência
あまりにも + Substantivo / Adjetivo な + だ

Variação: あまりに$$,
    $$あまりにも$$,
    $$あまりにも|あまりに$$,
    ARRAY['あまりにも']::text[],
    ARRAY['あまりにも', 'あまりに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-03', $$この問題はあまりにも難しい。$$, $$このもんだいはあまりにもむずかしい。$$, $$Esta questão é difícil demais.$$),
    ('n3-grammar-03', $$値段があまりにも高くて、買えなかった。$$, $$ねだんがあまりにもたかくて、かえなかった。$$, $$O preço era alto demais, e não consegui comprar.$$),
    ('n3-grammar-03', $$あまりにも疲れていて、すぐ寝てしまった。$$, $$あまりにもつかれていて、すぐねてしまった。$$, $$Estava tão cansado que dormi na hora.$$),
    ('n3-grammar-03', $$彼の話はあまりにもおかしくて、みんな笑った。$$, $$かれのはなしはあまりにもおかしくて、みんなわらった。$$, $$A história dele era tão engraçada que todos riram.$$),
    ('n3-grammar-03', $$その知らせはあまりにも突然だった。$$, $$そのしらせはあまりにもとつぜんだった。$$, $$Essa notícia foi repentina demais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日は____暑くて、外に出たくない。$$, $$Hoje está quente demais, não quero sair.$$),
        (2, $$宿題が____多くて、終わらない。$$, $$A lição é tanta que não termina.$$),
        (3, $$山の上の景色が____きれいで、言葉が出なかった。$$, $$A paisagem no alto da montanha era tão bonita que fiquei sem palavras.$$),
        (4, $$客に対する彼の態度は____失礼だ。$$, $$A atitude dele com os clientes é mal-educada demais.$$),
        (5, $$その映画が____悲しくて、泣いてしまった。$$, $$Esse filme era tão triste que acabei chorando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-03', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あまりにも$$),
        (1, $$あまりに$$),
        (2, $$あまりにも$$),
        (2, $$あまりに$$),
        (3, $$あまりにも$$),
        (3, $$あまりに$$),
        (4, $$あまりにも$$),
        (4, $$あまりに$$),
        (5, $$あまりにも$$),
        (5, $$あまりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-04 — 〜合う
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-04',
    'grammar',
    'N3',
    $$〜合う$$,
    $$au$$,
    $$Um ao outro / Mutuamente / Juntos$$,
    $$合う, ligado a outro verbo, indica que duas ou mais pessoas fazem a mesma ação uma com a outra, de forma recíproca. Equivale a "um ao outro", "mutuamente" ou "entre si".

A estrutura junta o verbo na forma ます sem ます com 合う. O resultado funciona como um verbo do grupo 1.

Por exemplo, ajudar-se mutuamente, conversar entre si, trocar opiniões, abraçar-se.

É muito comum com verbos de comunicação e cooperação, como 話す, 助ける, 教える, 協力する e 出す (no sentido de apresentar ideias).

Para reforçar a ideia de reciprocidade, também se usa お互いに (um ao outro) antes do verbo.$$,
    $$話し合う significa "discutir" ou "conversar para chegar a um acordo", e virou uma palavra muito usada sozinha.

Sozinho, 合う significa "combinar", "servir" ou "estar certo", como em サイズが合う (o tamanho serve).

A ideia de cooperação de 合う reflete um valor importante na cultura japonesa: resolver as coisas em grupo.$$,
    $$Verbo na forma ます sem ます + 合う

Educado: 合います
Passado: 合った / 合いました
Forma て: 合って

Combinações comuns: 話し合う / 助け合う / 教え合う / 出し合う / 愛し合う$$,
    $$合う$$,
    $$合い|合う|合っ|合わ$$,
    ARRAY['合う']::text[],
    ARRAY['合う', '合います', '合った', '合いました', '合って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-04', $$あの二人は助け合って生活している。$$, $$あのふたりはたすけあってせいかつしている。$$, $$Aqueles dois vivem se ajudando.$$),
    ('n3-grammar-04', $$会議で、みんなで意見を出し合いました。$$, $$かいぎで、みんなでいけんをだしあいました。$$, $$Na reunião, todos trocaram opiniões.$$),
    ('n3-grammar-04', $$私たちは毎日メールで連絡し合っている。$$, $$わたしたちはまいにちメールでれんらくしあっている。$$, $$Nós nos falamos por e-mail todos os dias.$$),
    ('n3-grammar-04', $$困ったときは、話し合うことが大切だ。$$, $$こまったときは、はなしあうことがたいせつだ。$$, $$Quando há problemas, é importante conversar.$$),
    ('n3-grammar-04', $$久しぶりに会った二人は、抱き合って喜んだ。$$, $$ひさしぶりにあったふたりは、だきあってよろこんだ。$$, $$Os dois, que não se viam havia muito tempo, se abraçaram de alegria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$旅行の計画について、家族で話し____。$$, $$Conversamos em família sobre o plano da viagem.$$),
        (2, $$兄弟は助け____ことが大切です。$$, $$É importante que irmãos se ajudem.$$),
        (3, $$二人はお互いに愛し____いる。$$, $$Os dois se amam.$$),
        (4, $$試合の後、両チームの選手たちは握手し____。$$, $$Depois da partida, os jogadores das duas equipes apertaram as mãos.$$),
        (5, $$みんなで協力し____、仕事を終わらせた。$$, $$Todos cooperaram entre si e terminaram o trabalho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-04', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$合いました$$),
        (1, $$合った$$),
        (2, $$合う$$),
        (3, $$合って$$),
        (4, $$合った$$),
        (4, $$合いました$$),
        (5, $$合って$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-05 — 〜ばいい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-05',
    'grammar',
    'N3',
    $$〜ばいい$$,
    $$ba ii$$,
    $$Basta / É só / O que devo...?$$,
    $$ばいい é usado para dar conselhos, sugerir soluções ou pedir orientação. Equivale a "basta", "é só" ou, em perguntas, "o que devo...?".

Ele junta a forma condicional ば com いい. A ideia literal é "se fizer isso, está bom".

Em afirmações, ばいい sugere uma solução simples: "se não entender, é só perguntar ao professor".

Em perguntas, com palavras como どう, 何 e どこ, ele pede orientação: "o que devo fazer?". Por exemplo, どうすればいいですか é uma das perguntas mais úteis em japonês.

Com なあ ou のに no final, ばいい expressa um desejo: "seria bom se...", "tomara que...".$$,
    $$ばいい e たらいい têm sentidos muito parecidos e muitas vezes podem ser trocados. ばいい soa um pouco mais neutro e geral.

Em conselhos, ばいい pode soar um pouco frio se dito a superiores, como se a solução fosse óbvia. Com eles, ほうがいいと思います é mais suave.

ばいいのに também aparece para criticar levemente alguém que não faz algo óbvio.$$,
    $$Verbo na forma condicional ば + いい
Palavra interrogativa + … + Verbo ば + いいですか (pedido de orientação)
Verbo ば + いいか + わからない
Verbo ば + いいなあ / いいのに (desejo)$$,
    $$ばいい$$,
    $$ばいい$$,
    ARRAY['ば', 'いい']::text[],
    ARRAY['ばいい', 'ばいいです', 'ばいいですか', 'ばいいのに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-05', $$わからなければ、先生に聞けばいい。$$, $$わからなければ、せんせいにきけばいい。$$, $$Se não entender, é só perguntar ao professor.$$),
    ('n3-grammar-05', $$すみません、どうすればいいですか。$$, $$すみません、どうすればいいですか。$$, $$Com licença, o que devo fazer?$$),
    ('n3-grammar-05', $$駅までは、このバスに乗ればいいですよ。$$, $$えきまでは、このバスにのればいいですよ。$$, $$Para ir até a estação, basta pegar este ônibus.$$),
    ('n3-grammar-05', $$明日、晴れればいいなあ。$$, $$あした、はれればいいなあ。$$, $$Tomara que faça sol amanhã.$$),
    ('n3-grammar-05', $$旅行に何を持っていけばいいかわからない。$$, $$りょこうになにをもっていけばいいかわからない。$$, $$Não sei o que devo levar na viagem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$疲れたなら、少し休め____。$$, $$Se está cansado, é só descansar um pouco.$$),
        (2, $$この書類はどこに出せ____ですか。$$, $$Onde devo entregar este documento?$$),
        (3, $$誰に相談すれ____かわからない。$$, $$Não sei com quem devo conversar.$$),
        (4, $$彼女が早く元気になれ____なあ。$$, $$Tomara que ela melhore logo.$$),
        (5, $$時間がないなら、タクシーで行け____。$$, $$Se não tem tempo, é só ir de táxi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-05', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばいい$$),
        (1, $$ばいいです$$),
        (2, $$ばいい$$),
        (3, $$ばいい$$),
        (4, $$ばいい$$),
        (5, $$ばいい$$),
        (5, $$ばいいです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-06 — 〜ばよかった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-06',
    'grammar',
    'N3',
    $$〜ばよかった$$,
    $$ba yokatta$$,
    $$Devia ter / Teria sido bom / Quem dera$$,
    $$ばよかった é usado para expressar arrependimento por algo que a pessoa fez ou deixou de fazer no passado. Equivale a "devia ter feito" ou "teria sido bom se...".

Ele junta a forma condicional ば com よかった, o passado de いい. A ideia literal é "se eu tivesse feito isso, teria sido bom".

Com o verbo afirmativo, indica arrependimento por não ter feito algo: "devia ter estudado mais". Com o verbo negativo (なければよかった), indica arrependimento por ter feito algo: "não devia ter dito aquilo".

Com のに no final, ばよかったのに expressa pena ou leve crítica sobre a ação de outra pessoa, como "você devia ter vindo, foi divertido".$$,
    $$たらよかった tem o mesmo sentido e também é muito usado na conversa.

O oposto, para expressar alívio, é てよかった (que bom que fiz).

ばよかった aparece muito em reflexões e conversas sobre erros, e é uma forma natural de mostrar arrependimento.$$,
    $$Verbo na forma condicional ば + よかった (devia ter feito)
Verbo na forma ない → なければよかった (não devia ter feito)
Verbo ば + よかったのに (pena / crítica a outra pessoa)

Educado: ばよかったです$$,
    $$ばよかった$$,
    $$ばよかった$$,
    ARRAY['ば', 'よかった']::text[],
    ARRAY['ばよかった', 'ばよかったです', 'ばよかったのに', 'なければよかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-06', $$試験に落ちた。もっと勉強すればよかった。$$, $$しけんにおちた。もっとべんきょうすればよかった。$$, $$Fui reprovado. Devia ter estudado mais.$$),
    ('n3-grammar-06', $$雨が降ってきた。傘を持ってくればよかった。$$, $$あめがふってきた。かさをもってくればよかった。$$, $$Começou a chover. Devia ter trazido o guarda-chuva.$$),
    ('n3-grammar-06', $$あんなこと言わなければよかった。$$, $$あんなこといわなければよかった。$$, $$Não devia ter dito aquilo.$$),
    ('n3-grammar-06', $$もっと早く家を出ればよかったです。$$, $$もっとはやくいえをでればよかったです。$$, $$Devia ter saído de casa mais cedo.$$),
    ('n3-grammar-06', $$君も来ればよかったのに。楽しかったよ。$$, $$きみもくればよかったのに。たのしかったよ。$$, $$Você devia ter vindo. Foi divertido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寝坊した。目覚ましをかけれ____。$$, $$Dormi demais. Devia ter colocado o despertador.$$),
        (2, $$この服は高すぎた。買わなけれ____。$$, $$Esta roupa foi cara demais. Não devia ter comprado.$$),
        (3, $$風邪がひどくなった。もっと早く病院に行け____。$$, $$O resfriado piorou. Devia ter ido ao hospital mais cedo.$$),
        (4, $$わからないところを、先生に聞いておけ____。$$, $$Devia ter perguntado ao professor as partes que não entendi.$$),
        (5, $$君も来れ____のに。$$, $$Você devia ter vindo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-06', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばよかった$$),
        (2, $$ばよかった$$),
        (3, $$ばよかった$$),
        (4, $$ばよかった$$),
        (5, $$ばよかった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-07 — 〜ば〜ほど
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-07',
    'grammar',
    'N3',
    $$〜ば〜ほど$$,
    $$ba ~ hodo$$,
    $$Quanto mais... mais...$$,
    $$ば〜ほど é usado para dizer que, quanto mais algo acontece ou aumenta, mais outra coisa muda também. Equivale a "quanto mais..., mais...".

A estrutura repete a mesma palavra duas vezes: primeiro na forma condicional ば, depois na forma de dicionário seguida de ほど. Por exemplo, "quanto mais pratica, melhor fica".

Funciona com verbos e com adjetivos. Com adjetivos い, usa-se ければ e depois o adjetivo normal: 広ければ広いほど. Com adjetivos な, usa-se なら ou であれば: 静かなら静かなほど.

A segunda parte mostra a mudança proporcional, que pode ser positiva ou negativa.$$,
    $$Às vezes, a primeira parte com ば é omitida, ficando só a forma com ほど: 練習するほど上手になる. O sentido é o mesmo.

A expressão 早ければ早いほどいい ("quanto mais cedo, melhor") é muito usada.

ほど sozinho também indica grau ou extensão, como em "a ponto de", que aparece em outras gramáticas do N3.$$,
    $$Verbo ば + Verbo (dicionário) + ほど
Adjetivo い sem い + ければ + Adjetivo い + ほど
Adjetivo な + なら + Adjetivo な + な + ほど

Forma curta: Verbo / Adjetivo + ほど (sem a parte com ば)$$,
    $$ほど$$,
    $$ほど$$,
    ARRAY['ば', 'ほど']::text[],
    ARRAY['ば〜ほど', 'ほど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-07', $$練習すればするほど、上手になります。$$, $$れんしゅうすればするほど、じょうずになります。$$, $$Quanto mais você pratica, melhor fica.$$),
    ('n3-grammar-07', $$考えれば考えるほど、わからなくなる。$$, $$かんがえればかんがえるほど、わからなくなる。$$, $$Quanto mais penso, menos entendo.$$),
    ('n3-grammar-07', $$部屋は広ければ広いほどいい。$$, $$へやはひろければひろいほどいい。$$, $$Quanto maior o quarto, melhor.$$),
    ('n3-grammar-07', $$日本語は勉強すればするほどおもしろい。$$, $$にほんごはべんきょうすればするほどおもしろい。$$, $$Quanto mais estudo japonês, mais interessante fica.$$),
    ('n3-grammar-07', $$野菜は新しければ新しいほどおいしい。$$, $$やさいはあたらしければあたらしいほどおいしい。$$, $$Quanto mais fresca a verdura, mais gostosa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$甘い物は、食べれば食べる____、太ります。$$, $$Quanto mais doce você come, mais engorda.$$),
        (2, $$アパートは駅に近ければ近い____、家賃が高い。$$, $$Quanto mais perto da estação, mais caro é o aluguel.$$),
        (3, $$話せば話す____、彼のことが好きになった。$$, $$Quanto mais conversávamos, mais eu gostava dele.$$),
        (4, $$返事は早ければ早い____いいです。$$, $$Quanto mais cedo a resposta, melhor.$$),
        (5, $$練習すればする____、自信がつく。$$, $$Quanto mais você treina, mais confiança ganha.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-07', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほど$$),
        (2, $$ほど$$),
        (3, $$ほど$$),
        (4, $$ほど$$),
        (5, $$ほど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-08 — 〜ば〜のに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-08',
    'grammar',
    'N3',
    $$〜ば〜のに$$,
    $$ba ~ noni$$,
    $$Se... (mas não é assim) / Seria bom se... / Quem dera$$,
    $$ば〜のに é usado para expressar uma situação hipotética que é contrária à realidade, acompanhada de lamento, pena ou frustração. Equivale a "se..., (mas não é assim)" ou "quem dera...".

A primeira parte, com ば, apresenta uma condição que não existe na realidade. A segunda parte, terminada em のに, mostra o resultado que aconteceria, e o tom de "que pena que não é assim".

Por exemplo, "se eu tivesse tempo, poderia ir" (mas não tenho tempo).

No passado, a frase mostra arrependimento sobre algo que poderia ter acontecido: "se não tivesse chovido, teríamos ido à praia".

Com いい, a forma ばいいのに expressa um desejo ou uma leve crítica: "seria bom se ele viesse também".$$,
    $$A palavra のに no final da frase dá todo o tom emocional de lamento. Sem ela, a frase fica neutra.

たら também pode ser usado no lugar de ば: 時間があったら、行けるのに.

Essa estrutura é muito comum em conversas, para expressar frustrações do dia a dia.$$,
    $$Verbo / Adjetivo ば + … + のに (contrário à realidade)
Verbo ば + … + Verbo た + のに (passado: teria...)
Verbo ば + いいのに (seria bom se...)$$,
    $$のに$$,
    $$のに$$,
    ARRAY['ば', 'のに']::text[],
    ARRAY['ば〜のに', 'ばいいのに', 'ばよかったのに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-08', $$時間があれば、一緒に行けるのに。$$, $$じかんがあれば、いっしょにいけるのに。$$, $$Se eu tivesse tempo, poderia ir junto. (Mas não tenho.)$$),
    ('n3-grammar-08', $$もう少し安ければ、買うのに。$$, $$もうすこしやすければ、かうのに。$$, $$Se fosse um pouco mais barato, eu compraria.$$),
    ('n3-grammar-08', $$雨が降らなければ、海に行けたのに。$$, $$あめがふらなければ、うみにいけたのに。$$, $$Se não tivesse chovido, teríamos ido à praia.$$),
    ('n3-grammar-08', $$もっと早く言ってくれれば、手伝ったのに。$$, $$もっとはやくいってくれれば、てつだったのに。$$, $$Se você tivesse me dito antes, eu teria ajudado.$$),
    ('n3-grammar-08', $$彼もパーティーに来ればいいのに。$$, $$かれもパーティーにくればいいのに。$$, $$Seria bom se ele também viesse à festa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お金があれば、旅行に行ける____。$$, $$Se eu tivesse dinheiro, poderia viajar.$$),
        (2, $$天気がよければ、ここから富士山が見えた____。$$, $$Se o tempo estivesse bom, daria para ver o Monte Fuji daqui.$$),
        (3, $$言ってくれれば、駅まで迎えに行った____。$$, $$Se você tivesse me avisado, eu teria ido te buscar na estação.$$),
        (4, $$日本語が話せれば、旅行がもっと楽しい____。$$, $$Se eu falasse japonês, a viagem seria mais divertida.$$),
        (5, $$そんなに眠いなら、早く寝ればいい____。$$, $$Se está com tanto sono, devia ir dormir cedo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-08', sentence, translation FROM src ORDER BY k
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

-- n3-grammar-09 — 〜ばかりで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-09',
    'grammar',
    'N3',
    $$〜ばかりで$$,
    $$bakari de$$,
    $$Só... e não / Apenas... sem$$,
    $$ばかりで é usado para criticar uma situação em que só acontece uma coisa, e o que deveria acontecer não acontece. Equivale a "só... e não..." ou "apenas..., sem...".

ばかり indica que algo se repete demais ("só isso"), e で liga essa situação à consequência negativa que vem depois.

Por exemplo, "ele só fala e não faz nada" ou "só chove e não dá para lavar roupa".

O tom é de reclamação, insatisfação ou crítica. A segunda parte geralmente é negativa, mostrando o problema causado pelo excesso.

Ele vem depois de substantivos, de verbos na forma de dicionário e de verbos na forma て (てばかりで).$$,
    $$A expressão 口ばかりで significa "só da boca para fora", ou seja, a pessoa fala muito e não age.

Em textos, também aparece a forma ばかりで、〜ない, enfatizando o que não acontece.

Para uma descrição neutra, sem crítica, prefira だけで.$$,
    $$Substantivo + ばかりで + Frase negativa
Verbo na forma de dicionário + ばかりで + Frase negativa
Verbo na forma て + ばかりで + Frase negativa$$,
    $$ばかりで$$,
    $$ばかりで$$,
    ARRAY['ばかり', 'で']::text[],
    ARRAY['ばかりで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-09', $$彼は口ばかりで、何もしない。$$, $$かれはくちばかりで、なにもしない。$$, $$Ele só fala e não faz nada.$$),
    ('n3-grammar-09', $$毎日雨ばかりで、洗濯ができない。$$, $$まいにちあめばかりで、せんたくができない。$$, $$Só chove todo dia, e não dá para lavar roupa.$$),
    ('n3-grammar-09', $$弟は遊んでばかりで、全然勉強しない。$$, $$おとうとはあそんでばかりで、ぜんぜんべんきょうしない。$$, $$Meu irmão mais novo só brinca e não estuda nada.$$),
    ('n3-grammar-09', $$彼女は文句を言うばかりで、手伝おうとしない。$$, $$かのじょはもんくをいうばかりで、てつだおうとしない。$$, $$Ela só reclama e não tenta ajudar.$$),
    ('n3-grammar-09', $$このクラスは男の子ばかりで、女の子がいない。$$, $$このクラスはおとこのこばかりで、おんなのこがいない。$$, $$Esta turma só tem meninos, não tem nenhuma menina.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は寝て____、仕事をしない。$$, $$Ele só dorme e não trabalha.$$),
        (2, $$最近は失敗____、自信がなくなった。$$, $$Ultimamente só tenho errado e perdi a confiança.$$),
        (3, $$この店は高い物____、買えるものがない。$$, $$Esta loja só tem coisa cara, não tem nada que eu possa comprar.$$),
        (4, $$子供は泣く____、何も話してくれない。$$, $$A criança só chora e não me conta nada.$$),
        (5, $$毎日同じ料理____、もう飽きた。$$, $$Todo dia é só a mesma comida, já enjoei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-09', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりで$$),
        (2, $$ばかりで$$),
        (3, $$ばかりで$$),
        (4, $$ばかりで$$),
        (5, $$ばかりで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-10 — 〜ばかりでなく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-10',
    'grammar',
    'N3',
    $$〜ばかりでなく$$,
    $$bakari de naku$$,
    $$Não só... mas também / Além de$$,
    $$ばかりでなく é usado para dizer que algo não se limita a um elemento, mas inclui outro também. Equivale a "não só... mas também" ou "além de".

A primeira parte apresenta o elemento mais óbvio ou esperado, e a segunda acrescenta outro, muitas vezes com も.

Por exemplo, "ele fala não só inglês, mas também chinês" ou "esta loja não só é barata, como também é gostosa".

É mais formal que だけでなく, que tem o mesmo sentido. Por isso, aparece muito em textos escritos, discursos e explicações.

Ele vem depois de substantivos, verbos e adjetivos na forma simples. Com adjetivos な, usa-se な antes.$$,
    $$だけでなく é mais comum na conversa. ばかりでなく soa um pouco mais formal.

No nível N2, aparece ばかりか, com sentido parecido, mas mais enfático e às vezes com surpresa.

A segunda parte costuma ter も, reforçando a ideia de "também".$$,
    $$Substantivo + ばかりでなく、 + … + も
Verbo / Adjetivo い (forma simples) + ばかりでなく
Adjetivo な + な + ばかりでなく

Variação: ばかりではなく$$,
    $$ばかりでなく$$,
    $$ばかりでなく|ばかりではなく$$,
    ARRAY['ばかり', 'で', 'なく']::text[],
    ARRAY['ばかりでなく', 'ばかりではなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-10', $$彼は英語ばかりでなく、中国語も話せる。$$, $$かれはえいごばかりでなく、ちゅうごくごもはなせる。$$, $$Ele fala não só inglês, mas também chinês.$$),
    ('n3-grammar-10', $$この店は安いばかりでなく、おいしい。$$, $$このみせはやすいばかりでなく、おいしい。$$, $$Esta loja não só é barata, como também é gostosa.$$),
    ('n3-grammar-10', $$子供ばかりでなく、大人も楽しめる映画だ。$$, $$こどもばかりでなく、おとなもたのしめるえいがだ。$$, $$É um filme que não só as crianças, mas também os adultos podem aproveitar.$$),
    ('n3-grammar-10', $$雨ばかりでなく、風も強くなってきた。$$, $$あめばかりでなく、かぜもつよくなってきた。$$, $$Não só a chuva, mas também o vento ficou mais forte.$$),
    ('n3-grammar-10', $$彼女は歌が上手なばかりでなく、ダンスも上手だ。$$, $$かのじょはうたがじょうずなばかりでなく、ダンスもじょうずだ。$$, $$Ela não só canta bem, como também dança bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このアニメは日本____、外国でも人気がある。$$, $$Este anime é popular não só no Japão, mas também no exterior.$$),
        (2, $$この薬は頭痛____、熱にも効く。$$, $$Este remédio funciona não só para dor de cabeça, mas também para febre.$$),
        (3, $$彼は勉強ができる____、スポーツも得意だ。$$, $$Ele não só vai bem nos estudos, como também é bom em esportes.$$),
        (4, $$野菜____、果物も食べましょう。$$, $$Vamos comer não só verduras, mas também frutas.$$),
        (5, $$父は平日____、週末も働いている。$$, $$Meu pai trabalha não só nos dias úteis, mas também nos fins de semana.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-10', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりでなく$$),
        (1, $$ばかりではなく$$),
        (2, $$ばかりでなく$$),
        (2, $$ばかりではなく$$),
        (3, $$ばかりでなく$$),
        (3, $$ばかりではなく$$),
        (4, $$ばかりでなく$$),
        (4, $$ばかりではなく$$),
        (5, $$ばかりでなく$$),
        (5, $$ばかりではなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-11 — 〜べきだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-11',
    'grammar',
    'N3',
    $$〜べきだ$$,
    $$beki da$$,
    $$Deve / Deveria / É preciso$$,
    $$べきだ é usado para expressar um dever moral, uma obrigação de bom senso ou uma recomendação forte. Equivale a "deve", "deveria" ou "é preciso".

A ideia é de algo que é o certo a fazer, segundo a opinião de quem fala, as regras sociais ou a moral. Por exemplo, "promessas devem ser cumpridas" ou "se errou, deve pedir desculpas".

Ele vem depois do verbo na forma de dicionário. Com する, existem duas formas: するべき e すべき, sendo a segunda mais formal.

No passado, べきだった expressa arrependimento: "eu devia ter feito".

Como é uma opinião forte, べきだ pode soar impositivo se dito diretamente a alguém, principalmente a superiores. É comum suavizar com と思う.$$,
    $$べきだ é mais forte que ほうがいい. ほうがいい é um conselho prático; べきだ é um dever, quase moral.

べきだ não é usado para regras e leis oficiais. Para isso, usa-se なければならない.

Em textos argumentativos, べきだ aparece muito para defender opiniões.$$,
    $$Verbo na forma de dicionário + べきだ / べきです
する → するべき / すべき
Adjetivo い sem い + くあるべき
Substantivo / Adjetivo な + であるべき

Passado (arrependimento): べきだった
Antes de substantivo: べき + Substantivo$$,
    $$べきだ$$,
    $$べきだ|べきです|べき$$,
    ARRAY['べき', 'だ']::text[],
    ARRAY['べきだ', 'べきです', 'べきだった', 'すべき']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-11', $$約束は守るべきだ。$$, $$やくそくはまもるべきだ。$$, $$Promessas devem ser cumpridas.$$),
    ('n3-grammar-11', $$学生はもっと勉強するべきです。$$, $$がくせいはもっとべんきょうするべきです。$$, $$Os estudantes deveriam estudar mais.$$),
    ('n3-grammar-11', $$悪いと思ったら、すぐ謝るべきだ。$$, $$わるいとおもったら、すぐあやまるべきだ。$$, $$Se achar que errou, deve pedir desculpas logo.$$),
    ('n3-grammar-11', $$若いうちに、いろいろな経験をするべきだと思う。$$, $$わかいうちに、いろいろなけいけんをするべきだとおもう。$$, $$Acho que devemos ter várias experiências enquanto somos jovens.$$),
    ('n3-grammar-11', $$あの時、本当のことを言うべきだった。$$, $$あのとき、ほんとうのことをいうべきだった。$$, $$Naquela hora, eu devia ter dito a verdade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$人の話はよく聞く____。$$, $$Devemos ouvir bem o que os outros dizem.$$),
        (2, $$困っている人がいたら、助ける____です。$$, $$Se houver alguém em dificuldade, devemos ajudar.$$),
        (3, $$自分の部屋は自分で掃除す____だ。$$, $$Cada um deve limpar o próprio quarto.$$),
        (4, $$こんなに悪くなる前に、もっと早く医者に行く____。$$, $$Eu devia ter ido ao médico antes de piorar tanto.$$),
        (5, $$子供の意見も大切にする____だと思う。$$, $$Acho que devemos valorizar também a opinião das crianças.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-11', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べきだ$$),
        (1, $$べきです$$),
        (2, $$べき$$),
        (3, $$べき$$),
        (4, $$べきだった$$),
        (5, $$べき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-12 — 〜べきではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-12',
    'grammar',
    'N3',
    $$〜べきではない$$,
    $$beki de wa nai$$,
    $$Não deve / Não deveria$$,
    $$べきではない é a forma negativa de べきだ. Ela expressa que algo não deve ser feito, segundo a moral, o bom senso ou a opinião de quem fala. Equivale a "não deve" ou "não deveria".

É usada para criticar comportamentos, dar conselhos fortes ou expressar princípios. Por exemplo, "não se deve falar mal dos outros" ou "não se deve dirigir depois de beber".

Ela vem depois do verbo na forma de dicionário. Na fala, べきではない costuma virar べきじゃない.

No passado, べきではなかった expressa arrependimento por algo que a pessoa fez: "eu não devia ter dito aquilo".

Atenção: o negativo fica em べき, e não no verbo. Diz-se 言うべきではない, e não 言わないべきだ.$$,
    $$Como べきではない é forte, é comum suavizar com と思う ao dar opinião.

Para proibições oficiais, como regras de um lugar, o japonês usa てはいけない ou 禁止.

Em debates e textos de opinião, べきではない aparece com frequência para argumentar contra algo.$$,
    $$Verbo na forma de dicionário + べきではない
Verbo + べきではありません (educado)
Verbo + べきじゃない (fala)

Passado (arrependimento): べきではなかった$$,
    $$べきではない$$,
    $$べきではない|べきじゃない|べきではありません|べきではなかった$$,
    ARRAY['べき', 'では', 'ない']::text[],
    ARRAY['べきではない', 'べきじゃない', 'べきではありません', 'べきではなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-12', $$人の悪口を言うべきではない。$$, $$ひとのわるくちをいうべきではない。$$, $$Não se deve falar mal dos outros.$$),
    ('n3-grammar-12', $$子供は夜遅くまで外にいるべきではありません。$$, $$こどもはよるおそくまでそとにいるべきではありません。$$, $$Crianças não deveriam ficar na rua até tarde da noite.$$),
    ('n3-grammar-12', $$お酒を飲んだら、運転するべきではない。$$, $$おさけをのんだら、うんてんするべきではない。$$, $$Depois de beber, não se deve dirigir.$$),
    ('n3-grammar-12', $$簡単にあきらめるべきではないと思う。$$, $$かんたんにあきらめるべきではないとおもう。$$, $$Acho que não devemos desistir tão fácil.$$),
    ('n3-grammar-12', $$彼にあんなことを言うべきではなかった。$$, $$かれにあんなことをいうべきではなかった。$$, $$Eu não devia ter dito aquilo para ele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$他人のプライバシーに入る____。$$, $$Não se deve invadir a privacidade dos outros.$$),
        (2, $$授業中は携帯を使う____。$$, $$Não se deve usar o celular durante a aula.$$),
        (3, $$食べ物を無駄にする____。$$, $$Não se deve desperdiçar comida.$$),
        (4, $$疲れているときに、大事なことを決める____。$$, $$Não se deve tomar decisões importantes quando se está cansado.$$),
        (5, $$彼にあの秘密を話す____。$$, $$Eu não devia ter contado aquele segredo para ele.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-12', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べきではない$$),
        (1, $$べきではありません$$),
        (2, $$べきではない$$),
        (2, $$べきではありません$$),
        (3, $$べきではない$$),
        (3, $$べきではありません$$),
        (4, $$べきではない$$),
        (4, $$べきではありません$$),
        (5, $$べきではなかった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-13 — 別に〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-13',
    'grammar',
    'N3',
    $$別に〜ない$$,
    $$betsu ni ~ nai$$,
    $$Não especialmente / Não em particular / Nada demais$$,
    $$別に〜ない é usado para dizer que algo não é especial, não tem nada de mais ou não é bem assim. Equivale a "não especialmente", "não em particular" ou "nada demais".

別に vem antes de uma frase negativa e suaviza ou minimiza a situação. Por exemplo, "não estou especialmente bravo" ou "não tenho pressa nenhuma".

Sozinho, como resposta curta, 別に significa "nada" ou "não, nada especial". Mas, dependendo do tom, essa resposta curta pode soar fria, desinteressada ou até rude.

Também é muito usado com わけではない, formando 別に〜わけではない, para negar uma interpretação: "não é que eu não goste...".$$,
    $$Responder só 別に a uma pergunta pode passar a impressão de má vontade. Em situações educadas, é melhor dar uma resposta completa.

別に também aparece em frases como 別にいい ("tanto faz", "não precisa").

Sem a negação, 別に significa "separadamente", como em 別に払う (pagar separadamente).$$,
    $$別に + Verbo / Adjetivo negativo
別に + 〜わけではない (não é que...)
別に (resposta curta: nada / não especialmente)

Escrita: 別に / べつに$$,
    $$別に$$,
    $$別に|べつに$$,
    ARRAY['別に', 'ない']::text[],
    ARRAY['別に', 'べつに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-13', $$「どうしたの？」「別に何でもないよ。」$$, $$「どうしたの？」「べつになんでもないよ。」$$, $$"O que foi?" "Nada demais."$$),
    ('n3-grammar-13', $$別に急いでいないので、ゆっくりでいいですよ。$$, $$べつにいそいでいないので、ゆっくりでいいですよ。$$, $$Não estou com pressa, pode ir com calma.$$),
    ('n3-grammar-13', $$別に怒っていません。$$, $$べつにおこっていません。$$, $$Não estou bravo, não.$$),
    ('n3-grammar-13', $$私は別に肉が嫌いなわけではない。$$, $$わたしはべつににくがきらいなわけではない。$$, $$Não é que eu não goste de carne.$$),
    ('n3-grammar-13', $$「何か欲しいものある？」「別に。」$$, $$「なにかほしいものある？」「べつに。」$$, $$"Quer alguma coisa?" "Nada em especial."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____困っていないから、心配しないで。$$, $$Não estou com nenhum problema, então não se preocupe.$$),
        (2, $$「何かあったの？」「いや、____何もないよ。」$$, $$"Aconteceu alguma coisa?" "Não, nada demais."$$),
        (3, $$____行きたくないわけじゃない。$$, $$Não é que eu não queira ir.$$),
        (4, $$みんなは褒めていたけど、その映画は____おもしろくなかった。$$, $$Todo mundo elogiou, mas esse filme não foi nada de especial.$$),
        (5, $$「何か質問は？」「____ありません。」$$, $$"Alguma pergunta?" "Nenhuma em especial."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-13', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$別に$$),
        (1, $$べつに$$),
        (2, $$別に$$),
        (2, $$べつに$$),
        (3, $$別に$$),
        (3, $$べつに$$),
        (4, $$別に$$),
        (4, $$べつに$$),
        (5, $$別に$$),
        (5, $$べつに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-14 — 〜ぶりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-14',
    'grammar',
    'N3',
    $$〜ぶりに$$,
    $$buri ni$$,
    $$Pela primeira vez em / Depois de (tempo sem)$$,
    $$ぶりに é usado para dizer que algo aconteceu de novo depois de um longo intervalo. Equivale a "pela primeira vez em... (tempo)" ou "depois de... sem".

Ele vem depois de uma expressão de tempo. Por exemplo, 三年ぶりに significa "pela primeira vez em três anos", ou seja, a última vez foi há três anos.

A expressão 久しぶりに é a mais comum e significa "depois de muito tempo".

Antes de um substantivo, usa-se ぶりの, como em 十年ぶりの大雪 ("a maior nevasca em dez anos").

Sozinho, 久しぶり! é uma saudação muito comum para alguém que não se vê há muito tempo, como "quanto tempo!".$$,
    $$ぶり também aparece em outras palavras com sentido de "jeito", como 話しぶり (jeito de falar). São usos diferentes.

Para intervalos muito curtos, como um dia, ぶりに soa estranho, a não ser que a pessoa queira mostrar que sentiu muita falta.

お久しぶりです é a versão educada da saudação.$$,
    $$Período de tempo + ぶりに + Verbo
Período de tempo + ぶりの + Substantivo
久しぶりに / 久しぶりの / 久しぶり！

Escrita: ぶり / 振り$$,
    $$ぶりに$$,
    $$ぶりに|振りに|ぶりの|ぶり$$,
    ARRAY['ぶり', 'に']::text[],
    ARRAY['ぶりに', 'ぶりの', '久しぶり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-14', $$三年ぶりに国へ帰りました。$$, $$さんねんぶりにくにへかえりました。$$, $$Voltei para o meu país pela primeira vez em três anos.$$),
    ('n3-grammar-14', $$週末、久しぶりに友達に会った。$$, $$しゅうまつ、ひさしぶりにともだちにあった。$$, $$No fim de semana, encontrei um amigo depois de muito tempo.$$),
    ('n3-grammar-14', $$昨日は十年ぶりの大雪だった。$$, $$きのうはじゅうねんぶりのおおゆきだった。$$, $$Ontem foi a maior nevasca em dez anos.$$),
    ('n3-grammar-14', $$一週間ぶりに雨が降った。$$, $$いっしゅうかんぶりにあめがふった。$$, $$Choveu pela primeira vez em uma semana.$$),
    ('n3-grammar-14', $$五年ぶりに会った彼は、全然変わっていなかった。$$, $$ごねんぶりにあったかれは、ぜんぜんかわっていなかった。$$, $$Encontrei-o depois de cinco anos, e ele não tinha mudado nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$二年____日本へ行きました。$$, $$Fui ao Japão pela primeira vez em dois anos.$$),
        (2, $$久し____、いい天気ですね。$$, $$Finalmente, depois de muito tempo, um dia bonito, né?$$),
        (3, $$三か月____髪を切りました。$$, $$Cortei o cabelo pela primeira vez em três meses.$$),
        (4, $$あの二人にとって、二十年____の再会でした。$$, $$Para aqueles dois, foi um reencontro depois de vinte anos.$$),
        (5, $$一か月____に家族と食事をした。$$, $$Jantei com a família pela primeira vez em um mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-14', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぶりに$$),
        (2, $$ぶりに$$),
        (3, $$ぶりに$$),
        (4, $$ぶり$$),
        (5, $$ぶり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-15 — 〜中（ちゅう・じゅう）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-15',
    'grammar',
    'N3',
    $$〜中（ちゅう・じゅう）$$,
    $$chuu / juu$$,
    $$Durante / Em andamento / O... inteiro / Por todo$$,
    $$中 é um sufixo com dois sentidos principais, e a leitura muda conforme o uso.

Lido ちゅう, ele indica que algo está em andamento ou que algo acontece durante um período. Por exemplo, 会議中 (em reunião), 電話中 (ao telefone), 工事中 (em obras). Também indica um prazo: 今週中に significa "dentro desta semana".

Lido じゅう, ele indica "inteiro" ou "por todo". Com tempo, significa "o tempo todo": 一日中 (o dia inteiro). Com lugares, significa "por todo o lugar": 世界中 (no mundo inteiro).

A leitura depende da palavra que vem antes, e muitas combinações já são fixas no vocabulário.$$,
    $$Algumas palavras admitem as duas leituras com sentidos diferentes: 今日中 lido きょうじゅう significa "ainda hoje", com a ideia de prazo, e é a leitura mais comum.

Em placas, 営業中 (aberto) e 準備中 (em preparação) são muito comuns em lojas e restaurantes.

Para "dentro de" um espaço físico, usa-se の中 (なか), e não esse sufixo.$$,
    $$Substantivo de ação + 中 (ちゅう): em andamento (会議中 / 電話中 / 授業中)
Período + 中 (ちゅう) + に: dentro do prazo (今週中に / 今日中に)
Período + 中 (じゅう): o tempo todo (一日中 / 一年中 / 一晩中)
Lugar + 中 (じゅう): por todo o lugar (世界中 / 日本中 / 町中)$$,
    $$中$$,
    $$中$$,
    ARRAY['中']::text[],
    ARRAY['中', 'ちゅう', 'じゅう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-15', $$会議中は携帯電話を切ってください。$$, $$かいぎちゅうはけいたいでんわをきってください。$$, $$Durante a reunião, desliguem o celular.$$),
    ('n3-grammar-15', $$すみません、父は今、電話中です。$$, $$すみません、ちちはいま、でんわちゅうです。$$, $$Desculpe, meu pai está ao telefone agora.$$),
    ('n3-grammar-15', $$昨日は一日中雨が降っていた。$$, $$きのうはいちにちじゅうあめがふっていた。$$, $$Ontem choveu o dia inteiro.$$),
    ('n3-grammar-15', $$この歌は世界中で人気がある。$$, $$このうたはせかいじゅうでにんきがある。$$, $$Esta música é popular no mundo inteiro.$$),
    ('n3-grammar-15', $$今週中にレポートを出してください。$$, $$こんしゅうちゅうにレポートをだしてください。$$, $$Entregue o relatório até o fim desta semana.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$授業____は静かにしてください。$$, $$Durante a aula, fiquem em silêncio.$$),
        (2, $$夏休み____、ずっとアルバイトをしていた。$$, $$Durante as férias de verão, trabalhei meio período o tempo todo.$$),
        (3, $$このエレベーターは今、点検____です。$$, $$Este elevador está em inspeção agora.$$),
        (4, $$一晩____、赤ちゃんが泣いていた。$$, $$O bebê chorou a noite inteira.$$),
        (5, $$今月____に引っ越しを終わらせたい。$$, $$Quero terminar a mudança ainda este mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-15', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$中$$),
        (2, $$中$$),
        (3, $$中$$),
        (4, $$中$$),
        (5, $$中$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-16 — 〜だけ（限度）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-16',
    'grammar',
    'N3',
    $$〜だけ（限度）$$,
    $$dake (gendo)$$,
    $$O máximo possível / Tudo o que / Tanto quanto$$,
    $$No N3, だけ aparece com o sentido de limite máximo, indicando "tudo o que é possível" ou "tanto quanto se quiser". É diferente do だけ do N5, que significa "só".

Os usos mais comuns são:
• できるだけ: "o máximo possível", "sempre que possível".
• 好きなだけ / 〜たいだけ: "o quanto quiser".
• Verbo + だけ + mesmo verbo: "fazer tudo o que dá", como em やるだけやった (fiz tudo o que podia).
• Verbo potencial + だけ: "tudo o que é possível", como em 持てるだけ (tudo o que dá para carregar).

Com の, だけ pode vir antes de um substantivo: 持てるだけの荷物.

A ideia comum é chegar ao limite: fazer ou aproveitar tudo até onde é possível ou desejado.$$,
    $$できるだけ e なるべく têm sentido parecido. できるだけ soa um pouco mais enfático.

A expressão やるだけやってみる significa "tentar dar o máximo de si" e é muito usada antes de desafios.

Esse uso de だけ é positivo ou neutro, sem a ideia de "só isso" do N5.$$,
    $$できるだけ + Verbo / Advérbio
好きな / Verbo たい + だけ + Verbo
Verbo (dicionário) + だけ + Verbo (passado)
Verbo potencial + だけ (の + Substantivo)$$,
    $$だけ$$,
    $$だけ$$,
    ARRAY['だけ']::text[],
    ARRAY['だけ', 'できるだけ', '好きなだけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-16', $$明日は、できるだけ早く来てください。$$, $$あしたは、できるだけはやくきてください。$$, $$Amanhã, venha o mais cedo possível.$$),
    ('n3-grammar-16', $$好きなだけ食べていいですよ。$$, $$すきなだけたべていいですよ。$$, $$Pode comer o quanto quiser.$$),
    ('n3-grammar-16', $$やるだけやったから、後悔はない。$$, $$やるだけやったから、こうかいはない。$$, $$Fiz tudo o que podia, então não tenho arrependimentos.$$),
    ('n3-grammar-16', $$地震のとき、持てるだけの荷物を持って逃げた。$$, $$じしんのとき、もてるだけのにもつをもってにげた。$$, $$No terremoto, fugi levando toda a bagagem que conseguia carregar.$$),
    ('n3-grammar-16', $$言いたいだけ言って、彼は帰ってしまった。$$, $$いいたいだけいって、かれはかえってしまった。$$, $$Ele disse tudo o que queria e foi embora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$できる____毎日運動するようにしています。$$, $$Procuro fazer exercício todo dia, sempre que possível.$$),
        (2, $$欲しい____持っていってください。$$, $$Leve o quanto quiser.$$),
        (3, $$結果はわからないけど、やれる____やってみよう。$$, $$Não sei o resultado, mas vamos fazer tudo o que der.$$),
        (4, $$考えられる____の方法を試した。$$, $$Tentei todos os métodos possíveis.$$),
        (5, $$泣きたい____泣いたら、すっきりした。$$, $$Chorei o quanto quis e me senti aliviado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-16', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけ$$),
        (2, $$だけ$$),
        (3, $$だけ$$),
        (4, $$だけ$$),
        (5, $$だけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-17 — 〜だけでなく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-17',
    'grammar',
    'N3',
    $$〜だけでなく$$,
    $$dake de naku$$,
    $$Não só... mas também / Além de$$,
    $$だけでなく é usado para dizer que algo não se limita a um elemento, mas inclui outro também. Equivale a "não só... mas também" ou "além de".

A primeira parte apresenta o elemento mais óbvio, e a segunda acrescenta outro, geralmente com も.

Por exemplo, "ele fala não só japonês, mas também coreano" ou "este exercício faz bem não só para o corpo, mas também para a mente".

É muito comum na conversa e na escrita. A versão ばかりでなく tem o mesmo sentido, mas soa um pouco mais formal.

Ele vem depois de substantivos, verbos e adjetivos na forma simples. Com adjetivos な, usa-se な antes.$$,
    $$Com partículas, だけでなく pode vir depois delas: 東京にだけでなく, ou antes, conforme a frase.

だけじゃなく é a forma mais comum na fala do dia a dia.

Para um tom mais forte, como "não só isso, como até...", usa-se ばかりか, que aparece no N2.$$,
    $$Substantivo + だけでなく、 + … + も
Verbo / Adjetivo い (forma simples) + だけでなく
Adjetivo な + な + だけでなく

Variações: だけではなく / だけじゃなく (fala)$$,
    $$だけでなく$$,
    $$だけでなく|だけではなく|だけじゃなく$$,
    ARRAY['だけ', 'で', 'なく']::text[],
    ARRAY['だけでなく', 'だけではなく', 'だけじゃなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-17', $$彼は日本語だけでなく、韓国語も話せる。$$, $$かれはにほんごだけでなく、かんこくごもはなせる。$$, $$Ele fala não só japonês, mas também coreano.$$),
    ('n3-grammar-17', $$この店は料理だけでなく、サービスもいい。$$, $$このみせはりょうりだけでなく、サービスもいい。$$, $$Este restaurante tem não só boa comida, mas também bom atendimento.$$),
    ('n3-grammar-17', $$子供だけでなく、大人もこのゲームに夢中だ。$$, $$こどもだけでなく、おとなもこのゲームにむちゅうだ。$$, $$Não só as crianças, mas também os adultos estão viciados neste jogo.$$),
    ('n3-grammar-17', $$彼女はきれいなだけでなく、頭もいい。$$, $$かのじょはきれいなだけでなく、あたまもいい。$$, $$Ela não só é bonita, como também é inteligente.$$),
    ('n3-grammar-17', $$運動は体だけじゃなく、心にもいい。$$, $$うんどうはからだだけじゃなく、こころにもいい。$$, $$O exercício faz bem não só para o corpo, mas também para a mente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この町は夏____、冬も観光客が多い。$$, $$Esta cidade tem muitos turistas não só no verão, mas também no inverno.$$),
        (2, $$彼は歌う____、曲も作る。$$, $$Ele não só canta, como também compõe músicas.$$),
        (3, $$その店は東京____、大阪にもある。$$, $$Essa loja existe não só em Tóquio, mas também em Osaka.$$),
        (4, $$この部屋は広い____、明るい。$$, $$Este quarto não só é amplo, como também é claro.$$),
        (5, $$漢字を読む____、書く練習もしましょう。$$, $$Vamos praticar não só a leitura, mas também a escrita dos kanji.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-17', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけでなく$$),
        (1, $$だけではなく$$),
        (1, $$だけじゃなく$$),
        (2, $$だけでなく$$),
        (2, $$だけではなく$$),
        (2, $$だけじゃなく$$),
        (3, $$だけでなく$$),
        (3, $$だけではなく$$),
        (3, $$だけじゃなく$$),
        (4, $$だけでなく$$),
        (4, $$だけではなく$$),
        (4, $$だけじゃなく$$),
        (5, $$だけでなく$$),
        (5, $$だけではなく$$),
        (5, $$だけじゃなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-18 — 〜だけど
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-18',
    'grammar',
    'N3',
    $$〜だけど$$,
    $$da kedo$$,
    $$Mas / Porém / Só que$$,
    $$だけど é usado para ligar duas ideias que se contrastam, com o sentido de "mas" ou "porém". É a combinação de だ (forma simples de です) com けど.

Ele aparece depois de substantivos e adjetivos な, na forma simples. Por exemplo, "hoje é folga, mas vou trabalhar".

Também pode ser usado no começo de uma frase, sozinho, como conjunção: "está chovendo. Mas tenho que sair". Nesse uso, é parecido com でも, porém um pouco mais informal.

Na forma んだけど, ele suaviza pedidos e explicações, como "eu queria ir, mas...", deixando a frase mais delicada.

Por ser casual, だけど é usado em conversas informais. Em situações educadas, usa-se ですが ou ですけど.$$,
    $$だけど no começo da frase é comum na fala, mas, na escrita, prefira でも ou しかし.

A forma んだけど… deixa a frase em aberto e é uma maneira muito natural de começar um pedido ou uma explicação.

だけど soa um pouco mais suave que だが, que é mais formal e literário.$$,
    $$Substantivo / Adjetivo な + だけど + Frase
Frase 1 (com ponto final) + だけど、 + Frase 2
Frase + んだけど (suavização / introdução de pedido)

Educado: ですが / ですけど$$,
    $$だけど$$,
    $$だけど$$,
    ARRAY['だ', 'けど']::text[],
    ARRAY['だけど', 'んだけど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-18', $$今日は休みだけど、仕事に行きます。$$, $$きょうはやすみだけど、しごとにいきます。$$, $$Hoje é folga, mas vou trabalhar.$$),
    ('n3-grammar-18', $$彼は学生だけど、とても忙しい。$$, $$かれはがくせいだけど、とてもいそがしい。$$, $$Ele é estudante, mas é muito ocupado.$$),
    ('n3-grammar-18', $$この町は静かだけど、少し不便だ。$$, $$このまちはしずかだけど、すこしふべんだ。$$, $$Esta cidade é tranquila, mas um pouco inconveniente.$$),
    ('n3-grammar-18', $$外は雨だ。だけど、出かけなければならない。$$, $$そとはあめだ。だけど、でかけなければならない。$$, $$Lá fora está chovendo. Mas eu tenho que sair.$$),
    ('n3-grammar-18', $$行きたいんだけど、時間がないんだ。$$, $$いきたいんだけど、じかんがないんだ。$$, $$Eu queria ir, mas não tenho tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このかばんは便利____、ちょっと重い。$$, $$Esta bolsa é prática, mas um pouco pesada.$$),
        (2, $$彼女は外国育ちの日本人____、日本語があまり上手じゃない。$$, $$Ela é japonesa criada no exterior, mas não fala japonês muito bem.$$),
        (3, $$明日は日曜日____、学校に行く。$$, $$Amanhã é domingo, mas vou à escola.$$),
        (4, $$もう疲れた。____、もう少し頑張ろう。$$, $$Já estou cansado. Mas vamos nos esforçar mais um pouco.$$),
        (5, $$「その本、借りたいん____。」「いいよ。」$$, $$"Eu queria pegar esse livro emprestado..." "Pode pegar."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-18', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけど$$),
        (2, $$だけど$$),
        (3, $$だけど$$),
        (4, $$だけど$$),
        (5, $$だけど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-19 — 〜だらけ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-19',
    'grammar',
    'N3',
    $$〜だらけ$$,
    $$darake$$,
    $$Cheio de / Coberto de / Repleto de$$,
    $$だらけ é usado para dizer que algo está cheio ou coberto de alguma coisa, geralmente algo indesejado. Equivale a "cheio de", "coberto de" ou "repleto de".

Ele vem diretamente depois de um substantivo. Por exemplo, 泥だらけ (coberto de lama), 間違いだらけ (cheio de erros), ゴミだらけ (cheio de lixo).

O tom é quase sempre negativo ou de reclamação. A ideia é que há uma quantidade excessiva daquilo, a ponto de ser um problema.

だらけ funciona como um substantivo ou adjetivo な: pode ser seguido de です, だ, の, で e になる.$$,
    $$だらけ não é usado para coisas positivas. Para "cheio de coisas boas", usa-se いっぱい ou 満ちた.

Comparado a ばかり, que indica "só isso", だらけ destaca que algo está coberto ou tomado por aquilo.

Palavras comuns com だらけ são 泥, 傷, 血, ほこり, ゴミ, 間違い e 借金.$$,
    $$Substantivo + だらけ + です / だ
Substantivo + だらけ + の + Substantivo
Substantivo + だらけ + になる
Substantivo + だらけ + で、 + …$$,
    $$だらけ$$,
    $$だらけ$$,
    ARRAY['だらけ']::text[],
    ARRAY['だらけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-19', $$子供は泥だらけになって帰ってきた。$$, $$こどもはどろだらけになってかえってきた。$$, $$A criança voltou para casa coberta de lama.$$),
    ('n3-grammar-19', $$このテストは間違いだらけだ。$$, $$このテストはまちがいだらけだ。$$, $$Esta prova está cheia de erros.$$),
    ('n3-grammar-19', $$部屋がゴミだらけで、足の踏み場もない。$$, $$へやがゴミだらけで、あしのふみばもない。$$, $$O quarto está tão cheio de lixo que não dá nem para pisar.$$),
    ('n3-grammar-19', $$彼の机の上は本だらけだ。$$, $$かれのつくえのうえはほんだらけだ。$$, $$A mesa dele está cheia de livros.$$),
    ('n3-grammar-19', $$転んで、足が傷だらけになった。$$, $$ころんで、あしがきずだらけになった。$$, $$Caí e fiquei com a perna cheia de machucados.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨の中でサッカーをして、服が泥____になった。$$, $$Joguei futebol na chuva e minha roupa ficou coberta de lama.$$),
        (2, $$この作文は間違い____ですね。$$, $$Esta redação está cheia de erros, hein.$$),
        (3, $$長い間掃除していないので、部屋がほこり____だ。$$, $$Faz muito tempo que não limpo, e o quarto está cheio de poeira.$$),
        (4, $$父の手は長年の仕事で傷____だ。$$, $$As mãos do meu pai estão cheias de cicatrizes de anos de trabalho.$$),
        (5, $$借金____の生活は大変だ。$$, $$Uma vida cheia de dívidas é difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-19', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だらけ$$),
        (2, $$だらけ$$),
        (3, $$だらけ$$),
        (4, $$だらけ$$),
        (5, $$だらけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-20 — どんなに〜ても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-20',
    'grammar',
    'N3',
    $$どんなに〜ても$$,
    $$donna ni ~ te mo$$,
    $$Por mais que / Não importa o quanto$$,
    $$どんなに〜ても é usado para dizer que o resultado não muda, por maior que seja o esforço ou a intensidade de algo. Equivale a "por mais que" ou "não importa o quanto".

どんなに vem no começo, indicando um grau extremo, e o verbo ou adjetivo vai para a forma ても.

A segunda parte pode mostrar determinação ("por mais ocupado que esteja, escrevo meu diário") ou frustração ("por mais que pratique, não melhoro").

Com adjetivos い, usa-se くても. Com substantivos e adjetivos な, usa-se でも.$$,
    $$いくら〜ても tem o mesmo sentido e também é muito comum. いくら é usado com frequência para quantidades e esforço repetido.

A segunda parte não muda por causa da primeira. Por isso, frases com どんなに〜ても costumam expressar persistência ou impossibilidade.

Na escrita, também aparece たとえ〜ても, que destaca uma hipótese ("mesmo que").$$,
    $$どんなに + Verbo na forma て + も
どんなに + Adjetivo い sem い + くても
どんなに + Adjetivo な / Substantivo + でも$$,
    $$どんなに$$,
    $$どんなに$$,
    ARRAY['どんなに', 'ても']::text[],
    ARRAY['どんなに〜ても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-20', $$どんなに忙しくても、毎日日記を書いています。$$, $$どんなにいそがしくても、まいにちにっきをかいています。$$, $$Por mais ocupado que eu esteja, escrevo meu diário todo dia.$$),
    ('n3-grammar-20', $$どんなに練習しても、上手にならない。$$, $$どんなにれんしゅうしても、じょうずにならない。$$, $$Por mais que eu pratique, não melhoro.$$),
    ('n3-grammar-20', $$どんなに高くても、この時計が欲しい。$$, $$どんなにたかくても、このとけいがほしい。$$, $$Por mais caro que seja, quero este relógio.$$),
    ('n3-grammar-20', $$どんなに疲れていても、彼は笑顔を忘れない。$$, $$どんなにつかれていても、かれはえがおをわすれない。$$, $$Por mais cansado que esteja, ele nunca deixa de sorrir.$$),
    ('n3-grammar-20', $$どんなに頼んでも、彼は許してくれなかった。$$, $$どんなにたのんでも、かれはゆるしてくれなかった。$$, $$Por mais que eu implorasse, ele não me perdoou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____雨が強くても、試合は行われます。$$, $$Por mais forte que seja a chuva, a partida será realizada.$$),
        (2, $$____勉強しても、この問題はわからない。$$, $$Por mais que eu estude, não entendo esta questão.$$),
        (3, $$____遠くても、会いに行きます。$$, $$Por mais longe que seja, vou te ver.$$),
        (4, $$____謝っても、彼女は許してくれない。$$, $$Por mais que eu peça desculpas, ela não me perdoa.$$),
        (5, $$____つらくても、あきらめないでください。$$, $$Por mais difícil que seja, não desista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-20', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どんなに$$),
        (2, $$どんなに$$),
        (3, $$どんなに$$),
        (4, $$どんなに$$),
        (5, $$どんなに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-21 — どうしても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-21',
    'grammar',
    'N3',
    $$どうしても$$,
    $$doushitemo$$,
    $$De qualquer jeito / A todo custo / De jeito nenhum$$,
    $$どうしても é um advérbio que expressa um desejo ou uma situação muito forte, que não muda por nada. O sentido depende de a frase ser afirmativa ou negativa.

Em frases afirmativas, principalmente com たい, ほしい ou obrigações, significa "de qualquer jeito" ou "a todo custo". Por exemplo, "quero entrar nesta faculdade de qualquer jeito".

Em frases negativas, principalmente com a forma potencial, significa "de jeito nenhum", mostrando que algo é impossível apesar do esforço. Por exemplo, "não consigo lembrar o nome dele de jeito nenhum".

A expressão どうしてもと言うなら significa "se você insiste tanto" e é usada quando alguém cede a um pedido.$$,
    $$Não confunda com どうして (por quê). どうしても tem も no final e muda completamente o sentido.

Em recusas educadas, どうしても都合がつかない significa "de jeito nenhum consigo encaixar na agenda".

どうしても transmite emoção forte, então é comum em pedidos sinceros e em desabafos.$$,
    $$どうしても + Verbo たい / ほしい (de qualquer jeito)
どうしても + Verbo なければならない (a todo custo)
どうしても + Verbo potencial negativo (de jeito nenhum)
どうしてもと言うなら (se você insiste)$$,
    $$どうしても$$,
    $$どうしても$$,
    ARRAY['どうしても']::text[],
    ARRAY['どうしても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-21', $$どうしてもこの大学に入りたい。$$, $$どうしてもこのだいがくにはいりたい。$$, $$Quero entrar nesta faculdade de qualquer jeito.$$),
    ('n3-grammar-21', $$どうしても彼の名前が思い出せない。$$, $$どうしてもかれのなまえがおもいだせない。$$, $$Não consigo lembrar o nome dele de jeito nenhum.$$),
    ('n3-grammar-21', $$明日は大事な会議があるので、どうしても休めません。$$, $$あしたはだいじなかいぎがあるので、どうしてもやすめません。$$, $$Amanhã tenho uma reunião importante, então não posso faltar de jeito nenhum.$$),
    ('n3-grammar-21', $$どうしてもと言うなら、行ってもいいよ。$$, $$どうしてもというなら、いってもいいよ。$$, $$Se você insiste tanto, pode ir.$$),
    ('n3-grammar-21', $$どうしても納豆が食べられない。$$, $$どうしてもなっとうがたべられない。$$, $$De jeito nenhum consigo comer natto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____日本で働きたいです。$$, $$Quero trabalhar no Japão de qualquer jeito.$$),
        (2, $$この漢字が____覚えられない。$$, $$Não consigo decorar este kanji de jeito nenhum.$$),
        (3, $$この仕事は____今日中に終わらせなければならない。$$, $$Este trabalho tem que ser terminado hoje a todo custo.$$),
        (4, $$引っ越す前に、彼に____会いたい。$$, $$Antes da mudança, quero ver ele de qualquer jeito.$$),
        (5, $$鍵が壊れて、ドアが____開かない。$$, $$A fechadura quebrou e a porta não abre de jeito nenhum.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-21', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうしても$$),
        (2, $$どうしても$$),
        (3, $$どうしても$$),
        (4, $$どうしても$$),
        (5, $$どうしても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-22 — 〜ふりをする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-22',
    'grammar',
    'N3',
    $$〜ふりをする$$,
    $$furi wo suru$$,
    $$Fingir / Fazer de conta$$,
    $$ふりをする é usado para dizer que alguém finge estar em certa situação, ou finge fazer algo, sem que seja verdade. Equivale a "fingir" ou "fazer de conta".

ふり significa "aparência" ou "comportamento". Assim, ふりをする é "fazer a aparência de...".

Ele vem depois da forma simples de verbos e adjetivos. Com adjetivos な, usa-se な, e com substantivos, の.

A forma do verbo antes de ふり faz diferença. Com ている ou た, a pessoa finge um estado: 寝ているふり (fingir que está dormindo), 寝たふり (fingir que dormiu). Com ない, finge que não faz algo: 聞こえないふり (fingir que não ouve).$$,
    $$Na fala casual, を costuma ser omitido: 寝たふりする.

A expressão 知らないふりをする (fingir que não sabe) é muito comum.

ふり também aparece em 見て見ぬふり, que significa "fazer vista grossa".$$,
    $$Verbo (forma simples: ている / た / ない) + ふりをする
Adjetivo い + ふりをする
Adjetivo な + な + ふりをする
Substantivo + の + ふりをする

Escrita: ふり / 振り$$,
    $$ふりをする$$,
    $$ふりをし|ふりをす|振りをし|ふりして$$,
    ARRAY['ふり', 'を', 'する']::text[],
    ARRAY['ふりをする', 'ふりをした', 'ふりをしている', 'ふりする']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-22', $$彼は聞こえないふりをした。$$, $$かれはきこえないふりをした。$$, $$Ele fingiu que não ouviu.$$),
    ('n3-grammar-22', $$弟は寝たふりをしていた。$$, $$おとうとはねたふりをしていた。$$, $$Meu irmão mais novo estava fingindo que dormia.$$),
    ('n3-grammar-22', $$知っているふりをするのはやめなさい。$$, $$しっているふりをするのはやめなさい。$$, $$Pare de fingir que sabe.$$),
    ('n3-grammar-22', $$彼女は元気なふりをしているが、本当は悲しんでいる。$$, $$かのじょはげんきなふりをしているが、ほんとうはかなしんでいる。$$, $$Ela finge estar bem, mas na verdade está triste.$$),
    ('n3-grammar-22', $$犬が死んだふりをして遊んでいる。$$, $$いぬがしんだふりをしてあそんでいる。$$, $$O cachorro está brincando de se fingir de morto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$母に呼ばれたが、寝ている____。$$, $$Minha mãe me chamou, mas fingi que estava dormindo.$$),
        (2, $$彼は何も知らない____いる。$$, $$Ele está fingindo que não sabe de nada.$$),
        (3, $$子供は勉強している____けど、漫画を読んでいた。$$, $$A criança fingia que estudava, mas estava lendo mangá.$$),
        (4, $$彼女は平気な____が、本当は怖かった。$$, $$Ela fingiu estar tranquila, mas na verdade estava com medo.$$),
        (5, $$道で先生に会ったが、見なかった____。$$, $$Encontrei o professor na rua, mas fingi que não vi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-22', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ふりをした$$),
        (1, $$ふりをしました$$),
        (2, $$ふりをして$$),
        (3, $$ふりをしていた$$),
        (4, $$ふりをした$$),
        (5, $$ふりをした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-23 — ふと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-23',
    'grammar',
    'N3',
    $$ふと$$,
    $$futo$$,
    $$De repente / Sem querer / Por acaso$$,
    $$ふと é um advérbio que indica que algo aconteceu de forma espontânea, sem intenção nem motivo especial. Equivale a "de repente", "sem querer" ou "por acaso".

Ele é muito usado com ações mentais ou de percepção, como lembrar, pensar, perceber, olhar ou acordar. Por exemplo, "de repente me lembrei de um amigo antigo" ou "acordei de repente no meio da noite".

A diferença em relação a 急に é o tom. 急に destaca uma mudança brusca e rápida. ふと tem um tom mais suave e poético, ligado a pensamentos e sensações que surgem naturalmente.

A expressão ふと気がつくと significa "quando dei por mim" e é muito comum em narrativas.$$,
    $$ふと aparece muito em romances, músicas e textos literários, porque transmite uma sensação delicada.

Com verbos de ação física e intensa, como correr ou gritar, ふと soa estranho. Nesses casos, usa-se 急に ou 突然.

A expressão ふとした + Substantivo, como ふとしたきっかけ, significa "um motivo casual" ou "um acaso".$$,
    $$ふと + Verbo de percepção ou pensamento (思い出す / 気づく / 見る / 思う)
ふと + 目が覚める
ふと気がつくと、 + Frase$$,
    $$ふと$$,
    $$ふと$$,
    ARRAY['ふと']::text[],
    ARRAY['ふと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-23', $$ふと空を見上げると、虹が出ていた。$$, $$ふとそらをみあげると、にじがでていた。$$, $$Quando olhei para o céu por acaso, havia um arco-íris.$$),
    ('n3-grammar-23', $$ふと昔の友達のことを思い出した。$$, $$ふとむかしのともだちのことをおもいだした。$$, $$De repente, me lembrei de um velho amigo.$$),
    ('n3-grammar-23', $$夜中にふと目が覚めた。$$, $$よなかにふとめがさめた。$$, $$Acordei de repente no meio da noite.$$),
    ('n3-grammar-23', $$歩いているとき、ふといいアイデアが浮かんだ。$$, $$あるいているとき、ふといいアイデアがうかんだ。$$, $$Enquanto andava, de repente me veio uma boa ideia.$$),
    ('n3-grammar-23', $$ふと気がつくと、もう夜になっていた。$$, $$ふときがつくと、もうよるになっていた。$$, $$Quando dei por mim, já tinha anoitecido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____窓の外を見ると、雪が降っていた。$$, $$Quando olhei pela janela por acaso, estava nevando.$$),
        (2, $$電車の中で、____母の顔が浮かんだ。$$, $$No trem, de repente me veio à mente o rosto da minha mãe.$$),
        (3, $$____時計を見たら、もう十二時だった。$$, $$Quando olhei o relógio sem querer, já era meia-noite.$$),
        (4, $$散歩中に、____子供のころを思い出した。$$, $$Durante a caminhada, de repente me lembrei da infância.$$),
        (5, $$彼は____立ち止まって、後ろを振り返った。$$, $$De repente, ele parou e olhou para trás.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-23', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ふと$$),
        (2, $$ふと$$),
        (3, $$ふと$$),
        (4, $$ふと$$),
        (5, $$ふと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-24 — 〜がち
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-24',
    'grammar',
    'N3',
    $$〜がち$$,
    $$gachi$$,
    $$Tender a / Ter a tendência de / Com frequência$$,
    $$がち é usado para dizer que algo tende a acontecer com frequência, geralmente algo negativo ou indesejado. Equivale a "tender a" ou "ter a tendência de".

Ele vem depois do verbo na forma ます sem ます, ou diretamente depois de alguns substantivos. Por exemplo, 休みがち (tende a faltar), 病気がち (vive doente), 曇りがち (tempo frequentemente nublado).

O tom costuma ser de crítica, preocupação ou constatação de algo ruim. Por isso, é usado com coisas como esquecer, faltar, ficar doente ou descuidar da alimentação.

がち funciona como um adjetivo な: pode ser seguido de だ, です, な, で e になる.$$,
    $$がち é muito parecido com やすい no sentido de tendência, mas がち foca na frequência com que algo acontece, enquanto やすい foca na facilidade.

Para tendências positivas, がち soa estranho. Nesses casos, prefira よく ou 傾向がある.

Na gíria jovem, ガチ (em katakana) significa "sério" ou "de verdade", e não tem relação com essa gramática.$$,
    $$Verbo na forma ます sem ます + がち + だ / です
Substantivo + がち + だ / です (病気がち / 曇りがち / 遠慮がち)
〜がち + な + Substantivo
〜がち + になる$$,
    $$がち$$,
    $$がち$$,
    ARRAY['がち']::text[],
    ARRAY['がち', 'がちだ', 'がちな', 'がちになる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-24', $$冬は風邪をひきがちだ。$$, $$ふゆはかぜをひきがちだ。$$, $$No inverno, a gente tende a pegar resfriado.$$),
    ('n3-grammar-24', $$彼は最近、学校を休みがちです。$$, $$かれはさいきん、がっこうをやすみがちです。$$, $$Ultimamente, ele tem faltado à escola com frequência.$$),
    ('n3-grammar-24', $$雨の日は家にこもりがちになる。$$, $$あめのひはいえにこもりがちになる。$$, $$Em dias de chuva, a gente tende a ficar trancado em casa.$$),
    ('n3-grammar-24', $$母は病気がちで、よく入院している。$$, $$はははびょうきがちで、よくにゅういんしている。$$, $$Minha mãe vive doente e é internada com frequência.$$),
    ('n3-grammar-24', $$忙しいと、食事が不規則になりがちだ。$$, $$いそがしいと、しょくじがふきそくになりがちだ。$$, $$Quando estamos ocupados, a alimentação tende a ficar irregular.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人暮らしだと、野菜が不足し____だ。$$, $$Morando sozinho, a gente tende a comer pouca verdura.$$),
        (2, $$彼は約束を忘れ____なので、困る。$$, $$Ele tende a esquecer os compromissos, e isso é um problema.$$),
        (3, $$梅雨の時期は曇り____の天気が続く。$$, $$Na época das chuvas, o tempo costuma ficar nublado.$$),
        (4, $$年をとると、物忘れし____になる。$$, $$Com a idade, a gente tende a ficar esquecido.$$),
        (5, $$子供のころ、私は病気____だった。$$, $$Quando criança, eu vivia doente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-24', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がち$$),
        (2, $$がち$$),
        (3, $$がち$$),
        (4, $$がち$$),
        (5, $$がち$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-25 — 〜がたい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-25',
    'grammar',
    'N3',
    $$〜がたい$$,
    $$gatai$$,
    $$Difícil de / Quase impossível de$$,
    $$がたい é usado para dizer que algo é muito difícil ou quase impossível de fazer, por motivos emocionais ou psicológicos. Equivale a "difícil de" ou "quase impossível de".

Ele vem depois do verbo na forma ます sem ます. O resultado funciona como um adjetivo い.

A diferença em relação a にくい e づらい é o tipo de dificuldade. がたい não fala de dificuldade física, mas de algo que a pessoa não consegue aceitar, entender ou fazer por questões internas, como acreditar em algo inacreditável, perdoar algo grave ou esquecer algo marcante.

É usado principalmente com verbos de pensamento e sentimento, como 信じる, 理解する, 許す, 忘れる, 認める e 表す. Por isso, soa formal e aparece muito na escrita.$$,
    $$がたい não é usado para ações físicas simples. Dizer "difícil de andar" com がたい soa errado; para isso, usa-se にくい.

Também existe o adjetivo ありがたい (grato), que vem da mesma origem: algo "raro de existir", e por isso precioso.

Em textos formais, 〜がたいものがある reforça a ideia de que algo é difícil de aceitar.$$,
    $$Verbo na forma ます sem ます + がたい

Combinações comuns: 信じがたい / 理解しがたい / 許しがたい / 忘れがたい / 耐えがたい / 言い表しがたい

Escrita: がたい / 難い$$,
    $$がたい$$,
    $$がたい|難い|がたく$$,
    ARRAY['がたい']::text[],
    ARRAY['がたい', '難い', 'がたく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-25', $$彼がうそをついたなんて、信じがたい。$$, $$かれがうそをついたなんて、しんじがたい。$$, $$É difícil acreditar que ele mentiu.$$),
    ('n3-grammar-25', $$この絵の美しさは、言葉では表しがたい。$$, $$このえのうつくしさは、ことばではあらわしがたい。$$, $$A beleza deste quadro é difícil de expressar em palavras.$$),
    ('n3-grammar-25', $$彼の行動は理解しがたい。$$, $$かれのこうどうはりかいしがたい。$$, $$O comportamento dele é difícil de entender.$$),
    ('n3-grammar-25', $$それは忘れがたい思い出です。$$, $$それはわすれがたいおもいでです。$$, $$Essa é uma lembrança inesquecível.$$),
    ('n3-grammar-25', $$今回の失敗は、許しがたいことだ。$$, $$こんかいのしっぱいは、ゆるしがたいことだ。$$, $$O erro desta vez é imperdoável.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あの優しい人が犯人だなんて、信じ____。$$, $$É difícil acreditar que aquela pessoa tão gentil é a culpada.$$),
        (2, $$留学の経験は、忘れ____ものになった。$$, $$A experiência do intercâmbio se tornou algo inesquecível.$$),
        (3, $$彼の意見には賛成し____。$$, $$É difícil concordar com a opinião dele.$$),
        (4, $$その時の気持ちは、言葉では言い表し____。$$, $$O sentimento daquele momento é difícil de expressar em palavras.$$),
        (5, $$このような失礼な態度は許し____。$$, $$Uma atitude tão mal-educada como essa é imperdoável.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-25', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がたい$$),
        (2, $$がたい$$),
        (3, $$がたい$$),
        (4, $$がたい$$),
        (5, $$がたい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-26 — 〜気味
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-26',
    'grammar',
    'N3',
    $$〜気味$$,
    $$gimi$$,
    $$Um pouco / Meio / Com tendência a$$,
    $$気味 é usado para dizer que alguém ou algo está um pouco em certo estado, geralmente negativo. Equivale a "um pouco", "meio" ou "com tendência a".

Ele vem depois de substantivos ou do verbo na forma ます sem ます. Por exemplo, 風邪気味 (meio resfriado), 疲れ気味 (um pouco cansado), 太り気味 (um pouco acima do peso).

A ideia é de um estado leve, que não é muito forte, mas que se percebe. Por isso, é usado para sintomas, cansaço, tendências de peso, atrasos e mudanças graduais.

気味 funciona como um adjetivo な: pode ser seguido de だ, です, な e で.$$,
    $$Comparando: がち indica que algo acontece com frequência; 気味 indica que, no momento, há um pouco daquele estado.

Sozinho, 気味 (きみ) aparece em palavras como 気味が悪い, que significa "estranho" ou "assustador".

風邪気味 é uma das expressões mais usadas para justificar um mal-estar leve no trabalho ou na escola.$$,
    $$Substantivo + 気味 + だ / です (風邪気味 / 緊張気味 / 寝不足気味)
Verbo na forma ます sem ます + 気味 + だ / です (疲れ気味 / 太り気味 / 遅れ気味)
〜気味 + で、 + Frase

Escrita: 気味 / ぎみ (lido ぎみ como sufixo)$$,
    $$気味$$,
    $$気味|ぎみ$$,
    ARRAY['気味']::text[],
    ARRAY['気味', 'ぎみ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-26', $$今日は少し風邪気味です。$$, $$きょうはすこしかぜぎみです。$$, $$Hoje estou meio resfriado.$$),
    ('n3-grammar-26', $$最近、疲れ気味なので、早く寝ています。$$, $$さいきん、つかれぎみなので、はやくねています。$$, $$Ultimamente estou um pouco cansado, então tenho dormido cedo.$$),
    ('n3-grammar-26', $$彼は少し太り気味だ。$$, $$かれはすこしふとりぎみだ。$$, $$Ele está um pouco acima do peso.$$),
    ('n3-grammar-26', $$電車が遅れ気味で、会議に間に合うか心配だ。$$, $$でんしゃがおくれぎみで、かいぎにまにあうかしんぱいだ。$$, $$O trem está meio atrasado, e estou preocupado se vou chegar a tempo para a reunião.$$),
    ('n3-grammar-26', $$仕事が忙しくて、寝不足気味です。$$, $$しごとがいそがしくて、ねぶそくぎみです。$$, $$Estou com o trabalho corrido e meio sem dormir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$少し熱があって、風邪____です。$$, $$Estou com um pouco de febre, meio resfriado.$$),
        (2, $$最近働きすぎて、疲れ____だ。$$, $$Ultimamente trabalhei demais e estou meio cansado.$$),
        (3, $$冬休みに食べすぎて、太り____です。$$, $$Comi demais nas férias de inverno e estou um pouco acima do peso.$$),
        (4, $$試験の前で、彼は緊張____だった。$$, $$Antes da prova, ele estava meio nervoso.$$),
        (5, $$最近の物価は上がり____だ。$$, $$Ultimamente os preços estão com tendência de alta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-26', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$気味$$),
        (1, $$ぎみ$$),
        (2, $$気味$$),
        (2, $$ぎみ$$),
        (3, $$気味$$),
        (3, $$ぎみ$$),
        (4, $$気味$$),
        (4, $$ぎみ$$),
        (5, $$気味$$),
        (5, $$ぎみ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-27 — 〜ごとに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-27',
    'grammar',
    'N3',
    $$〜ごとに$$,
    $$goto ni$$,
    $$A cada / Cada vez que / Por (cada)$$,
    $$ごとに é usado para indicar repetição em intervalos regulares ou para dizer que algo acontece "a cada" unidade. Equivale a "a cada", "cada vez que" ou "por cada".

Com expressões de tempo e distância, indica intervalos regulares: "a cada quatro anos", "a cada três horas".

Com substantivos de grupo, indica que algo acontece separadamente para cada unidade: "por turma", "por estação do ano", "por região".

Com verbos na forma de dicionário, significa "toda vez que": "toda vez que encontro alguém".

Também aparece em expressões que indicam mudança gradual, como 一雨ごとに ("a cada chuva", ou seja, aos poucos).$$,
    $$Com dias, 一日ごとに significa "todo dia" ou "a cada dia", enquanto 一日おきに significa "dia sim, dia não". É uma diferença importante.

Com verbos, ごとに é parecido com たびに, que também significa "toda vez que".

ごとに soa um pouco mais formal que 毎 (まい) em palavras como 毎日 e 毎週.$$,
    $$Período / Distância + ごとに
Substantivo (grupo / unidade) + ごとに
Verbo na forma de dicionário + ごとに (toda vez que)

Escrita: ごとに / 毎に$$,
    $$ごとに$$,
    $$ごとに|毎に$$,
    ARRAY['ごと', 'に']::text[],
    ARRAY['ごとに', '毎に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-27', $$オリンピックは四年ごとに開かれる。$$, $$オリンピックはよねんごとにひらかれる。$$, $$As Olimpíadas são realizadas a cada quatro anos.$$),
    ('n3-grammar-27', $$この薬は三時間ごとに飲んでください。$$, $$このくすりはさんじかんごとにのんでください。$$, $$Tome este remédio a cada três horas.$$),
    ('n3-grammar-27', $$会う人ごとに、同じ質問をされた。$$, $$あうひとごとに、おなじしつもんをされた。$$, $$Cada pessoa que eu encontrava me fazia a mesma pergunta.$$),
    ('n3-grammar-27', $$季節ごとに、店の飾りが変わる。$$, $$きせつごとに、みせのかざりがかわる。$$, $$A decoração da loja muda a cada estação.$$),
    ('n3-grammar-27', $$一雨ごとに暖かくなっていく。$$, $$ひとあめごとにあたたかくなっていく。$$, $$A cada chuva, o tempo vai ficando mais quente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$バスは十五分____来ます。$$, $$O ônibus passa a cada quinze minutos.$$),
        (2, $$クラス____、テーマを決めて発表した。$$, $$Cada turma escolheu um tema e fez uma apresentação.$$),
        (3, $$一か月____、部屋の大掃除をしています。$$, $$Faço uma faxina geral no quarto a cada mês.$$),
        (4, $$会う____、彼は背が高くなっている。$$, $$Cada vez que o encontro, ele está mais alto.$$),
        (5, $$地域____、言葉が少しずつ違う。$$, $$A língua muda um pouco de região para região.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-27', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ごとに$$),
        (2, $$ごとに$$),
        (3, $$ごとに$$),
        (4, $$ごとに$$),
        (5, $$ごとに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-28 — 〜ほど（程度）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-28',
    'grammar',
    'N3',
    $$〜ほど（程度）$$,
    $$hodo (teido)$$,
    $$A ponto de / Tanto que / Cerca de$$,
    $$ほど é usado para indicar o grau ou a intensidade de algo, comparando com um exemplo extremo. Equivale a "a ponto de" ou "tanto que".

A parte antes de ほど mostra um exemplo do quanto aquilo é intenso. Por exemplo, "estava tão triste que queria chorar" ou "está tão frio que a respiração fica branca".

Muitas vezes, o exemplo é exagerado, como 死ぬほど (a ponto de morrer), usado para dar ênfase.

Depois de números e quantidades, ほど significa "cerca de" ou "aproximadamente", como em "cerca de dez minutos". Nesse uso, ele é parecido com ぐらい, mas um pouco mais formal.$$,
    $$ほど e くらい têm sentidos muito parecidos para grau. ほど soa um pouco mais formal e é mais comum na escrita.

Expressões como 死ぬほど, 泣きたいほど e 信じられないほど são muito usadas para exagerar.

Na forma negativa, ほど〜ない indica comparação: "não é tão... quanto".$$,
    $$Verbo (forma simples) + ほど + Adjetivo / Verbo
Adjetivo い + ほど
Adjetivo な + な + ほど
Substantivo + ほど
Número + ほど (cerca de)$$,
    $$ほど$$,
    $$ほど$$,
    ARRAY['ほど']::text[],
    ARRAY['ほど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-28', $$泣きたいほど悲しかった。$$, $$なきたいほどかなしかった。$$, $$Estava tão triste que dava vontade de chorar.$$),
    ('n3-grammar-28', $$今日は死ぬほど疲れた。$$, $$きょうはしぬほどつかれた。$$, $$Hoje fiquei morto de cansaço.$$),
    ('n3-grammar-28', $$今日は息が白くなるほど寒い。$$, $$きょうはいきがしろくなるほどさむい。$$, $$Hoje está tão frio que a respiração fica branca.$$),
    ('n3-grammar-28', $$家から駅まで十分ほどかかります。$$, $$いえからえきまでじゅっぷんほどかかります。$$, $$De casa até a estação leva cerca de dez minutos.$$),
    ('n3-grammar-28', $$彼の料理は店で出せるほどおいしい。$$, $$かれのりょうりはみせでだせるほどおいしい。$$, $$A comida dele é tão gostosa que poderia ser servida num restaurante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お腹が痛くて、歩けない____だった。$$, $$Estava com tanta dor de barriga que não conseguia andar.$$),
        (2, $$今週は目が回る____忙しい。$$, $$Esta semana estou tão ocupado que fico tonto.$$),
        (3, $$駅で一時間____待ちました。$$, $$Esperei cerca de uma hora na estação.$$),
        (4, $$その知らせを聞いて、声が出ない____驚いた。$$, $$Fiquei tão surpreso com a notícia que perdi a voz.$$),
        (5, $$信じられない____、きれいな景色だった。$$, $$Era uma paisagem tão bonita que nem dava para acreditar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-28', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほど$$),
        (2, $$ほど$$),
        (3, $$ほど$$),
        (4, $$ほど$$),
        (5, $$ほど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-29 — 〜ほど〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-29',
    'grammar',
    'N3',
    $$〜ほど〜ない$$,
    $$hodo ~ nai$$,
    $$Não tão... quanto / Nada é tão... quanto$$,
    $$ほど〜ない é usado para comparações negativas. Equivale a "não é tão... quanto".

A estrutura coloca o ponto de comparação antes de ほど, e o adjetivo ou verbo na forma negativa depois. Por exemplo, "este verão não está tão quente quanto o do ano passado".

Com 思った ou 心配した antes de ほど, mostra que a realidade foi menos intensa do que se esperava: "não foi tão difícil quanto eu pensava".

Uma forma muito usada é 〜ほど〜ものはない (ou 〜はない), que significa "não há nada tão... quanto...". Ela é uma forma enfática de dizer que algo é o mais importante, o melhor ou o mais extremo.$$,
    $$ほど〜ない é diferente de より. より compara de forma positiva ("A é mais... que B"); ほど〜ない compara de forma negativa ("A não é tão... quanto B").

A frase 健康ほど大切なものはない ("nada é tão importante quanto a saúde") é um exemplo clássico.

Na fala, くらい〜ない também é usado com o mesmo sentido.$$,
    $$A + は + B + ほど + Adjetivo / Verbo negativo (A não é tão... quanto B)
思った / 心配した + ほど + Adjetivo negativo
Substantivo + ほど + Adjetivo + Substantivo + は + ない (não há... tão... quanto)$$,
    $$ほど$$,
    $$ほど$$,
    ARRAY['ほど', 'ない']::text[],
    ARRAY['ほど〜ない', 'ほど〜はない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-29', $$今年の夏は去年ほど暑くない。$$, $$ことしのなつはきょねんほどあつくない。$$, $$Este verão não está tão quente quanto o do ano passado.$$),
    ('n3-grammar-29', $$私は兄ほど背が高くない。$$, $$わたしはあにほどせがたかくない。$$, $$Eu não sou tão alto quanto meu irmão mais velho.$$),
    ('n3-grammar-29', $$この問題は思ったほど難しくなかった。$$, $$このもんだいはおもったほどむずかしくなかった。$$, $$Esta questão não foi tão difícil quanto eu pensava.$$),
    ('n3-grammar-29', $$東京ほど人が多い町はない。$$, $$とうきょうほどひとがおおいまちはない。$$, $$Não há cidade com tanta gente quanto Tóquio.$$),
    ('n3-grammar-29', $$健康ほど大切なものはない。$$, $$けんこうほどたいせつなものはない。$$, $$Nada é tão importante quanto a saúde.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$弟は私____勉強しない。$$, $$Meu irmão mais novo não estuda tanto quanto eu.$$),
        (2, $$今日は昨日____寒くないですね。$$, $$Hoje não está tão frio quanto ontem, né?$$),
        (3, $$試験は心配した____難しくなかった。$$, $$A prova não foi tão difícil quanto eu temia.$$),
        (4, $$母の料理____おいしいものはない。$$, $$Não há nada tão gostoso quanto a comida da minha mãe.$$),
        (5, $$この町は東京____便利ではない。$$, $$Esta cidade não é tão prática quanto Tóquio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-29', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほど$$),
        (2, $$ほど$$),
        (3, $$ほど$$),
        (4, $$ほど$$),
        (5, $$ほど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-30 — 一度に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-30',
    'grammar',
    'N3',
    $$一度に$$,
    $$ichido ni$$,
    $$De uma vez / Ao mesmo tempo / Tudo junto$$,
    $$一度に significa "de uma vez" ou "ao mesmo tempo". Ele indica que várias coisas acontecem ou são feitas juntas, em uma única ocasião, em vez de aos poucos.

Por exemplo, comer muito de uma vez, fazer duas coisas ao mesmo tempo ou receber vários trabalhos de uma só vez.

Também é usado para falar de capacidade, como "este elevador leva dez pessoas de uma vez".

Muitas vezes, aparece em conselhos ou avisos, indicando que fazer tudo de uma vez não é bom: "é melhor não tentar decorar tudo de uma vez".$$,
    $$Não confunda 一度に (de uma vez) com 一度 (uma vez, alguma vez), como em 一度行ってみたい.

Expressões parecidas são 同時に (ao mesmo tempo, mais formal) e 一気に (de uma vez só, com força e rapidez).

Em regras de uso, como em elevadores e brinquedos, 一度に aparece para indicar a capacidade máxima.$$,
    $$一度に + Verbo
一度に + Quantidade + Verbo

Escrita: 一度に / いちどに$$,
    $$一度に$$,
    $$一度に|いちどに$$,
    ARRAY['一度', 'に']::text[],
    ARRAY['一度に', 'いちどに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-30', $$一度にたくさん食べると、体によくない。$$, $$いちどにたくさんたべると、からだによくない。$$, $$Comer muito de uma vez não faz bem para o corpo.$$),
    ('n3-grammar-30', $$一度に二つのことはできません。$$, $$いちどにふたつのことはできません。$$, $$Não consigo fazer duas coisas ao mesmo tempo.$$),
    ('n3-grammar-30', $$仕事が一度に来て、大変だった。$$, $$しごとがいちどにきて、たいへんだった。$$, $$O trabalho veio todo de uma vez, e foi difícil.$$),
    ('n3-grammar-30', $$このエレベーターは一度に十人乗れます。$$, $$このエレベーターはいちどにじゅうにんのれます。$$, $$Este elevador leva dez pessoas de uma vez.$$),
    ('n3-grammar-30', $$単語を一度に覚えようとしないほうがいい。$$, $$たんごをいちどにおぼえようとしないほうがいい。$$, $$É melhor não tentar decorar as palavras todas de uma vez.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____全部の荷物は運べない。$$, $$Não dá para carregar toda a bagagem de uma vez.$$),
        (2, $$このバスは____五十人乗ることができる。$$, $$Este ônibus pode levar cinquenta pessoas de uma vez.$$),
        (3, $$いろいろな問題が____起きて、困った。$$, $$Vários problemas aconteceram ao mesmo tempo, e fiquei sem saber o que fazer.$$),
        (4, $$給料を____使ってしまった。$$, $$Acabei gastando o salário todo de uma vez.$$),
        (5, $$薬を____たくさん飲んではいけません。$$, $$Não se deve tomar muito remédio de uma vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-30', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一度に$$),
        (1, $$いちどに$$),
        (2, $$一度に$$),
        (2, $$いちどに$$),
        (3, $$一度に$$),
        (3, $$いちどに$$),
        (4, $$一度に$$),
        (4, $$いちどに$$),
        (5, $$一度に$$),
        (5, $$いちどに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-31 — いくら〜ても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-31',
    'grammar',
    'N3',
    $$いくら〜ても$$,
    $$ikura ~ te mo$$,
    $$Por mais que / Não importa quanto$$,
    $$いくら〜ても é usado para dizer que, por mais que algo aconteça ou seja feito, o resultado não muda. Equivale a "por mais que" ou "não importa quanto".

いくら, que normalmente significa "quanto", aqui indica um grau ou uma quantidade sem limite. O verbo ou adjetivo vai para a forma ても.

A segunda parte mostra que o resultado continua o mesmo. Pode ser algo negativo, como uma frustração ("por mais que eu chame, ninguém responde"), ou uma determinação ("por mais caro que seja, quero").

É muito parecido com どんなに〜ても. いくら costuma destacar quantidade e repetição, como esforço repetido ou dinheiro, enquanto どんなに destaca a intensidade de um estado.$$,
    $$Com dinheiro, いくら〜ても aparece em frases como いくらお金があっても ("por mais dinheiro que se tenha").

A segunda parte geralmente expressa um resultado que não muda, então frases com いくら〜ても costumam ter tom de resignação, crítica ou persistência.

Sem ても, いくら sozinho continua significando "quanto (custa)".$$,
    $$いくら + Verbo na forma て + も
いくら + Adjetivo い sem い + くても
いくら + Adjetivo な / Substantivo + でも$$,
    $$いくら$$,
    $$いくら$$,
    ARRAY['いくら', 'ても']::text[],
    ARRAY['いくら〜ても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-31', $$彼はいくら食べても太らない。$$, $$かれはいくらたべてもふとらない。$$, $$Por mais que ele coma, não engorda.$$),
    ('n3-grammar-31', $$いくら呼んでも、返事がない。$$, $$いくらよんでも、へんじがない。$$, $$Por mais que eu chame, ninguém responde.$$),
    ('n3-grammar-31', $$いくら高くても、この車が欲しい。$$, $$いくらたかくても、このくるまがほしい。$$, $$Por mais caro que seja, quero este carro.$$),
    ('n3-grammar-31', $$いくら説明しても、彼はわかってくれなかった。$$, $$いくらせつめいしても、かれはわかってくれなかった。$$, $$Por mais que eu explicasse, ele não entendeu.$$),
    ('n3-grammar-31', $$いくら忙しくても、朝ご飯は食べたほうがいい。$$, $$いくらいそがしくても、あさごはんはたべたほうがいい。$$, $$Por mais ocupado que esteja, é melhor tomar café da manhã.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____練習しても、上手にならない。$$, $$Por mais que eu pratique, não melhoro.$$),
        (2, $$____探しても、鍵が見つからない。$$, $$Por mais que eu procure, não acho a chave.$$),
        (3, $$____寒くても、彼は毎朝走る。$$, $$Por mais frio que esteja, ele corre toda manhã.$$),
        (4, $$____お金があっても、幸せとは限らない。$$, $$Por mais dinheiro que se tenha, isso não garante a felicidade.$$),
        (5, $$____電話しても、つながらない。$$, $$Por mais que eu ligue, a ligação não completa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-31', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いくら$$),
        (2, $$いくら$$),
        (3, $$いくら$$),
        (4, $$いくら$$),
        (5, $$いくら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-32 — 〜一方だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-32',
    'grammar',
    'N3',
    $$〜一方だ$$,
    $$ippou da$$,
    $$Só aumentar / Só piorar / Continuar cada vez mais$$,
    $$一方だ é usado para dizer que uma situação muda continuamente em uma única direção, sem parar. Equivale a "só aumenta", "só piora" ou "fica cada vez mais...".

Ele vem depois do verbo na forma de dicionário, geralmente verbos de mudança, como 増える (aumentar), 減る (diminuir), 上がる (subir), 悪くなる (piorar).

O tom costuma ser negativo, indicando preocupação com uma tendência que não para, como preços que só sobem ou uma doença que só piora.

一方 significa "um lado só" ou "uma direção". Por isso, a ideia é que a mudança segue sempre o mesmo caminho.$$,
    $$一方だ é diferente de 一方で, que aparece no N2 e significa "por outro lado".

Em notícias e textos sobre economia e sociedade, 一方だ é muito usado para descrever tendências.

Para mudanças positivas, também é possível usar, mas o tom de preocupação é o mais comum.$$,
    $$Verbo de mudança (forma de dicionário) + 一方だ / 一方です
Passado: 一方だった
Contraste: 一方なのに$$,
    $$一方だ$$,
    $$一方だ|一方です|一方な|一方だった$$,
    ARRAY['一方', 'だ']::text[],
    ARRAY['一方だ', '一方です', '一方だった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-32', $$最近、物価は上がる一方だ。$$, $$さいきん、ぶっかはあがるいっぽうだ。$$, $$Ultimamente, os preços só sobem.$$),
    ('n3-grammar-32', $$彼の病気は悪くなる一方です。$$, $$かれのびょうきはわるくなるいっぽうです。$$, $$A doença dele só piora.$$),
    ('n3-grammar-32', $$この町の人口は減る一方だ。$$, $$このまちのじんこうはへるいっぽうだ。$$, $$A população desta cidade só diminui.$$),
    ('n3-grammar-32', $$仕事は増える一方なのに、給料は上がらない。$$, $$しごとはふえるいっぽうなのに、きゅうりょうはあがらない。$$, $$O trabalho só aumenta, mas o salário não sobe.$$),
    ('n3-grammar-32', $$夜になって、雨は強くなる一方だった。$$, $$よるになって、あめはつよくなるいっぽうだった。$$, $$À noite, a chuva só ficava mais forte.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$カードを使いすぎて、借金は増える____。$$, $$Usei demais o cartão, e a dívida só aumenta.$$),
        (2, $$この町を訪れる外国人観光客は増える____。$$, $$Os turistas estrangeiros que visitam esta cidade só aumentam.$$),
        (3, $$夏になって、気温は上がる____です。$$, $$Com a chegada do verão, a temperatura só sobe.$$),
        (4, $$けんかの後、彼との関係は悪くなる____だった。$$, $$Depois da briga, a relação com ele só piorava.$$),
        (5, $$日本の子供の数は減る____。$$, $$O número de crianças no Japão só diminui.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-32', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一方だ$$),
        (1, $$一方です$$),
        (2, $$一方だ$$),
        (2, $$一方です$$),
        (3, $$一方$$),
        (4, $$一方$$),
        (5, $$一方だ$$),
        (5, $$一方です$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-33 — 一体
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-33',
    'grammar',
    'N3',
    $$一体$$,
    $$ittai$$,
    $$Afinal / Mas que / Diabos (ênfase em pergunta)$$,
    $$一体 é usado em perguntas para dar ênfase, mostrando surpresa, irritação, curiosidade forte ou confusão. Equivale a "afinal", "mas que..." ou "diabos" em perguntas como "o que diabos aconteceu?".

Ele sempre aparece junto com uma palavra interrogativa, como 何, 誰, どうして, いつ e どこ.

Também é usado em perguntas indiretas ou em frases de reflexão, como "não sei o que diabos ele está pensando".

O tom é forte e emocional. Por isso, deve ser usado com cuidado em situações formais, pois pode soar como uma cobrança.$$,
    $$Sozinho, 一体 também significa "um corpo" ou "uma unidade", como em 一体になる (tornar-se um só). Esse uso é diferente.

一体全体 é uma forma ainda mais enfática, com tom quase cômico.

Em textos literários, 一体 aparece em monólogos internos e momentos de surpresa.$$,
    $$一体 + Palavra interrogativa (何 / 誰 / どうして / いつ / どこ) + …か
一体 + … + のか、わからない (pergunta indireta)

Escrita: 一体 / いったい$$,
    $$一体$$,
    $$一体|いったい$$,
    ARRAY['一体']::text[],
    ARRAY['一体', 'いったい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-33', $$一体何が起きたんですか。$$, $$いったいなにがおきたんですか。$$, $$Afinal, o que aconteceu?$$),
    ('n3-grammar-33', $$こんな時間に一体誰だろう。$$, $$こんなじかんにいったいだれだろう。$$, $$Quem diabos será a esta hora?$$),
    ('n3-grammar-33', $$一体どうしてそんなことをしたの？$$, $$いったいどうしてそんなことをしたの？$$, $$Mas por que diabos você fez uma coisa dessas?$$),
    ('n3-grammar-33', $$彼は一体何を考えているのか、わからない。$$, $$かれはいったいなにをかんがえているのか、わからない。$$, $$Não sei o que diabos ele está pensando.$$),
    ('n3-grammar-33', $$この仕事は一体いつになったら終わるんだろう。$$, $$このしごとはいったいいつになったらおわるんだろう。$$, $$Quando é que, afinal, este trabalho vai terminar?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____ここはどこですか。$$, $$Afinal, onde estamos?$$),
        (2, $$そんなに慌てて、____何があったの？$$, $$Tão afobado assim, o que diabos aconteceu?$$),
        (3, $$____誰がこんなことをしたんだ。$$, $$Quem diabos fez uma coisa dessas?$$),
        (4, $$この問題は____どうすればいいんだろう。$$, $$Afinal, o que devo fazer com este problema?$$),
        (5, $$修理に____いくらかかるのか心配だ。$$, $$Estou preocupado com quanto, afinal, vai custar o conserto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-33', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一体$$),
        (1, $$いったい$$),
        (2, $$一体$$),
        (2, $$いったい$$),
        (3, $$一体$$),
        (3, $$いったい$$),
        (4, $$一体$$),
        (4, $$いったい$$),
        (5, $$一体$$),
        (5, $$いったい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-34 — 〜じゃない（確認・驚き）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-34',
    'grammar',
    'N3',
    $$〜じゃない（確認・驚き）$$,
    $$ja nai (kakunin / odoroki)$$,
    $$Não é? / Ora mas é... / Não acha?$$,
    $$No N3, じゃない aparece no final da frase não como negação, mas como uma forma de afirmar algo com ênfase, buscar concordância ou expressar surpresa. Equivale a "não é?", "ora, mas é..." ou "não acha?".

Com entonação subindo, じゃない? pede confirmação, como "aquele ali não é o Tanaka?".

Com entonação descendo, じゃない expressa surpresa ou elogio inesperado, como "nossa, mas está gostoso!", ou uma leve repreensão, como "eu não disse?".

Também aparece em いいじゃない, usado para incentivar ou convencer alguém: "que mal tem?", "vamos lá!".

Essa forma é neutra quanto ao gênero e muito usada no dia a dia, mais suave que じゃないか, que soa mais masculina.$$,
    $$O sentido depende muito da entonação. Na escrita, o contexto e o ponto de interrogação ajudam a entender.

じゃん, comum na região de Tóquio, é a versão mais casual e jovem.

Não confunda com じゃない de negação, como em 学生じゃない ("não é estudante"). Aqui, a frase é afirmativa na intenção.$$,
    $$Frase (forma simples) + じゃない (↓ surpresa / ênfase)
Frase (forma simples) + じゃない？ (↑ confirmação)
いいじゃない (incentivo)

Fala muito casual: じゃん$$,
    $$じゃない$$,
    $$じゃない|じゃん$$,
    ARRAY['じゃ', 'ない']::text[],
    ARRAY['じゃない', 'じゃない？', 'じゃん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-34', $$このケーキ、おいしいじゃない。$$, $$このケーキ、おいしいじゃない。$$, $$Nossa, este bolo está gostoso!$$),
    ('n3-grammar-34', $$あれ、田中さんじゃない？$$, $$あれ、たなかさんじゃない？$$, $$Ué, aquele não é o Tanaka?$$),
    ('n3-grammar-34', $$いいじゃない、一緒に行こうよ。$$, $$いいじゃない、いっしょにいこうよ。$$, $$Que mal tem? Vamos juntos!$$),
    ('n3-grammar-34', $$そんなこと、当たり前じゃない。$$, $$そんなこと、あたりまえじゃない。$$, $$Isso é óbvio, ora!$$),
    ('n3-grammar-34', $$だから言ったじゃない。$$, $$だからいったじゃない。$$, $$Eu não te disse?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その服、よく似合う____。$$, $$Essa roupa fica ótima em você, hein!$$),
        (2, $$もう十時____。早く寝なさい。$$, $$Já são dez horas, ora! Vá dormir.$$),
        (3, $$それ、私のペン____？$$, $$Essa não é a minha caneta?$$),
        (4, $$初めてなのに、上手に描けた____。$$, $$É a primeira vez e ficou bem desenhado, hein!$$),
        (5, $$約束したのに、来なかった____。$$, $$Você prometeu e não veio, ora!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-34', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$じゃない$$),
        (1, $$じゃん$$),
        (2, $$じゃない$$),
        (2, $$じゃん$$),
        (3, $$じゃない$$),
        (4, $$じゃない$$),
        (4, $$じゃん$$),
        (5, $$じゃない$$),
        (5, $$じゃん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-35 — 〜か何か
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-35',
    'grammar',
    'N3',
    $$〜か何か$$,
    $$ka nanika$$,
    $$Ou algo assim / Ou alguma coisa do tipo$$,
    $$か何か é usado depois de um substantivo para dar um exemplo, deixando claro que pode ser aquilo ou algo parecido. Equivale a "ou algo assim" ou "ou alguma coisa do tipo".

Ele é útil quando a pessoa não quer ou não consegue ser exata. Por exemplo, ao oferecer "um café ou algo assim", ao supor que alguém faltou "por causa de um resfriado ou algo do tipo", ou ao pedir "uma caneta ou alguma coisa para escrever".

As partículas como を, が e で vêm depois de か何か.

É uma forma natural e informal de deixar a frase mais vaga e flexível.$$,
    $$Para pessoas, usa-se か誰か ("ou alguém"), e para lugares, かどこか ("ou algum lugar").

か何か deixa a frase mais suave, especialmente em ofertas e pedidos.

Em suposições, か何かで aparece muito para explicar ausências: 病気か何かで休んでいる.$$,
    $$Substantivo + か何か + partícula + Verbo
Substantivo + か何か + で (motivo vago)
Substantivo + か何か + Substantivo descritivo (書くもの / 飲むもの)$$,
    $$か何か$$,
    $$か何か|かなにか$$,
    ARRAY['か', '何', 'か']::text[],
    ARRAY['か何か', 'かなにか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-35', $$コーヒーか何か飲みませんか。$$, $$コーヒーかなにかのみませんか。$$, $$Quer beber um café ou algo assim?$$),
    ('n3-grammar-35', $$風邪か何かで、彼は休んでいる。$$, $$かぜかなにかで、かれはやすんでいる。$$, $$Ele faltou por causa de um resfriado ou algo do tipo.$$),
    ('n3-grammar-35', $$誕生日に本か何かをあげたい。$$, $$たんじょうびにほんかなにかをあげたい。$$, $$Quero dar um livro ou alguma coisa assim de aniversário.$$),
    ('n3-grammar-35', $$ペンか何か、書くものを貸してください。$$, $$ペンかなにか、かくものをかしてください。$$, $$Me empresta uma caneta ou alguma coisa para escrever, por favor.$$),
    ('n3-grammar-35', $$駅前で事故か何かがあったようだ。$$, $$えきまえでじこかなにかがあったようだ。$$, $$Parece que houve um acidente ou algo assim em frente à estação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雑誌____、読むものはありますか。$$, $$Tem uma revista ou alguma coisa para ler?$$),
        (2, $$疲れたから、お茶____飲みましょうか。$$, $$Estou cansado, vamos tomar um chá ou algo assim?$$),
        (3, $$田中さんは病気____で、学校を休んだらしい。$$, $$Parece que o Tanaka faltou à escola por causa de alguma doença ou algo do tipo.$$),
        (4, $$ハンカチ____、拭くものを持っていますか。$$, $$Você tem um lenço ou alguma coisa para enxugar?$$),
        (5, $$駅前で祭り____をやっている。$$, $$Está acontecendo um festival ou algo assim em frente à estação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-35', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$か何か$$),
        (1, $$かなにか$$),
        (2, $$か何か$$),
        (2, $$かなにか$$),
        (3, $$か何か$$),
        (3, $$かなにか$$),
        (4, $$か何か$$),
        (4, $$かなにか$$),
        (5, $$か何か$$),
        (5, $$かなにか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-36 — 〜かける
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-36',
    'grammar',
    'N3',
    $$〜かける$$,
    $$kakeru$$,
    $$Começar a (e parar) / Pela metade / Quase$$,
    $$かける, ligado a outro verbo, indica que uma ação começou mas não foi concluída, ou que algo esteve prestes a acontecer. Equivale a "começar a e parar", "pela metade" ou "quase".

A estrutura junta o verbo na forma ます sem ます com かける. O resultado funciona como um verbo do grupo 2.

Os usos mais comuns são:
• Ação interrompida: começar a dizer algo e parar, começar a ler e não terminar.
• Estado pela metade: com かけの + substantivo, indica algo que ficou incompleto, como 読みかけの本 (livro lido pela metade) ou 食べかけのパン (pão mordido).
• Quase acontecer: com verbos de mudança, como 死ぬ ou 転ぶ, indica que algo quase aconteceu.$$,
    $$Não confunda com かける sozinho, que tem muitos sentidos, como "pendurar", "telefonar" e "sentar-se".

A forma かけの + substantivo é muito usada para objetos deixados pela metade, como bebidas, comidas, livros e cartas.

Com 死ぬ, 死にかける significa "quase morrer" e aparece em relatos de acidentes ou doenças graves.$$,
    $$Verbo na forma ます sem ます + かける
Verbo sem ます + かけ + の + Substantivo (pela metade)
Verbo sem ます + かけた (quase aconteceu / começou e parou)
Verbo sem ます + かけて、 + … (começou a... e então...)$$,
    $$かける$$,
    $$かけ$$,
    ARRAY['かける']::text[],
    ARRAY['かける', 'かけ', 'かけた', 'かけて', 'かけの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-36', $$読みかけの本が机の上にある。$$, $$よみかけのほんがつくえのうえにある。$$, $$Há um livro lido pela metade em cima da mesa.$$),
    ('n3-grammar-36', $$何か言いかけて、彼は黙った。$$, $$なにかいいかけて、かれはだまった。$$, $$Ele começou a dizer algo e ficou calado.$$),
    ('n3-grammar-36', $$食べかけのパンを捨てないで。$$, $$たべかけのパンをすてないで。$$, $$Não jogue fora o pão comido pela metade.$$),
    ('n3-grammar-36', $$私は事故で死にかけたことがある。$$, $$わたしはじこでしにかけたことがある。$$, $$Eu já quase morri num acidente.$$),
    ('n3-grammar-36', $$宿題をやりかけたまま、寝てしまった。$$, $$しゅくだいをやりかけたまま、ねてしまった。$$, $$Acabei dormindo com a lição feita pela metade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$書き____の手紙を引き出しにしまった。$$, $$Guardei na gaveta a carta escrita pela metade.$$),
        (2, $$彼女は何か言い____、やめた。$$, $$Ela começou a dizer algo, mas parou.$$),
        (3, $$冷蔵庫に飲み____のジュースが残っている。$$, $$Tem um suco tomado pela metade na geladeira.$$),
        (4, $$雪の道で転び____が、大丈夫だった。$$, $$Quase caí na rua com neve, mas fiquei bem.$$),
        (5, $$作り____の料理を置いて、電話に出た。$$, $$Deixei a comida pela metade e atendi o telefone.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-36', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かけ$$),
        (2, $$かけて$$),
        (3, $$かけ$$),
        (4, $$かけた$$),
        (5, $$かけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-37 — 〜から〜にかけて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-37',
    'grammar',
    'N3',
    $$〜から〜にかけて$$,
    $$kara ~ ni kakete$$,
    $$De... até... (aproximadamente) / Entre... e...$$,
    $$から〜にかけて é usado para indicar um intervalo de tempo ou de espaço de forma aproximada. Equivale a "de... até..." ou "entre... e...".

A diferença em relação a から〜まで é a precisão. から〜まで marca um começo e um fim exatos. から〜にかけて indica uma faixa mais ampla e aproximada, sem limites rígidos.

Por isso, ele é muito usado em previsões do tempo ("de hoje à noite até amanhã"), estações do ano ("de março a abril"), regiões geográficas ("da região de Kanto até Tohoku") e partes do corpo ("do pescoço aos ombros").

O que acontece nesse intervalo é descrito de forma geral, como algo que se espalha por toda aquela faixa.$$,
    $$Em previsões do tempo, essa estrutura aparece praticamente todos os dias.

Também existe a forma にかけて sozinha, com um único ponto, como 週末にかけて ("até o fim de semana").

Não confunda com にかけては, do N2, que significa "quando se trata de" (habilidade).$$,
    $$Tempo A + から + Tempo B + にかけて
Lugar A + から + Lugar B + にかけて
Parte do corpo A + から + Parte do corpo B + にかけて$$,
    $$にかけて$$,
    $$にかけて$$,
    ARRAY['から', 'に', 'かけて']::text[],
    ARRAY['にかけて', 'から〜にかけて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-37', $$今夜から明日にかけて、雨が降るでしょう。$$, $$こんやからあしたにかけて、あめがふるでしょう。$$, $$De hoje à noite até amanhã, deve chover.$$),
    ('n3-grammar-37', $$三月から四月にかけて、桜が咲きます。$$, $$さんがつからしがつにかけて、さくらがさきます。$$, $$As cerejeiras florescem entre março e abril.$$),
    ('n3-grammar-37', $$関東から東北にかけて、大雪になった。$$, $$かんとうからとうほくにかけて、おおゆきになった。$$, $$Nevou muito da região de Kanto até Tohoku.$$),
    ('n3-grammar-37', $$この店は昼から夕方にかけて、とても混む。$$, $$このみせはひるからゆうがたにかけて、とてもこむ。$$, $$Esta loja fica muito cheia entre o meio-dia e o fim da tarde.$$),
    ('n3-grammar-37', $$首から肩にかけて痛い。$$, $$くびからかたにかけていたい。$$, $$Estou com dor do pescoço até os ombros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$十二月から二月____、寒い日が続く。$$, $$Entre dezembro e fevereiro, os dias frios continuam.$$),
        (2, $$九州から四国____、台風が通過した。$$, $$O tufão passou de Kyushu até Shikoku.$$),
        (3, $$夜から朝____、強い風が吹いた。$$, $$Da noite até a manhã, soprou um vento forte.$$),
        (4, $$日本では、六月から七月____梅雨の季節です。$$, $$No Japão, de junho a julho é a estação das chuvas.$$),
        (5, $$背中から腰____痛みがある。$$, $$Tenho dor das costas até a cintura.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-37', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかけて$$),
        (2, $$にかけて$$),
        (3, $$にかけて$$),
        (4, $$にかけて$$),
        (5, $$にかけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-38 — 〜代わりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-38',
    'grammar',
    'N3',
    $$〜代わりに$$,
    $$kawari ni$$,
    $$No lugar de / Em vez de / Em troca de$$,
    $$代わりに tem três usos principais.

O primeiro é substituição de pessoa ou coisa: "no lugar de...". Por exemplo, "cozinhei no lugar da minha mãe" ou "comi pão em vez de arroz". Com substantivos, usa-se の antes.

O segundo é troca: "em troca de...". A pessoa faz algo em compensação por outra coisa. Por exemplo, "em troca de me ajudar, paguei o jantar". Com verbos, eles vêm na forma simples antes de 代わりに.

O terceiro é compensação de características: algo tem um lado bom e um lado ruim. Por exemplo, "esta cidade é prática, mas em compensação o aluguel é caro".

Sozinho, no começo da frase, 代わりに significa "em vez disso" ou "em compensação".$$,
    $$O verbo 代わる significa "substituir" e aparece em expressões como 電話を代わる ("passar o telefone").

Em reuniões de trabalho, 〜の代わりに参りました significa "vim no lugar de...".

Não confunda com 変わりに (de 変わる, mudar). O kanji correto aqui é 代.$$,
    $$Substantivo + の + 代わりに (no lugar de)
Verbo (forma simples) + 代わりに (em troca de / em vez de)
Adjetivo い + 代わりに (em compensação)
Adjetivo な + な + 代わりに

Escrita: 代わりに / かわりに$$,
    $$代わりに$$,
    $$代わりに|かわりに|代わりの$$,
    ARRAY['代わり', 'に']::text[],
    ARRAY['代わりに', 'かわりに', '代わりの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-38', $$母の代わりに、私が料理を作った。$$, $$ははのかわりに、わたしがりょうりをつくった。$$, $$Cozinhei no lugar da minha mãe.$$),
    ('n3-grammar-38', $$今日は課長の代わりに会議に出ます。$$, $$きょうはかちょうのかわりにかいぎにでます。$$, $$Hoje vou à reunião no lugar do chefe de seção.$$),
    ('n3-grammar-38', $$米の代わりにパンを食べた。$$, $$こめのかわりにパンをたべた。$$, $$Comi pão em vez de arroz.$$),
    ('n3-grammar-38', $$引っ越しを手伝ってもらう代わりに、晩ご飯をごちそうした。$$, $$ひっこしをてつだってもらうかわりに、ばんごはんをごちそうした。$$, $$Em troca da ajuda com a mudança, paguei o jantar.$$),
    ('n3-grammar-38', $$この町は便利な代わりに、家賃が高い。$$, $$このまちはべんりなかわりに、やちんがたかい。$$, $$Esta cidade é prática, mas em compensação o aluguel é caro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$病気の先生の____、別の先生が授業をした。$$, $$No lugar do professor doente, outro professor deu a aula.$$),
        (2, $$このケーキは砂糖の____蜂蜜を使った。$$, $$Neste bolo, usei mel em vez de açúcar.$$),
        (3, $$英語を教える____、日本語を教えてもらった。$$, $$Em troca de ensinar inglês, aprendi japonês.$$),
        (4, $$今日はバスの____、自転車で来た。$$, $$Hoje vim de bicicleta em vez de ônibus.$$),
        (5, $$この仕事は大変な____、給料がいい。$$, $$Este trabalho é pesado, mas em compensação o salário é bom.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-38', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$代わりに$$),
        (1, $$かわりに$$),
        (2, $$代わりに$$),
        (2, $$かわりに$$),
        (3, $$代わりに$$),
        (3, $$かわりに$$),
        (4, $$代わりに$$),
        (4, $$かわりに$$),
        (5, $$代わりに$$),
        (5, $$かわりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-39 — 〜結果
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-39',
    'grammar',
    'N3',
    $$〜結果$$,
    $$kekka$$,
    $$Como resultado de / Depois de / O resultado$$,
    $$結果 significa "resultado". Como gramática, ele é usado para dizer que algo aconteceu como consequência de uma ação ou de um processo. Equivale a "como resultado de" ou "depois de".

Com verbos na forma た, indica que, depois de fazer algo, chegou-se a um resultado. Por exemplo, "depois de pensar bem, decidi estudar no exterior".

Com substantivos, usa-se の antes: 調査の結果 (como resultado da pesquisa), 話し合いの結果 (como resultado da conversa).

É uma forma objetiva e um pouco formal, muito usada em relatórios, notícias, explicações e decisões importantes.$$,
    $$結果的に significa "no fim das contas" ou "como resultado" e aparece muito em análises.

Para resultados de provas e exames, 結果 é usado como substantivo comum: 試験の結果.

Na linguagem de negócios, 〜の結果 é uma forma clara de apresentar conclusões.$$,
    $$Verbo na forma た + 結果、 + Resultado
Substantivo + の + 結果、 + Resultado
Substantivo + の + 結果 + は + … (o resultado de... é...)

Escrita: 結果 / けっか$$,
    $$結果$$,
    $$結果|けっか$$,
    ARRAY['結果']::text[],
    ARRAY['結果', 'けっか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-39', $$よく考えた結果、留学することにした。$$, $$よくかんがえたけっか、りゅうがくすることにした。$$, $$Depois de pensar bem, decidi fazer intercâmbio.$$),
    ('n3-grammar-39', $$調査の結果、新しいことがわかった。$$, $$ちょうさのけっか、あたらしいことがわかった。$$, $$Como resultado da pesquisa, descobriu-se algo novo.$$),
    ('n3-grammar-39', $$話し合いの結果、計画を変更した。$$, $$はなしあいのけっか、けいかくをへんこうした。$$, $$Depois da conversa, mudamos o plano.$$),
    ('n3-grammar-39', $$毎日練習した結果、試合に勝てた。$$, $$まいにちれんしゅうしたけっか、しあいにかてた。$$, $$Como resultado de treinar todo dia, conseguimos vencer a partida.$$),
    ('n3-grammar-39', $$試験の結果は来週発表されます。$$, $$しけんのけっかはらいしゅうはっぴょうされます。$$, $$O resultado da prova será divulgado na semana que vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$検査の____、問題はありませんでした。$$, $$O resultado do exame não mostrou nenhum problema.$$),
        (2, $$家族と相談した____、仕事をやめることにした。$$, $$Depois de conversar com a família, decidi sair do emprego.$$),
        (3, $$一生懸命勉強した____、合格できた。$$, $$Como resultado de estudar muito, consegui passar.$$),
        (4, $$アンケートの____、多くの人が賛成した。$$, $$Pelo resultado do questionário, a maioria concordou.$$),
        (5, $$医者に診てもらった____、ただの風邪だとわかった。$$, $$Depois de me consultar com o médico, descobri que era só um resfriado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-39', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$結果$$),
        (1, $$けっか$$),
        (2, $$結果$$),
        (2, $$けっか$$),
        (3, $$結果$$),
        (3, $$けっか$$),
        (4, $$結果$$),
        (4, $$けっか$$),
        (5, $$結果$$),
        (5, $$けっか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-40 — 結局
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-40',
    'grammar',
    'N3',
    $$結局$$,
    $$kekkyoku$$,
    $$No fim / Afinal / No final das contas$$,
    $$結局 é um advérbio que indica o resultado final de uma situação, depois de várias possibilidades, esforços ou dúvidas. Equivale a "no fim", "afinal" ou "no final das contas".

Muitas vezes, o resultado é diferente do esperado ou não compensa o esforço. Por exemplo, "esperei uma hora, mas no fim ele não veio" ou "pensei muito, mas no fim não fui".

Também pode indicar que, depois de muitas opções, voltou-se ao ponto inicial: "no fim, decidimos pela primeira proposta".

No começo de uma frase, 結局 pode introduzir uma conclusão geral: "no fim das contas, o mais importante é a saúde". E, em perguntas, pode pedir que alguém vá direto ao ponto: "afinal, o que você quer dizer?".$$,
    $$Comparado a やっと, que traz alívio por um resultado desejado, 結局 é neutro ou até um pouco decepcionado.

ついに também indica um resultado final, mas com um tom de "finalmente aconteceu", enquanto 結局 tem um tom de "no fim, foi isso".

Em discussões, 結局 pode soar impaciente quando usado em perguntas.$$,
    $$…が / けど、 + 結局 + Resultado
結局、 + Conclusão
結局 + Palavra interrogativa + … + か (afinal, o que...?)

Escrita: 結局 / けっきょく$$,
    $$結局$$,
    $$結局|けっきょく$$,
    ARRAY['結局']::text[],
    ARRAY['結局', 'けっきょく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-40', $$いろいろ考えたが、結局行かなかった。$$, $$いろいろかんがえたが、けっきょくいかなかった。$$, $$Pensei muito, mas no fim não fui.$$),
    ('n3-grammar-40', $$一時間待ったけど、結局彼は来なかった。$$, $$いちじかんまったけど、けっきょくかれはこなかった。$$, $$Esperei uma hora, mas no fim ele não veio.$$),
    ('n3-grammar-40', $$結局、最初の案に決まった。$$, $$けっきょく、さいしょのあんにきまった。$$, $$No fim, decidimos pela primeira proposta.$$),
    ('n3-grammar-40', $$何度も話し合ったが、結局問題は解決しなかった。$$, $$なんどもはなしあったが、けっきょくもんだいはかいけつしなかった。$$, $$Conversamos várias vezes, mas no fim o problema não foi resolvido.$$),
    ('n3-grammar-40', $$結局、何が言いたいんですか。$$, $$けっきょく、なにがいいたいんですか。$$, $$Afinal, o que você quer dizer?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$迷ったけど、____買わなかった。$$, $$Fiquei em dúvida, mas no fim não comprei.$$),
        (2, $$雨が降って、____試合は中止になった。$$, $$Choveu e, no fim, a partida foi cancelada.$$),
        (3, $$三日間探したが、____見つからなかった。$$, $$Procurei por três dias, mas no fim não encontrei.$$),
        (4, $$いろいろあるけど、____、一番大切なのは健康だ。$$, $$Há muitas coisas, mas no fim das contas o mais importante é a saúde.$$),
        (5, $$色々な店を見て、____最初の店で買った。$$, $$Olhei várias lojas e, no fim, comprei na primeira.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-40', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$結局$$),
        (1, $$けっきょく$$),
        (2, $$結局$$),
        (2, $$けっきょく$$),
        (3, $$結局$$),
        (3, $$けっきょく$$),
        (4, $$結局$$),
        (4, $$けっきょく$$),
        (5, $$結局$$),
        (5, $$けっきょく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-41 — 決して〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-41',
    'grammar',
    'N3',
    $$決して〜ない$$,
    $$kesshite ~ nai$$,
    $$Nunca / Jamais / De forma alguma$$,
    $$決して〜ない é usado para fazer uma negação muito forte e firme. Equivale a "nunca", "jamais" ou "de forma alguma".

決して vem antes do verbo ou do adjetivo, e a frase fica sempre na forma negativa. Sem a negação, a frase fica errada.

Ele é usado para promessas sérias ("nunca vou esquecer"), descrições firmes de caráter ("ele jamais mente"), pedidos enfáticos ("de forma alguma vá sozinho") e para corrigir uma impressão ("não é de forma alguma fácil").

O tom é sério e um pouco formal, mais forte que 全然〜ない ou 絶対に〜ない em algumas situações.$$,
    $$絶対に〜ない também expressa negação forte, mas 絶対に pode aparecer em frases afirmativas, enquanto 決して só aparece com negação.

決して〜ない é comum em promessas, juramentos e textos formais.

Para suavizar uma avaliação negativa, como dizer que algo não é fácil, 決して簡単ではない soa educado e firme ao mesmo tempo.$$,
    $$決して + Verbo na forma negativa
決して + Adjetivo い sem い + くない
決して + Adjetivo な / Substantivo + ではない
決して + Verbo ないでください (pedido forte)

Escrita: 決して / けっして$$,
    $$決して$$,
    $$決して|けっして$$,
    ARRAY['決して', 'ない']::text[],
    ARRAY['決して', 'けっして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-41', $$このご恩は決して忘れません。$$, $$このごおんはけっしてわすれません。$$, $$Jamais vou esquecer esse favor.$$),
    ('n3-grammar-41', $$彼は決してうそをつかない人だ。$$, $$かれはけっしてうそをつかないひとだ。$$, $$Ele é uma pessoa que jamais mente.$$),
    ('n3-grammar-41', $$つらくても、決してあきらめないでください。$$, $$つらくても、けっしてあきらめないでください。$$, $$Mesmo que seja difícil, nunca desista.$$),
    ('n3-grammar-41', $$この仕事は決して簡単ではない。$$, $$このしごとはけっしてかんたんではない。$$, $$Este trabalho não é nada fácil.$$),
    ('n3-grammar-41', $$あなたのしたことを、私は決して許さない。$$, $$あなたのしたことを、わたしはけっしてゆるさない。$$, $$Jamais vou perdoar o que você fez.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の優しさは____忘れられない。$$, $$Jamais vou conseguir esquecer a gentileza dela.$$),
        (2, $$危ないから、____一人で行かないでください。$$, $$É perigoso, então de forma alguma vá sozinho.$$),
        (3, $$私は____あなたを裏切りません。$$, $$Eu jamais vou trair você.$$),
        (4, $$心配しないで。日本語は____難しくないですよ。$$, $$Não se preocupe. O japonês não é nada difícil.$$),
        (5, $$この秘密は____誰にも言わない。$$, $$Jamais vou contar este segredo a ninguém.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-41', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$決して$$),
        (1, $$けっして$$),
        (2, $$決して$$),
        (2, $$けっして$$),
        (3, $$決して$$),
        (3, $$けっして$$),
        (4, $$決して$$),
        (4, $$けっして$$),
        (5, $$決して$$),
        (5, $$けっして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-42 — 〜切れない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-42',
    'grammar',
    'N3',
    $$〜切れない$$,
    $$kirenai$$,
    $$Não conseguir (fazer) por completo / Não dar conta de$$,
    $$切れない, ligado a outro verbo, indica que não é possível fazer algo por completo, até o fim. Equivale a "não conseguir... tudo" ou "não dar conta de...".

A estrutura junta o verbo na forma ます sem ます com 切れない, a forma potencial negativa de 切る (que, nesse uso, significa "fazer até o fim").

O motivo costuma ser uma quantidade grande demais: comida demais para comer, estrelas demais para contar, livros demais para ler em um dia.

Também é usado com sentimentos, como em 待ち切れない (não aguentar esperar) e 言い切れない (não conseguir expressar tudo em palavras).$$,
    $$A forma afirmativa é 切れる (conseguir fazer até o fim), e a forma ativa é 切る (fazer até o fim).

数え切れない (incontável) é uma expressão muito usada para falar de grandes quantidades.

待ち切れない é comum para expressar ansiedade positiva, como esperar ansiosamente por uma viagem.$$,
    $$Verbo na forma ます sem ます + 切れない
Verbo sem ます + 切れません (educado)
Verbo sem ます + 切れなくて、 + …
Verbo sem ます + 切れない + ほど (tanto que não dá para...)

Escrita: 切れない / きれない$$,
    $$切れない$$,
    $$切れな|きれな|切れませ|きれませ$$,
    ARRAY['切れない']::text[],
    ARRAY['切れない', '切れません', 'きれない', '切れなくて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-42', $$料理が多すぎて、食べ切れない。$$, $$りょうりがおおすぎて、たべきれない。$$, $$É comida demais, não consigo comer tudo.$$),
    ('n3-grammar-42', $$空の星が多すぎて、数え切れない。$$, $$そらのほしがおおすぎて、かぞえきれない。$$, $$As estrelas no céu são tantas que não dá para contar.$$),
    ('n3-grammar-42', $$待ち切れなくて、先に食べてしまった。$$, $$まちきれなくて、さきにたべてしまった。$$, $$Não aguentei esperar e acabei comendo antes.$$),
    ('n3-grammar-42', $$この感謝の気持ちは、言葉では言い切れない。$$, $$このかんしゃのきもちは、ことばではいいきれない。$$, $$Não consigo expressar em palavras toda essa gratidão.$$),
    ('n3-grammar-42', $$図書館には、一日では読み切れないほどの本がある。$$, $$としょかんには、いちにちではよみきれないほどのほんがある。$$, $$A biblioteca tem tantos livros que não daria para ler num dia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$こんなにたくさんの荷物は、一人では持ち____。$$, $$Tanta bagagem assim, sozinho, não dá para carregar.$$),
        (2, $$宿題が多すぎて、今日中にやり____。$$, $$A lição é tanta que não consigo terminar hoje.$$),
        (3, $$夏休みの旅行が楽しみで、待ち____。$$, $$Estou tão animado com a viagem de férias que não aguento esperar.$$),
        (4, $$皆さんへの感謝の気持ちは言い____。$$, $$Não consigo expressar toda a minha gratidão a vocês.$$),
        (5, $$このケーキは大きすぎて、一人では食べ____。$$, $$Este bolo é grande demais, sozinho não dá para comer tudo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-42', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$切れない$$),
        (1, $$きれない$$),
        (1, $$切れません$$),
        (1, $$きれません$$),
        (2, $$切れない$$),
        (2, $$きれない$$),
        (2, $$切れません$$),
        (2, $$きれません$$),
        (3, $$切れない$$),
        (3, $$きれない$$),
        (3, $$切れません$$),
        (3, $$きれません$$),
        (4, $$切れない$$),
        (4, $$きれない$$),
        (4, $$切れません$$),
        (4, $$きれません$$),
        (5, $$切れない$$),
        (5, $$きれない$$),
        (5, $$切れません$$),
        (5, $$きれません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-43 — 〜きり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-43',
    'grammar',
    'N3',
    $$〜きり$$,
    $$kiri$$,
    $$Só / Sozinho(s) / Desde que (e nunca mais)$$,
    $$きり tem alguns usos principais, todos ligados à ideia de "limite" ou "ponto final".

O primeiro é "só", indicando um número limitado de pessoas ou vezes. Por exemplo, 二人きり (só os dois) e 一度きり (uma única vez).

O segundo, com o verbo na forma た, significa "desde que... e nunca mais". Indica que algo aconteceu e, depois disso, a situação esperada não voltou a acontecer. Por exemplo, "encontrei-o no ano passado e, desde então, nunca mais nos falamos" ou "meu filho saiu de manhã e ainda não voltou".

O terceiro aparece em expressões fixas, como 寝たきり (acamado), indicando um estado que continua sem mudar.

Na fala, きり costuma virar っきり, como em 二人っきり.$$,
    $$Com o verbo na forma た, a segunda parte quase sempre é negativa ou mostra que algo não aconteceu de novo.

寝たきり é usado para pessoas que ficam acamadas por doença ou idade.

それっきり significa "depois disso, nunca mais" e é muito usado em conversas.$$,
    $$Número + きり (só: 二人きり / 一度きり)
Verbo na forma た + きり、 + Frase negativa (desde que... e nunca mais)
Verbo た + きり + だ / になる (estado que continua)

Fala: っきり
Escrita: きり / 切り$$,
    $$きり$$,
    $$きり|切り|っきり$$,
    ARRAY['きり']::text[],
    ARRAY['きり', 'っきり', '切り']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-43', $$部屋には私と彼の二人きりだった。$$, $$へやにはわたしとかれのふたりきりだった。$$, $$No quarto, estávamos só eu e ele.$$),
    ('n3-grammar-43', $$彼とは去年会ったきり、連絡していない。$$, $$かれとはきょねんあったきり、れんらくしていない。$$, $$Eu o vi no ano passado e, desde então, nunca mais nos falamos.$$),
    ('n3-grammar-43', $$息子は朝出かけたきり、まだ帰ってこない。$$, $$むすこはあさでかけたきり、まだかえってこない。$$, $$Meu filho saiu de manhã e ainda não voltou.$$),
    ('n3-grammar-43', $$一度きりの人生だから、楽しみたい。$$, $$いちどきりのじんせいだから、たのしみたい。$$, $$A vida é uma só, então quero aproveitar.$$),
    ('n3-grammar-43', $$祖母は病気で寝たきりになった。$$, $$そぼはびょうきでねたきりになった。$$, $$Minha avó ficou acamada por causa da doença.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$兄は十年前に家を出た____、帰ってこない。$$, $$Meu irmão mais velho saiu de casa há dez anos e nunca mais voltou.$$),
        (2, $$二人____で話したいことがある。$$, $$Tenho uma coisa para falar só com você, a sós.$$),
        (3, $$このチャンスは一回____だ。$$, $$Esta chance é uma só.$$),
        (4, $$彼女とは高校を卒業した____会っていない。$$, $$Desde que me formei no colégio, nunca mais a vi.$$),
        (5, $$先週電話した____、彼から連絡がない。$$, $$Liguei semana passada e, desde então, ele não deu notícias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-43', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$きり$$),
        (2, $$きり$$),
        (3, $$きり$$),
        (4, $$きり$$),
        (5, $$きり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-44 — 〜切る
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-44',
    'grammar',
    'N3',
    $$〜切る$$,
    $$kiru$$,
    $$Fazer por completo / Até o fim / Totalmente$$,
    $$切る, ligado a outro verbo, indica que uma ação foi feita completamente, até o fim, sem deixar nada. Equivale a "por completo", "até o fim" ou "totalmente".

A estrutura junta o verbo na forma ます sem ます com 切る. O resultado funciona como um verbo do grupo 1.

Os usos mais comuns são:
• Terminar tudo: usar todo o dinheiro, ler o livro inteiro, correr a distância completa.
• Estado extremo: 疲れ切る (ficar completamente exausto), 冷え切る (ficar completamente gelado).
• Afirmar com convicção: 言い切る significa "afirmar com toda a certeza".

Muitas vezes, há uma ideia de esforço ou de esgotamento, como em "correr os quarenta e dois quilômetros até o fim".$$,
    $$売り切れ (esgotado) vem dessa mesma ideia: vender até acabar tudo.

疲れ切った, antes de um substantivo, descreve alguém completamente exausto.

A forma potencial negativa 切れない (não conseguir fazer até o fim) é outra gramática importante do N3.$$,
    $$Verbo na forma ます sem ます + 切る

Passado: 切った / 切りました
Estado: 切っている / 切った + Substantivo

Combinações comuns: 使い切る / 読み切る / 走り切る / 疲れ切る / 言い切る / 売り切れる$$,
    $$切る$$,
    $$切っ|切り|切る|切れ|きっ|きり$$,
    ARRAY['切る']::text[],
    ARRAY['切る', '切った', '切りました', '切って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-44', $$マラソンで四十二キロを走り切った。$$, $$マラソンでよんじゅうにキロをはしりきった。$$, $$Corri os quarenta e dois quilômetros da maratona até o fim.$$),
    ('n3-grammar-44', $$旅行でお金を全部使い切ってしまった。$$, $$りょこうでおかねをぜんぶつかいきってしまった。$$, $$Na viagem, acabei gastando todo o dinheiro.$$),
    ('n3-grammar-44', $$彼は疲れ切った顔をしていた。$$, $$かれはつかれきったかおをしていた。$$, $$Ele estava com cara de completamente exausto.$$),
    ('n3-grammar-44', $$一晩でこの本を読み切った。$$, $$ひとばんでこのほんをよみきった。$$, $$Li este livro inteiro em uma noite.$$),
    ('n3-grammar-44', $$彼は「絶対に勝つ」と言い切った。$$, $$かれは「ぜったいにかつ」といいきった。$$, $$Ele afirmou com toda a certeza: "Vou vencer".$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理で冷蔵庫の野菜を全部使い____。$$, $$Na comida, usei todas as verduras da geladeira.$$),
        (2, $$苦しかったが、最後まで泳ぎ____。$$, $$Foi difícil, mas nadei até o fim.$$),
        (3, $$一日中働いて、疲れ____。$$, $$Trabalhei o dia inteiro e fiquei completamente exausto.$$),
        (4, $$長い小説を三日で読み____。$$, $$Li o romance longo inteiro em três dias.$$),
        (5, $$彼は自分が正しいと言い____。$$, $$Ele afirmou com convicção que estava certo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-44', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$切った$$),
        (1, $$切りました$$),
        (1, $$きった$$),
        (2, $$切った$$),
        (2, $$切りました$$),
        (3, $$切った$$),
        (3, $$切っている$$),
        (3, $$切っています$$),
        (4, $$切った$$),
        (4, $$切りました$$),
        (5, $$切った$$),
        (5, $$切りました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-45 — 〜っけ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-45',
    'grammar',
    'N3',
    $$〜っけ$$,
    $$kke$$,
    $$Mesmo? / Era... não era? / Como era mesmo?$$,
    $$っけ é uma partícula de final de frase usada quando a pessoa tenta lembrar ou confirmar algo de que não tem certeza. Equivale a "como era mesmo?", "era..., não era?".

Ela é usada para perguntar algo que você sabia, mas esqueceu, ou para confirmar uma informação. Por exemplo, "a reunião era a que horas mesmo?" ou "amanhã é folga, não é?".

Também pode ser usada falando consigo mesmo, ao recordar o passado com nostalgia: "quando era criança, brincava muito neste parque, né...".

Com substantivos e adjetivos な, usa-se だっけ ou だったっけ. Com verbos e adjetivos い, usa-se a forma た + っけ.

っけ é informal e muito usada na conversa.$$,
    $$A forma educada でしたっけ é muito útil para perguntar algo que você esqueceu sem soar mal-educado, como お名前、何でしたっけ.

Mesmo falando do presente, っけ costuma usar o passado, porque a pessoa está tentando lembrar de algo que já sabia.

No uso de nostalgia, っけ é bem comum em conversas sobre a infância.$$,
    $$Substantivo / Adjetivo な + だっけ / だったっけ
Verbo / Adjetivo い na forma た + っけ
Palavra interrogativa + … + だっけ

Educado: でしたっけ / ましたっけ$$,
    $$っけ$$,
    $$っけ|だっけ$$,
    ARRAY['っけ']::text[],
    ARRAY['っけ', 'だっけ', 'でしたっけ', 'たっけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-45', $$会議は何時からだっけ？$$, $$かいぎはなんじからだっけ？$$, $$A reunião é a partir de que horas mesmo?$$),
    ('n3-grammar-45', $$あの人の名前、何だっけ。$$, $$あのひとのなまえ、なんだっけ。$$, $$Qual é mesmo o nome daquela pessoa?$$),
    ('n3-grammar-45', $$鍵、どこに置いたっけ？$$, $$かぎ、どこにおいたっけ？$$, $$Onde foi mesmo que eu deixei a chave?$$),
    ('n3-grammar-45', $$明日は休みだったっけ？$$, $$あしたはやすみだったっけ？$$, $$Amanhã é folga, não é?$$),
    ('n3-grammar-45', $$子供のころ、よくこの公園で遊んだっけ。$$, $$こどものころ、よくこのこうえんであそんだっけ。$$, $$Quando eu era criança, brincava muito neste parque, né...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さんの誕生日はいつだ____。$$, $$Quando é mesmo o aniversário do Tanaka?$$),
        (2, $$この本、どこで買った____。$$, $$Onde foi mesmo que comprei este livro?$$),
        (3, $$宿題、もう出した____？$$, $$Eu já entreguei a lição?$$),
        (4, $$昔はこの辺に大きな川があった____。$$, $$Antigamente tinha um rio grande por aqui, né...$$),
        (5, $$あれ、今日は何曜日だ____。$$, $$Ué, que dia da semana é hoje mesmo?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-45', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$っけ$$),
        (2, $$っけ$$),
        (3, $$っけ$$),
        (4, $$っけ$$),
        (5, $$っけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-46 — 〜込む
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-46',
    'grammar',
    'N3',
    $$〜込む$$,
    $$komu$$,
    $$Para dentro / Profundamente / Por completo$$,
    $$込む, ligado a outro verbo, acrescenta a ideia de "para dentro" ou de algo feito de forma intensa e profunda.

A estrutura junta o verbo na forma ます sem ます com 込む. O resultado funciona como um verbo do grupo 1.

Os usos principais são:
• Movimento para dentro: 入り込む (entrar em algum lugar), 飛び込む (pular para dentro), 駆け込む (entrar correndo).
• Inserir algo: 書き込む (preencher, escrever dentro de um espaço), 詰め込む (encher, abarrotar).
• Ação intensa ou prolongada: 考え込む (ficar pensativo, absorto), 話し込む (ficar conversando por muito tempo), 落ち込む (ficar deprimido, abatido).

Algumas combinações viraram palavras próprias, com sentidos que vão além da soma das partes.$$,
    $$申し込む (inscrever-se, solicitar) e 落ち込む (ficar desanimado) são combinações muito usadas no dia a dia.

Sozinho, 込む significa "ficar lotado", como em 電車が込んでいる (o trem está lotado), geralmente escrito 混む.

Na internet, 書き込み é usado para "postagem" ou "comentário".$$,
    $$Verbo na forma ます sem ます + 込む

Passado: 込んだ / 込みました
Forma て: 込んで

Combinações comuns: 飛び込む / 駆け込む / 入り込む / 書き込む / 考え込む / 話し込む / 落ち込む / 申し込む$$,
    $$込む$$,
    $$込$$,
    ARRAY['込む']::text[],
    ARRAY['込む', '込んだ', '込みました', '込んで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-46', $$ドアが閉まる直前に、電車に駆け込んだ。$$, $$ドアがしまるちょくぜんに、でんしゃにかけこんだ。$$, $$Entrei correndo no trem logo antes de as portas fecharem.$$),
    ('n3-grammar-46', $$部屋に知らない人が入り込んでいた。$$, $$へやにしらないひとがはいりこんでいた。$$, $$Uma pessoa desconhecida tinha entrado no quarto.$$),
    ('n3-grammar-46', $$彼は何か考え込んでいる。$$, $$かれはなにかかんがえこんでいる。$$, $$Ele está absorto em algum pensamento.$$),
    ('n3-grammar-46', $$この書類に名前を書き込んでください。$$, $$このしょるいになまえをかきこんでください。$$, $$Preencha seu nome neste documento, por favor.$$),
    ('n3-grammar-46', $$犬が川に飛び込んだ。$$, $$いぬがかわにとびこんだ。$$, $$O cachorro pulou no rio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供がプールに飛び____。$$, $$A criança pulou na piscina.$$),
        (2, $$彼女は友達と電話で長い間話し____いた。$$, $$Ela ficou um tempão conversando com a amiga ao telefone.$$),
        (3, $$雨が窓から吹き____きた。$$, $$A chuva entrou pela janela com o vento.$$),
        (4, $$申込書に必要事項を書き____ください。$$, $$Preencha os dados necessários no formulário de inscrição.$$),
        (5, $$授業に遅れそうで、教室に駆け____。$$, $$Estava quase atrasado para a aula e entrei correndo na sala.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-46', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$込んだ$$),
        (1, $$込みました$$),
        (2, $$込んで$$),
        (3, $$込んで$$),
        (4, $$込んで$$),
        (5, $$込んだ$$),
        (5, $$込みました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-47 — 〜こそ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-47',
    'grammar',
    'N3',
    $$〜こそ$$,
    $$koso$$,
    $$Justamente / É que / Desta vez sim$$,
    $$こそ é uma partícula de ênfase. Ela destaca uma palavra como a mais importante da frase, com o sentido de "justamente esse", "esse sim" ou "é exatamente isso".

Os usos mais comuns são:
• Determinação: 今度こそ / 今年こそ significam "desta vez sim", "este ano sem falta", mostrando vontade forte depois de tentativas que não deram certo.
• Resposta educada: こちらこそ significa "eu é que agradeço", "igualmente", em resposta a agradecimentos e cumprimentos.
• Destacar o motivo: からこそ significa "justamente porque...", mostrando que aquele motivo é o verdadeiro ou o mais importante.
• Destacar algo como o verdadeiro: これこそ significa "este sim é...", "este é exatamente o...".

こそ substitui は e が, e vem depois de outras partículas, como からこそ e にこそ.$$,
    $$こちらこそよろしくお願いします é a resposta mais natural quando alguém diz よろしくお願いします.

からこそ dá uma ideia de que o motivo citado, que poderia parecer negativo, é na verdade o que trouxe o resultado.

こそ não é usado com coisas negativas para criticar diretamente; ele valoriza ou enfatiza.$$,
    $$Substantivo + こそ
今度 / 今年 / 明日 + こそ (determinação)
こちらこそ (resposta educada)
Frase + からこそ (justamente porque)
これ / それ + こそ + Substantivo + だ$$,
    $$こそ$$,
    $$こそ$$,
    ARRAY['こそ']::text[],
    ARRAY['こそ', 'からこそ', 'こちらこそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-47', $$去年は落ちたから、今度こそ合格したい。$$, $$きょねんはおちたから、こんどこそごうかくしたい。$$, $$No ano passado reprovei, então desta vez quero passar sem falta.$$),
    ('n3-grammar-47', $$「よろしくお願いします。」「こちらこそ。」$$, $$「よろしくおねがいします。」「こちらこそ。」$$, $$"Conto com você." "Eu é que conto com você."$$),
    ('n3-grammar-47', $$努力したからこそ、成功できた。$$, $$どりょくしたからこそ、せいこうできた。$$, $$Justamente por ter me esforçado, consegui ter sucesso.$$),
    ('n3-grammar-47', $$これこそ私が探していた本だ。$$, $$これこそわたしがさがしていたほんだ。$$, $$Este é exatamente o livro que eu estava procurando.$$),
    ('n3-grammar-47', $$今年こそ、毎日日記を書こう。$$, $$ことしこそ、まいにちにっきをかこう。$$, $$Este ano, sem falta, vou escrever um diário todos os dias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$来年____、日本へ行くぞ。$$, $$Ano que vem, sem falta, vou ao Japão!$$),
        (2, $$「ありがとう。」「いえ、こちら____ありがとう。」$$, $$"Obrigado." "Não, eu é que agradeço."$$),
        (3, $$失敗したから____、学べることがある。$$, $$Justamente por ter errado, há coisas que se pode aprender.$$),
        (4, $$健康____一番大切なものだ。$$, $$A saúde é justamente a coisa mais importante.$$),
        (5, $$今日も寝坊した。明日____早く起きよう。$$, $$Hoje dormi demais de novo. Amanhã, sem falta, vou acordar cedo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-47', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こそ$$),
        (2, $$こそ$$),
        (3, $$こそ$$),
        (4, $$こそ$$),
        (5, $$こそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-48 — 〜こと（指示・感嘆）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-48',
    'grammar',
    'N3',
    $$〜こと（指示・感嘆）$$,
    $$koto (shiji / kantan)$$,
    $$Deve-se (fazer) / É proibido... / Que...! (exclamação)$$,
    $$No N3, こと aparece no final da frase com dois usos especiais.

O primeiro, e mais importante, é dar instruções ou regras. Uma frase terminada em こと funciona como uma ordem escrita: "deve-se fazer" ou, com ない, "é proibido fazer". Esse uso é muito comum em regulamentos de escolas, avisos, provas, manuais e listas de regras.

Ele vem depois do verbo na forma de dicionário (para obrigação) ou na forma ない (para proibição).

O segundo uso, menos comum, é exclamativo: expressa admiração ou surpresa, como "que bebê fofo!". Esse uso soa feminino ou antiquado e aparece mais em ficção.$$,
    $$Esse uso de こと aparece quase sempre na escrita, como em instruções de provas e regras de dormitórios.

Na fala, esse tipo de ordem soa rígido, como de um professor ou chefe dando instruções.

O uso exclamativo, como まあ、きれいだこと, é típico da fala de mulheres mais velhas ou de personagens elegantes.$$,
    $$Verbo na forma de dicionário + こと (fim de frase: deve-se fazer)
Verbo na forma ない + こと (fim de frase: é proibido)
Adjetivo / Substantivo + だ + こと (exclamação, uso antigo / feminino)$$,
    $$こと$$,
    $$こと。|こと！|ことね$$,
    ARRAY['こと']::text[],
    ARRAY['こと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-48', $$学校のルール：廊下を走らないこと。$$, $$がっこうのルール：ろうかをはしらないこと。$$, $$Regra da escola: é proibido correr no corredor.$$),
    ('n3-grammar-48', $$レポートは金曜日までに提出すること。$$, $$レポートはきんようびまでにていしゅつすること。$$, $$O relatório deve ser entregue até sexta-feira.$$),
    ('n3-grammar-48', $$図書館では静かにすること。$$, $$としょかんではしずかにすること。$$, $$Na biblioteca, deve-se fazer silêncio.$$),
    ('n3-grammar-48', $$試験中は、携帯電話の電源を切ること。$$, $$しけんちゅうは、けいたいでんわのでんげんをきること。$$, $$Durante a prova, os celulares devem ser desligados.$$),
    ('n3-grammar-48', $$まあ、かわいい赤ちゃんだこと。$$, $$まあ、かわいいあかちゃんだこと。$$, $$Ah, mas que bebê fofinho!$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$クラスの約束：毎日宿題を出す____。$$, $$Combinado da turma: entregar a lição todos os dias.$$),
        (2, $$ゴミは分別して捨てる____。$$, $$O lixo deve ser separado antes de ser descartado.$$),
        (3, $$寮のルール：授業に遅れない____。$$, $$Regra do dormitório: não chegar atrasado às aulas.$$),
        (4, $$使った物は元の場所に戻す____。$$, $$Os objetos usados devem ser devolvidos ao lugar original.$$),
        (5, $$夜十時以降は大きな音を出さない____。$$, $$Depois das dez da noite, é proibido fazer barulho alto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-48', sentence, translation FROM src ORDER BY k
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

-- n3-grammar-49 — 〜ことから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-49',
    'grammar',
    'N3',
    $$〜ことから$$,
    $$koto kara$$,
    $$Por causa de / Pelo fato de / A partir do fato de$$,
    $$ことから é usado para indicar a origem, o motivo ou a base de uma conclusão. Equivale a "por causa de", "pelo fato de" ou "a partir do fato de".

Ele tem três usos principais:
• Origem de um nome: explicar por que algo se chama assim, como uma cidade que recebeu um nome porque dela se vê o Monte Fuji.
• Base para uma conclusão: a partir de um fato observado, chega-se a uma dedução, como concluir que choveu porque a rua está molhada.
• Ponto de partida de uma consequência: algo pequeno que levou a um resultado maior, como um erro pequeno que virou um grande problema.

A frase antes de ことから fica na forma simples. Com adjetivos な, usa-se な ou である, e com substantivos, である.

É um pouco formal e aparece muito em textos explicativos.$$,
    $$Comparado a から ou ので, ことから destaca que o motivo é um fato objetivo, observável.

É muito usado para explicar a origem de nomes de lugares, apelidos e expressões.

Em textos de investigação ou dedução, ことから〜と考えられる ("a partir disso, pode-se pensar que...") é comum.$$,
    $$Verbo / Adjetivo い (forma simples) + ことから
Adjetivo な + な / である + ことから
Substantivo + である + ことから

… + ことから、 + 〜と呼ばれる / 〜がわかる / 〜になった$$,
    $$ことから$$,
    $$ことから$$,
    ARRAY['こと', 'から']::text[],
    ARRAY['ことから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-49', $$富士山が見えることから、この町は「富士見」と呼ばれている。$$, $$ふじさんがみえることから、このまちは「ふじみ」とよばれている。$$, $$Como dá para ver o Monte Fuji, esta cidade é chamada de "Fujimi".$$),
    ('n3-grammar-49', $$道が濡れていることから、雨が降ったとわかる。$$, $$みちがぬれていることから、あめがふったとわかる。$$, $$Pelo fato de a rua estar molhada, dá para saber que choveu.$$),
    ('n3-grammar-49', $$彼は足が速いことから、「チーター」というあだ名がついた。$$, $$かれはあしがはやいことから、「チーター」というあだながついた。$$, $$Por ser rápido, ele ganhou o apelido de "Guepardo".$$),
    ('n3-grammar-49', $$小さなミスをしたことから、大きな問題になった。$$, $$ちいさなミスをしたことから、おおきなもんだいになった。$$, $$A partir de um pequeno erro, virou um grande problema.$$),
    ('n3-grammar-49', $$顔が似ていることから、二人は兄弟だと思われた。$$, $$かおがにていることから、ふたりはきょうだいだとおもわれた。$$, $$Por terem rostos parecidos, os dois foram confundidos com irmãos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$星がよく見える____、この丘は人気がある。$$, $$Por dar para ver bem as estrelas, esta colina é popular.$$),
        (2, $$指紋が残っていた____、犯人がわかった。$$, $$A partir das impressões digitais deixadas, descobriram o culpado.$$),
        (3, $$形が鶴に似ている____、その池は「鶴池」と呼ばれている。$$, $$Por ter a forma parecida com um grou, esse lago é chamado de "Lago do Grou".$$),
        (4, $$窓が開いていた____、泥棒が入ったと考えられる。$$, $$Pelo fato de a janela estar aberta, acredita-se que um ladrão entrou.$$),
        (5, $$小さなけんかをした____、二人は口をきかなくなった。$$, $$A partir de uma briguinha, os dois pararam de se falar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-49', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことから$$),
        (2, $$ことから$$),
        (3, $$ことから$$),
        (4, $$ことから$$),
        (5, $$ことから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-50 — 〜ことになっている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-50',
    'grammar',
    'N3',
    $$〜ことになっている$$,
    $$koto ni natte iru$$,
    $$Está estabelecido que / É regra que / Está combinado que$$,
    $$ことになっている é usado para falar de regras, costumes ou planos já decididos, que não dependem da vontade de quem fala. Equivale a "está estabelecido que", "é regra que" ou "está combinado que".

Ele vem de ことになる (ficar decidido) na forma ている, indicando que a decisão já existe e continua valendo.

Os usos principais são:
• Regras de um lugar ou instituição: horários de um dormitório, normas de uma empresa.
• Costumes sociais: tirar os sapatos ao entrar em casa no Japão.
• Planos já combinados: um encontro marcado.

A diferença em relação a ことにしている é quem decidiu. ことにしている é uma regra pessoal, decidida pela própria pessoa. ことになっている é uma regra externa ou um combinado com outros.$$,
    $$ことになっている é muito usado para explicar regras de forma educada, sem parecer que é uma ordem pessoal.

Funcionários costumam usar essa forma para explicar normas aos clientes: "segundo as regras, não é possível...".

Para obrigações gerais, como leis, também se usa なければならない, mas ことになっている soa mais suave e explicativo.$$,
    $$Verbo na forma de dicionário + ことになっている
Verbo na forma ない + ことになっている

Educado: ことになっています$$,
    $$ことになっている$$,
    $$ことになっている|ことになっています|ことになってい$$,
    ARRAY['こと', 'に', 'なって', 'いる']::text[],
    ARRAY['ことになっている', 'ことになっています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-50', $$この会社では、毎朝九時に会議をすることになっている。$$, $$このかいしゃでは、まいあさくじにかいぎをすることになっている。$$, $$Nesta empresa, é regra fazer uma reunião todo dia às nove.$$),
    ('n3-grammar-50', $$この寮では、夜十時以降は外出できないことになっています。$$, $$このりょうでは、よるじゅうじいこうはがいしゅつできないことになっています。$$, $$Neste dormitório, é regra não sair depois das dez da noite.$$),
    ('n3-grammar-50', $$来週、田中さんと会うことになっている。$$, $$らいしゅう、たなかさんとあうことになっている。$$, $$Está combinado que vou me encontrar com o Tanaka na semana que vem.$$),
    ('n3-grammar-50', $$日本では、家に入るとき靴を脱ぐことになっている。$$, $$にほんでは、いえにはいるときくつをぬぐことになっている。$$, $$No Japão, é costume tirar os sapatos ao entrar em casa.$$),
    ('n3-grammar-50', $$遅刻した人は、反省文を書くことになっています。$$, $$ちこくしたひとは、はんせいぶんをかくことになっています。$$, $$Quem chega atrasado tem que escrever uma carta de reflexão, segundo a regra.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この学校では、制服を着る____。$$, $$Nesta escola, é regra usar uniforme.$$),
        (2, $$試験中は、辞書を使ってはいけない____。$$, $$Durante a prova, é regra não usar dicionário.$$),
        (3, $$明日、社長と会う____。$$, $$Está combinado que vou me encontrar com o presidente amanhã.$$),
        (4, $$ここではタバコを吸わない____。$$, $$Aqui é regra não fumar.$$),
        (5, $$この部署では、毎月最後の金曜日に飲み会をする____。$$, $$Neste departamento, é costume fazer uma confraternização na última sexta-feira do mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-50', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことになっている$$),
        (1, $$ことになっています$$),
        (2, $$ことになっている$$),
        (2, $$ことになっています$$),
        (3, $$ことになっている$$),
        (3, $$ことになっています$$),
        (4, $$ことになっている$$),
        (4, $$ことになっています$$),
        (5, $$ことになっている$$),
        (5, $$ことになっています$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-51 — 〜ことはない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-51',
    'grammar',
    'N3',
    $$〜ことはない$$,
    $$koto wa nai$$,
    $$Não precisa / Não há necessidade de$$,
    $$ことはない é usado para dizer que não há necessidade de fazer algo. Equivale a "não precisa" ou "não há necessidade de".

Ele vem depois do verbo na forma de dicionário. A ideia é tranquilizar ou aconselhar alguém, mostrando que aquela ação, preocupação ou esforço é desnecessário.

Por exemplo, "não precisa se preocupar", "não precisa vir até aqui" ou "não precisa pedir desculpas".

Comparado a なくてもいい, ことはない soa mais firme e muitas vezes carrega um tom de consolo ou encorajamento. Ele é muito usado para animar alguém que está preocupado ou se culpando à toa.$$,
    $$Não confunda com たことはない (nunca fiz), que usa a forma た e fala de experiência.

ことはない aparece muito junto com わざわざ, そんなに e 何も, reforçando que a ação é desnecessária.

Em níveis mais avançados, ないことはない significa "não é que não...", com sentido bem diferente.$$,
    $$Verbo na forma de dicionário + ことはない
Verbo + ことはありません (educado)

Com わざわざ / そんなに: わざわざ〜ことはない (não precisa se dar ao trabalho de...)$$,
    $$ことはない$$,
    $$ことはない|ことはありません|こともない$$,
    ARRAY['こと', 'は', 'ない']::text[],
    ARRAY['ことはない', 'ことはありません', 'こともない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-51', $$大丈夫だから、心配することはないよ。$$, $$だいじょうぶだから、しんぱいすることはないよ。$$, $$Está tudo bem, não precisa se preocupar.$$),
    ('n3-grammar-51', $$メールで十分ですから、わざわざ来ることはありません。$$, $$メールでじゅうぶんですから、わざわざくることはありません。$$, $$Um e-mail basta, não precisa se dar ao trabalho de vir.$$),
    ('n3-grammar-51', $$まだ時間があるから、そんなに急ぐことはない。$$, $$まだじかんがあるから、そんなにいそぐことはない。$$, $$Ainda temos tempo, não precisa ter tanta pressa.$$),
    ('n3-grammar-51', $$謝ることはないよ。君は悪くない。$$, $$あやまることはないよ。きみはわるくない。$$, $$Não precisa pedir desculpas. Você não tem culpa.$$),
    ('n3-grammar-51', $$小さな失敗で落ち込むことはない。$$, $$ちいさなしっぱいでおちこむことはない。$$, $$Não precisa ficar desanimado por causa de um errinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$簡単な試験だから、緊張する____。$$, $$A prova é fácil, não precisa ficar nervoso.$$),
        (2, $$電話で済むなら、わざわざ行く____。$$, $$Se dá para resolver por telefone, não precisa ir até lá.$$),
        (3, $$事故は君のせいじゃないから、君が責任を感じる____。$$, $$O acidente não foi culpa sua, não precisa se sentir responsável.$$),
        (4, $$まだ時間があるから、焦る____よ。$$, $$Ainda tem tempo, não precisa se afobar.$$),
        (5, $$ただの風邪だから、高い薬を買う____。$$, $$É só um resfriado, não precisa comprar remédio caro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-51', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことはない$$),
        (1, $$ことはありません$$),
        (2, $$ことはない$$),
        (2, $$ことはありません$$),
        (3, $$ことはない$$),
        (3, $$ことはありません$$),
        (4, $$ことはない$$),
        (4, $$ことはありません$$),
        (5, $$ことはない$$),
        (5, $$ことはありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-52 — 〜ことは〜が
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-52',
    'grammar',
    'N3',
    $$〜ことは〜が$$,
    $$koto wa ~ ga$$,
    $$Até que... mas / É verdade que... mas$$,
    $$ことは〜が é usado para admitir que algo é verdade, mas com uma ressalva. Equivale a "até que..., mas..." ou "é verdade que..., mas...".

A estrutura repete a mesma palavra duas vezes, com ことは no meio: "fazer ことは fazer, mas...". A ideia é "fazer, até que faço, mas não do jeito que você imagina".

Por exemplo, "falar japonês, até que falo, mas não muito bem" ou "é barato, é, mas a qualidade não é boa".

A segunda parte, depois de が ou けど, traz a limitação ou o lado negativo. É uma forma de responder com honestidade, sem negar totalmente nem afirmar com entusiasmo.$$,
    $$A repetição é obrigatória: a mesma palavra aparece antes e depois de ことは.

Essa estrutura é ótima para responder perguntas com modéstia, como quando alguém pergunta se você sabe algo.

Comparado a けど sozinho, ことは〜が deixa mais clara a ideia de "sim, mas com limitações".$$,
    $$Verbo + ことは + Verbo (mesmo) + が / けど
Adjetivo い + ことは + Adjetivo い + が / けど
Adjetivo な + な + ことは + Adjetivo な + だ + が / けど
Verbo た + ことは + Verbo た + が / けど$$,
    $$ことは$$,
    $$ことは$$,
    ARRAY['こと', 'は', 'が']::text[],
    ARRAY['ことは〜が', 'ことは〜けど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-52', $$パーティーに行くことは行くが、少し遅れる。$$, $$パーティーにいくことはいくが、すこしおくれる。$$, $$Até que vou à festa, mas vou chegar um pouco atrasado.$$),
    ('n3-grammar-52', $$このパソコンは使えることは使えるけど、とても遅い。$$, $$このパソコンはつかえることはつかえるけど、とてもおそい。$$, $$Este computador até funciona, mas é muito lento.$$),
    ('n3-grammar-52', $$日本語は話せることは話せますが、上手ではありません。$$, $$にほんごははなせることははなせますが、じょうずではありません。$$, $$Japonês, até que falo, mas não falo bem.$$),
    ('n3-grammar-52', $$この店は安いことは安いが、品質がよくない。$$, $$このみせはやすいことはやすいが、ひんしつがよくない。$$, $$Esta loja é barata, é, mas a qualidade não é boa.$$),
    ('n3-grammar-52', $$その本は読んだことは読んだけど、内容はよく覚えていない。$$, $$そのほんはよんだことはよんだけど、ないようはよくおぼえていない。$$, $$Até que li esse livro, mas não lembro bem do conteúdo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理はできる____できるが、上手ではない。$$, $$Cozinhar, até que eu cozinho, mas não sou bom.$$),
        (2, $$宿題はやった____やったけど、全部は終わっていない。$$, $$A lição, até que fiz, mas não terminei tudo.$$),
        (3, $$この部屋は広い____広いが、駅から遠い。$$, $$Este quarto até é amplo, mas é longe da estação.$$),
        (4, $$駅で彼に会った____会ったけど、話はしなかった。$$, $$Até que o encontrei na estação, mas não conversamos.$$),
        (5, $$納豆は好きな____好きですが、毎日は食べません。$$, $$Até que gosto de natto, mas não como todo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-52', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことは$$),
        (2, $$ことは$$),
        (3, $$ことは$$),
        (4, $$ことは$$),
        (5, $$ことは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-53 — 〜くらい・〜ぐらい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-53',
    'grammar',
    'N3',
    $$〜くらい・〜ぐらい$$,
    $$kurai / gurai$$,
    $$Cerca de / Tanto que / Pelo menos / Ninguém tão... quanto$$,
    $$くらい (ou ぐらい) tem vários usos importantes no N3.

• Quantidade aproximada: "cerca de", "mais ou menos", como "uns dez minutos".
• Grau: indica o quanto algo é intenso, com um exemplo, como "estava tão triste que queria chorar". É parecido com ほど.
• Mínimo esperado: indica algo simples que, no mínimo, deveria ser feito, com um tom de crítica, como "pelo menos o seu quarto, limpe você mesmo".
• Comparação máxima: com ない, indica que ninguém ou nada é tão... quanto aquilo, como "não há ninguém tão gentil quanto ele".

くらい e ぐらい são usadas da mesma forma. ぐらい é um pouco mais comum depois de substantivos e na fala.$$,
    $$Para horários, usa-se ごろ, e não くらい: 三時ごろ (por volta das três), mas 三時間くらい (cerca de três horas).

No uso de "pelo menos", くらい costuma ter um tom de cobrança, como algo que é o mínimo esperado.

Para grau, くらい é um pouco mais coloquial que ほど.$$,
    $$Número / Quantidade + くらい (cerca de)
Verbo / Adjetivo (forma simples) + くらい (grau: tanto que)
Substantivo + くらい + Verbo (pelo menos: crítica)
Substantivo + くらい + Adjetivo + Substantivo + は + ない (ninguém tão... quanto)

Escrita: くらい / ぐらい$$,
    $$くらい$$,
    $$くらい|ぐらい$$,
    ARRAY['くらい', 'ぐらい']::text[],
    ARRAY['くらい', 'ぐらい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-53', $$家から駅まで歩いて十分くらいです。$$, $$いえからえきまであるいてじゅっぷんくらいです。$$, $$De casa até a estação são uns dez minutos a pé.$$),
    ('n3-grammar-53', $$その映画は、泣きたいくらい悲しかった。$$, $$そのえいがは、なきたいくらいかなしかった。$$, $$Esse filme foi tão triste que deu vontade de chorar.$$),
    ('n3-grammar-53', $$自分の部屋ぐらい自分で掃除しなさい。$$, $$じぶんのへやぐらいじぶんでそうじしなさい。$$, $$Pelo menos o seu quarto, limpe você mesmo.$$),
    ('n3-grammar-53', $$彼くらい優しい人はいない。$$, $$かれくらいやさしいひとはいない。$$, $$Não há ninguém tão gentil quanto ele.$$),
    ('n3-grammar-53', $$その知らせを聞いて、声が出ないくらい驚いた。$$, $$そのしらせをきいて、こえがでないくらいおどろいた。$$, $$Fiquei tão surpreso com a notícia que perdi a voz.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日二時間____勉強しています。$$, $$Estudo cerca de duas horas todo dia.$$),
        (2, $$お腹が痛くて、立てない____だった。$$, $$Estava com tanta dor de barriga que não conseguia ficar de pé.$$),
        (3, $$朝の挨拶____ちゃんとしなさい。$$, $$Pelo menos o bom-dia, dê direito.$$),
        (4, $$母____料理が上手な人はいない。$$, $$Não há ninguém que cozinhe tão bem quanto minha mãe.$$),
        (5, $$疲れて、もう一歩も歩けない____だ。$$, $$Estou tão cansado que não consigo dar mais nem um passo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-53', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くらい$$),
        (1, $$ぐらい$$),
        (2, $$くらい$$),
        (2, $$ぐらい$$),
        (3, $$くらい$$),
        (3, $$ぐらい$$),
        (4, $$くらい$$),
        (4, $$ぐらい$$),
        (5, $$くらい$$),
        (5, $$ぐらい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-54 — 〜くせに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-54',
    'grammar',
    'N3',
    $$〜くせに$$,
    $$kuse ni$$,
    $$Apesar de / Mesmo sendo / E ainda por cima$$,
    $$くせに é usado para criticar ou reclamar de alguém cujo comportamento não combina com a situação. Equivale a "apesar de", "mesmo sendo" ou "e ainda por cima".

A primeira parte apresenta um fato sobre a pessoa, e a segunda mostra uma atitude que contradiz esse fato e que irrita quem fala. Por exemplo, "ele sabe, mas não me conta" ou "não faz nada e ainda reclama".

O tom é sempre de crítica, desprezo ou irritação. Por isso, くせに é bem mais forte e emocional que のに.

Ele vem depois da forma simples de verbos e adjetivos. Com adjetivos な, usa-se な, e com substantivos, の.

O sujeito das duas partes precisa ser o mesmo, e geralmente não é quem fala.$$,
    $$Por ser crítico, くせに pode soar ofensivo. Deve ser usado com cuidado, principalmente com pessoas que não são próximas.

No final da frase, くせに sozinho expressa uma reclamação incompleta, como "e ainda por cima...!".

A palavra 癖 (くせ) sozinha significa "mania" ou "hábito".$$,
    $$Verbo / Adjetivo い (forma simples) + くせに
Adjetivo な + な + くせに
Substantivo + の + くせに

Escrita: くせに / 癖に$$,
    $$くせに$$,
    $$くせに|癖に$$,
    ARRAY['くせ', 'に']::text[],
    ARRAY['くせに', '癖に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-54', $$彼は答えを知っているくせに、教えてくれない。$$, $$かれはこたえをしっているくせに、おしえてくれない。$$, $$Ele sabe a resposta e mesmo assim não me conta.$$),
    ('n3-grammar-54', $$子供のくせに、生意気なことを言う。$$, $$こどものくせに、なまいきなことをいう。$$, $$É só uma criança e já fala com arrogância.$$),
    ('n3-grammar-54', $$自分は何もしないくせに、文句ばかり言う。$$, $$じぶんはなにもしないくせに、もんくばかりいう。$$, $$Não faz nada e ainda vive reclamando.$$),
    ('n3-grammar-54', $$下手なくせに、いつも自慢している。$$, $$へたなくせに、いつもじまんしている。$$, $$É ruim nisso e ainda vive se gabando.$$),
    ('n3-grammar-54', $$お金がないくせに、高い物ばかり買う。$$, $$おかねがないくせに、たかいものばかりかう。$$, $$Não tem dinheiro e ainda só compra coisa cara.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は太っている____、甘い物ばかり食べる。$$, $$Ele está acima do peso e ainda só come doce.$$),
        (2, $$自分が悪い____、謝らない。$$, $$A culpa é dele e mesmo assim não pede desculpas.$$),
        (3, $$学生の____、全然勉強しない。$$, $$É estudante e não estuda nada.$$),
        (4, $$本当は好きな____、嫌いなふりをしている。$$, $$No fundo gosta e mesmo assim finge que não gosta.$$),
        (5, $$一度も行ったことがない____、知っているように話す。$$, $$Nunca foi lá e mesmo assim fala como se conhecesse.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-54', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くせに$$),
        (2, $$くせに$$),
        (3, $$くせに$$),
        (4, $$くせに$$),
        (5, $$くせに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-55 — まるで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-55',
    'grammar',
    'N3',
    $$まるで$$,
    $$marude$$,
    $$Como se / Parecia até / Igualzinho a$$,
    $$まるで é um advérbio usado em comparações para dizer que algo se parece muito com outra coisa, mesmo não sendo. Equivale a "como se", "parecia até" ou "igualzinho a".

Ele quase sempre aparece junto com ようだ, ような, ように, みたいだ ou みたいに, reforçando a comparação.

Por exemplo, "ela parece até uma boneca", "este quadro parece uma foto" ou "parece que estou sonhando".

A ideia é de uma semelhança muito forte, quase total. Por isso, まるで é usado para descrições vivas, exageros e impressões marcantes.

Com a forma negativa, まるで〜ない significa "nem um pouco", "de jeito nenhum", com sentido parecido a 全然〜ない.$$,
    $$まるで reforça comparações; sozinho, sem ようだ ou みたいだ, ele soa incompleto no uso de "como se".

No uso negativo, まるで〜ない é um pouco mais expressivo que 全然〜ない: まるでわからない (não entendo absolutamente nada).

É muito comum em descrições de histórias, filmes e paisagens.$$,
    $$まるで + Substantivo + の + ようだ / ような / ように
まるで + Substantivo + みたいだ / みたいな / みたいに
まるで + Frase (forma simples) + ようだ / みたいだ
まるで + Frase negativa (nem um pouco)$$,
    $$まるで$$,
    $$まるで$$,
    ARRAY['まるで']::text[],
    ARRAY['まるで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-55', $$彼女はまるで人形のようだ。$$, $$かのじょはまるでにんぎょうのようだ。$$, $$Ela parece até uma boneca.$$),
    ('n3-grammar-55', $$今日はまるで夏みたいに暑い。$$, $$きょうはまるでなつみたいにあつい。$$, $$Hoje está quente como se fosse verão.$$),
    ('n3-grammar-55', $$彼はまるで何も知らないような顔をした。$$, $$かれはまるでなにもしらないようなかおをした。$$, $$Ele fez uma cara como se não soubesse de nada.$$),
    ('n3-grammar-55', $$この絵はまるで写真のようだ。$$, $$このえはまるでしゃしんのようだ。$$, $$Este quadro parece até uma foto.$$),
    ('n3-grammar-55', $$こんなにうれしいことがあるなんて、まるで夢を見ているみたいだ。$$, $$こんなにうれしいことがあるなんて、まるでゆめをみているみたいだ。$$, $$Algo tão bom assim acontecer parece até que estou sonhando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の日本語は____日本人のようだ。$$, $$O japonês dele é igualzinho ao de um japonês.$$),
        (2, $$この部屋は____ホテルみたいにきれいだ。$$, $$Este quarto está limpo como se fosse um hotel.$$),
        (3, $$彼は____王様のように振る舞う。$$, $$Ele se comporta como se fosse um rei.$$),
        (4, $$彼女は____雪のように白い肌をしている。$$, $$Ela tem a pele branca como a neve.$$),
        (5, $$二人は____本当の兄弟のように仲がいい。$$, $$Os dois se dão tão bem que parecem irmãos de verdade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-55', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まるで$$),
        (2, $$まるで$$),
        (3, $$まるで$$),
        (4, $$まるで$$),
        (5, $$まるで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-56 — まさか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-56',
    'grammar',
    'N3',
    $$まさか$$,
    $$masaka$$,
    $$Não pode ser / Jamais imaginei que / Será possível$$,
    $$まさか é usado para expressar forte surpresa ou descrença diante de algo inesperado. Equivale a "não pode ser!", "jamais imaginei que..." ou "será possível?".

Ele tem dois usos principais. O primeiro é com とは思わなかった ou なんて, para dizer que algo que aconteceu era totalmente inesperado: "jamais imaginei que ele fosse o culpado".

O segundo é para negar a possibilidade de algo, com はずがない ou ないだろう: "não é possível que...".

Sozinho, como reação, まさか! significa "não acredito!" ou "não pode ser!".

O tom é emocional e mostra que a pessoa achava aquilo improvável ou impossível.$$,
    $$A expressão まさかの + Substantivo, como まさかの結果, significa "um resultado inesperado" e é comum em manchetes.

Em situações de emergência, まさかの時 significa "em caso de imprevisto".

まさか tem um tom parecido com "você está brincando?" em conversas informais.$$,
    $$まさか + Frase + とは思わなかった (jamais imaginei)
まさか + Frase + なんて (não acredito que...)
まさか + … + はずがない / ないだろう (não é possível que)
まさか！ (reação: não pode ser!)$$,
    $$まさか$$,
    $$まさか$$,
    ARRAY['まさか']::text[],
    ARRAY['まさか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-56', $$まさか彼が犯人だとは思わなかった。$$, $$まさかかれがはんにんだとはおもわなかった。$$, $$Jamais imaginei que ele fosse o culpado.$$),
    ('n3-grammar-56', $$まさか、そんなはずはない。$$, $$まさか、そんなはずはない。$$, $$Não pode ser, isso não é possível.$$),
    ('n3-grammar-56', $$まさか一位になるとは思わなかった。$$, $$まさかいちいになるとはおもわなかった。$$, $$Nunca imaginei que fosse ficar em primeiro lugar.$$),
    ('n3-grammar-56', $$「彼、会社をやめたよ。」「まさか！」$$, $$「かれ、かいしゃをやめたよ。」「まさか！」$$, $$"Ele saiu da empresa." "Não acredito!"$$),
    ('n3-grammar-56', $$まさか雨が降るなんて、思っていなかった。$$, $$まさかあめがふるなんて、おもっていなかった。$$, $$Jamais pensei que fosse chover.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____こんなところで会うとは思わなかった。$$, $$Jamais imaginei que fosse te encontrar num lugar destes.$$),
        (2, $$「田中さんが結婚したって。」「____！」$$, $$"Dizem que o Tanaka se casou." "Não pode ser!"$$),
        (3, $$あんなに勉強したのに、____試験に落ちるとは思わなかった。$$, $$Estudei tanto que jamais imaginei que fosse ser reprovado.$$),
        (4, $$____あの優しい人がそんなことを言うはずがない。$$, $$Não é possível que aquela pessoa tão gentil tenha dito isso.$$),
        (5, $$____宝くじが当たるなんて、信じられない。$$, $$Ganhar na loteria? Não dá para acreditar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-56', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まさか$$),
        (2, $$まさか$$),
        (3, $$まさか$$),
        (4, $$まさか$$),
        (5, $$まさか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-57 — めったに〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-57',
    'grammar',
    'N3',
    $$めったに〜ない$$,
    $$metta ni ~ nai$$,
    $$Raramente / Quase nunca$$,
    $$めったに〜ない é usado para dizer que algo acontece muito raramente. Equivale a "raramente" ou "quase nunca".

めったに vem antes do verbo, e o verbo fica sempre na forma negativa. Sem a negação, a frase fica errada.

Ele indica uma frequência muito baixa, menor do que あまり〜ない ("não muito"). Por exemplo, "meu pai quase nunca fica bravo" ou "aqui quase nunca neva".

A expressão めったにない também é usada para dizer que algo é raro e valioso, como uma oportunidade que quase nunca aparece.$$,
    $$Comparando a frequência: いつも (sempre) > よく (com frequência) > 時々 (às vezes) > あまり〜ない (não muito) > めったに〜ない (quase nunca) > 全然〜ない (nunca).

めったにないチャンス (uma oportunidade rara) é uma expressão muito comum.

O kanji 滅多 é pouco usado no dia a dia; o mais comum é escrever em hiragana.$$,
    $$めったに + Verbo na forma negativa
めったに + ない (raro, difícil de acontecer)
めったにない + Substantivo (algo raro)

Escrita: めったに / 滅多に$$,
    $$めったに$$,
    $$めったに|滅多に$$,
    ARRAY['めったに', 'ない']::text[],
    ARRAY['めったに', '滅多に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-57', $$父はめったに怒らない。$$, $$ちちはめったにおこらない。$$, $$Meu pai quase nunca fica bravo.$$),
    ('n3-grammar-57', $$この辺では、めったに雪が降りません。$$, $$このへんでは、めったにゆきがふりません。$$, $$Por aqui, raramente neva.$$),
    ('n3-grammar-57', $$彼女はめったに会社を休まない。$$, $$かのじょはめったにかいしゃをやすまない。$$, $$Ela quase nunca falta ao trabalho.$$),
    ('n3-grammar-57', $$こんなチャンスはめったにない。$$, $$こんなチャンスはめったにない。$$, $$Uma oportunidade dessas é muito rara.$$),
    ('n3-grammar-57', $$最近は忙しくて、めったに映画を見に行かない。$$, $$さいきんはいそがしくて、めったにえいがをみにいかない。$$, $$Ultimamente estou ocupado e quase nunca vou ao cinema.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$兄は____電話をくれない。$$, $$Meu irmão mais velho quase nunca me liga.$$),
        (2, $$この店は____休まない。$$, $$Esta loja quase nunca fecha.$$),
        (3, $$彼は体が強くて、____病気にならない。$$, $$Ele é muito saudável e quase nunca fica doente.$$),
        (4, $$東京では、____星が見えない。$$, $$Em Tóquio, quase nunca dá para ver estrelas.$$),
        (5, $$私は____お酒を飲みません。$$, $$Eu raramente bebo álcool.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-57', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$めったに$$),
        (2, $$めったに$$),
        (3, $$めったに$$),
        (4, $$めったに$$),
        (5, $$めったに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-58 — 〜も〜ば〜も
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-58',
    'grammar',
    'N3',
    $$〜も〜ば〜も$$,
    $$mo ~ ba ~ mo$$,
    $$Tanto... quanto... / Não só... como também...$$,
    $$も〜ば〜も é usado para listar duas características ou situações, mostrando que as duas são verdadeiras. Equivale a "tanto... quanto..." ou "não só... como também...".

A estrutura usa も duas vezes e ば no meio: "A も + verbo ば、B も + verbo". Por exemplo, "ele fala tanto inglês quanto francês".

Ela tem dois usos principais. O primeiro é somar qualidades ou fatos, como alguém que é bom em várias coisas. O segundo é mostrar que existem situações diferentes ou opostas, como "na vida há momentos bons e também momentos ruins".

Com ある e いる, a forma もあれば〜もある e もいれば〜もいる é muito comum para falar de variedade.$$,
    $$A forma いい時もあれば、悪い時もある é uma expressão quase fixa sobre os altos e baixos da vida.

Essa estrutura é um pouco mais formal e expressiva que simplesmente usar も〜も.

É comum em textos que descrevem diversidade, como opiniões diferentes entre as pessoas.$$,
    $$A + も + Verbo ば、 + B + も + Verbo
A + も + あれば、 + B + も + ある
A + も + いれば、 + B + も + いる
A + も + Adjetivo な + なら、 + B + も + Adjetivo な + だ$$,
    $$も$$,
    $$も$$,
    ARRAY['も', 'ば', 'も']::text[],
    ARRAY['も〜ば〜も', 'もあれば〜もある', 'もいれば〜もいる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-58', $$彼は英語も話せば、フランス語も話せる。$$, $$かれはえいごもはなせば、フランスごもはなせる。$$, $$Ele fala tanto inglês quanto francês.$$),
    ('n3-grammar-58', $$この部屋は広さもあれば、日当たりもいい。$$, $$このへやはひろさもあれば、ひあたりもいい。$$, $$Este quarto não só é espaçoso, como também tem boa luz do sol.$$),
    ('n3-grammar-58', $$人生にはいい時もあれば、悪い時もある。$$, $$じんせいにはいいときもあれば、わるいときもある。$$, $$Na vida há momentos bons e também momentos ruins.$$),
    ('n3-grammar-58', $$彼女は歌も上手なら、ダンスも上手だ。$$, $$かのじょはうたもじょうずなら、ダンスもじょうずだ。$$, $$Ela canta bem e também dança bem.$$),
    ('n3-grammar-58', $$外は雨も降れば、風も吹いている。$$, $$そとはあめもふれば、かぜもふいている。$$, $$Lá fora está chovendo e ventando também.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は料理____すれば、掃除もする。$$, $$Ele tanto cozinha quanto limpa a casa.$$),
        (2, $$晴れる日もあれば、雨の日____ある。$$, $$Há dias de sol e também dias de chuva.$$),
        (3, $$この意見に賛成する人もいれば、反対する人____いる。$$, $$Há quem concorde com esta opinião e também há quem discorde.$$),
        (4, $$この町は海____あれば、山もある。$$, $$Esta cidade tem tanto mar quanto montanha.$$),
        (5, $$彼女は頭____よければ、性格もいい。$$, $$Ela é inteligente e também tem um ótimo caráter.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-58', sentence, translation FROM src ORDER BY k
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

-- n3-grammar-59 — もしかしたら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-59',
    'grammar',
    'N3',
    $$もしかしたら$$,
    $$moshika shitara$$,
    $$Talvez / Pode ser que / Será que$$,
    $$もしかしたら é usado para indicar uma possibilidade, sem certeza. Equivale a "talvez" ou "pode ser que".

Ele fica no começo da frase e quase sempre aparece junto com かもしれない no final, reforçando a ideia de dúvida.

Por exemplo, "talvez amanhã chova" ou "pode ser que ele já tenha ido embora".

A forma もしかすると tem o mesmo sentido e soa um pouco mais formal. A forma もしかして é usada principalmente em perguntas, quando a pessoa suspeita de algo e quer confirmar: "por acaso você é o Tanaka?".$$,
    $$もしかして é muito útil para perguntar algo com delicadeza, sem afirmar diretamente, como ao reconhecer alguém.

Na fala casual, もしかしたら pode ser reduzido para もしかしたら… sozinho, deixando a frase em aberto.

Essas expressões indicam uma possibilidade baixa ou média. Para algo mais provável, usa-se たぶん.$$,
    $$もしかしたら + … + かもしれない
もしかすると + … + かもしれない (um pouco mais formal)
もしかして + … + ですか / の？ (pergunta: por acaso...?)$$,
    $$もしかしたら$$,
    $$もしかしたら|もしかすると|もしかして$$,
    ARRAY['もしかしたら']::text[],
    ARRAY['もしかしたら', 'もしかすると', 'もしかして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-59', $$空が暗いから、もしかしたら、明日は雨かもしれない。$$, $$そらがくらいから、もしかしたら、あしたはあめかもしれない。$$, $$O céu está escuro, talvez chova amanhã.$$),
    ('n3-grammar-59', $$電気が消えている。もしかしたら、彼はもう帰ったかもしれません。$$, $$でんきがきえている。もしかしたら、かれはもうかえったかもしれません。$$, $$As luzes estão apagadas. Pode ser que ele já tenha ido embora.$$),
    ('n3-grammar-59', $$もしかすると、この話は本当かもしれない。$$, $$もしかすると、このはなしはほんとうかもしれない。$$, $$Talvez esta história seja verdade.$$),
    ('n3-grammar-59', $$すみません、もしかして、田中さんですか。$$, $$すみません、もしかして、たなかさんですか。$$, $$Com licença, por acaso o senhor é o Tanaka?$$),
    ('n3-grammar-59', $$頑張れば、もしかしたら、試験に合格できるかもしれない。$$, $$がんばれば、もしかしたら、しけんにごうかくできるかもしれない。$$, $$Se eu me esforçar, talvez consiga passar na prova.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、明日行けないかもしれません。$$, $$Talvez eu não possa ir amanhã.$$),
        (2, $$____、彼女は風邪をひいたのかもしれない。$$, $$Pode ser que ela tenha pegado um resfriado.$$),
        (3, $$____、財布は家にあるかもしれない。$$, $$Talvez a carteira esteja em casa.$$),
        (4, $$____、この答えは間違っているかもしれない。$$, $$Pode ser que esta resposta esteja errada.$$),
        (5, $$雪がひどいから、____、今日は電車が遅れるかもしれない。$$, $$A neve está forte, então talvez o trem atrase hoje.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-59', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もしかしたら$$),
        (1, $$もしかすると$$),
        (2, $$もしかしたら$$),
        (2, $$もしかすると$$),
        (3, $$もしかしたら$$),
        (3, $$もしかすると$$),
        (4, $$もしかしたら$$),
        (4, $$もしかすると$$),
        (5, $$もしかしたら$$),
        (5, $$もしかすると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-60 — もしも〜たら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-60',
    'grammar',
    'N3',
    $$もしも〜たら$$,
    $$moshimo ~ tara$$,
    $$Se por acaso / Caso / Na hipótese de$$,
    $$もしも〜たら é usado para falar de uma hipótese, uma situação imaginada ou pouco provável. Equivale a "se por acaso", "caso" ou "na hipótese de".

もしも é uma forma mais enfática de もし. Ele fica no começo da frase e reforça que aquela condição é apenas uma suposição.

A condição vem normalmente com たら, mas também pode vir com ば, なら ou と.

É usado para planos de emergência ("se por acaso houver um terremoto..."), sonhos e fantasias ("se eu ganhasse na loteria...") e situações contrárias à realidade ("se eu fosse um pássaro...").

A expressão もしもの時 significa "em caso de emergência" ou "se algo acontecer".$$,
    $$もしもし, usado ao atender o telefone, tem origem parecida, mas é uma expressão diferente.

もし e もしも podem ser trocados na maioria dos casos. もしも soa um pouco mais enfático ou dramático.

Em frases contrárias à realidade, é comum terminar com のに, expressando desejo ou pena.$$,
    $$もしも + … + たら / ば / なら
もしもの + 時 / 場合 (em caso de emergência)

Mais simples: もし + … + たら$$,
    $$もしも$$,
    $$もしも|もし$$,
    ARRAY['もしも', 'たら']::text[],
    ARRAY['もしも', 'もし']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-60', $$もしも宝くじが当たったら、家を買いたい。$$, $$もしもたからくじがあたったら、いえをかいたい。$$, $$Se por acaso eu ganhasse na loteria, queria comprar uma casa.$$),
    ('n3-grammar-60', $$もしも明日雨が降ったら、試合は中止です。$$, $$もしもあしたあめがふったら、しあいはちゅうしです。$$, $$Caso chova amanhã, a partida será cancelada.$$),
    ('n3-grammar-60', $$もしも地震が起きたら、机の下に入ってください。$$, $$もしもじしんがおきたら、つくえのしたにはいってください。$$, $$Se por acaso houver um terremoto, entre embaixo da mesa.$$),
    ('n3-grammar-60', $$もしも私が鳥だったら、空を飛べるのに。$$, $$もしもわたしがとりだったら、そらをとべるのに。$$, $$Se eu fosse um pássaro, poderia voar pelo céu.$$),
    ('n3-grammar-60', $$もしもの時は、この番号に電話してください。$$, $$もしものときは、このばんごうにでんわしてください。$$, $$Em caso de emergência, ligue para este número.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____道に迷ったら、電話してね。$$, $$Se por acaso se perder, me ligue, tá?$$),
        (2, $$____一億円あったら、何をしますか。$$, $$Se você tivesse cem milhões de ienes, o que faria?$$),
        (3, $$____明日晴れたら、ピクニックに行こう。$$, $$Se amanhã fizer sol, vamos fazer um piquenique.$$),
        (4, $$____の時のために、お金を貯めている。$$, $$Estou guardando dinheiro para alguma emergência.$$),
        (5, $$____私が社長だったら、休みを増やす。$$, $$Se eu fosse o presidente, aumentaria as folgas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-60', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もしも$$),
        (1, $$もし$$),
        (2, $$もしも$$),
        (2, $$もし$$),
        (3, $$もしも$$),
        (3, $$もし$$),
        (4, $$もしも$$),
        (5, $$もしも$$),
        (5, $$もし$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-61 — 〜向け
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-61',
    'grammar',
    'N3',
    $$〜向け$$,
    $$muke$$,
    $$Para / Destinado a / Voltado para$$,
    $$向け é usado para dizer que algo foi feito ou planejado especialmente para um público ou destino específico. Equivale a "para", "destinado a" ou "voltado para".

Ele vem diretamente depois de um substantivo que indica o público ou o destino, como crianças, jovens, estrangeiros, iniciantes ou um país.

Antes de outro substantivo, usa-se 向けの: 子供向けの本 (livro para crianças). Antes de um verbo, usa-se 向けに: 若者向けに作られた (feito para jovens).

A ideia é de intenção: quem criou o produto ou serviço pensou naquele público desde o início.$$,
    $$A diferença entre 向け e 向き é importante. 向け indica para quem algo foi feito, de propósito. 向き indica para quem algo é adequado, mesmo que não tenha sido feito pensando nisso.

Em lojas e propagandas, expressões como 女性向け e 初心者向け são muito comuns.

Com destinos geográficos, 向け também indica exportação: 海外向けの商品 (produtos para o exterior).$$,
    $$Substantivo (público / destino) + 向け + の + Substantivo
Substantivo + 向け + に + Verbo
Substantivo + 向け + だ / です$$,
    $$向け$$,
    $$向け$$,
    ARRAY['向け']::text[],
    ARRAY['向け', '向けの', '向けに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-61', $$これは子供向けの本です。$$, $$これはこどもむけのほんです。$$, $$Este é um livro para crianças.$$),
    ('n3-grammar-61', $$この番組は若者向けに作られた。$$, $$このばんぐみはわかものむけにつくられた。$$, $$Este programa foi feito para os jovens.$$),
    ('n3-grammar-61', $$この町には外国人向けの日本語教室がある。$$, $$このまちにはがいこくじんむけのにほんごきょうしつがある。$$, $$Nesta cidade há aulas de japonês para estrangeiros.$$),
    ('n3-grammar-61', $$初心者向けのパソコン教室に通っている。$$, $$しょしんしゃむけのパソコンきょうしつにかよっている。$$, $$Estou fazendo um curso de computação para iniciantes.$$),
    ('n3-grammar-61', $$この商品はアジア向けに輸出されている。$$, $$このしょうひんはアジアむけにゆしゅつされている。$$, $$Este produto é exportado para a Ásia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$これは高齢者____の雑誌です。$$, $$Esta é uma revista voltada para idosos.$$),
        (2, $$女性____に新しい車が発売された。$$, $$Foi lançado um carro novo voltado para mulheres.$$),
        (3, $$留学生____の奨学金に申し込んだ。$$, $$Me inscrevi numa bolsa de estudos para estudantes estrangeiros.$$),
        (4, $$この映画は大人____だ。$$, $$Este filme é para adultos.$$),
        (5, $$この工場では、海外____の商品を作っている。$$, $$Esta fábrica produz itens destinados ao exterior.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-61', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$向け$$),
        (2, $$向け$$),
        (3, $$向け$$),
        (4, $$向け$$),
        (5, $$向け$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-62 — 〜向き
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-62',
    'grammar',
    'N3',
    $$〜向き$$,
    $$muki$$,
    $$Adequado para / Apropriado para / Virado para$$,
    $$向き é usado para dizer que algo é adequado ou combina com certo público, uso ou pessoa. Equivale a "adequado para" ou "apropriado para".

Ele vem diretamente depois de um substantivo. Antes de outro substantivo, usa-se 向きの, e no final da frase, 向きだ.

A diferença em relação a 向け é sutil, mas importante. 向け indica para quem algo foi feito de propósito. 向き indica que algo é adequado para alguém, pelas suas características, mesmo que não tenha sido criado pensando nisso.

Também pode descrever pessoas: dizer que alguém é "talhado para" uma profissão, por causa da personalidade.

Com direções, como 南向き, significa "virado para": um quarto virado para o sul.$$,
    $$Para dizer que uma pessoa tem aptidão para algo, também se usa o verbo 向いている: この仕事に向いている.

Em anúncios de imóveis, 南向き (virado para o sul) é um ponto muito valorizado no Japão, porque recebe mais sol.

向き também significa "direção" ou "orientação" em geral, como em 風の向き (direção do vento).$$,
    $$Substantivo + 向き + の + Substantivo
Substantivo + 向き + だ / です
Substantivo + 向き + ではない (não é adequado para)
Direção + 向き (virado para: 南向き / 東向き)$$,
    $$向き$$,
    $$向き$$,
    ARRAY['向き']::text[],
    ARRAY['向き', '向きの', '向きだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-62', $$この料理は甘くて、子供向きの味だ。$$, $$このりょうりはあまくて、こどもむきのあじだ。$$, $$Esta comida é doce, com um sabor bom para crianças.$$),
    ('n3-grammar-62', $$この部屋は狭いので、一人暮らし向きだ。$$, $$このへやはせまいので、ひとりぐらしむきだ。$$, $$Este apartamento é pequeno, então é bom para quem mora sozinho.$$),
    ('n3-grammar-62', $$彼は人と話すのが好きだから、営業向きだ。$$, $$かれはひととはなすのがすきだから、えいぎょうむきだ。$$, $$Ele gosta de conversar com as pessoas, então tem perfil para vendas.$$),
    ('n3-grammar-62', $$このコースは難しいので、初心者向きではない。$$, $$このコースはむずかしいので、しょしんしゃむきではない。$$, $$Este curso é difícil, então não é adequado para iniciantes.$$),
    ('n3-grammar-62', $$南向きの部屋は明るい。$$, $$みなみむきのへやはあかるい。$$, $$Quartos virados para o sul são claros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この靴は山登り____ではない。$$, $$Estes sapatos não são adequados para escalar montanhas.$$),
        (2, $$この本は簡単で、初心者____です。$$, $$Este livro é fácil e adequado para iniciantes.$$),
        (3, $$静かで真面目な彼は、研究者____だ。$$, $$Ele, que é quieto e sério, tem perfil de pesquisador.$$),
        (4, $$このアパートは家族____の広さだ。$$, $$Este apartamento tem um tamanho adequado para famílias.$$),
        (5, $$東____の窓から朝日が入る。$$, $$O sol da manhã entra pela janela virada para o leste.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-62', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$向き$$),
        (2, $$向き$$),
        (3, $$向き$$),
        (4, $$向き$$),
        (5, $$向き$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-63 — むしろ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-63',
    'grammar',
    'N3',
    $$むしろ$$,
    $$mushiro$$,
    $$Pelo contrário / Na verdade / Antes / Até$$,
    $$むしろ é usado para dizer que, entre duas opções ou interpretações, a segunda é mais verdadeira ou mais adequada. Equivale a "pelo contrário", "na verdade", "antes" ou "até".

Ele aparece quando a realidade é diferente do que se esperava, ou quando se corrige uma ideia. Por exemplo, "ele não ficou bravo. Pelo contrário, ficou feliz" ou "o remédio, em vez de ajudar, até piorou".

Também é usado em comparações, com より, para indicar preferência: "prefiro, na verdade, o inverno ao verão".

Com ではなく ou というより, むしろ corrige uma descrição: "não é algo ruim, é, na verdade, uma boa experiência".$$,
    $$むしろ é um pouco mais formal que どちらかというと, que também indica preferência suave.

Muitas vezes, むしろ surpreende o ouvinte, porque traz uma ideia oposta à esperada.

Em textos argumentativos, むしろ é usado para apresentar um ponto de vista diferente do senso comum.$$,
    $$A + より + むしろ + B + の方が + …
A + ではなく、 + むしろ + B
A + というより、 + むしろ + B
Frase 1 (com ponto final) + むしろ + Frase 2$$,
    $$むしろ$$,
    $$むしろ$$,
    ARRAY['むしろ']::text[],
    ARRAY['むしろ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-63', $$彼は怒っていなかった。むしろ喜んでいた。$$, $$かれはおこっていなかった。むしろよろこんでいた。$$, $$Ele não estava bravo. Pelo contrário, estava feliz.$$),
    ('n3-grammar-63', $$夏より、むしろ冬のほうが好きだ。$$, $$なつより、むしろふゆのほうがすきだ。$$, $$Na verdade, gosto mais do inverno do que do verão.$$),
    ('n3-grammar-63', $$薬を飲んだら、むしろ悪くなった。$$, $$くすりをのんだら、むしろわるくなった。$$, $$Tomei o remédio e, em vez de melhorar, até piorei.$$),
    ('n3-grammar-63', $$失敗は悪いことではなく、むしろいい経験だ。$$, $$しっぱいはわるいことではなく、むしろいいけいけんだ。$$, $$Errar não é algo ruim; pelo contrário, é uma boa experiência.$$),
    ('n3-grammar-63', $$彼は先生というより、むしろ友達のような存在だ。$$, $$かれはせんせいというより、むしろともだちのようなそんざいだ。$$, $$Ele é menos um professor e mais um amigo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大勢でいるより、一人でいるほうが、____楽だ。$$, $$Ficar sozinho é, na verdade, mais confortável do que estar com muita gente.$$),
        (2, $$この映画は子供より、____大人に人気がある。$$, $$Este filme é, na verdade, mais popular entre os adultos do que entre as crianças.$$),
        (3, $$休んだら、____疲れてしまった。$$, $$Descansei e, pelo contrário, fiquei mais cansado.$$),
        (4, $$彼の意見は反対ではなく、____賛成に近い。$$, $$A opinião dele não é contra; na verdade, está mais para a favor.$$),
        (5, $$都会より、____田舎に住みたい。$$, $$Na verdade, prefiro morar no interior do que na cidade grande.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-63', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$むしろ$$),
        (2, $$むしろ$$),
        (3, $$むしろ$$),
        (4, $$むしろ$$),
        (5, $$むしろ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-64 — 〜ながらも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-64',
    'grammar',
    'N3',
    $$〜ながらも$$,
    $$nagara mo$$,
    $$Apesar de / Embora / Mesmo sendo$$,
    $$ながらも é usado para expressar contraste: apesar de uma situação, acontece algo que não se esperaria. Equivale a "apesar de", "embora" ou "mesmo sendo".

Esse uso de ながら é diferente do ながら do N4, que indica duas ações ao mesmo tempo. Aqui, a ideia é de concessão: "mesmo sendo assim, ...".

Ele vem depois do verbo na forma ます sem ます, de adjetivos い, de adjetivos な (sem な) e de substantivos.

Por exemplo, "apesar de pobre, vive feliz" ou "mesmo sabendo que era errado, menti".

A forma com も (ながらも) reforça o contraste. A forma sem も (ながら) também é usada, principalmente em expressões fixas como 残念ながら (infelizmente).$$,
    $$Com verbos, ながらも aparece muito com verbos de estado, como 知る, わかる e いる: 知りながらも (mesmo sabendo).

Expressões fixas como 残念ながら (infelizmente) e 恥ずかしながら (com vergonha, confesso que...) vêm desse uso.

ながらも soa um pouco mais formal e literário que のに ou けど.$$,
    $$Verbo na forma ます sem ます + ながらも
Adjetivo い + ながらも
Adjetivo な (sem な) + ながらも
Substantivo + ながらも

Forma curta: ながら (残念ながら / 狭いながら)$$,
    $$ながらも$$,
    $$ながらも|ながら$$,
    ARRAY['ながら', 'も']::text[],
    ARRAY['ながらも', 'ながら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-64', $$彼は貧しいながらも、幸せに暮らしている。$$, $$かれはまずしいながらも、しあわせにくらしている。$$, $$Apesar de pobre, ele vive feliz.$$),
    ('n3-grammar-64', $$狭いながらも、楽しい我が家だ。$$, $$せまいながらも、たのしいわがやだ。$$, $$Embora pequena, é a nossa casa querida.$$),
    ('n3-grammar-64', $$悪いと知りながらも、うそをついてしまった。$$, $$わるいとしりながらも、うそをついてしまった。$$, $$Mesmo sabendo que era errado, acabei mentindo.$$),
    ('n3-grammar-64', $$子供ながらも、彼はしっかりしている。$$, $$こどもながらも、かれはしっかりしている。$$, $$Mesmo sendo criança, ele é bem responsável.$$),
    ('n3-grammar-64', $$少しずつながらも、日本語が上達している。$$, $$すこしずつながらも、にほんごがじょうたつしている。$$, $$Embora aos poucos, meu japonês está melhorando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は疲れてい____、笑顔で働いていた。$$, $$Apesar de cansada, ela trabalhava sorrindo.$$),
        (2, $$小さい____、きれいな庭がある。$$, $$Embora pequeno, há um jardim bonito.$$),
        (3, $$危ないとわかってい____、彼は行ってしまった。$$, $$Mesmo sabendo que era perigoso, ele foi.$$),
        (4, $$残念____、今回は参加できません。$$, $$Infelizmente, desta vez não poderei participar.$$),
        (5, $$狭い____、居心地のいい部屋だ。$$, $$Embora pequeno, é um quarto aconchegante.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-64', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ながらも$$),
        (2, $$ながらも$$),
        (3, $$ながらも$$),
        (4, $$ながら$$),
        (5, $$ながらも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-65 — 〜ないことはない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-65',
    'grammar',
    'N3',
    $$〜ないことはない$$,
    $$nai koto wa nai$$,
    $$Não é que não / Até dá para / Não é impossível$$,
    $$ないことはない é uma dupla negação usada para dizer que algo é possível, mas com hesitação ou limitação. Equivale a "não é que não...", "até dá para..." ou "não é impossível".

A ideia é uma afirmação fraca. Em vez de dizer simplesmente "consigo" ou "quero", a pessoa diz "não é que eu não consiga", deixando claro que há alguma dificuldade ou falta de entusiasmo.

Por exemplo, "não é que eu não consiga comer comida apimentada" (consigo, mas não gosto muito) ou "se correr, não é impossível chegar a tempo".

É muito usado com a forma potencial e com verbos de sentimento. Muitas vezes, a frase continua com が ou けど, explicando a limitação.$$,
    $$ないこともない soa ainda mais suave e hesitante que ないことはない.

Essa estrutura é útil para responder com honestidade, sem prometer demais.

Não confunda com ことはない (não precisa), que usa o verbo afirmativo.$$,
    $$Verbo na forma ない + ことはない
Verbo potencial negativo + ことはない
Adjetivo い sem い + くないことはない
Adjetivo な + じゃないことはない

Variações: ないこともない / なくはない$$,
    $$ないことはない$$,
    $$ないことはない|ないこともない|ないことはありません|なくはない$$,
    ARRAY['ない', 'こと', 'は', 'ない']::text[],
    ARRAY['ないことはない', 'ないこともない', 'なくはない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-65', $$辛い料理は食べられないことはない。$$, $$からいりょうりはたべられないことはない。$$, $$Não é que eu não consiga comer comida apimentada.$$),
    ('n3-grammar-65', $$今から急げば、間に合わないことはない。$$, $$いまからいそげば、まにあわないことはない。$$, $$Se nos apressarmos agora, não é impossível chegar a tempo.$$),
    ('n3-grammar-65', $$行きたくないことはないが、あまり時間がない。$$, $$いきたくないことはないが、あまりじかんがない。$$, $$Não é que eu não queira ir, mas não tenho muito tempo.$$),
    ('n3-grammar-65', $$この問題は難しいけど、できないことはない。$$, $$このもんだいはむずかしいけど、できないことはない。$$, $$Esta questão é difícil, mas não é impossível.$$),
    ('n3-grammar-65', $$お酒は飲まないこともないですが、あまり好きではありません。$$, $$おさけはのまないこともないですが、あまりすきではありません。$$, $$Não é que eu não beba, mas não gosto muito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日本語は話せ____が、上手ではない。$$, $$Não é que eu não fale japonês, mas não falo bem.$$),
        (2, $$今から行けば、間に合わ____。$$, $$Se for agora, até dá para chegar a tempo.$$),
        (3, $$一人でやれ____けど、手伝ってほしい。$$, $$Não é que eu não consiga fazer sozinho, mas queria ajuda.$$),
        (4, $$彼の気持ちもわから____。$$, $$Não é que eu não entenda os sentimentos dele.$$),
        (5, $$高いけど、買え____。$$, $$É caro, mas não é impossível de comprar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-65', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないことはない$$),
        (2, $$ないことはない$$),
        (2, $$ないこともない$$),
        (3, $$ないことはない$$),
        (4, $$ないことはない$$),
        (4, $$ないこともない$$),
        (5, $$ないことはない$$),
        (5, $$ないこともない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-66 — 〜ないと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-66',
    'grammar',
    'N3',
    $$〜ないと$$,
    $$nai to$$,
    $$Tenho que / Se não... / Senão$$,
    $$ないと tem dois usos principais.

O primeiro é condicional negativo: "se não fizer..., vai acontecer algo". A segunda parte mostra uma consequência, muitas vezes negativa, como um aviso. Por exemplo, "se não se apressar, vai se atrasar".

O segundo uso, muito comum na fala, é terminar a frase com ないと, deixando subentendido いけない. Assim, ないと sozinho significa "tenho que...". Por exemplo, "já tenho que ir embora" ou "tenho que dormir".

Ele é formado pela forma ない do verbo + と. É informal e muito usado entre amigos e família.$$,
    $$ないと sozinho no fim da frase é uma forma natural de lembrar a si mesmo de uma obrigação.

なきゃ e なくちゃ têm o mesmo sentido de "tenho que" e são igualmente casuais.

Em avisos, ないと〜よ dá um tom de alerta amigável.$$,
    $$Verbo na forma ない + と、 + Consequência (se não...)
Verbo na forma ない + と (fim de frase: tenho que...)
Verbo na forma ない + と + いけない (forma completa)

Variação casual: なきゃ$$,
    $$ないと$$,
    $$ないと|なきゃ$$,
    ARRAY['ない', 'と']::text[],
    ARRAY['ないと', 'ないといけない', 'なきゃ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-66', $$早くしないと、遅れるよ。$$, $$はやくしないと、おくれるよ。$$, $$Se não se apressar, vai se atrasar.$$),
    ('n3-grammar-66', $$あ、もう七時だ。帰らないと。$$, $$あ、もうしちじだ。かえらないと。$$, $$Ah, já são sete horas. Tenho que ir embora.$$),
    ('n3-grammar-66', $$ちゃんと勉強しないと、試験に落ちますよ。$$, $$ちゃんとべんきょうしないと、しけんにおちますよ。$$, $$Se não estudar direito, vai ser reprovado.$$),
    ('n3-grammar-66', $$傘を持っていかないと、濡れるよ。$$, $$かさをもっていかないと、ぬれるよ。$$, $$Se não levar o guarda-chuva, vai se molhar.$$),
    ('n3-grammar-66', $$明日は早いから、もう寝ないと。$$, $$あしたははやいから、もうねないと。$$, $$Amanhã acordo cedo, então tenho que ir dormir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$急が____、電車に間に合わない。$$, $$Se não me apressar, não chego a tempo para o trem.$$),
        (2, $$薬を飲ま____、治らないよ。$$, $$Se não tomar o remédio, não vai melhorar.$$),
        (3, $$もうこんな時間。帰ら____。$$, $$Já está tarde. Tenho que ir embora.$$),
        (4, $$ちゃんと食べ____、元気が出ないよ。$$, $$Se não comer direito, não vai ter energia.$$),
        (5, $$明日は旅行だ。準備をし____。$$, $$Amanhã é a viagem. Tenho que fazer as malas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-66', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないと$$),
        (2, $$ないと$$),
        (3, $$ないと$$),
        (3, $$なきゃ$$),
        (4, $$ないと$$),
        (5, $$ないと$$),
        (5, $$なきゃ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-67 — なかなか（肯定）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-67',
    'grammar',
    'N3',
    $$なかなか（肯定）$$,
    $$nakanaka (koutei)$$,
    $$Bastante / Bem / Muito (positivo)$$,
    $$Em frases afirmativas, なかなか significa "bastante", "bem" ou "muito". Ele indica que algo é melhor ou maior do que se esperava.

O tom costuma ser de elogio ou de avaliação positiva, às vezes com um pouco de surpresa. Por exemplo, "esta comida é bem gostosa" ou "o japonês dele é bastante bom".

Também pode descrever algo desafiador de forma objetiva, como "o novo trabalho é bem puxado".

Esse uso é diferente de なかなか〜ない (N4), que significa "custa a", "não... de jeito nenhum". A diferença está na frase: afirmativa = "bastante"; negativa = "custa a".

Um detalhe cultural: dizer なかなか a um superior pode soar como se você estivesse avaliando a pessoa de cima. Com superiores, é melhor usar elogios mais respeitosos.$$,
    $$A expressão なかなかやるね significa "você manda bem, hein" e é um elogio informal.

なかなかの + substantivo, como なかなかの腕前, significa "uma habilidade considerável".

Comparado a とても, なかなか soa um pouco mais reservado, como "melhor do que eu esperava".$$,
    $$なかなか + Adjetivo (afirmativo)
なかなか + Substantivo / Adjetivo な + だ
なかなかの + Substantivo (algo notável)
なかなか + Verbo (やる / できる)$$,
    $$なかなか$$,
    $$なかなか$$,
    ARRAY['なかなか']::text[],
    ARRAY['なかなか', 'なかなかの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-67', $$この料理はなかなかおいしいですね。$$, $$このりょうりはなかなかおいしいですね。$$, $$Esta comida é bem gostosa, hein.$$),
    ('n3-grammar-67', $$彼の日本語はなかなか上手だ。$$, $$かれのにほんごはなかなかじょうずだ。$$, $$O japonês dele é bastante bom.$$),
    ('n3-grammar-67', $$昨日の映画はなかなかおもしろかった。$$, $$きのうのえいがはなかなかおもしろかった。$$, $$O filme de ontem foi bem interessante.$$),
    ('n3-grammar-67', $$新しい仕事はなかなか大変です。$$, $$あたらしいしごとはなかなかたいへんです。$$, $$O novo trabalho é bem puxado.$$),
    ('n3-grammar-67', $$一人で全部作ったの？君もなかなかやるね。$$, $$ひとりでぜんぶつくったの？きみもなかなかやるね。$$, $$Você fez tudo sozinho? Você manda bem, hein.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この本は____おもしろい。$$, $$Este livro é bem interessante.$$),
        (2, $$初めてにしては、____上手ですね。$$, $$Para a primeira vez, está bem bom, hein.$$),
        (3, $$この問題は____難しいですね。$$, $$Esta questão é bem difícil, né?$$),
        (4, $$会議で、彼女は____いいアイデアを出した。$$, $$Na reunião, ela deu uma ideia bem boa.$$),
        (5, $$あの店のラーメンは____のものだ。$$, $$O ramen daquela loja é algo notável.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-67', sentence, translation FROM src ORDER BY k
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

-- n3-grammar-68 — 〜なんか・〜なんて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-68',
    'grammar',
    'N3',
    $$〜なんか・〜なんて$$,
    $$nanka / nante$$,
    $$Coisas como / Tipo / Uma coisa dessas$$,
    $$なんか e なんて são partículas casuais com vários usos, muitas vezes ligados a emoção.

• Exemplo leve (なんか): como など, dá uma sugestão sem insistir, como "que tal um chá ou algo assim?".
• Desvalorização ou modéstia (なんか / なんて): mostra que quem fala considera aquilo pouco importante, ou se diminui por modéstia, como "eu ainda sou muito fraco" ou "lição, não quero fazer".
• Surpresa ou indignação (なんて): depois de uma frase, mostra espanto ou crítica, como "ele mentir? que horror!" ou "não imaginava que ele viria".

なんか costuma vir depois de substantivos. なんて pode vir depois de substantivos e também de frases inteiras, principalmente no uso de surpresa.

Ambos são informais. Em situações formais, usa-se など.$$,
    $$Cuidado ao usar なんか com coisas de outras pessoas, porque pode soar como desprezo.

なんて também aparece em なんて + adjetivo, como なんてきれいなんだ ("que lindo!"), com sentido de exclamação.

Na fala, なんか também é usado sozinho como "tipo..." ou "sei lá...", para hesitar.$$,
    $$Substantivo + なんか / なんて (desvalorização / exemplo)
Substantivo + なんか + どうですか (sugestão leve)
Frase (forma simples) + なんて + Reação (surpresa / crítica)
Pronome + なんか / なんて (modéstia: 私なんか)$$,
    $$なんか$$,
    $$なんか|なんて$$,
    ARRAY['なんか', 'なんて']::text[],
    ARRAY['なんか', 'なんて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-68', $$私なんか、まだまだです。$$, $$わたしなんか、まだまだです。$$, $$Eu ainda tenho muito a aprender.$$),
    ('n3-grammar-68', $$彼が来るなんて、思わなかった。$$, $$かれがくるなんて、おもわなかった。$$, $$Jamais imaginei que ele viria.$$),
    ('n3-grammar-68', $$今日は疲れたから、宿題なんか、やりたくない。$$, $$きょうはつかれたから、しゅくだいなんか、やりたくない。$$, $$Hoje estou cansado, lição é a última coisa que quero fazer.$$),
    ('n3-grammar-68', $$休憩しましょう。お茶なんかどうですか。$$, $$きゅうけいしましょう。おちゃなんかどうですか。$$, $$Vamos fazer uma pausa. Que tal um chá ou algo assim?$$),
    ('n3-grammar-68', $$友達にうそをつくなんて、ひどい。$$, $$ともだちにうそをつくなんて、ひどい。$$, $$Mentir para um amigo? Que horror.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人で外国に行く____、すごいね。$$, $$Ir sozinho para o exterior? Que incrível!$$),
        (2, $$今日は勉強____したくない。$$, $$Hoje não estou com a menor vontade de estudar.$$),
        (3, $$お土産に、甘い物____どうですか。$$, $$Que tal um doce ou algo assim de lembrancinha?$$),
        (4, $$私____、まだまだ下手です。$$, $$Eu ainda sou muito ruim nisso.$$),
        (5, $$あんなに強い彼が負ける____、信じられない。$$, $$Ele, tão forte, perder? Não dá para acreditar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-68', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なんて$$),
        (2, $$なんか$$),
        (2, $$なんて$$),
        (3, $$なんか$$),
        (4, $$なんか$$),
        (4, $$なんて$$),
        (5, $$なんて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-69 — 〜直す
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-69',
    'grammar',
    'N3',
    $$〜直す$$,
    $$naosu$$,
    $$Refazer / Fazer de novo / Corrigir$$,
    $$直す, ligado a outro verbo, indica que uma ação é feita de novo, geralmente para corrigir ou melhorar algo. Equivale a "refazer", "fazer de novo" ou "corrigir".

A estrutura junta o verbo na forma ます sem ます com 直す. O resultado funciona como um verbo do grupo 1.

Por exemplo, reescrever algo que ficou errado, ler de novo para revisar, repensar um plano ou ligar de novo para alguém.

A ideia é de recomeço com o objetivo de acertar ou melhorar. Por isso, é muito usado em situações de erro, revisão e segunda chance.$$,
    $$見直す tem dois sentidos: "revisar" e "mudar a opinião sobre alguém para melhor".

やり直す é muito usado em frases de incentivo, como "pode recomeçar quantas vezes quiser".

かけ直す é a forma natural de dizer "vou ligar de novo" ao telefone.$$,
    $$Verbo na forma ます sem ます + 直す

Passado: 直した / 直しました
Pedido: 直してください

Combinações comuns: 書き直す / 読み直す / 考え直す / かけ直す / やり直す / 見直す$$,
    $$直す$$,
    $$直|なお$$,
    ARRAY['直す']::text[],
    ARRAY['直す', '直した', '直します', '直して']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-69', $$間違えたので、もう一度書き直した。$$, $$まちがえたので、もういちどかきなおした。$$, $$Errei e reescrevi tudo de novo.$$),
    ('n3-grammar-69', $$この文をもう一度読み直してください。$$, $$このぶんをもういちどよみなおしてください。$$, $$Leia esta frase mais uma vez, por favor.$$),
    ('n3-grammar-69', $$この計画は考え直したほうがいい。$$, $$このけいかくはかんがえなおしたほうがいい。$$, $$É melhor repensar este plano.$$),
    ('n3-grammar-69', $$番号を間違えたので、電話をかけ直した。$$, $$ばんごうをまちがえたので、でんわをかけなおした。$$, $$Liguei para o número errado e liguei de novo.$$),
    ('n3-grammar-69', $$失敗しても、またやり直せばいい。$$, $$しっぱいしても、またやりなおせばいい。$$, $$Mesmo que erre, é só recomeçar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$字が汚いので、書き____ください。$$, $$A letra está feia, então reescreva, por favor.$$),
        (2, $$提出する前に、この作文をもう一度見____。$$, $$Antes de entregar, vou revisar esta redação mais uma vez.$$),
        (3, $$今、田中は席にいないので、後でかけ____ます。$$, $$O Tanaka não está na mesa agora, então ligaremos de novo mais tarde.$$),
        (4, $$うまくいかなかったから、最初からやり____。$$, $$Não deu certo, então vamos recomeçar do início.$$),
        (5, $$その問題について、もう一度考え____ほうがいい。$$, $$É melhor repensar esse problema mais uma vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-69', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$直して$$),
        (2, $$直します$$),
        (2, $$直した$$),
        (2, $$直しました$$),
        (3, $$直し$$),
        (4, $$直そう$$),
        (4, $$直します$$),
        (5, $$直した$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-70 — なるべく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-70',
    'grammar',
    'N3',
    $$なるべく$$,
    $$narubeku$$,
    $$Na medida do possível / O máximo possível / Sempre que possível$$,
    $$なるべく é um advérbio que significa "na medida do possível" ou "sempre que possível". Ele indica que a pessoa vai tentar fazer algo, dentro das suas possibilidades.

É muito usado em pedidos ("venha o mais cedo possível"), conselhos ("é melhor, sempre que possível, não ficar acordado até tarde") e hábitos ("procuro, sempre que possível, comer verdura").

Combina muito bem com ようにする e ようにしている, que expressam esforço para manter um hábito.

なるべく é um pouco mais suave e menos enfático que できるだけ, que tem o mesmo sentido.$$,
    $$なるべく e できるだけ podem ser trocados na maioria dos casos.

Em pedidos educados, なるべく deixa o pedido mais flexível, sem pressionar a outra pessoa.

なるべく早く ("o mais cedo possível") é uma das combinações mais comuns, principalmente em e-mails de trabalho.$$,
    $$なるべく + Verbo / Advérbio / Adjetivo
なるべく + Verbo + ようにする / ようにしている
なるべく + Verbo + てください (pedido)$$,
    $$なるべく$$,
    $$なるべく$$,
    ARRAY['なるべく']::text[],
    ARRAY['なるべく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-70', $$明日はなるべく早く来てください。$$, $$あしたはなるべくはやくきてください。$$, $$Amanhã, venha o mais cedo possível.$$),
    ('n3-grammar-70', $$健康のために、なるべく野菜を食べるようにしている。$$, $$けんこうのために、なるべくやさいをたべるようにしている。$$, $$Pela saúde, procuro comer verdura sempre que possível.$$),
    ('n3-grammar-70', $$なるべく夜遅くまで起きていないほうがいい。$$, $$なるべくよるおそくまでおきていないほうがいい。$$, $$É melhor, na medida do possível, não ficar acordado até tarde.$$),
    ('n3-grammar-70', $$お返事はなるべく今日中にお願いします。$$, $$おへんじはなるべくきょうじゅうにおねがいします。$$, $$Peço que responda, se possível, ainda hoje.$$),
    ('n3-grammar-70', $$今月はなるべくお金を使わないようにしています。$$, $$こんげつはなるべくおかねをつかわないようにしています。$$, $$Este mês, procuro gastar o mínimo possível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$健康のために、____階段を使うようにしている。$$, $$Pela saúde, procuro usar a escada sempre que possível.$$),
        (2, $$旅行の荷物は____少なくしてください。$$, $$Leve a menor bagagem possível na viagem.$$),
        (3, $$____早く返事をください。$$, $$Me responda o mais rápido possível, por favor.$$),
        (4, $$授業では、____日本語で話すようにしています。$$, $$Nas aulas, procuro falar em japonês sempre que possível.$$),
        (5, $$甘い物は____食べないようにしている。$$, $$Procuro, na medida do possível, não comer doces.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-70', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なるべく$$),
        (2, $$なるべく$$),
        (3, $$なるべく$$),
        (4, $$なるべく$$),
        (5, $$なるべく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-71 — なぜなら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-71',
    'grammar',
    'N3',
    $$なぜなら$$,
    $$nazenara$$,
    $$Porque / Isso porque / A razão é que$$,
    $$なぜなら é uma conjunção que introduz o motivo de algo que já foi dito. Equivale a "porque", "isso porque" ou "a razão é que".

Primeiro vem a afirmação ou a decisão. Depois, numa nova frase, なぜなら apresenta a explicação. A frase com なぜなら costuma terminar com からだ ou からです, que reforçam a ideia de motivo.

Por exemplo, "eu ando todo dia. Isso porque faz bem para a saúde".

Esse uso soa formal e lógico. Ele aparece muito em redações, discursos, debates e textos argumentativos, quando a pessoa quer justificar claramente sua opinião.

A forma なぜかというと tem o mesmo sentido e é um pouco mais falada.$$,
    $$Na conversa do dia a dia, os japoneses preferem simplesmente usar から ou ので. なぜなら soa mais explicativo, quase como numa apresentação.

O final からだ é importante: sem ele, a frase com なぜなら fica incompleta.

なぜ, sozinho, significa "por quê" e é a forma mais formal de どうして.$$,
    $$Frase 1 (afirmação) + なぜなら、 + Motivo + からだ / からです
Frase 1 + なぜかというと、 + Motivo + からだ (mais falado)$$,
    $$なぜなら$$,
    $$なぜなら|なぜかというと$$,
    ARRAY['なぜなら', 'からだ']::text[],
    ARRAY['なぜなら', 'なぜかというと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-71', $$私は毎日歩きます。なぜなら、健康にいいからです。$$, $$わたしはまいにちあるきます。なぜなら、けんこうにいいからです。$$, $$Eu ando todos os dias. Isso porque faz bem para a saúde.$$),
    ('n3-grammar-71', $$今日は休みます。なぜなら、熱があるからです。$$, $$きょうはやすみます。なぜなら、ねつがあるからです。$$, $$Hoje vou faltar. A razão é que estou com febre.$$),
    ('n3-grammar-71', $$私は彼を信じている。なぜなら、一度もうそをついたことがないからだ。$$, $$わたしはかれをしんじている。なぜなら、いちどもうそをついたことがないからだ。$$, $$Eu confio nele. Isso porque ele nunca mentiu.$$),
    ('n3-grammar-71', $$この計画には反対です。なぜなら、お金がかかりすぎるからです。$$, $$このけいかくにははんたいです。なぜなら、おかねがかかりすぎるからです。$$, $$Sou contra este plano. A razão é que ele custa caro demais.$$),
    ('n3-grammar-71', $$日本語を勉強している。なぜかというと、日本で働きたいからだ。$$, $$にほんごをべんきょうしている。なぜかというと、にほんではたらきたいからだ。$$, $$Estou estudando japonês. É que quero trabalhar no Japão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$旅行は中止です。____、台風が来るからです。$$, $$A viagem está cancelada. Isso porque vem um tufão.$$),
        (2, $$私は猫が好きだ。____、かわいいからだ。$$, $$Eu gosto de gatos. Isso porque são fofos.$$),
        (3, $$今日は早く寝ます。____、明日は早いからです。$$, $$Hoje vou dormir cedo. A razão é que amanhã acordo cedo.$$),
        (4, $$その意見に賛成です。____、みんなのためになるからです。$$, $$Concordo com essa opinião. Isso porque ela beneficia a todos.$$),
        (5, $$彼は人気がある。____、いつも優しいからだ。$$, $$Ele é popular. Isso porque é sempre gentil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-71', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なぜなら$$),
        (2, $$なぜなら$$),
        (3, $$なぜなら$$),
        (4, $$なぜなら$$),
        (5, $$なぜなら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-72 — 〜んだって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-72',
    'grammar',
    'N3',
    $$〜んだって$$,
    $$n datte$$,
    $$Dizem que / Ouvi dizer que / É verdade que...?$$,
    $$んだって é uma forma casual de repassar uma informação que se ouviu de alguém. Equivale a "dizem que" ou "ouvi dizer que".

Ela junta んだ (explicação) com って (citação). A ideia é "ouvi que é assim".

É muito comum entre amigos e família, para contar novidades, fofocas e notícias. Por exemplo, "o Tanaka vai se casar no mês que vem, ouvi dizer".

Com entonação de pergunta, んだって？ serve para confirmar algo que a pessoa ouviu: "é verdade que você vai se mudar?".

Com substantivos e adjetivos な, usa-se なんだって.$$,
    $$んだって é bem informal. Em situações educadas, use そうです ou と聞きました.

As mulheres às vezes usam a forma んですって, um pouco mais suave e tradicional.

Na pergunta んだって？, a pessoa geralmente está surpresa e quer saber se a informação é verdadeira.$$,
    $$Verbo / Adjetivo い (forma simples) + んだって
Substantivo / Adjetivo な + なんだって
… + んだって？ (confirmação: é verdade que...?)

Forma educada equivalente: 〜そうです$$,
    $$んだって$$,
    $$んだって|なんだって$$,
    ARRAY['ん', 'だって']::text[],
    ARRAY['んだって', 'なんだって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-72', $$ねえ、田中さん、来月結婚するんだって。$$, $$ねえ、たなかさん、らいげつけっこんするんだって。$$, $$Ei, ouvi dizer que o Tanaka vai se casar no mês que vem.$$),
    ('n3-grammar-72', $$明日は雨なんだって。$$, $$あしたはあめなんだって。$$, $$Dizem que amanhã vai chover.$$),
    ('n3-grammar-72', $$あの店のラーメン、すごくおいしいんだって。$$, $$あのみせのラーメン、すごくおいしいんだって。$$, $$Dizem que o ramen daquela loja é muito gostoso.$$),
    ('n3-grammar-72', $$先生、今日は休みなんだって。$$, $$せんせい、きょうはやすみなんだって。$$, $$Ouvi dizer que o professor está de folga hoje.$$),
    ('n3-grammar-72', $$彼女、アメリカに留学するんだって？$$, $$かのじょ、アメリカにりゅうがくするんだって？$$, $$É verdade que ela vai fazer intercâmbio nos Estados Unidos?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$山田さん、会社をやめる____。$$, $$Ouvi dizer que o Yamada vai sair da empresa.$$),
        (2, $$明日のテストは難しい____。$$, $$Dizem que a prova de amanhã é difícil.$$),
        (3, $$あの映画、すごくおもしろい____よ。$$, $$Dizem que aquele filme é muito bom.$$),
        (4, $$部長は今日、出張な____。$$, $$Ouvi dizer que o gerente está em viagem de trabalho hoje.$$),
        (5, $$君、来月引っ越す____？$$, $$É verdade que você vai se mudar no mês que vem?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-72', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$んだって$$),
        (2, $$んだって$$),
        (3, $$んだって$$),
        (4, $$んだって$$),
        (5, $$んだって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-73 — 〜に違いない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-73',
    'grammar',
    'N3',
    $$〜に違いない$$,
    $$ni chigai nai$$,
    $$Com certeza / Deve ser / Não há dúvida de que$$,
    $$に違いない é usado para expressar uma suposição forte, quase uma certeza, baseada em evidências ou em intuição. Equivale a "com certeza", "deve ser" ou "não há dúvida de que".

A ideia literal é "não há diferença", ou seja, "não pode ser outra coisa".

O grau de certeza é alto, maior que だろう e かもしれない. Mas ainda é uma suposição pessoal, e não um fato comprovado.

Ele vem depois da forma simples de verbos e adjetivos い. Com substantivos e adjetivos な, não se usa だ antes: 本当に違いない.

É um pouco formal e aparece muito na escrita, em romances e em deduções.$$,
    $$Na conversa casual, os japoneses costumam preferir きっと〜と思う ou はずだ.

Comparando: はずだ se baseia mais em lógica e fatos; に違いない expressa uma convicção pessoal forte, às vezes baseada em intuição.

É muito usado em histórias de detetive, quando alguém deduz algo.$$,
    $$Verbo / Adjetivo い (forma simples) + に違いない
Adjetivo な (sem だ) + に違いない
Substantivo (sem だ) + に違いない

Educado: に違いありません
Escrita: に違いない / にちがいない$$,
    $$に違いない$$,
    $$に違いない|に違いありません|にちがいない$$,
    ARRAY['に', '違い', 'ない']::text[],
    ARRAY['に違いない', 'に違いありません', 'にちがいない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-73', $$彼はもう家に帰ったに違いない。$$, $$かれはもういえにかえったにちがいない。$$, $$Ele com certeza já foi para casa.$$),
    ('n3-grammar-73', $$この絵は有名な画家が描いたに違いない。$$, $$このえはゆうめいながかがかいたにちがいない。$$, $$Este quadro deve ter sido pintado por um pintor famoso.$$),
    ('n3-grammar-73', $$あんなに練習したのだから、合格するに違いない。$$, $$あんなにれんしゅうしたのだから、ごうかくするにちがいない。$$, $$Com tanto treino, com certeza vai passar.$$),
    ('n3-grammar-73', $$電気がついているから、誰かいるに違いない。$$, $$でんきがついているから、だれかいるにちがいない。$$, $$A luz está acesa, então com certeza tem alguém.$$),
    ('n3-grammar-73', $$彼女の話は本当に違いありません。$$, $$かのじょのはなしはほんとうにちがいありません。$$, $$A história dela com certeza é verdade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の顔色を見ると、病気____。$$, $$Pela cor do rosto dele, com certeza está doente.$$),
        (2, $$このブランドのかばんだから、高い____。$$, $$É uma bolsa dessa marca, então com certeza é cara.$$),
        (3, $$証拠から考えると、犯人はあの男____。$$, $$Pelas provas, o culpado com certeza é aquele homem.$$),
        (4, $$このプレゼントを見たら、彼女はきっと喜ぶ____。$$, $$Quando ela vir este presente, com certeza vai ficar feliz.$$),
        (5, $$窓が開いている。泥棒が入った____。$$, $$A janela está aberta. Com certeza um ladrão entrou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-73', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に違いない$$),
        (1, $$に違いありません$$),
        (2, $$に違いない$$),
        (2, $$に違いありません$$),
        (3, $$に違いない$$),
        (3, $$に違いありません$$),
        (4, $$に違いない$$),
        (4, $$に違いありません$$),
        (5, $$に違いない$$),
        (5, $$に違いありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-74 — 〜に反して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-74',
    'grammar',
    'N3',
    $$〜に反して$$,
    $$ni hanshite$$,
    $$Ao contrário de / Contra / Contrariando$$,
    $$に反して é usado para dizer que um resultado foi contrário a uma expectativa, previsão, desejo ou regra. Equivale a "ao contrário de", "contrariando" ou "contra".

反する significa "ir contra" ou "ser oposto a". Assim, a estrutura mostra que a realidade foi na direção oposta.

Ela aparece muito com substantivos como 予想 (previsão), 期待 (expectativa), 意思 (vontade) e 規則 (regra).

Antes de um substantivo, usa-se に反する: 規則に反する行為 (um ato contra as regras).

É uma expressão formal, comum em notícias, relatórios e textos escritos.$$,
    $$予想に反して é uma das combinações mais usadas e equivale a "contra todas as previsões".

Com regras e leis, に反する indica uma violação: 法律に反する (ser contra a lei).

Na fala do dia a dia, os japoneses costumam usar 思ったより ou 予想と違って, que soam mais leves.$$,
    $$Substantivo (予想 / 期待 / 意思 / 規則) + に反して + Resultado
Substantivo + に反し + Resultado (mais formal)
Substantivo + に反する + Substantivo$$,
    $$に反して$$,
    $$に反して|に反し|に反する$$,
    ARRAY['に', '反して']::text[],
    ARRAY['に反して', 'に反し', 'に反する']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-74', $$予想に反して、試験は簡単だった。$$, $$よそうにはんして、しけんはかんたんだった。$$, $$Ao contrário do previsto, a prova foi fácil.$$),
    ('n3-grammar-74', $$親の期待に反して、彼は大学に行かなかった。$$, $$おやのきたいにはんして、かれはだいがくにいかなかった。$$, $$Contrariando as expectativas dos pais, ele não foi para a faculdade.$$),
    ('n3-grammar-74', $$天気予報に反して、一日中晴れた。$$, $$てんきよほうにはんして、いちにちじゅうはれた。$$, $$Ao contrário da previsão do tempo, fez sol o dia inteiro.$$),
    ('n3-grammar-74', $$規則に反する行為は許されない。$$, $$きそくにはんするこういはゆるされない。$$, $$Atos contra as regras não são permitidos.$$),
    ('n3-grammar-74', $$本人の意思に反して、転勤が決まった。$$, $$ほんにんのいしにはんして、てんきんがきまった。$$, $$Contra a vontade dele, a transferência foi decidida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$予想____、チームは負けてしまった。$$, $$Ao contrário do previsto, o time acabou perdendo.$$),
        (2, $$期待____、その映画はつまらなかった。$$, $$Contrariando as expectativas, esse filme foi chato.$$),
        (3, $$法律____行為をしてはいけない。$$, $$Não se deve praticar atos contra a lei.$$),
        (4, $$彼の意見は私の考え____いる。$$, $$A opinião dele é contrária ao que eu penso.$$),
        (5, $$みんなの心配____、手術は成功した。$$, $$Contrariando a preocupação de todos, a cirurgia foi um sucesso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-74', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に反して$$),
        (2, $$に反して$$),
        (3, $$に反する$$),
        (4, $$に反して$$),
        (5, $$に反して$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-75 — 〜にかけて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-75',
    'grammar',
    'N3',
    $$〜にかけて$$,
    $$ni kakete$$,
    $$Até / Ao longo de / Em direção a$$,
    $$Quando aparece sozinho, sem から, にかけて indica que algo se estende ou acontece ao longo de um período até certo ponto, de forma aproximada. Equivale a "até", "ao longo de" ou "em direção a".

Ele é muito usado em previsões do tempo e em descrições de tendências: "até o fim da tarde, a chuva vai ficar mais forte" ou "até o fim do ano, o trabalho vai aumentar".

A ideia é de algo que vai acontecendo ou mudando gradualmente, e não de um limite exato. Para limites exatos, usa-se まで.

Quando aparece com から, forma から〜にかけて, que indica uma faixa completa entre dois pontos.$$,
    $$Em previsões do tempo, にかけて aparece quase todos os dias, junto com expressões como 夕方, 夜, 明日の朝 e 週末.

Não confunda com にかけては (N2), que significa "quando se trata de" e fala de habilidades.

にかけて soa um pouco mais formal e vago que まで.$$,
    $$Período / Momento + にかけて + Frase
から + … + にかけて (faixa entre dois pontos)$$,
    $$にかけて$$,
    $$にかけて$$,
    ARRAY['に', 'かけて']::text[],
    ARRAY['にかけて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-75', $$夕方にかけて、雨が強くなるでしょう。$$, $$ゆうがたにかけて、あめがつよくなるでしょう。$$, $$Até o fim da tarde, a chuva deve ficar mais forte.$$),
    ('n3-grammar-75', $$週末にかけて、寒い日が続きます。$$, $$しゅうまつにかけて、さむいひがつづきます。$$, $$Os dias frios vão continuar até o fim de semana.$$),
    ('n3-grammar-75', $$年末にかけて、仕事が忙しくなる。$$, $$ねんまつにかけて、しごとがいそがしくなる。$$, $$Até o fim do ano, o trabalho vai ficar mais corrido.$$),
    ('n3-grammar-75', $$夜にかけて、風が強くなった。$$, $$よるにかけて、かぜがつよくなった。$$, $$Em direção à noite, o vento ficou mais forte.$$),
    ('n3-grammar-75', $$来週にかけて、気温が下がる見込みです。$$, $$らいしゅうにかけて、きおんがさがるみこみです。$$, $$A previsão é de que a temperatura caia até a semana que vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日の朝____、雪が降るでしょう。$$, $$Deve nevar até amanhã de manhã.$$),
        (2, $$連休____、高速道路が混みます。$$, $$As rodovias vão ficar congestionadas ao longo do feriado prolongado.$$),
        (3, $$夏の終わり____、台風が多い。$$, $$Até o fim do verão, há muitos tufões.$$),
        (4, $$午後から夜____、雷に注意してください。$$, $$Da tarde até a noite, tenham cuidado com os raios.$$),
        (5, $$月末____、忙しくなりそうだ。$$, $$Parece que vou ficar ocupado até o fim do mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-75', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかけて$$),
        (2, $$にかけて$$),
        (3, $$にかけて$$),
        (4, $$にかけて$$),
        (5, $$にかけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-76 — 〜に関する・〜に関して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-76',
    'grammar',
    'N3',
    $$〜に関する・〜に関して$$,
    $$ni kansuru / ni kanshite$$,
    $$Sobre / A respeito de / Relativo a$$,
    $$に関する e に関して são usados para indicar o assunto ou o tema de algo. Equivalem a "sobre", "a respeito de" ou "relativo a".

に関する vem antes de um substantivo e o descreve: 歴史に関する本 (um livro sobre história).

に関して vem antes de um verbo ou de uma frase: この件に関して質問がある (tenho uma pergunta a respeito deste assunto).

O sentido é parecido com について, mas に関する e に関して soam mais formais e objetivos. Por isso, aparecem muito em documentos, reuniões, notícias e textos acadêmicos.

Com は, a forma に関しては destaca o tema, às vezes com contraste: "em relação a economia, ele entende bem".$$,
    $$Na conversa casual, について é mais comum. に関して é típico de situações formais.

Antes de substantivos, について usa の (についての本), enquanto に関する se liga direto (に関する本).

Em e-mails de trabalho, 〜に関しまして é uma versão ainda mais polida.$$,
    $$Substantivo + に関する + Substantivo
Substantivo + に関して + Verbo / Frase
Substantivo + に関しては + … (quanto a...)

Escrita: に関する / にかんする$$,
    $$に関する$$,
    $$に関す|に関し|にかんし|にかんす$$,
    ARRAY['に', '関する']::text[],
    ARRAY['に関する', 'に関して', 'に関しては', 'に関しまして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-76', $$日本の歴史に関する本を読んでいます。$$, $$にほんのれきしにかんするほんをよんでいます。$$, $$Estou lendo um livro sobre a história do Japão.$$),
    ('n3-grammar-76', $$この件に関して、何か質問はありますか。$$, $$このけんにかんして、なにかしつもんはありますか。$$, $$Há alguma pergunta a respeito deste assunto?$$),
    ('n3-grammar-76', $$環境問題に関するレポートを書いた。$$, $$かんきょうもんだいにかんするレポートをかいた。$$, $$Escrevi um relatório sobre problemas ambientais.$$),
    ('n3-grammar-76', $$事故に関して、警察が調べている。$$, $$じこにかんして、けいさつがしらべている。$$, $$A polícia está investigando o acidente.$$),
    ('n3-grammar-76', $$彼は経済に関しては詳しい。$$, $$かれはけいざいにかんしてはくわしい。$$, $$Quanto a economia, ele entende bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$留学____情報を集めている。$$, $$Estou reunindo informações sobre intercâmbio.$$),
        (2, $$その問題____、話し合いましょう。$$, $$Vamos conversar a respeito desse problema.$$),
        (3, $$最近、健康____ニュースが増えている。$$, $$Ultimamente, as notícias sobre saúde estão aumentando.$$),
        (4, $$新しい規則____、説明があった。$$, $$Houve uma explicação a respeito das novas regras.$$),
        (5, $$彼はコンピューター____知識が豊富だ。$$, $$Ele tem muito conhecimento sobre computadores.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-76', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に関する$$),
        (2, $$に関して$$),
        (3, $$に関する$$),
        (4, $$に関して$$),
        (5, $$に関する$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-77 — 〜に代わって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-77',
    'grammar',
    'N3',
    $$〜に代わって$$,
    $$ni kawatte$$,
    $$No lugar de / Em nome de / Substituindo$$,
    $$に代わって é usado para dizer que alguém ou algo faz um papel no lugar de outra pessoa ou coisa. Equivale a "no lugar de", "em nome de" ou "substituindo".

Ele tem dois usos principais. O primeiro é substituição de pessoa: alguém faz algo no lugar de outra pessoa, como um funcionário que cumprimenta os convidados em nome do presidente.

O segundo é substituição ao longo do tempo: algo novo toma o lugar de algo antigo, como o e-mail substituindo as cartas ou robôs fazendo o trabalho de pessoas.

É mais formal que の代わりに e aparece muito em discursos, cerimônias e textos escritos.$$,
    $$Em cerimônias e discursos, 〜に代わりまして、ご挨拶申し上げます é uma frase muito comum.

に代わる + substantivo, como 石油に代わるエネルギー, significa "uma energia que substitua o petróleo".

Compare com の代わりに: os dois têm sentido parecido, mas に代わって soa mais formal.$$,
    $$Substantivo + に代わって + Verbo
Substantivo + に代わり + Verbo (mais formal)
Substantivo + に代わる + Substantivo (que substitui)

Escrita: に代わって / にかわって$$,
    $$に代わって$$,
    $$に代わって|にかわって|に代わり|に代わる$$,
    ARRAY['に', '代わって']::text[],
    ARRAY['に代わって', 'に代わり', 'に代わる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-77', $$社長に代わって、私がご挨拶します。$$, $$しゃちょうにかわって、わたしがごあいさつします。$$, $$Em nome do presidente, eu farei a saudação.$$),
    ('n3-grammar-77', $$病気の母に代わって、姉が料理を作った。$$, $$びょうきのははにかわって、あねがりょうりをつくった。$$, $$No lugar da minha mãe doente, minha irmã mais velha cozinhou.$$),
    ('n3-grammar-77', $$最近は手紙に代わって、メールが使われている。$$, $$さいきんはてがみにかわって、メールがつかわれている。$$, $$Ultimamente, o e-mail está sendo usado no lugar das cartas.$$),
    ('n3-grammar-77', $$人間に代わって、ロボットが働く時代だ。$$, $$にんげんにかわって、ロボットがはたらくじだいだ。$$, $$É uma época em que robôs trabalham no lugar das pessoas.$$),
    ('n3-grammar-77', $$先生に代わって、私が説明します。$$, $$せんせいにかわって、わたしがせつめいします。$$, $$No lugar do professor, eu vou explicar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$部長____、課長が会議に出た。$$, $$No lugar do gerente, o chefe de seção participou da reunião.$$),
        (2, $$最近は現金____、カードで払う人が増えた。$$, $$Ultimamente, aumentou o número de pessoas que pagam com cartão no lugar do dinheiro.$$),
        (3, $$家族____、心からお礼を申し上げます。$$, $$Em nome da família, agradeço de coração.$$),
        (4, $$出張中の父____、兄が家のことをした。$$, $$No lugar do meu pai, que estava viajando a trabalho, meu irmão cuidou da casa.$$),
        (5, $$これからは石油____、新しいエネルギーが必要だ。$$, $$Daqui em diante, é necessária uma nova energia para substituir o petróleo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-77', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に代わって$$),
        (1, $$にかわって$$),
        (2, $$に代わって$$),
        (2, $$にかわって$$),
        (3, $$に代わって$$),
        (3, $$にかわって$$),
        (4, $$に代わって$$),
        (4, $$にかわって$$),
        (5, $$に代わって$$),
        (5, $$にかわって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-78 — 〜に比べて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-78',
    'grammar',
    'N3',
    $$〜に比べて$$,
    $$ni kurabete$$,
    $$Em comparação com / Comparado a$$,
    $$に比べて é usado para comparar duas coisas, colocando uma como referência. Equivale a "em comparação com" ou "comparado a".

A coisa que serve de referência vem antes de に比べて, e a segunda parte descreve a outra coisa, mostrando a diferença.

Por exemplo, "em comparação com o ano passado, este ano chove mais" ou "comparado a Tóquio, a minha cidade é tranquila".

A forma に比べると tem o mesmo sentido e é muito usada na fala. Também é possível usar と比べて, com a partícula と.

É um pouco mais formal que より, mas muito comum tanto na conversa quanto na escrita.$$,
    $$Comparando com より: 去年より今年は暑い e 去年に比べて今年は暑い têm sentido parecido. に比べて destaca mais a comparação em si.

Para comparações de mudanças no tempo, como "comparado a dez anos atrás", に比べて é muito natural.

に比べ, sem て, é comum em notícias e textos escritos.$$,
    $$Substantivo A + に比べて、 + B + は + Adjetivo
Substantivo A + に比べると、 + …
Substantivo A + と比べて、 + …
Substantivo A + に比べ、 + … (escrito)

Escrita: 比べる / くらべる$$,
    $$に比べて$$,
    $$に比べ|にくらべ|と比べ|とくらべ$$,
    ARRAY['に', '比べて']::text[],
    ARRAY['に比べて', 'に比べると', 'と比べて', 'に比べ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-78', $$去年に比べて、今年は雨が多い。$$, $$きょねんにくらべて、ことしはあめがおおい。$$, $$Em comparação com o ano passado, este ano chove mais.$$),
    ('n3-grammar-78', $$東京に比べて、私の町は静かだ。$$, $$とうきょうにくらべて、わたしのまちはしずかだ。$$, $$Comparada a Tóquio, a minha cidade é tranquila.$$),
    ('n3-grammar-78', $$兄に比べて、弟はよく勉強する。$$, $$あににくらべて、おとうとはよくべんきょうする。$$, $$Comparado ao irmão mais velho, o mais novo estuda bastante.$$),
    ('n3-grammar-78', $$昔に比べると、生活が便利になった。$$, $$むかしにくらべると、せいかつがべんりになった。$$, $$Em comparação com antigamente, a vida ficou mais prática.$$),
    ('n3-grammar-78', $$先月と比べて、売り上げが伸びた。$$, $$せんげつとくらべて、うりあげがのびた。$$, $$Comparado ao mês passado, as vendas aumentaram.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏____、冬は電気代が高い。$$, $$Em comparação com o verão, a conta de luz é mais cara no inverno.$$),
        (2, $$都会____、田舎は物価が安い。$$, $$Comparado à cidade grande, o custo de vida no interior é mais baixo.$$),
        (3, $$十年前____、この町は人口が減った。$$, $$Em comparação com dez anos atrás, a população desta cidade diminuiu.$$),
        (4, $$他の店____、この店は安い。$$, $$Comparada às outras lojas, esta loja é barata.$$),
        (5, $$昨日____、今日は暖かい。$$, $$Em comparação com ontem, hoje está quente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-78', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に比べて$$),
        (1, $$に比べると$$),
        (2, $$に比べて$$),
        (2, $$に比べると$$),
        (3, $$に比べて$$),
        (3, $$に比べると$$),
        (4, $$に比べて$$),
        (4, $$に比べると$$),
        (5, $$に比べて$$),
        (5, $$に比べると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-79 — 〜に慣れる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-79',
    'grammar',
    'N3',
    $$〜に慣れる$$,
    $$ni nareru$$,
    $$Acostumar-se com / Habituar-se a$$,
    $$に慣れる é usado para dizer que alguém se acostumou com uma situação, um lugar, uma atividade ou um ambiente. Equivale a "acostumar-se com" ou "habituar-se a".

A coisa com que a pessoa se acostuma é marcada com に. Pode ser um substantivo, como "a vida no Japão", ou uma ação transformada em substantivo com こと, como "usar hashi".

Na forma ている, 慣れている indica que a pessoa já está acostumada. Na forma てきた, 慣れてきた indica que ela está se acostumando aos poucos.

Na forma negativa, まだ慣れていない significa "ainda não me acostumei", muito usado por quem acabou de chegar a algum lugar.$$,
    $$A expressão もう慣れました é uma resposta comum quando alguém pergunta se você já se adaptou a um lugar novo.

O substantivo 慣れ significa "costume" ou "prática", como em 慣れが必要だ (é preciso prática).

Para "deixar alguém acostumado", usa-se 慣らす.$$,
    $$Substantivo + に + 慣れる
Verbo + こと + に + 慣れる

Já acostumado: 慣れている / 慣れています
Acostumando-se aos poucos: 慣れてきた
Ainda não: まだ慣れていない

Escrita: 慣れる / なれる$$,
    $$に慣れる$$,
    $$慣れ$$,
    ARRAY['に', '慣れる']::text[],
    ARRAY['に慣れる', 'に慣れた', 'に慣れている', 'に慣れてきた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-79', $$日本に来て一年、日本の生活に慣れました。$$, $$にほんにきていちねん、にほんのせいかつになれました。$$, $$Faz um ano que vim ao Japão, e me acostumei com a vida aqui.$$),
    ('n3-grammar-79', $$新しい仕事にまだ慣れていない。$$, $$あたらしいしごとにまだなれていない。$$, $$Ainda não me acostumei com o novo trabalho.$$),
    ('n3-grammar-79', $$早く新しい学校に慣れるといいですね。$$, $$はやくあたらしいがっこうになれるといいですね。$$, $$Tomara que você se acostume logo com a nova escola.$$),
    ('n3-grammar-79', $$寒さに慣れるまで、時間がかかった。$$, $$さむさになれるまで、じかんがかかった。$$, $$Levou um tempo até eu me acostumar com o frio.$$),
    ('n3-grammar-79', $$最近、箸を使うことに慣れてきた。$$, $$さいきん、はしをつかうことになれてきた。$$, $$Ultimamente, estou me acostumando a usar hashi.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日本の食べ物にもう____。$$, $$Já me acostumei com a comida japonesa.$$),
        (2, $$引っ越したばかりで、新しい環境にまだ____。$$, $$Acabei de me mudar e ainda não me acostumei com o novo ambiente.$$),
        (3, $$早く仕事に____ように頑張ります。$$, $$Vou me esforçar para me acostumar logo com o trabalho.$$),
        (4, $$満員電車に____まで、大変だった。$$, $$Até me acostumar com os trens lotados, foi difícil.$$),
        (5, $$一人暮らしにも少しずつ____。$$, $$Estou me acostumando aos poucos a morar sozinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-79', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$慣れました$$),
        (1, $$慣れた$$),
        (2, $$慣れていない$$),
        (2, $$慣れていません$$),
        (3, $$慣れる$$),
        (4, $$慣れる$$),
        (5, $$慣れてきた$$),
        (5, $$慣れてきました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-80 — 〜において・〜における
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-80',
    'grammar',
    'N3',
    $$〜において・〜における$$,
    $$ni oite / ni okeru$$,
    $$Em / No âmbito de / Na área de$$,
    $$において e における são formas formais de indicar o lugar, a situação ou a área em que algo acontece. Equivalem a "em", "no âmbito de" ou "na área de".

において funciona como a partícula で, mas em linguagem formal. Ele vem antes de verbos: 会議は東京において行われる (a reunião será realizada em Tóquio).

における vem antes de substantivos e os descreve: 日本における外国人 (os estrangeiros no Japão).

Além de lugares físicos, essas formas indicam áreas, campos e situações abstratas, como "na sociedade moderna", "na área da ciência" ou "na educação".

São típicas de textos escritos, notícias, discursos, documentos oficiais e textos acadêmicos.$$,
    $$Na conversa do dia a dia, usar において soa exageradamente formal. Prefira で.

Em convites oficiais e programas de eventos, aparecem frases como 〜において開催します.

における é muito usado em títulos de trabalhos acadêmicos, como "o papel de X na sociedade".$$,
    $$Substantivo (lugar / área / situação) + において + Verbo
Substantivo + における + Substantivo
Substantivo + においては + … (no que diz respeito a...)
Substantivo + においても + … (também em...)$$,
    $$において$$,
    $$において|における|においては|に於いて$$,
    ARRAY['に', 'おいて']::text[],
    ARRAY['において', 'における', 'においては', 'においても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-80', $$国際会議は東京において行われる。$$, $$こくさいかいぎはとうきょうにおいておこなわれる。$$, $$A conferência internacional será realizada em Tóquio.$$),
    ('n3-grammar-80', $$現代社会において、インターネットは欠かせない。$$, $$げんだいしゃかいにおいて、インターネットはかかせない。$$, $$Na sociedade moderna, a internet é indispensável.$$),
    ('n3-grammar-80', $$彼は科学の分野において有名だ。$$, $$かれはかがくのぶんやにおいてゆうめいだ。$$, $$Ele é famoso na área da ciência.$$),
    ('n3-grammar-80', $$日本における外国人の数は増えている。$$, $$にほんにおけるがいこくじんのかずはふえている。$$, $$O número de estrangeiros no Japão está aumentando.$$),
    ('n3-grammar-80', $$教育においては、家庭の役割も大切だ。$$, $$きょういくにおいては、かていのやくわりもたいせつだ。$$, $$No que diz respeito à educação, o papel da família também é importante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$卒業式は体育館____行われます。$$, $$A cerimônia de formatura será realizada no ginásio.$$),
        (2, $$日本____少子化は大きな問題だ。$$, $$A queda da natalidade no Japão é um grande problema.$$),
        (3, $$ビジネス____、時間を守ることは大切だ。$$, $$Nos negócios, é importante ser pontual.$$),
        (4, $$戦争中____人々の生活について調べた。$$, $$Pesquisei sobre a vida das pessoas durante a guerra.$$),
        (5, $$彼女は音楽の世界____活躍している。$$, $$Ela se destaca no mundo da música.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-80', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$において$$),
        (2, $$における$$),
        (3, $$において$$),
        (4, $$における$$),
        (5, $$において$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-81 — 〜にしたがって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-81',
    'grammar',
    'N3',
    $$〜にしたがって$$,
    $$ni shitagatte$$,
    $$De acordo com / Seguindo / À medida que$$,
    $$にしたがって tem dois usos principais.

O primeiro é "de acordo com" ou "seguindo": fazer algo obedecendo a instruções, regras, ordens ou um mapa. Por exemplo, "siga as instruções do professor" ou "jogue o lixo de acordo com as regras". Nesse uso, ele vem depois de substantivos.

O segundo é "à medida que": uma mudança acompanha outra, de forma proporcional. Por exemplo, "à medida que envelhecemos, perdemos força física". Nesse uso, ele vem depois de verbos na forma de dicionário, geralmente verbos de mudança.

O verbo 従う significa "seguir" ou "obedecer". A forma にしたがい, sem て, é mais formal e aparece na escrita.$$,
    $$No uso de "à medida que", にしたがって é parecido com につれて. につれて é um pouco mais comum na conversa, e にしたがって é mais formal.

Em avisos de emergência, 係員の指示に従って ("sigam as instruções dos funcionários") é uma frase muito comum.

No uso de "seguindo", a segunda parte costuma ser uma ação que alguém realiza.$$,
    $$Substantivo (指示 / 規則 / 地図) + にしたがって + Verbo (seguindo)
Verbo de mudança (forma de dicionário) + にしたがって + Mudança (à medida que)

Formal: にしたがい
Escrita: にしたがって / に従って$$,
    $$にしたがって$$,
    $$にしたがって|に従って|にしたがい|に従い$$,
    ARRAY['に', 'したがって']::text[],
    ARRAY['にしたがって', 'に従って', 'にしたがい', 'に従い']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-81', $$先生の指示にしたがって、作業を進めてください。$$, $$せんせいのしじにしたがって、さぎょうをすすめてください。$$, $$Sigam as instruções do professor e continuem o trabalho.$$),
    ('n3-grammar-81', $$年をとるにしたがって、体力が落ちてきた。$$, $$としをとるにしたがって、たいりょくがおちてきた。$$, $$À medida que envelheço, minha força física vem diminuindo.$$),
    ('n3-grammar-81', $$地図にしたがって歩くと、駅に着いた。$$, $$ちずにしたがってあるくと、えきについた。$$, $$Seguindo o mapa, cheguei à estação.$$),
    ('n3-grammar-81', $$町が発展するにしたがって、人口も増えた。$$, $$まちがはってんするにしたがって、じんこうもふえた。$$, $$À medida que a cidade se desenvolveu, a população também aumentou.$$),
    ('n3-grammar-81', $$規則に従って、ゴミを出してください。$$, $$きそくにしたがって、ゴミをだしてください。$$, $$Coloque o lixo para fora de acordo com as regras.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$説明書____、組み立ててください。$$, $$Monte seguindo o manual, por favor.$$),
        (2, $$山の上に登る____、気温が下がる。$$, $$À medida que se sobe a montanha, a temperatura cai.$$),
        (3, $$国民は法律____、税金を払う。$$, $$Os cidadãos pagam impostos de acordo com a lei.$$),
        (4, $$日本語が上手になる____、日本の生活が楽しくなった。$$, $$À medida que meu japonês melhorou, a vida no Japão ficou mais divertida.$$),
        (5, $$火事の時は、係員の案内____、避難してください。$$, $$Em caso de incêndio, evacuem seguindo as orientações dos funcionários.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-81', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしたがって$$),
        (1, $$に従って$$),
        (2, $$にしたがって$$),
        (2, $$に従って$$),
        (3, $$にしたがって$$),
        (3, $$に従って$$),
        (4, $$にしたがって$$),
        (4, $$に従って$$),
        (5, $$にしたがって$$),
        (5, $$に従って$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-82 — 〜にしても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-82',
    'grammar',
    'N3',
    $$〜にしても$$,
    $$ni shite mo$$,
    $$Mesmo que / Ainda que / Mesmo sendo$$,
    $$にしても é usado para admitir uma situação e, mesmo assim, apresentar uma opinião, uma crítica ou uma exigência que continua valendo. Equivale a "mesmo que", "ainda que" ou "mesmo sendo".

A primeira parte reconhece um fato ou uma possibilidade ("mesmo que esteja ocupado", "mesmo que fosse brincadeira"). A segunda parte mostra que, ainda assim, algo deveria ser diferente ("pelo menos ligar dá", "ela ficou magoada").

O tom é muitas vezes de crítica ou de cobrança.

Ele também aparece em pares, A にしても B にしても, com o sentido de "seja A ou B", mostrando que a conclusão vale para qualquer caso.

Vem depois da forma simples de verbos e adjetivos, e diretamente depois de substantivos.$$,
    $$それにしても, no começo da frase, significa "mesmo assim" ou "de qualquer forma", e é muito usado na conversa.

Em textos mais formais, にせよ e にしろ têm o mesmo sentido, e aparecem no N2.

Diferente de ても, にしても costuma expressar uma opinião de quem fala, muitas vezes com tom de crítica.$$,
    $$Verbo / Adjetivo (forma simples) + にしても、 + Opinião / Crítica
Substantivo + にしても
A + にしても、 + B + にしても (seja A ou B)

Variações formais: にせよ / にしろ$$,
    $$にしても$$,
    $$にしても$$,
    ARRAY['に', 'しても']::text[],
    ARRAY['にしても', 'にしても〜にしても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-82', $$冗談にしても、言っていいことと悪いことがある。$$, $$じょうだんにしても、いっていいこととわるいことがある。$$, $$Mesmo sendo brincadeira, há coisas que se pode e que não se pode dizer.$$),
    ('n3-grammar-82', $$忙しいにしても、電話くらいはできるでしょう。$$, $$いそがしいにしても、でんわくらいはできるでしょう。$$, $$Mesmo ocupado, pelo menos uma ligação dá para fazer, né?$$),
    ('n3-grammar-82', $$行くにしても、行かないにしても、早く連絡してください。$$, $$いくにしても、いかないにしても、はやくれんらくしてください。$$, $$Vá ou não vá, me avise logo, por favor.$$),
    ('n3-grammar-82', $$遅れるにしても、連絡はするべきだ。$$, $$おくれるにしても、れんらくはするべきだ。$$, $$Mesmo que vá se atrasar, deveria avisar.$$),
    ('n3-grammar-82', $$冗談だったにしても、彼女は傷ついた。$$, $$じょうだんだったにしても、かのじょはきずついた。$$, $$Mesmo que tenha sido brincadeira, ela ficou magoada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$疲れている____、挨拶ぐらいはしなさい。$$, $$Mesmo cansado, pelo menos cumprimente as pessoas.$$),
        (2, $$失敗した____、あきらめないで。$$, $$Mesmo que tenha falhado, não desista.$$),
        (3, $$パーティーに来ない____、連絡はしてほしい。$$, $$Mesmo que não venha à festa, queria que avisasse.$$),
        (4, $$子供のいたずら____、これはひどすぎる。$$, $$Mesmo sendo travessura de criança, isso é demais.$$),
        (5, $$高い____、一度は行ってみたい。$$, $$Mesmo sendo caro, quero ir pelo menos uma vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-82', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしても$$),
        (2, $$にしても$$),
        (3, $$にしても$$),
        (4, $$にしても$$),
        (5, $$にしても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-83 — 〜にしては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-83',
    'grammar',
    'N3',
    $$〜にしては$$,
    $$ni shite wa$$,
    $$Para (alguém que é...) / Considerando que$$,
    $$にしては é usado para dizer que algo é diferente do que se esperaria, considerando uma condição. Equivale a "para..." ou "considerando que...".

A primeira parte apresenta uma condição que cria uma expectativa ("para um estrangeiro", "para a primeira vez", "para outubro"). A segunda parte mostra que a realidade foi diferente dessa expectativa.

Por exemplo, "para um estrangeiro, ele fala japonês muito bem" ou "para outubro, hoje está quente".

O resultado pode ser positivo (um elogio) ou negativo (uma decepção). O importante é o contraste com o que seria normal.

Ele vem depois de substantivos e da forma simples de verbos.$$,
    $$A diferença entre にしては e にしても: にしては mostra surpresa porque o resultado foi diferente do esperado; にしても admite algo e mantém uma opinião ou crítica.

Elogios com にしては podem soar condescendentes se a condição for sensível, como idade ou nacionalidade. Use com cuidado.

Com expressões de quantidade, にしては também funciona: "para um preço de mil ienes, é muito bom".$$,
    $$Substantivo + にしては + Avaliação inesperada
Verbo (forma simples) + にしては + Avaliação inesperada$$,
    $$にしては$$,
    $$にしては$$,
    ARRAY['に', 'しては']::text[],
    ARRAY['にしては']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-83', $$彼は外国人にしては、日本語がとても上手だ。$$, $$かれはがいこくじんにしては、にほんごがとてもじょうずだ。$$, $$Para um estrangeiro, ele fala japonês muito bem.$$),
    ('n3-grammar-83', $$初めてにしては、よくできましたね。$$, $$はじめてにしては、よくできましたね。$$, $$Para a primeira vez, você se saiu muito bem.$$),
    ('n3-grammar-83', $$この店は駅前にしては、値段が安い。$$, $$このみせはえきまえにしては、ねだんがやすい。$$, $$Para uma loja em frente à estação, os preços são baratos.$$),
    ('n3-grammar-83', $$十月にしては、今日は暑い。$$, $$じゅうがつにしては、きょうはあつい。$$, $$Para outubro, hoje está quente.$$),
    ('n3-grammar-83', $$小学生にしては、難しい言葉を知っている。$$, $$しょうがくせいにしては、むずかしいことばをしっている。$$, $$Para um aluno do primário, ele conhece palavras difíceis.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供____、よく食べますね。$$, $$Para uma criança, você come bastante, hein.$$),
        (2, $$夏____、涼しい日が続いている。$$, $$Para o verão, os dias têm sido frescos.$$),
        (3, $$初心者____、上手ですね。$$, $$Para um iniciante, você é bom, hein.$$),
        (4, $$有名なレストラン____、あまりおいしくなかった。$$, $$Para um restaurante famoso, não era muito gostoso.$$),
        (5, $$一生懸命勉強した____、点数が悪かった。$$, $$Considerando que estudei muito, a nota foi ruim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-83', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしては$$),
        (2, $$にしては$$),
        (3, $$にしては$$),
        (4, $$にしては$$),
        (5, $$にしては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-84 — 〜に対して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-84',
    'grammar',
    'N3',
    $$〜に対して$$,
    $$ni taishite$$,
    $$Para com / Em relação a / Em contraste com$$,
    $$に対して tem três usos principais.

O primeiro é indicar o alvo de uma ação ou atitude: "para com", "em relação a". Por exemplo, a forma de falar com um professor, a resposta a uma pergunta ou o tratamento dado aos clientes.

O segundo é indicar contraste entre duas coisas: "enquanto A é..., B é...". Nesse caso, usa-se のに対して depois de uma frase. Por exemplo, "enquanto o irmão mais velho é alto, o mais novo é baixo".

O terceiro, com に対する, vem antes de um substantivo para dizer o objeto de um sentimento ou interesse: 環境問題に対する関心 (o interesse pelos problemas ambientais).

É uma expressão um pouco formal, muito usada na escrita e em situações sérias.$$,
    $$Para falar do assunto de algo (sobre), usa-se について. に対して é para o alvo de uma ação ou atitude.

No uso de contraste, のに対して é comum em textos que comparam dados, como estatísticas.

A expressão 〜に対して失礼だ (ser mal-educado com alguém) é bem frequente.$$,
    $$Substantivo (pessoa / coisa) + に対して + Verbo / Atitude
Frase + のに対して、 + Frase contrastante
Substantivo + に対する + Substantivo
Substantivo + に対しては + … (no caso de...)

Formal: に対し$$,
    $$に対して$$,
    $$に対して|に対する|に対し|にたいして$$,
    ARRAY['に', '対して']::text[],
    ARRAY['に対して', 'に対する', 'に対し', 'のに対して']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-84', $$先生に対して、失礼なことを言ってはいけない。$$, $$せんせいにたいして、しつれいなことをいってはいけない。$$, $$Não se deve dizer coisas mal-educadas ao professor.$$),
    ('n3-grammar-84', $$彼は質問に対して、丁寧に答えた。$$, $$かれはしつもんにたいして、ていねいにこたえた。$$, $$Ele respondeu à pergunta com cuidado.$$),
    ('n3-grammar-84', $$兄は背が高いのに対して、弟は低い。$$, $$あにはせがたかいのにたいして、おとうとはひくい。$$, $$Enquanto o irmão mais velho é alto, o mais novo é baixo.$$),
    ('n3-grammar-84', $$最近、環境問題に対する関心が高まっている。$$, $$さいきん、かんきょうもんだいにたいするかんしんがたかまっている。$$, $$Ultimamente, o interesse pelos problemas ambientais tem aumentado.$$),
    ('n3-grammar-84', $$お客様に対しては、いつも笑顔で接してください。$$, $$おきゃくさまにたいしては、いつもえがおでせっしてください。$$, $$Com os clientes, trate sempre com um sorriso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日本では、目上の人____、敬語を使う。$$, $$No Japão, usa-se linguagem honorífica com pessoas mais velhas ou superiores.$$),
        (2, $$彼の意見____、反対する人が多い。$$, $$Muitas pessoas são contra a opinião dele.$$),
        (3, $$子供____教育は大切だ。$$, $$A educação das crianças é importante.$$),
        (4, $$東京は人が多いの____、田舎は少ない。$$, $$Enquanto Tóquio tem muita gente, o interior tem pouca.$$),
        (5, $$親切にしてもらったこと____、お礼を言った。$$, $$Agradeci pela gentileza que recebi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-84', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に対して$$),
        (2, $$に対して$$),
        (3, $$に対する$$),
        (4, $$に対して$$),
        (5, $$に対して$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-85 — 〜にとって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-85',
    'grammar',
    'N3',
    $$〜にとって$$,
    $$ni totte$$,
    $$Para (alguém) / Do ponto de vista de$$,
    $$にとって é usado para indicar o ponto de vista de alguém, ou seja, para quem algo é importante, difícil, necessário ou especial. Equivale a "para" ou "do ponto de vista de".

Ele vem depois de uma pessoa, um grupo ou uma coisa, e a segunda parte traz uma avaliação, geralmente com adjetivos como 大切, 難しい, 必要 e 特別.

Por exemplo, "para mim, a família é o mais importante" ou "para estrangeiros, kanji é difícil".

Com は, にとっては destaca o contraste: "para os estudantes, pelo menos, as férias são a maior alegria". Com の, にとっての vem antes de um substantivo.

にとって é usado para avaliações e opiniões, e não para ações feitas para alguém. Para isso, usa-se のために.$$,
    $$Um erro comum é usar にとって com verbos de ação. Para "fiz um bolo para minha mãe", usa-se のために ou に, e não にとって.

Comparando: にとって indica para quem algo tem certo valor; に対して indica para quem uma ação é direcionada.

Em redações, 私にとって〜とは ("para mim, X é...") é uma forma comum de começar uma reflexão.$$,
    $$Pessoa / Grupo / Coisa + にとって + Avaliação (大切 / 難しい / 必要 / 特別)
Pessoa + にとっては + … (contraste)
Pessoa + にとっての + Substantivo$$,
    $$にとって$$,
    $$にとって|にとっては|にとっての$$,
    ARRAY['に', 'とって']::text[],
    ARRAY['にとって', 'にとっては', 'にとっての']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-85', $$私にとって、家族が一番大切です。$$, $$わたしにとって、かぞくがいちばんたいせつです。$$, $$Para mim, a família é o mais importante.$$),
    ('n3-grammar-85', $$この写真は私にとって大切な宝物だ。$$, $$このしゃしんはわたしにとってたいせつなたからものだ。$$, $$Esta foto é um tesouro precioso para mim.$$),
    ('n3-grammar-85', $$子供にとって、遊ぶことも勉強だ。$$, $$こどもにとって、あそぶこともべんきょうだ。$$, $$Para as crianças, brincar também é aprender.$$),
    ('n3-grammar-85', $$外国人にとって、漢字は難しい。$$, $$がいこくじんにとって、かんじはむずかしい。$$, $$Para os estrangeiros, kanji é difícil.$$),
    ('n3-grammar-85', $$学生にとっては、夏休みが一番の楽しみだ。$$, $$がくせいにとっては、なつやすみがいちばんのたのしみだ。$$, $$Para os estudantes, as férias de verão são a maior alegria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私____、音楽はなくてはならないものだ。$$, $$Para mim, a música é algo indispensável.$$),
        (2, $$植物____、水と光は必要だ。$$, $$Para as plantas, água e luz são necessárias.$$),
        (3, $$経験が長い彼____、この仕事は簡単すぎる。$$, $$Para ele, que tem muita experiência, este trabalho é fácil demais.$$),
        (4, $$子供たち____、公園は大切な場所だ。$$, $$Para as crianças, o parque é um lugar importante.$$),
        (5, $$日本人____、桜は特別な花です。$$, $$Para os japoneses, a cerejeira é uma flor especial.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-85', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にとって$$),
        (2, $$にとって$$),
        (3, $$にとって$$),
        (4, $$にとって$$),
        (5, $$にとって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-86 — 〜について
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-86',
    'grammar',
    'N3',
    $$〜について$$,
    $$ni tsuite$$,
    $$Sobre / A respeito de / Acerca de$$,
    $$について é usado para indicar o assunto ou o tema de uma ação, como falar, pensar, estudar, perguntar ou escrever. Equivale a "sobre", "a respeito de" ou "acerca de".

Ele vem depois de um substantivo e antes de verbos como 話す, 考える, 勉強する, 調べる, 書く e 聞く.

Antes de um substantivo, usa-se についての: 環境についてのレポート (um relatório sobre o meio ambiente).

Com は, については destaca o tema, às vezes com contraste: "quanto a esse assunto, explico depois".

について é a forma mais comum e neutra para "sobre". Em situações mais formais, usa-se に関して.$$,
    $$Na fala, について é muito mais comum que に関して.

Para dizer "um livro sobre X", existem duas opções: Xについての本 e Xに関する本. A segunda soa mais formal.

について também aparece em perguntas de opinião: 〜についてどう思いますか (o que você acha de...?).$$,
    $$Substantivo + について + Verbo (話す / 考える / 調べる / 書く)
Substantivo + についての + Substantivo
Substantivo + については + …

Formal: に関して / に関する$$,
    $$について$$,
    $$について|についての|については$$,
    ARRAY['に', 'ついて']::text[],
    ARRAY['について', 'についての', 'については']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-86', $$大学で日本の文化について勉強しています。$$, $$だいがくでにほんのぶんかについてべんきょうしています。$$, $$Na faculdade, estou estudando sobre a cultura japonesa.$$),
    ('n3-grammar-86', $$この問題について、どう思いますか。$$, $$このもんだいについて、どうおもいますか。$$, $$O que você acha deste problema?$$),
    ('n3-grammar-86', $$将来について、両親と話した。$$, $$しょうらいについて、りょうしんとはなした。$$, $$Conversei com meus pais sobre o futuro.$$),
    ('n3-grammar-86', $$環境についてのレポートを書いた。$$, $$かんきょうについてのレポートをかいた。$$, $$Escrevi um relatório sobre o meio ambiente.$$),
    ('n3-grammar-86', $$その件については、後で説明します。$$, $$そのけんについては、あとでせつめいします。$$, $$Quanto a esse assunto, explico depois.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日本の歴史____、もっと知りたい。$$, $$Quero saber mais sobre a história do Japão.$$),
        (2, $$旅行の計画____、話し合いましょう。$$, $$Vamos conversar sobre o plano da viagem.$$),
        (3, $$授業で、自分の国____発表した。$$, $$Na aula, fiz uma apresentação sobre o meu país.$$),
        (4, $$彼の意見____、どう思いますか。$$, $$O que você acha da opinião dele?$$),
        (5, $$新しい商品____説明を聞いた。$$, $$Ouvi uma explicação sobre o novo produto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-86', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$について$$),
        (2, $$について$$),
        (3, $$について$$),
        (4, $$について$$),
        (5, $$についての$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-87 — 〜につれて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-87',
    'grammar',
    'N3',
    $$〜につれて$$,
    $$ni tsurete$$,
    $$À medida que / Conforme / Com o passar de$$,
    $$につれて é usado para dizer que, à medida que uma coisa muda, outra coisa também muda gradualmente. Equivale a "à medida que", "conforme" ou "com o passar de".

Ele vem depois de verbos de mudança na forma de dicionário, como たつ (passar), 近づく (aproximar-se), 大きくなる (crescer) e 上手になる (melhorar).

A segunda parte também descreve uma mudança gradual, que acompanha a primeira. Por exemplo, "conforme o tempo passou, a tristeza foi desaparecendo".

Por isso, a segunda parte não pode ser uma ação pontual ou uma vontade. Ela precisa ser uma mudança natural e progressiva.$$,
    $$につれて e にしたがって são muito parecidos no sentido de "à medida que". につれて é um pouco mais comum na conversa.

A segunda parte costuma ter formas como てくる, ていく, ようになる ou adjetivos com なる, que indicam mudança.

É muito usado em reflexões sobre o tempo, o crescimento e o envelhecimento.$$,
    $$Verbo de mudança (forma de dicionário) + につれて、 + Mudança gradual
Substantivo de mudança + につれて (時代 / 成長)

Formal: につれ$$,
    $$につれて$$,
    $$につれて|につれ$$,
    ARRAY['に', 'つれて']::text[],
    ARRAY['につれて', 'につれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-87', $$時間がたつにつれて、悲しみが消えていった。$$, $$じかんがたつにつれて、かなしみがきえていった。$$, $$Com o passar do tempo, a tristeza foi desaparecendo.$$),
    ('n3-grammar-87', $$年をとるにつれて、体が弱くなる。$$, $$としをとるにつれて、からだがよわくなる。$$, $$À medida que envelhecemos, o corpo fica mais fraco.$$),
    ('n3-grammar-87', $$町が大きくなるにつれて、交通が不便になった。$$, $$まちがおおきくなるにつれて、こうつうがふべんになった。$$, $$Conforme a cidade cresceu, o trânsito ficou pior.$$),
    ('n3-grammar-87', $$日本語が上手になるにつれて、友達が増えた。$$, $$にほんごがじょうずになるにつれて、ともだちがふえた。$$, $$À medida que meu japonês melhorou, fiz mais amigos.$$),
    ('n3-grammar-87', $$試験が近づくにつれて、緊張してきた。$$, $$しけんがちかづくにつれて、きんちょうしてきた。$$, $$Conforme a prova se aproximava, fui ficando nervoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冬が近づく____、寒くなってきた。$$, $$À medida que o inverno se aproxima, vem esfriando.$$),
        (2, $$子供が成長する____、家が狭く感じる。$$, $$Conforme as crianças crescem, a casa parece menor.$$),
        (3, $$時代が変わる____、人々の考え方も変わる。$$, $$Com a mudança dos tempos, o modo de pensar das pessoas também muda.$$),
        (4, $$山を登る____、空気が冷たくなった。$$, $$À medida que subíamos a montanha, o ar ficava mais frio.$$),
        (5, $$彼の話を聞く____、彼の気持ちがわかってきた。$$, $$Conforme ouvia o que ele dizia, fui entendendo os sentimentos dele.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-87', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$につれて$$),
        (2, $$につれて$$),
        (3, $$につれて$$),
        (4, $$につれて$$),
        (5, $$につれて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-88 — 〜には（目的）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-88',
    'grammar',
    'N3',
    $$〜には（目的）$$,
    $$ni wa (mokuteki)$$,
    $$Para (fazer) / A fim de$$,
    $$Nesse uso, には indica um objetivo, e a segunda parte explica o que é necessário ou recomendado para alcançá-lo. Equivale a "para" ou "a fim de".

Ele vem depois do verbo na forma de dicionário. Por exemplo, "para ir à estação, pegue este ônibus" ou "para entrar na faculdade, é preciso passar no exame".

A segunda parte costuma ser uma condição, uma necessidade, um conselho ou uma informação útil, com expressões como 必要だ, なければならない, がいい, が便利だ ou かかる.

A diferença em relação a ために é que ために expressa uma intenção ou um esforço para alcançar algo, enquanto には apresenta o objetivo de forma geral e diz o que é preciso para chegar lá.$$,
    $$Não confunda com には de lugar e tempo, que é a partícula に com は de destaque, como em 東京には (em Tóquio).

Essa estrutura é muito útil para pedir e dar informações práticas, como caminhos e requisitos.

Com substantivos, a ideia de objetivo é expressa com のには ou com ために.$$,
    $$Verbo na forma de dicionário + には + Condição / Necessidade / Conselho
… + には + 〜が必要だ / 〜なければならない / 〜がいい / 〜が便利だ / 〜かかる$$,
    $$には$$,
    $$には$$,
    ARRAY['に', 'は']::text[],
    ARRAY['には']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-88', $$駅に行くには、このバスに乗ってください。$$, $$えきにいくには、このバスにのってください。$$, $$Para ir à estação, pegue este ônibus.$$),
    ('n3-grammar-88', $$日本語が上手になるには、毎日練習することが大切だ。$$, $$にほんごがじょうずになるには、まいにちれんしゅうすることがたいせつだ。$$, $$Para melhorar o japonês, é importante praticar todo dia.$$),
    ('n3-grammar-88', $$その大学に入るには、試験に合格しなければならない。$$, $$そのだいがくにはいるには、しけんにごうかくしなければならない。$$, $$Para entrar nessa faculdade, é preciso passar no exame.$$),
    ('n3-grammar-88', $$この料理を作るには、三時間かかる。$$, $$このりょうりをつくるには、さんじかんかかる。$$, $$Para fazer esta comida, leva três horas.$$),
    ('n3-grammar-88', $$健康を保つには、よく寝ることが一番だ。$$, $$けんこうをたもつには、よくねることがいちばんだ。$$, $$Para manter a saúde, o melhor é dormir bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$富士山に登る____、準備が必要だ。$$, $$Para subir o Monte Fuji, é preciso se preparar.$$),
        (2, $$この会社に入る____、英語ができなければならない。$$, $$Para entrar nesta empresa, é preciso saber inglês.$$),
        (3, $$空港へ行く____、電車が便利です。$$, $$Para ir ao aeroporto, o trem é prático.$$),
        (4, $$夢をかなえる____、努力が必要だ。$$, $$Para realizar um sonho, é preciso esforço.$$),
        (5, $$車を運転する____、免許がいる。$$, $$Para dirigir um carro, é preciso ter carteira.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-88', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$には$$),
        (2, $$には$$),
        (3, $$には$$),
        (4, $$には$$),
        (5, $$には$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-89 — 〜によると・〜によれば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-89',
    'grammar',
    'N3',
    $$〜によると・〜によれば$$,
    $$ni yoru to / ni yoreba$$,
    $$Segundo / De acordo com$$,
    $$によると e によれば são usados para indicar a fonte de uma informação. Equivalem a "segundo" ou "de acordo com".

A fonte vem antes, como a previsão do tempo, o jornal, uma notícia, uma pesquisa ou o que alguém disse. Depois vem a informação.

A frase costuma terminar com expressões que mostram que a informação foi ouvida ou lida, como そうだ, らしい, ということだ ou とのことだ. Isso deixa claro que quem fala está repassando uma informação, e não dando a própria opinião.

As duas formas têm o mesmo sentido. によれば soa um pouco mais formal.$$,
    $$Sem o final そうだ ou らしい, a frase pode soar incompleta ou como se quem fala estivesse afirmando algo por conta própria.

〜の話によると ("segundo o que fulano disse") é muito comum na conversa.

Em textos acadêmicos, 調査によれば ("segundo a pesquisa") aparece com frequência.$$,
    $$Fonte + によると、 + Informação + そうだ / らしい / ということだ
Fonte + によれば、 + Informação + そうだ / らしい

Fontes comuns: 天気予報 / ニュース / 新聞 / 調査 / 〜の話$$,
    $$によると$$,
    $$によると|によれば$$,
    ARRAY['に', 'よると']::text[],
    ARRAY['によると', 'によれば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-89', $$天気予報によると、明日は雪だそうです。$$, $$てんきよほうによると、あしたはゆきだそうです。$$, $$Segundo a previsão do tempo, amanhã vai nevar.$$),
    ('n3-grammar-89', $$ニュースによると、昨日大きな地震があったらしい。$$, $$ニュースによると、きのうおおきなじしんがあったらしい。$$, $$De acordo com o noticiário, parece que houve um grande terremoto ontem.$$),
    ('n3-grammar-89', $$先生の話によれば、試験は来週だそうだ。$$, $$せんせいのはなしによれば、しけんはらいしゅうだそうだ。$$, $$Segundo o que o professor disse, a prova é na semana que vem.$$),
    ('n3-grammar-89', $$新聞によると、来月から物価が上がるそうです。$$, $$しんぶんによると、らいげつからぶっかがあがるそうです。$$, $$Segundo o jornal, os preços vão subir a partir do mês que vem.$$),
    ('n3-grammar-89', $$調査によれば、若者の読書量が減っている。$$, $$ちょうさによれば、わかもののどくしょりょうがへっている。$$, $$De acordo com a pesquisa, a quantidade de leitura entre os jovens está diminuindo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$友達の話____、あの店は安いそうだ。$$, $$Segundo o que meu amigo disse, aquela loja é barata.$$),
        (2, $$天気予報____、明日は晴れるそうです。$$, $$Segundo a previsão do tempo, amanhã vai fazer sol.$$),
        (3, $$医者____、手術は必要ないそうです。$$, $$Segundo o médico, a cirurgia não é necessária.$$),
        (4, $$新聞の記事____、事故の原因はスピードの出しすぎだったそうだ。$$, $$Segundo a matéria do jornal, a causa do acidente foi excesso de velocidade.$$),
        (5, $$噂____、二人は結婚するらしい。$$, $$Pelo que dizem por aí, os dois vão se casar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-89', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$によると$$),
        (1, $$によれば$$),
        (2, $$によると$$),
        (2, $$によれば$$),
        (3, $$によると$$),
        (3, $$によれば$$),
        (4, $$によると$$),
        (4, $$によれば$$),
        (5, $$によると$$),
        (5, $$によれば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-90 — 〜によって・〜による
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-90',
    'grammar',
    'N3',
    $$〜によって・〜による$$,
    $$ni yotte / ni yoru$$,
    $$Por / Devido a / Dependendo de / Por meio de$$,
    $$によって é uma expressão com vários usos importantes no N3.

• Agente da passiva: indica quem fez algo, principalmente em obras, descobertas e criações. Por exemplo, "este quadro foi pintado por Picasso".
• Causa: indica o motivo de algo, geralmente acontecimentos como desastres. Por exemplo, "muitas casas foram destruídas por causa do tufão".
• Meio: indica o meio pelo qual algo é feito. Por exemplo, "a vida ficou mais prática por meio da internet".
• Variação: indica que algo muda conforme cada caso. Por exemplo, "os costumes variam de país para país".

Antes de um substantivo, usa-se による: 地震による被害 (os danos causados pelo terremoto). A forma により é mais formal e aparece em avisos e notícias.$$,
    $$No uso de variação, によって costuma vir com 違う, 異なる ou 変わる.

Em avisos de trens, 〜により運転を見合わせています ("o serviço está suspenso por causa de...") é muito comum.

Na passiva comum do dia a dia, como "fui elogiado pelo professor", usa-se に, e não によって.$$,
    $$Substantivo + によって + Verbo passivo (agente)
Substantivo + によって / により + Resultado (causa)
Substantivo + によって + Verbo (meio)
Substantivo + によって + 違う / 異なる (variação)
Substantivo + による + Substantivo$$,
    $$によって$$,
    $$によって|による|により$$,
    ARRAY['に', 'よって']::text[],
    ARRAY['によって', 'による', 'により']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-90', $$この絵はピカソによって描かれた。$$, $$このえはピカソによってかかれた。$$, $$Este quadro foi pintado por Picasso.$$),
    ('n3-grammar-90', $$国によって、習慣が違う。$$, $$くにによって、しゅうかんがちがう。$$, $$Os costumes variam de país para país.$$),
    ('n3-grammar-90', $$台風によって、多くの家が壊れた。$$, $$たいふうによって、おおくのいえがこわれた。$$, $$Muitas casas foram destruídas por causa do tufão.$$),
    ('n3-grammar-90', $$インターネットによって、生活が便利になった。$$, $$インターネットによって、せいかつがべんりになった。$$, $$A vida ficou mais prática por meio da internet.$$),
    ('n3-grammar-90', $$地震による被害は大きかった。$$, $$じしんによるひがいはおおきかった。$$, $$Os danos causados pelo terremoto foram grandes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この小説は有名な作家____書かれた。$$, $$Este romance foi escrito por um autor famoso.$$),
        (2, $$人____、考え方は違う。$$, $$O modo de pensar varia de pessoa para pessoa.$$),
        (3, $$大雨____、電車が止まった。$$, $$Os trens pararam por causa da chuva forte.$$),
        (4, $$事故____けが人は三人だった。$$, $$Houve três feridos por causa do acidente.$$),
        (5, $$話し合い____、問題を解決した。$$, $$Resolvemos o problema por meio do diálogo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-90', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$によって$$),
        (2, $$によって$$),
        (3, $$によって$$),
        (3, $$により$$),
        (4, $$による$$),
        (5, $$によって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-91 — 〜のでしょうか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-91',
    'grammar',
    'N3',
    $$〜のでしょうか$$,
    $$no deshou ka$$,
    $$Será que...? / Poderia me dizer...? (pergunta educada)$$,
    $$のでしょうか é uma forma muito educada e suave de fazer uma pergunta. Equivale a "será que...?" ou "poderia me dizer...?".

Ela junta の (explicação), でしょう (suposição) e か (pergunta). O resultado é uma pergunta indireta, que não pressiona o ouvinte. Quem pergunta mostra que quer entender uma situação, sem exigir uma resposta direta.

É muito usada para pedir informações a desconhecidos, para perguntar algo delicado no trabalho e para expressar dúvidas ou preocupações, inclusive falando consigo mesmo.

Na fala, の costuma virar ん, formando んでしょうか.

Com substantivos e adjetivos な, usa-se なのでしょうか.$$,
    $$Comparando: ですか é uma pergunta direta; のですか pede explicação; のでしょうか é a forma mais suave e humilde.

Em reuniões, のでしょうか também serve para levantar uma dúvida sobre uma decisão sem soar como crítica: 本当にこれでいいのでしょうか.

Em textos, a frase pode ficar como uma pergunta retórica, convidando o leitor a refletir.$$,
    $$Verbo / Adjetivo い (forma simples) + のでしょうか
Substantivo / Adjetivo な + な + のでしょうか

Fala: 〜んでしょうか
Pedido de orientação: Verbo ば + いいのでしょうか$$,
    $$のでしょうか$$,
    $$のでしょうか|んでしょうか$$,
    ARRAY['の', 'でしょう', 'か']::text[],
    ARRAY['のでしょうか', 'んでしょうか', 'なのでしょうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-91', $$すみません、駅はどこにあるのでしょうか。$$, $$すみません、えきはどこにあるのでしょうか。$$, $$Com licença, poderia me dizer onde fica a estação?$$),
    ('n3-grammar-91', $$どうして彼は来ないのでしょうか。$$, $$どうしてかれはこないのでしょうか。$$, $$Por que será que ele não vem?$$),
    ('n3-grammar-91', $$この書類は、誰に出せばいいのでしょうか。$$, $$このしょるいは、だれにだせばいいのでしょうか。$$, $$Para quem devo entregar este documento?$$),
    ('n3-grammar-91', $$明日の会議は何時からなのでしょうか。$$, $$あしたのかいぎはなんじからなのでしょうか。$$, $$A reunião de amanhã é a partir de que horas?$$),
    ('n3-grammar-91', $$本当にこれでいいのでしょうか。$$, $$ほんとうにこれでいいのでしょうか。$$, $$Será que está mesmo tudo bem assim?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$どうすれば日本語が上手になる____。$$, $$O que será que eu devo fazer para melhorar meu japonês?$$),
        (2, $$すみません、この電車は東京駅に止まる____。$$, $$Com licença, este trem para na estação de Tóquio?$$),
        (3, $$先生はいつ戻られる____。$$, $$Quando será que o professor volta?$$),
        (4, $$彼女はなぜ泣いている____。$$, $$Por que será que ela está chorando?$$),
        (5, $$何も変えなくて、このままでいい____。$$, $$Será que está bom deixar assim, sem mudar nada?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-91', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のでしょうか$$),
        (1, $$んでしょうか$$),
        (2, $$のでしょうか$$),
        (2, $$んでしょうか$$),
        (3, $$のでしょうか$$),
        (3, $$んでしょうか$$),
        (4, $$のでしょうか$$),
        (4, $$んでしょうか$$),
        (5, $$のでしょうか$$),
        (5, $$んでしょうか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-92 — 〜を中心に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-92',
    'grammar',
    'N3',
    $$〜を中心に$$,
    $$wo chuushin ni$$,
    $$Centrado em / Principalmente / Tendo como centro$$,
    $$を中心に é usado para indicar o centro, o foco principal ou a parte mais importante de algo. Equivale a "centrado em", "principalmente" ou "tendo como centro".

中心 significa "centro". Assim, a estrutura mostra o ponto em torno do qual algo acontece, se desenvolve ou se organiza.

Ela tem alguns usos: um centro físico (a Terra gira em torno do Sol, uma cidade cresce ao redor da estação), um grupo principal (um jogo popular principalmente entre jovens), uma área principal (chuvas fortes principalmente na região de Kanto) e um foco de atividade (uma aula centrada na gramática).

Antes de um substantivo, usa-se を中心とした ou を中心とする.$$,
    $$Em notícias sobre o tempo, を中心に aparece muito para indicar a região mais afetada.

Para pessoas, を中心に indica quem lidera ou é o centro de um grupo, como em 彼を中心にチームができた.

Também é comum em descrições de cursos e programas: o que é o foco principal.$$,
    $$Substantivo + を中心に + Verbo / Frase
Substantivo + を中心として + Verbo (formal)
Substantivo + を中心とした / を中心とする + Substantivo

Escrita: 中心 / ちゅうしん$$,
    $$を中心に$$,
    $$を中心に|を中心と|をちゅうしん$$,
    ARRAY['を', '中心', 'に']::text[],
    ARRAY['を中心に', 'を中心として', 'を中心とした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-92', $$この町は駅を中心に発展した。$$, $$このまちはえきをちゅうしんにはってんした。$$, $$Esta cidade se desenvolveu em torno da estação.$$),
    ('n3-grammar-92', $$若者を中心に、このゲームが人気だ。$$, $$わかものをちゅうしんに、このゲームがにんきだ。$$, $$Este jogo é popular, principalmente entre os jovens.$$),
    ('n3-grammar-92', $$地球は太陽を中心に回っている。$$, $$ちきゅうはたいようをちゅうしんにまわっている。$$, $$A Terra gira em torno do Sol.$$),
    ('n3-grammar-92', $$今日の授業は文法を中心に進めます。$$, $$きょうのじゅぎょうはぶんぽうをちゅうしんにすすめます。$$, $$A aula de hoje vai ser centrada na gramática.$$),
    ('n3-grammar-92', $$昨日は関東地方を中心に、大雨が降った。$$, $$きのうはかんとうちほうをちゅうしんに、おおあめがふった。$$, $$Ontem choveu forte, principalmente na região de Kanto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新しいリーダーの彼____、新しいチームができた。$$, $$Formou-se uma nova equipe em torno dele, o novo líder.$$),
        (2, $$この店は女性____人気がある。$$, $$Esta loja é popular principalmente entre as mulheres.$$),
        (3, $$東京____、地震の被害が出た。$$, $$Houve danos do terremoto, principalmente em Tóquio.$$),
        (4, $$会議では、来年の計画____話し合った。$$, $$Na reunião, conversamos principalmente sobre o plano do ano que vem.$$),
        (5, $$日本の経済は東京____動いている。$$, $$A economia do Japão gira em torno de Tóquio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-92', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を中心に$$),
        (2, $$を中心に$$),
        (3, $$を中心に$$),
        (4, $$を中心に$$),
        (5, $$を中心に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-93 — 〜をはじめ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-93',
    'grammar',
    'N3',
    $$〜をはじめ$$,
    $$wo hajime$$,
    $$A começar por / Incluindo / Como por exemplo$$,
    $$をはじめ é usado para citar o exemplo mais importante ou mais representativo de um grupo, e depois indicar que há outros. Equivale a "a começar por", "incluindo" ou "como por exemplo".

O primeiro elemento é o destaque, e a segunda parte fala do grupo inteiro, muitas vezes com palavras como 多くの, いろいろな ou 全員.

Por exemplo, "a começar pelo presidente, todos os funcionários compareceram" ou "a começar pelo sushi, a culinária japonesa é popular no mundo".

A forma をはじめとして é mais formal, e をはじめとする vem antes de um substantivo.

É uma expressão formal, muito usada em discursos, cerimônias, notícias e textos escritos.$$,
    $$Em discursos de agradecimento, frases como 社長をはじめ、皆様に感謝します são muito comuns.

O elemento citado primeiro costuma ser o mais importante, mais famoso ou de maior hierarquia.

Na conversa casual, os japoneses preferem や〜など ou とか.$$,
    $$Substantivo (exemplo principal) + をはじめ、 + Grupo
Substantivo + をはじめとして、 + Grupo (mais formal)
Substantivo + をはじめとする + Substantivo

Escrita: をはじめ / を始め$$,
    $$をはじめ$$,
    $$をはじめ|を始め$$,
    ARRAY['を', 'はじめ']::text[],
    ARRAY['をはじめ', 'をはじめとして', 'をはじめとする']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-93', $$東京をはじめ、日本の大都市はどこも人が多い。$$, $$とうきょうをはじめ、にほんのだいとしはどこもひとがおおい。$$, $$A começar por Tóquio, todas as grandes cidades do Japão têm muita gente.$$),
    ('n3-grammar-93', $$会議には社長をはじめ、社員全員が出席した。$$, $$かいぎにはしゃちょうをはじめ、しゃいんぜんいんがしゅっせきした。$$, $$Na reunião, a começar pelo presidente, todos os funcionários compareceram.$$),
    ('n3-grammar-93', $$すしをはじめ、日本料理は世界で人気がある。$$, $$すしをはじめ、にほんりょうりはせかいでにんきがある。$$, $$A começar pelo sushi, a culinária japonesa é popular no mundo.$$),
    ('n3-grammar-93', $$両親をはじめ、多くの人に助けられた。$$, $$りょうしんをはじめ、おおくのひとにたすけられた。$$, $$Fui ajudado por muitas pessoas, a começar pelos meus pais.$$),
    ('n3-grammar-93', $$この町には、お寺をはじめとして古い建物が多い。$$, $$このまちには、おてらをはじめとしてふるいたてものがおおい。$$, $$Esta cidade tem muitos prédios antigos, como por exemplo os templos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$式には校長先生____、多くの先生が来た。$$, $$A começar pelo diretor, muitos professores vieram à cerimônia.$$),
        (2, $$私はサッカー____、いろいろなスポーツが好きだ。$$, $$Gosto de vários esportes, a começar pelo futebol.$$),
        (3, $$京都____、日本には有名な観光地がたくさんある。$$, $$A começar por Kyoto, o Japão tem muitos pontos turísticos famosos.$$),
        (4, $$家族____、友達みんなが応援してくれた。$$, $$Todos me apoiaram, a começar pela minha família e pelos amigos.$$),
        (5, $$中国____、アジアの国々との交流が増えている。$$, $$O intercâmbio com os países asiáticos, a começar pela China, está aumentando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-93', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をはじめ$$),
        (2, $$をはじめ$$),
        (3, $$をはじめ$$),
        (4, $$をはじめ$$),
        (5, $$をはじめ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-94 — 〜を込めて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-94',
    'grammar',
    'N3',
    $$〜を込めて$$,
    $$wo komete$$,
    $$Com (sentimento) / Cheio de / Colocando$$,
    $$を込めて é usado para dizer que alguém faz algo colocando um sentimento ou uma intenção naquela ação. Equivale a "com", "cheio de" ou "colocando".

込める significa "colocar dentro". Assim, a ideia é "colocar o coração, o amor ou a gratidão dentro daquilo que se faz".

Os substantivos mais comuns antes de を込めて são 心 (coração), 愛 / 愛情 (amor), 感謝 (gratidão), 願い (desejo, prece), 気持ち (sentimento) e 力 (força).

É muito usado ao falar de presentes, cartas, comida feita com carinho, músicas e orações.$$,
    $$心を込めて é uma expressão muito comum e significa "de todo coração", "com todo carinho".

Em cartões e mensagens, frases como 感謝を込めて ("com gratidão") aparecem no final, como assinatura.

力を込めて é usado de forma física, com o sentido de "com toda a força".$$,
    $$Substantivo (sentimento) + を込めて + Verbo
Substantivo + を込めた + Substantivo (algo feito com...)

Escrita: を込めて / をこめて$$,
    $$を込めて$$,
    $$を込めて|をこめて|を込め$$,
    ARRAY['を', '込めて']::text[],
    ARRAY['を込めて', 'をこめて', 'を込めた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-94', $$心を込めて手紙を書きました。$$, $$こころをこめててがみをかきました。$$, $$Escrevi a carta de todo coração.$$),
    ('n3-grammar-94', $$感謝を込めて、先生にプレゼントを贈った。$$, $$かんしゃをこめて、せんせいにプレゼントをおくった。$$, $$Dei um presente ao professor, cheio de gratidão.$$),
    ('n3-grammar-94', $$母はいつも愛情を込めて料理を作る。$$, $$はははいつもあいじょうをこめてりょうりをつくる。$$, $$Minha mãe sempre cozinha com muito carinho.$$),
    ('n3-grammar-94', $$合格の願いを込めて、お守りを買った。$$, $$ごうかくのねがいをこめて、おまもりをかった。$$, $$Comprei um amuleto, desejando passar na prova.$$),
    ('n3-grammar-94', $$力を込めて、重いドアを押した。$$, $$ちからをこめて、おもいドアをおした。$$, $$Empurrei a porta pesada com toda a força.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は気持ち____、歌を歌った。$$, $$Ela cantou a música com todo o sentimento.$$),
        (2, $$祖母は愛____、セーターを編んでくれた。$$, $$Minha avó tricotou um suéter para mim com todo o amor.$$),
        (3, $$お礼の気持ち____、花を贈ります。$$, $$Envio estas flores em agradecimento.$$),
        (4, $$平和への願い____、鐘を鳴らした。$$, $$Tocaram o sino com um desejo de paz.$$),
        (5, $$この旅館では、心____お客様をもてなす。$$, $$Nesta pousada, recebemos os hóspedes de todo coração.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-94', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を込めて$$),
        (1, $$をこめて$$),
        (2, $$を込めて$$),
        (2, $$をこめて$$),
        (3, $$を込めて$$),
        (3, $$をこめて$$),
        (4, $$を込めて$$),
        (4, $$をこめて$$),
        (5, $$を込めて$$),
        (5, $$をこめて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-95 — 〜を通じて・〜を通して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-95',
    'grammar',
    'N3',
    $$〜を通じて・〜を通して$$,
    $$wo tsuujite / wo tooshite$$,
    $$Por meio de / Através de / Durante todo$$,
    $$を通じて e を通して têm dois usos principais.

O primeiro é indicar o meio ou o intermediário: "por meio de" ou "através de". Pode ser uma pessoa (conhecer alguém por meio de um amigo), uma ferramenta (falar com o mundo pela internet) ou uma experiência (aprender muito com o intercâmbio).

O segundo é indicar um período inteiro: "durante todo". Por exemplo, "esta ilha é quente o ano inteiro".

As duas formas são praticamente iguais. を通して soa um pouco mais concreto e é comum para experiências e meios diretos; を通じて soa um pouco mais formal e é comum para intermediários e períodos. Na prática, muitas vezes podem ser trocadas.$$,
    $$Para canais de comunicação, como internet, televisão e rádio, を通じて é muito comum em notícias.

Para experiências pessoais de aprendizado, を通して aparece mais: 経験を通して学ぶ.

O kanji 通 significa "passar através", o que ajuda a lembrar o sentido.$$,
    $$Substantivo (pessoa / meio / experiência) + を通じて / を通して + Verbo
Período (一年 / 一生) + を通じて / を通して + Estado contínuo

Formal: を通じ$$,
    $$を通じて$$,
    $$を通じて|を通して|をつうじて|をとおして|を通じ$$,
    ARRAY['を', '通じて', '通して']::text[],
    ARRAY['を通じて', 'を通して', 'を通じ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-95', $$友達を通じて、彼女と知り合った。$$, $$ともだちをつうじて、かのじょとしりあった。$$, $$Conheci-a por meio de um amigo.$$),
    ('n3-grammar-95', $$インターネットを通して、世界中の人と話せる。$$, $$インターネットをとおして、せかいじゅうのひととはなせる。$$, $$Pela internet, dá para falar com pessoas do mundo inteiro.$$),
    ('n3-grammar-95', $$この島は一年を通じて暖かい。$$, $$このしまはいちねんをつうじてあたたかい。$$, $$Esta ilha é quente o ano inteiro.$$),
    ('n3-grammar-95', $$留学を通して、多くのことを学んだ。$$, $$りゅうがくをとおして、おおくのことをまなんだ。$$, $$Aprendi muitas coisas por meio do intercâmbio.$$),
    ('n3-grammar-95', $$秘書を通して、社長に会う約束をした。$$, $$ひしょをとおして、しゃちょうにあうやくそくをした。$$, $$Por meio da secretária, marquei um encontro com o presidente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先輩____、今の会社を紹介してもらった。$$, $$Fui apresentado à empresa atual por meio de um veterano.$$),
        (2, $$ボランティア活動____、たくさんの友達ができた。$$, $$Fiz muitos amigos por meio do trabalho voluntário.$$),
        (3, $$このあたりは一年____雨が多い。$$, $$Nesta região chove muito o ano inteiro.$$),
        (4, $$テレビ____、そのニュースを知った。$$, $$Fiquei sabendo dessa notícia pela televisão.$$),
        (5, $$スポーツ____、協力することの大切さを学んだ。$$, $$Por meio do esporte, aprendi a importância de cooperar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-95', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を通じて$$),
        (1, $$を通して$$),
        (2, $$を通じて$$),
        (2, $$を通して$$),
        (3, $$を通じて$$),
        (3, $$を通して$$),
        (4, $$を通じて$$),
        (4, $$を通して$$),
        (5, $$を通じて$$),
        (5, $$を通して$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-96 — 〜おかげで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-96',
    'grammar',
    'N3',
    $$〜おかげで$$,
    $$okage de$$,
    $$Graças a / Por causa de (positivo)$$,
    $$おかげで é usado para indicar que algo bom aconteceu graças a uma pessoa, uma ação ou uma circunstância. Equivale a "graças a".

A primeira parte mostra a causa, e a segunda, o resultado positivo. O tom é de gratidão. Por exemplo, "graças ao professor, passei na prova" ou "graças ao remédio, a febre baixou".

Ele vem depois de substantivos com の, e da forma simples de verbos e adjetivos.

Na forma おかげだ ou おかげです, no final da frase, expressa gratidão diretamente: "consegui graças a todos vocês".

O oposto, para causas negativas, é せいで.$$,
    $$A expressão おかげさまで é uma resposta educada e muito comum quando alguém pergunta como você está: "graças a Deus / graças a vocês, estou bem".

Às vezes, おかげで é usado com ironia para algo ruim, como "graças a você, me atrasei". Nesse caso, o tom é sarcástico.

A diferença entre おかげで e せいで é só o tom: positivo ou negativo.$$,
    $$Substantivo + の + おかげで + Resultado positivo
Verbo / Adjetivo (forma simples, geralmente passado) + おかげで + Resultado
Adjetivo な + な + おかげで
… + のは + 〜のおかげだ / おかげです

Escrita: おかげ / お陰$$,
    $$おかげで$$,
    $$おかげで|おかげだ|おかげです|お陰で$$,
    ARRAY['おかげ', 'で']::text[],
    ARRAY['おかげで', 'おかげだ', 'おかげです', 'おかげさまで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-96', $$先生のおかげで、試験に合格できました。$$, $$せんせいのおかげで、しけんにごうかくできました。$$, $$Graças ao professor, consegui passar na prova.$$),
    ('n3-grammar-96', $$薬を飲んだおかげで、熱が下がった。$$, $$くすりをのんだおかげで、ねつがさがった。$$, $$Graças ao remédio que tomei, a febre baixou.$$),
    ('n3-grammar-96', $$天気がよかったおかげで、楽しい旅行になった。$$, $$てんきがよかったおかげで、たのしいりょこうになった。$$, $$Graças ao tempo bom, a viagem foi divertida.$$),
    ('n3-grammar-96', $$友達が手伝ってくれたおかげで、早く終わった。$$, $$ともだちがてつだってくれたおかげで、はやくおわった。$$, $$Graças à ajuda do meu amigo, terminei cedo.$$),
    ('n3-grammar-96', $$成功できたのは、みんなのおかげです。$$, $$せいこうできたのは、みんなのおかげです。$$, $$Se consegui ter sucesso, foi graças a todos vocês.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家族の____、元気に暮らしています。$$, $$Graças à minha família, vivo bem e com saúde.$$),
        (2, $$毎日練習した____、上手になった。$$, $$Graças ao treino diário, melhorei.$$),
        (3, $$地図があった____、道に迷わなかった。$$, $$Graças ao mapa, não me perdi.$$),
        (4, $$早く寝た____、今朝は気分がいい。$$, $$Graças a ter dormido cedo, hoje de manhã estou me sentindo bem.$$),
        (5, $$田中さんが教えてくれた____、わかりました。$$, $$Graças à explicação do Tanaka, entendi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-96', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$おかげで$$),
        (2, $$おかげで$$),
        (3, $$おかげで$$),
        (4, $$おかげで$$),
        (5, $$おかげで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-97 — 〜っぱなし
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-97',
    'grammar',
    'N3',
    $$〜っぱなし$$,
    $$ppanashi$$,
    $$Deixar ligado / Deixar aberto / Sem parar$$,
    $$っぱなし é usado para indicar que algo foi deixado em um estado, sem ser desfeito, ou que uma ação continua sem parar. Equivale a "deixar ligado", "deixar aberto" ou "sem parar".

A estrutura junta o verbo na forma ます sem ます com っぱなし.

Ela tem dois usos principais. O primeiro é deixar algo como está, quando o normal seria desfazer: deixar a luz acesa, a janela aberta, a água correndo, as roupas jogadas. O tom é de crítica ou de descuido.

O segundo é uma ação ou estado que continua por muito tempo sem interrupção, como ficar de pé o dia inteiro ou falar sem parar.

っぱなし funciona como um substantivo: pode ser seguido de で, に, の e だ.$$,
    $$Comparado a まま, っぱなし tem um tom mais negativo e de descuido. つけたまま é neutro; つけっぱなし sugere desleixo.

Expressões como 出しっぱなし e 開けっぱなし são muito usadas em broncas de pais para filhos.

O uso de continuidade, como 立ちっぱなし, é comum para reclamar de cansaço.$$,
    $$Verbo na forma ます sem ます + っぱなし + で (deixando...)
Verbo sem ます + っぱなし + に + する (deixar assim)
Verbo sem ます + っぱなし + だ (sem parar)

Escrita: っぱなし / っ放し$$,
    $$っぱなし$$,
    $$っぱなし|っ放し$$,
    ARRAY['っぱなし']::text[],
    ARRAY['っぱなし', 'っ放し']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-97', $$電気をつけっぱなしで寝てしまった。$$, $$でんきをつけっぱなしでねてしまった。$$, $$Acabei dormindo com a luz acesa.$$),
    ('n3-grammar-97', $$窓を開けっぱなしにしないでください。$$, $$まどをあけっぱなしにしないでください。$$, $$Não deixe a janela aberta, por favor.$$),
    ('n3-grammar-97', $$水を出しっぱなしにしてはいけない。$$, $$みずをだしっぱなしにしてはいけない。$$, $$Não se deve deixar a água correndo.$$),
    ('n3-grammar-97', $$今日は一日中立ちっぱなしで、足が痛い。$$, $$きょうはいちにちじゅうたちっぱなしで、あしがいたい。$$, $$Hoje fiquei de pé o dia inteiro, e meus pés doem.$$),
    ('n3-grammar-97', $$彼はいつも服を脱ぎっぱなしにする。$$, $$かれはいつもふくをぬぎっぱなしにする。$$, $$Ele sempre deixa as roupas jogadas depois de tirar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$テレビをつけ____で出かけてしまった。$$, $$Saí deixando a TV ligada.$$),
        (2, $$本を出し____にしないで、片付けなさい。$$, $$Não deixe os livros espalhados, guarde-os.$$),
        (3, $$満員電車で一時間立ち____だった。$$, $$Fiquei uma hora de pé no trem lotado.$$),
        (4, $$寒いので、ドアを開け____にしないでください。$$, $$Está frio, então não deixe a porta aberta.$$),
        (5, $$彼は朝から話し____だ。$$, $$Ele está falando sem parar desde de manhã.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-97', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$っぱなし$$),
        (2, $$っぱなし$$),
        (3, $$っぱなし$$),
        (4, $$っぱなし$$),
        (5, $$っぱなし$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-98 — 〜っぽい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-98',
    'grammar',
    'N3',
    $$〜っぽい$$,
    $$ppoi$$,
    $$Com jeito de / Meio / Que tende a$$,
    $$っぽい é um sufixo informal com dois usos principais.

O primeiro é indicar que algo parece ou tem características de outra coisa, sem ser exatamente aquilo. Equivale a "com jeito de" ou "meio". Por exemplo, 子供っぽい (infantil, com jeito de criança), 安っぽい (com cara de barato), 熱っぽい (meio febril).

O segundo, com verbos, indica uma tendência a fazer algo com frequência. Por exemplo, 忘れっぽい (esquecido, que esquece fácil), 怒りっぽい (que se irrita fácil), 飽きっぽい (que enjoa das coisas rápido).

Ele vem depois de substantivos, de adjetivos い sem い e de verbos na forma ます sem ます. O resultado funciona como um adjetivo い.

O tom costuma ser casual e, muitas vezes, levemente negativo.$$,
    $$大人っぽい (com jeito de adulto, maduro) costuma ser um elogio, enquanto 子供っぽい (infantil) geralmente é uma crítica.

Na fala jovem, っぽい também é usado no fim da frase com o sentido de "parece que", como em 雨っぽい (parece que vai chover).

Comparado a らしい, que significa "típico de" algo ideal, っぽい indica uma semelhança mais superficial.$$,
    $$Substantivo + っぽい (子供っぽい / 大人っぽい / 熱っぽい)
Adjetivo い sem い + っぽい (安っぽい)
Verbo na forma ます sem ます + っぽい (忘れっぽい / 怒りっぽい / 飽きっぽい)

Conjugação: っぽくない / っぽかった / っぽく$$,
    $$っぽい$$,
    $$っぽい|っぽく|っぽかった$$,
    ARRAY['っぽい']::text[],
    ARRAY['っぽい', 'っぽく', 'っぽかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-98', $$彼は大人だが、子供っぽいところがある。$$, $$かれはおとなだが、こどもっぽいところがある。$$, $$Ele é adulto, mas tem um lado meio infantil.$$),
    ('n3-grammar-98', $$最近、忘れっぽくなった。$$, $$さいきん、わすれっぽくなった。$$, $$Ultimamente, fiquei esquecido.$$),
    ('n3-grammar-98', $$この服は少し安っぽい。$$, $$このふくはすこしやすっぽい。$$, $$Esta roupa tem um pouco cara de barata.$$),
    ('n3-grammar-98', $$今日は熱っぽいので、早く帰ります。$$, $$きょうはねつっぽいので、はやくかえります。$$, $$Hoje estou meio febril, então vou embora mais cedo.$$),
    ('n3-grammar-98', $$彼女は怒りっぽい性格だ。$$, $$かのじょはおこりっぽいせいかくだ。$$, $$Ela tem um temperamento que se irrita fácil.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$弟は飽き____ので、何をしても続かない。$$, $$Meu irmão mais novo enjoa das coisas rápido, então não continua nada.$$),
        (2, $$まだ中学生なのに、彼の話し方は大人____。$$, $$Ele ainda está no ginásio, mas fala de um jeito bem maduro.$$),
        (3, $$風邪をひいたのか、少し熱____。$$, $$Será que peguei um resfriado? Estou meio febril.$$),
        (4, $$年をとって、忘れ____なった。$$, $$Com a idade, fiquei esquecido.$$),
        (5, $$このかばんは安____見える。$$, $$Esta bolsa parece meio barata.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-98', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$っぽい$$),
        (2, $$っぽい$$),
        (3, $$っぽい$$),
        (4, $$っぽく$$),
        (5, $$っぽく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-99 — 〜さえ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-99',
    'grammar',
    'N3',
    $$〜さえ$$,
    $$sae$$,
    $$Até mesmo / Nem sequer$$,
    $$さえ é uma partícula de ênfase que destaca um caso extremo. Equivale a "até mesmo" ou, em frases negativas, "nem sequer".

A ideia é que, se até aquele caso extremo é verdade, então os outros casos, mais fáceis ou mais óbvios, também são. Por exemplo, "nem o professor sabia" sugere que ninguém mais saberia.

É muito usado em frases negativas, para mostrar uma situação muito ruim ou surpreendente: "não tenho tempo nem para almoçar" ou "não consegui escrever nem o meu nome".

さえ substitui は, が e を. Com outras partículas, fica depois delas, como にさえ e でさえ. Com substantivos que são sujeito, também se usa でさえ, que soa mais enfático.$$,
    $$さえ é parecido com も (até) e すら (até mesmo, mais formal e literário).

Em frases afirmativas, さえ também aparece, como em 子供でさえ知っている (até uma criança sabe).

Com ば, a estrutura さえ〜ば tem outro sentido, "basta que...", e aparece na gramática seguinte.$$,
    $$Substantivo + さえ + Frase (geralmente negativa)
Substantivo + でさえ (sujeito, mais enfático)
Substantivo + partícula + さえ (にさえ / とさえ)
Verbo na forma ます sem ます / Verbo て + さえ$$,
    $$さえ$$,
    $$さえ$$,
    ARRAY['さえ']::text[],
    ARRAY['さえ', 'でさえ', 'にさえ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-99', $$忙しくて、昼ご飯を食べる時間さえない。$$, $$いそがしくて、ひるごはんをたべるじかんさえない。$$, $$Estou tão ocupado que não tenho tempo nem para almoçar.$$),
    ('n3-grammar-99', $$この問題は先生さえわからなかった。$$, $$このもんだいはせんせいさえわからなかった。$$, $$Nem o professor conseguiu resolver esta questão.$$),
    ('n3-grammar-99', $$それは子供でさえ知っていることだ。$$, $$それはこどもでさえしっていることだ。$$, $$Isso é algo que até uma criança sabe.$$),
    ('n3-grammar-99', $$疲れて、立っていることさえできない。$$, $$つかれて、たっていることさえできない。$$, $$Estou tão cansado que não consigo nem ficar de pé.$$),
    ('n3-grammar-99', $$彼は自分の名前さえ書けなかった。$$, $$かれはじぶんのなまえさえかけなかった。$$, $$Ele não conseguia escrever nem o próprio nome.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$驚いて、声____出なかった。$$, $$Fiquei tão surpreso que nem sequer consegui falar.$$),
        (2, $$親友に____言えない秘密がある。$$, $$Tenho um segredo que não consigo contar nem para o meu melhor amigo.$$),
        (3, $$日本語を始めたばかりで、ひらがな____読めない。$$, $$Acabei de começar japonês e nem consigo ler hiragana.$$),
        (4, $$水____飲めないほど、喉が痛い。$$, $$Minha garganta dói tanto que nem consigo beber água.$$),
        (5, $$彼は簡単な料理____作れない。$$, $$Ele não sabe fazer nem uma comida simples.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-99', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さえ$$),
        (2, $$さえ$$),
        (3, $$さえ$$),
        (4, $$さえ$$),
        (5, $$さえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-100 — 〜さえ〜ば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-100',
    'grammar',
    'N3',
    $$〜さえ〜ば$$,
    $$sae ~ ba$$,
    $$Basta que / Desde que / Se ao menos$$,
    $$さえ〜ば é usado para dizer que uma única condição é suficiente para que algo aconteça. Equivale a "basta que", "desde que" ou "se ao menos".

A ideia é que, se aquela condição for cumprida, todo o resto se resolve. Por exemplo, "se ao menos eu tivesse tempo, poderia estudar mais" ou "basta tomar este remédio para melhorar".

Com substantivos, さえ vem depois do substantivo, e a condição usa ば: 時間さえあれば.

Com verbos, a estrutura fica Verbo sem ます + さえすれば: 飲みさえすれば (basta tomar). Com a forma て, fica てさえいれば.

Com adjetivos, fica Adjetivo + さえ + condição: 天気さえよければ.$$,
    $$Às vezes, o tom é de crítica a quem acha que uma coisa resolve tudo, como em "achar que basta ter dinheiro".

Em frases com のに no final, さえ〜ば expressa arrependimento: 時間さえあれば、できたのに.

A expressão あなたさえよければ ("se estiver tudo bem para você") é uma forma gentil de fazer um convite.$$,
    $$Substantivo + さえ + Verbo / Adjetivo ば
Verbo na forma ます sem ます + さえすれば
Verbo na forma て + さえいれば
Substantivo / Adjetivo な + さえ + なら / であれば$$,
    $$さえ$$,
    $$さえ$$,
    ARRAY['さえ', 'ば']::text[],
    ARRAY['さえ〜ば', 'さえすれば', 'さえあれば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-100', $$時間さえあれば、もっと勉強できるのに。$$, $$じかんさえあれば、もっとべんきょうできるのに。$$, $$Se ao menos eu tivesse tempo, poderia estudar mais.$$),
    ('n3-grammar-100', $$この薬を飲みさえすれば、すぐ治ります。$$, $$このくすりをのみさえすれば、すぐなおります。$$, $$Basta tomar este remédio para melhorar logo.$$),
    ('n3-grammar-100', $$天気さえよければ、ここから富士山が見える。$$, $$てんきさえよければ、ここからふじさんがみえる。$$, $$Desde que o tempo esteja bom, dá para ver o Monte Fuji daqui.$$),
    ('n3-grammar-100', $$お金さえあれば、何でも買えると思うのは間違いだ。$$, $$おかねさえあれば、なんでもかえるとおもうのはまちがいだ。$$, $$É um erro achar que basta ter dinheiro para comprar tudo.$$),
    ('n3-grammar-100', $$あなたさえよければ、一緒に行きましょう。$$, $$あなたさえよければ、いっしょにいきましょう。$$, $$Se estiver tudo bem para você, vamos juntos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$君____いれば、何もいらない。$$, $$Basta você estar comigo, não preciso de mais nada.$$),
        (2, $$地図____あれば、一人で行ける。$$, $$Desde que eu tenha um mapa, consigo ir sozinho.$$),
        (3, $$毎日練習し____すれば、上手になる。$$, $$Basta praticar todo dia para melhorar.$$),
        (4, $$体____丈夫なら、どんな仕事もできる。$$, $$Desde que a saúde esteja boa, dá para fazer qualquer trabalho.$$),
        (5, $$雨____降らなければ、試合はできる。$$, $$Desde que não chova, dá para fazer a partida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-100', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さえ$$),
        (2, $$さえ$$),
        (3, $$さえ$$),
        (4, $$さえ$$),
        (5, $$さえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-101 — 〜際に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-101',
    'grammar',
    'N3',
    $$〜際に$$,
    $$sai ni$$,
    $$Quando / Na ocasião de / No momento de$$,
    $$際に é uma forma formal de dizer "quando" ou "na ocasião de". Ele indica um momento ou uma situação específica em que algo acontece ou deve ser feito.

É muito usado em avisos, instruções, anúncios e textos de trabalho, principalmente para situações especiais ou importantes, como emergências, pagamentos, embarques e visitas.

Ele vem depois de substantivos com の e da forma simples dos verbos (dicionário ou た).

Com は, 際は dá um tom de instrução ou regra: "no momento de descer, cuidado com os pés". Com には, reforça o destaque.

Comparado a とき, 際に soa bem mais formal e quase não é usado na conversa casual.$$,
    $$Em trens e lojas, avisos como お降りの際は e お支払いの際は são extremamente comuns.

Nas formas escritas, também aparece 際、 com vírgula, sem に.

Para uso cotidiano, prefira とき. 際に soa como linguagem de documento ou de anúncio.$$,
    $$Substantivo + の + 際に / 際は / 際には
Verbo (forma de dicionário / た) + 際に / 際は
お / ご + Substantivo + の + 際は (muito educado)

Escrita: 際 / さい$$,
    $$際に$$,
    $$際に|際は|際には|際、|さいに$$,
    ARRAY['際', 'に']::text[],
    ARRAY['際に', '際は', '際には']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-101', $$日本に来た際に、富士山に登りました。$$, $$にほんにきたさいに、ふじさんにのぼりました。$$, $$Quando vim ao Japão, subi o Monte Fuji.$$),
    ('n3-grammar-101', $$お降りの際は、足元にご注意ください。$$, $$おおりのさいは、あしもとにごちゅういください。$$, $$Ao descer, cuidado com os pés.$$),
    ('n3-grammar-101', $$会議の際に、資料を配ります。$$, $$かいぎのさいに、しりょうをくばります。$$, $$Na ocasião da reunião, distribuiremos os documentos.$$),
    ('n3-grammar-101', $$地震の際には、エレベーターを使わないでください。$$, $$じしんのさいには、エレベーターをつかわないでください。$$, $$Em caso de terremoto, não use o elevador.$$),
    ('n3-grammar-101', $$申し込みの際、身分証明書が必要です。$$, $$もうしこみのさい、みぶんしょうめいしょがひつようです。$$, $$No momento da inscrição, é necessário um documento de identidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$部屋を出る____、電気を消してください。$$, $$Ao sair do quarto, apague a luz, por favor.$$),
        (2, $$出張で東京に行った____、友達に会った。$$, $$Quando fui a Tóquio a trabalho, encontrei um amigo.$$),
        (3, $$非常の____、このボタンを押してください。$$, $$Em caso de emergência, aperte este botão.$$),
        (4, $$お支払いの____、カードもご利用いただけます。$$, $$No momento do pagamento, também é possível usar cartão.$$),
        (5, $$次回お越しの____、このチケットをお持ちください。$$, $$Na próxima visita, traga este ingresso, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-101', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$際に$$),
        (1, $$際は$$),
        (2, $$際に$$),
        (3, $$際は$$),
        (3, $$際に$$),
        (4, $$際は$$),
        (4, $$際に$$),
        (5, $$際は$$),
        (5, $$際に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-102 — 〜最中に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-102',
    'grammar',
    'N3',
    $$〜最中に$$,
    $$saichuu ni$$,
    $$Bem no meio de / Justo quando / Em pleno$$,
    $$最中に é usado para dizer que algo aconteceu bem no meio de outra ação ou evento, geralmente atrapalhando ou interrompendo. Equivale a "bem no meio de", "justo quando" ou "em pleno".

最中 significa "o auge", "o ponto central" de uma ação. Assim, a estrutura destaca que o acontecimento veio exatamente na hora em que a outra coisa estava em andamento.

Ele vem depois de substantivos com の e de verbos na forma ている.

A segunda parte costuma ser algo inesperado ou indesejado, como o telefone tocar no meio da reunião ou um terremoto durante a refeição.

Na forma 最中だ ou 最中です, no fim da frase, indica que a pessoa está no meio de algo e não pode ser interrompida.$$,
    $$Comparado a 間に e 中に, 最中に destaca mais o momento crítico e a interrupção.

A leitura é さいちゅう. A leitura もなか existe, mas é o nome de um doce japonês.

A segunda parte geralmente não é uma ação planejada por quem fala, e sim um imprevisto.$$,
    $$Substantivo + の + 最中に + Acontecimento
Verbo na forma ている + 最中に + Acontecimento
… + 最中だ / 最中です (estou no meio de...)

Escrita: 最中 / さいちゅう$$,
    $$最中に$$,
    $$最中に|最中だ|最中です|さいちゅう$$,
    ARRAY['最中', 'に']::text[],
    ARRAY['最中に', '最中だ', '最中です']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-102', $$会議の最中に、電話が鳴った。$$, $$かいぎのさいちゅうに、でんわがなった。$$, $$O telefone tocou bem no meio da reunião.$$),
    ('n3-grammar-102', $$食事の最中に、地震が起きた。$$, $$しょくじのさいちゅうに、じしんがおきた。$$, $$Houve um terremoto justo durante a refeição.$$),
    ('n3-grammar-102', $$試合の最中に、雨が降り出した。$$, $$しあいのさいちゅうに、あめがふりだした。$$, $$Começou a chover em plena partida.$$),
    ('n3-grammar-102', $$今、勉強している最中だから、静かにして。$$, $$いま、べんきょうしているさいちゅうだから、しずかにして。$$, $$Estou bem no meio dos estudos, então faça silêncio.$$),
    ('n3-grammar-102', $$お風呂に入っている最中に、停電した。$$, $$おふろにはいっているさいちゅうに、ていでんした。$$, $$A luz acabou justo quando eu estava no banho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$授業の____、携帯が鳴ってしまった。$$, $$O celular tocou bem no meio da aula.$$),
        (2, $$スピーチの____、言葉を忘れた。$$, $$Esqueci as palavras em pleno discurso.$$),
        (3, $$料理をしている____、友達が来た。$$, $$Um amigo chegou justo quando eu estava cozinhando.$$),
        (4, $$今、話し合いの____から、後で来てください。$$, $$Agora estamos no meio de uma discussão, então venha mais tarde.$$),
        (5, $$映画を見ている____、寝てしまった。$$, $$Acabei dormindo bem no meio do filme.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-102', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$最中に$$),
        (2, $$最中に$$),
        (3, $$最中に$$),
        (4, $$最中だ$$),
        (4, $$最中です$$),
        (5, $$最中に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-103 — さらに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-103',
    'grammar',
    'N3',
    $$さらに$$,
    $$sara ni$$,
    $$Ainda mais / Além disso / Mais ainda$$,
    $$さらに é um advérbio com dois usos principais.

O primeiro é indicar que algo aumentou ou se intensificou: "ainda mais". Por exemplo, "a chuva ficou ainda mais forte" ou "depois de praticar, fiquei ainda melhor".

O segundo é acrescentar uma informação nova, no começo de uma frase: "além disso". Por exemplo, "esta loja é barata. Além disso, o atendimento é bom".

さらに soa um pouco mais formal que もっと e é muito usado em textos, notícias, apresentações e propagandas.

Antes de expressões de quantidade, como 多くの, indica um aumento: "ainda mais pessoas".$$,
    $$Comparado a もっと, さらに indica que algo já era alto e aumentou ainda mais.

Em propagandas, さらに aparece muito para apresentar vantagens extras: "e mais...".

Para listar argumentos em textos, さらに funciona como "além disso" ou "ademais".$$,
    $$さらに + Adjetivo / Verbo de mudança (ainda mais)
Frase 1 (com ponto final) + さらに、 + Frase 2 (além disso)
さらに + 多くの / 大きな + Substantivo

Escrita: さらに / 更に$$,
    $$さらに$$,
    $$さらに|更に$$,
    ARRAY['さらに']::text[],
    ARRAY['さらに', '更に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-103', $$夜になって、雨はさらに強くなった。$$, $$よるになって、あめはさらにつよくなった。$$, $$À noite, a chuva ficou ainda mais forte.$$),
    ('n3-grammar-103', $$たくさん練習して、さらに上手になった。$$, $$たくさんれんしゅうして、さらにじょうずになった。$$, $$Pratiquei bastante e fiquei ainda melhor.$$),
    ('n3-grammar-103', $$この店は安い。さらに、サービスもいい。$$, $$このみせはやすい。さらに、サービスもいい。$$, $$Esta loja é barata. Além disso, o atendimento é bom.$$),
    ('n3-grammar-103', $$来年は、さらに多くの観光客が来るだろう。$$, $$らいねんは、さらにおおくのかんこうきゃくがくるだろう。$$, $$No ano que vem, devem vir ainda mais turistas.$$),
    ('n3-grammar-103', $$説明を聞いて、さらにわからなくなった。$$, $$せつめいをきいて、さらにわからなくなった。$$, $$Ouvi a explicação e fiquei ainda mais confuso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夜になって、寒さが____厳しくなった。$$, $$À noite, o frio ficou ainda mais rigoroso.$$),
        (2, $$この部屋は広い。____、日当たりもいい。$$, $$Este quarto é amplo. Além disso, recebe bastante sol.$$),
        (3, $$薬を飲んだら、____悪くなった。$$, $$Depois de tomar o remédio, piorei ainda mais.$$),
        (4, $$新しい店は、前の店より____大きい。$$, $$A loja nova é ainda maior que a anterior.$$),
        (5, $$来月から、料金が____上がる予定です。$$, $$A partir do mês que vem, a tarifa vai subir ainda mais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-103', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さらに$$),
        (1, $$更に$$),
        (2, $$さらに$$),
        (2, $$更に$$),
        (3, $$さらに$$),
        (3, $$更に$$),
        (4, $$さらに$$),
        (4, $$更に$$),
        (5, $$さらに$$),
        (5, $$更に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-104 — さて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-104',
    'grammar',
    'N3',
    $$さて$$,
    $$sate$$,
    $$Bem / Então / Agora$$,
    $$さて é uma palavra usada para mudar de assunto, começar algo novo ou passar para a próxima etapa. Equivale a "bem", "então" ou "agora".

Ela aparece muito no começo de frases, em três situações principais:
• Começar algo: em aulas, reuniões e discursos, para iniciar o assunto principal.
• Passar para o próximo ponto: depois de terminar uma parte, para ir à seguinte.
• Falar consigo mesmo: quando a pessoa está decidindo o que fazer, como "bem, o que eu faço agora?".

Em cartas e e-mails formais, さて aparece depois das saudações iniciais, para introduzir o assunto da mensagem.

O tom é neutro e serve tanto para situações formais quanto informais.$$,
    $$Em cartas formais japonesas, a estrutura tradicional é: saudação de estação do ano, depois さて, e então o assunto principal.

さて é diferente de ところで, que muda de assunto de forma mais repentina, como "a propósito".

Falado com uma pausa, さて… soa como alguém se preparando para agir.$$,
    $$さて、 + Frase (início / mudança de assunto)
さて、 + Pergunta para si mesmo (どうしようか)$$,
    $$さて$$,
    $$さて$$,
    ARRAY['さて']::text[],
    ARRAY['さて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-104', $$さて、今日の授業を始めましょう。$$, $$さて、きょうのじゅぎょうをはじめましょう。$$, $$Bem, vamos começar a aula de hoje.$$),
    ('n3-grammar-104', $$さて、次の問題に移ります。$$, $$さて、つぎのもんだいにうつります。$$, $$Agora, vamos passar para a próxima questão.$$),
    ('n3-grammar-104', $$食事も終わったし、さて、帰ろうか。$$, $$しょくじもおわったし、さて、かえろうか。$$, $$Já terminamos de comer, então, vamos embora?$$),
    ('n3-grammar-104', $$さて、これからどうしようか。$$, $$さて、これからどうしようか。$$, $$Bem, e agora, o que eu faço?$$),
    ('n3-grammar-104', $$皆さん、こんにちは。さて、本日は新商品を紹介します。$$, $$みなさん、こんにちは。さて、ほんじつはしんしょうひんをしょうかいします。$$, $$Boa tarde a todos. Bem, hoje vamos apresentar um novo produto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$皆さん、そろったようですね。____、会議を始めます。$$, $$Parece que todos chegaram. Bem, vamos começar a reunião.$$),
        (2, $$前置きはこのくらいにして、____、本題に入りましょう。$$, $$Chega de introdução. Agora, vamos ao assunto principal.$$),
        (3, $$____、何から始めようかな。$$, $$Bem, por onde será que eu começo?$$),
        (4, $$宿題が終わった。____、ゲームでもしよう。$$, $$Terminei a lição. Bem, vou jogar um pouco de videogame.$$),
        (5, $$お待たせしました。____、次は皆さんお待ちかねの抽選会です。$$, $$Obrigado pela espera. Agora, o momento que todos esperavam: o sorteio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-104', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さて$$),
        (2, $$さて$$),
        (3, $$さて$$),
        (4, $$さて$$),
        (5, $$さて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-105 — 〜せいで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-105',
    'grammar',
    'N3',
    $$〜せいで$$,
    $$sei de$$,
    $$Por culpa de / Por causa de (negativo)$$,
    $$せいで é usado para indicar a causa de um resultado negativo. Equivale a "por culpa de" ou "por causa de".

A primeira parte mostra a causa, e a segunda, o resultado ruim. Muitas vezes, há um tom de culpa, reclamação ou responsabilidade. Por exemplo, "por causa da chuva, a partida foi cancelada" ou "por culpa dele, o plano fracassou".

Ele vem depois de substantivos com の e da forma simples de verbos e adjetivos.

Na forma せいだ ou せいです, no fim da frase, indica diretamente de quem é a culpa: "a culpa é minha".

O oposto, para causas positivas, é おかげで.$$,
    $$Usar せいで com pessoas é uma forma direta de culpar alguém. Deve ser usado com cuidado.

Para assumir a responsabilidade com educação, a frase 私のせいです ("a culpa é minha") é comum.

A forma せいか (N2) indica uma causa provável: "talvez por causa de...".$$,
    $$Substantivo + の + せいで + Resultado negativo
Verbo / Adjetivo (forma simples) + せいで + Resultado negativo
Adjetivo な + な + せいで
… + のは + 〜のせいだ / せいです$$,
    $$せいで$$,
    $$せいで|せいだ|せいです|所為で$$,
    ARRAY['せい', 'で']::text[],
    ARRAY['せいで', 'せいだ', 'せいです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-105', $$雨のせいで、試合が中止になった。$$, $$あめのせいで、しあいがちゅうしになった。$$, $$Por causa da chuva, a partida foi cancelada.$$),
    ('n3-grammar-105', $$寝坊したせいで、遅刻してしまった。$$, $$ねぼうしたせいで、ちこくしてしまった。$$, $$Por ter dormido demais, acabei chegando atrasado.$$),
    ('n3-grammar-105', $$彼のせいで、計画が失敗した。$$, $$かれのせいで、けいかくがしっぱいした。$$, $$Por culpa dele, o plano fracassou.$$),
    ('n3-grammar-105', $$甘い物を食べすぎたせいで、太った。$$, $$あまいものをたべすぎたせいで、ふとった。$$, $$Engordei por ter comido doce demais.$$),
    ('n3-grammar-105', $$失敗したのは、私のせいです。$$, $$しっぱいしたのは、わたしのせいです。$$, $$A culpa pelo fracasso é minha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$事故の____、電車が遅れた。$$, $$Por causa do acidente, o trem atrasou.$$),
        (2, $$風邪をひいた____、声が出ない。$$, $$Por causa do resfriado, estou sem voz.$$),
        (3, $$道が混んでいた____、約束の時間に間に合わなかった。$$, $$Por causa do trânsito, não cheguei a tempo para o compromisso.$$),
        (4, $$彼がうそをついた____、みんなが困った。$$, $$Por culpa da mentira dele, todos ficaram em apuros.$$),
        (5, $$寝不足の____、頭が痛い。$$, $$Por falta de sono, estou com dor de cabeça.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-105', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せいで$$),
        (2, $$せいで$$),
        (3, $$せいで$$),
        (4, $$せいで$$),
        (5, $$せいで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-106 — せいぜい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-106',
    'grammar',
    'N3',
    $$せいぜい$$,
    $$seizei$$,
    $$No máximo / Quando muito / Na melhor das hipóteses$$,
    $$せいぜい é um advérbio que indica o limite máximo de algo, geralmente com a ideia de que não é muito. Equivale a "no máximo", "quando muito" ou "na melhor das hipóteses".

Ele aparece muito com quantidades, tempos e preços, mostrando que o valor é pequeno ou limitado: "até a estação, a pé, são no máximo dez minutos" ou "virão no máximo umas vinte pessoas".

Também pode indicar o máximo que alguém consegue fazer, com modéstia ou resignação: "o máximo que posso fazer é isso".

O tom costuma ser de "não é grande coisa" ou de cálculo realista.$$,
    $$Em um uso mais antigo e irônico, せいぜい頑張って significa algo como "boa sorte aí" com tom de desdém. Cuidado com esse sentido.

Comparado a 多くても (no máximo), せいぜい soa mais natural na conversa.

O oposto, para "no mínimo", é 少なくとも.$$,
    $$せいぜい + Quantidade / Tempo / Preço + だ / ぐらいだ
せいぜい + … + だろう (estimativa)
Sujeito + にできるのは + せいぜい + … + だ

Escrita: せいぜい / 精々$$,
    $$せいぜい$$,
    $$せいぜい|精々$$,
    ARRAY['せいぜい']::text[],
    ARRAY['せいぜい', '精々']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-106', $$駅まで歩いても、せいぜい十分だ。$$, $$えきまであるいても、せいぜいじゅっぷんだ。$$, $$Mesmo a pé, até a estação são no máximo dez minutos.$$),
    ('n3-grammar-106', $$この仕事なら、せいぜい一時間で終わるだろう。$$, $$このしごとなら、せいぜいいちじかんでおわるだろう。$$, $$Este trabalho deve levar no máximo uma hora.$$),
    ('n3-grammar-106', $$パーティーに来るのは、せいぜい二十人ぐらいだ。$$, $$パーティーにくるのは、せいぜいにじゅうにんぐらいだ。$$, $$Para a festa, devem vir no máximo umas vinte pessoas.$$),
    ('n3-grammar-106', $$私にできるのは、せいぜいこのくらいです。$$, $$わたしにできるのは、せいぜいこのくらいです。$$, $$O máximo que eu consigo fazer é isso.$$),
    ('n3-grammar-106', $$給料が上がっても、せいぜい五千円だろう。$$, $$きゅうりょうがあがっても、せいぜいごせんえんだろう。$$, $$Mesmo que o salário aumente, será no máximo cinco mil ienes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この古い車なら、売っても____十万円だろう。$$, $$Um carro velho desses, mesmo vendendo, vai dar no máximo cem mil ienes.$$),
        (2, $$夏休みと言っても、____一週間しかない。$$, $$Férias de verão, que nada: são no máximo uma semana.$$),
        (3, $$忙しくて、練習は____一日一時間しかできない。$$, $$Estou ocupado e consigo treinar no máximo uma hora por dia.$$),
        (4, $$この部屋に入れるのは、____五人だ。$$, $$Neste quarto cabem no máximo cinco pessoas.$$),
        (5, $$明日は雨が降っても、____小雨程度でしょう。$$, $$Mesmo que chova amanhã, deve ser no máximo uma garoa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-106', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せいぜい$$),
        (2, $$せいぜい$$),
        (3, $$せいぜい$$),
        (4, $$せいぜい$$),
        (5, $$せいぜい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-107 — しばらく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-107',
    'grammar',
    'N3',
    $$しばらく$$,
    $$shibaraku$$,
    $$Um pouco / Por um tempo / Por algum tempo$$,
    $$しばらく é um advérbio que indica um período de tempo, que pode ser curto ou relativamente longo, dependendo do contexto. Equivale a "um pouco", "por um tempo" ou "por algum tempo".

Os usos mais comuns são:
• Pedir que alguém espere um pouco: しばらくお待ちください, muito usado no atendimento.
• Falar de um período sem algo acontecer: "faz tempo que não nos vemos".
• Indicar que algo aconteceu depois de um tempo: しばらくして / しばらくすると (depois de um tempo).
• Planos temporários: しばらくの間 (por algum tempo).

O tamanho do período é vago: pode ser alguns minutos ou alguns meses. O contexto mostra qual é.$$,
    $$A saudação しばらくですね significa "quanto tempo!", parecida com 久しぶりですね, mas um pouco mais formal.

しばらくお待ちください soa mais formal que ちょっと待ってください.

Em mensagens de ausência, しばらく留守にします significa "vou ficar fora por um tempo".$$,
    $$しばらく + Verbo (por um tempo)
しばらく + Verbo negativo (faz tempo que não...)
しばらくして / しばらくすると (depois de um tempo)
しばらくの間 + … (por algum tempo)

Escrita: しばらく / 暫く$$,
    $$しばらく$$,
    $$しばらく|暫く$$,
    ARRAY['しばらく']::text[],
    ARRAY['しばらく', '暫く']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-107', $$しばらくお待ちください。$$, $$しばらくおまちください。$$, $$Aguarde um momento, por favor.$$),
    ('n3-grammar-107', $$しばらく会わないうちに、背が伸びたね。$$, $$しばらくあわないうちに、せがのびたね。$$, $$Faz um tempo que não te vejo, e você cresceu, hein.$$),
    ('n3-grammar-107', $$仕事が忙しくて、しばらく休みが取れない。$$, $$しごとがいそがしくて、しばらくやすみがとれない。$$, $$Estou com o trabalho corrido e não vou conseguir tirar folga por um tempo.$$),
    ('n3-grammar-107', $$しばらくして、雨がやんだ。$$, $$しばらくして、あめがやんだ。$$, $$Depois de um tempo, a chuva parou.$$),
    ('n3-grammar-107', $$しばらくの間、この町に住む予定です。$$, $$しばらくのあいだ、このまちにすむよていです。$$, $$Pretendo morar nesta cidade por algum tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____休んでから、また始めましょう。$$, $$Vamos descansar um pouco e depois recomeçar.$$),
        (2, $$彼とは____連絡を取っていない。$$, $$Faz um tempo que não falo com ele.$$),
        (3, $$駅で待っていると、____すると、電車が来た。$$, $$Esperei na estação e, depois de um tempo, o trem chegou.$$),
        (4, $$来週から、____の間、留守にします。$$, $$A partir da semana que vem, vou ficar fora por algum tempo.$$),
        (5, $$会議室は今使っていますので、____お待ちください。$$, $$A sala de reunião está ocupada agora, então aguarde um pouco, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-107', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$しばらく$$),
        (2, $$しばらく$$),
        (3, $$しばらく$$),
        (4, $$しばらく$$),
        (5, $$しばらく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-108 — 〜しかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-108',
    'grammar',
    'N3',
    $$〜しかない$$,
    $$shika nai$$,
    $$Não ter outra opção a não ser / Só resta$$,
    $$しかない, depois de um verbo na forma de dicionário, indica que não existe outra opção: aquela é a única coisa que se pode fazer. Equivale a "não há outra opção a não ser" ou "só resta".

A ideia vem de しか〜ない ("só"), aplicada a ações. Ou seja, "só fazer isso é possível".

Ela costuma aparecer em situações difíceis, quando a pessoa aceita a realidade com resignação ou determinação. Por exemplo, "não tem trem, então o jeito é voltar a pé" ou "se chegamos até aqui, só resta nos esforçar".

No passado, しかなかった significa "não tive outra opção a não ser...".$$,
    $$Com substantivos, しか〜ない tem o sentido comum de "só": 千円しかない (só tenho mil ienes). Com verbos na forma de dicionário, o sentido é "não há outra opção".

ほかない tem o mesmo sentido, mas soa mais formal e escrito.

A frase やるしかない ("o jeito é fazer") é muito usada para se motivar diante de um desafio.$$,
    $$Verbo na forma de dicionário + しかない
Verbo + しかありません (educado)
Verbo + しかなかった (não tive outra opção)$$,
    $$しかない$$,
    $$しかない|しかありません|しかなかった$$,
    ARRAY['しか', 'ない']::text[],
    ARRAY['しかない', 'しかありません', 'しかなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-108', $$電車がないので、歩いて帰るしかない。$$, $$でんしゃがないので、あるいてかえるしかない。$$, $$Não tem trem, então o jeito é voltar a pé.$$),
    ('n3-grammar-108', $$誰も手伝ってくれないなら、一人でやるしかない。$$, $$だれもてつだってくれないなら、ひとりでやるしかない。$$, $$Se ninguém vai me ajudar, só resta fazer sozinho.$$),
    ('n3-grammar-108', $$約束したのだから、行くしかありません。$$, $$やくそくしたのだから、いくしかありません。$$, $$Eu prometi, então não tenho outra opção a não ser ir.$$),
    ('n3-grammar-108', $$お金がないので、あきらめるしかなかった。$$, $$おかねがないので、あきらめるしかなかった。$$, $$Como não tinha dinheiro, não tive outra opção a não ser desistir.$$),
    ('n3-grammar-108', $$ここまで来たら、もう頑張るしかない。$$, $$ここまできたら、もうがんばるしかない。$$, $$Já que chegamos até aqui, só resta nos esforçar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨がやまないので、待つ____。$$, $$A chuva não para, então o jeito é esperar.$$),
        (2, $$薬がないなら、病院に行く____。$$, $$Se não tem remédio, só resta ir ao hospital.$$),
        (3, $$間違えたのは私だから、謝る____。$$, $$Quem errou fui eu, então só resta pedir desculpas.$$),
        (4, $$昨日は終電を逃したので、タクシーで帰る____。$$, $$Ontem perdi o último trem, então não tive outra opção a não ser voltar de táxi.$$),
        (5, $$試験に合格するには、勉強する____。$$, $$Para passar na prova, não há outra opção a não ser estudar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-108', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$しかない$$),
        (1, $$しかありません$$),
        (2, $$しかない$$),
        (2, $$しかありません$$),
        (3, $$しかない$$),
        (3, $$しかありません$$),
        (4, $$しかなかった$$),
        (5, $$しかない$$),
        (5, $$しかありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-109 — そのために
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-109',
    'grammar',
    'N3',
    $$そのために$$,
    $$sono tame ni$$,
    $$Por isso / Por esse motivo / Para isso$$,
    $$そのために é uma expressão de ligação usada no começo de uma frase, que retoma o que foi dito antes. Ela tem dois sentidos, dependendo do contexto.

O primeiro é causa: "por isso", "por esse motivo". A frase anterior explica o motivo, e a frase com そのために mostra a consequência. Por exemplo, "nevou muito. Por isso, os trens pararam".

O segundo é objetivo: "para isso". A frase anterior apresenta um objetivo, e a frase com そのために mostra o que se faz para alcançá-lo. Por exemplo, "quero trabalhar no Japão. Para isso, estou estudando japonês".

A forma そのため, sem に, é mais comum no sentido de causa e soa formal. Ela aparece muito em notícias e textos explicativos.$$,
    $$O contexto mostra se é causa ou objetivo: se a primeira frase é um acontecimento, é causa; se é um desejo ou meta, é objetivo.

Em notícias, そのため aparece com muita frequência para explicar consequências de desastres e mudanças.

Na conversa casual, os japoneses costumam usar だから ou それで para causa.$$,
    $$Frase 1 (motivo, com ponto final) + そのために / そのため、 + Consequência
Frase 1 (objetivo, com ponto final) + そのために、 + Ação para alcançá-lo$$,
    $$そのために$$,
    $$そのために|そのため$$,
    ARRAY['その', 'ために']::text[],
    ARRAY['そのために', 'そのため']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-109', $$大雪が降った。そのために、電車が止まった。$$, $$おおゆきがふった。そのために、でんしゃがとまった。$$, $$Nevou muito. Por isso, os trens pararam.$$),
    ('n3-grammar-109', $$私は日本で働きたい。そのために、日本語を勉強している。$$, $$わたしはにほんではたらきたい。そのために、にほんごをべんきょうしている。$$, $$Quero trabalhar no Japão. Para isso, estou estudando japonês.$$),
    ('n3-grammar-109', $$道が混んでいた。そのため、会議に遅れた。$$, $$みちがこんでいた。そのため、かいぎにおくれた。$$, $$O trânsito estava ruim. Por esse motivo, me atrasei para a reunião.$$),
    ('n3-grammar-109', $$来月試験がある。そのために、毎日図書館に通っている。$$, $$らいげつしけんがある。そのために、まいにちとしょかんにかよっている。$$, $$Tenho prova no mês que vem. Para isso, vou à biblioteca todo dia.$$),
    ('n3-grammar-109', $$台風が近づいている。そのため、学校は休みになった。$$, $$たいふうがちかづいている。そのため、がっこうはやすみになった。$$, $$Um tufão está se aproximando. Por isso, as aulas foram canceladas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は留学したい。____、アルバイトでお金を貯めている。$$, $$Ele quer fazer intercâmbio. Para isso, está juntando dinheiro com trabalho de meio período.$$),
        (2, $$昨日は熱があった。____、学校を休んだ。$$, $$Ontem eu estava com febre. Por isso, faltei à escola.$$),
        (3, $$高速道路で事故があった。____、道路が渋滞している。$$, $$Houve um acidente na rodovia. Por isso, o trânsito está congestionado.$$),
        (4, $$健康になりたい。____、毎日運動している。$$, $$Quero ficar saudável. Para isso, faço exercício todo dia.$$),
        (5, $$電車が遅れた。____、面接に間に合わなかった。$$, $$O trem atrasou. Por isso, não cheguei a tempo para a entrevista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-109', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そのために$$),
        (1, $$そのため$$),
        (2, $$そのために$$),
        (2, $$そのため$$),
        (3, $$そのために$$),
        (3, $$そのため$$),
        (4, $$そのために$$),
        (4, $$そのため$$),
        (5, $$そのために$$),
        (5, $$そのため$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-110 — それとも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-110',
    'grammar',
    'N3',
    $$それとも$$,
    $$soretomo$$,
    $$Ou / Ou então$$,
    $$それとも é uma conjunção usada para apresentar alternativas em perguntas. Equivale a "ou" ou "ou então".

Ela liga duas perguntas ou duas opções, para que a outra pessoa escolha uma. Por exemplo, "vai querer café? Ou chá?".

Diferente de または, que pode ser usada em afirmações, それとも é usada principalmente em perguntas, ou em frases de dúvida, como "não sei se ele está bravo ou triste".

Ela pode aparecer no começo de uma nova frase ou depois de uma vírgula, entre as duas opções.$$,
    $$Em afirmações e instruções, como "escreva com caneta preta ou azul", usa-se または ou か, e não それとも.

Na fala casual, as perguntas costumam terminar sem か, com entonação de pergunta: 電車で行く？それとも、バス？

それとも é muito comum em restaurantes e lojas, quando o atendente oferece opções.$$,
    $$Pergunta A + か (com ponto final) + それとも + Pergunta B + か
Pergunta A + か、 + それとも + Pergunta B + か
A + のか、 + それとも + B + のか (dúvida)$$,
    $$それとも$$,
    $$それとも$$,
    ARRAY['それとも']::text[],
    ARRAY['それとも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-110', $$コーヒーにしますか。それとも紅茶にしますか。$$, $$コーヒーにしますか。それともこうちゃにしますか。$$, $$Vai querer café? Ou chá?$$),
    ('n3-grammar-110', $$電車で行く？それとも、バスで行く？$$, $$でんしゃでいく？それとも、バスでいく？$$, $$Vamos de trem? Ou de ônibus?$$),
    ('n3-grammar-110', $$会議は今日にしますか、それとも明日にしますか。$$, $$かいぎはきょうにしますか、それともあしたにしますか。$$, $$A reunião vai ser hoje ou amanhã?$$),
    ('n3-grammar-110', $$晩ご飯は家で食べる？それとも外で食べる？$$, $$ばんごはんはいえでたべる？それともそとでたべる？$$, $$Vamos jantar em casa? Ou fora?$$),
    ('n3-grammar-110', $$彼は来ないのか、それとも来られないのか。$$, $$かれはこないのか、それともこられないのか。$$, $$Será que ele não quer vir ou não pode vir?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$肉にしますか。____魚にしますか。$$, $$Vai querer carne? Ou peixe?$$),
        (2, $$週末、映画を見る？____、買い物に行く？$$, $$No fim de semana, vamos ver um filme? Ou fazer compras?$$),
        (3, $$現金で払いますか、____カードで払いますか。$$, $$Vai pagar em dinheiro ou com cartão?$$),
        (4, $$このまま続けますか、____少し休みますか。$$, $$Vamos continuar assim ou descansar um pouco?$$),
        (5, $$彼は怒っているのか、____悲しいのか、わからない。$$, $$Não sei se ele está bravo ou triste.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-110', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それとも$$),
        (2, $$それとも$$),
        (3, $$それとも$$),
        (4, $$それとも$$),
        (5, $$それとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-111 — 〜そうもない・〜そうにない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-111',
    'grammar',
    'N3',
    $$〜そうもない・〜そうにない$$,
    $$sou mo nai / sou ni nai$$,
    $$Não parece que vai / Pelo jeito não vai / Sem chance de$$,
    $$そうもない e そうにない são usados para dizer que, pelo que se vê ou se sente, algo provavelmente não vai acontecer. Equivalem a "não parece que vai...", "pelo jeito não vai..." ou "sem chance de...".

Elas são a forma negativa da そうだ de aparência. Em vez de dizer "parece que vai acontecer", dizem "não parece que vai acontecer".

A estrutura junta o verbo na forma ます sem ます com そうもない ou そうにない. As duas formas têm o mesmo sentido; そうもない é um pouco mais enfática.

É muito usada com verbos potenciais e com verbos de mudança, como terminar, parar e chegar. Por exemplo, "este trabalho não parece que vai terminar hoje" ou "a chuva não dá sinal de parar".$$,
    $$A forma "Verbo + そうではない" existe, mas soa menos natural para esse sentido. そうもない e そうにない são as formas mais usadas.

Para adjetivos, a negação da aparência é diferente: おいしくなさそう (não parece gostoso).

Essa estrutura expressa uma previsão pessimista, muitas vezes com um pouco de frustração.$$,
    $$Verbo na forma ます sem ます + そうもない / そうにない
Verbo potencial sem ます + そうもない / そうにない

Educado: そうもありません / そうにありません$$,
    $$そうもない$$,
    $$そうもない|そうにない|そうもありません|そうにありません$$,
    ARRAY['そう', 'も', 'ない']::text[],
    ARRAY['そうもない', 'そうにない', 'そうもありません', 'そうにありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-111', $$この仕事は今日中に終わりそうもない。$$, $$このしごとはきょうじゅうにおわりそうもない。$$, $$Este trabalho não parece que vai terminar hoje.$$),
    ('n3-grammar-111', $$雨はやみそうにない。$$, $$あめはやみそうにない。$$, $$A chuva não dá sinal de parar.$$),
    ('n3-grammar-111', $$この問題は難しくて、解けそうもない。$$, $$このもんだいはむずかしくて、とけそうもない。$$, $$Esta questão é difícil, e pelo jeito não vou conseguir resolver.$$),
    ('n3-grammar-111', $$もう八時だ。彼は来そうにありません。$$, $$もうはちじだ。かれはきそうにありません。$$, $$Já são oito horas. Pelo jeito, ele não vem.$$),
    ('n3-grammar-111', $$一人では運べそうもないので、手伝ってください。$$, $$ひとりではこべそうもないので、てつだってください。$$, $$Sozinho não vou conseguir carregar, então me ajude, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日は忙しくて、早く帰れ____。$$, $$Hoje estou ocupado, e pelo jeito não vou conseguir sair cedo.$$),
        (2, $$この渋滞では、約束の時間に間に合い____。$$, $$Com este congestionamento, não parece que vou chegar a tempo.$$),
        (3, $$あんなに怒っていたから、彼女は許してくれ____。$$, $$Ela estava tão brava que pelo jeito não vai me perdoar.$$),
        (4, $$この量は一人では食べ切れ____。$$, $$Esta quantidade, sozinho, não parece que vou conseguir comer tudo.$$),
        (5, $$雪はまだやみ____ですね。$$, $$A neve ainda não parece que vai parar, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-111', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そうもない$$),
        (1, $$そうにない$$),
        (2, $$そうもない$$),
        (2, $$そうにない$$),
        (3, $$そうもない$$),
        (3, $$そうにない$$),
        (4, $$そうもない$$),
        (4, $$そうにない$$),
        (5, $$そうにない$$),
        (5, $$そうもない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-112 — すでに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-112',
    'grammar',
    'N3',
    $$すでに$$,
    $$sude ni$$,
    $$Já / Anteriormente / A esta altura$$,
    $$すでに é um advérbio que significa "já". Ele indica que algo aconteceu antes de certo momento, ou que uma situação já está estabelecida.

Ele tem o mesmo sentido básico de もう, mas soa mais formal e objetivo. Por isso, é muito comum em textos escritos, notícias, avisos, e-mails de trabalho e explicações formais.

Ele é usado principalmente com o verbo no passado ou na forma ている / ていた, para indicar algo concluído: "quando cheguei, a reunião já tinha começado".

Também aparece em avisos de esgotamento ou encerramento: "os ingressos já estão esgotados", "as inscrições já foram encerradas".$$,
    $$Comparando: もう é comum na conversa; すでに é mais formal e escrito.

すでに não é usado com o sentido de "mais" (como もう一つ), só com o sentido de "já".

Em e-mails de trabalho, すでにご存じかと思いますが ("como talvez já saiba...") é uma expressão educada.$$,
    $$すでに + Verbo no passado
すでに + Verbo て + いる / いた
すでに + Substantivo + だ / です

Escrita: すでに / 既に$$,
    $$すでに$$,
    $$すでに|既に$$,
    ARRAY['すでに']::text[],
    ARRAY['すでに', '既に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-112', $$会場に着いたとき、会議はすでに始まっていた。$$, $$かいじょうについたとき、かいぎはすでにはじまっていた。$$, $$Quando cheguei ao local, a reunião já tinha começado.$$),
    ('n3-grammar-112', $$その本はすでに読みました。$$, $$そのほんはすでによみました。$$, $$Esse livro eu já li.$$),
    ('n3-grammar-112', $$申し訳ありませんが、チケットはすでに売り切れです。$$, $$もうしわけありませんが、チケットはすでにうりきれです。$$, $$Desculpe, mas os ingressos já estão esgotados.$$),
    ('n3-grammar-112', $$彼はすでに家を出たそうです。$$, $$かれはすでにいえをでたそうです。$$, $$Dizem que ele já saiu de casa.$$),
    ('n3-grammar-112', $$その問題については、すでに説明しました。$$, $$そのもんだいについては、すでにせつめいしました。$$, $$Sobre esse problema, já dei explicações anteriormente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅に着いたとき、電車は____出ていた。$$, $$Quando cheguei à estação, o trem já tinha saído.$$),
        (2, $$申し込みは____締め切られました。$$, $$As inscrições já foram encerradas.$$),
        (3, $$そのことは____知っています。$$, $$Disso eu já sei.$$),
        (4, $$店に行ったら、____閉まっていた。$$, $$Quando fui à loja, ela já estava fechada.$$),
        (5, $$彼は____新しい仕事を見つけたらしい。$$, $$Parece que ele já encontrou um novo emprego.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-112', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$すでに$$),
        (1, $$既に$$),
        (2, $$すでに$$),
        (2, $$既に$$),
        (3, $$すでに$$),
        (3, $$既に$$),
        (4, $$すでに$$),
        (4, $$既に$$),
        (5, $$すでに$$),
        (5, $$既に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-113 — すなわち
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-113',
    'grammar',
    'N3',
    $$すなわち$$,
    $$sunawachi$$,
    $$Ou seja / Isto é / Quer dizer$$,
    $$すなわち é uma conjunção usada para explicar, definir ou dizer a mesma coisa com outras palavras. Equivale a "ou seja", "isto é" ou "quer dizer".

Ela é usada para:
• Esclarecer quem ou o que é algo: "a irmã mais velha da minha mãe, ou seja, minha tia".
• Dar uma equivalência: "uma semana, isto é, sete dias".
• Tirar uma conclusão lógica: "ele passou na prova. Quer dizer, a partir do ano que vem é universitário".

すなわち é bem formal e aparece principalmente em textos escritos, discursos, livros e explicações acadêmicas.

Na conversa do dia a dia, os japoneses preferem つまり, que tem o mesmo sentido.$$,
    $$つまり é a forma mais comum na fala; すなわち soa literário e formal.

すなわち costuma ligar duas coisas que são exatamente equivalentes, enquanto つまり pode também resumir de forma mais livre.

Em textos de filosofia e em provérbios, すなわち aparece para definir ideias.$$,
    $$A、 + すなわち + B (A, ou seja, B)
Frase 1 (com ponto final) + すなわち、 + Conclusão / Explicação

Escrita: すなわち / 即ち$$,
    $$すなわち$$,
    $$すなわち|即ち$$,
    ARRAY['すなわち']::text[],
    ARRAY['すなわち', '即ち']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-113', $$日本の首都、すなわち東京は人口が多い。$$, $$にほんのしゅと、すなわちとうきょうはじんこうがおおい。$$, $$A capital do Japão, ou seja, Tóquio, tem uma grande população.$$),
    ('n3-grammar-113', $$母の姉、すなわち私のおばは先生です。$$, $$ははのあね、すなわちわたしのおばはせんせいです。$$, $$A irmã mais velha da minha mãe, ou seja, minha tia, é professora.$$),
    ('n3-grammar-113', $$彼は試験に合格した。すなわち、来年から大学生だ。$$, $$かれはしけんにごうかくした。すなわち、らいねんからだいがくせいだ。$$, $$Ele passou na prova. Quer dizer, a partir do ano que vem é universitário.$$),
    ('n3-grammar-113', $$夏には一週間、すなわち七日間の休みがある。$$, $$なつにはいっしゅうかん、すなわちなのかかんのやすみがある。$$, $$No verão há uma semana, isto é, sete dias de folga.$$),
    ('n3-grammar-113', $$学ぶことは、すなわち生きることだ。$$, $$まなぶことは、すなわちいきることだ。$$, $$Aprender é, ou seja, viver.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父の弟、____私のおじは医者だ。$$, $$O irmão mais novo do meu pai, ou seja, meu tio, é médico.$$),
        (2, $$来月の一日、____四月一日から新学期が始まる。$$, $$No dia primeiro do mês que vem, ou seja, primeiro de abril, começa o novo semestre.$$),
        (3, $$彼は返事をしなかった。____、反対だということだ。$$, $$Ele não respondeu. Quer dizer, ele é contra.$$),
        (4, $$地球の衛星、____月について調べた。$$, $$Pesquisei sobre o satélite da Terra, isto é, a Lua.$$),
        (5, $$「時は金なり」とは、____時間は大切だという意味だ。$$, $$"Tempo é dinheiro" significa, ou seja, que o tempo é precioso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-113', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$すなわち$$),
        (2, $$すなわち$$),
        (3, $$すなわち$$),
        (4, $$すなわち$$),
        (5, $$すなわち$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-114 — 数量＋は
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-114',
    'grammar',
    'N3',
    $$数量＋は$$,
    $$suuryou + wa$$,
    $$Pelo menos / No mínimo$$,
    $$Quando a partícula は vem depois de uma quantidade, ela indica o mínimo esperado ou estimado. Equivale a "pelo menos" ou "no mínimo".

Por exemplo, 二十分はかかります significa "leva pelo menos vinte minutos". A ideia é que o número real pode ser igual ou maior, mas não menor.

É usado para estimativas ("esta bolsa deve custar pelo menos cinquenta mil ienes"), metas pessoais ("procuro estudar pelo menos uma hora por dia") e avisos sobre tempo ou custo.

Para reforçar, é comum acrescentar 少なくとも (pelo menos) no começo da frase.$$,
    $$Esse uso de は é diferente do は que marca o tema. Aqui, ele vem logo depois de um número com contador.

Com も, o sentido é o oposto: 二時間もかかった destaca que é muito; 二時間はかかる indica o mínimo.

Em conversas sobre planos e orçamentos, essa estrutura é muito útil para dar estimativas realistas.$$,
    $$Quantidade + は + Verbo (かかる / する / 必要だ / 来る)
少なくとも + Quantidade + は + …$$,
    $$は$$,
    $$は$$,
    ARRAY['は']::text[],
    ARRAY['は']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-114', $$この仕事は、少なくとも三日はかかる。$$, $$このしごとは、すくなくともみっかはかかる。$$, $$Este trabalho vai levar pelo menos três dias.$$),
    ('n3-grammar-114', $$駅まで歩くと、二十分はかかります。$$, $$えきまであるくと、にじゅっぷんはかかります。$$, $$A pé, até a estação leva pelo menos vinte minutos.$$),
    ('n3-grammar-114', $$毎日一時間は勉強するようにしている。$$, $$まいにちいちじかんはべんきょうするようにしている。$$, $$Procuro estudar pelo menos uma hora todos os dias.$$),
    ('n3-grammar-114', $$あの店には、一日に百人は客が来る。$$, $$あのみせには、いちにちにひゃくにんはきゃくがくる。$$, $$Aquela loja recebe pelo menos cem clientes por dia.$$),
    ('n3-grammar-114', $$このブランドのかばんは、五万円はするだろう。$$, $$このブランドのかばんは、ごまんえんはするだろう。$$, $$Uma bolsa desta marca deve custar pelo menos cinquenta mil ienes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$休みの日は、一日に八時間____寝たい。$$, $$Nos dias de folga, quero dormir pelo menos oito horas.$$),
        (2, $$東京まで、車で三時間____かかる。$$, $$Até Tóquio leva pelo menos três horas de carro.$$),
        (3, $$彼は一日に二リットル____水を飲む。$$, $$Ele bebe pelo menos dois litros de água por dia.$$),
        (4, $$この料理を作るには、一時間____必要だ。$$, $$Para fazer esta comida, é preciso pelo menos uma hora.$$),
        (5, $$その時計は十万円____すると思う。$$, $$Acho que esse relógio custa pelo menos cem mil ienes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-114', sentence, translation FROM src ORDER BY k
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

-- n3-grammar-115 — 〜たものだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-115',
    'grammar',
    'N3',
    $$〜たものだ$$,
    $$ta mono da$$,
    $$Costumava / Era comum (eu) fazer$$,
    $$たものだ é usado para relembrar, com nostalgia, algo que a pessoa costumava fazer no passado. Equivale a "costumava" ou "era comum eu fazer".

Ele é formado pelo verbo na forma た + ものだ. A ideia é olhar para trás com saudade, lembrando de hábitos da infância, da juventude ou de uma época especial.

É muito comum junto com palavras como よく (com frequência), 毎日, 昔, 子供のころ e 学生時代.

O tom é emocional e reflexivo, diferente de simplesmente usar o passado ou ていた, que só informam o fato.

Na fala casual, ものだ costuma virar もんだ.$$,
    $$ものだ tem outros usos: com a forma de dicionário, indica uma verdade geral ou um dever ("as pessoas são assim", "deve-se fazer assim"). Esses usos aparecem no N2.

たものだ aparece muito em conversas de pessoas mais velhas lembrando o passado.

Para hábitos passados sem nostalgia, basta usar ていた.$$,
    $$Verbo na forma た + ものだ / ものです
よく / 昔 / 子供のころ + … + Verbo た + ものだ

Fala casual: たもんだ$$,
    $$たものだ$$,
    $$たものだ|たものです|たもんだ|だものだ|だものです|だもんだ$$,
    ARRAY['た', 'もの', 'だ']::text[],
    ARRAY['たものだ', 'たものです', 'たもんだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-115', $$子供のころ、よくこの川で泳いだものだ。$$, $$こどものころ、よくこのかわでおよいだものだ。$$, $$Quando eu era criança, costumava nadar muito neste rio.$$),
    ('n3-grammar-115', $$学生時代は、毎晩遅くまで友達と話したものです。$$, $$がくせいじだいは、まいばんおそくまでともだちとはなしたものです。$$, $$Na época de estudante, eu costumava conversar com os amigos até tarde toda noite.$$),
    ('n3-grammar-115', $$昔はよく父に叱られたものだ。$$, $$むかしはよくちちにしかられたものだ。$$, $$Antigamente, eu levava muita bronca do meu pai.$$),
    ('n3-grammar-115', $$若いころは、よく一人で旅行したものだ。$$, $$わかいころは、よくひとりでりょこうしたものだ。$$, $$Quando era jovem, costumava viajar muito sozinho.$$),
    ('n3-grammar-115', $$小さいころ、この公園で毎日遊んだもんだ。$$, $$ちいさいころ、このこうえんでまいにちあそんだもんだ。$$, $$Quando eu era pequeno, brincava todo dia neste parque.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供のころは、よく外で遊んだ____。$$, $$Quando criança, eu costumava brincar muito lá fora.$$),
        (2, $$学生のころは、試験の前によく徹夜し____。$$, $$Na época de estudante, eu costumava virar a noite antes das provas.$$),
        (3, $$昔はこの道を毎日歩いて学校に行った____。$$, $$Antigamente, eu ia para a escola andando por esta rua todo dia.$$),
        (4, $$若いころは、よく夜まで踊った____。$$, $$Quando era jovem, costumava dançar até tarde da noite.$$),
        (5, $$祖母はよく昔の話をしてくれた____。$$, $$Minha avó costumava me contar histórias antigas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-115', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものだ$$),
        (1, $$ものです$$),
        (2, $$たものだ$$),
        (3, $$ものだ$$),
        (4, $$ものです$$),
        (4, $$ものだ$$),
        (5, $$ものだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-116 — 〜たとたん
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-116',
    'grammar',
    'N3',
    $$〜たとたん$$,
    $$ta totan$$,
    $$Assim que / No exato momento em que / Mal$$,
    $$たとたん é usado para dizer que, no instante em que uma ação terminou, outra coisa aconteceu imediatamente. Equivale a "assim que", "no exato momento em que" ou "mal...".

Ele é formado pelo verbo na forma た + とたん (途端). A ideia é de algo muito rápido e, geralmente, inesperado.

Por exemplo, "mal saí de casa, começou a chover" ou "assim que me levantei, fiquei tonto".

A segunda parte costuma ser um acontecimento que fugiu ao controle de quem fala, muitas vezes uma surpresa. Por isso, ela não pode ser uma ação intencional ou um pedido, como "assim que chegar, me ligue".

Com verbos cuja forma た termina em だ, usa-se だとたん.$$,
    $$Para ações planejadas, como "assim que chegar, ligue", usa-se たらすぐ ou 次第 (N2), e não たとたん.

とたんに, com に, tem o mesmo sentido e é um pouco mais enfático.

A estrutura destaca a surpresa. Por isso, é muito comum em narrativas e relatos de acontecimentos inesperados.$$,
    $$Verbo na forma た + とたん(に)、 + Acontecimento inesperado

Escrita: とたん / 途端$$,
    $$たとたん$$,
    $$たとたん|た途端|だとたん|だ途端$$,
    ARRAY['た', 'とたん']::text[],
    ARRAY['たとたん', 'た途端', 'だとたん', 'たとたんに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-116', $$家を出たとたん、雨が降り出した。$$, $$いえをでたとたん、あめがふりだした。$$, $$Mal saí de casa, começou a chover.$$),
    ('n3-grammar-116', $$急に立ち上がったとたん、めまいがした。$$, $$きゅうにたちあがったとたん、めまいがした。$$, $$Assim que me levantei de repente, fiquei tonto.$$),
    ('n3-grammar-116', $$彼は部屋に入ったとたん、寝てしまった。$$, $$かれはへやにはいったとたん、ねてしまった。$$, $$Mal entrou no quarto, ele caiu no sono.$$),
    ('n3-grammar-116', $$ドアを開けたとたん、猫が飛び出してきた。$$, $$ドアをあけたとたん、ねこがとびだしてきた。$$, $$No exato momento em que abri a porta, o gato saiu correndo.$$),
    ('n3-grammar-116', $$その薬を飲んだとたん、気分がよくなった。$$, $$そのくすりをのんだとたん、きぶんがよくなった。$$, $$Assim que tomei esse remédio, me senti melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$電車に乗っ____、ドアが閉まった。$$, $$Mal entrei no trem, as portas se fecharam.$$),
        (2, $$母の顔を見____、子供は泣き出した。$$, $$Assim que viu o rosto da mãe, a criança começou a chorar.$$),
        (3, $$外に出____、強い風が吹いてきた。$$, $$Mal saí, começou a soprar um vento forte.$$),
        (4, $$席に座っ____、電話が鳴った。$$, $$No exato momento em que me sentei, o telefone tocou.$$),
        (5, $$お酒を飲ん____、顔が赤くなった。$$, $$Assim que bebi, meu rosto ficou vermelho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-116', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たとたん$$),
        (1, $$た途端$$),
        (2, $$たとたん$$),
        (2, $$た途端$$),
        (3, $$たとたん$$),
        (3, $$た途端$$),
        (4, $$たとたん$$),
        (4, $$た途端$$),
        (5, $$だとたん$$),
        (5, $$だ途端$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-117 — 〜たびに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-117',
    'grammar',
    'N3',
    $$〜たびに$$,
    $$tabi ni$$,
    $$Toda vez que / Sempre que / A cada$$,
    $$たびに é usado para dizer que, toda vez que algo acontece, outra coisa também acontece. Equivale a "toda vez que", "sempre que" ou "a cada".

Ele vem depois do verbo na forma de dicionário ou de um substantivo com の. Por exemplo, "toda vez que ouço esta música, lembro da minha terra" ou "a cada viagem, ele traz lembrancinhas".

A segunda parte mostra uma reação, um hábito ou uma mudança que se repete. Muitas vezes, envolve lembranças, sentimentos ou mudanças graduais.

度 significa "vez". Por isso, a ideia é literalmente "a cada vez".$$,
    $$たびに é parecido com ごとに e com と (sempre que), mas destaca a repetição a cada ocasião.

Com verbos de percepção, como 見る e 聞く, たびに aparece muito para falar de lembranças.

Não confunda com 旅 (たび), que significa "viagem". Aqui, たび significa "vez".$$,
    $$Verbo na forma de dicionário + たびに + Frase
Substantivo + の + たびに + Frase

Escrita: たびに / 度に$$,
    $$たびに$$,
    $$たびに|度に$$,
    ARRAY['たび', 'に']::text[],
    ARRAY['たびに', '度に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-117', $$この歌を聞くたびに、故郷を思い出す。$$, $$このうたをきくたびに、こきょうをおもいだす。$$, $$Toda vez que ouço esta música, me lembro da minha terra natal.$$),
    ('n3-grammar-117', $$彼は会うたびに、背が高くなっている。$$, $$かれはあうたびに、せがたかくなっている。$$, $$Toda vez que o encontro, ele está mais alto.$$),
    ('n3-grammar-117', $$父は旅行のたびに、お土産を買ってくる。$$, $$ちちはりょこうのたびに、おみやげをかってくる。$$, $$A cada viagem, meu pai traz lembrancinhas.$$),
    ('n3-grammar-117', $$雨が降るたびに、この道は水でいっぱいになる。$$, $$あめがふるたびに、このみちはみずでいっぱいになる。$$, $$Sempre que chove, esta rua fica alagada.$$),
    ('n3-grammar-117', $$この写真を見るたびに、楽しかった日々を思い出す。$$, $$このしゃしんをみるたびに、たのしかったひびをおもいだす。$$, $$Toda vez que vejo esta foto, lembro dos dias felizes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$祖母は会う____、お小遣いをくれる。$$, $$Toda vez que a encontro, minha avó me dá uns trocados.$$),
        (2, $$出張の____、新しい町を見るのが楽しみだ。$$, $$A cada viagem a trabalho, adoro conhecer cidades novas.$$),
        (3, $$この写真を見る____、笑ってしまう。$$, $$Toda vez que vejo esta foto, acabo rindo.$$),
        (4, $$彼は電話する____、違うことを言う。$$, $$Toda vez que ligo, ele diz uma coisa diferente.$$),
        (5, $$試験の____、緊張して眠れない。$$, $$A cada prova, fico tão nervoso que não consigo dormir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-117', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たびに$$),
        (2, $$たびに$$),
        (3, $$たびに$$),
        (4, $$たびに$$),
        (5, $$たびに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-118 — 〜ために
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-118',
    'grammar',
    'N3',
    $$〜ために$$,
    $$tame ni$$,
    $$Para / A fim de / Por causa de$$,
    $$ために tem dois usos principais.

O primeiro é indicar objetivo ou finalidade: "para", "a fim de". A pessoa faz algo com uma intenção clara. Por exemplo, "estudo japonês para trabalhar no Japão" ou "trabalho duro pela minha família". Nesse uso, ele vem depois de verbos de ação na forma de dicionário, ou de substantivos com の.

O segundo é indicar causa: "por causa de", "devido a". Por exemplo, "por causa da neve, os trens pararam". Nesse uso, ele soa formal e aparece muito em avisos e notícias. Ele vem depois de substantivos com の e de verbos no passado ou na forma simples.

No uso de objetivo, o sujeito das duas partes costuma ser o mesmo, e o verbo antes de ために indica uma ação controlável. Para verbos de possibilidade ou estados, usa-se ように.

Antes de um substantivo, usa-se ための: 日本語を勉強するための本 (um livro para estudar japonês).$$,
    $$A diferença entre ために e ように é importante: ために é para ações intencionais (comprar, estudar, ir); ように é para resultados que não dependem só da vontade (conseguir, poder, não esquecer).

No uso de causa, ために soa mais formal que から ou ので, e é comum em anúncios de atraso.

Para pessoas, のために expressa dedicação: "fazer algo pela família".$$,
    $$Objetivo:
Verbo na forma de dicionário + ために + Ação
Substantivo + の + ために + Ação
… + ための + Substantivo

Causa (formal):
Substantivo + の + ために + Resultado
Verbo (forma simples) + ために + Resultado$$,
    $$ために$$,
    $$ために|為に|ための$$,
    ARRAY['ため', 'に']::text[],
    ARRAY['ために', 'ための', '為に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-118', $$日本で働くために、日本語を勉強している。$$, $$にほんではたらくために、にほんごをべんきょうしている。$$, $$Estou estudando japonês para trabalhar no Japão.$$),
    ('n3-grammar-118', $$家族のために、一生懸命働いている。$$, $$かぞくのために、いっしょうけんめいはたらいている。$$, $$Trabalho duro pela minha família.$$),
    ('n3-grammar-118', $$健康のために、毎朝走っています。$$, $$けんこうのために、まいあさはしっています。$$, $$Corro toda manhã pela saúde.$$),
    ('n3-grammar-118', $$大雪のために、電車が止まった。$$, $$おおゆきのために、でんしゃがとまった。$$, $$Por causa da nevasca, os trens pararam.$$),
    ('n3-grammar-118', $$病気のために、学校を休みました。$$, $$びょうきのために、がっこうをやすみました。$$, $$Faltei à escola por causa de uma doença.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$車を買う____、お金を貯めている。$$, $$Estou juntando dinheiro para comprar um carro.$$),
        (2, $$子供の____、おもちゃを買った。$$, $$Comprei um brinquedo para o meu filho.$$),
        (3, $$試験に合格する____、毎日勉強している。$$, $$Estudo todo dia para passar na prova.$$),
        (4, $$台風の____、試合が中止になった。$$, $$Por causa do tufão, a partida foi cancelada.$$),
        (5, $$事故があった____、道が混んでいる。$$, $$Por causa de um acidente, o trânsito está ruim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-118', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ために$$),
        (2, $$ために$$),
        (3, $$ために$$),
        (4, $$ために$$),
        (5, $$ために$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-119 — 確かに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-119',
    'grammar',
    'N3',
    $$確かに$$,
    $$tashika ni$$,
    $$Realmente / De fato / Com certeza / É verdade$$,
    $$確かに é um advérbio com dois usos principais.

O primeiro é concordar com algo: "realmente", "de fato", "é verdade". Muitas vezes, a pessoa concorda em parte e depois apresenta uma ressalva, com けど ou が: "realmente é caro, mas a qualidade é boa".

O segundo é afirmar com certeza que algo aconteceu: "com certeza", "sem dúvida". Por exemplo, "coloquei a chave na bolsa, com certeza" ou "recebi os documentos, sim".

Sozinho, como resposta, 確かに significa "é verdade" ou "tem razão", e é muito usado na conversa para mostrar que você concorda com o que o outro disse.$$,
    $$O adjetivo 確か também é usado sozinho, no começo da frase, com o sentido de "se não me engano": 確か、明日は休みだった.

Em discussões, 確かにそうですが ("de fato é assim, mas...") é uma forma educada de discordar.

Em recibos e documentos, 確かに受け取りました significa "recebido com confirmação".$$,
    $$確かに + Frase (concordância)
確かに + … + けど / が + Ressalva
確かに + Verbo no passado (certeza de que aconteceu)
確かに (resposta sozinha: é verdade)

Escrita: 確かに / たしかに$$,
    $$確かに$$,
    $$確かに|たしかに$$,
    ARRAY['確かに']::text[],
    ARRAY['確かに', 'たしかに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-119', $$確かに、この料理はおいしい。$$, $$たしかに、このりょうりはおいしい。$$, $$Realmente, esta comida é gostosa.$$),
    ('n3-grammar-119', $$確かに彼の言う通りだ。$$, $$たしかにかれのいうとおりだ。$$, $$De fato, é exatamente como ele diz.$$),
    ('n3-grammar-119', $$確かに高いけど、品質はいい。$$, $$たしかにたかいけど、ひんしつはいい。$$, $$Realmente é caro, mas a qualidade é boa.$$),
    ('n3-grammar-119', $$鍵は確かにかばんに入れました。$$, $$かぎはたしかにかばんにいれました。$$, $$Eu coloquei a chave na bolsa, com certeza.$$),
    ('n3-grammar-119', $$「この問題、難しいね。」「確かに。」$$, $$「このもんだい、むずかしいね。」「たしかに。」$$, $$"Esta questão é difícil, né?" "É verdade."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、あなたの意見は正しい。$$, $$De fato, a sua opinião está correta.$$),
        (2, $$書類は____受け取りました。$$, $$Recebi os documentos, com certeza.$$),
        (3, $$この店は____便利だけど、少し高い。$$, $$Esta loja é realmente prática, mas um pouco cara.$$),
        (4, $$「今日は寒いね。」「____。」$$, $$"Hoje está frio, né?" "É verdade."$$),
        (5, $$彼は昨日、____そう言いました。$$, $$Ele disse isso ontem, com certeza.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-119', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$確かに$$),
        (1, $$たしかに$$),
        (2, $$確かに$$),
        (2, $$たしかに$$),
        (3, $$確かに$$),
        (3, $$たしかに$$),
        (4, $$確かに$$),
        (4, $$たしかに$$),
        (5, $$確かに$$),
        (5, $$たしかに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-120 — 〜たて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-120',
    'grammar',
    'N3',
    $$〜たて$$,
    $$tate$$,
    $$Recém- / Acabado de / Fresquinho$$,
    $$たて é um sufixo que indica que algo acabou de ser feito ou de acontecer. Equivale a "recém-", "acabado de" ou "fresquinho".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, 焼きたて (recém-assado), 塗りたて (pintado agora mesmo), 生まれたて (recém-nascido).

Antes de um substantivo, usa-se たての: 焼きたてのパン (pão recém-assado).

É muito usado para comida, com um tom positivo de frescor e qualidade, como pão saído do forno, arroz recém-cozido e verduras recém-colhidas. Também aparece em avisos, como 塗りたて (tinta fresca), e para pessoas que acabaram de começar algo, como um funcionário recém-formado.

たて só é usado com alguns verbos, principalmente ligados a produção, preparação e começo.$$,
    $$Diferente de たばかり, que pode ser usado com quase qualquer verbo, たて é limitado a algumas combinações fixas.

Em padarias e restaurantes, placas com 焼きたて e できたて atraem muitos clientes.

塗りたて, em placas, significa "cuidado, tinta fresca".$$,
    $$Verbo na forma ます sem ます + たて + の + Substantivo
Verbo sem ます + たて + だ / です

Combinações comuns: 焼きたて / 炊きたて / できたて / 取れたて / 搾りたて / 生まれたて / 塗りたて / 洗いたて$$,
    $$たて$$,
    $$たて|立て$$,
    ARRAY['たて']::text[],
    ARRAY['たて', 'たての']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-120', $$焼きたてのパンはおいしい。$$, $$やきたてのパンはおいしい。$$, $$Pão recém-assado é gostoso.$$),
    ('n3-grammar-120', $$このペンキは塗りたてなので、触らないでください。$$, $$このペンキはぬりたてなので、さわらないでください。$$, $$A tinta foi passada agora, então não toque, por favor.$$),
    ('n3-grammar-120', $$彼は大学を出たての新人だ。$$, $$かれはだいがくをでたてのしんじんだ。$$, $$Ele é um funcionário novo, recém-formado na faculdade.$$),
    ('n3-grammar-120', $$生まれたての赤ちゃんはとても小さい。$$, $$うまれたてのあかちゃんはとてもちいさい。$$, $$Um bebê recém-nascido é muito pequeno.$$),
    ('n3-grammar-120', $$これは取れたての野菜を使った料理です。$$, $$これはとれたてのやさいをつかったりょうりです。$$, $$Este é um prato feito com verduras recém-colhidas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$炊き____のご飯はおいしい。$$, $$Arroz recém-cozido é gostoso.$$),
        (2, $$洗い____のシャツはいいにおいがする。$$, $$Camisa recém-lavada tem um cheiro bom.$$),
        (3, $$作り____の料理を食べてください。$$, $$Coma a comida que acabou de ser feita.$$),
        (4, $$覚え____の日本語で話してみた。$$, $$Tentei falar com o japonês que tinha acabado de aprender.$$),
        (5, $$搾り____のジュースを飲んだ。$$, $$Tomei um suco feito na hora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-120', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たて$$),
        (2, $$たて$$),
        (3, $$たて$$),
        (4, $$たて$$),
        (5, $$たて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-121 — たとえ〜ても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-121',
    'grammar',
    'N3',
    $$たとえ〜ても$$,
    $$tatoe ~ te mo$$,
    $$Mesmo que / Ainda que / Nem que$$,
    $$たとえ〜ても é usado para dizer que, mesmo que uma situação hipotética aconteça, o resultado ou a decisão não muda. Equivale a "mesmo que", "ainda que" ou "nem que".

たとえ vem no começo e reforça a ideia de hipótese. O verbo ou adjetivo vai para a forma ても.

A segunda parte geralmente expressa uma decisão firme, uma regra ou uma convicção. Por exemplo, "mesmo que chova, a partida será realizada" ou "mesmo que todos sejam contra, eu vou".

Com adjetivos い, usa-se くても. Com substantivos e adjetivos な, usa-se でも.

A forma たとえ〜としても, um pouco mais formal, também é usada com o mesmo sentido.$$,
    $$たとえ não é obrigatório, mas deixa claro desde o começo que a frase é uma hipótese.

Não confunda com 例えば (por exemplo), que tem a mesma origem, mas outro sentido.

É muito comum em frases de determinação e promessas fortes.$$,
    $$たとえ + Verbo na forma て + も
たとえ + Adjetivo い sem い + くても
たとえ + Substantivo / Adjetivo な + でも
たとえ + … + としても (mais formal)

Escrita: たとえ / 例え$$,
    $$たとえ$$,
    $$たとえ|例え$$,
    ARRAY['たとえ', 'ても']::text[],
    ARRAY['たとえ〜ても', 'たとえ〜でも', 'たとえ〜としても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-121', $$たとえ雨が降っても、試合は行います。$$, $$たとえあめがふっても、しあいはおこないます。$$, $$Mesmo que chova, a partida será realizada.$$),
    ('n3-grammar-121', $$たとえ反対されても、私は留学する。$$, $$たとえはんたいされても、わたしはりゅうがくする。$$, $$Mesmo que sejam contra, eu vou fazer intercâmbio.$$),
    ('n3-grammar-121', $$たとえ高くても、いい物を買いたい。$$, $$たとえたかくても、いいものをかいたい。$$, $$Mesmo que seja caro, quero comprar algo bom.$$),
    ('n3-grammar-121', $$たとえ子供でも、ルールは守らなければならない。$$, $$たとえこどもでも、ルールはまもらなければならない。$$, $$Mesmo sendo criança, é preciso seguir as regras.$$),
    ('n3-grammar-121', $$たとえ失敗しても、後悔はしない。$$, $$たとえしっぱいしても、こうかいはしない。$$, $$Mesmo que eu fracasse, não vou me arrepender.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____忙しくても、毎日運動する。$$, $$Mesmo que esteja ocupado, faço exercício todo dia.$$),
        (2, $$____冗談でも、そんなことを言ってはいけない。$$, $$Mesmo que seja brincadeira, não se deve dizer uma coisa dessas.$$),
        (3, $$____みんなが反対しても、私は行く。$$, $$Mesmo que todos sejam contra, eu vou.$$),
        (4, $$____お金がなくても、幸せに暮らせる。$$, $$Mesmo sem dinheiro, dá para viver feliz.$$),
        (5, $$____遠くても、会いに行きます。$$, $$Mesmo que seja longe, vou te ver.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-121', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たとえ$$),
        (2, $$たとえ$$),
        (3, $$たとえ$$),
        (4, $$たとえ$$),
        (5, $$たとえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-122 — 例えば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-122',
    'grammar',
    'N3',
    $$例えば$$,
    $$tatoeba$$,
    $$Por exemplo / Digamos que$$,
    $$例えば significa "por exemplo". Ele é usado para dar exemplos concretos de algo mais geral.

Muitas vezes, aparece depois de uma categoria, separada por vírgula: "frutas, por exemplo maçã e mexerica". Também é comum junto com や e など, que reforçam a ideia de exemplos.

No começo de uma pergunta ou hipótese, 例えば significa "digamos que" ou "suponha que", apresentando uma situação imaginária para discutir. Por exemplo, "digamos que você tivesse cem milhões de ienes, em que gastaria?".

É usado tanto na fala quanto na escrita, e é muito útil em explicações e apresentações.$$,
    $$例えば vem de 例 (exemplo), a mesma raiz de 例文 (frase de exemplo).

Não confunda com たとえ〜ても (mesmo que), que tem a mesma origem, mas outro uso.

Em apresentações, 例えば ajuda a deixar explicações abstratas mais claras.$$,
    $$Categoria、 + 例えば + Exemplo(s) + や / など
例えば、 + Exemplo + …
例えば、 + Hipótese + たら / なら + Pergunta (digamos que...)

Escrita: 例えば / たとえば$$,
    $$例えば$$,
    $$例えば|たとえば$$,
    ARRAY['例えば']::text[],
    ARRAY['例えば', 'たとえば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-122', $$私は果物、例えばりんごやみかんが好きです。$$, $$わたしはくだもの、たとえばりんごやみかんがすきです。$$, $$Eu gosto de frutas, por exemplo maçã e mexerica.$$),
    ('n3-grammar-122', $$例えば、日本に住むならどこがいいですか。$$, $$たとえば、にほんにすむならどこがいいですか。$$, $$Digamos que você fosse morar no Japão. Onde seria bom?$$),
    ('n3-grammar-122', $$スポーツ、例えばサッカーやテニスをします。$$, $$スポーツ、たとえばサッカーやテニスをします。$$, $$Pratico esportes, por exemplo futebol e tênis.$$),
    ('n3-grammar-122', $$例えば、一億円あったら何に使いますか。$$, $$たとえば、いちおくえんあったらなににつかいますか。$$, $$Digamos que você tivesse cem milhões de ienes. Em que gastaria?$$),
    ('n3-grammar-122', $$日本料理、例えばすしや天ぷらは外国でも人気がある。$$, $$にほんりょうり、たとえばすしやてんぷらはがいこくでもにんきがある。$$, $$A culinária japonesa, por exemplo sushi e tempurá, também é popular no exterior.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日本の祭り、____祇園祭は有名だ。$$, $$Os festivais japoneses, por exemplo o Gion Matsuri, são famosos.$$),
        (2, $$____、明日雨だったらどうしますか。$$, $$Digamos que amanhã chova. O que você vai fazer?$$),
        (3, $$漢字、____「山」や「川」は簡単だ。$$, $$Alguns kanji, por exemplo "montanha" e "rio", são fáceis.$$),
        (4, $$体にいい食べ物、____野菜や魚を食べましょう。$$, $$Vamos comer alimentos saudáveis, por exemplo verduras e peixes.$$),
        (5, $$____、あなたが社長だったら、何をしますか。$$, $$Digamos que você fosse o presidente. O que faria?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-122', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$例えば$$),
        (1, $$たとえば$$),
        (2, $$例えば$$),
        (2, $$たとえば$$),
        (3, $$例えば$$),
        (3, $$たとえば$$),
        (4, $$例えば$$),
        (4, $$たとえば$$),
        (5, $$例えば$$),
        (5, $$たとえば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-123 — 〜たって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-123',
    'grammar',
    'N3',
    $$〜たって$$,
    $$tatte$$,
    $$Mesmo que / Por mais que (casual)$$,
    $$たって é a forma falada e casual de ても. Equivale a "mesmo que" ou "por mais que".

Ele é formado pela forma た do verbo + って. Com adjetivos い, usa-se くたって. Com substantivos e adjetivos な, usa-se だって.

O sentido é o mesmo de ても: o resultado não muda, independentemente da situação. Muitas vezes, aparece com いくら ou どんなに, reforçando a ideia de "por mais que".

O tom costuma ser de resignação, impaciência ou determinação, como "por mais que eu fale, ele não escuta" ou "chorar não vai mudar nada".

Por ser coloquial, たって é usado entre amigos e família, e não em situações formais.$$,
    $$Com verbos cuja forma た termina em だ, como 泳ぐ e 読む, a forma fica だって: 泳いだって, 読んだって.

だって, sozinho no começo da frase, também significa "mas é que..." ao dar desculpas. É um uso diferente.

Em textos escritos e formais, use ても.$$,
    $$Verbo na forma た + って (= ても)
Adjetivo い sem い + くたって
Substantivo / Adjetivo な + だって
いくら / どんなに + … + たって$$,
    $$たって$$,
    $$たって|だって$$,
    ARRAY['たって']::text[],
    ARRAY['たって', 'だって', 'くたって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-123', $$いくら言ったって、彼は聞かない。$$, $$いくらいったって、かれはきかない。$$, $$Por mais que eu fale, ele não escuta.$$),
    ('n3-grammar-123', $$今から急いだって、間に合わないよ。$$, $$いまからいそいだって、まにあわないよ。$$, $$Mesmo que corra agora, não vai chegar a tempo.$$),
    ('n3-grammar-123', $$高くたって、欲しいものは買う。$$, $$たかくたって、ほしいものはかう。$$, $$Mesmo que seja caro, compro o que eu quero.$$),
    ('n3-grammar-123', $$泣いたって、何も変わらない。$$, $$ないたって、なにもかわらない。$$, $$Chorar não vai mudar nada.$$),
    ('n3-grammar-123', $$そんなこと、子供だってわかる。$$, $$そんなこと、こどもだってわかる。$$, $$Uma coisa dessas, até uma criança entende.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$いくら勉強し____、覚えられない。$$, $$Por mais que eu estude, não consigo decorar.$$),
        (2, $$今さら謝っ____、許してもらえない。$$, $$Mesmo que peça desculpas agora, não vão me perdoar.$$),
        (3, $$そんなに怒っ____、しょうがないよ。$$, $$Não adianta ficar tão bravo.$$),
        (4, $$今から走っ____、もう遅い。$$, $$Mesmo que corra agora, já é tarde.$$),
        (5, $$寒く____、毎朝ジョギングする。$$, $$Mesmo que esteja frio, corro toda manhã.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-123', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たって$$),
        (2, $$たって$$),
        (3, $$たって$$),
        (4, $$たって$$),
        (5, $$たって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-124 — 〜てばかりいる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-124',
    'grammar',
    'N3',
    $$〜てばかりいる$$,
    $$te bakari iru$$,
    $$Só fica fazendo / Não faz outra coisa a não ser$$,
    $$てばかりいる é usado para criticar alguém que faz sempre a mesma coisa, de forma excessiva. Equivale a "só fica fazendo..." ou "não faz outra coisa a não ser...".

Ele junta a forma て do verbo com ばかり (só) e いる (estar). A ideia é que a pessoa passa o tempo todo naquela ação, deixando de lado o que deveria fazer.

O tom é quase sempre de reclamação ou de preocupação, como pais falando dos filhos: "ele só fica jogando videogame".

Na forma てばかりいないで, vira um pedido para que a pessoa pare: "pare de só dormir e ajude um pouco".$$,
    $$Compare: ゲームばかりしている (só joga videogame, foco no objeto) e ゲームをしてばかりいる (só fica jogando, foco na ação). Os dois são comuns.

てばかりいる é diferente de たばかり (acabou de), que usa a forma た.

Com verbos de sentimento, como 泣く e 怒る, a estrutura mostra que a pessoa está sempre naquele estado.$$,
    $$Verbo na forma て + ばかりいる
Verbo na forma て + ばかりいて、 + Frase
Verbo na forma て + ばかりいないで、 + Pedido$$,
    $$てばかりいる$$,
    $$てばかり|でばかり$$,
    ARRAY['て', 'ばかり', 'いる']::text[],
    ARRAY['てばかりいる', 'でばかりいる', 'てばかりいないで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-124', $$弟は毎日ゲームをしてばかりいる。$$, $$おとうとはまいにちゲームをしてばかりいる。$$, $$Meu irmão mais novo só fica jogando videogame todo dia.$$),
    ('n3-grammar-124', $$彼女は泣いてばかりいて、何も話さない。$$, $$かのじょはないてばかりいて、なにもはなさない。$$, $$Ela só fica chorando e não diz nada.$$),
    ('n3-grammar-124', $$寝てばかりいないで、少しは手伝って。$$, $$ねてばかりいないで、すこしはてつだって。$$, $$Pare de só dormir e ajude um pouco.$$),
    ('n3-grammar-124', $$父は休みの日、テレビを見てばかりいる。$$, $$ちちはやすみのひ、テレビをみてばかりいる。$$, $$Nos dias de folga, meu pai só fica vendo TV.$$),
    ('n3-grammar-124', $$遊んでばかりいると、試験に落ちるよ。$$, $$あそんでばかりいると、しけんにおちるよ。$$, $$Se ficar só brincando, vai ser reprovado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は文句を言っ____いる。$$, $$Ele só fica reclamando.$$),
        (2, $$子供は漫画を読ん____いる。$$, $$A criança só fica lendo mangá.$$),
        (3, $$食べ____いると、太りますよ。$$, $$Se ficar só comendo, vai engordar.$$),
        (4, $$寝____いないで、勉強しなさい。$$, $$Pare de só dormir e vá estudar.$$),
        (5, $$最近、仕事で失敗し____いる。$$, $$Ultimamente, só tenho errado no trabalho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-124', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てばかり$$),
        (2, $$でばかり$$),
        (3, $$てばかり$$),
        (4, $$てばかり$$),
        (5, $$てばかり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-125 — 〜てごらん
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-125',
    'grammar',
    'N3',
    $$〜てごらん$$,
    $$te goran$$,
    $$Experimente / Tente / Veja só$$,
    $$てごらん é usado para convidar ou incentivar alguém a experimentar algo. Equivale a "experimente", "tente" ou "veja só".

Ele vem de ご覧, a forma respeitosa de 見る, mas aqui funciona como uma versão gentil de てみなさい. A ideia é "faça e veja como é".

É usado principalmente por pessoas mais velhas ou em posição superior, falando com crianças, alunos ou pessoas mais novas. Por exemplo, pais com filhos ou professores com alunos.

O tom é gentil, carinhoso e encorajador.

Com superiores, não se usa てごらん. Nesses casos, a forma respeitosa é てご覧ください ou てみてください.$$,
    $$てごらん soa paternal ou maternal. Usá-lo com adultos que não são próximos pode parecer condescendente.

見てごらん ("olhe só") é muito comum para chamar a atenção de uma criança para algo interessante.

A forma ごらん sozinha, como em ほら、ごらん, significa "olha!".$$,
    $$Verbo na forma て + ごらん
Verbo na forma て + ごらんなさい (um pouco mais formal)

Para superiores: Verbo て + ご覧ください / てみてください$$,
    $$てごらん$$,
    $$てごらん|でごらん$$,
    ARRAY['て', 'ごらん']::text[],
    ARRAY['てごらん', 'でごらん', 'てごらんなさい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-125', $$このケーキ、おいしいから食べてごらん。$$, $$このケーキ、おいしいからたべてごらん。$$, $$Este bolo é gostoso, experimente.$$),
    ('n3-grammar-125', $$ちょっと窓の外を見てごらん。$$, $$ちょっとまどのそとをみてごらん。$$, $$Olhe só pela janela.$$),
    ('n3-grammar-125', $$難しくないから、自分でやってごらん。$$, $$むずかしくないから、じぶんでやってごらん。$$, $$Não é difícil, tente fazer sozinho.$$),
    ('n3-grammar-125', $$もう一度、ゆっくり言ってごらん。$$, $$もういちど、ゆっくりいってごらん。$$, $$Tente dizer mais uma vez, devagar.$$),
    ('n3-grammar-125', $$この本、おもしろいから読んでごらん。$$, $$このほん、おもしろいからよんでごらん。$$, $$Este livro é interessante, experimente ler.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$きっと似合うから、この服、着____。$$, $$Tenho certeza de que fica bem em você, experimente esta roupa.$$),
        (2, $$わからなかったら、先生に聞い____。$$, $$Se não entender, tente perguntar ao professor.$$),
        (3, $$空を見____。星がきれいだよ。$$, $$Olhe para o céu. As estrelas estão lindas.$$),
        (4, $$手伝わないから、一人で書い____。$$, $$Não vou ajudar, tente escrever sozinho.$$),
        (5, $$この歌、一緒に歌っ____。$$, $$Tente cantar esta música junto comigo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-125', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てごらん$$),
        (2, $$てごらん$$),
        (3, $$てごらん$$),
        (4, $$てごらん$$),
        (5, $$てごらん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-126 — 〜てはじめて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-126',
    'grammar',
    'N3',
    $$〜てはじめて$$,
    $$te hajimete$$,
    $$Só depois de / Somente quando$$,
    $$てはじめて é usado para dizer que só depois de uma experiência a pessoa percebeu, entendeu ou conseguiu algo. Equivale a "só depois de" ou "somente quando".

Ele junta a forma て do verbo com はじめて (pela primeira vez). A ideia é que, antes daquela experiência, a pessoa não tinha percebido aquilo.

Muitas vezes, a frase expressa uma reflexão ou um aprendizado de vida. Por exemplo, "só depois de ficar doente entendi a importância da saúde" ou "só quando me tornei pai entendi os sentimentos dos meus pais".

A segunda parte costuma ter verbos como わかる, 気づく, 知る e 実感する.$$,
    $$A segunda parte não costuma ser uma vontade ou um pedido. Ela descreve algo que a pessoa passou a entender ou conseguir.

É muito comum em redações e discursos sobre experiências pessoais.

A ideia de "só depois de perder, se dá valor" aparece com frequência, como em 失って初めて.$$,
    $$Verbo na forma て + はじめて、 + Percepção / Compreensão
Verbo na forma て + はじめて + Verbo potencial

Escrita: てはじめて / て初めて$$,
    $$てはじめて$$,
    $$てはじめて|て初めて|ではじめて|で初めて$$,
    ARRAY['て', 'はじめて']::text[],
    ARRAY['てはじめて', 'て初めて', 'ではじめて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-126', $$病気になってはじめて、健康の大切さがわかった。$$, $$びょうきになってはじめて、けんこうのたいせつさがわかった。$$, $$Só depois de ficar doente entendi a importância da saúde.$$),
    ('n3-grammar-126', $$親になってはじめて、親の気持ちがわかった。$$, $$おやになってはじめて、おやのきもちがわかった。$$, $$Só quando me tornei pai entendi os sentimentos dos meus pais.$$),
    ('n3-grammar-126', $$外国に住んではじめて、自分の国のよさに気づいた。$$, $$がいこくにすんではじめて、じぶんのくにのよさにきづいた。$$, $$Só depois de morar no exterior percebi as qualidades do meu país.$$),
    ('n3-grammar-126', $$実際にやってみてはじめて、難しさがわかる。$$, $$じっさいにやってみてはじめて、むずかしさがわかる。$$, $$Só quando se tenta de verdade é que se entende a dificuldade.$$),
    ('n3-grammar-126', $$失って初めて、その大切さを知った。$$, $$うしなってはじめて、そのたいせつさをしった。$$, $$Só depois de perder conheci o valor daquilo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人暮らしをし____、家族のありがたさがわかった。$$, $$Só depois de morar sozinho entendi o valor da família.$$),
        (2, $$働い____、お金の大切さを知った。$$, $$Só depois de trabalhar conheci o valor do dinheiro.$$),
        (3, $$自分で料理を作っ____、母の苦労がわかった。$$, $$Só quando cozinhei sozinho entendi o esforço da minha mãe.$$),
        (4, $$日本に来____、日本の文化をよく知った。$$, $$Só depois de vir ao Japão conheci bem a cultura japonesa.$$),
        (5, $$ゆっくり話し合っ____、彼の考えがわかった。$$, $$Só depois de conversar com calma entendi o que ele pensava.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-126', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てはじめて$$),
        (1, $$て初めて$$),
        (2, $$てはじめて$$),
        (2, $$て初めて$$),
        (3, $$てはじめて$$),
        (3, $$て初めて$$),
        (4, $$てはじめて$$),
        (4, $$て初めて$$),
        (5, $$てはじめて$$),
        (5, $$て初めて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-127 — 〜てからでないと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-127',
    'grammar',
    'N3',
    $$〜てからでないと$$,
    $$te kara de nai to$$,
    $$Só depois de / Enquanto não / Sem antes$$,
    $$てからでないと é usado para dizer que uma ação só pode acontecer depois de outra. Se a primeira não acontecer antes, a segunda é impossível ou não deve acontecer. Equivale a "só depois de", "enquanto não..." ou "sem antes...".

A estrutura junta てから (depois de) com でないと (se não for). A ideia literal é "se não for depois de fazer isso, não dá".

A segunda parte é quase sempre negativa: não poder, não dever ou não conseguir. Por exemplo, "só depois de lavar as mãos pode comer" ou "enquanto não falar com meus pais, não posso responder".

A forma てからでなければ tem o mesmo sentido e é um pouco mais formal.$$,
    $$A segunda parte normalmente tem verbos potenciais negativos (できない, 行けない) ou てはいけない.

É muito usada para explicar regras e condições, como em lojas e escolas.

Comparado a てから (depois de), てからでないと destaca a condição obrigatória.$$,
    $$Verbo na forma て + からでないと、 + Frase negativa
Verbo na forma て + からでなければ、 + Frase negativa (mais formal)

Fala casual: てからじゃないと$$,
    $$てからでないと$$,
    $$てからでないと|てからでなければ|でからでないと|でからでなければ|てからじゃないと$$,
    ARRAY['て', 'から', 'でないと']::text[],
    ARRAY['てからでないと', 'てからでなければ', 'てからじゃないと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-127', $$手を洗ってからでないと、ご飯を食べてはいけません。$$, $$てをあらってからでないと、ごはんをたべてはいけません。$$, $$Só depois de lavar as mãos é que pode comer.$$),
    ('n3-grammar-127', $$実際に見てからでないと、買うかどうか決められない。$$, $$じっさいにみてからでないと、かうかどうかきめられない。$$, $$Enquanto não vir pessoalmente, não consigo decidir se compro ou não.$$),
    ('n3-grammar-127', $$宿題をしてからでないと、遊びに行けない。$$, $$しゅくだいをしてからでないと、あそびにいけない。$$, $$Sem antes fazer a lição, não posso ir brincar.$$),
    ('n3-grammar-127', $$両親に相談してからでないと、返事できません。$$, $$りょうしんにそうだんしてからでないと、へんじできません。$$, $$Enquanto não conversar com meus pais, não posso responder.$$),
    ('n3-grammar-127', $$二十歳になってからでなければ、お酒は飲めない。$$, $$はたちになってからでなければ、おさけはのめない。$$, $$Só depois de completar vinte anos é que se pode beber.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このレストランは予約し____、入れません。$$, $$Neste restaurante, só dá para entrar com reserva.$$),
        (2, $$詳しい説明を聞い____、わかりません。$$, $$Sem antes ouvir uma explicação detalhada, não dá para entender.$$),
        (3, $$部長に聞い____、決められない。$$, $$Enquanto não perguntar ao gerente, não posso decidir.$$),
        (4, $$試験が終わっ____、遊べない。$$, $$Só depois de a prova acabar é que vou poder me divertir.$$),
        (5, $$食後の薬を飲ん____、寝てはいけない。$$, $$Sem antes tomar o remédio de depois da refeição, não pode dormir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-127', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てからでないと$$),
        (2, $$てからでないと$$),
        (3, $$てからでないと$$),
        (4, $$てからでないと$$),
        (5, $$でからでないと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-128 — 〜てしょうがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-128',
    'grammar',
    'N3',
    $$〜てしょうがない$$,
    $$te shou ga nai$$,
    $$Muito / Demais / Não aguentar de tanto$$,
    $$てしょうがない é usado para expressar um sentimento ou uma sensação física tão forte que a pessoa não consegue controlar. Equivale a "muito", "demais" ou "não aguentar de tanto...".

A ideia literal é "não há jeito", ou seja, o sentimento é tão intenso que não tem como evitar.

Ele vem depois da forma て de adjetivos e de verbos de sentimento. Com adjetivos い, usa-se くてしょうがない; com adjetivos な, でしょうがない.

É muito usado para calor, frio, sono, fome, dor, preocupação, saudade e desejo. Por exemplo, "estou morrendo de calor" ou "não paro de pensar no resultado da prova".

A forma てしかたがない tem exatamente o mesmo sentido e é um pouco mais formal.$$,
    $$O sujeito costuma ser quem fala. Para falar de outra pessoa, acrescenta-se らしい ou ようだ.

Comparado a てたまらない (N2), que é ainda mais emocional, てしょうがない é muito comum na conversa.

A expressão sozinha しょうがない significa "não tem jeito", "fazer o quê".$$,
    $$Adjetivo い sem い + くてしょうがない
Adjetivo な + でしょうがない
Verbo de sentimento na forma て + しょうがない (気になる / 心配する)
Verbo たい sem い + くてしょうがない

Variação: てしかたがない / てしようがない$$,
    $$てしょうがない$$,
    $$てしょうがない|てしょうがありません|てしかたがない|でしょうがない$$,
    ARRAY['て', 'しょうがない']::text[],
    ARRAY['てしょうがない', 'てしかたがない', 'でしょうがない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-128', $$今日は暑くてしょうがない。$$, $$きょうはあつくてしょうがない。$$, $$Hoje está um calor insuportável.$$),
    ('n3-grammar-128', $$試験の結果が気になってしょうがない。$$, $$しけんのけっかがきになってしょうがない。$$, $$Não paro de pensar no resultado da prova.$$),
    ('n3-grammar-128', $$眠くてしょうがないので、コーヒーを飲んだ。$$, $$ねむくてしょうがないので、コーヒーをのんだ。$$, $$Estava morrendo de sono, então tomei um café.$$),
    ('n3-grammar-128', $$遠くに住んでいる彼に会いたくてしょうがない。$$, $$とおくにすんでいるかれにあいたくてしょうがない。$$, $$Estou louca para ver ele, que mora longe.$$),
    ('n3-grammar-128', $$子供がかわいくてしかたがない。$$, $$こどもがかわいくてしかたがない。$$, $$Acho meu filho fofo demais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$朝ご飯を食べなかったので、お腹がすい____。$$, $$Não tomei café da manhã, então estou morrendo de fome.$$),
        (2, $$明日の旅行が楽しみ____。$$, $$Estou ansioso demais pela viagem de amanhã.$$),
        (3, $$昨日から歯が痛く____。$$, $$Desde ontem estou com uma dor de dente insuportável.$$),
        (4, $$何もすることがなくて、退屈____。$$, $$Não tenho nada para fazer e estou morrendo de tédio.$$),
        (5, $$疲れたので、早く家に帰りたく____。$$, $$Estou cansado e louco para ir para casa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-128', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てしょうがない$$),
        (1, $$てしかたがない$$),
        (2, $$でしょうがない$$),
        (3, $$てしょうがない$$),
        (3, $$てしかたがない$$),
        (4, $$でしょうがない$$),
        (5, $$てしょうがない$$),
        (5, $$てしかたがない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-129 — 〜て済む・〜で済む
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-129',
    'grammar',
    'N3',
    $$〜て済む・〜で済む$$,
    $$te sumu / de sumu$$,
    $$Bastar / Resolver-se com / Ficar só em$$,
    $$済む significa "resolver-se" ou "terminar". Com て ou で, a estrutura indica que algo se resolve com pouco, ou que uma situação ficou menos grave do que poderia.

Com substantivos + で, significa "basta..." ou "resolve-se com...": "se der para resolver por telefone, não precisa ir".

Também é usado para dizer que um problema ficou limitado a algo pequeno, com alívio: "por sorte, ficou só num machucado leve".

Com a forma て do verbo, aparece em expressões como 謝って済む問題ではない, que significa "não é um problema que se resolve só pedindo desculpas", com tom de crítica.

Na forma ないで済む ou なくて済む, indica que se conseguiu evitar algo: "ainda bem que não precisei...".$$,
    $$すみません vem do mesmo verbo 済む. A ideia original é "não se resolve", ou seja, "não tenho como retribuir".

Na forma passada, 済んだ costuma expressar alívio: algo ruim não ficou pior.

ずに済む (N2) tem o mesmo sentido de ないで済む e soa mais formal.$$,
    $$Substantivo + で + 済む (resolve-se com...)
Verbo na forma て + 済む
Verbo na forma ない + で + 済む / なくて済む (conseguir evitar)
… + で済んでよかった (alívio)

Escrita: 済む / すむ$$,
    $$済む$$,
    $$て済|で済|てすむ|ですむ$$,
    ARRAY['て', '済む']::text[],
    ARRAY['で済む', 'て済む', 'ないで済む', 'なくて済む']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-129', $$電話で済むなら、わざわざ行かなくてもいい。$$, $$でんわですむなら、わざわざいかなくてもいい。$$, $$Se der para resolver por telefone, não precisa ir até lá.$$),
    ('n3-grammar-129', $$これは謝って済む問題ではない。$$, $$これはあやまってすむもんだいではない。$$, $$Isto não é um problema que se resolve só pedindo desculpas.$$),
    ('n3-grammar-129', $$早く病院に行ったので、軽いけがで済んだ。$$, $$はやくびょういんにいったので、かるいけがですんだ。$$, $$Fui logo ao hospital, então ficou só num machucado leve.$$),
    ('n3-grammar-129', $$友達が手伝ってくれたので、一時間で済んだ。$$, $$ともだちがてつだってくれたので、いちじかんですんだ。$$, $$Meu amigo me ajudou, então resolvi tudo em uma hora.$$),
    ('n3-grammar-129', $$安い修理で済んでよかった。$$, $$やすいしゅうりですんでよかった。$$, $$Que bom que ficou só num conserto barato.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$メールで____ことなら、会わなくてもいい。$$, $$Se for algo que se resolve por e-mail, não precisamos nos encontrar.$$),
        (2, $$大きな事故だったが、小さなけがで____。$$, $$Foi um acidente grave, mas ficou só em ferimentos leves.$$),
        (3, $$「すみません」で____問題じゃない。$$, $$Não é um problema que se resolve com um simples "desculpe".$$),
        (4, $$予定より少ないお金で____。$$, $$Consegui resolver com menos dinheiro do que o previsto.$$),
        (5, $$早く気づいたので、大きな問題にならないで____。$$, $$Percebi cedo, então consegui evitar que virasse um grande problema.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-129', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$済む$$),
        (2, $$済んだ$$),
        (2, $$済みました$$),
        (3, $$済む$$),
        (4, $$済んだ$$),
        (4, $$済みました$$),
        (5, $$済んだ$$),
        (5, $$済みました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-130 — 〜といけないから・〜てはいけないから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-130',
    'grammar',
    'N3',
    $$〜といけないから・〜てはいけないから$$,
    $$to ikenai kara / te wa ikenai kara$$,
    $$Para não / Caso / Por precaução$$,
    $$といけないから e てはいけないから são usados para explicar uma precaução: a pessoa faz algo para evitar um problema que poderia acontecer. Equivalem a "para não...", "caso..." ou "por precaução".

A primeira parte mostra o risco ("caso eu esqueça", "caso chova"), e a segunda, a ação de prevenção ("vou anotar", "vou levar o guarda-chuva").

A forma mais comum é Verbo na forma de dicionário + といけないから. A forma てはいけないから também aparece com o mesmo sentido. Com ので no lugar de から, a frase fica um pouco mais formal.

A ideia literal é "se acontecer tal coisa, não seria bom; por isso...".

É muito usada em conselhos e cuidados do dia a dia.$$,
    $$ないように (para que não) tem sentido parecido e também expressa prevenção: 忘れないようにメモする.

Em conselhos a outras pessoas, a segunda parte pode ser uma sugestão ou um pedido.

A expressão 念のため ("por via das dúvidas") combina bem com essa estrutura.$$,
    $$Verbo na forma de dicionário + といけないから、 + Ação preventiva
Verbo na forma て + はいけないから、 + Ação preventiva
… + といけないので (um pouco mais formal)$$,
    $$といけないから$$,
    $$てはいけないから|といけないから|てはいけないので|といけないので$$,
    ARRAY['と', 'いけない', 'から']::text[],
    ARRAY['といけないから', 'てはいけないから', 'といけないので']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-130', $$忘れるといけないから、メモしておこう。$$, $$わすれるといけないから、メモしておこう。$$, $$Para não esquecer, vou anotar.$$),
    ('n3-grammar-130', $$雨が降るといけないから、傘を持っていこう。$$, $$あめがふるといけないから、かさをもっていこう。$$, $$Caso chova, vou levar o guarda-chuva.$$),
    ('n3-grammar-130', $$遅れてはいけないから、早めに家を出た。$$, $$おくれてはいけないから、はやめにいえをでた。$$, $$Para não me atrasar, saí de casa mais cedo.$$),
    ('n3-grammar-130', $$風邪をひくといけないので、暖かくして寝なさい。$$, $$かぜをひくといけないので、あたたかくしてねなさい。$$, $$Para não pegar resfriado, durma bem agasalhado.$$),
    ('n3-grammar-130', $$道に迷うといけないから、地図を持っていきます。$$, $$みちにまようといけないから、ちずをもっていきます。$$, $$Caso me perca, vou levar um mapa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寝坊する____、目覚ましを二つかけた。$$, $$Para não dormir demais, coloquei dois despertadores.$$),
        (2, $$財布を落とす____、かばんの中に入れた。$$, $$Para não perder a carteira, coloquei-a dentro da bolsa.$$),
        (3, $$遅刻し____、タクシーで行った。$$, $$Para não chegar atrasado, fui de táxi.$$),
        (4, $$雨が降る____、洗濯物を中に入れた。$$, $$Caso chova, recolhi a roupa do varal.$$),
        (5, $$約束を忘れ____、カレンダーに書いておく。$$, $$Para não esquecer o compromisso, vou anotar no calendário.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-130', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といけないから$$),
        (2, $$といけないから$$),
        (3, $$てはいけないから$$),
        (4, $$といけないから$$),
        (5, $$るといけないから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-131 — 〜ている場合じゃない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-131',
    'grammar',
    'N3',
    $$〜ている場合じゃない$$,
    $$te iru baai ja nai$$,
    $$Não é hora de / Não dá para ficar$$,
    $$ている場合じゃない é usado para dizer que, na situação atual, não é momento de fazer certa coisa, porque há algo mais urgente ou importante. Equivale a "não é hora de..." ou "não dá para ficar...".

Ele junta a forma ている com 場合 (situação, ocasião) e じゃない (não é). A ideia literal é "não é situação de estar fazendo isso".

O tom é de urgência, alerta ou repreensão, para si mesmo ou para outra pessoa. Por exemplo, "amanhã tem prova, não é hora de ficar brincando" ou "não adianta chorar, temos que fazer alguma coisa".

A forma ている場合ではない é mais formal, e てる場合じゃない é a versão falada.$$,
    $$Com substantivos, a estrutura também existe: 今はけんかしている場合じゃない ou 今は冗談を言う場合じゃない.

É muito comum em mangás e animes, em momentos de tensão.

Às vezes, a frase vem seguida do que realmente deve ser feito, como 早く〜しないと.$$,
    $$Verbo na forma ている + 場合じゃない
Verbo na forma ている + 場合ではない (formal)
Verbo na forma てる + 場合じゃない (fala)$$,
    $$ている場合じゃない$$,
    $$ている場合じゃない|ている場合ではない|てる場合じゃない|でいる場合じゃない|でいる場合ではない|ている場合ではありません$$,
    ARRAY['ている', '場合', 'じゃない']::text[],
    ARRAY['ている場合じゃない', 'ている場合ではない', 'てる場合じゃない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-131', $$明日は試験だから、遊んでいる場合じゃない。$$, $$あしたはしけんだから、あそんでいるばあいじゃない。$$, $$Amanhã tem prova, então não é hora de ficar brincando.$$),
    ('n3-grammar-131', $$寝ている場合ではない。早く準備しなさい。$$, $$ねているばあいではない。はやくじゅんびしなさい。$$, $$Não é hora de dormir. Vá se preparar logo.$$),
    ('n3-grammar-131', $$泣いている場合じゃない。何とかしないと。$$, $$ないているばあいじゃない。なんとかしないと。$$, $$Não dá para ficar chorando. Temos que fazer alguma coisa.$$),
    ('n3-grammar-131', $$みんな真剣なんだから、今は笑っている場合ではありません。$$, $$みんなしんけんなんだから、いまはわらっているばあいではありません。$$, $$Todos estão sérios, então agora não é hora de rir.$$),
    ('n3-grammar-131', $$宿題が終わっていないのに、のんびりテレビを見ている場合じゃないよ。$$, $$しゅくだいがおわっていないのに、のんびりテレビをみているばあいじゃないよ。$$, $$Você nem terminou a lição, não é hora de ficar vendo TV tranquilo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$締め切りは明日だ。休ん____。$$, $$O prazo é amanhã. Não é hora de descansar.$$),
        (2, $$電車が来る！のんびり話し____。$$, $$O trem está chegando! Não dá para ficar conversando com calma.$$),
        (3, $$火事だ！写真を撮っ____。$$, $$É um incêndio! Não é hora de tirar fotos.$$),
        (4, $$試験が近いから、ゲームをし____。$$, $$A prova está chegando, então não é hora de jogar videogame.$$),
        (5, $$もう時間がない。迷っ____。$$, $$Não temos mais tempo. Não dá para ficar em dúvida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-131', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でいる場合じゃない$$),
        (1, $$でいる場合ではない$$),
        (2, $$ている場合じゃない$$),
        (2, $$ている場合ではない$$),
        (3, $$ている場合じゃない$$),
        (3, $$ている場合ではない$$),
        (4, $$ている場合じゃない$$),
        (4, $$ている場合ではない$$),
        (5, $$ている場合じゃない$$),
        (5, $$ている場合ではない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-132 — 〜的
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-132',
    'grammar',
    'N3',
    $$〜的$$,
    $$teki$$,
    $$Sufixo -ico / Sufixo -al / Do ponto de vista de$$,
    $$的 é um sufixo que transforma substantivos (geralmente de origem chinesa) em adjetivos な. Ele corresponde a terminações do português como "-ico" e "-al", como em 伝統的 (tradicional), 経済的 (econômico) e 国際的 (internacional).

O resultado funciona como um adjetivo な:
• Antes de substantivo: 的な, como 伝統的な料理 (comida tradicional).
• Como advérbio: 的に, como 経済的に難しい (economicamente difícil).
• No fim da frase: 的だ.

Com に e は, a forma 的には indica um ponto de vista: 個人的には significa "pessoalmente", "do meu ponto de vista".

的 é muito usado em textos formais, notícias, discussões e na linguagem acadêmica.$$,
    $$Nem todo substantivo aceita 的. Ele é usado principalmente com palavras de dois kanji de origem chinesa.

Na fala jovem, 的 aparece de forma criativa, como 私的には ("pra mim"), com tom bem casual.

Palavras como 積極的 (proativo) e 消極的 (passivo) são muito usadas para descrever personalidades.$$,
    $$Substantivo + 的な + Substantivo (伝統的な / 国際的な)
Substantivo + 的に + Verbo / Adjetivo (経済的に / 積極的に)
Substantivo + 的だ / 的です
Substantivo + 的には (do ponto de vista de)$$,
    $$的$$,
    $$的$$,
    ARRAY['的']::text[],
    ARRAY['的', '的な', '的に', '的には']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-132', $$彼は積極的な性格だ。$$, $$かれはせっきょくてきなせいかくだ。$$, $$Ele tem uma personalidade proativa.$$),
    ('n3-grammar-132', $$この計画は経済的に難しい。$$, $$このけいかくはけいざいてきにむずかしい。$$, $$Este plano é economicamente difícil.$$),
    ('n3-grammar-132', $$日本の伝統的な料理を食べたい。$$, $$にほんのでんとうてきなりょうりをたべたい。$$, $$Quero comer comida tradicional japonesa.$$),
    ('n3-grammar-132', $$彼女は国際的に有名な歌手だ。$$, $$かのじょはこくさいてきにゆうめいなかしゅだ。$$, $$Ela é uma cantora internacionalmente famosa.$$),
    ('n3-grammar-132', $$個人的には、この意見に賛成です。$$, $$こじんてきには、このいけんにさんせいです。$$, $$Pessoalmente, concordo com esta opinião.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$京都には伝統____な建物が多い。$$, $$Kyoto tem muitos prédios tradicionais.$$),
        (2, $$彼の説明はとても論理____だ。$$, $$A explicação dele é muito lógica.$$),
        (3, $$個人____には、この映画が好きです。$$, $$Pessoalmente, eu gosto deste filme.$$),
        (4, $$この計画は経済____に無理だ。$$, $$Este plano é economicamente inviável.$$),
        (5, $$彼女は会議でいつも積極____に意見を言う。$$, $$Ela sempre dá opiniões de forma proativa nas reuniões.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-132', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$的$$),
        (2, $$的$$),
        (3, $$的$$),
        (4, $$的$$),
        (5, $$的$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-133 — 〜ても始まらない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-133',
    'grammar',
    'N3',
    $$〜ても始まらない$$,
    $$te mo hajimaranai$$,
    $$Não adianta / Não leva a nada$$,
    $$ても始まらない é usado para dizer que fazer algo não serve para nada, porque não vai mudar a situação. Equivale a "não adianta" ou "não leva a nada".

A ideia literal é "mesmo fazendo isso, nada começa", ou seja, a ação não leva a nenhum avanço.

É muito usado com ações como chorar, reclamar, se arrepender ou ficar preocupado sozinho. O tom é de conselho ou consolo, incentivando a pessoa a parar e fazer algo mais útil.

Por exemplo, "não adianta se arrepender agora" ou "não adianta ficar se preocupando sozinho, vamos pedir conselho".

O sentido é muito parecido com てもしょうがない.$$,
    $$A expressão 今さら〜ても始まらない ("a esta altura, não adianta...") é muito comum.

Comparado a てもしょうがない, ても始まらない destaca que a ação não leva a nenhum progresso.

Muitas vezes, a frase continua com uma sugestão positiva, como "vamos pensar no próximo passo".$$,
    $$Verbo na forma て + も始まらない
Verbo na forma て + も始まりません (educado)

Escrita: 始まらない / はじまらない$$,
    $$ても始まらない$$,
    $$ても始まらない|でも始まらない|てもはじまらない|でもはじまらない|ても始まりません|でも始まりません$$,
    ARRAY['ても', '始まらない']::text[],
    ARRAY['ても始まらない', 'でも始まらない', 'ても始まりません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-133', $$今さら後悔しても始まらない。$$, $$いまさらこうかいしてもはじまらない。$$, $$A esta altura, não adianta se arrepender.$$),
    ('n3-grammar-133', $$泣いても始まらないよ。次を頑張ろう。$$, $$ないてもはじまらないよ。つぎをがんばろう。$$, $$Não adianta chorar. Vamos nos esforçar na próxima.$$),
    ('n3-grammar-133', $$ここで文句を言っても始まらない。$$, $$ここでもんくをいってもはじまらない。$$, $$Não adianta reclamar aqui.$$),
    ('n3-grammar-133', $$一人で悩んでも始まらないから、相談しよう。$$, $$ひとりでなやんでもはじまらないから、そうだんしよう。$$, $$Não adianta ficar se preocupando sozinho, vamos pedir conselho.$$),
    ('n3-grammar-133', $$過去のことを気にしても始まりません。$$, $$かこのことをきにしてもはじまりません。$$, $$Não adianta se preocupar com o passado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$終わったことを考え____。$$, $$Não adianta pensar no que já passou.$$),
        (2, $$怒っ____から、落ち着いて。$$, $$Não adianta ficar bravo, então se acalme.$$),
        (3, $$一人で悩ん____よ。$$, $$Não adianta ficar se preocupando sozinho.$$),
        (4, $$今さら謝っ____。$$, $$A esta altura, não adianta pedir desculpas.$$),
        (5, $$ここで待っ____から、探しに行こう。$$, $$Não adianta ficar esperando aqui, vamos procurar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-133', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ても始まらない$$),
        (1, $$ても始まりません$$),
        (2, $$ても始まらない$$),
        (3, $$でも始まらない$$),
        (4, $$ても始まらない$$),
        (4, $$ても始まりません$$),
        (5, $$ても始まらない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-134 — 〜てもかまわない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-134',
    'grammar',
    'N3',
    $$〜てもかまわない$$,
    $$te mo kamawanai$$,
    $$Pode / Não tem problema / Não me importo$$,
    $$てもかまわない é usado para dar ou pedir permissão, ou para dizer que algo não é um problema. Equivale a "pode", "não tem problema" ou "não me importo".

かまう significa "se importar". Assim, かまわない é "não me importo". A ideia literal é "mesmo que faça isso, não me importo".

O sentido é parecido com てもいい, mas てもかまわない soa um pouco mais formal e educado. Por isso, é comum em situações de trabalho e com pessoas desconhecidas.

Com a forma ない, なくてもかまわない significa "não precisa".

Também pode expressar flexibilidade em relação às próprias preferências, como "pode ser caro, não me importo".$$,
    $$Em perguntas educadas, てもかまいませんか é uma alternativa mais formal a てもいいですか.

A expressão 気にしなくてかまいません ("não precisa se preocupar") é comum em atendimento ao cliente.

Responder かまいませんよ é uma forma educada de dizer "pode, sim".$$,
    $$Verbo na forma て + もかまわない / もかまいません
Verbo na forma ない sem い + くてもかまわない (não precisa)
Adjetivo い sem い + くてもかまわない
Substantivo / Adjetivo な + でもかまわない

Pergunta: 〜てもかまいませんか
Escrita: かまわない / 構わない$$,
    $$てもかまわない$$,
    $$てもかまわない|でもかまわない|ても構わない|でも構わない|てもかまいません|でもかまいません$$,
    ARRAY['ても', 'かまわない']::text[],
    ARRAY['てもかまわない', 'てもかまいません', 'でもかまわない', 'なくてもかまわない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-134', $$すみません、ここに座ってもかまいませんか。$$, $$すみません、ここにすわってもかまいませんか。$$, $$Com licença, posso me sentar aqui?$$),
    ('n3-grammar-134', $$明日は来なくてもかまわない。$$, $$あしたはこなくてもかまわない。$$, $$Amanhã você não precisa vir.$$),
    ('n3-grammar-134', $$この書類は鉛筆で書いてもかまいません。$$, $$このしょるいはえんぴつでかいてもかまいません。$$, $$Este documento pode ser preenchido a lápis.$$),
    ('n3-grammar-134', $$少しぐらい遅れてもかまわないよ。$$, $$すこしぐらいおくれてもかまわないよ。$$, $$Não tem problema se atrasar um pouquinho.$$),
    ('n3-grammar-134', $$高くてもかまわないから、いい物を買いたい。$$, $$たかくてもかまわないから、いいものをかいたい。$$, $$Não me importo se for caro, quero comprar algo bom.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋を使っ____か。$$, $$Posso usar esta sala?$$),
        (2, $$忙しければ、手伝わなく____。$$, $$Se estiver ocupado, não precisa ajudar.$$),
        (3, $$質問には英語で答え____。$$, $$Pode responder às perguntas em inglês.$$),
        (4, $$部屋は駅に近ければ、狭くても____。$$, $$Se o apartamento for perto da estação, não me importo que seja pequeno.$$),
        (5, $$少しぐらい高く____から、この店で買おう。$$, $$Não me importo se for um pouco mais caro, vamos comprar nesta loja.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-134', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもかまいません$$),
        (2, $$てもかまわない$$),
        (2, $$てもかまいません$$),
        (3, $$てもかまいません$$),
        (3, $$てもかまわない$$),
        (4, $$かまわない$$),
        (4, $$かまいません$$),
        (5, $$てもかまわない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-135 — 〜てもしょうがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-135',
    'grammar',
    'N3',
    $$〜てもしょうがない$$,
    $$te mo shou ga nai$$,
    $$Não adianta / Não tem jeito / Não serve de nada$$,
    $$てもしょうがない é usado para dizer que fazer algo é inútil, porque não vai mudar a situação. Equivale a "não adianta", "não tem jeito" ou "não serve de nada".

しょうがない significa "não há jeito" ou "não há remédio". Assim, a estrutura diz "mesmo fazendo isso, não há jeito".

Ela é muito usada para consolar alguém ou para se resignar diante de algo que já aconteceu, como se arrepender, ficar bravo ou se preocupar.

O sentido é parecido com ても始まらない. A forma てもしかたがない tem exatamente o mesmo sentido e é um pouco mais formal.$$,
    $$しょうがない sozinho é uma expressão muito comum, como "fazer o quê" ou "não tem jeito", aceitando a situação.

Não confunda com てしょうがない (sem も), que significa "muito", "demais" e expressa um sentimento forte.

A diferença é só o も: ても = "não adianta"; て = "demais".$$,
    $$Verbo na forma て + もしょうがない
Verbo na forma て + もしょうがありません (educado)

Variação: てもしかたがない / てもしかたない$$,
    $$てもしょうがない$$,
    $$てもしょうがない|でもしょうがない|てもしかたがない|でもしかたがない|てもしょうがありません$$,
    ARRAY['ても', 'しょうがない']::text[],
    ARRAY['てもしょうがない', 'てもしかたがない', 'てもしょうがありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-135', $$今さら後悔してもしょうがない。$$, $$いまさらこうかいしてもしょうがない。$$, $$A esta altura, não adianta se arrepender.$$),
    ('n3-grammar-135', $$一人で悩んでもしょうがないよ。$$, $$ひとりでなやんでもしょうがないよ。$$, $$Não adianta ficar se preocupando sozinho.$$),
    ('n3-grammar-135', $$彼に文句を言ってもしょうがない。$$, $$かれにもんくをいってもしょうがない。$$, $$Não adianta reclamar com ele.$$),
    ('n3-grammar-135', $$もう終わったことだから、泣いてもしかたがない。$$, $$もうおわったことだから、ないてもしかたがない。$$, $$Já passou, então não adianta chorar.$$),
    ('n3-grammar-135', $$過ぎたことを考えてもしょうがありません。$$, $$すぎたことをかんがえてもしょうがありません。$$, $$Não adianta ficar pensando no que já passou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$そんなことで怒っ____。$$, $$Não adianta ficar bravo por uma coisa dessas.$$),
        (2, $$今心配し____から、もう寝よう。$$, $$Não adianta se preocupar agora, então vamos dormir.$$),
        (3, $$電車はもう出たから、今から急い____。$$, $$O trem já saiu, então não adianta correr agora.$$),
        (4, $$彼を責め____。$$, $$Não adianta culpá-lo.$$),
        (5, $$天気のことは気にし____。$$, $$Não adianta se preocupar com o tempo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-135', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもしょうがない$$),
        (1, $$てもしかたがない$$),
        (2, $$てもしょうがない$$),
        (2, $$てもしかたがない$$),
        (3, $$でもしょうがない$$),
        (3, $$でもしかたがない$$),
        (4, $$てもしょうがない$$),
        (4, $$てもしかたがない$$),
        (5, $$てもしょうがない$$),
        (5, $$てもしかたがない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-136 — 〜と言えば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-136',
    'grammar',
    'N3',
    $$〜と言えば$$,
    $$to ieba$$,
    $$Falando de / Por falar em / Quando se pensa em$$,
    $$と言えば tem dois usos principais.

O primeiro é associar uma palavra à coisa mais típica ou famosa ligada a ela. Equivale a "falando de..." ou "quando se pensa em...". Por exemplo, "falando de Japão, a primeira coisa é o Monte Fuji" ou "quando se pensa em inverno, é comida de panela".

O segundo é retomar algo que alguém disse e mudar um pouco o assunto. Equivale a "por falar em...". Por exemplo, alguém menciona o Tanaka, e você responde "por falar no Tanaka, dizem que ele vai se casar".

A forma と言ったら tem sentido parecido e é um pouco mais enfática.$$,
    $$そう言えば (por falar nisso) é uma expressão muito comum para lembrar de algo de repente.

と言えば aparece muito em perguntas como 日本と言えば何ですか ("o que vem à mente quando se fala de Japão?").

Na escrita, quando o sentido é abstrato, costuma-se usar hiragana: といえば.$$,
    $$Substantivo + と言えば、 + Associação típica
(Retomando a fala do outro) Substantivo + と言えば、 + Novo assunto

Variações: といえば / と言ったら / といったら$$,
    $$と言えば$$,
    $$と言えば|といえば|と言ったら|といったら$$,
    ARRAY['と', '言えば']::text[],
    ARRAY['と言えば', 'といえば', 'と言ったら', 'といったら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-136', $$日本と言えば、富士山ですね。$$, $$にほんといえば、ふじさんですね。$$, $$Falando de Japão, o Monte Fuji é o que vem à mente, né?$$),
    ('n3-grammar-136', $$夏と言えば、海に行きたくなる。$$, $$なつといえば、うみにいきたくなる。$$, $$Quando se pensa em verão, dá vontade de ir à praia.$$),
    ('n3-grammar-136', $$京都と言えば、お寺が有名だ。$$, $$きょうとといえば、おてらがゆうめいだ。$$, $$Falando de Kyoto, os templos são famosos.$$),
    ('n3-grammar-136', $$田中さんと言えば、来月結婚するそうですよ。$$, $$たなかさんといえば、らいげつけっこんするそうですよ。$$, $$Por falar no Tanaka, dizem que ele vai se casar no mês que vem.$$),
    ('n3-grammar-136', $$冬と言えば、やっぱり鍋料理だ。$$, $$ふゆといえば、やっぱりなべりょうりだ。$$, $$Quando se pensa em inverno, é comida de panela, claro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$北海道____、雪とラーメンだ。$$, $$Falando de Hokkaido, é neve e ramen.$$),
        (2, $$ブラジル____、サッカーとサンバが有名だ。$$, $$Falando de Brasil, futebol e samba são famosos.$$),
        (3, $$「旅行の話をしよう。」「旅行____、来月どこに行くの？」$$, $$"Vamos falar de viagem." "Por falar em viagem, aonde você vai no mês que vem?"$$),
        (4, $$春____、桜ですね。$$, $$Falando de primavera, são as cerejeiras, né?$$),
        (5, $$日本の食べ物____、すしでしょう。$$, $$Falando de comida japonesa, deve ser sushi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-136', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と言えば$$),
        (1, $$といえば$$),
        (2, $$と言えば$$),
        (2, $$といえば$$),
        (3, $$と言えば$$),
        (3, $$といえば$$),
        (4, $$と言えば$$),
        (4, $$といえば$$),
        (5, $$と言えば$$),
        (5, $$といえば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-137 — 〜といい・〜たらいい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-137',
    'grammar',
    'N3',
    $$〜といい・〜たらいい$$,
    $$to ii / tara ii$$,
    $$Tomara que / Seria bom se / É bom (fazer)$$,
    $$といい e たらいい têm dois usos principais.

O primeiro é expressar um desejo ou esperança: "tomara que..." ou "seria bom se...". Muitas vezes, aparece com ね, なあ ou のに no final. Por exemplo, "tomara que amanhã faça sol" ou "seria bom se eu passasse na prova".

O segundo é dar um conselho ou recomendação: "é bom fazer..." ou "é recomendável...". Por exemplo, "se não entender, é bom perguntar ao professor".

といい vem depois do verbo na forma de dicionário ou na forma ない. たらいい usa a forma たら. Os sentidos são muito parecidos, e ばいい também pode ser usado em muitos casos.

Com のに, といいのに expressa um desejo sobre algo que não está acontecendo, com um tom de lamento.$$,
    $$Para falar do desejo de outra pessoa, é comum dizer といいですね, mostrando que você também torce por ela.

Com o sujeito sendo você mesmo e uma ação que você controla, essas formas soam como conselho a si mesmo.

ばいい, といい e たらいい podem ser trocados em muitos contextos, mas といい soa natural em conselhos gerais.$$,
    $$Verbo (forma de dicionário / ない) + といい + ね / なあ / のに (desejo)
Verbo na forma た + らいい + なあ (desejo)
Verbo (forma de dicionário) + といい + ですよ (conselho)$$,
    $$といい$$,
    $$といい|たらいい|だらいい|ばいい$$,
    ARRAY['と', 'いい']::text[],
    ARRAY['といい', 'たらいい', 'ばいい', 'といいのに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-137', $$明日、晴れるといいですね。$$, $$あした、はれるといいですね。$$, $$Tomara que faça sol amanhã, né?$$),
    ('n3-grammar-137', $$早く元気になるといいね。$$, $$はやくげんきになるといいね。$$, $$Tomara que você melhore logo.$$),
    ('n3-grammar-137', $$わからないことは、先生に聞くといいですよ。$$, $$わからないことは、せんせいにきくといいですよ。$$, $$É bom perguntar ao professor o que você não entende.$$),
    ('n3-grammar-137', $$試験に合格できたらいいなあ。$$, $$しけんにごうかくできたらいいなあ。$$, $$Seria ótimo se eu passasse na prova.$$),
    ('n3-grammar-137', $$疲れたときは、温かいお風呂に入るといい。$$, $$つかれたときは、あたたかいおふろにはいるといい。$$, $$Quando estiver cansado, é bom tomar um banho quente de banheira.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$旅行の日、雨が降らない____ですね。$$, $$Tomara que não chova no dia da viagem, né?$$),
        (2, $$彼女がパーティーに来てくれ____なあ。$$, $$Seria bom se ela viesse à festa.$$),
        (3, $$京都に行くなら、金閣寺を見る____ですよ。$$, $$Se for a Kyoto, é bom ver o Kinkaku-ji.$$),
        (4, $$早く夏休みになる____のに。$$, $$Como seria bom se as férias de verão chegassem logo.$$),
        (5, $$宝くじが当たっ____なあ。$$, $$Seria ótimo se eu ganhasse na loteria.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-137', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といい$$),
        (2, $$たらいい$$),
        (3, $$といい$$),
        (4, $$といい$$),
        (5, $$たらいい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-138 — 〜といっても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-138',
    'grammar',
    'N3',
    $$〜といっても$$,
    $$to itte mo$$,
    $$Embora se diga que / Na verdade / É... mas$$,
    $$といっても é usado para corrigir ou limitar uma impressão que a frase anterior poderia dar. Equivale a "embora se diga que..., na verdade..." ou "é..., mas...".

A primeira parte apresenta algo que poderia soar impressionante ou importante, e a segunda mostra que a realidade é mais simples, menor ou diferente do esperado.

Por exemplo, "sei cozinhar, mas só coisas simples", "sou presidente, mas a empresa só tem três funcionários" ou "folga, mas só de dois dias".

O tom costuma ser de modéstia, honestidade ou de ajuste da expectativa do ouvinte.

Ele vem depois de substantivos e da forma simples de verbos e adjetivos.$$,
    $$といっても é diferente de と言ってもいい (pode-se dizer que), que reforça uma afirmação.

É muito útil para falar de si mesmo com modéstia, evitando parecer que está se gabando.

Na fala, também se usa って言っても com o mesmo sentido.$$,
    $$Substantivo + といっても、 + Realidade mais simples
Verbo / Adjetivo (forma simples) + といっても、 + Realidade

Escrita: といっても / と言っても$$,
    $$といっても$$,
    $$といっても|と言っても$$,
    ARRAY['と', 'いって', 'も']::text[],
    ARRAY['といっても', 'と言っても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-138', $$料理ができるといっても、簡単なものだけです。$$, $$りょうりができるといっても、かんたんなものだけです。$$, $$Sei cozinhar, mas só coisas simples.$$),
    ('n3-grammar-138', $$休みといっても、二日だけだ。$$, $$やすみといっても、ふつかだけだ。$$, $$Folga, sim, mas só de dois dias.$$),
    ('n3-grammar-138', $$日本語が話せるといっても、日常会話程度です。$$, $$にほんごがはなせるといっても、にちじょうかいわていどです。$$, $$Falo japonês, mas só o nível de conversa do dia a dia.$$),
    ('n3-grammar-138', $$社長といっても、社員は三人しかいない。$$, $$しゃちょうといっても、しゃいんはさんにんしかいない。$$, $$Sou presidente, mas a empresa só tem três funcionários.$$),
    ('n3-grammar-138', $$この町は寒いといっても、雪は降らない。$$, $$このまちはさむいといっても、ゆきはふらない。$$, $$Esta cidade é fria, mas não chega a nevar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$旅行____、近くの温泉に行っただけだ。$$, $$Viagem, sim, mas só fui a uma fonte termal aqui perto.$$),
        (2, $$英語ができる____、少しだけです。$$, $$Sei inglês, mas só um pouco.$$),
        (3, $$仕事が忙しい____、毎日ではない。$$, $$O trabalho é corrido, mas não todos os dias.$$),
        (4, $$家____、小さなアパートです。$$, $$Casa, sim, mas é um apartamento pequeno.$$),
        (5, $$夏休み____、宿題がたくさんある。$$, $$São férias de verão, mas tem muita lição.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-138', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といっても$$),
        (1, $$と言っても$$),
        (2, $$といっても$$),
        (2, $$と言っても$$),
        (3, $$といっても$$),
        (3, $$と言っても$$),
        (4, $$といっても$$),
        (4, $$と言っても$$),
        (5, $$といっても$$),
        (5, $$と言っても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-139 — 〜ということだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-139',
    'grammar',
    'N3',
    $$〜ということだ$$,
    $$to iu koto da$$,
    $$Dizem que / Quer dizer que / Isso significa que$$,
    $$ということだ tem dois usos principais.

O primeiro é repassar uma informação que se ouviu ou leu, de forma um pouco formal. Equivale a "dizem que" ou "segundo informações". É comum junto com によると ou の話では. Por exemplo, "segundo a previsão, amanhã vai chover".

O segundo é tirar uma conclusão a partir de algo que se observou ou ouviu. Equivale a "quer dizer que" ou "isso significa que". Por exemplo, "as luzes estão apagadas. Quer dizer que não tem mais ninguém".

Com つまり, a estrutura つまり〜ということですね é muito usada para confirmar se você entendeu algo corretamente.

Ele vem depois da forma simples completa. Com substantivos e adjetivos な, usa-se だ antes.$$,
    $$No uso de "dizem que", ということだ soa mais formal que そうだ.

No uso de conclusão, a frase muitas vezes começa com つまり ou それは.

Diferente de ということ (o fato de que), aqui a expressão termina a frase com だ ou です.$$,
    $$Fonte + によると、 + Frase (forma simples) + ということだ (dizem que)
Fato observado (com ponto final) + Frase + ということだ (conclusão)
つまり、 + Frase + ということですね (confirmação)

Educado: ということです
Fala casual: ってことだ$$,
    $$ということだ$$,
    $$ということだ|ということです|ってことだ$$,
    ARRAY['という', 'こと', 'だ']::text[],
    ARRAY['ということだ', 'ということです', 'ってことだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-139', $$天気予報によると、明日は雨が降るということだ。$$, $$てんきよほうによると、あしたはあめがふるということだ。$$, $$Segundo a previsão do tempo, amanhã vai chover.$$),
    ('n3-grammar-139', $$先生の話では、試験は来週だということです。$$, $$せんせいのはなしでは、しけんはらいしゅうだということです。$$, $$Pelo que o professor disse, a prova é na semana que vem.$$),
    ('n3-grammar-139', $$新聞によると、来年から物価が上がるということだ。$$, $$しんぶんによると、らいねんからぶっかがあがるということだ。$$, $$Segundo o jornal, os preços vão subir a partir do ano que vem.$$),
    ('n3-grammar-139', $$電気が消えている。もう誰もいないということだ。$$, $$でんきがきえている。もうだれもいないということだ。$$, $$As luzes estão apagadas. Quer dizer que não tem mais ninguém.$$),
    ('n3-grammar-139', $$つまり、彼は来ないということですね。$$, $$つまり、かれはこないということですね。$$, $$Então, quer dizer que ele não vem, certo?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ニュースによると、大きな台風が来る____。$$, $$Segundo o noticiário, vem um grande tufão.$$),
        (2, $$田中さんの話では、部長は来月退職する____。$$, $$Pelo que o Tanaka disse, o gerente vai se aposentar no mês que vem.$$),
        (3, $$返事がないのは、反対だ____。$$, $$Não ter resposta quer dizer que ele é contra.$$),
        (4, $$地図によると、この道をまっすぐ行けばいい____。$$, $$Segundo o mapa, basta seguir reto por esta rua.$$),
        (5, $$つまり、明日は休みだ____ね。$$, $$Então, quer dizer que amanhã é folga, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-139', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ということだ$$),
        (1, $$ということです$$),
        (2, $$ということだ$$),
        (2, $$ということです$$),
        (3, $$ということだ$$),
        (3, $$ということです$$),
        (4, $$ということだ$$),
        (4, $$ということです$$),
        (5, $$ということです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-140 — 〜というのは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-140',
    'grammar',
    'N3',
    $$〜というのは$$,
    $$to iu no wa$$,
    $$O que se chama de... é / Significa / Quanto a$$,
    $$というのは é usado para apresentar uma palavra, uma expressão ou uma ideia que vai ser explicada, definida ou comentada. Equivale a "o que se chama de... é", "... significa" ou "quanto a...".

O uso mais comum é definir palavras e conceitos. A frase costuma terminar com ことです ou という意味です. Por exemplo, "tsundoku é comprar livros e não ler".

Também é usado para pedir ou dar explicações sobre algo que alguém disse, como "é verdade que você não pode ir amanhã?" (literalmente, "isso de você não poder ir, é verdade?").

Na fala, というのは costuma virar っていうのは. Em textos formais, também aparece とは, com o mesmo sentido.$$,
    $$Para perguntar o significado de uma palavra, 〜というのは何ですか ou 〜って何ですか são muito úteis.

Em textos acadêmicos e dicionários, とは é a forma mais comum: 「花見」とは….

というのは também pode introduzir um motivo no começo de uma frase, com sentido de "é que...", num uso mais avançado.$$,
    $$Palavra / Expressão + というのは、 + Definição + ことだ / という意味だ
Frase (forma simples) + というのは、 + Comentário / Pergunta

Fala casual: っていうのは
Formal: 〜とは$$,
    $$というのは$$,
    $$というのは|っていうのは|とは$$,
    ARRAY['という', 'の', 'は']::text[],
    ARRAY['というのは', 'っていうのは', 'とは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-140', $$「積読」というのは、本を買って読まないことです。$$, $$「つんどく」というのは、ほんをかってよまないことです。$$, $$"Tsundoku" é comprar livros e não ler.$$),
    ('n3-grammar-140', $$親友というのは、何でも話せる友達のことだ。$$, $$しんゆうというのは、なんでもはなせるともだちのことだ。$$, $$Melhor amigo é aquele com quem se pode falar sobre tudo.$$),
    ('n3-grammar-140', $$明日行けないというのは、本当ですか。$$, $$あしたいけないというのは、ほんとうですか。$$, $$É verdade que você não pode ir amanhã?$$),
    ('n3-grammar-140', $$彼が来ないというのは、何か理由があるのだろう。$$, $$かれがこないというのは、なにかりゆうがあるのだろう。$$, $$Se ele não vem, deve haver algum motivo.$$),
    ('n3-grammar-140', $$「JR」というのは、日本の鉄道会社のことです。$$, $$「ジェイアール」というのは、にほんのてつどうがいしゃのことです。$$, $$"JR" é uma companhia ferroviária japonesa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「花見」____、桜を見ながら食事をすることです。$$, $$"Hanami" é comer e beber enquanto se admiram as cerejeiras.$$),
        (2, $$彼女が結婚した____、本当ですか。$$, $$É verdade que ela se casou?$$),
        (3, $$「お疲れ様」____、仕事の後にする挨拶です。$$, $$"Otsukaresama" é um cumprimento usado depois do trabalho.$$),
        (4, $$外国に留学する____、簡単なことではない。$$, $$Fazer intercâmbio no exterior não é algo simples.$$),
        (5, $$自由____、何でもしていいという意味ではない。$$, $$Liberdade não significa poder fazer qualquer coisa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-140', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というのは$$),
        (2, $$というのは$$),
        (3, $$というのは$$),
        (4, $$というのは$$),
        (5, $$というのは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-141 — 〜と言うと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-141',
    'grammar',
    'N3',
    $$〜と言うと$$,
    $$to iu to$$,
    $$Falando de / Quando se fala em / Quer dizer que$$,
    $$と言うと tem dois usos principais.

O primeiro é associar uma palavra à imagem mais comum ligada a ela. Equivale a "falando de..." ou "quando se fala em...". Por exemplo, "quando se fala em culinária japonesa, a primeira coisa que vem à mente é sushi". Esse uso é parecido com と言えば.

O segundo é retomar algo que o outro disse, para pedir mais detalhes ou confirmar uma conclusão. Equivale a "e então...?", "quer dizer que...?". Por exemplo, alguém diz "amanhã é folga", e você responde "quer dizer que a reunião foi cancelada?".

Nesse segundo uso, と言うと pode até aparecer sozinho, no começo da frase, sem repetir a palavra: "と言うと、どういうこと？".$$,
    $$と言うと e と言えば são muito parecidos no uso de associação. と言うと é mais comum quando se pede mais detalhes.

A resposta と言うと？ sozinha significa "como assim?" e pede uma explicação.

Na escrita, quando o sentido é abstrato, costuma-se usar hiragana: というと.$$,
    $$Substantivo + と言うと、 + Associação típica
(Retomando a fala do outro) Palavra + と言うと、 + Pergunta
と言うと、 + Pergunta (quer dizer que...?)

Variações: というと / って言うと$$,
    $$と言うと$$,
    $$と言うと|というと|って言うと$$,
    ARRAY['と', '言うと']::text[],
    ARRAY['と言うと', 'というと', 'って言うと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-141', $$日本料理と言うと、まずすしを思い浮かべる。$$, $$にほんりょうりというと、まずすしをおもいうかべる。$$, $$Quando se fala em culinária japonesa, a primeira coisa que vem à mente é sushi.$$),
    ('n3-grammar-141', $$「来週、北海道に行くんだ。」「北海道と言うと、雪がすごいでしょう。」$$, $$「らいしゅう、ほっかいどうにいくんだ。」「ほっかいどうというと、ゆきがすごいでしょう。」$$, $$"Semana que vem vou a Hokkaido." "Falando de Hokkaido, deve ter muita neve, né?"$$),
    ('n3-grammar-141', $$「明日は休みです。」「と言うと、会議は中止ですか。」$$, $$「あしたはやすみです。」「というと、かいぎはちゅうしですか。」$$, $$"Amanhã é folga." "Quer dizer que a reunião foi cancelada?"$$),
    ('n3-grammar-141', $$京都と言うと、お寺や神社が有名ですね。$$, $$きょうとというと、おてらやじんじゃがゆうめいですね。$$, $$Falando de Kyoto, os templos e santuários são famosos, né?$$),
    ('n3-grammar-141', $$「問題がある」と言うと、どんな問題ですか。$$, $$「もんだいがある」というと、どんなもんだいですか。$$, $$Quando você diz que há um problema, que tipo de problema é?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏____、何を思い出しますか。$$, $$Quando se fala em verão, do que você se lembra?$$),
        (2, $$「彼は来ないよ。」「____、パーティーは中止？」$$, $$"Ele não vem." "Quer dizer que a festa foi cancelada?"$$),
        (3, $$イタリア____、パスタとピザだね。$$, $$Falando de Itália, é massa e pizza, né?$$),
        (4, $$「お祭りがあるんだ。」「お祭り____、いつ？」$$, $$"Vai ter um festival." "Festival? Quando?"$$),
        (5, $$「彼女は先生です。」「先生____、何の先生ですか。」$$, $$"Ela é professora." "Professora de quê?"$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-141', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と言うと$$),
        (1, $$というと$$),
        (2, $$と言うと$$),
        (2, $$というと$$),
        (3, $$と言うと$$),
        (3, $$というと$$),
        (4, $$と言うと$$),
        (4, $$というと$$),
        (5, $$と言うと$$),
        (5, $$というと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-142 — 〜というより
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-142',
    'grammar',
    'N3',
    $$〜というより$$,
    $$to iu yori$$,
    $$Mais do que / Mais propriamente / Não tanto... mas sim$$,
    $$というより é usado para corrigir ou ajustar uma descrição, dizendo que outra palavra é mais adequada. Equivale a "mais do que...", "mais propriamente" ou "não tanto... mas sim...".

A primeira parte apresenta uma descrição possível, e a segunda, uma descrição mais precisa. Por exemplo, "hoje não está tanto quente, está é calor" ou "ele é menos um professor e mais um amigo".

É muito útil para expressar nuances e ser mais exato ao descrever pessoas, sentimentos e situações.

Com むしろ, a estrutura というより、むしろ reforça a correção.

Ele vem depois de substantivos, adjetivos (sem だ para な) e da forma simples de verbos.$$,
    $$というより é diferente de より (comparação simples). Aqui, a ideia não é "mais que", e sim "uma descrição mais correta seria".

É muito comum em conversas para expressar sentimentos com precisão: 怒っているというより悲しい.

Com adjetivos な, não se usa だ antes: 静かというより.$$,
    $$A + というより + B (mais B do que A)
A + というより、むしろ + B
Verbo / Adjetivo (forma simples) + というより

Variações: と言うより / っていうより$$,
    $$というより$$,
    $$というより|と言うより|っていうより$$,
    ARRAY['と', 'いう', 'より']::text[],
    ARRAY['というより', 'と言うより', 'っていうより']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-142', $$今日は暖かいというより、暑い。$$, $$きょうはあたたかいというより、あつい。$$, $$Hoje não está tanto quentinho, está é calor.$$),
    ('n3-grammar-142', $$彼は先生というより、友達のような存在だ。$$, $$かれはせんせいというより、ともだちのようなそんざいだ。$$, $$Ele é menos um professor e mais um amigo.$$),
    ('n3-grammar-142', $$この料理は、料理というより芸術だ。$$, $$このりょうりは、りょうりというよりげいじゅつだ。$$, $$Esta comida é mais arte do que comida.$$),
    ('n3-grammar-142', $$彼女はきれいというより、かわいいタイプだ。$$, $$かのじょはきれいというより、かわいいタイプだ。$$, $$Ela é mais fofa do que bonita.$$),
    ('n3-grammar-142', $$彼は怒っているというより、悲しんでいるようだった。$$, $$かれはおこっているというより、かなしんでいるようだった。$$, $$Ele parecia mais triste do que bravo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋は狭い____、使いにくい。$$, $$Este quarto não é tanto pequeno, é mais difícil de usar.$$),
        (2, $$彼は話し上手____、聞き上手だ。$$, $$Ele é mais um bom ouvinte do que um bom falante.$$),
        (3, $$それは忘れた____、最初から知らなかったんだ。$$, $$Não é que eu tenha esquecido; na verdade, eu nem sabia.$$),
        (4, $$昨日の雨は雨____、嵐だった。$$, $$A chuva de ontem foi mais uma tempestade do que uma chuva.$$),
        (5, $$彼のことは好き____、尊敬している。$$, $$Mais do que gostar dele, eu o admiro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-142', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というより$$),
        (2, $$というより$$),
        (3, $$というより$$),
        (4, $$というより$$),
        (5, $$というより$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-143 — 〜とみえる・〜とみえて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-143',
    'grammar',
    'N3',
    $$〜とみえる・〜とみえて$$,
    $$to mieru / to miete$$,
    $$Parece que / Pelo visto / Ao que tudo indica$$,
    $$とみえる e とみえて são usados para fazer uma suposição baseada em algo que se observa. Equivalem a "parece que", "pelo visto" ou "ao que tudo indica".

A primeira parte é a suposição (o que a pessoa deduz), e a segunda parte, com とみえて, é a evidência observada que levou a essa conclusão. Por exemplo, "ele devia estar muito cansado, pelo visto, porque dormiu na hora".

Com とみえる no fim da frase, a dedução vem depois da evidência: "a rua está molhada. Parece que choveu de madrugada".

O sujeito costuma ser outra pessoa ou uma situação, e não quem fala, porque a ideia é deduzir algo a partir do que se vê.

É uma expressão um pouco formal e literária, comum em narrativas.$$,
    $$とみえる é parecido com らしい e ようだ, mas soa mais literário.

A palavra よほど (muito, bastante) aparece muito junto: よほど疲れていたとみえて.

Não confunda com に見える (parecer, pela aparência), que descreve como algo parece visualmente.$$,
    $$Frase (suposição, forma simples) + とみえて、 + Evidência observada
Evidência (com ponto final) + Frase (suposição) + とみえる

Escrita: とみえる / と見える$$,
    $$とみえる$$,
    $$とみえる|とみえて|と見える|と見えて|とみえ|と見え$$,
    ARRAY['と', 'みえる']::text[],
    ARRAY['とみえる', 'とみえて', 'と見える', 'と見えて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-143', $$彼はよほど疲れていたとみえて、すぐに寝てしまった。$$, $$かれはよほどつかれていたとみえて、すぐにねてしまった。$$, $$Pelo visto ele estava muito cansado, porque dormiu na hora.$$),
    ('n3-grammar-143', $$道が濡れている。夜中に雨が降ったとみえる。$$, $$みちがぬれている。よなかにあめがふったとみえる。$$, $$A rua está molhada. Parece que choveu de madrugada.$$),
    ('n3-grammar-143', $$彼女は何かいいことがあったとみえて、ずっと笑っている。$$, $$かのじょはなにかいいことがあったとみえて、ずっとわらっている。$$, $$Pelo visto aconteceu algo bom com ela, porque não para de sorrir.$$),
    ('n3-grammar-143', $$子供たちはお腹がすいていたとみえて、全部食べてしまった。$$, $$こどもたちはおなかがすいていたとみえて、ぜんぶたべてしまった。$$, $$As crianças, pelo visto, estavam com fome, porque comeram tudo.$$),
    ('n3-grammar-143', $$この店は人気があるとみえて、いつも行列ができている。$$, $$このみせはにんきがあるとみえて、いつもぎょうれつができている。$$, $$Ao que tudo indica esta loja é popular, porque sempre tem fila.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は急いでいた____、挨拶もしないで出て行った。$$, $$Pelo visto ele estava com pressa, porque saiu sem nem cumprimentar.$$),
        (2, $$犬は散歩に行きたい____、ドアの前で待っている。$$, $$O cachorro, pelo visto, quer passear, porque está esperando na porta.$$),
        (3, $$電気が消えている。みんなもう寝た____。$$, $$As luzes estão apagadas. Parece que todos já foram dormir.$$),
        (4, $$彼女はその映画が気に入った____、三回も見た。$$, $$Pelo visto ela gostou desse filme, porque viu três vezes.$$),
        (5, $$彼は勉強しなかった____、試験の点が悪かった。$$, $$Pelo visto ele não estudou, porque tirou nota baixa na prova.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-143', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とみえて$$),
        (1, $$と見えて$$),
        (2, $$とみえて$$),
        (2, $$と見えて$$),
        (3, $$とみえる$$),
        (3, $$と見える$$),
        (4, $$とみえて$$),
        (4, $$と見えて$$),
        (5, $$とみえて$$),
        (5, $$と見えて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-144 — 〜とすれば・〜としたら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-144',
    'grammar',
    'N3',
    $$〜とすれば・〜としたら$$,
    $$to sureba / to shitara$$,
    $$Se / Supondo que / Caso$$,
    $$とすれば e としたら são usados para apresentar uma hipótese ou suposição, e depois falar das consequências ou fazer uma pergunta sobre ela. Equivalem a "se", "supondo que" ou "caso".

A ideia literal é "se considerarmos que...". A condição pode ser algo imaginário ("se você tivesse cem milhões de ienes"), algo incerto ("se essa história for verdade") ou um plano ("se for fazer intercâmbio, qual país seria bom?").

としたら é mais comum na conversa, e とすれば soa um pouco mais formal e lógico. A forma とすると também existe, com sentido parecido.

Ele vem depois da forma simples completa. Com substantivos e adjetivos な, usa-se だ antes.$$,
    $$Comparado a たら e ば, とすれば e としたら destacam que a condição é uma suposição, e não algo certo.

Perguntas do tipo 生まれ変わるとしたら, 何になりたい？ ("se você renascesse, o que gostaria de ser?") são muito comuns em conversas.

Em textos lógicos, とすれば aparece para tirar conclusões a partir de uma premissa.$$,
    $$Frase (forma simples) + とすれば / としたら / とすると、 + Consequência / Pergunta
Substantivo / Adjetivo な + だ + とすれば / としたら$$,
    $$とすれば$$,
    $$とすれば|としたら|とすると$$,
    ARRAY['と', 'すれば']::text[],
    ARRAY['とすれば', 'としたら', 'とすると']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-144', $$明日雨が降るとすれば、試合は中止だ。$$, $$あしたあめがふるとすれば、しあいはちゅうしだ。$$, $$Se chover amanhã, a partida será cancelada.$$),
    ('n3-grammar-144', $$一億円あるとしたら、何をしますか。$$, $$いちおくえんあるとしたら、なにをしますか。$$, $$Supondo que você tivesse cem milhões de ienes, o que faria?$$),
    ('n3-grammar-144', $$彼の話が本当だとすれば、大変なことだ。$$, $$かれのはなしがほんとうだとすれば、たいへんなことだ。$$, $$Se a história dele for verdade, é algo grave.$$),
    ('n3-grammar-144', $$今から出発するとすると、何時に着きますか。$$, $$いまからしゅっぱつするとすると、なんじにつきますか。$$, $$Se sairmos agora, a que horas chegaremos?$$),
    ('n3-grammar-144', $$留学するとすれば、どの国がいいですか。$$, $$りゅうがくするとすれば、どのくにがいいですか。$$, $$Se fosse fazer intercâmbio, qual país seria bom?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$生まれ変わる____、何になりたいですか。$$, $$Se você renascesse, o que gostaria de ser?$$),
        (2, $$その噂が本当だ____、困ったことになる。$$, $$Se esse boato for verdade, vamos ter problemas.$$),
        (3, $$今度旅行に行く____、どこへ行きたい？$$, $$Se você fosse viajar da próxima vez, aonde gostaria de ir?$$),
        (4, $$一人で行く____、電車が一番便利だ。$$, $$Se for sozinho, o trem é o mais prático.$$),
        (5, $$彼が犯人だ____、動機は何だろう。$$, $$Se ele for o culpado, qual seria o motivo?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-144', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とすれば$$),
        (1, $$としたら$$),
        (2, $$とすれば$$),
        (2, $$としたら$$),
        (3, $$とすれば$$),
        (3, $$としたら$$),
        (4, $$とすれば$$),
        (4, $$としたら$$),
        (5, $$とすれば$$),
        (5, $$としたら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-145 — 〜と共に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-145',
    'grammar',
    'N3',
    $$〜と共に$$,
    $$to tomo ni$$,
    $$Junto com / À medida que / Ao mesmo tempo que$$,
    $$と共に é uma expressão formal com três usos principais.

O primeiro é "junto com": fazer algo com outra pessoa ou grupo, como "receber o ano novo junto com a família". É uma forma mais formal de と一緒に.

O segundo é "à medida que" ou "com": uma mudança acompanha outra, como "com o passar dos tempos, a vida das pessoas também mudou". Nesse uso, é parecido com につれて.

O terceiro é "ao mesmo tempo que": algo acontece simultaneamente a outra coisa, como "com a chegada da primavera, as cerejeiras começaram a florir". Também pode indicar que alguém tem duas qualidades ao mesmo tempo: "ele é cantor e, ao mesmo tempo, ator".

Por ser formal, と共に aparece muito em discursos, notícias e textos escritos.$$,
    $$Em cartas e discursos formais, frases como 皆様と共に ("junto com todos vocês") são comuns.

No uso de "à medida que", と共に soa mais formal que につれて.

Na conversa do dia a dia, prefira と一緒に para "junto com".$$,
    $$Substantivo (pessoa) + と共に + Verbo (junto com)
Substantivo / Verbo (forma de dicionário) + と共に + Mudança (à medida que)
Substantivo + の + Acontecimento + と共に (ao mesmo tempo)
Substantivo + であると共に + Substantivo + でもある

Escrita: と共に / とともに$$,
    $$と共に$$,
    $$と共に|とともに$$,
    ARRAY['と', '共に']::text[],
    ARRAY['と共に', 'とともに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-145', $$家族と共に、新しい年を迎えた。$$, $$かぞくとともに、あたらしいとしをむかえた。$$, $$Recebi o ano novo junto com a família.$$),
    ('n3-grammar-145', $$時代と共に、人々の生活も変わった。$$, $$じだいとともに、ひとびとのせいかつもかわった。$$, $$Com o passar dos tempos, a vida das pessoas também mudou.$$),
    ('n3-grammar-145', $$年をとると共に、体力が落ちてきた。$$, $$としをとるとともに、たいりょくがおちてきた。$$, $$À medida que envelheço, minha força física vem diminuindo.$$),
    ('n3-grammar-145', $$春の訪れと共に、桜が咲き始めた。$$, $$はるのおとずれとともに、さくらがさきはじめた。$$, $$Com a chegada da primavera, as cerejeiras começaram a florir.$$),
    ('n3-grammar-145', $$彼は歌手であると共に、俳優でもある。$$, $$かれはかしゅであるとともに、はいゆうでもある。$$, $$Ele é cantor e, ao mesmo tempo, ator.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$仲間____、山に登った。$$, $$Subi a montanha junto com os companheiros.$$),
        (2, $$経済の発展____、生活が豊かになった。$$, $$Com o desenvolvimento da economia, a vida ficou mais próspera.$$),
        (3, $$彼女は結婚する____、仕事をやめた。$$, $$Ela saiu do emprego ao mesmo tempo que se casou.$$),
        (4, $$技術の進歩____、便利な世の中になった。$$, $$Com o progresso da tecnologia, o mundo ficou mais prático.$$),
        (5, $$彼女は医者である____、母親でもある。$$, $$Ela é médica e, ao mesmo tempo, mãe.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-145', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と共に$$),
        (1, $$とともに$$),
        (2, $$と共に$$),
        (2, $$とともに$$),
        (3, $$と共に$$),
        (3, $$とともに$$),
        (4, $$と共に$$),
        (4, $$とともに$$),
        (5, $$と共に$$),
        (5, $$とともに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-146 — 〜途中で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-146',
    'grammar',
    'N3',
    $$〜途中で$$,
    $$tochuu de$$,
    $$No meio do caminho / No meio de / A caminho de$$,
    $$途中で significa "no meio do caminho" ou "no meio de". Ele indica que algo acontece enquanto uma ação ou um deslocamento ainda não terminou.

Ele tem dois usos principais. O primeiro é no deslocamento: "a caminho da escola, encontrei um amigo". Nesse caso, vem depois do verbo na forma de dicionário, como 行く途中で ou 帰る途中で.

O segundo é no meio de uma atividade ou evento: "no meio do filme, peguei no sono" ou "no meio da conversa, o telefone tocou". Nesse caso, vem depois de substantivos com の.

Com に, 途中に indica um lugar ou parada no meio do trajeto, como "passei numa loja de conveniência no caminho de volta".

Sozinho, antes de um verbo, 途中で significa "pela metade", como em "desistir do trabalho pela metade".$$,
    $$途中で降りる significa "descer no meio do caminho", por exemplo, de um trem.

途中まで significa "até a metade": 途中まで一緒に行こう (vamos juntos até o meio do caminho).

Comparado a 最中に, 途中で é mais neutro e não tem necessariamente a ideia de interrupção desagradável.$$,
    $$Verbo na forma de dicionário + 途中で / 途中に (no caminho)
Substantivo + の + 途中で (no meio de)
途中で + Verbo (pela metade: 途中でやめる)

Escrita: 途中 / とちゅう$$,
    $$途中で$$,
    $$途中で|途中に|とちゅう$$,
    ARRAY['途中', 'で']::text[],
    ARRAY['途中で', '途中に', '途中まで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-146', $$学校へ行く途中で、友達に会った。$$, $$がっこうへいくとちゅうで、ともだちにあった。$$, $$A caminho da escola, encontrei um amigo.$$),
    ('n3-grammar-146', $$疲れていて、映画の途中で寝てしまった。$$, $$つかれていて、えいがのとちゅうでねてしまった。$$, $$Estava cansado e acabei dormindo no meio do filme.$$),
    ('n3-grammar-146', $$話の途中で、電話が鳴った。$$, $$はなしのとちゅうで、でんわがなった。$$, $$O telefone tocou no meio da conversa.$$),
    ('n3-grammar-146', $$帰る途中に、コンビニに寄った。$$, $$かえるとちゅうに、コンビニによった。$$, $$No caminho de volta, passei numa loja de conveniência.$$),
    ('n3-grammar-146', $$仕事を途中でやめてはいけない。$$, $$しごとをとちゅうでやめてはいけない。$$, $$Não se deve largar o trabalho pela metade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅へ行く____、雨が降り出した。$$, $$A caminho da estação, começou a chover.$$),
        (2, $$サッカーの試合の____、けがをした。$$, $$Me machuquei no meio da partida de futebol.$$),
        (3, $$家に帰る____、本屋に寄りました。$$, $$No caminho de casa, passei numa livraria.$$),
        (4, $$足が痛くなって、マラソンを____やめてしまった。$$, $$Meu pé começou a doer e acabei desistindo da maratona no meio.$$),
        (5, $$授業の____、先生が教室を出た。$$, $$No meio da aula, o professor saiu da sala.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-146', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$途中で$$),
        (1, $$途中に$$),
        (2, $$途中で$$),
        (3, $$途中で$$),
        (3, $$途中に$$),
        (4, $$途中で$$),
        (5, $$途中で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-147 — ところで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-147',
    'grammar',
    'N3',
    $$ところで$$,
    $$tokoro de$$,
    $$A propósito / Mudando de assunto / Por falar nisso$$,
    $$ところで é uma conjunção usada para mudar de assunto de repente, introduzindo um tema novo. Equivale a "a propósito" ou "mudando de assunto".

Ela fica no começo da frase e avisa o ouvinte de que o tema da conversa vai mudar. Muitas vezes, o novo assunto não tem relação direta com o anterior.

É muito usada em conversas, cartas e e-mails, depois de cumprimentos ou de terminar um assunto. Por exemplo, "que dia bonito, né? A propósito, como vai o trabalho?".

Comparado a さて, que passa para a próxima etapa de algo planejado, ところで muda o assunto de forma mais livre e repentina.$$,
    $$Usar ところで com muita frequência pode parecer que você não está prestando atenção no que o outro diz.

Em e-mails, ところで é usado para introduzir um segundo assunto depois do principal.

そういえば ("por falar nisso") também muda de assunto, mas a partir de algo que lembra a conversa anterior.$$,
    $$Frase 1 (com ponto final) + ところで、 + Novo assunto
ところで、 + Pergunta$$,
    $$ところで$$,
    $$ところで$$,
    ARRAY['ところで']::text[],
    ARRAY['ところで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-147', $$ところで、明日の会議は何時からですか。$$, $$ところで、あしたのかいぎはなんじからですか。$$, $$A propósito, a reunião de amanhã é a partir de que horas?$$),
    ('n3-grammar-147', $$いい天気ですね。ところで、お仕事は順調ですか。$$, $$いいてんきですね。ところで、おしごとはじゅんちょうですか。$$, $$Que dia bonito, né? A propósito, como vai o trabalho?$$),
    ('n3-grammar-147', $$ところで、田中さんは元気？$$, $$ところで、たなかさんはげんき？$$, $$A propósito, o Tanaka está bem?$$),
    ('n3-grammar-147', $$この話はここまで。ところで、来週の予定は？$$, $$このはなしはここまで。ところで、らいしゅうのよていは？$$, $$Este assunto termina aqui. Mudando de assunto, quais são os planos para a semana que vem?$$),
    ('n3-grammar-147', $$ところで、あの本はもう読みましたか。$$, $$ところで、あのほんはもうよみましたか。$$, $$Por falar nisso, você já leu aquele livro?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日は楽しかったね。____、次はいつ会える？$$, $$Hoje foi divertido, né? A propósito, quando podemos nos ver de novo?$$),
        (2, $$____、この前の話はどうなりましたか。$$, $$A propósito, o que aconteceu com aquele assunto de outro dia?$$),
        (3, $$仕事の話はこれで終わります。____、皆さん週末は何をしますか。$$, $$O assunto de trabalho termina aqui. Mudando de assunto, o que vocês vão fazer no fim de semana?$$),
        (4, $$____、お昼ご飯はもう食べた？$$, $$A propósito, você já almoçou?$$),
        (5, $$そうなんですか。____、田中さんを見ませんでしたか。$$, $$É mesmo? A propósito, você não viu o Tanaka?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-147', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところで$$),
        (2, $$ところで$$),
        (3, $$ところで$$),
        (4, $$ところで$$),
        (5, $$ところで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-148 — ところが
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-148',
    'grammar',
    'N3',
    $$ところが$$,
    $$tokoro ga$$,
    $$Mas / No entanto / Só que (inesperado)$$,
    $$ところが é uma conjunção que introduz um resultado inesperado, contrário ao que se esperava. Equivale a "mas", "no entanto" ou "só que".

A primeira frase apresenta uma expectativa ou uma ação, e a segunda, iniciada por ところが, mostra que a realidade foi diferente e surpreendente. Por exemplo, "achei que seria fácil. No entanto, foi muito difícil".

A diferença em relação a しかし e でも é o elemento de surpresa. ところが destaca que o resultado foi inesperado para quem fala.

Por isso, a segunda parte é um fato que aconteceu, e não uma opinião, um pedido ou uma intenção.$$,
    $$ところが é muito comum em narrativas, histórias e relatos pessoais.

A segunda parte geralmente está no passado e descreve algo que de fato aconteceu.

Não confunda com ところで (a propósito), que muda de assunto, nem com ところ (lugar, momento).$$,
    $$Frase 1 (expectativa / ação, com ponto final) + ところが、 + Resultado inesperado$$,
    $$ところが$$,
    $$ところが$$,
    ARRAY['ところが']::text[],
    ARRAY['ところが']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-148', $$天気予報では晴れだった。ところが、午後から雨が降った。$$, $$てんきよほうでははれだった。ところが、ごごからあめがふった。$$, $$A previsão era de sol. No entanto, choveu a partir da tarde.$$),
    ('n3-grammar-148', $$簡単だと思った。ところが、とても難しかった。$$, $$かんたんだとおもった。ところが、とてもむずかしかった。$$, $$Achei que seria fácil. Só que foi muito difícil.$$),
    ('n3-grammar-148', $$急いで駅に行った。ところが、電車はもう出ていた。$$, $$いそいでえきにいった。ところが、でんしゃはもうでていた。$$, $$Fui correndo para a estação. Mas o trem já tinha saído.$$),
    ('n3-grammar-148', $$彼は来ると言っていた。ところが、結局来なかった。$$, $$かれはくるといっていた。ところが、けっきょくこなかった。$$, $$Ele disse que viria. No entanto, no fim não veio.$$),
    ('n3-grammar-148', $$安いと思って買った。ところが、すぐに壊れた。$$, $$やすいとおもってかった。ところが、すぐにこわれた。$$, $$Comprei achando que estava barato. Só que quebrou logo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ケーキを買いに店に行った。____、休みだった。$$, $$Fui à loja comprar um bolo. Mas estava fechada.$$),
        (2, $$試験は簡単だと聞いていた。____、全然できなかった。$$, $$Tinha ouvido que a prova era fácil. No entanto, não consegui fazer nada.$$),
        (3, $$彼に電話した。____、誰も出なかった。$$, $$Liguei para ele. Mas ninguém atendeu.$$),
        (4, $$晴れると思って傘を持たずに出かけた。____、雨が降り出した。$$, $$Saí sem guarda-chuva achando que ia fazer sol. Só que começou a chover.$$),
        (5, $$早く寝ようと思った。____、なかなか眠れなかった。$$, $$Pensei em dormir cedo. No entanto, não consegui pegar no sono.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-148', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところが$$),
        (2, $$ところが$$),
        (3, $$ところが$$),
        (4, $$ところが$$),
        (5, $$ところが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-149 — 〜とおりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-149',
    'grammar',
    'N3',
    $$〜とおりに$$,
    $$toori ni$$,
    $$Do jeito que / Conforme / Exatamente como$$,
    $$とおりに é usado para dizer que algo é feito exatamente como foi indicado, dito, mostrado ou planejado. Equivale a "do jeito que", "conforme" ou "exatamente como".

Ele vem depois de verbos (na forma de dicionário ou た) e de substantivos com の. Com substantivos, também existe a forma どおりに, sem の, como em 予定どおりに (conforme o planejado).

Por exemplo, "monte conforme o manual", "fiz do jeito que o professor disse" ou "partimos conforme o planejado".

Sem に, とおり também aparece no começo de frases, como 思ったとおり ("como eu pensava"), indicando que algo aconteceu exatamente como se esperava.$$,
    $$Com substantivos, どおり (sem の) é muito comum em expressões como 予定どおり, 計画どおり e 時間どおり.

A expressão おっしゃるとおりです ("é exatamente como o senhor diz") é uma forma educada de concordar.

Não confunda com 通り (とおり) de rua, como em 大通り (avenida).$$,
    $$Verbo (forma de dicionário / た) + とおりに + Verbo
Substantivo + の + とおりに + Verbo
Substantivo + どおりに + Verbo (予定どおりに / 計画どおりに)
思ったとおり、 + Frase (como eu pensava)

Escrita: とおり / 通り$$,
    $$とおりに$$,
    $$とおりに|通りに|どおりに|とおり|通り$$,
    ARRAY['とおり', 'に']::text[],
    ARRAY['とおりに', '通りに', 'どおりに', 'とおり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-149', $$説明書のとおりに組み立ててください。$$, $$せつめいしょのとおりにくみたててください。$$, $$Monte conforme o manual, por favor.$$),
    ('n3-grammar-149', $$先生が言ったとおりにやってみた。$$, $$せんせいがいったとおりにやってみた。$$, $$Tentei fazer do jeito que o professor disse.$$),
    ('n3-grammar-149', $$飛行機は予定どおりに出発した。$$, $$ひこうきはよていどおりにしゅっぱつした。$$, $$O avião partiu conforme o planejado.$$),
    ('n3-grammar-149', $$思ったとおり、彼は来なかった。$$, $$おもったとおり、かれはこなかった。$$, $$Como eu pensava, ele não veio.$$),
    ('n3-grammar-149', $$私が書くとおりに書いてください。$$, $$わたしがかくとおりにかいてください。$$, $$Escreva exatamente como eu escrever, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$地図の____行けば、駅に着きます。$$, $$Se seguir conforme o mapa, você chega à estação.$$),
        (2, $$母が教えてくれた____料理を作った。$$, $$Fiz a comida do jeito que minha mãe me ensinou.$$),
        (3, $$言われた____すれば、大丈夫です。$$, $$Se fizer do jeito que mandaram, vai dar tudo certo.$$),
        (4, $$仕事は計画____進んでいる。$$, $$O trabalho está avançando conforme o plano.$$),
        (5, $$見た____話してください。$$, $$Conte exatamente como você viu, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-149', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とおりに$$),
        (1, $$通りに$$),
        (2, $$とおりに$$),
        (2, $$通りに$$),
        (3, $$とおりに$$),
        (3, $$通りに$$),
        (4, $$どおりに$$),
        (4, $$通りに$$),
        (5, $$とおりに$$),
        (5, $$通りに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-150 — 〜通す
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-150',
    'grammar',
    'N3',
    $$〜通す$$,
    $$toosu$$,
    $$Fazer até o fim / Continuar sem parar / Manter até o fim$$,
    $$通す, ligado a outro verbo, indica que uma ação foi feita do começo ao fim, sem interrupção, mesmo com dificuldades. Equivale a "fazer até o fim", "continuar sem parar" ou "manter até o fim".

A estrutura junta o verbo na forma ます sem ます com 通す. O resultado funciona como um verbo do grupo 1.

A ideia é de persistência: correr a prova inteira, trabalhar a noite toda, manter a própria opinião até o fim, ler um livro longo do início ao fim.

Comparado a 切る, que indica conclusão total, 通す destaca a continuidade e o esforço para não parar no meio.

Também pode ter sentido negativo, como 嘘をつき通す (manter a mentira até o fim).$$,
    $$やり通す (levar até o fim) é muito usado em frases de determinação e incentivo.

守り通す significa "proteger até o fim" ou "cumprir até o fim", como uma promessa.

Sozinho, 通す significa "deixar passar" ou "fazer passar", como em 人を通す (deixar alguém passar).$$,
    $$Verbo na forma ます sem ます + 通す

Passado: 通した / 通しました
Desejo: 通したい

Combinações comuns: やり通す / 走り通す / 働き通す / 言い通す / 守り通す / 読み通す$$,
    $$通す$$,
    $$通し|通す|とおし|とおす$$,
    ARRAY['通す']::text[],
    ARRAY['通す', '通した', '通しました', '通したい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-150', $$彼は最後まで走り通した。$$, $$かれはさいごまではしりとおした。$$, $$Ele correu até o fim sem parar.$$),
    ('n3-grammar-150', $$昨日は一晩中働き通した。$$, $$きのうはひとばんじゅうはたらきとおした。$$, $$Ontem trabalhei a noite inteira sem parar.$$),
    ('n3-grammar-150', $$彼女は自分の意見を最後まで言い通した。$$, $$かのじょはじぶんのいけんをさいごまでいいとおした。$$, $$Ela manteve a própria opinião até o fim.$$),
    ('n3-grammar-150', $$この長い小説を一日で読み通した。$$, $$このながいしょうせつをいちにちでよみとおした。$$, $$Li este romance longo inteiro em um dia.$$),
    ('n3-grammar-150', $$一度決めたことは、最後までやり通したい。$$, $$いちどきめたことは、さいごまでやりとおしたい。$$, $$O que eu decidi fazer, quero levar até o fim.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大変だったが、最後までやり____。$$, $$Foi difícil, mas levei até o fim.$$),
        (2, $$彼はそのことについて、最後までうそをつき____。$$, $$Ele manteve a mentira sobre isso até o fim.$$),
        (3, $$十キロを休まずに歩き____。$$, $$Andei dez quilômetros sem parar até o fim.$$),
        (4, $$三日間、寝ないで働き____。$$, $$Trabalhei três dias seguidos sem dormir.$$),
        (5, $$一度始めたことは、やり____べきだ。$$, $$O que se começa deve ser levado até o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-150', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$通した$$),
        (1, $$通しました$$),
        (2, $$通した$$),
        (2, $$通しました$$),
        (3, $$通した$$),
        (3, $$通しました$$),
        (4, $$通した$$),
        (4, $$通しました$$),
        (5, $$通す$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-151 — 〜として
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-151',
    'grammar',
    'N3',
    $$〜として$$,
    $$to shite$$,
    $$Como / Na condição de / Na qualidade de$$,
    $$として é usado para indicar o papel, a função, a posição ou a qualidade em que alguém ou algo atua. Equivale a "como", "na condição de" ou "na qualidade de".

Por exemplo, "ele trabalha como médico", "vim ao Japão como estudante estrangeiro" ou "aprendo piano como hobby".

Com は, a forma としては indica um ponto de vista: 私としては significa "da minha parte" ou "do meu ponto de vista".

Antes de um substantivo, usa-se としての: リーダーとしての責任 (a responsabilidade como líder).

Com も, としても significa "também como" ou, em outro uso, "mesmo que".$$,
    $$Não confunda com とする (supor), que aparece em としたら e とすれば.

Em apresentações de trabalho, 〜として参加します ("participo como...") é muito comum.

A expressão 人として significa "como ser humano" e aparece em frases sobre ética e comportamento.$$,
    $$Substantivo (papel / função) + として + Verbo
Substantivo + としては + Opinião (do ponto de vista de)
Substantivo + としての + Substantivo
Substantivo + としても + … (também como)$$,
    $$として$$,
    $$として|としては|としても|としての$$,
    ARRAY['と', 'して']::text[],
    ARRAY['として', 'としては', 'としての', 'としても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-151', $$彼は医者として病院で働いている。$$, $$かれはいしゃとしてびょういんではたらいている。$$, $$Ele trabalha como médico no hospital.$$),
    ('n3-grammar-151', $$私は留学生として日本に来ました。$$, $$わたしはりゅうがくせいとしてにほんにきました。$$, $$Vim ao Japão como estudante estrangeiro.$$),
    ('n3-grammar-151', $$趣味として、ピアノを習っています。$$, $$しゅみとして、ピアノをならっています。$$, $$Estou aprendendo piano como hobby.$$),
    ('n3-grammar-151', $$私としては、この案に賛成です。$$, $$わたしとしては、このあんにさんせいです。$$, $$Da minha parte, concordo com esta proposta.$$),
    ('n3-grammar-151', $$彼はリーダーとしての責任を感じている。$$, $$かれはリーダーとしてのせきにんをかんじている。$$, $$Ele sente a responsabilidade de ser líder.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は通訳____会議に参加した。$$, $$Ela participou da reunião como intérprete.$$),
        (2, $$父は教師____三十年働いた。$$, $$Meu pai trabalhou trinta anos como professor.$$),
        (3, $$このお茶は、お土産____人気がある。$$, $$Este chá é popular como lembrancinha.$$),
        (4, $$私____は、その計画には反対です。$$, $$Da minha parte, sou contra esse plano.$$),
        (5, $$新入社員は、社会人____のマナーを学ぶ。$$, $$Os novos funcionários aprendem as boas maneiras de um profissional.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-151', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$として$$),
        (2, $$として$$),
        (3, $$として$$),
        (4, $$として$$),
        (5, $$として$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-152 — とても〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-152',
    'grammar',
    'N3',
    $$とても〜ない$$,
    $$totemo ~ nai$$,
    $$De jeito nenhum / Impossível / Não dá para$$,
    $$Quando とても aparece com uma forma negativa, especialmente com verbos potenciais, ele não significa "muito", e sim "de jeito nenhum" ou "é impossível". Equivale a "não dá para... de jeito nenhum".

A ideia é que algo está tão além da capacidade ou da realidade que não há a menor chance. Por exemplo, "tanto trabalho assim não dá para terminar em um dia, de jeito nenhum" ou "não consigo acreditar na história dele de jeito nenhum".

O verbo costuma estar na forma potencial negativa, como 終わらない, 解けない, 信じられない e 買えない. Também é comum com 無理だ (impossível).

Esse uso é diferente de とても no N5, que intensifica adjetivos em frases afirmativas.$$,
    $$O contexto é importante: とても大きい significa "muito grande", mas とても食べられない significa "não dá para comer de jeito nenhum".

Esse uso soa um pouco mais formal e expressivo que 全然〜ない.

É comum para recusar algo com educação, mostrando que é realmente impossível: そんな大役はとても務まりません.$$,
    $$とても + Verbo potencial negativo (できない / 買えない / 信じられない)
とても + 無理だ
とても + Verbo negativo (終わらない)$$,
    $$とても$$,
    $$とても$$,
    ARRAY['とても', 'ない']::text[],
    ARRAY['とても〜ない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-152', $$こんなにたくさんの仕事は、一日ではとても終わらない。$$, $$こんなにたくさんのしごとは、いちにちではとてもおわらない。$$, $$Tanto trabalho assim não dá para terminar em um dia, de jeito nenhum.$$),
    ('n3-grammar-152', $$この問題は難しくて、とても解けない。$$, $$このもんだいはむずかしくて、とてもとけない。$$, $$Esta questão é difícil demais, não consigo resolver de jeito nenhum.$$),
    ('n3-grammar-152', $$彼の話はとても信じられない。$$, $$かれのはなしはとてもしんじられない。$$, $$Não consigo acreditar na história dele de jeito nenhum.$$),
    ('n3-grammar-152', $$この値段では、とても買えません。$$, $$このねだんでは、とてもかえません。$$, $$Com esse preço, é impossível comprar.$$),
    ('n3-grammar-152', $$一人でこの荷物を運ぶのは、とても無理だ。$$, $$ひとりでこのにもつをはこぶのは、とてもむりだ。$$, $$Carregar esta bagagem sozinho é totalmente impossível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$こんなに高い車は、____買えない。$$, $$Um carro tão caro assim, não dá para comprar de jeito nenhum.$$),
        (2, $$この量は一人では____食べられない。$$, $$Esta quantidade, sozinho, é impossível de comer.$$),
        (3, $$あの正直な彼がうそをついたなんて、____思えない。$$, $$Não consigo imaginar de jeito nenhum que ele, tão honesto, tenha mentido.$$),
        (4, $$勉強していないから、こんな難しい試験には____合格できない。$$, $$Não estudei, então não tem como passar numa prova tão difícil.$$),
        (5, $$今日中に全部終わらせるのは____無理です。$$, $$Terminar tudo ainda hoje é totalmente impossível.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-152', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とても$$),
        (2, $$とても$$),
        (3, $$とても$$),
        (4, $$とても$$),
        (5, $$とても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-153 — 〜とは限らない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-153',
    'grammar',
    'N3',
    $$〜とは限らない$$,
    $$to wa kagiranai$$,
    $$Nem sempre / Não necessariamente / Não é garantido que$$,
    $$とは限らない é usado para dizer que algo não é sempre verdade, ou que existem exceções. Equivale a "nem sempre", "não necessariamente" ou "não é garantido que".

限る significa "limitar". A ideia literal é "não se limita a ser assim", ou seja, pode ser diferente.

É muito usado para corrigir generalizações ou ideias comuns, como "coisa cara nem sempre é boa" ou "nem todo japonês é bom em linguagem honorífica".

Para reforçar, a frase costuma ter palavras como いつも, 必ず, みんな ou 全部. Por exemplo, "a previsão do tempo nem sempre está certa".

Ele vem depois da forma simples completa. Com substantivos e adjetivos な, é comum usar だ antes.$$,
    $$とは限らない é uma forma suave e lógica de discordar de uma generalização, sem dizer que ela é totalmente falsa.

A forma ないとも限らない (N1) significa "não é impossível que..." e expressa um risco.

Em debates e redações, essa estrutura é muito útil para mostrar pensamento crítico.$$,
    $$Frase (forma simples) + とは限らない
Substantivo / Adjetivo な + (だ) + とは限らない
いつも / 必ず / みんな + … + とは限らない

Educado: とは限りません$$,
    $$とは限らない$$,
    $$とは限らない|とは限りません|とはかぎらない|とも限らない$$,
    ARRAY['とは', '限らない']::text[],
    ARRAY['とは限らない', 'とは限りません', 'とはかぎらない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-153', $$高い物がいい物とは限らない。$$, $$たかいものがいいものとはかぎらない。$$, $$Coisa cara nem sempre é coisa boa.$$),
    ('n3-grammar-153', $$日本人がみんな敬語が上手だとは限らない。$$, $$にほんじんがみんなけいごがじょうずだとはかぎらない。$$, $$Nem todo japonês é bom em linguagem honorífica.$$),
    ('n3-grammar-153', $$有名な店がおいしいとは限りません。$$, $$ゆうめいなみせがおいしいとはかぎりません。$$, $$Loja famosa não é necessariamente gostosa.$$),
    ('n3-grammar-153', $$お金持ちが幸せだとは限らない。$$, $$おかねもちがしあわせだとはかぎらない。$$, $$Ser rico não garante ser feliz.$$),
    ('n3-grammar-153', $$天気予報がいつも正しいとは限らない。$$, $$てんきよほうがいつもただしいとはかぎらない。$$, $$A previsão do tempo nem sempre está certa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生の言うことがいつも正しい____。$$, $$O que o professor diz nem sempre está certo.$$),
        (2, $$勉強すれば必ず合格する____。$$, $$Estudar não garante necessariamente a aprovação.$$),
        (3, $$安い物が悪い物だ____。$$, $$Coisa barata nem sempre é coisa ruim.$$),
        (4, $$外国人がみんな英語を話せる____。$$, $$Nem todo estrangeiro fala inglês.$$),
        (5, $$大人がいつも子供より賢い____。$$, $$Os adultos nem sempre são mais sábios que as crianças.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-153', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とは限らない$$),
        (1, $$とは限りません$$),
        (2, $$とは限らない$$),
        (2, $$とは限りません$$),
        (3, $$とは限らない$$),
        (3, $$とは限りません$$),
        (4, $$とは限らない$$),
        (4, $$とは限りません$$),
        (5, $$とは限らない$$),
        (5, $$とは限りません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-154 — つい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-154',
    'grammar',
    'N3',
    $$つい$$,
    $$tsui$$,
    $$Sem querer / Acabar fazendo / Por impulso$$,
    $$つい é um advérbio que indica que a pessoa fez algo sem querer, por impulso, mesmo sabendo que não deveria. Equivale a "sem querer", "acabar fazendo" ou "por impulso".

Ele quase sempre aparece junto com てしまう, que reforça a ideia de algo feito sem controle ou com arrependimento.

Por exemplo, "estava tão gostoso que acabei comendo demais" ou "estava barato e comprei por impulso".

É muito usado para hábitos que a pessoa tenta evitar, mas não consegue, como ficar acordado até tarde, gastar demais ou falar o que não devia.$$,
    $$つい também aparece em つい先日 ("outro dia mesmo") e つい今 ("agora há pouco"), com sentido de tempo bem recente. É um uso diferente.

つい é parecido com 思わず (sem pensar), mas つい destaca mais a falta de autocontrole ou o hábito.

É uma forma natural de se justificar com leveza: "acabei fazendo, não resisti".$$,
    $$つい + Verbo na forma て + しまう
つい + Verbo na forma て + しまった (passado)$$,
    $$つい$$,
    $$つい$$,
    ARRAY['つい']::text[],
    ARRAY['つい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-154', $$おいしくて、つい食べすぎてしまった。$$, $$おいしくて、ついたべすぎてしまった。$$, $$Estava tão gostoso que acabei comendo demais.$$),
    ('n3-grammar-154', $$つい本当のことを言ってしまった。$$, $$ついほんとうのことをいってしまった。$$, $$Sem querer, acabei dizendo a verdade.$$),
    ('n3-grammar-154', $$面白くて、つい夜遅くまでテレビを見てしまう。$$, $$おもしろくて、ついよるおそくまでテレビをみてしまう。$$, $$É tão interessante que acabo vendo TV até tarde da noite.$$),
    ('n3-grammar-154', $$安かったので、つい買ってしまった。$$, $$やすかったので、ついかってしまった。$$, $$Estava barato e acabei comprando por impulso.$$),
    ('n3-grammar-154', $$つい昔の癖が出てしまった。$$, $$ついむかしのくせがでてしまった。$$, $$Sem querer, voltei ao meu velho hábito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$疲れていて、電車で____寝てしまった。$$, $$Estava cansado e acabei dormindo no trem sem querer.$$),
        (2, $$腹が立って、____大きな声を出した。$$, $$Fiquei irritado e, sem querer, levantei a voz.$$),
        (3, $$ダイエット中なのに、____ケーキを食べてしまった。$$, $$Estou de dieta, mas acabei comendo bolo.$$),
        (4, $$友達との話が楽しくて、____時間を忘れてしまった。$$, $$A conversa com os amigos estava tão boa que acabei perdendo a noção do tempo.$$),
        (5, $$スマホを見ていて、____駅を乗り過ごしてしまった。$$, $$Estava olhando o celular e acabei passando da minha estação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-154', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つい$$),
        (2, $$つい$$),
        (3, $$つい$$),
        (4, $$つい$$),
        (5, $$つい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-155 — ついに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-155',
    'grammar',
    'N3',
    $$ついに$$,
    $$tsui ni$$,
    $$Finalmente / Afinal / Por fim$$,
    $$ついに é um advérbio que indica que algo finalmente aconteceu, depois de muito tempo, esforço ou de uma longa série de acontecimentos. Equivale a "finalmente", "afinal" ou "por fim".

O resultado pode ser positivo, como realizar um sonho depois de dez anos, ou negativo, como um computador velho que finalmente quebrou.

A diferença em relação a やっと é que やっと quase sempre expressa alívio por algo desejado. ついに é mais neutro e dramático, e pode ser usado tanto para coisas boas quanto ruins.

Também aparece em frases negativas, com o sentido de "no fim, nunca...": ついに来なかった (no fim, ele nunca veio).$$,
    $$Em notícias e anúncios, ついに aparece muito para lançamentos e conquistas: ついに発売!

Para resultados negativos, ついに é mais natural que やっと: ついに壊れた (finalmente quebrou).

ついに soa mais forte e solene que やっと, por isso é comum em histórias e narrativas.$$,
    $$ついに + Verbo no passado
ついに + Verbo negativo no passado (no fim, nunca...)

Escrita: ついに / 遂に$$,
    $$ついに$$,
    $$ついに|遂に$$,
    ARRAY['ついに']::text[],
    ARRAY['ついに', '遂に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-155', $$十年かかって、ついに夢がかなった。$$, $$じゅうねんかかって、ついにゆめがかなった。$$, $$Depois de dez anos, finalmente meu sonho se realizou.$$),
    ('n3-grammar-155', $$長い工事が終わって、ついに新しい駅ができた。$$, $$ながいこうじがおわって、ついにあたらしいえきができた。$$, $$A longa obra terminou e, finalmente, a nova estação ficou pronta.$$),
    ('n3-grammar-155', $$何度も失敗したが、ついに成功した。$$, $$なんどもしっぱいしたが、ついにせいこうした。$$, $$Fracassei muitas vezes, mas por fim consegui.$$),
    ('n3-grammar-155', $$不満が多かった彼は、ついに会社をやめてしまった。$$, $$ふまんがおおかったかれは、ついにかいしゃをやめてしまった。$$, $$Ele, que tinha muitas insatisfações, acabou saindo da empresa.$$),
    ('n3-grammar-155', $$待ちに待った夏休みが、ついに来た。$$, $$まちにまったなつやすみが、ついにきた。$$, $$As tão esperadas férias de verão finalmente chegaram.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$三回目の挑戦で、____試験に合格した。$$, $$Na terceira tentativa, finalmente passei na prova.$$),
        (2, $$十年使った古いパソコンが____壊れてしまった。$$, $$O computador velho que usei por dez anos finalmente quebrou.$$),
        (3, $$長い戦争が____終わった。$$, $$A longa guerra finalmente acabou.$$),
        (4, $$何年も探していた本が、____見つかった。$$, $$O livro que eu procurava havia anos finalmente foi encontrado.$$),
        (5, $$ずっと黙っていた彼女は、____本当のことを話してくれた。$$, $$Ela, que ficou calada o tempo todo, finalmente me contou a verdade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-155', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ついに$$),
        (1, $$遂に$$),
        (2, $$ついに$$),
        (2, $$遂に$$),
        (3, $$ついに$$),
        (3, $$遂に$$),
        (4, $$ついに$$),
        (4, $$遂に$$),
        (5, $$ついに$$),
        (5, $$遂に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-156 — 〜ついでに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-156',
    'grammar',
    'N3',
    $$〜ついでに$$,
    $$tsuide ni$$,
    $$Aproveitando que / De quebra / Já que vai$$,
    $$ついでに é usado para dizer que, aproveitando uma ação principal, a pessoa faz outra coisa a mais. Equivale a "aproveitando que", "de quebra" ou "já que vai...".

A ação principal vem antes de ついでに, e a ação extra vem depois. Por exemplo, "aproveitando que fui fazer compras, passei no correio" ou "já que vai à estação, coloca esta carta no correio?".

Ele vem depois de substantivos com の e de verbos na forma de dicionário ou た.

Sozinho, no meio da frase, ついでに significa "de quebra", "já que está nisso". É muito comum em pedidos casuais: "se for à loja, compra um chá pra mim também?".$$,
    $$ついでに é muito usado em pedidos entre amigos e família, deixando o pedido leve.

A ação extra é geralmente pequena e fácil de encaixar na principal.

A expressão お出かけのついでに ("aproveitando que vai sair") aparece em propagandas de lojas.$$,
    $$Substantivo + の + ついでに + Ação extra
Verbo (forma de dicionário / た) + ついでに + Ação extra
ついでに + Verbo (de quebra, já que está nisso)$$,
    $$ついでに$$,
    $$ついでに|ついで$$,
    ARRAY['ついで', 'に']::text[],
    ARRAY['ついでに', 'のついでに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-156', $$買い物のついでに、郵便局に寄った。$$, $$かいもののついでに、ゆうびんきょくによった。$$, $$Aproveitando que fui fazer compras, passei no correio.$$),
    ('n3-grammar-156', $$駅に行くついでに、この手紙を出してくれる？$$, $$えきにいくついでに、このてがみをだしてくれる？$$, $$Já que vai à estação, pode colocar esta carta no correio?$$),
    ('n3-grammar-156', $$東京に出張したついでに、友達に会った。$$, $$とうきょうにしゅっちょうしたついでに、ともだちにあった。$$, $$Aproveitando a viagem de trabalho a Tóquio, encontrei um amigo.$$),
    ('n3-grammar-156', $$掃除のついでに、窓も拭いた。$$, $$そうじのついでに、まどもふいた。$$, $$Aproveitando a faxina, limpei as janelas também.$$),
    ('n3-grammar-156', $$コンビニに行くなら、ついでにお茶を買ってきて。$$, $$コンビニにいくなら、ついでにおちゃをかってきて。$$, $$Se for à loja de conveniência, compra um chá para mim de quebra.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$散歩の____、パンを買ってきた。$$, $$Aproveitando a caminhada, comprei pão.$$),
        (2, $$図書館へ行く____、この本を返してください。$$, $$Já que vai à biblioteca, devolva este livro, por favor.$$),
        (3, $$京都に行った____、奈良にも寄った。$$, $$Aproveitando que fui a Kyoto, passei também em Nara.$$),
        (4, $$お茶を入れる____、私の分もお願い。$$, $$Já que vai fazer chá, faz o meu também, por favor.$$),
        (5, $$銀行に行った____、買い物もした。$$, $$Aproveitando que fui ao banco, fiz compras também.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-156', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ついでに$$),
        (2, $$ついでに$$),
        (3, $$ついでに$$),
        (4, $$ついでに$$),
        (5, $$ついでに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-157 — つまり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-157',
    'grammar',
    'N3',
    $$つまり$$,
    $$tsumari$$,
    $$Ou seja / Quer dizer / Em resumo$$,
    $$つまり é usado para resumir, explicar com outras palavras ou tirar uma conclusão. Equivale a "ou seja", "quer dizer" ou "em resumo".

Ele tem três usos principais:
• Explicar quem ou o que é algo: "ele é o irmão mais velho da minha mãe, ou seja, meu tio".
• Tirar uma conclusão: "ele não respondeu. Quer dizer, ele é contra".
• Pedir que alguém vá direto ao ponto: "afinal, o que você quer dizer?".

つまり tem o mesmo sentido de すなわち, mas é muito mais comum na conversa do dia a dia. すなわち soa formal e literário.

Muitas vezes, a frase com つまり termina com ということだ, reforçando a ideia de conclusão.$$,
    $$Em perguntas, つまり pode soar impaciente se o tom for forte, como se a pessoa quisesse que o outro fosse logo ao ponto.

つまり é muito usado em explicações, aulas e apresentações para resumir uma ideia.

Na fala, também aparece つまりさ ou つまりね, de forma casual.$$,
    $$A、 + つまり + B (A, ou seja, B)
Frase 1 (com ponto final) + つまり、 + Conclusão + ということだ
つまり、 + Pergunta (afinal...?)$$,
    $$つまり$$,
    $$つまり$$,
    ARRAY['つまり']::text[],
    ARRAY['つまり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-157', $$彼は母の兄、つまり私のおじです。$$, $$かれはははのあに、つまりわたしのおじです。$$, $$Ele é o irmão mais velho da minha mãe, ou seja, meu tio.$$),
    ('n3-grammar-157', $$明日は祝日、つまり会議はないということだ。$$, $$あしたはしゅくじつ、つまりかいぎはないということだ。$$, $$Amanhã é feriado, ou seja, não vai ter reunião.$$),
    ('n3-grammar-157', $$話が長いね。つまり、何が言いたいの？$$, $$はなしがながいね。つまり、なにがいいたいの？$$, $$Que conversa longa. Afinal, o que você quer dizer?$$),
    ('n3-grammar-157', $$彼は返事をしなかった。つまり、反対ということだ。$$, $$かれはへんじをしなかった。つまり、はんたいということだ。$$, $$Ele não respondeu. Quer dizer, ele é contra.$$),
    ('n3-grammar-157', $$一週間の休み、つまり七日間の旅行だ。$$, $$いっしゅうかんのやすみ、つまりなのかかんのりょこうだ。$$, $$Uma semana de folga, ou seja, uma viagem de sete dias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父の妹、____私のおばは東京に住んでいる。$$, $$A irmã mais nova do meu pai, ou seja, minha tia, mora em Tóquio.$$),
        (2, $$彼は来なかった。____、約束を忘れたということだ。$$, $$Ele não veio. Quer dizer, esqueceu o compromisso.$$),
        (3, $$____、あなたは反対なんですか。$$, $$Então, em resumo, você é contra?$$),
        (4, $$締め切りは今月三十日まで、____あと五日しかない。$$, $$O prazo vai até o dia 30 deste mês, ou seja, só faltam cinco dias.$$),
        (5, $$彼女は母の母、____私の祖母です。$$, $$Ela é a mãe da minha mãe, ou seja, minha avó.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-157', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つまり$$),
        (2, $$つまり$$),
        (3, $$つまり$$),
        (4, $$つまり$$),
        (5, $$つまり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-158 — 〜つもりだった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-158',
    'grammar',
    'N3',
    $$〜つもりだった$$,
    $$tsumori datta$$,
    $$Pretendia / Tinha a intenção de / Achava que tinha$$,
    $$つもりだった é o passado de つもり e tem dois usos principais.

O primeiro é falar de uma intenção que não se realizou: "eu pretendia..., mas...". Por exemplo, "ontem eu pretendia dormir cedo, mas acabei ficando acordado até tarde". Muitas vezes vem seguido de が, けど ou のに.

O segundo é dizer que a pessoa achava que tinha feito algo, mas na realidade não fez, ou fez errado. Nesse caso, usa-se o verbo na forma た antes de つもりだった: "eu achava que tinha trancado a porta, mas estava aberta".

Com substantivos e の, つもりだった mostra que a intenção era uma, mas o efeito foi outro: "era para ser uma brincadeira, mas ela ficou brava".$$,
    $$たつもり, sem だった, também significa "fazer de conta" ou "imaginar que fez", como em 旅行したつもりで貯金する.

つもりだった é muito útil para se justificar com educação quando algo deu errado.

No uso de "achava que tinha feito", a frase mostra um engano ou esquecimento.$$,
    $$Verbo na forma de dicionário + つもりだった + が / のに (pretendia, mas)
Verbo na forma た + つもりだった + が (achava que tinha feito)
Substantivo + の + つもりだった (era para ser...)

Educado: つもりでした$$,
    $$つもりだった$$,
    $$つもりだった|つもりでした$$,
    ARRAY['つもり', 'だった']::text[],
    ARRAY['つもりだった', 'つもりでした', 'たつもりだった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-158', $$昨日は早く寝るつもりだったが、遅くなってしまった。$$, $$きのうははやくねるつもりだったが、おそくなってしまった。$$, $$Ontem eu pretendia dormir cedo, mas acabei ficando acordado até tarde.$$),
    ('n3-grammar-158', $$今日は勉強するつもりだったのに、一日中寝てしまった。$$, $$きょうはべんきょうするつもりだったのに、いちにちじゅうねてしまった。$$, $$Hoje eu pretendia estudar, mas acabei dormindo o dia inteiro.$$),
    ('n3-grammar-158', $$電話するつもりでしたが、忘れてしまいました。$$, $$でんわするつもりでしたが、わすれてしまいました。$$, $$Eu tinha a intenção de ligar, mas acabei esquecendo.$$),
    ('n3-grammar-158', $$冗談のつもりだったが、彼女を怒らせてしまった。$$, $$じょうだんのつもりだったが、かのじょをおこらせてしまった。$$, $$Era para ser uma brincadeira, mas acabei deixando ela brava.$$),
    ('n3-grammar-158', $$鍵をかけたつもりだったが、開いていた。$$, $$かぎをかけたつもりだったが、あいていた。$$, $$Eu achava que tinha trancado, mas estava aberto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$週末は旅行に行く____が、雨で中止になった。$$, $$Eu pretendia viajar no fim de semana, mas foi cancelado por causa da chuva.$$),
        (2, $$引っ越しを手伝う____のに、寝坊してしまった。$$, $$Eu pretendia ajudar na mudança, mas acabei dormindo demais.$$),
        (3, $$親切の____が、迷惑だったようだ。$$, $$Era para ser uma gentileza, mas parece que foi um incômodo.$$),
        (4, $$早く起きる____が、起きられなかった。$$, $$Eu pretendia acordar cedo, mas não consegui.$$),
        (5, $$窓を閉めた____が、開いていた。$$, $$Achava que tinha fechado a janela, mas estava aberta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-158', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つもりだった$$),
        (1, $$つもりでした$$),
        (2, $$つもりだった$$),
        (3, $$つもりだった$$),
        (4, $$つもりでした$$),
        (4, $$つもりだった$$),
        (5, $$つもりだった$$),
        (5, $$つもりでした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-159 — 〜つもりで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-159',
    'grammar',
    'N3',
    $$〜つもりで$$,
    $$tsumori de$$,
    $$Como se / Com a ideia de / Fazendo de conta que$$,
    $$つもりで é usado para dizer que alguém faz algo imaginando estar em certa situação, ou com uma certa disposição mental. Equivale a "como se", "com a ideia de" ou "fazendo de conta que".

Com o verbo na forma た, a ideia é imaginar que algo já aconteceu. Por exemplo, "fazendo de conta que viajei, guardei o dinheiro" ou "explique como se você fosse o professor".

Com substantivos e の, a ideia é encarar algo com certa atitude: "faça este exercício como se fosse uma prova de verdade".

Com o verbo na forma de dicionário, indica uma disposição forte: "esforçando-se como se fosse morrer" (ou seja, dando tudo de si).

É muito usado em conselhos e incentivos.$$,
    $$A expressão 自分の家にいるつもりで ("como se estivesse em casa") é uma forma gentil de deixar a visita à vontade.

本番のつもりで ("como se fosse pra valer") é comum em treinos e ensaios.

Não confunda com つもりだった, que indica uma intenção passada que não se realizou.$$,
    $$Verbo na forma た + つもりで + Verbo (imaginando que já...)
Verbo na forma de dicionário + つもりで + Verbo (com a disposição de...)
Substantivo + の + つもりで + Verbo (encarando como...)$$,
    $$つもりで$$,
    $$つもりで$$,
    ARRAY['つもり', 'で']::text[],
    ARRAY['つもりで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-159', $$旅行に行ったつもりで、そのお金を貯金した。$$, $$りょこうにいったつもりで、そのおかねをちょきんした。$$, $$Fazendo de conta que tinha viajado, guardei esse dinheiro.$$),
    ('n3-grammar-159', $$死ぬつもりで頑張れば、何でもできる。$$, $$しぬつもりでがんばれば、なんでもできる。$$, $$Se você se esforçar dando tudo de si, consegue qualquer coisa.$$),
    ('n3-grammar-159', $$先生になったつもりで、説明してみてください。$$, $$せんせいになったつもりで、せつめいしてみてください。$$, $$Tente explicar como se você fosse o professor.$$),
    ('n3-grammar-159', $$遊びに行くつもりで、気軽に来てください。$$, $$あそびにいくつもりで、きがるにきてください。$$, $$Venha à vontade, como se fosse um passeio.$$),
    ('n3-grammar-159', $$試験のつもりで、この問題を解いてください。$$, $$しけんのつもりで、このもんだいをといてください。$$, $$Resolva estas questões como se fosse uma prova.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$本番の____、練習しましょう。$$, $$Vamos treinar como se fosse pra valer.$$),
        (2, $$外国人と話す____、日本語で話してみよう。$$, $$Vamos tentar falar em japonês como se estivéssemos conversando com um estrangeiro.$$),
        (3, $$その服を買ったつもり____、そのお金を貯金した。$$, $$Fazendo de conta que tinha comprado a roupa, guardei o dinheiro.$$),
        (4, $$自分の家にいる____、ゆっくりしてください。$$, $$Fique à vontade, como se estivesse em casa.$$),
        (5, $$社長になった____、この問題を考えてみてください。$$, $$Tente pensar neste problema como se você fosse o presidente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-159', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つもりで$$),
        (2, $$つもりで$$),
        (3, $$で$$),
        (4, $$つもりで$$),
        (5, $$つもりで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-160 — 〜うちに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-160',
    'grammar',
    'N3',
    $$〜うちに$$,
    $$uchi ni$$,
    $$Enquanto / Antes que / No decorrer de$$,
    $$うちに tem dois usos principais.

O primeiro é "enquanto ainda": fazer algo aproveitando que uma situação ainda existe, antes que ela mude. Por exemplo, "enquanto é jovem, é bom ter várias experiências" ou "coma enquanto está quente". Com a forma ない, ないうちに significa "antes que": "vamos voltar antes que escureça".

O segundo é "no decorrer de": enquanto uma ação continua, uma mudança acontece naturalmente, sem a pessoa perceber. Por exemplo, "conversando com ele, acabei gostando dele" ou "lendo, acabei dormindo".

No primeiro uso, うちに vem depois de adjetivos, de verbos de estado (いる) e da forma ない. No segundo, vem depois de verbos na forma ている.$$,
    $$Comparado a 間に, うちに destaca mais a ideia de "aproveitar enquanto dá", com a ideia de que a situação vai mudar.

A expressão 熱いうちにどうぞ ("coma enquanto está quente") é muito comum ao servir comida.

No segundo uso, a mudança na segunda parte costuma ser algo que aconteceu sem a pessoa planejar.$$,
    $$Adjetivo い + うちに (enquanto ainda está...)
Adjetivo な + な + うちに
Substantivo + の + うちに
Verbo de estado (いる / ある) + うちに
Verbo na forma ない + うちに (antes que)
Verbo na forma ている + うちに + Mudança (no decorrer de)

Escrita: うちに / 内に$$,
    $$うちに$$,
    $$うちに|内に$$,
    ARRAY['うち', 'に']::text[],
    ARRAY['うちに', 'ないうちに', 'ているうちに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-160', $$若いうちに、いろいろな経験をしたほうがいい。$$, $$わかいうちに、いろいろなけいけんをしたほうがいい。$$, $$Enquanto é jovem, é bom ter várias experiências.$$),
    ('n3-grammar-160', $$どうぞ、熱いうちに食べてください。$$, $$どうぞ、あついうちにたべてください。$$, $$Por favor, coma enquanto está quente.$$),
    ('n3-grammar-160', $$暗くならないうちに、帰りましょう。$$, $$くらくならないうちに、かえりましょう。$$, $$Vamos voltar antes que escureça.$$),
    ('n3-grammar-160', $$話しているうちに、彼のことが好きになった。$$, $$はなしているうちに、かれのことがすきになった。$$, $$No decorrer das conversas, acabei gostando dele.$$),
    ('n3-grammar-160', $$日本にいるうちに、富士山に登りたい。$$, $$にほんにいるうちに、ふじさんにのぼりたい。$$, $$Enquanto estiver no Japão, quero subir o Monte Fuji.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$元気な____、旅行に行きたい。$$, $$Quero viajar enquanto ainda tenho saúde.$$),
        (2, $$雨が降らない____、洗濯物を取り込もう。$$, $$Vamos recolher a roupa antes que chova.$$),
        (3, $$本を読んでいる____、寝てしまった。$$, $$Enquanto lia o livro, acabei dormindo.$$),
        (4, $$冷めない____、どうぞ。$$, $$Coma antes que esfrie, por favor.$$),
        (5, $$忘れない____、メモしておこう。$$, $$Vou anotar antes que eu esqueça.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-160', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$うちに$$),
        (2, $$うちに$$),
        (3, $$うちに$$),
        (4, $$うちに$$),
        (5, $$うちに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-161 — 〜上で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-161',
    'grammar',
    'N3',
    $$〜上で$$,
    $$ue de$$,
    $$Depois de / Após / Para (fazer) / Em$$,
    $$上で tem dois usos principais.

O primeiro, com o verbo na forma た ou com substantivo + の, significa "depois de" ou "após": primeiro se faz uma coisa com cuidado, e depois, com base nela, se faz outra. Por exemplo, "decida depois de pensar bem" ou "responderei depois de conversar com meus pais". O tom é formal e sério.

O segundo, com o verbo na forma de dicionário, significa "para" ou "em": indica uma área ou atividade em que algo é importante ou necessário. Por exemplo, "para viver no Japão, o japonês é importante" ou "no trabalho, o mais importante é a confiança".

Com o, a forma 上での vem antes de um substantivo: 仕事上での注意 (cuidados no trabalho).$$,
    $$No primeiro uso, 上で destaca que a primeira ação é uma preparação necessária para a segunda.

Em contratos e formulários, よく読んだ上で ("depois de ler com atenção") é muito comum.

Não confunda com 上に (além disso), que soma informações.$$,
    $$Verbo na forma た + 上で、 + Ação seguinte (depois de)
Substantivo + の + 上で、 + Ação seguinte
Verbo na forma de dicionário + 上で、 + Algo importante / necessário (para / em)

Escrita: 上で / うえで$$,
    $$上で$$,
    $$上で|うえで|上での$$,
    ARRAY['上', 'で']::text[],
    ARRAY['上で', 'うえで', '上での']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-161', $$よく考えた上で、決めてください。$$, $$よくかんがえたうえで、きめてください。$$, $$Decida depois de pensar bem.$$),
    ('n3-grammar-161', $$両親と相談した上で、返事をします。$$, $$りょうしんとそうだんしたうえで、へんじをします。$$, $$Vou responder depois de conversar com meus pais.$$),
    ('n3-grammar-161', $$説明を聞いた上で、申し込んでください。$$, $$せつめいをきいたうえで、もうしこんでください。$$, $$Inscreva-se depois de ouvir a explicação.$$),
    ('n3-grammar-161', $$日本で生活する上で、日本語は大切だ。$$, $$にほんでせいかつするうえで、にほんごはたいせつだ。$$, $$Para viver no Japão, o japonês é importante.$$),
    ('n3-grammar-161', $$仕事をする上で、一番大切なのは信頼です。$$, $$しごとをするうえで、いちばんたいせつなのはしんらいです。$$, $$No trabalho, o mais importante é a confiança.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$契約書の内容を確認した____、サインしてください。$$, $$Assine depois de conferir o conteúdo do contrato.$$),
        (2, $$家族と話し合った____、留学を決めた。$$, $$Decidi fazer intercâmbio depois de conversar com a família.$$),
        (3, $$外国語を学ぶ____、毎日の練習が必要だ。$$, $$Para aprender uma língua estrangeira, é preciso praticar todo dia.$$),
        (4, $$実物を見た____、買うかどうか決めます。$$, $$Vou decidir se compro depois de ver o produto pessoalmente.$$),
        (5, $$健康に生活する____、睡眠は大切だ。$$, $$Para viver com saúde, o sono é importante.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-161', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$上で$$),
        (2, $$上で$$),
        (3, $$上で$$),
        (4, $$上で$$),
        (5, $$上で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-162 — 〜上に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-162',
    'grammar',
    'N3',
    $$〜上に$$,
    $$ue ni$$,
    $$Além de / E ainda por cima / Não só... como também$$,
    $$上に é usado para acrescentar uma informação a outra, indicando que as duas coisas se somam. Equivale a "além de", "e ainda por cima" ou "não só... como também".

As duas partes costumam ter o mesmo tom: duas coisas boas ("é barato e, além disso, gostoso") ou duas coisas ruins ("me perdi e, ainda por cima, perdi a carteira").

Ele vem depois da forma simples de verbos e adjetivos. Com adjetivos な, usa-se な, e com substantivos, である ou の.

A segunda parte costuma ter も, reforçando a ideia de acúmulo.

Comparado a し, que também lista razões, 上に destaca que a segunda informação vem como algo a mais, intensificando a situação.$$,
    $$Não misture tons diferentes: uma qualidade boa e uma ruim não combinam com 上に. Para contraste, use が ou けど.

Em reclamações, 上に aparece muito para dizer que tudo deu errado ao mesmo tempo.

Não confunda com 上で (depois de / para), que tem outro sentido.$$,
    $$Verbo / Adjetivo い (forma simples) + 上に、 + … + も
Adjetivo な + な + 上に
Substantivo + である / の + 上に

Escrita: 上に / うえに$$,
    $$上に$$,
    $$上に|うえに$$,
    ARRAY['上', 'に']::text[],
    ARRAY['上に', 'うえに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-162', $$この店は安い上に、おいしい。$$, $$このみせはやすいうえに、おいしい。$$, $$Esta loja é barata e, além disso, gostosa.$$),
    ('n3-grammar-162', $$彼は頭がいい上に、スポーツも得意だ。$$, $$かれはあたまがいいうえに、スポーツもとくいだ。$$, $$Ele é inteligente e, além disso, bom em esportes.$$),
    ('n3-grammar-162', $$雨が降っている上に、風も強い。$$, $$あめがふっているうえに、かぜもつよい。$$, $$Está chovendo e, ainda por cima, ventando forte.$$),
    ('n3-grammar-162', $$旅行先で道に迷った上に、財布もなくした。$$, $$りょこうさきでみちにまよったうえに、さいふもなくした。$$, $$Na viagem, me perdi e, ainda por cima, perdi a carteira.$$),
    ('n3-grammar-162', $$彼女は親切な上に、とても優しい。$$, $$かのじょはしんせつなうえに、とてもやさしい。$$, $$Ela é atenciosa e, além disso, muito gentil.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋は広い____、駅から近い。$$, $$Este apartamento é amplo e, além disso, perto da estação.$$),
        (2, $$今朝は寝坊した____、電車も遅れた。$$, $$Hoje de manhã dormi demais e, ainda por cima, o trem atrasou.$$),
        (3, $$彼は背が高い____、ハンサムだ。$$, $$Ele é alto e, além disso, bonito.$$),
        (4, $$この仕事は大変な____、給料も安い。$$, $$Este trabalho é pesado e, ainda por cima, paga mal.$$),
        (5, $$熱がある____、頭も痛い。$$, $$Estou com febre e, ainda por cima, com dor de cabeça.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-162', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$上に$$),
        (1, $$うえに$$),
        (2, $$上に$$),
        (2, $$うえに$$),
        (3, $$上に$$),
        (3, $$うえに$$),
        (4, $$上に$$),
        (4, $$うえに$$),
        (5, $$上に$$),
        (5, $$うえに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-163 — 〜は別として
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-163',
    'grammar',
    'N3',
    $$〜は別として$$,
    $$wa betsu to shite$$,
    $$Deixando de lado / Sem contar / Independentemente de$$,
    $$は別として é usado para deixar de lado um aspecto da questão, para focar em outro. Equivale a "deixando de lado", "sem contar" ou "independentemente de".

A primeira parte indica o que não vai ser considerado agora (o preço, o resultado, os gostos pessoais). A segunda parte traz o ponto principal. Por exemplo, "deixando o preço de lado, o design é bom" ou "independentemente do resultado, você se esforçou muito".

Também é comum com かどうか ou palavras interrogativas: "se ele vem ou não, à parte, vamos nos preparar".

A forma は別にして tem o mesmo sentido.$$,
    $$は別として é parecido com はともかく (N2), que também deixa algo de lado. はともかく soa um pouco mais casual.

Com pessoas, 〜は別として significa "exceto fulano": 専門家は別として ("a não ser os especialistas").

É útil para avaliar algo de forma justa, separando os aspectos.$$,
    $$Substantivo + は別として、 + Ponto principal
Frase + かどうか + は別として、 + …
Palavra interrogativa + … + か + は別として

Variação: は別にして$$,
    $$は別として$$,
    $$は別として|は別にして|はべつとして$$,
    ARRAY['は', '別', 'として']::text[],
    ARRAY['は別として', 'は別にして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-163', $$値段は別として、このデザインはいい。$$, $$ねだんはべつとして、このデザインはいい。$$, $$Deixando o preço de lado, este design é bom.$$),
    ('n3-grammar-163', $$結果は別として、よく頑張った。$$, $$けっかはべつとして、よくがんばった。$$, $$Independentemente do resultado, você se esforçou muito.$$),
    ('n3-grammar-163', $$好き嫌いは別として、栄養のために食べなさい。$$, $$すききらいはべつとして、えいようのためにたべなさい。$$, $$Gostando ou não, coma pela nutrição.$$),
    ('n3-grammar-163', $$冗談は別として、本当にありがとう。$$, $$じょうだんはべつとして、ほんとうにありがとう。$$, $$Brincadeiras à parte, muito obrigado mesmo.$$),
    ('n3-grammar-163', $$彼が来るかどうかは別として、準備をしておこう。$$, $$かれがくるかどうかはべつとして、じゅんびをしておこう。$$, $$Se ele vem ou não, à parte, vamos deixar tudo preparado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$味____、この店は雰囲気がいい。$$, $$Deixando o sabor de lado, esta loja tem um ambiente bom.$$),
        (2, $$勝ち負け____、楽しい試合だった。$$, $$Ganhando ou perdendo, foi uma partida divertida.$$),
        (3, $$上手か下手か____、彼はいつも楽しそうに歌う。$$, $$Bem ou mal, ele sempre canta parecendo se divertir.$$),
        (4, $$費用____、まず旅行の計画を立てよう。$$, $$Deixando os custos de lado, vamos primeiro planejar a viagem.$$),
        (5, $$専門家____、一般の人には難しい内容だ。$$, $$A não ser os especialistas, é um conteúdo difícil para o público em geral.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-163', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$は別として$$),
        (1, $$は別にして$$),
        (2, $$は別として$$),
        (2, $$は別にして$$),
        (3, $$は別として$$),
        (3, $$は別にして$$),
        (4, $$は別として$$),
        (4, $$は別にして$$),
        (5, $$は別として$$),
        (5, $$は別にして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-164 — 〜はもちろん
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-164',
    'grammar',
    'N3',
    $$〜はもちろん$$,
    $$wa mochiron$$,
    $$Não só... mas também / Sem falar em / Claro que... e também$$,
    $$はもちろん é usado para dizer que algo é óbvio e, além disso, outra coisa também é verdade. Equivale a "não só... mas também", "sem falar em" ou "claro que..., e também...".

A primeira parte apresenta o caso mais óbvio ou esperado, e a segunda acrescenta outro caso, geralmente com も. Por exemplo, "ele fala inglês, claro, e também chinês" ou "a loja fica cheia não só nos dias úteis, mas também nos fins de semana".

Em frases negativas, a ideia se inverte: "kanji, nem se fala; ele não sabe escrever nem hiragana".

もちろん significa "é claro", "obviamente". Por isso, a estrutura destaca que o primeiro elemento é evidente.$$,
    $$はもちろん é parecido com はもとより (N2), que é mais formal.

A ordem é importante: o elemento mais óbvio vem primeiro, e o menos óbvio, depois.

É muito comum em propagandas: "não só para crianças, mas também para adultos".$$,
    $$A + はもちろん、 + B + も + …
A + はもちろん、 + B + も + Negativo (A nem se fala, nem B...)$$,
    $$はもちろん$$,
    $$はもちろん$$,
    ARRAY['は', 'もちろん']::text[],
    ARRAY['はもちろん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-164', $$彼は英語はもちろん、中国語も話せる。$$, $$かれはえいごはもちろん、ちゅうごくごもはなせる。$$, $$Ele fala inglês, é claro, e também chinês.$$),
    ('n3-grammar-164', $$この店は平日はもちろん、週末も混んでいる。$$, $$このみせはへいじつはもちろん、しゅうまつもこんでいる。$$, $$Esta loja fica cheia não só nos dias úteis, mas também nos fins de semana.$$),
    ('n3-grammar-164', $$子供はもちろん、大人も楽しめる映画だ。$$, $$こどもはもちろん、おとなもたのしめるえいがだ。$$, $$É um filme que não só crianças, mas também adultos podem aproveitar.$$),
    ('n3-grammar-164', $$彼は漢字はもちろん、ひらがなも書けない。$$, $$かれはかんじはもちろん、ひらがなもかけない。$$, $$Kanji, nem se fala; ele não sabe escrever nem hiragana.$$),
    ('n3-grammar-164', $$このお菓子は東京はもちろん、地方でも人気がある。$$, $$このおかしはとうきょうはもちろん、ちほうでもにんきがある。$$, $$Este doce é popular não só em Tóquio, mas também no interior.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は料理____、掃除も得意だ。$$, $$Ela é boa não só em cozinhar, mas também em limpar.$$),
        (2, $$この歌は日本____、海外でも有名だ。$$, $$Esta música é famosa não só no Japão, mas também no exterior.$$),
        (3, $$去年は夏休み____、冬休みも働いた。$$, $$No ano passado, trabalhei não só nas férias de verão, mas também nas de inverno.$$),
        (4, $$彼は日本語____、英語も話せない。$$, $$Japonês, nem se fala; ele não fala nem inglês.$$),
        (5, $$イベントには学生____、先生も参加した。$$, $$Não só os alunos, mas também os professores participaram do evento.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-164', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はもちろん$$),
        (2, $$はもちろん$$),
        (3, $$はもちろん$$),
        (4, $$はもちろん$$),
        (5, $$はもちろん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-165 — 〜は〜で有名
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-165',
    'grammar',
    'N3',
    $$〜は〜で有名$$,
    $$wa ~ de yuumei$$,
    $$Ser famoso por / Ser conhecido por$$,
    $$は〜で有名 é usado para dizer pelo que um lugar, uma pessoa ou uma coisa é famoso. Equivale a "ser famoso por" ou "ser conhecido por".

O tema vem com は, e o motivo da fama vem com で, antes de 有名. Por exemplo, "Kyoto é famosa pelos templos" ou "esta cidade é conhecida pelas fontes termais".

Para dizer que é famoso por uma ação ou característica, usa-se こと + で: "ele é famoso por cantar bem".

Antes de um substantivo, usa-se で有名な: ケーキで有名な店 (uma loja famosa pelos bolos).

A partícula で aqui indica o motivo ou a razão da fama.$$,
    $$Para "famoso entre" um grupo de pessoas, usa-se に: 若者に有名だ (famoso entre os jovens).

Também se usa として有名 para "famoso como": 観光地として有名だ.

É uma estrutura muito útil para apresentar cidades e pontos turísticos.$$,
    $$Lugar / Pessoa / Coisa + は + Substantivo + で有名だ / です
Frase + こと + で有名だ
Substantivo + で有名な + Substantivo$$,
    $$で有名$$,
    $$で有名|でゆうめい$$,
    ARRAY['は', 'で', '有名']::text[],
    ARRAY['で有名', 'で有名だ', 'で有名な']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-165', $$京都はお寺で有名です。$$, $$きょうとはおてらでゆうめいです。$$, $$Kyoto é famosa pelos templos.$$),
    ('n3-grammar-165', $$この町は温泉で有名だ。$$, $$このまちはおんせんでゆうめいだ。$$, $$Esta cidade é conhecida pelas fontes termais.$$),
    ('n3-grammar-165', $$北海道はラーメンで有名です。$$, $$ほっかいどうはラーメンでゆうめいです。$$, $$Hokkaido é famosa pelo ramen.$$),
    ('n3-grammar-165', $$ここはケーキで有名な店です。$$, $$ここはケーキでゆうめいなみせです。$$, $$Aqui é uma loja famosa pelos bolos.$$),
    ('n3-grammar-165', $$彼は歌がうまいことで有名だ。$$, $$かれはうたがうまいことでゆうめいだ。$$, $$Ele é famoso por cantar bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$静岡はお茶____です。$$, $$Shizuoka é famosa pelo chá.$$),
        (2, $$この村は桜____な場所だ。$$, $$Esta vila é um lugar famoso pelas cerejeiras.$$),
        (3, $$奈良は鹿____です。$$, $$Nara é famosa pelos cervos.$$),
        (4, $$この店は安いこと____だ。$$, $$Esta loja é conhecida por ser barata.$$),
        (5, $$ブラジルはサッカー____です。$$, $$O Brasil é famoso pelo futebol.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-165', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$で有名$$),
        (2, $$で有名$$),
        (3, $$で有名$$),
        (4, $$で有名$$),
        (5, $$で有名$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-166 — 〜わけだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-166',
    'grammar',
    'N3',
    $$〜わけだ$$,
    $$wake da$$,
    $$Não é à toa que / Então é por isso que / Ou seja$$,
    $$わけだ é usado para mostrar que algo faz sentido, como uma conclusão lógica a partir de um fato. Equivale a "não é à toa que", "então é por isso que" ou "ou seja".

Ele tem dois usos principais. O primeiro é entender o motivo de algo depois de descobrir um fato: "ele morou dez anos no Japão? Não é à toa que fala tão bem japonês". O tom é de "ah, agora entendi".

O segundo é tirar uma conclusão lógica ou matemática a partir de dados: "estudando três horas por dia, são vinte e uma horas por semana".

わけ significa "motivo" ou "razão". Ele vem depois da forma simples de verbos e adjetivos, de adjetivos な com な, e de substantivos com の ou という.$$,
    $$Expressões como どうりで e なるほど combinam muito com わけだ: どうりで寒いわけだ ("não é à toa que está frio").

Na conversa, わけだ mostra que a pessoa entendeu a situação.

わけ também aparece em outras gramáticas importantes, como わけではない, わけがない e わけにはいかない.$$,
    $$Verbo / Adjetivo い (forma simples) + わけだ
Adjetivo な + な + わけだ
Substantivo + の / という + わけだ

Educado: わけです
Escrita: わけ / 訳$$,
    $$わけだ$$,
    $$わけだ|わけです|訳だ$$,
    ARRAY['わけ', 'だ']::text[],
    ARRAY['わけだ', 'わけです', '訳だ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-166', $$彼は十年日本に住んでいたのか。日本語が上手なわけだ。$$, $$かれはじゅうねんにほんにすんでいたのか。にほんごがじょうずなわけだ。$$, $$Ele morou dez anos no Japão? Não é à toa que fala tão bem japonês.$$),
    ('n3-grammar-166', $$窓が開いている。寒いわけだ。$$, $$まどがあいている。さむいわけだ。$$, $$A janela está aberta. Então é por isso que está frio.$$),
    ('n3-grammar-166', $$毎日練習しているから、上手になるわけだ。$$, $$まいにちれんしゅうしているから、じょうずになるわけだ。$$, $$Treina todo dia, então é natural que melhore.$$),
    ('n3-grammar-166', $$一日に三時間勉強すれば、一週間で二十一時間勉強するわけです。$$, $$いちにちにさんじかんべんきょうすれば、いっしゅうかんでにじゅういちじかんべんきょうするわけです。$$, $$Estudando três horas por dia, ou seja, são vinte e uma horas por semana.$$),
    ('n3-grammar-166', $$つまり、明日は休みというわけだ。$$, $$つまり、あしたはやすみというわけだ。$$, $$Ou seja, amanhã é folga.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女はフランスに住んでいたのか。フランス語が上手な____。$$, $$Ela morou na França? Não é à toa que fala bem francês.$$),
        (2, $$エアコンがついていない。暑い____。$$, $$O ar-condicionado não está ligado. Então é por isso que está quente.$$),
        (3, $$彼は毎日走っている。体が強い____。$$, $$Ele corre todo dia. Não é à toa que é tão resistente.$$),
        (4, $$時給千円で八時間働けば、八千円もらえる____。$$, $$Ganhando mil ienes por hora e trabalhando oito horas, ou seja, recebe oito mil ienes.$$),
        (5, $$道が工事中だ。だから混んでいる____。$$, $$A rua está em obras. Então é por isso que está congestionada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-166', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わけだ$$),
        (1, $$わけです$$),
        (2, $$わけだ$$),
        (2, $$わけです$$),
        (3, $$わけだ$$),
        (3, $$わけです$$),
        (4, $$わけだ$$),
        (4, $$わけです$$),
        (5, $$わけだ$$),
        (5, $$わけです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-167 — 〜わけではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-167',
    'grammar',
    'N3',
    $$〜わけではない$$,
    $$wake de wa nai$$,
    $$Não é que / Não significa que / Não necessariamente$$,
    $$わけではない é usado para negar parcialmente uma ideia, corrigindo uma conclusão que o outro poderia tirar. Equivale a "não é que...", "não significa que..." ou "não necessariamente".

A ideia é: "não é exatamente assim". Por exemplo, "não é que eu não goste de carne, mas não como muito" ou "não é que eu cozinhe todos os dias".

Ela é muito útil para evitar mal-entendidos e para suavizar opiniões. Também é comum com palavras como いつも, みんな, 全部 e 必ず, negando uma generalização.

Ela vem depois da forma simples de verbos e adjetivos, de adjetivos な com な, e de substantivos com という ou の.

Na fala, わけではない costuma virar わけじゃない.$$,
    $$わけではない é diferente de わけがない. わけではない nega parcialmente ("não é que..."); わけがない nega totalmente ("não tem como").

É muito usada para recusar convites com delicadeza: 行きたくないわけではないけど….

Em debates, ajuda a mostrar que você não está dizendo algo extremo.$$,
    $$Verbo / Adjetivo い (forma simples) + わけではない
Adjetivo な + な + わけではない
Substantivo + という + わけではない
いつも / みんな / 全部 + … + わけではない (negação parcial)

Educado: わけではありません
Fala: わけじゃない$$,
    $$わけではない$$,
    $$わけではない|わけじゃない|わけではありません|訳ではない$$,
    ARRAY['わけ', 'では', 'ない']::text[],
    ARRAY['わけではない', 'わけじゃない', 'わけではありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-167', $$肉が嫌いなわけではないが、あまり食べない。$$, $$にくがきらいなわけではないが、あまりたべない。$$, $$Não é que eu não goste de carne, mas não como muito.$$),
    ('n3-grammar-167', $$毎日料理をするわけではない。$$, $$まいにちりょうりをするわけではない。$$, $$Não é que eu cozinhe todos os dias.$$),
    ('n3-grammar-167', $$高い物がいつもいいわけではない。$$, $$たかいものがいつもいいわけではない。$$, $$Coisa cara não é necessariamente sempre boa.$$),
    ('n3-grammar-167', $$彼のことが嫌いなわけじゃない。$$, $$かれのことがきらいなわけじゃない。$$, $$Não é que eu não goste dele.$$),
    ('n3-grammar-167', $$日本人がみんな寿司が好きなわけではありません。$$, $$にほんじんがみんなすしがすきなわけではありません。$$, $$Não é que todos os japoneses gostem de sushi.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$行きたくない____が、今日は忙しい。$$, $$Não é que eu não queira ir, mas hoje estou ocupado.$$),
        (2, $$説明を聞いたが、全部わかった____。$$, $$Ouvi a explicação, mas não é que eu tenha entendido tudo.$$),
        (3, $$この件は、彼だけが悪い____。$$, $$Neste caso, não é que só ele tenha culpa.$$),
        (4, $$お金があれば幸せになれる____。$$, $$Ter dinheiro não significa necessariamente ser feliz.$$),
        (5, $$フリーランスだが、いつも暇な____。$$, $$Sou freelancer, mas não é que eu esteja sempre livre.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-167', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わけではない$$),
        (1, $$わけじゃない$$),
        (2, $$わけではない$$),
        (2, $$わけじゃない$$),
        (3, $$わけではない$$),
        (3, $$わけじゃない$$),
        (4, $$わけではない$$),
        (4, $$わけじゃない$$),
        (5, $$わけではない$$),
        (5, $$わけじゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-168 — 〜わけがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-168',
    'grammar',
    'N3',
    $$〜わけがない$$,
    $$wake ga nai$$,
    $$Não tem como / É impossível que / De jeito nenhum$$,
    $$わけがない é usado para negar com muita força uma possibilidade, dizendo que algo é impossível ou absurdo. Equivale a "não tem como", "é impossível que" ou "de jeito nenhum".

A ideia literal é "não há motivo para isso acontecer". Quem fala tem certeza de que aquilo não é verdade ou não vai acontecer.

Por exemplo, "uma criança não tem como entender uma questão tão difícil" ou "ele jamais mentiria".

O sentido é parecido com はずがない. わけがない soa um pouco mais emocional e coloquial, e はずがない, um pouco mais lógico.

Na fala, わけがない costuma virar わけない.$$,
    $$わけがないでしょう, com でしょう, reforça a ideia de "é óbvio que não", com tom de indignação.

Não confunda com わけではない (não é que...), que é uma negação parcial e suave.

Por ser forte, わけがない pode soar teimoso se usado sem um bom motivo.$$,
    $$Verbo / Adjetivo い (forma simples) + わけがない
Adjetivo な + な + わけがない
Substantivo + の / である + わけがない

Educado: わけがありません
Fala: わけない$$,
    $$わけがない$$,
    $$わけがない|わけない|わけがありません|訳がない$$,
    ARRAY['わけ', 'が', 'ない']::text[],
    ARRAY['わけがない', 'わけない', 'わけがありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-168', $$こんな難しい問題が、子供にわかるわけがない。$$, $$こんなむずかしいもんだいが、こどもにわかるわけがない。$$, $$Não tem como uma criança entender uma questão tão difícil.$$),
    ('n3-grammar-168', $$彼がうそをつくわけがない。$$, $$かれがうそをつくわけがない。$$, $$É impossível que ele minta.$$),
    ('n3-grammar-168', $$一日でこの仕事が終わるわけがない。$$, $$いちにちでこのしごとがおわるわけがない。$$, $$Não tem como este trabalho terminar em um dia.$$),
    ('n3-grammar-168', $$あんなに練習したのだから、負けるわけがない。$$, $$あんなにれんしゅうしたのだから、まけるわけがない。$$, $$Com tanto treino, não tem como perder.$$),
    ('n3-grammar-168', $$そんな高い物、買えるわけがないでしょう。$$, $$そんなたかいもの、かえるわけがないでしょう。$$, $$Uma coisa tão cara dessas, é claro que não dá para comprar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$勉強していないのに、合格する____。$$, $$Sem estudar, não tem como passar.$$),
        (2, $$優しい彼女がそんなひどいことを言う____。$$, $$É impossível que ela, tão gentil, tenha dito algo tão cruel.$$),
        (3, $$こんなにたくさん、一人で全部食べられる____。$$, $$Tanta comida assim, não tem como comer tudo sozinho.$$),
        (4, $$まだ朝の五時だから、店が開いている____。$$, $$Ainda são cinco da manhã, então não tem como a loja estar aberta.$$),
        (5, $$いつも穏やかな彼が怒る____。$$, $$É impossível que ele, sempre tão calmo, fique bravo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-168', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わけがない$$),
        (1, $$わけない$$),
        (2, $$わけがない$$),
        (2, $$わけない$$),
        (3, $$わけがない$$),
        (3, $$わけない$$),
        (4, $$わけがない$$),
        (4, $$わけない$$),
        (5, $$わけがない$$),
        (5, $$わけない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-169 — 〜わけにはいかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-169',
    'grammar',
    'N3',
    $$〜わけにはいかない$$,
    $$wake ni wa ikanai$$,
    $$Não posso / Não dá para / Não seria certo$$,
    $$わけにはいかない é usado para dizer que, por razões morais, sociais ou de responsabilidade, a pessoa não pode fazer algo, mesmo que queira ou que seja fisicamente possível. Equivale a "não posso", "não dá para" ou "não seria certo".

A diferença em relação a できない é o motivo. できない indica incapacidade. わけにはいかない indica que fazer aquilo seria errado ou inadequado na situação, por causa de compromissos, regras ou o que os outros esperam.

Por exemplo, "amanhã tem prova, então não dá para ir passear" ou "vim de carro, então não posso beber".

Com a forma ない, ないわけにはいかない significa "não tenho como não fazer", ou seja, "sou obrigado a fazer".$$,
    $$わけにもいかない, com も, mostra que a pessoa está num dilema: não pode fazer nem uma coisa nem outra.

É muito comum no trabalho, para explicar por que não se pode faltar, recusar ou desistir.

ないわけにはいかない aparece separadamente como gramática do N3 e expressa uma obrigação social.$$,
    $$Verbo na forma de dicionário + わけにはいかない
Verbo na forma ない + わけにはいかない (não tenho como não fazer)

Educado: わけにはいきません
Variação: わけにもいかない (também não dá para...)$$,
    $$わけにはいかない$$,
    $$わけにはいかない|わけにはいきません|わけにもいかない$$,
    ARRAY['わけ', 'には', 'いかない']::text[],
    ARRAY['わけにはいかない', 'わけにはいきません', 'わけにもいかない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-169', $$明日は試験だから、遊びに行くわけにはいかない。$$, $$あしたはしけんだから、あそびにいくわけにはいかない。$$, $$Amanhã tem prova, então não dá para ir passear.$$),
    ('n3-grammar-169', $$約束したので、行かないわけにはいかない。$$, $$やくそくしたので、いかないわけにはいかない。$$, $$Eu prometi, então não tenho como não ir.$$),
    ('n3-grammar-169', $$大切な会議なので、休むわけにはいきません。$$, $$たいせつなかいぎなので、やすむわけにはいきません。$$, $$É uma reunião importante, então não posso faltar.$$),
    ('n3-grammar-169', $$車で来たから、お酒を飲むわけにはいかない。$$, $$くるまできたから、おさけをのむわけにはいかない。$$, $$Vim de carro, então não posso beber.$$),
    ('n3-grammar-169', $$先輩に頼まれたら、断るわけにもいかない。$$, $$せんぱいにたのまれたら、ことわるわけにもいかない。$$, $$Se o veterano me pede, também não dá para recusar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$熱があるが、今日は大事な仕事があるから休む____。$$, $$Estou com febre, mas hoje tenho um trabalho importante, então não posso faltar.$$),
        (2, $$これは友達に借りた物だから、捨てる____。$$, $$Isto é emprestado de um amigo, então não dá para jogar fora.$$),
        (3, $$みんなが待っているので、一人で先に帰る____。$$, $$Todos estão esperando, então não posso ir embora sozinho antes.$$),
        (4, $$一度約束したことを破る____。$$, $$Não seria certo quebrar algo que prometi.$$),
        (5, $$子供が見ているから、親の私が泣く____。$$, $$Meu filho está olhando, então eu, como mãe, não posso chorar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-169', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わけにはいかない$$),
        (1, $$わけにはいきません$$),
        (2, $$わけにはいかない$$),
        (2, $$わけにはいきません$$),
        (3, $$わけにはいかない$$),
        (3, $$わけにはいきません$$),
        (4, $$わけにはいかない$$),
        (4, $$わけにはいきません$$),
        (5, $$わけにはいかない$$),
        (5, $$わけにはいきません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-170 — 〜割に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-170',
    'grammar',
    'N3',
    $$〜割に$$,
    $$wari ni$$,
    $$Para (alguém que...) / Considerando que / Em proporção a$$,
    $$割に é usado para dizer que algo é diferente do que se esperaria, considerando certa condição. Equivale a "para..." ou "considerando que...".

A primeira parte apresenta uma condição que cria uma expectativa, e a segunda mostra que o resultado não está de acordo com ela. Por exemplo, "para o preço, é gostoso" ou "considerando que estudei, a nota foi ruim".

O resultado pode ser positivo ou negativo. O importante é o desequilíbrio entre a condição e o resultado.

Com は, 割には reforça o contraste.

O sentido é parecido com にしては, mas 割に é usado para graus ou características que podem variar (preço, idade, esforço), enquanto にしては costuma vir com substantivos mais específicos (estrangeiro, primeira vez).$$,
    $$Sozinho, わりに também é um advérbio que significa "relativamente": この店はわりに安い (esta loja é relativamente barata).

年の割に ("para a idade") é uma das combinações mais comuns.

Comparado a のに, 割に destaca mais a proporção entre a condição e o resultado.$$,
    $$Verbo / Adjetivo (forma simples) + 割に / 割には
Adjetivo な + な + 割に
Substantivo + の + 割に

Escrita: 割に / わりに$$,
    $$割に$$,
    $$割に|わりに|割には|わりには$$,
    ARRAY['割', 'に']::text[],
    ARRAY['割に', '割には', 'わりに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-170', $$この店は値段の割においしい。$$, $$このみせはねだんのわりにおいしい。$$, $$Para o preço, a comida desta loja é gostosa.$$),
    ('n3-grammar-170', $$彼は年の割に若く見える。$$, $$かれはとしのわりにわかくみえる。$$, $$Para a idade, ele parece jovem.$$),
    ('n3-grammar-170', $$勉強した割には、点数が悪かった。$$, $$べんきょうしたわりには、てんすうがわるかった。$$, $$Considerando que estudei, a nota foi ruim.$$),
    ('n3-grammar-170', $$この部屋は狭い割に、家賃が高い。$$, $$このへやはせまいわりに、やちんがたかい。$$, $$Para um apartamento tão pequeno, o aluguel é caro.$$),
    ('n3-grammar-170', $$彼女はたくさん食べる割に太らない。$$, $$かのじょはたくさんたべるわりにふとらない。$$, $$Para quem come tanto, ela não engorda.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このかばんは安い____、丈夫だ。$$, $$Para uma bolsa barata, ela é resistente.$$),
        (2, $$彼は体が大きい____、力が弱い。$$, $$Para alguém tão grande, ele tem pouca força.$$),
        (3, $$毎日練習した____、上手にならなかった。$$, $$Considerando que pratiquei todo dia, não melhorei muito.$$),
        (4, $$この映画は評判の____、おもしろくなかった。$$, $$Para a fama que tinha, este filme não foi interessante.$$),
        (5, $$父は年の____、元気だ。$$, $$Para a idade, meu pai é bem disposto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-170', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$割に$$),
        (1, $$わりに$$),
        (2, $$割に$$),
        (2, $$わりに$$),
        (3, $$割に$$),
        (3, $$わりに$$),
        (4, $$割に$$),
        (4, $$わりに$$),
        (5, $$割に$$),
        (5, $$わりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-171 — わざと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-171',
    'grammar',
    'N3',
    $$わざと$$,
    $$wazato$$,
    $$De propósito / Intencionalmente / Por querer$$,
    $$わざと é um advérbio que significa "de propósito" ou "intencionalmente". Ele indica que a pessoa fez algo sabendo o que estava fazendo, geralmente algo que não deveria ou que causa algum efeito em outra pessoa.

O tom costuma ser negativo, ligado a travessuras, maldades ou estratégias. Por exemplo, "ele perdeu de propósito" ou "fingiu que não ouviu, de propósito".

Na forma わざとじゃない, é muito usado para pedir desculpas, explicando que algo foi sem querer: "desculpa, não foi de propósito".

O oposto é うっかり ou つい, que indicam algo feito sem querer.$$,
    $$Não confunda わざと com わざわざ. わざと significa "de propósito" (muitas vezes com má intenção). わざわざ significa "dar-se ao trabalho de", com esforço especial.

Em brincadeiras entre amigos, わざと também pode ter um tom leve, como provocar de propósito.

わざとらしい é um adjetivo que significa "forçado", "artificial", como um sorriso falso.$$,
    $$わざと + Verbo
わざとじゃない / わざとではない (não foi de propósito)$$,
    $$わざと$$,
    $$わざと$$,
    ARRAY['わざと']::text[],
    ARRAY['わざと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-171', $$彼は子供に勝たせるために、わざと負けた。$$, $$かれはこどもにかたせるために、わざとまけた。$$, $$Ele perdeu de propósito para deixar a criança ganhar.$$),
    ('n3-grammar-171', $$母に呼ばれたが、わざと聞こえないふりをした。$$, $$ははによばれたが、わざときこえないふりをした。$$, $$Minha mãe me chamou, mas fingi de propósito que não ouvi.$$),
    ('n3-grammar-171', $$ごめん、わざとじゃないんだ。$$, $$ごめん、わざとじゃないんだ。$$, $$Desculpa, não foi de propósito.$$),
    ('n3-grammar-171', $$子供はわざと大きな声を出した。$$, $$こどもはわざとおおきなこえをだした。$$, $$A criança gritou de propósito.$$),
    ('n3-grammar-171', $$彼女はわざと遅れてきた。$$, $$かのじょはわざとおくれてきた。$$, $$Ela chegou atrasada de propósito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$弟は____私のケーキを食べた。$$, $$Meu irmão mais novo comeu meu bolo de propósito.$$),
        (2, $$____間違えたわけじゃない。$$, $$Não é que eu tenha errado de propósito.$$),
        (3, $$彼は____知らないふりをしている。$$, $$Ele está fingindo de propósito que não sabe.$$),
        (4, $$猫は____テーブルのコップを落とした。$$, $$O gato derrubou o copo da mesa de propósito.$$),
        (5, $$けんかの後、彼女は____私を無視した。$$, $$Depois da briga, ela me ignorou de propósito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-171', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わざと$$),
        (2, $$わざと$$),
        (3, $$わざと$$),
        (4, $$わざと$$),
        (5, $$わざと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-172 — わざわざ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-172',
    'grammar',
    'N3',
    $$わざわざ$$,
    $$wazawaza$$,
    $$Dar-se ao trabalho de / Especialmente / Sem necessidade$$,
    $$わざわざ é um advérbio que indica que alguém fez um esforço especial, que não era necessário ou que exigiu tempo e trabalho. Equivale a "dar-se ao trabalho de" ou "especialmente".

Ele tem dois tons principais.

O primeiro é de gratidão: quando alguém faz um esforço por você, わざわざ mostra que você reconhece isso. Por exemplo, "obrigado por ter vindo até aqui" ou "ele se deu ao trabalho de vir me buscar na estação".

O segundo é de "sem necessidade": quando o esforço não era preciso. Por exemplo, "um e-mail basta, não precisa se dar ao trabalho de ligar". Nesse caso, わざわざ aparece muito com なくてもいい ou ことはない.$$,
    $$Em agradecimentos formais, わざわざありがとうございます é uma das frases mais usadas pelos japoneses.

Não confunda com わざと, que significa "de propósito", geralmente com intenção negativa.

わざわざ também pode expressar crítica, como alguém que fez um esforço desnecessário: なんでわざわざそんなことを?$$,
    $$わざわざ + Verbo + てくれる / てくださる (gratidão)
わざわざ + Verbo + なくてもいい / ことはない (sem necessidade)
わざわざ + ありがとうございます (agradecimento)$$,
    $$わざわざ$$,
    $$わざわざ$$,
    ARRAY['わざわざ']::text[],
    ARRAY['わざわざ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-172', $$遠いのに、わざわざ来てくれて、ありがとう。$$, $$とおいのに、わざわざきてくれて、ありがとう。$$, $$Mesmo sendo longe, obrigado por ter vindo até aqui.$$),
    ('n3-grammar-172', $$彼はわざわざ駅まで迎えに来てくれた。$$, $$かれはわざわざえきまでむかえにきてくれた。$$, $$Ele se deu ao trabalho de vir me buscar na estação.$$),
    ('n3-grammar-172', $$メールで十分なので、わざわざ電話しなくてもいい。$$, $$メールでじゅうぶんなので、わざわざでんわしなくてもいい。$$, $$Um e-mail basta, não precisa se dar ao trabalho de ligar.$$),
    ('n3-grammar-172', $$そのパンのために、わざわざ遠くの店まで買いに行った。$$, $$そのパンのために、わざわざとおくのみせまでかいにいった。$$, $$Fui especialmente até uma loja longe para comprar esse pão.$$),
    ('n3-grammar-172', $$お忙しいところ、わざわざありがとうございます。$$, $$おいそがしいところ、わざわざありがとうございます。$$, $$Muito obrigado por ter se dado ao trabalho, mesmo estando ocupado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$入院中、____お見舞いに来てくれて、ありがとう。$$, $$Obrigado por ter se dado ao trabalho de me visitar no hospital.$$),
        (2, $$近くにもあるのに、____遠くの店に行った。$$, $$Mesmo tendo uma perto, fui especialmente a uma loja longe.$$),
        (3, $$そんな物、____届けてくれなくてもよかったのに。$$, $$Não precisava ter se dado ao trabalho de me entregar uma coisa dessas.$$),
        (4, $$彼は私の誕生日のために、____ケーキを作ってくれた。$$, $$Ele se deu ao trabalho de fazer um bolo para o meu aniversário.$$),
        (5, $$そのことは、____説明しなくても、みんな知っている。$$, $$Isso todo mundo já sabe, não precisa se dar ao trabalho de explicar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-172', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わざわざ$$),
        (2, $$わざわざ$$),
        (3, $$わざわざ$$),
        (4, $$わざわざ$$),
        (5, $$わざわざ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-173 — 〜よりも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-173',
    'grammar',
    'N3',
    $$〜よりも$$,
    $$yori mo$$,
    $$Mais do que / Do que (enfático)$$,
    $$よりも é a forma enfática de より. Ela marca o ponto de comparação, como "do que", mas com mais força.

Ela é usada em comparações comuns, como "gosto mais de peixe do que de carne", e principalmente em expressões com palavras interrogativas, que formam superlativos:
• 何よりも: "mais do que tudo", "acima de tudo".
• 誰よりも: "mais do que qualquer pessoa".
• どこよりも: "mais do que qualquer lugar".
• いつよりも: "mais do que nunca".

Também aparece com expressões de expectativa, como 思ったよりも (do que eu pensava) e 予想よりも (do que o previsto).

O も dá ênfase, deixando a comparação mais forte e expressiva.$$,
    $$何よりも健康が大切だ ("acima de tudo, a saúde é o mais importante") é uma frase muito comum.

よりも é usado da mesma forma que より; a diferença é apenas a ênfase.

Em cartas e mensagens, 誰よりも ("mais do que ninguém") aparece em frases afetivas.$$,
    $$A + よりも + B + の方が / が + Adjetivo
何よりも / 誰よりも / どこよりも + Adjetivo / Verbo
思ったよりも / 予想よりも + Adjetivo$$,
    $$よりも$$,
    $$よりも$$,
    ARRAY['より', 'も']::text[],
    ARRAY['よりも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-173', $$私は肉よりも魚が好きだ。$$, $$わたしはにくよりもさかながすきだ。$$, $$Gosto mais de peixe do que de carne.$$),
    ('n3-grammar-173', $$何よりも健康が大切だ。$$, $$なによりもけんこうがたいせつだ。$$, $$Acima de tudo, a saúde é o mais importante.$$),
    ('n3-grammar-173', $$彼は誰よりも早く会社に来た。$$, $$かれはだれよりもはやくかいしゃにきた。$$, $$Ele chegou à empresa mais cedo do que todo mundo.$$),
    ('n3-grammar-173', $$去年よりも今年のほうが暑い。$$, $$きょねんよりもことしのほうがあつい。$$, $$Este ano está mais quente do que o ano passado.$$),
    ('n3-grammar-173', $$試験は思ったよりも簡単だった。$$, $$しけんはおもったよりもかんたんだった。$$, $$A prova foi mais fácil do que eu pensava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$母は誰____料理が上手だ。$$, $$Minha mãe cozinha melhor do que qualquer pessoa.$$),
        (2, $$何____家族が大切です。$$, $$Acima de tudo, a família é o mais importante.$$),
        (3, $$私は夏____冬が好きだ。$$, $$Eu gosto mais do inverno do que do verão.$$),
        (4, $$電車____バスのほうが安い。$$, $$O ônibus é mais barato do que o trem.$$),
        (5, $$イベントには予想____多くの人が来た。$$, $$Vieram mais pessoas ao evento do que o previsto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-173', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$よりも$$),
        (2, $$よりも$$),
        (3, $$よりも$$),
        (4, $$よりも$$),
        (5, $$よりも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-174 — 〜ようがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-174',
    'grammar',
    'N3',
    $$〜ようがない$$,
    $$you ga nai$$,
    $$Não há como / Não tem jeito de / É impossível$$,
    $$ようがない é usado para dizer que não existe nenhum meio ou método de fazer algo. Equivale a "não há como", "não tem jeito de" ou "é impossível".

よう aqui significa "modo" ou "maneira". Assim, a estrutura diz literalmente "não existe maneira de fazer isso".

Ela é formada tirando ます do verbo e acrescentando ようがない. Por exemplo, 連絡しようがない (não há como entrar em contato).

A diferença em relação a できない é o motivo. できない pode indicar falta de habilidade. ようがない indica que faltam meios, informações ou condições para fazer aquilo, como não ter o endereço, não ter materiais ou o objeto estar quebrado demais.

A forma ようもない, com も, reforça a impossibilidade. A expressão どうしようもない significa "não tem jeito nenhum".$$,
    $$Com する verbos, a forma fica 〜しようがない: 説明しようがない (não há como explicar).

言いようがない (não há palavras para descrever) é usado para sentimentos muito fortes.

どうしようもない também descreve pessoas sem jeito ou situações irremediáveis.$$,
    $$Verbo na forma ます sem ます + ようがない
Verbo sem ます + ようもない (mais enfático)
どうしようもない (não tem jeito nenhum)

Educado: ようがありません$$,
    $$ようがない$$,
    $$ようがない|ようもない|ようがありません$$,
    ARRAY['よう', 'が', 'ない']::text[],
    ARRAY['ようがない', 'ようもない', 'ようがありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-174', $$連絡先がわからないので、連絡しようがない。$$, $$れんらくさきがわからないので、れんらくしようがない。$$, $$Não sei o contato, então não há como entrar em contato.$$),
    ('n3-grammar-174', $$こんなに壊れていたら、直しようがない。$$, $$こんなにこわれていたら、なおしようがない。$$, $$Quebrado desse jeito, não tem como consertar.$$),
    ('n3-grammar-174', $$材料がないので、作りようがない。$$, $$ざいりょうがないので、つくりようがない。$$, $$Não tenho os ingredientes, então não há como fazer.$$),
    ('n3-grammar-174', $$その時の気持ちは、言葉では言いようがない。$$, $$そのときのきもちは、ことばではいいようがない。$$, $$Não há palavras para descrever o que senti naquele momento.$$),
    ('n3-grammar-174', $$道がわからないから、行きようがない。$$, $$みちがわからないから、いきようがない。$$, $$Não sei o caminho, então não há como ir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$住所がわからないので、手紙を送り____。$$, $$Não sei o endereço, então não há como enviar a carta.$$),
        (2, $$証拠がないから、警察も調べ____。$$, $$Sem provas, nem a polícia tem como investigar.$$),
        (3, $$何も知らないので、答え____。$$, $$Não sei de nada, então não há como responder.$$),
        (4, $$もう終わったことだから、どうし____。$$, $$Já acabou, então não tem jeito nenhum.$$),
        (5, $$電話番号を知らないから、電話をかけ____。$$, $$Não sei o número, então não há como ligar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-174', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようがない$$),
        (1, $$ようがありません$$),
        (2, $$ようがない$$),
        (2, $$ようがありません$$),
        (3, $$ようがない$$),
        (3, $$ようがありません$$),
        (4, $$ようもない$$),
        (4, $$ようがない$$),
        (5, $$ようがない$$),
        (5, $$ようがありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-175 — 〜ような気がする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-175',
    'grammar',
    'N3',
    $$〜ような気がする$$,
    $$you na ki ga suru$$,
    $$Ter a impressão de que / Ter a sensação de que / Parece que$$,
    $$ような気がする é usado para expressar uma impressão, uma intuição ou uma sensação vaga, sem certeza. Equivale a "ter a impressão de que", "ter a sensação de que" ou "parece que".

A ideia é que a pessoa sente algo, mas não tem provas. Por exemplo, "tenho a sensação de que alguém está me olhando" ou "tenho a impressão de que já vim aqui antes".

É uma forma suave e cautelosa de dar uma opinião ou de falar de uma lembrança incerta. Por isso, é muito usada para não soar categórico.

Ele vem depois da forma simples de verbos e adjetivos. Com substantivos, usa-se のような気がする.

Às vezes, ような é omitido, ficando só 気がする, com o mesmo sentido.$$,
    $$気がする também aparece em がする, aprendido no N4, como em 寒気がする.

É muito comum na fala para suavizar opiniões, mesmo quando a pessoa tem certa certeza.

そうな気がする indica um pressentimento sobre algo que vai acontecer: いいことがありそうな気がする.$$,
    $$Verbo / Adjetivo い (forma simples) + ような気がする
Adjetivo な + な + ような気がする
Substantivo + の + ような気がする
Verbo + そうな + 気がする (pressentimento)

Educado: ような気がします
Passado: ような気がした$$,
    $$ような気がする$$,
    $$ような気がする|ような気がします|ような気がした|気がする|気がします|気がした$$,
    ARRAY['ような', '気', 'が', 'する']::text[],
    ARRAY['ような気がする', 'ような気がします', 'ような気がした', '気がする']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-175', $$誰かに見られているような気がする。$$, $$だれかにみられているようなきがする。$$, $$Tenho a sensação de que alguém está me olhando.$$),
    ('n3-grammar-175', $$前にもここに来たことがあるような気がします。$$, $$まえにもここにきたことがあるようなきがします。$$, $$Tenho a impressão de que já vim aqui antes.$$),
    ('n3-grammar-175', $$今日は何かいいことがありそうな気がする。$$, $$きょうはなにかいいことがありそうなきがする。$$, $$Tenho o pressentimento de que hoje vai acontecer algo bom.$$),
    ('n3-grammar-175', $$彼は怒っているような気がした。$$, $$かれはおこっているようなきがした。$$, $$Tive a impressão de que ele estava bravo.$$),
    ('n3-grammar-175', $$この歌は聞いたことがあるような気がする。$$, $$このうたはきいたことがあるようなきがする。$$, $$Tenho a impressão de que já ouvi esta música.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家の鍵をかけ忘れた____。$$, $$Tenho a sensação de que esqueci de trancar a casa.$$),
        (2, $$彼女とはどこかで会ったことがある____。$$, $$Tenho a impressão de que já encontrei ela em algum lugar.$$),
        (3, $$天気予報は暖かいと言っていたが、今日は寒い____。$$, $$A previsão disse que ia fazer calor, mas tenho a sensação de que hoje está frio.$$),
        (4, $$さっき、誰かに名前を呼ばれた____。$$, $$Agora há pouco, tive a impressão de que alguém chamou meu nome.$$),
        (5, $$体がだるくて、少し熱がある____。$$, $$Estou com o corpo mole e com a sensação de que estou com um pouco de febre.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-175', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ような気がする$$),
        (1, $$ような気がします$$),
        (2, $$ような気がする$$),
        (2, $$ような気がします$$),
        (3, $$ような気がする$$),
        (3, $$ような気がします$$),
        (4, $$ような気がした$$),
        (5, $$ような気がする$$),
        (5, $$ような気がします$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-176 — 〜ように（目的）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-176',
    'grammar',
    'N3',
    $$〜ように（目的）$$,
    $$you ni (mokuteki)$$,
    $$Para que / A fim de que / De modo que$$,
    $$Nesse uso, ように indica o objetivo de uma ação, ou seja, o resultado que se quer alcançar. Equivale a "para que", "a fim de que" ou "de modo que".

A diferença em relação a ために é muito importante. ように é usado quando o resultado desejado não depende só da vontade da pessoa: verbos potenciais (conseguir falar, poder ler), verbos sem controle (ouvir, esquecer) e verbos na forma negativa (não pegar resfriado, não se atrasar).

Por exemplo, "falei alto para que todos pudessem ouvir" ou "durma agasalhado para não pegar resfriado".

ために é usado quando a pessoa realiza uma ação intencional para alcançar o objetivo, como "estudo para entrar na faculdade".

Também é comum quando o sujeito das duas partes é diferente: "escrevi em hiragana para que as crianças pudessem ler".$$,
    $$Regra prática: se o verbo antes do objetivo for potencial, negativo ou sem controle, use ように; se for uma ação intencional, use ために.

ように também aparece em desejos e orações, como 合格できますように ("que eu passe na prova!").

Em avisos, 〜ないようにご注意ください ("tome cuidado para não...") é muito comum.$$,
    $$Verbo potencial + ように + Ação
Verbo na forma ない + ように + Ação (para não...)
Verbo sem controle (聞こえる / 見える / 忘れる) + ように + Ação$$,
    $$ように$$,
    $$ように$$,
    ARRAY['よう', 'に']::text[],
    ARRAY['ように', 'ないように']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-176', $$風邪をひかないように、暖かくして寝た。$$, $$かぜをひかないように、あたたかくしてねた。$$, $$Dormi agasalhado para não pegar resfriado.$$),
    ('n3-grammar-176', $$後ろの人にも聞こえるように、大きな声で話してください。$$, $$うしろのひとにもきこえるように、おおきなこえではなしてください。$$, $$Fale alto para que as pessoas de trás também possam ouvir.$$),
    ('n3-grammar-176', $$大事なことを忘れないように、メモしておこう。$$, $$だいじなことをわすれないように、メモしておこう。$$, $$Vou anotar para não esquecer as coisas importantes.$$),
    ('n3-grammar-176', $$早く日本語が話せるように、毎日練習している。$$, $$はやくにほんごがはなせるように、まいにちれんしゅうしている。$$, $$Pratico todo dia para conseguir falar japonês logo.$$),
    ('n3-grammar-176', $$子供でも読めるように、ひらがなで書いた。$$, $$こどもでもよめるように、ひらがなでかいた。$$, $$Escrevi em hiragana para que até crianças pudessem ler.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅れない____、早く家を出た。$$, $$Saí de casa cedo para não me atrasar.$$),
        (2, $$みんなに見える____、大きく書いてください。$$, $$Escreva grande para que todos possam ver.$$),
        (3, $$試験に合格できる____、頑張ります。$$, $$Vou me esforçar para conseguir passar na prova.$$),
        (4, $$忘れ物をしない____、気をつけてください。$$, $$Tome cuidado para não esquecer nada.$$),
        (5, $$赤ちゃんが起きない____、静かに話した。$$, $$Falamos baixo para que o bebê não acordasse.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-176', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ように$$),
        (2, $$ように$$),
        (3, $$ように$$),
        (4, $$ように$$),
        (5, $$ように$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-177 — 〜ように見える
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-177',
    'grammar',
    'N3',
    $$〜ように見える$$,
    $$you ni mieru$$,
    $$Parece / Dá a impressão de / Parece como se$$,
    $$ように見える é usado para dizer como algo ou alguém parece, a partir da aparência, muitas vezes de forma diferente da realidade. Equivale a "parece", "dá a impressão de" ou "parece como se".

Ele junta ように (como, de modo parecido a) com 見える (parecer, ser visto). A ideia é "dá a impressão visual de ser assim".

Ele vem depois da forma simples de verbos e adjetivos, de adjetivos な com な e de substantivos com の.

É muito usado quando a aparência engana: "ela parecia brava, mas estava rindo". Também serve para comparações visuais: "de longe, as nuvens parecem montanhas".

Comparado a に見える, que vem diretamente depois de substantivos e adjetivos, ように見える costuma vir depois de frases inteiras ou de substantivos com の.$$,
    $$Comparado a そうだ (aparência), ように見える é usado para impressões gerais e comparações, enquanto そうだ descreve sinais visíveis de algo prestes a acontecer.

Com a forma ている, ように見える descreve um estado aparente: 疲れているように見える.

Na escrita, também aparece a forma ようにみえる em hiragana.$$,
    $$Verbo / Adjetivo い (forma simples) + ように見える
Adjetivo な + な + ように見える
Substantivo + の + ように見える

Educado: ように見えます
Passado: ように見えた$$,
    $$ように見える$$,
    $$ように見え|ようにみえ$$,
    ARRAY['ように', '見える']::text[],
    ARRAY['ように見える', 'ように見えます', 'ように見えた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-177', $$彼は疲れているように見える。$$, $$かれはつかれているようにみえる。$$, $$Ele parece cansado.$$),
    ('n3-grammar-177', $$この絵は本物のように見えます。$$, $$このえはほんもののようにみえます。$$, $$Este quadro parece verdadeiro.$$),
    ('n3-grammar-177', $$彼女は怒っているように見えたが、笑っていた。$$, $$かのじょはおこっているようにみえたが、わらっていた。$$, $$Ela parecia brava, mas estava rindo.$$),
    ('n3-grammar-177', $$遠くから見ると、雲が山のように見える。$$, $$とおくからみると、くもがやまのようにみえる。$$, $$Vistas de longe, as nuvens parecem montanhas.$$),
    ('n3-grammar-177', $$彼は何も知らないように見える。$$, $$かれはなにもしらないようにみえる。$$, $$Ele parece não saber de nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さんは今日、元気がない____。$$, $$O Tanaka parece desanimado hoje.$$),
        (2, $$このおもちゃは本物の車の____。$$, $$Este brinquedo parece um carro de verdade.$$),
        (3, $$彼女は幸せな____が、本当は悩んでいる。$$, $$Ela parece feliz, mas na verdade está preocupada.$$),
        (4, $$試合の後、彼は悲しんでいる____。$$, $$Depois da partida, ele parecia triste.$$),
        (5, $$ここから見ると、町がおもちゃの____。$$, $$Vista daqui, a cidade parece de brinquedo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-177', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ように見える$$),
        (1, $$ように見えます$$),
        (2, $$ように見える$$),
        (2, $$ように見えます$$),
        (3, $$ように見える$$),
        (4, $$ように見えた$$),
        (4, $$ように見えました$$),
        (5, $$ように見える$$),
        (5, $$ように見えます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-178 — 〜ようとしない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-178',
    'grammar',
    'N3',
    $$〜ようとしない$$,
    $$you to shinai$$,
    $$Não querer (fazer) / Recusar-se a / Não fazer nenhum esforço para$$,
    $$ようとしない é usado para dizer que alguém não tem a menor intenção de fazer algo, ou se recusa a fazer, mesmo quando deveria. Equivale a "não quer", "se recusa a" ou "não faz nenhum esforço para".

Ele junta a forma volitiva do verbo (聞こう, 食べよう) com としない. A ideia literal é "não tenta fazer".

Ele é usado para falar de outras pessoas, geralmente com tom de crítica, frustração ou preocupação. Por exemplo, "ele não quer ouvir o que os outros dizem" ou "a criança se recusa a comer verdura".

Para falar de si mesmo, essa estrutura soa estranha, a não ser em descrições objetivas.$$,
    $$Para falar de si mesmo, usa-se つもりはない ou たくない.

ようとしない destaca a falta de vontade ou de esforço, e não a incapacidade.

É muito comum em conversas de pais sobre filhos e em reclamações sobre colegas.$$,
    $$Forma volitiva + としない
Forma volitiva + としなかった (passado)

Educado: ようとしません
Exemplos: 聞く → 聞こうとしない / 食べる → 食べようとしない / する → しようとしない$$,
    $$ようとしない$$,
    $$ようとしない|うとしない|ようとしません|うとしません|うとしなかった$$,
    ARRAY['よう', 'と', 'しない']::text[],
    ARRAY['ようとしない', 'うとしない', 'ようとしません', 'うとしなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-178', $$彼は人の話を聞こうとしない。$$, $$かれはひとのはなしをきこうとしない。$$, $$Ele não quer ouvir o que os outros dizem.$$),
    ('n3-grammar-178', $$子供が野菜を食べようとしない。$$, $$こどもがやさいをたべようとしない。$$, $$A criança se recusa a comer verdura.$$),
    ('n3-grammar-178', $$何度言っても、彼は謝ろうとしない。$$, $$なんどいっても、かれはあやまろうとしない。$$, $$Por mais que eu fale, ele se recusa a pedir desculpas.$$),
    ('n3-grammar-178', $$弟は宿題をやろうとしない。$$, $$おとうとはしゅくだいをやろうとしない。$$, $$Meu irmão mais novo não faz nenhum esforço para fazer a lição.$$),
    ('n3-grammar-178', $$彼女は本当のことを話そうとしなかった。$$, $$かのじょはほんとうのことをはなそうとしなかった。$$, $$Ela se recusou a contar a verdade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$息子は部屋から出よ____。$$, $$Meu filho se recusa a sair do quarto.$$),
        (2, $$彼は自分の間違いを認めよ____。$$, $$Ele se recusa a admitir o próprio erro.$$),
        (3, $$猫は薬を飲も____。$$, $$O gato se recusa a tomar o remédio.$$),
        (4, $$彼女は悩んでいるのに、誰にも相談しよ____。$$, $$Ela está preocupada, mas não quer pedir conselho a ninguém.$$),
        (5, $$父は具合が悪いのに、病院に行こ____。$$, $$Meu pai está mal, mas se recusa a ir ao hospital.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-178', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$うとしない$$),
        (1, $$うとしません$$),
        (2, $$うとしない$$),
        (2, $$うとしません$$),
        (3, $$うとしない$$),
        (3, $$うとしません$$),
        (4, $$うとしない$$),
        (4, $$うとしません$$),
        (5, $$うとしない$$),
        (5, $$うとしません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-179 — 〜ようとする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-179',
    'grammar',
    'N3',
    $$〜ようとする$$,
    $$you to suru$$,
    $$Tentar / Estar prestes a / Ir fazer$$,
    $$ようとする tem dois usos principais.

O primeiro é "tentar": a pessoa se esforça para fazer algo, mas muitas vezes não consegue. Por exemplo, "tentei dormir, mas não consegui pegar no sono" ou "ele tentou dizer algo, mas desistiu".

O segundo é "estar prestes a": algo está quase acontecendo. Com とき, indica o momento exato antes de uma ação: "quando eu ia sair de casa, o telefone tocou". Com coisas e fenômenos, como o sol se pondo ou as portas se fechando, ようとしている descreve algo que está começando a acontecer.

Ele junta a forma volitiva do verbo com とする.$$,
    $$Comparado a てみる (experimentar), ようとする destaca o esforço e, muitas vezes, o fracasso da tentativa.

Na forma negativa, ようとしない significa "não quer fazer", com outro sentido.

Com sujeitos que não são pessoas, como o sol ou a porta, ようとしている descreve o momento imediatamente antes de algo acontecer.$$,
    $$Forma volitiva + とする / とした (tentar)
Forma volitiva + とした + とき (quando ia...)
Forma volitiva + としている (está prestes a)

Exemplos: 寝る → 寝ようとする / 言う → 言おうとする / 出る → 出ようとする$$,
    $$ようとする$$,
    $$ようとする|うとする|ようとした|うとした|うとして$$,
    ARRAY['よう', 'と', 'する']::text[],
    ARRAY['ようとする', 'うとする', 'ようとした', 'ようとしている']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-179', $$家を出ようとしたとき、電話が鳴った。$$, $$いえをでようとしたとき、でんわがなった。$$, $$Quando eu ia sair de casa, o telefone tocou.$$),
    ('n3-grammar-179', $$赤ちゃんが一人で立とうとしている。$$, $$あかちゃんがひとりでたとうとしている。$$, $$O bebê está tentando ficar de pé sozinho.$$),
    ('n3-grammar-179', $$寝ようとしたが、なかなか眠れなかった。$$, $$ねようとしたが、なかなかねむれなかった。$$, $$Tentei dormir, mas não consegui pegar no sono.$$),
    ('n3-grammar-179', $$彼は何か言おうとしたが、やめた。$$, $$かれはなにかいおうとしたが、やめた。$$, $$Ele tentou dizer algo, mas desistiu.$$),
    ('n3-grammar-179', $$電車のドアが閉まろうとしている。$$, $$でんしゃのドアがしまろうとしている。$$, $$As portas do trem estão prestes a se fechar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$出かけよ____とき、雨が降り出した。$$, $$Quando eu ia sair, começou a chover.$$),
        (2, $$名前を思い出そ____が、思い出せない。$$, $$Tentei lembrar o nome, mas não consigo.$$),
        (3, $$彼女は重いドアを開けよ____いた。$$, $$Ela estava tentando abrir a porta pesada.$$),
        (4, $$太陽が沈も____いる。$$, $$O sol está prestes a se pôr.$$),
        (5, $$寝よ____が、隣がうるさくて眠れなかった。$$, $$Tentei dormir, mas o vizinho estava barulhento e não consegui.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-179', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$うとした$$),
        (2, $$うとした$$),
        (3, $$うとして$$),
        (4, $$うとして$$),
        (5, $$うとした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-180 — 〜ずに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-180',
    'grammar',
    'N3',
    $$〜ずに$$,
    $$zu ni$$,
    $$Sem / Sem fazer$$,
    $$ずに é usado para dizer que uma ação é feita sem fazer outra. Equivale a "sem" ou "sem fazer".

Ele tem o mesmo sentido de ないで, mas soa mais formal e escrito. Por isso, é muito comum em textos, notícias e na linguagem formal.

Para formar, tira-se ない da forma negativa e acrescenta-se ずに. Por exemplo, 食べない → 食べずに, 使わない → 使わずに.

O verbo する é uma exceção: vira せずに, e não しずに.

Por exemplo, "saí de casa sem tomar café da manhã" ou "ele foi embora sem dizer nada".$$,
    $$O erro mais comum é dizer しずに. O correto é sempre せずに.

ずに também aparece em ずにはいられない (não conseguir deixar de) e ずに済む (conseguir evitar), que são outras gramáticas.

Na fala do dia a dia, ないで é mais comum; ずに aparece mais na escrita.$$,
    $$Verbo na forma ない sem ない + ずに + Verbo
Exceções: する → せずに / 来る → 来ずに (こずに)

Forma escrita: Verbo sem ない + ず、 + Frase$$,
    $$ずに$$,
    $$ずに|ず、|せずに$$,
    ARRAY['ず', 'に']::text[],
    ARRAY['ずに', 'せずに', 'ず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-180', $$朝ご飯を食べずに、家を出た。$$, $$あさごはんをたべずに、いえをでた。$$, $$Saí de casa sem tomar café da manhã.$$),
    ('n3-grammar-180', $$辞書を使わずに、新聞を読んだ。$$, $$じしょをつかわずに、しんぶんをよんだ。$$, $$Li o jornal sem usar o dicionário.$$),
    ('n3-grammar-180', $$彼は何も言わずに帰った。$$, $$かれはなにもいわずにかえった。$$, $$Ele foi embora sem dizer nada.$$),
    ('n3-grammar-180', $$全然勉強せずに試験を受けた。$$, $$ぜんぜんべんきょうせずにしけんをうけた。$$, $$Fiz a prova sem ter estudado nada.$$),
    ('n3-grammar-180', $$雨なのに、傘を持たずに出かけた。$$, $$あめなのに、かさをもたずにでかけた。$$, $$Mesmo com chuva, saí sem levar guarda-chuva.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日は疲れて、歯を磨か____寝てしまった。$$, $$Ontem estava cansado e acabei dormindo sem escovar os dentes.$$),
        (2, $$誰にも相談せ____、一人で決めた。$$, $$Decidi sozinho, sem pedir conselho a ninguém.$$),
        (3, $$彼は一日中休ま____働き続けた。$$, $$Ele trabalhou o dia inteiro sem descansar.$$),
        (4, $$予約せ____レストランに行ったら、満席だった。$$, $$Fui ao restaurante sem reserva e estava lotado.$$),
        (5, $$地図を見____、目的地に着いた。$$, $$Cheguei ao destino sem olhar o mapa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-180', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずに$$),
        (2, $$ずに$$),
        (3, $$ずに$$),
        (4, $$ずに$$),
        (5, $$ずに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-181 — 〜ずにはいられない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-181',
    'grammar',
    'N3',
    $$〜ずにはいられない$$,
    $$zu ni wa irarenai$$,
    $$Não conseguir deixar de / Não resistir a / Não ter como não$$,
    $$ずにはいられない é usado para dizer que a pessoa não consegue se controlar e acaba fazendo algo, por causa de um sentimento forte. Equivale a "não conseguir deixar de", "não resistir a" ou "não ter como não".

A estrutura é uma dupla negação: "não consigo ficar sem fazer". O resultado é uma ação quase involuntária, provocada por emoção, impulso ou situação.

Por exemplo, "vendo esse filme, não consegui deixar de chorar" ou "quando vejo um gato fofo, não resisto a fazer carinho".

Ela é formada com ずに (sem fazer) + はいられない (não consegue ficar). O verbo する vira せずにはいられない.

A forma ないではいられない tem o mesmo sentido e é um pouco mais falada.$$,
    $$O sujeito costuma ser quem fala. Para outras pessoas, acrescenta-se ようだ ou らしい.

É uma forma expressiva e um pouco literária, comum em relatos de emoções fortes.

Comparado a つい〜てしまう, ずにはいられない destaca que o impulso é forte demais para resistir.$$,
    $$Verbo na forma ない sem ない + ずにはいられない
する → せずにはいられない
Passado: ずにはいられなかった

Variação: ないではいられない$$,
    $$ずにはいられない$$,
    $$ずにはいられない|ないではいられない|ずにはいられなかった$$,
    ARRAY['ず', 'には', 'いられない']::text[],
    ARRAY['ずにはいられない', 'ずにはいられなかった', 'ないではいられない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-181', $$その映画を見て、泣かずにはいられなかった。$$, $$そのえいがをみて、なかずにはいられなかった。$$, $$Vendo esse filme, não consegui deixar de chorar.$$),
    ('n3-grammar-181', $$彼の話を聞くと、笑わずにはいられない。$$, $$かれのはなしをきくと、わらわずにはいられない。$$, $$Quando ouço as histórias dele, não tenho como não rir.$$),
    ('n3-grammar-181', $$かわいい猫を見ると、触らずにはいられない。$$, $$かわいいねこをみると、さわらずにはいられない。$$, $$Quando vejo um gato fofo, não resisto a fazer carinho.$$),
    ('n3-grammar-181', $$困っている人を見ると、助けずにはいられない。$$, $$こまっているひとをみると、たすけずにはいられない。$$, $$Quando vejo alguém em dificuldade, não consigo deixar de ajudar.$$),
    ('n3-grammar-181', $$おいしそうなケーキを見て、買わずにはいられなかった。$$, $$おいしそうなケーキをみて、かわずにはいられなかった。$$, $$Vi um bolo com cara de delicioso e não resisti a comprar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の話があまりにおかしくて、笑わ____。$$, $$A história dele era tão engraçada que não consegui deixar de rir.$$),
        (2, $$試験の結果が気になって、先生に聞か____。$$, $$Fico tão curioso com o resultado da prova que não resisto a perguntar ao professor.$$),
        (3, $$悲しい話を聞いて、泣か____。$$, $$Ouvi uma história triste e não consegui deixar de chorar.$$),
        (4, $$甘い物を見ると、食べ____。$$, $$Quando vejo doce, não resisto a comer.$$),
        (5, $$彼の失礼な態度に、一言言わ____。$$, $$Diante da atitude mal-educada dele, não pude deixar de dizer algo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-181', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずにはいられない$$),
        (1, $$ずにはいられなかった$$),
        (2, $$ずにはいられない$$),
        (3, $$ずにはいられなかった$$),
        (4, $$ずにはいられない$$),
        (5, $$ずにはいられなかった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-182 — 〜ずつ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-182',
    'grammar',
    'N3',
    $$〜ずつ$$,
    $$zutsu$$,
    $$Cada / De... em... / Aos poucos$$,
    $$ずつ é usado depois de quantidades para indicar distribuição igual ou repetição em partes iguais. Equivale a "cada", "de... em..." ou "aos poucos".

Ele tem dois usos principais. O primeiro é distribuir: cada pessoa recebe ou faz a mesma quantidade. Por exemplo, "peguem dois cada um" ou "dei três doces para cada criança".

O segundo é indicar progresso gradual, em partes iguais: "leio uma página por dia" ou, com 少し, "aos poucos": "a doença está melhorando aos poucos".

ずつ vem diretamente depois de números com contador e de palavras de quantidade, como 少し e 一つ.$$,
    $$少しずつ é uma das expressões mais usadas e combina muito com verbos de mudança, como なる, 増える e 慣れる.

一人ずつ significa "um de cada vez" ou "cada pessoa", dependendo do contexto.

Não confunda com づつ, que é uma grafia antiga e hoje considerada incorreta.$$,
    $$Número + Contador + ずつ + Verbo (cada / de... em...)
Pessoa + Número + ずつ (cada pessoa recebe...)
少しずつ + Verbo (aos poucos)$$,
    $$ずつ$$,
    $$ずつ$$,
    ARRAY['ずつ']::text[],
    ARRAY['ずつ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-182', $$毎日少しずつ日本語を勉強している。$$, $$まいにちすこしずつにほんごをべんきょうしている。$$, $$Estudo japonês um pouco por dia.$$),
    ('n3-grammar-182', $$この紙は一人二枚ずつ取ってください。$$, $$このかみはひとりにまいずつとってください。$$, $$Peguem duas folhas cada um, por favor.$$),
    ('n3-grammar-182', $$子供たちにお菓子を三つずつあげた。$$, $$こどもたちにおかしをみっつずつあげた。$$, $$Dei três doces para cada criança.$$),
    ('n3-grammar-182', $$この本は一日に一ページずつ読んでいる。$$, $$このほんはいちにちにいちページずつよんでいる。$$, $$Estou lendo este livro uma página por dia.$$),
    ('n3-grammar-182', $$父の病気は少しずつよくなっている。$$, $$ちちのびょうきはすこしずつよくなっている。$$, $$A doença do meu pai está melhorando aos poucos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$パンフレットは一人一つ____持っていってください。$$, $$Leve um folheto cada um, por favor.$$),
        (2, $$毎日十個____漢字を覚えます。$$, $$Decoro dez kanji por dia.$$),
        (3, $$春になって、雪が少し____溶けてきた。$$, $$Com a chegada da primavera, a neve foi derretendo aos poucos.$$),
        (4, $$二人____グループを作ってください。$$, $$Formem grupos de duas pessoas cada.$$),
        (5, $$この薬は一回二錠____飲んでください。$$, $$Tome dois comprimidos de cada vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-182', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずつ$$),
        (2, $$ずつ$$),
        (3, $$ずつ$$),
        (4, $$ずつ$$),
        (5, $$ずつ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-183 — 〜させてもらう・〜させていただく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-183',
    'grammar',
    'N3',
    $$〜させてもらう・〜させていただく$$,
    $$sasete morau / sasete itadaku$$,
    $$Receber permissão para / Permita-me / Com sua licença vou$$,
    $$させてもらう e させていただく são usados para dizer que a pessoa faz algo com a permissão de outra, de forma humilde e educada. Equivalem a "receber permissão para", "permita-me" ou "com sua licença, vou...".

Elas juntam a forma causativa (させる, "deixar fazer") com もらう / いただく (receber). A ideia literal é "recebo de você o favor de me deixar fazer".

させていただく é a forma mais humilde e muito comum em situações formais, como discursos, reuniões, atendimento ao cliente e e-mails. Por exemplo, "então, vou fazer minha apresentação".

Em perguntas, させていただけませんか é uma forma muito educada de pedir permissão: "poderia me deixar pensar um pouco?".

Na fala do dia a dia, entre colegas, させてもらう é suficiente.$$,
    $$Em japonês de negócios, させていただく às vezes é usado em excesso, mesmo quando não há permissão de ninguém envolvida. Muitos japoneses consideram esse excesso artificial.

それでは、始めさせていただきます ("então, com sua licença, vou começar") é muito comum em eventos.

Para pedidos simples, させてください também funciona, mas é menos formal.$$,
    $$Verbo causativo na forma て + もらう / いただく
Verbo causativo て + いただけませんか (pedido educado)
Verbo causativo て + いただきます (anúncio humilde)

Exemplos: 帰る → 帰らせていただく / 考える → 考えさせていただく / 発表する → 発表させていただく$$,
    $$させていただく$$,
    $$させてもら|させていただ|せてもら|せていただ$$,
    ARRAY['させて', 'もらう', 'いただく']::text[],
    ARRAY['させてもらう', 'させていただく', 'させていただけませんか', 'させていただきます']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-183', $$すみません、今日は早く帰らせてもらいます。$$, $$すみません、きょうははやくかえらせてもらいます。$$, $$Com licença, hoje vou embora mais cedo.$$),
    ('n3-grammar-183', $$少し考えさせていただけませんか。$$, $$すこしかんがえさせていただけませんか。$$, $$O senhor poderia me deixar pensar um pouco?$$),
    ('n3-grammar-183', $$先週、先生の研究室を見学させていただきました。$$, $$せんしゅう、せんせいのけんきゅうしつをけんがくさせていただきました。$$, $$Semana passada, tive a oportunidade de visitar o laboratório do professor.$$),
    ('n3-grammar-183', $$この写真を使わせてもらってもいいですか。$$, $$このしゃしんをつかわせてもらってもいいですか。$$, $$Posso usar esta foto?$$),
    ('n3-grammar-183', $$それでは、発表させていただきます。$$, $$それでは、はっぴょうさせていただきます。$$, $$Então, com sua licença, vou fazer minha apresentação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$体調が悪いので、明日は休ま____いただきたいのですが。$$, $$Não estou bem, então gostaria de faltar amanhã, se possível.$$),
        (2, $$この資料をコピーさ____いただけますか。$$, $$Poderia me permitir copiar este documento?$$),
        (3, $$先週、工場を見学さ____。$$, $$Semana passada, tive a oportunidade de visitar a fábrica.$$),
        (4, $$それでは、一言ご挨拶さ____。$$, $$Então, com sua licença, vou dizer algumas palavras.$$),
        (5, $$旅行中、友達の家に泊まら____。$$, $$Durante a viagem, fiquei hospedado na casa de um amigo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-183', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せて$$),
        (2, $$せて$$),
        (3, $$せていただきました$$),
        (3, $$せてもらいました$$),
        (4, $$せていただきます$$),
        (5, $$せてもらった$$),
        (5, $$せてもらいました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-184 — 〜ほかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-184',
    'grammar',
    'N3',
    $$〜ほかない$$,
    $$hoka nai$$,
    $$Não ter outra opção a não ser / Só resta / O jeito é$$,
    $$ほかない é usado para dizer que não existe outra opção: aquela é a única coisa possível de fazer. Equivale a "não há outra opção a não ser", "só resta" ou "o jeito é".

ほか significa "outro", "além disso". A ideia literal é "não há outra coisa além disso".

O sentido é praticamente o mesmo de しかない, mas ほかない soa mais formal e escrito. É comum em textos, notícias e situações sérias.

A situação costuma ser difícil, e a pessoa aceita a única saída com resignação. Por exemplo, "o trem parou, então só resta voltar a pé".

As formas ほかはない e ほかありません também são usadas.$$,
    $$Na conversa do dia a dia, しかない é mais comum. ほかない aparece mais em textos formais.

Uma forma ainda mais formal é よりほかない, que aparece no N2.

Assim como しかない, ほかない também pode expressar determinação: やるほかない (o jeito é encarar).$$,
    $$Verbo na forma de dicionário + ほかない
Verbo + ほかはない
Verbo + ほかありません (educado)

Escrita: ほかない / 外ない$$,
    $$ほかない$$,
    $$ほかない|ほかありません|ほかはない|外ない$$,
    ARRAY['ほか', 'ない']::text[],
    ARRAY['ほかない', 'ほかはない', 'ほかありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-184', $$電車が止まったので、歩いて帰るほかない。$$, $$でんしゃがとまったので、あるいてかえるほかない。$$, $$O trem parou, então só resta voltar a pé.$$),
    ('n3-grammar-184', $$誰も手伝ってくれないので、一人でやるほかない。$$, $$だれもてつだってくれないので、ひとりでやるほかない。$$, $$Ninguém vai me ajudar, então o jeito é fazer sozinho.$$),
    ('n3-grammar-184', $$会議で決まったことなので、従うほかありません。$$, $$かいぎできまったことなので、したがうほかありません。$$, $$Foi decidido na reunião, então não há outra opção a não ser seguir.$$),
    ('n3-grammar-184', $$薬が効かないなら、手術するほかない。$$, $$くすりがきかないなら、しゅじゅつするほかない。$$, $$Se o remédio não funcionar, não há outra opção a não ser operar.$$),
    ('n3-grammar-184', $$ここまで来たら、やるほかはない。$$, $$ここまできたら、やるほかはない。$$, $$Já que chegamos até aqui, só resta fazer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$最終バスが行ってしまったので、タクシーで行く____。$$, $$O último ônibus já foi, então só resta ir de táxi.$$),
        (2, $$雨がやまないから、ここで待つ____。$$, $$A chuva não para, então o jeito é esperar aqui.$$),
        (3, $$自分が悪いのだから、謝る____。$$, $$A culpa é minha, então só resta pedir desculpas.$$),
        (4, $$道がわからないので、人に聞く____。$$, $$Não sei o caminho, então o jeito é perguntar a alguém.$$),
        (5, $$会社の決定だから、受け入れる____。$$, $$É uma decisão da empresa, então não há outra opção a não ser aceitar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-184', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほかない$$),
        (1, $$ほかありません$$),
        (2, $$ほかない$$),
        (2, $$ほかありません$$),
        (3, $$ほかない$$),
        (3, $$ほかありません$$),
        (4, $$ほかない$$),
        (4, $$ほかありません$$),
        (5, $$ほかない$$),
        (5, $$ほかありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-185 — 〜たところ（結果）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-185',
    'grammar',
    'N3',
    $$〜たところ（結果）$$,
    $$ta tokoro (kekka)$$,
    $$Quando (fiz)... / Ao (fazer)... descobri que$$,
    $$Nesse uso, たところ indica que a pessoa fez algo e, como resultado, descobriu ou percebeu alguma coisa. Equivale a "quando fiz..." ou "ao fazer..., descobri que...".

A primeira parte é uma ação feita de propósito, geralmente uma tentativa ou verificação, como perguntar, ligar, pesquisar ou experimentar. A segunda parte mostra o resultado, muitas vezes inesperado.

Por exemplo, "quando liguei para a loja, descobri que hoje estava fechada" ou "ao consultar o professor, recebi um ótimo conselho".

A segunda parte descreve um fato que já aconteceu, e não pode ser uma vontade ou um pedido.

Esse uso é diferente da たところ do N4, que significa "acabei de fazer".$$,
    $$Esse uso é parecido com たら no sentido de descoberta, mas たところ soa mais formal e é comum em relatórios e narrativas.

A primeira ação costuma ser intencional, e a segunda, uma constatação.

Para distinguir das outras たところ, observe se a segunda parte é um resultado: se for, é este uso.$$,
    $$Verbo na forma た + ところ、 + Resultado / Descoberta

Com verbos cuja forma た termina em だ: だところ$$,
    $$たところ$$,
    $$たところ|だところ$$,
    ARRAY['た', 'ところ']::text[],
    ARRAY['たところ', 'だところ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-185', $$先生に相談したところ、いいアドバイスをもらえた。$$, $$せんせいにそうだんしたところ、いいアドバイスをもらえた。$$, $$Quando consultei o professor, recebi um ótimo conselho.$$),
    ('n3-grammar-185', $$店に電話したところ、今日は休みだった。$$, $$みせにでんわしたところ、きょうはやすみだった。$$, $$Quando liguei para a loja, descobri que hoje estava fechada.$$),
    ('n3-grammar-185', $$調べたところ、彼の話は本当だとわかった。$$, $$しらべたところ、かれのはなしはほんとうだとわかった。$$, $$Ao pesquisar, descobri que a história dele era verdadeira.$$),
    ('n3-grammar-185', $$新しい薬を飲んだところ、すぐに治った。$$, $$あたらしいくすりをのんだところ、すぐになおった。$$, $$Quando tomei o remédio novo, melhorei logo.$$),
    ('n3-grammar-185', $$頼んでみたところ、快く引き受けてくれた。$$, $$たのんでみたところ、こころよくひきうけてくれた。$$, $$Quando pedi, ele aceitou de bom grado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅員に聞い____、電車は遅れているそうだ。$$, $$Quando perguntei ao funcionário da estação, soube que o trem está atrasado.$$),
        (2, $$病院で検査し____、問題はなかった。$$, $$Quando fiz os exames no hospital, não havia nenhum problema.$$),
        (3, $$ドアを開け____、誰もいなかった。$$, $$Quando abri a porta, não havia ninguém.$$),
        (4, $$友達に勧められた本を読ん____、とてもおもしろかった。$$, $$Quando li o livro que meu amigo recomendou, achei muito interessante.$$),
        (5, $$値段を聞い____、思ったより安かった。$$, $$Quando perguntei o preço, era mais barato do que eu pensava.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-185', sentence, translation FROM src ORDER BY k
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

-- n3-grammar-186 — 〜ないわけにはいかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-186',
    'grammar',
    'N3',
    $$〜ないわけにはいかない$$,
    $$nai wake ni wa ikanai$$,
    $$Não ter como não / Ser obrigado a / Ter que$$,
    $$ないわけにはいかない é usado para dizer que, por razões sociais, morais ou de responsabilidade, a pessoa não pode deixar de fazer algo. Equivale a "não tenho como não", "sou obrigado a" ou "tenho que".

É uma dupla negação: "não fazer não é possível". O resultado é uma obrigação, muitas vezes contra a vontade da pessoa, mas aceita por senso de dever.

Por exemplo, "eu prometi, então não tenho como não ir" ou "o professor pediu, então tenho que ajudar".

A diferença em relação a なければならない é o motivo. なければならない é uma obrigação geral. ないわけにはいかない destaca que, considerando a situação e as pessoas envolvidas, não seria aceitável deixar de fazer.$$,
    $$É muito comum em situações sociais, como casamentos, funerais e compromissos de trabalho.

ないわけにもいかない, com も, mostra que a pessoa está num dilema: não quer fazer, mas também não pode deixar de fazer.

Compare com わけにはいかない (sem ない), que significa "não posso fazer".$$,
    $$Verbo na forma ない + わけにはいかない
Verbo na forma ない + わけにはいきません (educado)

Variação: ないわけにもいかない$$,
    $$ないわけにはいかない$$,
    $$ないわけにはいかない|ないわけにはいきません|ないわけにもいかない$$,
    ARRAY['ない', 'わけ', 'には', 'いかない']::text[],
    ARRAY['ないわけにはいかない', 'ないわけにはいきません', 'ないわけにもいかない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-186', $$約束したから、行かないわけにはいかない。$$, $$やくそくしたから、いかないわけにはいかない。$$, $$Eu prometi, então não tenho como não ir.$$),
    ('n3-grammar-186', $$明日は試験だから、勉強しないわけにはいかない。$$, $$あしたはしけんだから、べんきょうしないわけにはいかない。$$, $$Amanhã tem prova, então não tenho como não estudar.$$),
    ('n3-grammar-186', $$先生に頼まれたので、手伝わないわけにはいかない。$$, $$せんせいにたのまれたので、てつだわないわけにはいかない。$$, $$O professor me pediu, então tenho que ajudar.$$),
    ('n3-grammar-186', $$社長が出席するので、私も出ないわけにはいきません。$$, $$しゃちょうがしゅっせきするので、わたしもでないわけにはいきません。$$, $$O presidente vai comparecer, então eu também sou obrigado a ir.$$),
    ('n3-grammar-186', $$親友の結婚式なので、行かないわけにはいかない。$$, $$しんゆうのけっこんしきなので、いかないわけにはいかない。$$, $$É o casamento do meu melhor amigo, então não tenho como não ir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大事な会議なので、出席し____。$$, $$É uma reunião importante, então tenho que comparecer.$$),
        (2, $$親が心配しているので、連絡し____。$$, $$Meus pais estão preocupados, então não tenho como não entrar em contato.$$),
        (3, $$迷惑をかけたので、謝ら____。$$, $$Causei transtorno, então sou obrigado a pedir desculpas.$$),
        (4, $$お世話になった人なので、お礼を言わ____。$$, $$É uma pessoa que me ajudou muito, então tenho que agradecer.$$),
        (5, $$雨でも仕事なので、行か____。$$, $$Mesmo com chuva, é trabalho, então não tenho como não ir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-186', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないわけにはいかない$$),
        (1, $$ないわけにはいきません$$),
        (2, $$ないわけにはいかない$$),
        (2, $$ないわけにはいきません$$),
        (3, $$ないわけにはいかない$$),
        (3, $$ないわけにはいきません$$),
        (4, $$ないわけにはいかない$$),
        (4, $$ないわけにはいきません$$),
        (5, $$ないわけにはいかない$$),
        (5, $$ないわけにはいきません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-187 — 〜のではないか・〜のではないだろうか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-187',
    'grammar',
    'N3',
    $$〜のではないか・〜のではないだろうか$$,
    $$no de wa nai ka / no de wa nai darou ka$$,
    $$Será que não...? / Acho que talvez / Não seria...?$$,
    $$のではないか e のではないだろうか são usados para expressar uma suposição ou uma opinião de forma cautelosa. Equivalem a "será que não...?", "acho que talvez..." ou "não seria...?".

Embora tenham forma de pergunta negativa, o sentido é afirmativo: quem fala acredita que aquilo provavelmente é verdade, mas prefere não afirmar com certeza.

Elas são muito usadas para:
• Dar opiniões suavemente, principalmente em reuniões e textos: "este plano não seria um pouco difícil?".
• Expressar preocupação: "estou preocupado se vamos nos atrasar".
• Fazer suposições: "ele já não teria ido embora?".

のではないだろうか é mais formal e comum na escrita. のではないでしょうか é a versão educada para a conversa. Na fala casual, usa-se んじゃないか.$$,
    $$Com substantivos e adjetivos な, não se esqueça do な: 無理なのではないか.

Em redações e artigos, のではないだろうか é uma das formas mais usadas para apresentar uma ideia sem impor.

Compare com ではないか (N4), que vem diretamente depois de substantivos, sem の.$$,
    $$Verbo / Adjetivo (forma simples) + のではないか
Adjetivo な / Substantivo + な + のではないか
… + のではないだろうか (formal, escrito)
… + のではないでしょうか (educado)
… + のではないかと思う / と心配だ

Fala casual: んじゃないか / んじゃない？$$,
    $$のではないか$$,
    $$のではないか|のではないだろうか|のではないでしょうか|んじゃないか|んじゃないだろうか$$,
    ARRAY['の', 'では', 'ない', 'か']::text[],
    ARRAY['のではないか', 'のではないだろうか', 'のではないでしょうか', 'んじゃないか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-187', $$電気が消えている。彼はもう帰ったのではないか。$$, $$でんきがきえている。かれはもうかえったのではないか。$$, $$As luzes estão apagadas. Será que ele já não foi embora?$$),
    ('n3-grammar-187', $$この計画は少し難しいのではないでしょうか。$$, $$このけいかくはすこしむずかしいのではないでしょうか。$$, $$Este plano não seria um pouco difícil?$$),
    ('n3-grammar-187', $$この雲を見ると、明日は雨が降るのではないだろうか。$$, $$このくもをみると、あしたはあめがふるのではないだろうか。$$, $$Vendo essas nuvens, acho que talvez chova amanhã.$$),
    ('n3-grammar-187', $$彼女は何か悩んでいるんじゃないか。$$, $$かのじょはなにかなやんでいるんじゃないか。$$, $$Será que ela não está preocupada com alguma coisa?$$),
    ('n3-grammar-187', $$もっといい方法があるのではないかと思う。$$, $$もっといいほうほうがあるのではないかとおもう。$$, $$Acho que talvez exista um jeito melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道が混んでいるから、遅れる____と心配だ。$$, $$O trânsito está ruim, então estou preocupado se vamos nos atrasar.$$),
        (2, $$この値段は少し高い____。$$, $$Este preço não seria um pouco alto?$$),
        (3, $$彼はいつも笑っているが、本当は寂しい____と思う。$$, $$Ele está sempre sorrindo, mas acho que talvez, no fundo, se sinta sozinho.$$),
        (4, $$いろいろ試したが、この方法が一番いい____。$$, $$Tentei várias coisas, mas não seria este método o melhor?$$),
        (5, $$電気がついているから、まだ誰かいる____。$$, $$A luz está acesa, então será que ainda não tem alguém?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-187', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のではないか$$),
        (2, $$のではないでしょうか$$),
        (2, $$のではないだろうか$$),
        (3, $$のではないか$$),
        (4, $$のではないでしょうか$$),
        (4, $$のではないだろうか$$),
        (5, $$のではないか$$),
        (5, $$のではないだろうか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-188 — 〜とのことだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-188',
    'grammar',
    'N3',
    $$〜とのことだ$$,
    $$to no koto da$$,
    $$Dizem que / Mandou dizer que / Segundo o recado$$,
    $$とのことだ é usado para repassar uma informação ou um recado que se recebeu de outra pessoa, de forma formal e objetiva. Equivale a "dizem que", "mandou dizer que" ou "segundo o recado".

Ele é muito comum no trabalho, para transmitir mensagens: "o Tanaka ligou e disse que vai se atrasar um pouco" ou "o gerente mandou avisar que vai faltar hoje".

Também aparece com によると, para indicar a fonte da informação, como uma previsão do tempo ou um comunicado.

とのことだ é mais formal que そうだ e que ということだ. Por isso, é muito usado em e-mails, recados e relatos profissionais.

A forma とのことでした, no passado, é comum ao repassar um recado já recebido.$$,
    $$Em recados por telefone no trabalho, とのことです é uma das formas mais naturais de transmitir a mensagem.

〜からよろしくとのことでした ("fulano mandou lembranças") é uma frase muito comum.

Na conversa casual, os japoneses preferem そうだ ou って.$$,
    $$Frase (forma simples) + とのことだ / とのことです
Pessoa + から、 + Frase + とのことでした (recado recebido)
Fonte + によると、 + Frase + とのことです$$,
    $$とのことだ$$,
    $$とのことだ|とのことです|とのこと$$,
    ARRAY['との', 'こと', 'だ']::text[],
    ARRAY['とのことだ', 'とのことです', 'とのことでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-188', $$田中さんから電話があって、少し遅れるとのことです。$$, $$たなかさんからでんわがあって、すこしおくれるとのことです。$$, $$O Tanaka ligou e disse que vai se atrasar um pouco.$$),
    ('n3-grammar-188', $$部長は今日、休むとのことだ。$$, $$ぶちょうはきょう、やすむとのことだ。$$, $$O gerente mandou avisar que vai faltar hoje.$$),
    ('n3-grammar-188', $$天気予報によると、明日は晴れるとのことです。$$, $$てんきよほうによると、あしたははれるとのことです。$$, $$Segundo a previsão do tempo, amanhã vai fazer sol.$$),
    ('n3-grammar-188', $$先生によると、試験は来週行われるとのことです。$$, $$せんせいによると、しけんはらいしゅうおこなわれるとのことです。$$, $$Segundo o professor, a prova será na semana que vem.$$),
    ('n3-grammar-188', $$社長から、皆さんによろしくとのことでした。$$, $$しゃちょうから、みなさんによろしくとのことでした。$$, $$O presidente mandou lembranças a todos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$山田さんから連絡があり、会議に出られない____。$$, $$O Yamada entrou em contato e disse que não poderá participar da reunião.$$),
        (2, $$受付から、お客様は三時にいらっしゃる____。$$, $$Segundo a recepção, o cliente virá às três.$$),
        (3, $$母から、今日は早く帰ってきなさい____。$$, $$Minha mãe mandou dizer para eu voltar cedo hoje.$$),
        (4, $$医者によると、一週間で治る____。$$, $$Segundo o médico, vai sarar em uma semana.$$),
        (5, $$課長から、明日は休みにする____。$$, $$O chefe de seção mandou avisar que amanhã será folga.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-188', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とのことです$$),
        (1, $$とのことだ$$),
        (2, $$とのことです$$),
        (2, $$とのことだ$$),
        (3, $$とのことです$$),
        (3, $$とのことだ$$),
        (3, $$とのことでした$$),
        (4, $$とのことです$$),
        (4, $$とのことだ$$),
        (5, $$とのことです$$),
        (5, $$とのことだ$$),
        (5, $$とのことでした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-189 — 〜ないうちに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-189',
    'grammar',
    'N3',
    $$〜ないうちに$$,
    $$nai uchi ni$$,
    $$Antes que / Enquanto ainda não$$,
    $$ないうちに é usado para dizer que é bom fazer algo antes que uma situação mude, geralmente para pior. Equivale a "antes que" ou "enquanto ainda não...".

Ele junta a forma ない do verbo com うちに (enquanto). A ideia literal é "enquanto ainda não aconteceu". Por exemplo, "vamos voltar antes que escureça" ou "coma antes que esfrie".

A segunda parte costuma ser uma ação recomendada, um pedido ou uma intenção, para aproveitar o momento antes da mudança.

Outro uso importante é com verbos de percepção, como 知らない e 気がつかない, que significam "sem perceber": "quando vi, já tinha anoitecido sem eu perceber".$$,
    $$Em comparação com 前に, ないうちに destaca mais a urgência e a ideia de aproveitar o momento.

冷めないうちに ("antes que esfrie") é uma frase muito comum ao servir comida.

知らないうちに é usado para mudanças que acontecem sem que a pessoa perceba, como o tempo passar.$$,
    $$Verbo na forma ない + うちに + Ação (antes que...)
知らない / 気がつかない + うちに + Mudança (sem perceber)$$,
    $$ないうちに$$,
    $$ないうちに$$,
    ARRAY['ない', 'うち', 'に']::text[],
    ARRAY['ないうちに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-189', $$暗くならないうちに、帰りましょう。$$, $$くらくならないうちに、かえりましょう。$$, $$Vamos voltar antes que escureça.$$),
    ('n3-grammar-189', $$雨が降らないうちに、買い物に行こう。$$, $$あめがふらないうちに、かいものにいこう。$$, $$Vamos fazer compras antes que chova.$$),
    ('n3-grammar-189', $$忘れないうちに、メモしておきます。$$, $$わすれないうちに、メモしておきます。$$, $$Vou anotar antes que eu esqueça.$$),
    ('n3-grammar-189', $$冷めないうちに、どうぞ召し上がってください。$$, $$さめないうちに、どうぞめしあがってください。$$, $$Por favor, coma antes que esfrie.$$),
    ('n3-grammar-189', $$知らないうちに、寝てしまっていた。$$, $$しらないうちに、ねてしまっていた。$$, $$Sem perceber, acabei pegando no sono.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理が冷め____、食べてください。$$, $$Coma antes que a comida esfrie, por favor.$$),
        (2, $$先生に言われたことを忘れ____、宿題をしよう。$$, $$Vou fazer a lição antes de esquecer o que o professor disse.$$),
        (3, $$子供が起き____、掃除を終わらせたい。$$, $$Quero terminar a limpeza antes que as crianças acordem.$$),
        (4, $$本を読んでいたら、気がつか____、夜になっていた。$$, $$Estava lendo e, sem perceber, já tinha anoitecido.$$),
        (5, $$雨が降ら____、洗濯物を取り込んで。$$, $$Recolha a roupa antes que chova.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-189', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないうちに$$),
        (2, $$ないうちに$$),
        (3, $$ないうちに$$),
        (4, $$ないうちに$$),
        (5, $$ないうちに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
