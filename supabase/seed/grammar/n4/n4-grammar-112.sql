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
