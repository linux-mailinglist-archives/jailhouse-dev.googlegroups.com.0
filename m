Return-Path: <jailhouse-dev+bncBC4PX4ET44HBB7OJSOXAMGQEOWJZ4EY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 934CC84E320
	for <lists+jailhouse-dev@lfdr.de>; Thu,  8 Feb 2024 15:28:15 +0100 (CET)
Received: by mail-ot1-x33b.google.com with SMTP id 46e09a7af769-6e1157f9de2sf1452273a34.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 08 Feb 2024 06:28:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1707402494; cv=pass;
        d=google.com; s=arc-20160816;
        b=E2BZjysCOXDewCAXj+q1rfmvIgkZOxjpCoANPCOjbYzxf7R69FSq71pmv6nE0rheka
         cOGNraS+gfyCFNNIHMK62DewfPIiCtwcDP3oykNoynxgoG1Akh6BAA+YzgdRDB2exoD4
         KB+WjFM183Z5rMdhM34eI1WRNcRQvUmM9umG4uQ64x7fDE3Fto5eiu3hRLKmWi6xZYIt
         wWn1+2nO2SJtTDhGO9Lu4DzeLEwekM6X/pGXt0cXFF4BgjRyNEQ4kovaL2q1rrmIg39D
         3mrplTbWwxlFUBZC4oozR1cojE9W9jcCZy9WSz+EVpj9rYjz9rwIJ6p8KoNZm0Rh122j
         hWQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=5WZcJEtKq1viLK5K7ZxhfN/l3JyOkuJUPfWVD5GaLx8=;
        fh=jELVm7GAPs71FUn8/z7cVOggMv+RoHhue1My6lvJIeQ=;
        b=cat1t3Kd5bHrpwSPmbmvuwTRbudOfdIoXNHJhne16XTK8T9AUT5r0erPJ/lVKB7kTr
         VqYfDopnVVbkjk4Vsodb5dots+WDxWkVkRTCQA5FYKSqNJUEN0YQU5Q9jqgzjIAFKYI8
         5UNFSoHBAOZdaminkwETLaWptFlY9ZkrosB+lADH8jd0gKy8wxDQlNLTSfblhRbs7sfL
         CQrtHNnD8Wli1IuUZHPX9I11a8VTkw+qxZcJINF+i1cPqE/X3Crmp+0cGlJHhQxfPjqD
         fHnTPvKxFhpPaP4D9hsxOm4pX02RwJNAAkqi6bFR6ym4TR3DxP+BZmUZJUv4I3XTsdK8
         FUTA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IMROdQer;
       spf=pass (google.com: domain of wesomonu@gmail.com designates 2001:4860:4864:20::33 as permitted sender) smtp.mailfrom=wesomonu@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1707402494; x=1708007294; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:reply-to
         :mime-version:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5WZcJEtKq1viLK5K7ZxhfN/l3JyOkuJUPfWVD5GaLx8=;
        b=TDKphEvPJXYS7qJ6mXGc3PGxeaijCNHcPxFQmPwrDlAHXR9kzugzUi12mpd84dKZcm
         q0CutESeGF9EBu2zUNz2zEZ/0tA8iFxI8Zn3/sBMalO3YigMp8ZEVrEj93doCUL7inNA
         QXdwTqsQPmkbo2nrMZyr6C+HQi1WGGCdv6lRii3aoIfVOPwbM4ffurRsYWaF36e0zH9J
         tQb4c1mXQLVvbKpO++sleh17t5DuSujB6UiJrDNOqyZMiZwHXi8/shG+XXVITmGBICz0
         2TR6VlvVJQNEwRz+oTZ/TinvZU7ngII2d7rSTFLOZNk0XfW04JScXX3WSE+wG9fi+YKU
         /DLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707402494; x=1708007294; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5WZcJEtKq1viLK5K7ZxhfN/l3JyOkuJUPfWVD5GaLx8=;
        b=cFVAjCNKQXyTDRaZ0f3XwU4gTjRVBHNRwDHbJX2VtATRpU32ClR2KN/MkllMgffmYK
         lRs+FlHGhgJWZ9Sbih8eoJdOU+aLGKZE94YMF24Kh/wghWAUU6TEt+ZsjLUZn8h/IKon
         jCI87hNsJw5MCSnU+Au2D96rZ1Ea80ZyY7YhB//QK+v4Hk9Kjy2XOGm8kQmNXUHIiswG
         GarHxsbD3xQ3O9hd1aevW00ff6HW2VslgWbZaDmHw5k9tlKV3tgKSQiyHPLjHVQaVBs4
         cuYN+1JRiNxDvBimIrIfCijZ2/olky6Ba8ie8C6h6ER7pG1omoIdbdX0I2rcUVsVVD7M
         OMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707402494; x=1708007294;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:reply-to:mime-version:x-beenthere
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WZcJEtKq1viLK5K7ZxhfN/l3JyOkuJUPfWVD5GaLx8=;
        b=dB0CviQBsc13MRk1v2sfH7evkVHGYR9oIGR9w+GhTSJUa5fjuIB7g8x93MhDpq8f6L
         ftT6A2tHw9AmapSZtTPbWnnsX7ftjQYNDbIoAid5yYYLl8zFTV6t4O8cF5G8rXtHONu/
         3koEEM9v0aaZGciq6KVtFNoS/gZjLgB/CnkoPiZebP8Ku8nwHXNJfisjsVeBFjxdF2Ac
         t1mBGr5PbjoPCrchdG3Q1qbcARsM+sz3TfIXP4SyaTUEkdDC9yTffOpDF1woZtHJY9O6
         pY2ofLxoy89KA78eviDsOdGq4SUQbGJVOPPOXHZU0ONGpDZp9+IhFDyPmY3Aa3QSOo5C
         aKnw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCVZS6XGrbMetPqm9AEIdWDUT4naDrBCKpH3wJOXMy/8Y2IV0BKrO0n6vEydhGW3NBtGMkgHTDpQlMxWAqtfmaI9Mjq53YJG0UNUSr0=
X-Gm-Message-State: AOJu0Yzh4TowS0+JyXspL7xGx3M1TYez6hmq5wr4AexcpQXUgebUdLMr
	pHxupBHaRNx7t5qNO76E6SL1qILhkrS1K1R/HAqNH8j6N3L2VQxG
X-Google-Smtp-Source: AGHT+IEki5L+dDuXA8uu9zugfPZWR0qJnY6ehowJCcms0GpNQaXZXzlXWPeWgekXe7xJxd5uP/KL/Q==
X-Received: by 2002:a05:6871:788b:b0:214:3d64:93f3 with SMTP id oz11-20020a056871788b00b002143d6493f3mr9038814oac.30.1707402494011;
        Thu, 08 Feb 2024 06:28:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:88a:b0:219:aeaa:d262 with SMTP id
 fx10-20020a056870088a00b00219aeaad262ls2150808oab.0.-pod-prod-09-us; Thu, 08
 Feb 2024 06:28:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRdLnFepDhaIIAmqULSbqa7VJT5er9U+zL1TFjPsuUC3/pLpzyVRfqEzTNkmCzBe2IiNV0WrNTyC5cxEzhHivlX1khyjJ4lYBn5Mi8mP8=
X-Received: by 2002:a05:6870:8193:b0:219:a97a:c9ad with SMTP id k19-20020a056870819300b00219a97ac9admr9968521oae.36.1707402492615;
        Thu, 08 Feb 2024 06:28:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707402492; cv=none;
        d=google.com; s=arc-20160816;
        b=swTHkbnR+Mpq2q/ggRLYD425oCrjzMWmlekaWhy3gjMZow+sF/hrBVKSEb0BzCoWFT
         efgAkY9gE9Y8+DoEwciJUmIU5fdt6yoievyGnmCiNDdXB0TBiy3IuvhGFd1uMiyIKA5N
         8/IcEtzpo74RGWxYfI/0RyB3rCdVjdShMJH6B/fmcjNWItIR6eYix32OZNjoh6kiWbxz
         Qd/u5zPKbQgl2Tr0FboJ8X77i2tAfjR+EDSl/+RZ3cgArcXkST/Ehr7pQFlwQgFTzp94
         kDNlHG70ciMRR2+FDrb6VZPCQt6RXDAewODhC8pyymib1ekM7mq6zZEvtJHHjsGkai7N
         NlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=Uz8+R6KZeWKGcX2A8kGf0QkaslbBZKYqhFFYRAcgsOQ=;
        fh=vyMofCxP/CXxDG0Kx+ZGys5js/RJq8IvMIj/xlI3BwE=;
        b=wRST7nfHdexJkWDl2FD3BgkrvD4sBxleTMvaeqLCaZksdnn5GKIzL651Pk9W9E3y36
         nbeolz/DbibdUyaXbytuIT2uMiy/2IEh7GCyE2bEyGZ7pnOqA3y2ClE+RLpypqvlQzT7
         fmu6kwpVq0iOxg36AWBUB2pY8BN5v24GbrVunU0sSX8HIep6E5UvMCnUZG64oto2KAzd
         vdgZfJGx4J+n17uguA2JiRB4sA8lrlSy21zkma9Sr2HEs04mAmfyjhVUUiiTjbu+/z39
         SjpDNpI7x0597Fmk/IWVf71gcQX+nYT1pOp+R8vtpEoloH2glD6xGmMe9xFfjO4h9c3b
         Varg==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IMROdQer;
       spf=pass (google.com: domain of wesomonu@gmail.com designates 2001:4860:4864:20::33 as permitted sender) smtp.mailfrom=wesomonu@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
X-Forwarded-Encrypted: i=1; AJvYcCXr6gF98F6d3j5yeep2f3fqojbfrETJxhwEbDL/3Ob2a0u5O7V6Kt1GGLEZm89/PyIxeMWtYmkxPimTLrYNhA61Tq6IZb4cxdF5ffWu5Xw=
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com. [2001:4860:4864:20::33])
        by gmr-mx.google.com with ESMTPS id cn3-20020a056a020a8300b005dc2e3165adsi114645pgb.3.2024.02.08.06.28.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 06:28:12 -0800 (PST)
Received-SPF: pass (google.com: domain of wesomonu@gmail.com designates 2001:4860:4864:20::33 as permitted sender) client-ip=2001:4860:4864:20::33;
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-218642337c9so1083803fac.3
        for <jailhouse-dev@googlegroups.com>; Thu, 08 Feb 2024 06:28:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3ZzDxGRytdVBDT2f6TbwpHe3yaKkiMIZKi3mUxea/x3pxvvFx3EiZ8biQdUXq+4ko6237CjsX2hdBJbxhCwwvZCpWb9m8qOOWnXMo2Qw=
X-Received: by 2002:a05:6871:22c4:b0:219:dc5d:b6b9 with SMTP id
 se4-20020a05687122c400b00219dc5db6b9mr4671838oab.59.1707402491885; Thu, 08
 Feb 2024 06:28:11 -0800 (PST)
MIME-Version: 1.0
Reply-To: mrsmeijerink@gmail.com
From: Sara Meijerink <wesomonu@gmail.com>
Date: Thu, 8 Feb 2024 06:27:59 -0800
Message-ID: <CAJjqWDkfmCDqMWAeRy0Kj5GRk64CcZ9ebPFUzHSUbbU+rH6j7g@mail.gmail.com>
Subject: Hello From Mrs. Meijerink
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000047f360610df9f75"
X-Original-Sender: wesomonu@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b=IMROdQer;       spf=pass
 (google.com: domain of wesomonu@gmail.com designates 2001:4860:4864:20::33 as
 permitted sender) smtp.mailfrom=wesomonu@gmail.com;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000047f360610df9f75
Content-Type: text/plain; charset="UTF-8"

Hello From Mrs. Meijerink

My name is Mrs. Sara Meijerink. I am married to Mr. Jan Hendrik Meijerink,
a Dutchman who lived in England before his death.

My husband recently died of heart disease and I am suffering from cancer.
Due to my poor health, my doctor told me that I might not live longer than
2 months. Before my husband died, he has a deposit of 5.000,000.00 EURO
[Five Million Euros] in a bank. He told me to use the funds to establish an
Animal Care Foundation to support animal welfare. We love animals so much.

Due to my poor health, I cannot handle this project. That's why I contacted
you. I want to donate the 5.000,000.00 EURO to you so that you can
establish an Animal Care Foundation to support endangered animals, homeless
animals and abandoned animals. I always saw on TV that people donate money
to orphanages, but don't care about animals. Many animals are at risk and
face many challenges such as: hunger, lack of medical care, homelessness
and abandonment on the streets. We want people to understand that animals
need special care, support and protection. Together we can help animals.

Please let me know your interest in implementing this animal care project
in your country so that I can provide you with all the necessary
information to transfer the 5.000,000.00 EURO to your account.

I'm waiting for your quick reply

Thank you,
From Mrs. Meijerink

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAJjqWDkfmCDqMWAeRy0Kj5GRk64CcZ9ebPFUzHSUbbU%2BrH6j7g%40mail.gmail.com.

--000000000000047f360610df9f75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Hello From=
 Mrs. Meijerink<br><br>My name is Mrs. Sara Meijerink. I am married to Mr. =
Jan Hendrik Meijerink, a Dutchman who lived in England before his death.<br=
><br>My husband recently died of heart disease and I am suffering from canc=
er. Due to my poor health, my doctor told me that I might not live longer t=
han 2 months. Before my husband died, he has a deposit=C2=A0of 5.000,000.00=
 EURO [Five Million Euros] in a bank. He told me to use the funds to establ=
ish an Animal Care Foundation to support animal welfare. We love animals so=
 much.<br><br>Due to my poor health, I cannot handle this project. That&#39=
;s why I contacted you. I want to donate the 5.000,000.00 EURO to you so th=
at you can establish an Animal Care Foundation to support endangered animal=
s, homeless animals and abandoned animals. I always saw on TV that people d=
onate money to orphanages, but don&#39;t care about animals. Many animals a=
re at risk and face many challenges such as: hunger, lack of medical care, =
homelessness and abandonment on the streets. We want people to understand t=
hat animals need special care, support and protection. Together we can help=
 animals.<br><br>Please let me know your interest in implementing this anim=
al care project in your country so that I can provide you with all the nece=
ssary information to transfer the 5.000,000.00 EURO to your account.<br><br=
>I&#39;m waiting for your quick reply<br><br>Thank you,<br>From Mrs. Meijer=
ink<br></div></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAJjqWDkfmCDqMWAeRy0Kj5GRk64CcZ9ebPFUzHSUbbU%2BrH6=
j7g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAJjqWDkfmCDqMWAeRy0Kj5GRk64CcZ9ebPFUzHSU=
bbU%2BrH6j7g%40mail.gmail.com</a>.<br />

--000000000000047f360610df9f75--
