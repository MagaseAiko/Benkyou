-- n1-grammar-78 — 〜もしないで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-78',
    'grammar',
    'N1',
    $$〜もしないで$$,
    $$mo shinaide$$,
    $$Sem nem / Nem sequer / Sem ao menos$$,
    $$もしないで indica que alguém nem sequer fez algo básico antes de fazer outra coisa. Equivale a "sem nem" ou "sem ao menos".

O tom é de crítica, porque a pessoa pulou algo que deveria ter feito. Por exemplo, "sem nem experimentar, disse que era ruim".

A forma もせずに é mais formal e tem o mesmo sentido.$$,
    $$Combinações comuns são 見もしないで, 聞きもしないで, 調べもしないで e 勉強もしないで.

É parecido com ないで, mas もしないで reforça a crítica.$$,
    $$Verbo (forma ます sem ます) + もしないで
Verbo (forma ます sem ます) + もせずに
Substantivo (ação) + もしないで$$,
    $$もしないで$$,
    $$もしないで|もせずに|もせず$$,
    ARRAY['も', 'しないで']::text[],
    ARRAY['もしないで', 'もせずに', 'もせず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-78', $$食べもしないで、まずいと言うな。$$, $$たべもしないで、まずいというな。$$, $$Não diga que é ruim sem nem experimentar.$$),
    ('n1-grammar-78', $$彼は勉強もしないで、試験を受けた。$$, $$かれはべんきょうもしないで、しけんをうけた。$$, $$Ele fez a prova sem nem estudar.$$),
    ('n1-grammar-78', $$よく調べもせずに、契約してしまった。$$, $$よくしらべもせずに、けいやくしてしまった。$$, $$Assinei o contrato sem nem pesquisar direito.$$),
    ('n1-grammar-78', $$挨拶もしないで帰るなんて、失礼だ。$$, $$あいさつもしないでかえるなんて、しつれいだ。$$, $$Ir embora sem nem cumprimentar é falta de educação.$$),
    ('n1-grammar-78', $$彼女は見もしないで、手紙を捨てた。$$, $$かのじょはみもしないで、てがみをすてた。$$, $$Ela jogou a carta fora sem nem olhar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$人の話を聞き____、反対するな。$$, $$Não seja contra sem nem ouvir o que os outros dizem.$$),
        (2, $$彼は返事____、部屋を出ていった。$$, $$Ele saiu do quarto sem nem responder.$$),
        (3, $$確かめ____、うわさを信じてしまった。$$, $$Acreditei no boato sem nem confirmar.$$),
        (4, $$一度も練習____、本番に出た。$$, $$Entrou na apresentação sem nem ensaiar uma vez.$$),
        (5, $$読み____、本を返した。$$, $$Devolvi o livro sem nem ler.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-78', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もしないで$$),
        (1, $$もせずに$$),
        (2, $$もしないで$$),
        (2, $$もせずに$$),
        (2, $$もせず$$),
        (3, $$もしないで$$),
        (3, $$もせずに$$),
        (4, $$もしないで$$),
        (4, $$もせずに$$),
        (4, $$もせず$$),
        (5, $$もしないで$$),
        (5, $$もせずに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
