-- n4-grammar-57 — 〜に気がつく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-57',
    'grammar',
    'N4',
    $$〜に気がつく$$,
    $$ni ki ga tsuku$$,
    $$Perceber / Notar / Dar-se conta de$$,
    $$に気がつく é usado para dizer que alguém percebeu ou notou algo. Equivale a "perceber", "notar" ou "dar-se conta de".

A coisa percebida vem antes de に. Pode ser um substantivo, como um erro ou uma mudança, ou uma frase inteira transformada em substantivo com こと, como "perceber que esqueci o guarda-chuva".

A expressão indica um momento de percepção: antes a pessoa não sabia, e de repente notou. Por isso, é muito usada no passado, com 気がついた.

A forma curta 気づく tem exatamente o mesmo sentido e é muito comum tanto na fala quanto na escrita.$$,
    $$気がつく também pode descrever uma pessoa atenciosa, que percebe o que os outros precisam, como em よく気がつく人.

Não confunda com 気をつける, que significa "tomar cuidado". A partícula e o verbo mudam o sentido.

Em histórias, a frase 気がつくと significa "quando dei por mim..." e introduz algo que aconteceu sem a pessoa perceber.$$,
    $$Substantivo + に + 気がつく
Frase (forma simples) + こと + に + 気がつく

Forma curta: に気づく
Passado: に気がついた / に気がつきました
Negativo: に気がつかない

Escrita: 気がつく / 気が付く / 気づく / 気付く$$,
    $$に気がつく$$,
    $$気がつ|気が付|気づ|気付$$,
    ARRAY['に', '気', 'が', 'つく']::text[],
    ARRAY['に気がつく', 'に気づく', 'に気が付く', 'に気付く']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-57', $$財布がないことに気がつきました。$$, $$さいふがないことにきがつきました。$$, $$Percebi que estava sem a carteira.$$),
    ('n4-grammar-57', $$彼は自分の間違いに気がついた。$$, $$かれはじぶんのまちがいにきがついた。$$, $$Ele percebeu o próprio erro.$$),
    ('n4-grammar-57', $$電車を降りてから、傘を忘れたことに気がついた。$$, $$でんしゃをおりてから、かさをわすれたことにきがついた。$$, $$Depois de descer do trem, percebi que tinha esquecido o guarda-chuva.$$),
    ('n4-grammar-57', $$先生は私の変化にすぐ気づいた。$$, $$せんせいはわたしのへんかにすぐきづいた。$$, $$O professor notou logo a minha mudança.$$),
    ('n4-grammar-57', $$家に着いて、鍵をかけていないことに気がつきました。$$, $$いえについて、かぎをかけていないことにきがつきました。$$, $$Cheguei em casa e me dei conta de que não tinha trancado a porta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅に着いて、切符をなくしたことに____。$$, $$Cheguei à estação e percebi que tinha perdido a passagem.$$),
        (2, $$誰も私のミスに____なかった。$$, $$Ninguém percebeu o meu erro.$$),
        (3, $$彼女が髪を切ったことに、すぐ____。$$, $$Percebi logo que ela tinha cortado o cabelo.$$),
        (4, $$後ろに人がいることに____、びっくりした。$$, $$Percebi que havia alguém atrás de mim e levei um susto.$$),
        (5, $$間違いに____ら、すぐ直してください。$$, $$Se notar algum erro, corrija imediatamente, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-57', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$気がつきました$$),
        (1, $$気がついた$$),
        (1, $$気づきました$$),
        (1, $$気づいた$$),
        (2, $$気がつか$$),
        (2, $$気づか$$),
        (3, $$気がつきました$$),
        (3, $$気がついた$$),
        (3, $$気づきました$$),
        (3, $$気づいた$$),
        (4, $$気がついて$$),
        (4, $$気づいて$$),
        (5, $$気がついた$$),
        (5, $$気づいた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
