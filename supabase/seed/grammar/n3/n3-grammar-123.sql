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
