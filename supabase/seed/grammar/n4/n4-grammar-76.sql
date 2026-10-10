-- n4-grammar-76 — さすが
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-76',
    'grammar',
    'N4',
    $$さすが$$,
    $$sasuga$$,
    $$Como esperado / Não é à toa / Realmente$$,
    $$さすが é usado para expressar admiração quando alguém ou algo corresponde exatamente à reputação ou à expectativa. Equivale a "como esperado de...", "não é à toa" ou "realmente".

Ele é muito usado para elogiar: quando um profissional faz algo muito bem, quando alguém confirma sua fama, quando um produto é tão bom quanto dizem.

Com に, na forma さすがに, o sentido muda um pouco. Ele passa a indicar "até mesmo" ou "como era de se esperar", geralmente para algo que chegou ao limite, como "até eu fiquei cansado depois de tudo isso".

Sozinho, さすが! também funciona como exclamação de elogio, parecida com "mandou bem!".$$,
    $$Com superiores, dizer apenas さすがですね pode soar como se você estivesse avaliando a pessoa. Em situações formais, é melhor elogiar de forma mais indireta.

さすがに aparece muito com negativas ou limites, como 疲れた e 無理だ.

O kanji 流石 é pouco usado no dia a dia; o mais comum é escrever em hiragana.$$,
    $$さすが + Substantivo + だ / です (como esperado de...)
さすが + だ / です / ね (exclamação de elogio)
さすがに + Adjetivo / Verbo (até mesmo / era de se esperar)

Escrita: さすが / 流石$$,
    $$さすが$$,
    $$さすが|流石$$,
    ARRAY['さすが']::text[],
    ARRAY['さすが', 'さすがに', '流石']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-76', $$さすがプロですね。とても上手です。$$, $$さすがプロですね。とてもじょうずです。$$, $$Não é à toa que é profissional. Muito bom.$$),
    ('n4-grammar-76', $$一回で合格するなんて、さすがだね。$$, $$いっかいでごうかくするなんて、さすがだね。$$, $$Passar de primeira? Mandou bem!$$),
    ('n4-grammar-76', $$一日中歩いて、さすがに疲れました。$$, $$いちにちじゅうあるいて、さすがにつかれました。$$, $$Andei o dia inteiro, e até eu fiquei cansado.$$),
    ('n4-grammar-76', $$このお茶、さすが静岡のお茶ですね。$$, $$このおちゃ、さすがしずおかのおちゃですね。$$, $$Este chá é realmente digno de Shizuoka.$$),
    ('n4-grammar-76', $$三日も寝ていないので、さすがに眠い。$$, $$みっかもねていないので、さすがにねむい。$$, $$Fiquei três dias sem dormir, então é claro que estou com sono.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$全部正解なんて、____田中さんだね。$$, $$Acertar tudo? Como esperado do Tanaka.$$),
        (2, $$____先生ですね。説明がとてもわかりやすい。$$, $$Não é à toa que é professor. A explicação é muito clara.$$),
        (3, $$十時間も歩いたので、____に足が痛い。$$, $$Andei dez horas inteiras, então é claro que meus pés doem.$$),
        (4, $$一人で全部作ったの？____だね。$$, $$Você fez tudo sozinho? Mandou bem!$$),
        (5, $$いつも元気な彼も、今日は____に疲れているようだ。$$, $$Até ele, que está sempre animado, parece cansado hoje.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-76', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さすが$$),
        (2, $$さすが$$),
        (3, $$さすが$$),
        (4, $$さすが$$),
        (5, $$さすが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
