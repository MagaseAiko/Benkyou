-- n4-grammar-137 — おっしゃる・申す
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-137',
    'grammar',
    'N4',
    $$おっしゃる・申す$$,
    $$ossharu / mousu$$,
    $$Dizer (respeitoso) / Dizer (humilde) / Chamar-se$$,
    $$おっしゃる e 申す são formas especiais do verbo 言う (dizer).

おっしゃる é a forma respeitosa (尊敬語). Ela é usada quando alguém que merece respeito diz algo, como um professor, um cliente ou um superior. Também aparece na pergunta educada sobre o nome de alguém: お名前は何とおっしゃいますか.

申す é a forma humilde (謙譲語). Ela é usada para as próprias palavras, ou de alguém do seu grupo, ao falar com uma pessoa respeitada. O uso mais comum é na apresentação: 〜と申します (meu nome é...).

Na forma ます, おっしゃる é irregular: diz-se おっしゃいます, e não おっしゃります.$$,
    $$申し上げる é uma forma ainda mais humilde, usada para falar diretamente com alguém muito importante, como em お礼を申し上げます.

Na apresentação em situações formais, como entrevistas de emprego, 〜と申します é a forma padrão.

Também se usa 申す em expressões fixas, como 申し訳ありません.$$,
    $$Pessoa respeitada + が + おっしゃる (respeitoso)
お名前は何とおっしゃいますか (pergunta educada)
Eu / Meu grupo + が + 申す (humilde)
〜と申します (apresentação)

Formas: おっしゃいます / おっしゃった; 申します / 申しました / 申しております$$,
    $$おっしゃる$$,
    $$おっしゃ|申し|申す$$,
    ARRAY['おっしゃる', '申す']::text[],
    ARRAY['おっしゃる', 'おっしゃいます', 'おっしゃった', '申す', '申します']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-137', $$先生がそうおっしゃいました。$$, $$せんせいがそうおっしゃいました。$$, $$O professor disse isso.$$),
    ('n4-grammar-137', $$失礼ですが、お名前は何とおっしゃいますか。$$, $$しつれいですが、おなまえはなんとおっしゃいますか。$$, $$Com licença, qual é o seu nome?$$),
    ('n4-grammar-137', $$はじめまして。私は田中と申します。$$, $$はじめまして。わたしはたなかともうします。$$, $$Muito prazer. Meu nome é Tanaka.$$),
    ('n4-grammar-137', $$部長がおっしゃったとおりにします。$$, $$ぶちょうがおっしゃったとおりにします。$$, $$Vou fazer do jeito que o gerente disse.$$),
    ('n4-grammar-137', $$父が先生によろしくと申しておりました。$$, $$ちちがせんせいによろしくともうしておりました。$$, $$Meu pai mandou lembranças ao professor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$はじめまして。ブラジルから来たマリアと____。$$, $$Muito prazer. Meu nome é Maria e vim do Brasil.$$),
        (2, $$社長が明日休むと____。$$, $$O presidente disse que vai faltar amanhã.$$),
        (3, $$失礼ですが、お名前は何と____か。$$, $$Com licença, qual é o seu nome?$$),
        (4, $$先生が____ことを、よく覚えています。$$, $$Lembro bem do que o professor disse.$$),
        (5, $$母がよろしくと____おりました。$$, $$Minha mãe mandou lembranças.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-137', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$申します$$),
        (2, $$おっしゃいました$$),
        (2, $$おっしゃった$$),
        (3, $$おっしゃいます$$),
        (4, $$おっしゃった$$),
        (5, $$申して$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
