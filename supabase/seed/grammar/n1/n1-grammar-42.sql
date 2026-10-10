-- n1-grammar-42 — いずれにしても / いずれにしろ / いずれにせよ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-42',
    'grammar',
    'N1',
    $$いずれにしても / いずれにしろ / いずれにせよ$$,
    $$izure ni shite mo / izure ni shiro / izure ni seyo$$,
    $$De qualquer forma / Seja como for / Em todo caso$$,
    $$いずれにしても, いずれにしろ e いずれにせよ servem para dizer que, seja qual for a situação ou a escolha, a conclusão é a mesma. Equivalem a "de qualquer forma" ou "seja como for".

São usadas para encerrar uma discussão e ir direto ao ponto principal. Por exemplo, "seja como for, precisamos decidir até amanhã".

いずれにせよ é a forma mais formal, e いずれにしても é a mais comum na fala.$$,
    $$São parecidas com とにかく e どちらにしても.

Costumam aparecer no começo da frase, depois de uma discussão com várias possibilidades.$$,
    $$いずれにしても / いずれにしろ / いずれにせよ、 + Conclusão$$,
    $$いずれにしても$$,
    $$いずれにしても|いずれにしろ|いずれにせよ$$,
    ARRAY['いずれ', 'に', 'しても']::text[],
    ARRAY['いずれにしても', 'いずれにしろ', 'いずれにせよ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-42', $$いずれにしても、明日までに決めなければならない。$$, $$いずれにしても、あしたまでにきめなければならない。$$, $$De qualquer forma, temos que decidir até amanhã.$$),
    ('n1-grammar-42', $$行くか行かないか、いずれにせよ連絡してください。$$, $$いくかいかないか、いずれにせよれんらくしてください。$$, $$Indo ou não, em todo caso, entre em contato.$$),
    ('n1-grammar-42', $$いずれにしろ、もう一度話し合う必要がある。$$, $$いずれにしろ、もういちどはなしあうひつようがある。$$, $$Seja como for, é preciso conversar mais uma vez.$$),
    ('n1-grammar-42', $$原因はわからないが、いずれにしても修理が必要だ。$$, $$げんいんはわからないが、いずれにしてもしゅうりがひつようだ。$$, $$Não sei a causa, mas de qualquer forma precisa de conserto.$$),
    ('n1-grammar-42', $$いずれにせよ、結果はすぐにわかるだろう。$$, $$いずれにせよ、けっかはすぐにわかるだろう。$$, $$Seja como for, o resultado deve sair logo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、早めに準備しておこう。$$, $$De qualquer forma, vamos nos preparar com antecedência.$$),
        (2, $$賛成でも反対でも、____意見を聞かせてください。$$, $$A favor ou contra, em todo caso, me diga sua opinião.$$),
        (3, $$____、彼の責任は重い。$$, $$Seja como for, a responsabilidade dele é grande.$$),
        (4, $$電車でもバスでも、____一時間はかかる。$$, $$De trem ou de ônibus, de qualquer forma leva uma hora.$$),
        (5, $$____、今日はもう遅いから帰ろう。$$, $$Seja como for, já está tarde hoje, vamos embora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-42', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いずれにしても$$),
        (1, $$いずれにしろ$$),
        (1, $$いずれにせよ$$),
        (2, $$いずれにしても$$),
        (2, $$いずれにしろ$$),
        (2, $$いずれにせよ$$),
        (3, $$いずれにしても$$),
        (3, $$いずれにしろ$$),
        (3, $$いずれにせよ$$),
        (4, $$いずれにしても$$),
        (4, $$いずれにしろ$$),
        (4, $$いずれにせよ$$),
        (5, $$いずれにしても$$),
        (5, $$いずれにしろ$$),
        (5, $$いずれにせよ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
