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
