-- n4-grammar-144 — 疑問詞＋か
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-144',
    'grammar',
    'N4',
    $$疑問詞＋か$$,
    $$gimonshi + ka$$,
    $$Algo / Alguém / Algum lugar / Algum dia$$,
    $$Quando uma palavra interrogativa recebe か, ela deixa de ser uma pergunta e passa a indicar algo indefinido. Equivale a "algo", "alguém", "algum lugar", "algum dia".

• 何か: alguma coisa, algo.
• 誰か: alguém.
• どこか: algum lugar.
• いつか: algum dia, alguma hora.
• どれか: algum (entre várias opções).

Essas formas aparecem em frases afirmativas, perguntas e convites. Por exemplo, "quer beber alguma coisa?" ou "algum dia quero morar no Japão".

As partículas が e を costumam ser omitidas depois dessas palavras. Outras partículas, como へ, に e で, ficam depois de か: どこかへ, 誰かに.$$,
    $$Compare: 何か (algo) e 何も〜ない (nada). Com か, a ideia é indefinida; com も e negativo, é negação total.

Em perguntas, 何か食べましたか significa "você comeu alguma coisa?", e a resposta pode ser はい ou いいえ, diferente de 何を食べましたか, que pede o que foi comido.

いつか costuma expressar um desejo ou plano vago para o futuro.$$,
    $$何か / 誰か / どこか / いつか / どれか + Verbo
どこか + へ / に / で + Verbo
誰か + に / と + Verbo$$,
    $$何か$$,
    $$何か|誰か|どこか|いつか|どれか|なにか|だれか$$,
    ARRAY['何', 'か']::text[],
    ARRAY['何か', '誰か', 'どこか', 'いつか', 'どれか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-144', $$のどが渇きましたね。何か飲みませんか。$$, $$のどがかわきましたね。なにかのみませんか。$$, $$Que sede, né? Quer beber alguma coisa?$$),
    ('n4-grammar-144', $$私がいない間に、誰か来ましたか。$$, $$わたしがいないあいだに、だれかきましたか。$$, $$Veio alguém enquanto eu não estava?$$),
    ('n4-grammar-144', $$週末、どこかへ行きたいです。$$, $$しゅうまつ、どこかへいきたいです。$$, $$No fim de semana, quero ir a algum lugar.$$),
    ('n4-grammar-144', $$いつか日本に住みたい。$$, $$いつかにほんにすみたい。$$, $$Algum dia, quero morar no Japão.$$),
    ('n4-grammar-144', $$この中からどれか一つ選んでください。$$, $$このなかからどれかひとつえらんでください。$$, $$Escolha uma destas opções, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お腹がすいた。____食べたい。$$, $$Estou com fome. Quero comer alguma coisa.$$),
        (2, $$暑いですね。____窓を開けてくれませんか。$$, $$Está quente, né? Alguém poderia abrir a janela?$$),
        (3, $$夏休みは____へ旅行に行きますか。$$, $$Nas férias de verão, você vai viajar para algum lugar?$$),
        (4, $$____また会いましょう。$$, $$Vamos nos ver de novo algum dia.$$),
        (5, $$赤と青と白の中から、____を選んでください。$$, $$Escolha uma entre a vermelha, a azul e a branca.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-144', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$何か$$),
        (1, $$なにか$$),
        (2, $$誰か$$),
        (2, $$だれか$$),
        (3, $$どこか$$),
        (4, $$いつか$$),
        (5, $$どれか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
