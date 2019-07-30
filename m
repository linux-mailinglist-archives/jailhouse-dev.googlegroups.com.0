Return-Path: <jailhouse-dev+bncBD67Z5PJ5EBRBVV5QDVAKGQEP4HB5PQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF07A623
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 12:41:27 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id 186sf24638435oid.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 03:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BUEcCo0ku5eJQsgoD3ynteiMl48LcWy0QIaxLK5ZKtE=;
        b=VgUnkNIuFfh/Qm0eopXA1P8hD5j7+OjGr/dSodcjO9pLaBEkFbRrKlhh/jeK2252Dz
         kXq/FmoLXZqw1r+1qyhpOf+KDo981nakvje7GgE4ByZ9t50Na1epCTDjUE4I9ERrvBzy
         faS5HkdqtZosD6vifKWPLrvtSj1MSSr5z+RxB/svI0tV25vFgsJmz1Ax+jnc9a9xIaPr
         3EASARB+iGH+C4M7BoNTIPkd0aEbtbP8RyzsNbGErYCxKvBfmhCr3x4y4Sc1QN6mK9SZ
         kX6vx3xd9EZkN0ORxSaehGXpy/Imkx1JD4dIkGhyzlN2Pl02UpwHUYJbGGwOnanxYjS8
         2v6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BUEcCo0ku5eJQsgoD3ynteiMl48LcWy0QIaxLK5ZKtE=;
        b=emgEV6pGnWM87t6dxXP9KVVjmy3sdId0u6tDX27pLextb97If5jJGimaQAKSx1KA0r
         UYq2dyhC4u9uGC0WHSDt8EeLijIPv5jRBFf7Xetykc46Ng8vj+NqL+uqywsF1vV4Qxwm
         8OTAIi3JPUPL4+yYkUvgAJvq4wS7MNgG6+8IY7zGGWNtY56efl26hcjO2ZBQummTTxdA
         ujQAisvu9n68hN1/t5k1IFN0VIZTEED/8iP4nhLSfBzkoRMpC2fWF54bSnxfeO538akg
         GJmNAm7o1aiQHKgQy3kEHYA/kfjQnawXrwNU2mvqkpYZ6jkfjsoag0OKX9kubMtzDGDJ
         T9Ew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX8vX0e0u11vJyy3IfzKMEU6YViI9DwgfDuz0iwaUICNy8dTQXy
	wTLTnOl/XsOg/owlWaeG+kk=
X-Google-Smtp-Source: APXvYqxJ3Km4uS9mgcp3n7ZZ5AsCEy170kL/9b8BCioR37RuWyr4E5CC6MNO+vHY51b/neN6dFmPEQ==
X-Received: by 2002:a05:6830:11cc:: with SMTP id v12mr81055780otq.136.1564483286576;
        Tue, 30 Jul 2019 03:41:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6d09:: with SMTP id o9ls12367906otp.7.gmail; Tue, 30 Jul
 2019 03:41:25 -0700 (PDT)
X-Received: by 2002:a9d:5a16:: with SMTP id v22mr62924958oth.150.1564483285852;
        Tue, 30 Jul 2019 03:41:25 -0700 (PDT)
Date: Tue, 30 Jul 2019 03:41:25 -0700 (PDT)
From: Yanqiang Liu <oai@sjtu.edu.cn>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2236da95-491a-4520-b604-6da78afefa2f@googlegroups.com>
Subject: [Starter Question]Creating a new cell may fail?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3585_707496412.1564483285261"
X-Original-Sender: oai@sjtu.edu.cn
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

------=_Part_3585_707496412.1564483285261
Content-Type: multipart/alternative; 
	boundary="----=_Part_3586_334047027.1564483285261"

------=_Part_3586_334047027.1564483285261
Content-Type: text/plain; charset="UTF-8"

Hi all,
I am a starter to Jailhouse, and I have been reading the code. The issue I 
have noticed in the code is that when I am creating a new cell while the 
process is on the CPU that will be reassigned, I will fail. 
This failure seems to occur again and again if I am unlucky. Is it true?  
Or have I missed something?

Sincerely,
Yanqiang Liu

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2236da95-491a-4520-b604-6da78afefa2f%40googlegroups.com.

------=_Part_3586_334047027.1564483285261
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div>I am a starter to Jailhouse, and I have been r=
eading the code. The issue I have noticed in the code is that when I am cre=
ating a new cell while the process is on the CPU that will be reassigned, I=
 will fail.=C2=A0</div><div>This failure seems to occur again and again if =
I am unlucky. Is it true?=C2=A0 Or have I missed something?</div><div><br><=
/div><div>Sincerely,</div><div>Yanqiang Liu</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2236da95-491a-4520-b604-6da78afefa2f%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/2236da95-491a-4520-b604-6da78afefa2f%40googlegroups.com<=
/a>.<br />

------=_Part_3586_334047027.1564483285261--

------=_Part_3585_707496412.1564483285261--
