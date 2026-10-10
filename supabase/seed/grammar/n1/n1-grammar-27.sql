-- n1-grammar-27 — 〜が早いか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-27',
    'grammar',
    'N1',
    $$〜が早いか$$,
    $$ga hayai ka$$,
    $$Mal / Assim que / No instante em que$$,
    $$が早いか indica que, no mesmo instante em que uma ação acontece, outra ação começa imediatamente. Equivale a "mal..." ou "no instante em que".

A pessoa destaca a rapidez com que a segunda ação acontece. Por exemplo, "mal chegou em casa, já saiu correndo de novo".

É uma expressão literária, mais comum na escrita.$$,
    $$A segunda parte é um fato que já aconteceu, por isso costuma estar no passado.

Não se usa para falar de si mesmo nem com pedidos ou intenções.

É parecido com や否や e とたんに.$$,
    $$Verbo (forma dicionário) + が早いか + Verbo (forma た)$$,
    $$が早いか$$,
    $$が早いか|がはやいか$$,
    ARRAY['が', '早い', 'か']::text[],
    ARRAY['が早いか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-27', $$子供は家に帰るが早いか、遊びに出かけた。$$, $$こどもはいえにかえるがはやいか、あそびにでかけた。$$, $$Mal chegou em casa, a criança saiu para brincar.$$),
    ('n1-grammar-27', $$ベルが鳴るが早いか、学生たちは教室を飛び出した。$$, $$ベルがなるがはやいか、がくせいたちはきょうしつをとびだした。$$, $$No instante em que o sinal tocou, os alunos saíram correndo da sala.$$),
    ('n1-grammar-27', $$彼は布団に入るが早いか、眠ってしまった。$$, $$かれはふとんにはいるがはやいか、ねむってしまった。$$, $$Mal se deitou, ele adormeceu.$$),
    ('n1-grammar-27', $$店が開くが早いか、客が押し寄せた。$$, $$みせがあくがはやいか、きゃくがおしよせた。$$, $$Assim que a loja abriu, os clientes invadiram.$$),
    ('n1-grammar-27', $$料理が出るが早いか、彼は食べ始めた。$$, $$りょうりがでるがはやいか、かれはたべはじめた。$$, $$Mal a comida foi servida, ele começou a comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は電話を切る____、泣き出した。$$, $$Mal desligou o telefone, ela começou a chorar.$$),
        (2, $$ドアが開く____、犬が走ってきた。$$, $$No instante em que a porta abriu, o cachorro veio correndo.$$),
        (3, $$給料をもらう____、全部使ってしまった。$$, $$Mal recebeu o salário, gastou tudo.$$),
        (4, $$試合が終わる____、選手たちは抱き合った。$$, $$Assim que a partida terminou, os jogadores se abraçaram.$$),
        (5, $$彼は席に着く____、パソコンを開いた。$$, $$Mal se sentou, ele abriu o computador.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-27', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$が早いか$$),
        (2, $$が早いか$$),
        (3, $$が早いか$$),
        (4, $$が早いか$$),
        (5, $$が早いか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
