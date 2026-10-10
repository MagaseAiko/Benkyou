-- n4-grammar-23 — いらっしゃる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-23',
    'grammar',
    'N4',
    $$いらっしゃる$$,
    $$irassharu$$,
    $$Estar / Ir / Vir (respeitoso)$$,
    $$いらっしゃる é o verbo respeitoso (尊敬語) usado no lugar de いる (estar), 行く (ir) e 来る (vir), quando o sujeito é alguém que merece respeito, como um cliente, um professor ou um chefe.

No 尊敬語, quem fala eleva a pessoa de quem se fala. Por isso, いらっしゃる nunca é usado para si mesmo.

O sentido exato, estar, ir ou vir, é entendido pelo contexto e pelas partículas da frase.

Na forma ます, ele é irregular: em vez de いらっしゃります, diz-se いらっしゃいます. A saudação いらっしゃいませ, usada em lojas para receber clientes, vem desse verbo.$$,
    $$Para falar de si mesmo ou da própria empresa em situações formais, usa-se a forma humilde: おる no lugar de いる, e 参る no lugar de 行く e 来る.

Também é muito comum a forma いらっしゃってください, para convidar alguém respeitosamente a vir.

Outras formas respeitosas com o mesmo sentido existem, como お越しになる, mais formal, e お見えになる, para "vir".$$,
    $$Pessoa respeitada + が / は + Lugar + に + いらっしゃる (estar)
Pessoa respeitada + が / は + Lugar + へ / に + いらっしゃる (ir / vir)

Educado: いらっしゃいます (forma irregular)
Passado: いらっしゃった / いらっしゃいました
Saudação: いらっしゃいませ$$,
    $$いらっしゃる$$,
    $$いらっしゃ$$,
    ARRAY['いらっしゃる']::text[],
    ARRAY['いらっしゃる', 'いらっしゃいます', 'いらっしゃった', 'いらっしゃいました', 'いらっしゃいませ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-23', $$社長は今、会議室にいらっしゃいます。$$, $$しゃちょうはいま、かいぎしつにいらっしゃいます。$$, $$O presidente está na sala de reuniões agora.$$),
    ('n4-grammar-23', $$先生は明日、京都へいらっしゃるそうです。$$, $$せんせいはあした、きょうとへいらっしゃるそうです。$$, $$Dizem que o professor vai a Kyoto amanhã.$$),
    ('n4-grammar-23', $$いらっしゃいませ。何名様ですか。$$, $$いらっしゃいませ。なんめいさまですか。$$, $$Bem-vindo. Quantas pessoas?$$),
    ('n4-grammar-23', $$田中様がいらっしゃいました。$$, $$たなかさまがいらっしゃいました。$$, $$O senhor Tanaka chegou.$$),
    ('n4-grammar-23', $$週末はどこかへいらっしゃいますか。$$, $$しゅうまつはどこかへいらっしゃいますか。$$, $$O senhor vai a algum lugar no fim de semana?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$部長は今、どちらに____か。$$, $$Onde o gerente está agora?$$),
        (2, $$先ほど、先生がこちらに____。$$, $$Há pouco, o professor veio aqui.$$),
        (3, $$社長は毎朝八時に会社に____。$$, $$O presidente chega à empresa às oito toda manhã.$$),
        (4, $$お客様が____ので、お茶を出してください。$$, $$Chegou um cliente, então sirva o chá, por favor.$$),
        (5, $$「____ませ。」と店員が言った。$$, $$"Bem-vindo!", disse o atendente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-23', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いらっしゃいます$$),
        (2, $$いらっしゃいました$$),
        (3, $$いらっしゃいます$$),
        (4, $$いらっしゃった$$),
        (4, $$いらっしゃいました$$),
        (5, $$いらっしゃい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
