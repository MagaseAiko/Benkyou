-- n4-grammar-11 — 〜でも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-11',
    'grammar',
    'N4',
    $$〜でも$$,
    $$demo$$,
    $$Ou algo assim / Até mesmo / Qualquer$$,
    $$No N4, でも aparece depois de substantivos com três usos importantes.

O primeiro é dar uma sugestão leve, sem insistir: "um chá ou algo assim". A coisa citada é só um exemplo, e a pessoa fica livre para escolher outra opção. Esse uso é muito comum em convites.

O segundo é "até mesmo": algo é verdade mesmo para um caso extremo ou inesperado, como "até uma criança entende".

O terceiro aparece com palavras interrogativas, como いつ, 何, どこ e 誰. Juntas com でも, elas significam "qualquer": a qualquer hora, qualquer coisa, qualquer lugar, qualquer pessoa.

でも substitui は, が e を. Com outras partículas, ele fica depois delas, como em にでも e からでも.$$,
    $$No uso de sugestão, でも deixa o convite mais suave e educado, porque não impõe uma opção específica.

Não confunda com でも no começo da frase, que significa "mas".

Com palavras interrogativas, a combinação com も e negativo significa "nada / ninguém", enquanto a combinação com でも e afirmativo significa "qualquer".$$,
    $$Substantivo + でも + Verbo (sugestão leve)
Substantivo + でも (até mesmo)
Palavra interrogativa + でも (qualquer)
Substantivo + partícula + でも (にでも / からでも)$$,
    $$でも$$,
    $$でも$$,
    ARRAY['でも']::text[],
    ARRAY['でも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-11', $$お茶でも飲みませんか。$$, $$おちゃでものみませんか。$$, $$Que tal tomarmos um chá ou algo assim?$$),
    ('n4-grammar-11', $$この問題は子供でもわかります。$$, $$このもんだいはこどもでもわかります。$$, $$Até uma criança entende esta questão.$$),
    ('n4-grammar-11', $$いつでも遊びに来てください。$$, $$いつでもあそびにきてください。$$, $$Venha me visitar quando quiser.$$),
    ('n4-grammar-11', $$日曜日でも、父は働いています。$$, $$にちようびでも、ちちははたらいています。$$, $$Mesmo no domingo, meu pai trabalha.$$),
    ('n4-grammar-11', $$暇なら、映画でも見に行こうか。$$, $$ひまなら、えいがでもみにいこうか。$$, $$Se você estiver livre, vamos ver um filme ou algo assim?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$週末、映画____見に行きませんか。$$, $$No fim de semana, quer ir ver um filme ou algo assim?$$),
        (2, $$そんな簡単なこと、小学生____できますよ。$$, $$Uma coisa simples dessas, até um aluno do primário consegue.$$),
        (3, $$飲み物は何____いいです。$$, $$Qualquer bebida serve.$$),
        (4, $$雨の日____、彼は毎朝走ります。$$, $$Mesmo em dias de chuva, ele corre toda manhã.$$),
        (5, $$困ったときは、いつ____電話してね。$$, $$Quando estiver com problemas, me ligue a qualquer hora, tá?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-11', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でも$$),
        (2, $$でも$$),
        (3, $$でも$$),
        (4, $$でも$$),
        (5, $$でも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
