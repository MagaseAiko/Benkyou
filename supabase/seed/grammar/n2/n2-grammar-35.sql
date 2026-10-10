-- n2-grammar-35 — 〜一方で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-35',
    'grammar',
    'N2',
    $$〜一方で$$,
    $$ippou de$$,
    $$Por outro lado / Enquanto / Ao mesmo tempo que$$,
    $$一方で é usado para contrastar duas situações ou para mostrar duas ações que acontecem ao mesmo tempo. Equivale a "por outro lado", "enquanto" ou "ao mesmo tempo que".

Ele tem três usos principais:
• Contraste entre dois lados de uma mesma coisa: "a cidade é prática, mas, por outro lado, o custo de vida é alto".
• Contraste entre duas coisas diferentes: "o número de crianças diminui, enquanto o de idosos aumenta".
• Duas atividades simultâneas: "ele trabalha e, ao mesmo tempo, faz faculdade".

No começo de uma frase, 一方、 (com vírgula) significa "por outro lado" e liga duas frases contrastantes.

É muito usado em textos, notícias e análises.$$,
    $$Compare: 一方だ (só aumenta / só piora) e 一方で (por outro lado) têm sentidos bem diferentes.

Comparado a 反面, 一方で é mais amplo e pode comparar coisas diferentes, e não só os dois lados de uma mesma coisa.

Em notícias com estatísticas, 一方 é usado para contrastar dados.$$,
    $$Verbo / Adjetivo (forma simples) + 一方で、 + Contraste / Ação simultânea
Adjetivo な + な / である + 一方で
Frase 1 (com ponto final) + 一方、 + Frase 2

Escrita: 一方で / いっぽうで$$,
    $$一方で$$,
    $$一方で|一方、|いっぽうで$$,
    ARRAY['一方', 'で']::text[],
    ARRAY['一方で', '一方']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-35', $$都会は便利な一方で、物価が高い。$$, $$とかいはべんりないっぽうで、ぶっかがたかい。$$, $$A cidade grande é prática, mas, por outro lado, o custo de vida é alto.$$),
    ('n2-grammar-35', $$兄は活発だ。一方、弟はおとなしい。$$, $$あにはかっぱつだ。いっぽう、おとうとはおとなしい。$$, $$O irmão mais velho é agitado. Por outro lado, o mais novo é quieto.$$),
    ('n2-grammar-35', $$彼は仕事をする一方で、大学にも通っている。$$, $$かれはしごとをするいっぽうで、だいがくにもかよっている。$$, $$Ele trabalha e, ao mesmo tempo, faz faculdade.$$),
    ('n2-grammar-35', $$子供の数が減る一方で、高齢者は増えている。$$, $$こどものかずがへるいっぽうで、こうれいしゃはふえている。$$, $$Enquanto o número de crianças diminui, o de idosos aumenta.$$),
    ('n2-grammar-35', $$輸出が増えた一方で、輸入は減った。$$, $$ゆしゅつがふえたいっぽうで、ゆにゅうはへった。$$, $$As exportações aumentaram, enquanto as importações diminuíram.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この仕事は給料がいい____、休みが少ない。$$, $$Este trabalho paga bem, mas, por outro lado, tem poucas folgas.$$),
        (2, $$彼女は歌手として活動する____、女優もしている。$$, $$Ela trabalha como cantora e, ao mesmo tempo, como atriz.$$),
        (3, $$東京は人口が増える____、地方は減っている。$$, $$Enquanto a população de Tóquio aumenta, a do interior diminui.$$),
        (4, $$生活は便利になった____、失ったものもある。$$, $$A vida ficou mais prática, mas, por outro lado, também perdemos coisas.$$),
        (5, $$父は厳しい____、優しいところもある。$$, $$Meu pai é rigoroso, mas, ao mesmo tempo, também tem um lado gentil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-35', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一方で$$),
        (2, $$一方で$$),
        (3, $$一方で$$),
        (4, $$一方で$$),
        (5, $$一方で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
