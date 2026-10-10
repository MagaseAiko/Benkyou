-- n2-grammar-30 — 〜以外
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-30',
    'grammar',
    'N2',
    $$〜以外$$,
    $$igai$$,
    $$Exceto / Além de / Fora$$,
    $$以外 é usado para indicar exceção: tudo, menos aquilo. Equivale a "exceto", "além de" ou "fora".

Ele vem depois de substantivos e, às vezes, de verbos na forma de dicionário. Por exemplo, "trabalho todo dia, exceto domingo" ou "ninguém veio além dele".

Com は, 以外は destaca a exceção: "fora o domingo, trabalho todo dia".

Antes de um substantivo, usa-se 以外の: 肉以外の料理 (pratos que não sejam de carne).

Com に e ない, 以外に方法がない significa "não há outro jeito além de...".$$,
    $$Não confunda 以外 (exceto) com 意外 (inesperado). As duas são lidas いがい, mas os kanji e os sentidos são diferentes.

関係者以外立入禁止 ("proibida a entrada de pessoas não autorizadas") é um aviso muito comum.

Para "além de" no sentido de "além disso, também", usa-se 以外にも: 東京以外にも行きたい.$$,
    $$Substantivo + 以外 + は / に / の
Verbo na forma de dicionário + 以外に + ない (não há outra opção além de)
Substantivo + 以外 + 誰も / 何も + Negativo

Escrita: 以外 / いがい$$,
    $$以外$$,
    $$以外|いがい$$,
    ARRAY['以外']::text[],
    ARRAY['以外', '以外は', '以外に', '以外の']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-30', $$日曜日以外は毎日働いている。$$, $$にちようびいがいはまいにちはたらいている。$$, $$Trabalho todos os dias, exceto domingo.$$),
    ('n2-grammar-30', $$彼以外、誰も来なかった。$$, $$かれいがい、だれもこなかった。$$, $$Ninguém veio além dele.$$),
    ('n2-grammar-30', $$関係者以外は入れません。$$, $$かんけいしゃいがいははいれません。$$, $$Apenas pessoas autorizadas podem entrar.$$),
    ('n2-grammar-30', $$肉以外の料理を注文した。$$, $$にくいがいのりょうりをちゅうもんした。$$, $$Pedi um prato que não fosse de carne.$$),
    ('n2-grammar-30', $$電車が来ないなら、待つ以外に方法がない。$$, $$でんしゃがこないなら、まついがいにほうほうがない。$$, $$Se o trem não vem, não há outro jeito além de esperar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私____は、みんな賛成した。$$, $$Todos concordaram, exceto eu.$$),
        (2, $$魚____の物なら、何でも食べます。$$, $$Como qualquer coisa, menos peixe.$$),
        (3, $$日本語____の言葉は話せない。$$, $$Não falo nenhuma língua além do japonês.$$),
        (4, $$謝る____に、できることはない。$$, $$Não há nada que eu possa fazer além de pedir desculpas.$$),
        (5, $$この部屋は、社員____立ち入り禁止です。$$, $$A entrada nesta sala é proibida para quem não é funcionário.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-30', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$以外$$),
        (2, $$以外$$),
        (3, $$以外$$),
        (4, $$以外$$),
        (5, $$以外$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
