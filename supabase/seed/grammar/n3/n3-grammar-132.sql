-- n3-grammar-132 — 〜的
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-132',
    'grammar',
    'N3',
    $$〜的$$,
    $$teki$$,
    $$Sufixo -ico / Sufixo -al / Do ponto de vista de$$,
    $$的 é um sufixo que transforma substantivos (geralmente de origem chinesa) em adjetivos な. Ele corresponde a terminações do português como "-ico" e "-al", como em 伝統的 (tradicional), 経済的 (econômico) e 国際的 (internacional).

O resultado funciona como um adjetivo な:
• Antes de substantivo: 的な, como 伝統的な料理 (comida tradicional).
• Como advérbio: 的に, como 経済的に難しい (economicamente difícil).
• No fim da frase: 的だ.

Com に e は, a forma 的には indica um ponto de vista: 個人的には significa "pessoalmente", "do meu ponto de vista".

的 é muito usado em textos formais, notícias, discussões e na linguagem acadêmica.$$,
    $$Nem todo substantivo aceita 的. Ele é usado principalmente com palavras de dois kanji de origem chinesa.

Na fala jovem, 的 aparece de forma criativa, como 私的には ("pra mim"), com tom bem casual.

Palavras como 積極的 (proativo) e 消極的 (passivo) são muito usadas para descrever personalidades.$$,
    $$Substantivo + 的な + Substantivo (伝統的な / 国際的な)
Substantivo + 的に + Verbo / Adjetivo (経済的に / 積極的に)
Substantivo + 的だ / 的です
Substantivo + 的には (do ponto de vista de)$$,
    $$的$$,
    $$的$$,
    ARRAY['的']::text[],
    ARRAY['的', '的な', '的に', '的には']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-132', $$彼は積極的な性格だ。$$, $$かれはせっきょくてきなせいかくだ。$$, $$Ele tem uma personalidade proativa.$$),
    ('n3-grammar-132', $$この計画は経済的に難しい。$$, $$このけいかくはけいざいてきにむずかしい。$$, $$Este plano é economicamente difícil.$$),
    ('n3-grammar-132', $$日本の伝統的な料理を食べたい。$$, $$にほんのでんとうてきなりょうりをたべたい。$$, $$Quero comer comida tradicional japonesa.$$),
    ('n3-grammar-132', $$彼女は国際的に有名な歌手だ。$$, $$かのじょはこくさいてきにゆうめいなかしゅだ。$$, $$Ela é uma cantora internacionalmente famosa.$$),
    ('n3-grammar-132', $$個人的には、この意見に賛成です。$$, $$こじんてきには、このいけんにさんせいです。$$, $$Pessoalmente, concordo com esta opinião.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$京都には伝統____な建物が多い。$$, $$Kyoto tem muitos prédios tradicionais.$$),
        (2, $$彼の説明はとても論理____だ。$$, $$A explicação dele é muito lógica.$$),
        (3, $$個人____には、この映画が好きです。$$, $$Pessoalmente, eu gosto deste filme.$$),
        (4, $$この計画は経済____に無理だ。$$, $$Este plano é economicamente inviável.$$),
        (5, $$彼女は会議でいつも積極____に意見を言う。$$, $$Ela sempre dá opiniões de forma proativa nas reuniões.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-132', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$的$$),
        (2, $$的$$),
        (3, $$的$$),
        (4, $$的$$),
        (5, $$的$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
