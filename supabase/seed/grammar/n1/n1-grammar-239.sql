-- n1-grammar-239 — 〜や否や
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-239',
    'grammar',
    'N1',
    $$〜や否や$$,
    $$ya ina ya$$,
    $$Mal / Assim que / No instante em que$$,
    $$や否や indica que, logo depois de uma ação, outra aconteceu imediatamente. Equivale a "mal..." ou "no instante em que".

É uma expressão muito formal e literária, que destaca a rapidez. Por exemplo, "mal soou o sinal, os alunos saíram correndo".

A forma curta や também tem o mesmo sentido.$$,
    $$É parecido com が早いか e とたんに.

A segunda parte é um fato já ocorrido, por isso costuma estar no passado.

Não se usa com intenções ou pedidos.$$,
    $$Verbo (forma dicionário) + や否や + Ação seguinte (passado)
Verbo (forma dicionário) + や + Ação seguinte$$,
    $$や否や$$,
    $$や否や|やいなや$$,
    ARRAY['や', '否', 'や']::text[],
    ARRAY['や否や', 'やいなや']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-239', $$ベルが鳴るや否や、生徒たちは教室を飛び出した。$$, $$ベルがなるやいなや、せいとたちはきょうしつをとびだした。$$, $$Mal tocou o sinal, os alunos saíram correndo da sala.$$),
    ('n1-grammar-239', $$彼は家に着くや否や、ベッドに倒れ込んだ。$$, $$かれはいえにつくやいなや、ベッドにたおれこんだ。$$, $$Mal chegou em casa, ele desabou na cama.$$),
    ('n1-grammar-239', $$その知らせを聞くや否や、彼女は泣き出した。$$, $$そのしらせをきくやいなや、かのじょはなきだした。$$, $$No instante em que ouviu a notícia, ela começou a chorar.$$),
    ('n1-grammar-239', $$新商品は発売されるや否や、売り切れた。$$, $$しんしょうひんははつばいされるやいなや、うりきれた。$$, $$Mal foi lançado, o novo produto esgotou.$$),
    ('n1-grammar-239', $$ドアが開くや否や、客が店内に殺到した。$$, $$ドアがあくやいなや、きゃくがてんないにさっとうした。$$, $$No instante em que a porta abriu, os clientes invadiram a loja.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$試合が終わる____、選手たちは抱き合った。$$, $$Mal a partida terminou, os jogadores se abraçaram.$$),
        (2, $$彼は電車に乗る____、眠ってしまった。$$, $$Mal entrou no trem, ele adormeceu.$$),
        (3, $$先生が教室を出る____、学生たちは騒ぎ始めた。$$, $$No instante em que o professor saiu da sala, os alunos começaram a fazer bagunça.$$),
        (4, $$チケットは販売が始まる____、完売した。$$, $$Mal começaram as vendas, os ingressos esgotaram.$$),
        (5, $$犬は私の顔を見る____、しっぽを振った。$$, $$Assim que viu meu rosto, o cachorro abanou o rabo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-239', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$や否や$$),
        (1, $$やいなや$$),
        (2, $$や否や$$),
        (2, $$やいなや$$),
        (3, $$や否や$$),
        (3, $$やいなや$$),
        (4, $$や否や$$),
        (4, $$やいなや$$),
        (5, $$や否や$$),
        (5, $$やいなや$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
