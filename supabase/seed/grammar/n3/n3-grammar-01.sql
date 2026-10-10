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
