-- n2-grammar-92 — 〜に関わる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-92',
    'grammar',
    'N2',
    $$〜に関わる$$,
    $$ni kakawaru$$,
    $$Relacionado a / Que afeta / Que envolve$$,
    $$に関わる indica que algo tem uma relação direta e importante com outra coisa, muitas vezes de forma séria. Equivale a "relacionado a", "que afeta" ou "que envolve".

Costuma aparecer com palavras de grande peso, como vida, honra, futuro ou reputação. Por exemplo, "uma doença que põe a vida em risco" ou "um problema que afeta o futuro da empresa".

Também pode indicar participação em algo, como "trabalhar envolvido com educação".$$,
    $$Expressões comuns são 命に関わる, 名誉に関わる e 将来に関わる.

É parecido com に関する, mas に関わる transmite que a relação é séria ou que tem influência forte.$$,
    $$Substantivo + に関わる + Substantivo
Substantivo + に関わって + Verbo$$,
    $$に関わる$$,
    $$に関わる|にかかわる|に関わって|に関わった|に関わり$$,
    ARRAY['に', '関わる']::text[],
    ARRAY['に関わる', 'にかかわる', 'に関わって', 'に関わった', 'に関わります']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-92', $$これは命に関わる病気だ。$$, $$これはいのちにかかわるびょうきだ。$$, $$Esta é uma doença que põe a vida em risco.$$),
    ('n2-grammar-92', $$会社の将来に関わる問題なので、慎重に考えよう。$$, $$かいしゃのしょうらいにかかわるもんだいなので、しんちょうにかんがえよう。$$, $$É um problema que afeta o futuro da empresa, então vamos pensar com cuidado.$$),
    ('n2-grammar-92', $$彼は長年教育に関わる仕事をしている。$$, $$かれはながねんきょういくにかかわるしごとをしている。$$, $$Ele trabalha há muitos anos com educação.$$),
    ('n2-grammar-92', $$そんな失敗は店の評判に関わる。$$, $$そんなしっぱいはみせのひょうばんにかかわる。$$, $$Um erro desses afeta a reputação da loja.$$),
    ('n2-grammar-92', $$この事件に関わった人は全員調べられた。$$, $$このじけんにかかわったひとはぜんいんしらべられた。$$, $$Todas as pessoas envolvidas neste caso foram investigadas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$それは私の名誉____問題だ。$$, $$Isso é um problema que envolve a minha honra.$$),
        (2, $$子供の安全____ことは、すぐに対応すべきだ。$$, $$Questões que afetam a segurança das crianças devem ser tratadas imediatamente.$$),
        (3, $$彼女は環境保護____活動をしている。$$, $$Ela faz atividades relacionadas à proteção do meio ambiente.$$),
        (4, $$けがは軽く、命____ものではなかった。$$, $$O ferimento foi leve e não pôs a vida em risco.$$),
        (5, $$この決定は社員全員の生活____。$$, $$Esta decisão afeta a vida de todos os funcionários.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-92', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に関わる$$),
        (1, $$にかかわる$$),
        (2, $$に関わる$$),
        (2, $$にかかわる$$),
        (3, $$に関わる$$),
        (3, $$にかかわる$$),
        (4, $$に関わる$$),
        (4, $$にかかわる$$),
        (5, $$に関わる$$),
        (5, $$にかかわる$$),
        (5, $$に関わります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
