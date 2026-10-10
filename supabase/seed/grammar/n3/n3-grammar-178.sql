-- n3-grammar-178 — 〜ようとしない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-178',
    'grammar',
    'N3',
    $$〜ようとしない$$,
    $$you to shinai$$,
    $$Não querer (fazer) / Recusar-se a / Não fazer nenhum esforço para$$,
    $$ようとしない é usado para dizer que alguém não tem a menor intenção de fazer algo, ou se recusa a fazer, mesmo quando deveria. Equivale a "não quer", "se recusa a" ou "não faz nenhum esforço para".

Ele junta a forma volitiva do verbo (聞こう, 食べよう) com としない. A ideia literal é "não tenta fazer".

Ele é usado para falar de outras pessoas, geralmente com tom de crítica, frustração ou preocupação. Por exemplo, "ele não quer ouvir o que os outros dizem" ou "a criança se recusa a comer verdura".

Para falar de si mesmo, essa estrutura soa estranha, a não ser em descrições objetivas.$$,
    $$Para falar de si mesmo, usa-se つもりはない ou たくない.

ようとしない destaca a falta de vontade ou de esforço, e não a incapacidade.

É muito comum em conversas de pais sobre filhos e em reclamações sobre colegas.$$,
    $$Forma volitiva + としない
Forma volitiva + としなかった (passado)

Educado: ようとしません
Exemplos: 聞く → 聞こうとしない / 食べる → 食べようとしない / する → しようとしない$$,
    $$ようとしない$$,
    $$ようとしない|うとしない|ようとしません|うとしません|うとしなかった$$,
    ARRAY['よう', 'と', 'しない']::text[],
    ARRAY['ようとしない', 'うとしない', 'ようとしません', 'うとしなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-178', $$彼は人の話を聞こうとしない。$$, $$かれはひとのはなしをきこうとしない。$$, $$Ele não quer ouvir o que os outros dizem.$$),
    ('n3-grammar-178', $$子供が野菜を食べようとしない。$$, $$こどもがやさいをたべようとしない。$$, $$A criança se recusa a comer verdura.$$),
    ('n3-grammar-178', $$何度言っても、彼は謝ろうとしない。$$, $$なんどいっても、かれはあやまろうとしない。$$, $$Por mais que eu fale, ele se recusa a pedir desculpas.$$),
    ('n3-grammar-178', $$弟は宿題をやろうとしない。$$, $$おとうとはしゅくだいをやろうとしない。$$, $$Meu irmão mais novo não faz nenhum esforço para fazer a lição.$$),
    ('n3-grammar-178', $$彼女は本当のことを話そうとしなかった。$$, $$かのじょはほんとうのことをはなそうとしなかった。$$, $$Ela se recusou a contar a verdade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$息子は部屋から出よ____。$$, $$Meu filho se recusa a sair do quarto.$$),
        (2, $$彼は自分の間違いを認めよ____。$$, $$Ele se recusa a admitir o próprio erro.$$),
        (3, $$猫は薬を飲も____。$$, $$O gato se recusa a tomar o remédio.$$),
        (4, $$彼女は悩んでいるのに、誰にも相談しよ____。$$, $$Ela está preocupada, mas não quer pedir conselho a ninguém.$$),
        (5, $$父は具合が悪いのに、病院に行こ____。$$, $$Meu pai está mal, mas se recusa a ir ao hospital.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-178', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$うとしない$$),
        (1, $$うとしません$$),
        (2, $$うとしない$$),
        (2, $$うとしません$$),
        (3, $$うとしない$$),
        (3, $$うとしません$$),
        (4, $$うとしない$$),
        (4, $$うとしません$$),
        (5, $$うとしない$$),
        (5, $$うとしません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
