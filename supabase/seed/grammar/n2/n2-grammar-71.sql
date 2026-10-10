-- n2-grammar-71 — 〜ものではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-71',
    'grammar',
    'N2',
    $$〜ものではない$$,
    $$mono dewa nai$$,
    $$Não se deve / Não é certo / Não convém$$,
    $$ものではない serve para dar um conselho ou uma advertência baseada no bom senso ou nas regras sociais. Equivale a "não se deve" ou "não é certo".

A pessoa não está proibindo diretamente, mas dizendo que, de forma geral, aquilo não é adequado. Por exemplo, "não se deve falar mal dos outros".

É muito usado por pais, professores ou pessoas mais velhas ao dar conselhos.$$,
    $$Na fala, aparece como もんじゃない ou ものじゃない.

A forma positiva, ものだ, significa "deve-se".

Não se usa para falar de uma regra específica, como uma lei, mas sim de bom senso.$$,
    $$Verbo (forma dicionário) + ものではない
Verbo (forma dicionário) + もんじゃない$$,
    $$ものではない$$,
    $$ものではない|ものじゃない|もんじゃない|ものではありません$$,
    ARRAY['もの', 'では', 'ない']::text[],
    ARRAY['ものではない', 'ものじゃない', 'もんじゃない', 'ものではありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-71', $$人の悪口を言うものではない。$$, $$ひとのわるぐちをいうものではない。$$, $$Não se deve falar mal dos outros.$$),
    ('n2-grammar-71', $$食べ物を無駄にするものではありません。$$, $$たべものをむだにするものではありません。$$, $$Não se deve desperdiçar comida.$$),
    ('n2-grammar-71', $$夜遅くに電話するもんじゃないよ。$$, $$よるおそくにでんわするもんじゃないよ。$$, $$Não é certo telefonar tarde da noite.$$),
    ('n2-grammar-71', $$年上の人にそんな口をきくものじゃない。$$, $$としうえのひとにそんなくちをきくものじゃない。$$, $$Não se fala desse jeito com alguém mais velho.$$),
    ('n2-grammar-71', $$約束を簡単に破るものではない。$$, $$やくそくをかんたんにやぶるものではない。$$, $$Não se deve quebrar promessas com facilidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$人の物を勝手に使う____。$$, $$Não se deve usar as coisas dos outros sem permissão.$$),
        (2, $$子供の前でたばこを吸う____。$$, $$Não se deve fumar na frente de crianças.$$),
        (3, $$人を外見で判断する____。$$, $$Não se deve julgar as pessoas pela aparência.$$),
        (4, $$お年寄りをばかにする____。$$, $$Não se deve zombar dos idosos.$$),
        (5, $$人の話は途中で遮る____。$$, $$Não se deve interromper as pessoas enquanto falam.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-71', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものではない$$),
        (1, $$ものじゃない$$),
        (1, $$もんじゃない$$),
        (1, $$ものではありません$$),
        (2, $$ものではない$$),
        (2, $$ものじゃない$$),
        (2, $$もんじゃない$$),
        (2, $$ものではありません$$),
        (3, $$ものではない$$),
        (3, $$ものじゃない$$),
        (3, $$もんじゃない$$),
        (3, $$ものではありません$$),
        (4, $$ものではない$$),
        (4, $$ものじゃない$$),
        (4, $$もんじゃない$$),
        (4, $$ものではありません$$),
        (5, $$ものではない$$),
        (5, $$ものじゃない$$),
        (5, $$もんじゃない$$),
        (5, $$ものではありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
