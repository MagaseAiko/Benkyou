-- n1-grammar-112 — 〜に言わせれば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-112',
    'grammar',
    'N1',
    $$〜に言わせれば$$,
    $$ni iwasereba$$,
    $$Na opinião de / Segundo / Se for perguntar a$$,
    $$に言わせれば apresenta a opinião pessoal de alguém, muitas vezes diferente da opinião geral. Equivale a "na opinião de" ou "se for perguntar a".

A pessoa destaca que aquela é a visão daquela pessoa específica. Por exemplo, "na opinião do meu pai, celular é desnecessário".

Também pode ser usado com a primeira pessoa, como "na minha opinião".$$,
    $$É parecido com によると e にとって, mas に言わせれば destaca uma opinião forte e pessoal.

Só se usa com pessoas.$$,
    $$Substantivo (pessoa) + に言わせれば / に言わせると$$,
    $$に言わせれば$$,
    $$に言わせれば|に言わせると|にいわせれば|にいわせると$$,
    ARRAY['に', '言わせれば']::text[],
    ARRAY['に言わせれば', 'に言わせると']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-112', $$父に言わせれば、スマホなんて必要ないそうだ。$$, $$ちちにいわせれば、スマホなんてひつようないそうだ。$$, $$Na opinião do meu pai, celular é desnecessário.$$),
    ('n1-grammar-112', $$私に言わせれば、あの映画はつまらない。$$, $$わたしにいわせれば、あのえいがはつまらない。$$, $$Na minha opinião, aquele filme é chato.$$),
    ('n1-grammar-112', $$専門家に言わせると、この計画には問題が多い。$$, $$せんもんかにいわせると、このけいかくにはもんだいがおおい。$$, $$Segundo os especialistas, este plano tem muitos problemas.$$),
    ('n1-grammar-112', $$母に言わせれば、私はまだ子供だ。$$, $$ははにいわせれば、わたしはまだこどもだ。$$, $$Na opinião da minha mãe, ainda sou uma criança.$$),
    ('n1-grammar-112', $$彼に言わせると、成功の秘訣は運だそうだ。$$, $$かれにいわせると、せいこうのひけつはうんだそうだ。$$, $$Segundo ele, o segredo do sucesso é a sorte.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$祖母____、最近の若者は礼儀を知らない。$$, $$Na opinião da minha avó, os jovens de hoje não têm educação.$$),
        (2, $$先生____、この問題は簡単だそうだ。$$, $$Segundo o professor, este problema é fácil.$$),
        (3, $$私____、彼のやり方は間違っている。$$, $$Na minha opinião, o jeito dele está errado.$$),
        (4, $$妻____、私は家事を何もしないそうだ。$$, $$Na opinião da minha esposa, eu não faço nada em casa.$$),
        (5, $$医者____、この程度の熱は心配いらない。$$, $$Segundo o médico, uma febre dessas não é motivo de preocupação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-112', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に言わせれば$$),
        (1, $$に言わせると$$),
        (2, $$に言わせれば$$),
        (2, $$に言わせると$$),
        (3, $$に言わせれば$$),
        (3, $$に言わせると$$),
        (4, $$に言わせれば$$),
        (4, $$に言わせると$$),
        (5, $$に言わせれば$$),
        (5, $$に言わせると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
