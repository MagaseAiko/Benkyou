-- n2-grammar-41 — 〜か〜ないかのうちに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-41',
    'grammar',
    'N2',
    $$〜か〜ないかのうちに$$,
    $$ka ~ nai ka no uchi ni$$,
    $$Mal / Assim que / Nem bem$$,
    $$か〜ないかのうちに é usado para dizer que, quase no mesmo instante em que uma ação começa ou termina, outra coisa já acontece. Equivale a "mal...", "assim que..." ou "nem bem...".

A estrutura repete o mesmo verbo duas vezes: primeiro na forma de dicionário (ou た) + か, depois na forma ない + かのうちに. A ideia literal é "no momento em que nem se sabe se aconteceu ou não".

Por exemplo, "mal o sinal tocou, os alunos saíram da sala" ou "nem bem se sentou, ele já dormiu".

O tom é de algo extremamente rápido, quase simultâneo.

A segunda parte é um fato observado, geralmente no passado, e não uma ação planejada.$$,
    $$Essa estrutura é parecida com たとたん, mas destaca ainda mais que as duas ações quase se sobrepõem.

É um pouco literária e aparece muito em narrativas.

A segunda parte não pode ser uma vontade ou um pedido.$$,
    $$Verbo (forma de dicionário / た) + か + Verbo (forma ない) + かのうちに、 + Acontecimento imediato$$,
    $$か〜ないかのうちに$$,
    $$ないかのうちに$$,
    ARRAY['か', 'ない', 'か', 'の', 'うちに']::text[],
    ARRAY['か〜ないかのうちに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-41', $$ベルが鳴るか鳴らないかのうちに、学生たちは教室を出た。$$, $$ベルがなるかならないかのうちに、がくせいたちはきょうしつをでた。$$, $$Mal o sinal tocou, os alunos já saíram da sala.$$),
    ('n2-grammar-41', $$彼は座るか座らないかのうちに、寝てしまった。$$, $$かれはすわるかすわらないかのうちに、ねてしまった。$$, $$Nem bem se sentou, ele já caiu no sono.$$),
    ('n2-grammar-41', $$電車が止まるか止まらないかのうちに、彼はドアに向かった。$$, $$でんしゃがとまるかとまらないかのうちに、かれはドアにむかった。$$, $$Mal o trem parou, ele já foi em direção à porta.$$),
    ('n2-grammar-41', $$夜が明けるか明けないかのうちに、出発した。$$, $$よるがあけるかあけないかのうちに、しゅっぱつした。$$, $$Partimos assim que o dia começou a clarear.$$),
    ('n2-grammar-41', $$試合が始まるか始まらないかのうちに、雨が降り出した。$$, $$しあいがはじまるかはじまらないかのうちに、あめがふりだした。$$, $$Mal a partida começou, já começou a chover.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は家に着くか着か____、また出かけた。$$, $$Ela mal chegou em casa e já saiu de novo.$$),
        (2, $$料理を出すか出さ____、子供たちは食べ始めた。$$, $$Mal servi a comida, as crianças já começaram a comer.$$),
        (3, $$疲れていて、横になるかなら____、眠ってしまった。$$, $$Estava tão cansado que, nem bem me deitei, já dormi.$$),
        (4, $$信号が青になるかなら____、車が走り出した。$$, $$Mal o sinal ficou verde, os carros já arrancaram.$$),
        (5, $$先生の話が終わるか終わら____、彼は質問した。$$, $$Mal o professor terminou de falar, ele já fez uma pergunta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-41', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないかのうちに$$),
        (2, $$ないかのうちに$$),
        (3, $$ないかのうちに$$),
        (4, $$ないかのうちに$$),
        (5, $$ないかのうちに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
