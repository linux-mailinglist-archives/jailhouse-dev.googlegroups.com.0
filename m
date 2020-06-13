Return-Path: <jailhouse-dev+bncBDCOXMNUBQIKRZ4T64CRUBFV5OTEM@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 800141F83F9
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jun 2020 17:41:29 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id e15sf3642923lfq.5
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jun 2020 08:41:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1592062889; cv=pass;
        d=google.com; s=arc-20160816;
        b=0+oxFmAIvg4yobXLOWJrhLCLoP0I4uJ+XBcnLV0eD+TgBB2DjKpzUB8Q5hLMCAG3pC
         fav+z/ZZSV/t58bQSjfEKTcd5txoO1zS1CS3GyvECtIr5/6YMk9KyQ1u5PDKG42P4hao
         xNad/0TxW4NgXfTqh+f1H+3aMfNU4EDED9t24KgSGFLduh2JlJv66+JxRvcrKyCTBK/0
         4Yg2HCEPa6n82zpAqtuE1HYw8UYIfP1CS0mY8d6p8IZyysrmAw1nNHnvSLlbABPI76TG
         ZoWbiIxiqvVgHRp2FPeDNMh7EraTuQIEf6QIrhVedYN2ET6J+4BQgCVPNDULPGQZCQU1
         L11g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:references
         :content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=N6qNtKA60nbuyfSJ/dgPr52Tb7ZfGA1cU0+KyBV4m7c=;
        b=yv3ufmUpPLQlyFG5oxnRB2qKAOupFZmd/Qa+3wPF2/ywmnQ4JdH/N8B5MQ9T+mmVd/
         yDS2IC31w1n5TD05Ungx/kuKPvw87o1wLqptSEcyzDGiIDjlUe0cTiMWAVrTLJLOmzsR
         l8myiXwkss3lPMm4Rp0mr59qH11qv3C+CY7cxQ8+Of6oKEDT2XxSASv/j/lAiCdUc8UG
         uJ88sxVrBaW4BTyDRRje3lXZz6GlYHSg3Lp8xFedPz4sNWUL04c3g99A/WA8XV9pkNTL
         x0XpEU+iL66vwfobfqswf4dSfk0YkFeq2vM8v/2SOqihzmj3lMrswXcNfKlqZl+05iXB
         cpHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=h5YjncCA;
       spf=pass (google.com: domain of rose_gomoo101@yahoo.com designates 77.238.178.146 as permitted sender) smtp.mailfrom=rose_gomoo101@yahoo.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:references:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=N6qNtKA60nbuyfSJ/dgPr52Tb7ZfGA1cU0+KyBV4m7c=;
        b=bswP10b9VsEUlkql+KXUyRDkQqWM8iwAGSrBdhq4cNYywL+iyqNk4sHq0UjmjBoi4z
         e0pndlhsIWgwRpwjXqELu1hE+y/zSZHLzyO4BEmyabv6NfYAuvUGlS5TSEn4hRqrTxOY
         eQIBMx/883ckVVhD2Sm7eL4Bv5nB0X+qsO/87avb8m+MOdvAwu8hLyK5TUfJGYC/cVA2
         VHqyvB92TT5N2Y4x9ZLykeHp7cmQ7JLLOkbu1+M+FGW7p0yCCmCnzjIUum7R6N+6hYzy
         whd9wZ1LgigV9fkmk1GmHCqoP0B5BaaVVSLsFjzcsJ65p11IymuQ6noC3j4LiKeoF0Yk
         tn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:references:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N6qNtKA60nbuyfSJ/dgPr52Tb7ZfGA1cU0+KyBV4m7c=;
        b=GFJlmkyFobmA70PENuI46R3vmS5dy1B6/5IZsafGOWQBgN3ENOPq0+RGkWYnVEYmmt
         3UGY6tcxZmkpnvPewTRkG0b3PxrQiNbx5upEP2WGQJe5fjb3seC4Uka1iZKh/08RkA0M
         juI50OwqZot0KO5DXePyiOu4gV8zUYYK20oiKu/RHxQ3oVmmKTQN52oF+XD5hzMQ1QA9
         qYt4ug/w3R0nwbYuZ71GGkMTeOnIrN7NMlrgDMF7pjS/ZbGlpNICSf3/VoRiedxNe0JA
         9dYwIe2aSG6b7a5Tjd0SwCJK78hKM67Zwg3FKU8XQuaR3DHCmVhOy66ArxmYLXdjh3hu
         L2FQ==
X-Gm-Message-State: AOAM531sN9FgGpfElnlzcZF82kea6S2i1CY6eciPhHcOXx9iEgLf3JC0
	Nt5xr9lUvLsfvb3b0G54A6c=
X-Google-Smtp-Source: ABdhPJwfFefDrMPJ8tAR/qBblLvoEcwkvrlOB9zOIS1JfPoqMzgKURdJTrpx3PY7A1rBgAu5mHsJxg==
X-Received: by 2002:a2e:960b:: with SMTP id v11mr9406680ljh.77.1592062888931;
        Sat, 13 Jun 2020 08:41:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3047:: with SMTP id b7ls2512427lfb.1.gmail; Sat, 13
 Jun 2020 08:41:28 -0700 (PDT)
X-Received: by 2002:a19:6a09:: with SMTP id u9mr9462269lfu.65.1592062888291;
        Sat, 13 Jun 2020 08:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592062888; cv=none;
        d=google.com; s=arc-20160816;
        b=qtNS5vrwd7rJ1CEOAzH7Sdp0NNVQjsUTTa9/WBog7eWWcW4NqpF6Mc4bQ9S0BsZhtw
         q07sQ/C5LEzumX87eSS6O2DRhyE6yn/Z8jBSEja/oDpXUsDbgiJYp76HZd9xc0V3h9hV
         GzRthRk3bHSuZYbCs8uBY14PkZiFA4Suq4pmudcAtcMXlYWdsI2EtI0jRuAVSmmWD9ox
         oXmUKlTWcviDZ7xc0CG2kA0D/YG7357twDrH+jwui0Q2ydCdOGS+6vvi6F7q5IeMVuF4
         9Qjlxpq5SA03swJqGsn2bjMjd6rvZSx9/go/BSwottwhScSE7a7rn4wL48rrlUN3A4ed
         SQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:content-transfer-encoding:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=EdQ6J0sRRv3XBxt3j7IlulUVvRg4uKdicik//r5GkY8=;
        b=AwzxU1EBits0ceIL5BaoymcJCS/KiWjOIk9PRALLqJr8/VGEVwuMAgtH4IZZGg9nR/
         xE+lFnZ1Lq7bGt+EWdBiTAP6HZ6LgIM15hqik2Dh6zjMp889LlZ81Wye2js1qofZxcqd
         /V96ZyYvOsZpP2nAUh6kLejaoaZ7NZ/OhMRo8rOxQ3J4eUX5/0n/UHho8tLM3ffzyJXP
         AVTPz69G5zopkRaFhTCFnn05Xfe48EIys2OlLn0GIcGiuubYUzHocXCa+AdDxDwxdy2b
         dOnnmelRTTUU+ue3PUC3GQHdtHBqgg1bZVU1M+RiIKD7d4fTBntbnqAIxHVO12NY3lKv
         HNfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=h5YjncCA;
       spf=pass (google.com: domain of rose_gomoo101@yahoo.com designates 77.238.178.146 as permitted sender) smtp.mailfrom=rose_gomoo101@yahoo.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from sonic308-18.consmr.mail.ir2.yahoo.com (sonic308-18.consmr.mail.ir2.yahoo.com. [77.238.178.146])
        by gmr-mx.google.com with ESMTPS id 14si513947lfy.1.2020.06.13.08.41.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jun 2020 08:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of rose_gomoo101@yahoo.com designates 77.238.178.146 as permitted sender) client-ip=77.238.178.146;
X-YMail-OSG: 229BmzUVM1lUFmDHSj0GBixFDnlzQfK.c7I8FkiRfnhfLsBXx.BtIWWYcby.3Z0
 LM.M8auJxWVqkJuKagYBc7WA7EbJmLDiWUve413pt3Li2qrHjKhMuf1RdsYOLZB5SUVaKTfhkUX_
 8TqWtNK2V406JK9o2JyKwiL9uPHqHdjKe7GUoPd.jK3ZJKKv72WWralY2ISKQlcupDgDLbdCRHzH
 EEc.OcB0yhRkw2ZWUz41UeBqotuM7Y1vof16gTP3NREEO74y1WQq682e0ose_tt.A0iBofrrAy_V
 emX5WCy84188_6pvOQsI7I7n4AflH9ua9YpuW3xhlNl6u_P2We38OSUdxPQqLXEjCTv65tE31N4a
 eTJ8yzgRFQvGUXP6PGalKnF2Mt0lYBKLByMSsOBahS2V0rBFWhr4ZCZa.gq0VdEQuAaHmy.LYNQo
 ZF59PxyGf0lsfSoTMVxjuM.IdrGzPxsBAYgBZ_BMMFCNyPyDUBBu_bZVb3Ur04CRuQApHdWo_lOO
 k6nH2Rv3iVd8xAb2l4BMQJSRsYzfa0fnyNxwqHNk9cMYQ653bZU7gSKBYBbDRSlijWX9UvMAgfV.
 vHEHfk1NvKfk3Bdhk9KIOLji3y7W7Z3clJgqk2Zui66j6WzGt1yKwAmaVBcG20OyBtEc0lJ265Pn
 uwJYekoFgSa7r7sB36qbJ_63YayHRdj864Ql99Vr5gYD71s6vZDU7ntP9wo8uD7WAhKLQt6xGVGj
 oYoxvFybooh1Xc1uby.GTViJIBM09pErGRgOo95ZYDEd2xjHgGP.ufj7sRWo7Y89__XbBa2N31Ow
 ql_PRr1kKITDGTH4OAawIjm1pmoaCqP2hM5c2rFfRrsjthLOlbWRuWKb.1ZYIxnduzM8_tOlsREW
 GU.iojZZweEahTmc6YkAP77fgInCJx7DQcExy43Oyaiac02qyKfA7eRq7_9K.b4a0IgYrTqdMa8S
 VDBrBpxnpaneeyYkkesY2FuDJ.qZTKusgeHeMdjt8jfB2VJNUcs_8Ydq5nBR5opOrJ2nGy0O2RDC
 sdCknPQw_hZQSbJgjFyEgrKq8d5EPHN0MBQrBhJbLKXvRvC1lK3iVw8SjlLfN0anOmWdO4wIaKdp
 Szp5_4MRI_o.UewFWXMiKg.y9qSFNhvtPGD91paMJ3lgybolJKGJYG0ZiDf366lOXBkPiUu30Fe5
 3ctqoEvUpEEHzp6M79_gWcgXnDfCOEsPbfcLi1jneDTuV4bzApWr6zXoi5OUSJK3pmQdzDeA_FlB
 cwG9pT.prpQaEEZXoHgWMamWdKOMmOWi858grnhVq9tI2G3hIY6ZIVV5dC6U-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Sat, 13 Jun 2020 15:41:27 +0000
Date: Sat, 13 Jun 2020 15:41:22 +0000 (UTC)
From: "'Rose Gomo' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: rose_gomoo101@yahoo.com
Message-ID: <438389059.456207.1592062882893@mail.yahoo.com>
Subject: Dear Good Friend.
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
References: <438389059.456207.1592062882893.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16119 YMailNodin Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB7.5; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2)
X-Original-Sender: rose_gomoo101@yahoo.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@yahoo.com header.s=s2048 header.b=h5YjncCA;       spf=pass
 (google.com: domain of rose_gomoo101@yahoo.com designates 77.238.178.146 as
 permitted sender) smtp.mailfrom=rose_gomoo101@yahoo.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
X-Original-From: Rose Gomo <rose_gomoo101@yahoo.com>
Reply-To: Rose Gomo <rose_gomoo101@yahoo.com>
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

Dear Good Friend.

Please can you help me to receive the fund I inherited from my father to yo=
ur account in your country for business investment? Right now the fund is i=
n the bank here where my father deposited it before he died and the amount =
is =E2=82=AC2.5million Euros (Two Million Five Hundred Thousand Euros)

Please if you are interested you can contact me as soon as possible for mor=
e details.

Best regards
Rose Gomo.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/438389059.456207.1592062882893%40mail.yahoo.com.
