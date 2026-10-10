-- n3-grammar-68 — 〜なんか・〜なんて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-68',
    'grammar',
    'N3',
    $$〜なんか・〜なんて$$,
    $$nanka / nante$$,
    $$Coisas como / Tipo / Uma coisa dessas$$,
    $$なんか e なんて são partículas casuais com vários usos, muitas vezes ligados a emoção.

• Exemplo leve (なんか): como など, dá uma sugestão sem insistir, como "que tal um chá ou algo assim?".
• Desvalorização ou modéstia (なんか / なんて): mostra que quem fala considera aquilo pouco importante, ou se diminui por modéstia, como "eu ainda sou muito fraco" ou "lição, não quero fazer".
• Surpresa ou indignação (なんて): depois de uma frase, mostra espanto ou crítica, como "ele mentir? que horror!" ou "não imaginava que ele viria".

なんか costuma vir depois de substantivos. なんて pode vir depois de substantivos e também de frases inteiras, principalmente no uso de surpresa.

Ambos são informais. Em situações formais, usa-se など.$$,
    $$Cuidado ao usar なんか com coisas de outras pessoas, porque pode soar como desprezo.

なんて também aparece em なんて + adjetivo, como なんてきれいなんだ ("que lindo!"), com sentido de exclamação.

Na fala, なんか também é usado sozinho como "tipo..." ou "sei lá...", para hesitar.$$,
    $$Substantivo + なんか / なんて (desvalorização / exemplo)
Substantivo + なんか + どうですか (sugestão leve)
Frase (forma simples) + なんて + Reação (surpresa / crítica)
Pronome + なんか / なんて (modéstia: 私なんか)$$,
    $$なんか$$,
    $$なんか|なんて$$,
    ARRAY['なんか', 'なんて']::text[],
    ARRAY['なんか', 'なんて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-68', $$私なんか、まだまだです。$$, $$わたしなんか、まだまだです。$$, $$Eu ainda tenho muito a aprender.$$),
    ('n3-grammar-68', $$彼が来るなんて、思わなかった。$$, $$かれがくるなんて、おもわなかった。$$, $$Jamais imaginei que ele viria.$$),
    ('n3-grammar-68', $$今日は疲れたから、宿題なんか、やりたくない。$$, $$きょうはつかれたから、しゅくだいなんか、やりたくない。$$, $$Hoje estou cansado, lição é a última coisa que quero fazer.$$),
    ('n3-grammar-68', $$休憩しましょう。お茶なんかどうですか。$$, $$きゅうけいしましょう。おちゃなんかどうですか。$$, $$Vamos fazer uma pausa. Que tal um chá ou algo assim?$$),
    ('n3-grammar-68', $$友達にうそをつくなんて、ひどい。$$, $$ともだちにうそをつくなんて、ひどい。$$, $$Mentir para um amigo? Que horror.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人で外国に行く____、すごいね。$$, $$Ir sozinho para o exterior? Que incrível!$$),
        (2, $$今日は勉強____したくない。$$, $$Hoje não estou com a menor vontade de estudar.$$),
        (3, $$お土産に、甘い物____どうですか。$$, $$Que tal um doce ou algo assim de lembrancinha?$$),
        (4, $$私____、まだまだ下手です。$$, $$Eu ainda sou muito ruim nisso.$$),
        (5, $$あんなに強い彼が負ける____、信じられない。$$, $$Ele, tão forte, perder? Não dá para acreditar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-68', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なんて$$),
        (2, $$なんか$$),
        (2, $$なんて$$),
        (3, $$なんか$$),
        (4, $$なんか$$),
        (4, $$なんて$$),
        (5, $$なんて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
