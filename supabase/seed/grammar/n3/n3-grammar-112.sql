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
