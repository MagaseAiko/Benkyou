-- n4-grammar-56 — なさる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-56',
    'grammar',
    'N4',
    $$なさる$$,
    $$nasaru$$,
    $$Fazer (respeitoso)$$,
    $$なさる é o verbo respeitoso (尊敬語) usado no lugar de する (fazer), quando o sujeito é alguém que merece respeito, como um cliente, um professor ou um superior.

No 尊敬語, quem fala eleva a pessoa que faz a ação. Por isso, なさる nunca é usado para falar das próprias ações. Para isso, usa-se a forma humilde いたす.

Com verbos do tipo "substantivo + する", basta trocar する por なさる, como em 研究なさる e 結婚なさる.

Na forma ます, ele é irregular: em vez de なさります, diz-se なさいます. É muito comum em atendimento ao cliente, como na pergunta "o que o senhor vai querer?".$$,
    $$Lembre o par: する → なさる (respeitoso) e する → いたす (humilde).

Em restaurantes e lojas, 何になさいますか é a forma educada de perguntar o que o cliente vai escolher.

Também existe a forma お / ご + verbo + になる, que tem função respeitosa parecida, como em お待ちになる.$$,
    $$Pessoa respeitada + が / は + Substantivo + を + なさる
Substantivo de ação + なさる

Educado: なさいます (forma irregular)
Passado: なさった / なさいました
Pergunta: 何になさいますか$$,
    $$なさる$$,
    $$なさ$$,
    ARRAY['なさる']::text[],
    ARRAY['なさる', 'なさいます', 'なさった', 'なさいました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-56', $$社長は週末によくゴルフをなさいます。$$, $$しゃちょうはしゅうまつによくゴルフをなさいます。$$, $$O presidente costuma jogar golfe nos fins de semana.$$),
    ('n4-grammar-56', $$先生は何を研究なさっているのですか。$$, $$せんせいはなにをけんきゅうなさっているのですか。$$, $$O que o professor está pesquisando?$$),
    ('n4-grammar-56', $$週末は何をなさいますか。$$, $$しゅうまつはなにをなさいますか。$$, $$O que o senhor vai fazer no fim de semana?$$),
    ('n4-grammar-56', $$お客様、お飲み物はどちらになさいますか。$$, $$おきゃくさま、おのみものはどちらになさいますか。$$, $$Senhor, qual bebida vai querer?$$),
    ('n4-grammar-56', $$部長は来月、結婚なさるそうです。$$, $$ぶちょうはらいげつ、けっこんなさるそうです。$$, $$Dizem que o gerente vai se casar no mês que vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生はよく旅行を____か。$$, $$O professor costuma viajar?$$),
        (2, $$社長は今、電話を____います。$$, $$O presidente está ao telefone agora.$$),
        (3, $$お飲み物は何に____か。$$, $$O que o senhor vai querer de bebida?$$),
        (4, $$田中様は先月、退院____そうです。$$, $$Dizem que o senhor Tanaka teve alta no mês passado.$$),
        (5, $$明日、課長は何時に出発____んですか。$$, $$Amanhã, a que horas o chefe de seção vai partir?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-56', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なさいます$$),
        (2, $$なさって$$),
        (3, $$なさいます$$),
        (4, $$なさった$$),
        (5, $$なさる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
