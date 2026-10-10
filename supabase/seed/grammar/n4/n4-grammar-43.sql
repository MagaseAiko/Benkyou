-- n4-grammar-43 — または
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-43',
    'grammar',
    'N4',
    $$または$$,
    $$mata wa$$,
    $$Ou / Ou então$$,
    $$または é uma conjunção que significa "ou". Ela apresenta duas ou mais opções, das quais se escolhe uma.

É usada principalmente em linguagem formal e escrita: instruções, formulários, regras, avisos e explicações oficiais. Na conversa do dia a dia, os japoneses costumam usar か ou それか.

または pode ligar substantivos, como "caneta preta ou azul", e também frases inteiras.

Muitas vezes, aparece com vírgula antes, principalmente quando liga frases ou expressões mais longas.$$,
    $$または e あるいは têm sentido parecido. あるいは soa ainda mais formal e literário.

Em provas e formulários japoneses, または aparece muito em instruções sobre o que escolher ou levar.

Na fala informal, a forma mais natural de dizer "ou" entre substantivos é か.$$,
    $$Substantivo A + または + Substantivo B
Frase A、または + Frase B

Escrita: または / 又は$$,
    $$または$$,
    $$または|又は$$,
    ARRAY['または']::text[],
    ARRAY['または', '又は']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-43', $$黒または青のペンで書いてください。$$, $$くろまたはあおのペンでかいてください。$$, $$Escreva com caneta preta ou azul.$$),
    ('n4-grammar-43', $$電話またはメールで連絡してください。$$, $$でんわまたはメールでれんらくしてください。$$, $$Entre em contato por telefone ou e-mail.$$),
    ('n4-grammar-43', $$月曜日または火曜日に来てください。$$, $$げつようびまたはかようびにきてください。$$, $$Venha na segunda ou na terça-feira.$$),
    ('n4-grammar-43', $$お支払いは、現金またはカードでお願いします。$$, $$おしはらいは、げんきんまたはカードでおねがいします。$$, $$O pagamento pode ser feito em dinheiro ou cartão.$$),
    ('n4-grammar-43', $$申し込みは、駅の窓口、またはインターネットでできます。$$, $$もうしこみは、えきのまどぐち、またはインターネットでできます。$$, $$A inscrição pode ser feita no guichê da estação ou pela internet.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$鉛筆____ボールペンを使ってください。$$, $$Use lápis ou caneta esferográfica.$$),
        (2, $$答えはAかBのどちらか、____両方を選んでください。$$, $$Escolha A ou B, ou então as duas.$$),
        (3, $$受付は、平日____土曜日です。$$, $$O atendimento é em dias úteis ou aos sábados.$$),
        (4, $$来週の水曜日、____木曜日に会いましょう。$$, $$Vamos nos encontrar na quarta ou na quinta da semana que vem.$$),
        (5, $$運転免許証、____パスポートを持ってきてください。$$, $$Traga a carteira de motorista ou o passaporte.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-43', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$または$$),
        (2, $$または$$),
        (3, $$または$$),
        (4, $$または$$),
        (5, $$または$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
