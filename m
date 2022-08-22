Return-Path: <jailhouse-dev+bncBD4OLX6KQUDRB7M3RWMAMGQE2SPUZ7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13a.google.com (mail-il1-x13a.google.com [IPv6:2607:f8b0:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE2B59BCEB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Aug 2022 11:35:59 +0200 (CEST)
Received: by mail-il1-x13a.google.com with SMTP id s11-20020a056e02216b00b002e9d4c9d98fsf832948ilv.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Aug 2022 02:35:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1661160958; cv=pass;
        d=google.com; s=arc-20160816;
        b=gLs0KVlUNaOe2YtJcW8vckj8bXKvQNxiZlUH+X03dLBirm4hFchcfifcEvDqIbkmuy
         KyVfYPo0pnEovAyJU9gSlf5NU6oYaHRO9VibRMv2iMRj5NTCuxFidNcl4U7xw3mmWoxo
         6SkSCkGTYatOtQmj74czJiMGuCJxuLfy/UTo2d1vff5B6LoztPu697/psMUXMhO4esCv
         B0R75f3BiuGz0g3/4iIS+sp9qOENsq7XVN3JxwH0paqlRNi/0kgyuc3Ww+AtIR2dO9hc
         XW1U7UWhv8w496jNHkLIQJCZO2lYbWKvPXnH1VTnkNsjnQE3CW9wO41L12pvVmSffMq9
         qL/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:reply-to:mime-version:sender
         :dkim-signature:dkim-signature;
        bh=4V+sibc3ytu5MLlRjMyfNdIezK8L9Ci5j077d9vs5tU=;
        b=FSs04y6NfkPf5YfPIad5FdMAAraKKnMzYjlUTcmyl/2L3MtCIcr1XmxovSPiSNY9ro
         gPCuQ1KaIABbKu/e7+D6/iotN+Lf7UTCaUNRC+VcbBP76fBoSnD7vxYcoTGr8MHj8eeo
         qovMW75jOMtxVsk/2H5dAgwpgThlo0V9AEjxzXA482KjjRKo9NzjbdKry2ey1pVoYqqw
         Fsm9I7qCDAe6BolP8TrSQFinjVczeiAt3eIwrAn0uKrVM9Nh1GPg29GN2mFSCJaN6us0
         MQXTdWNFBXNCHzPGRY5XpzPRwNBRsOmfNoKp8G55bzvTUwR0nKGgQiL8cIecpqMDQuUr
         dtHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=DMF1AHaz;
       spf=pass (google.com: domain of williamwinfield60@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=williamwinfield60@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:to:subject:message-id
         :date:from:reply-to:mime-version:sender:from:to:cc;
        bh=4V+sibc3ytu5MLlRjMyfNdIezK8L9Ci5j077d9vs5tU=;
        b=jl1zTD+f6bYd4xaSU6JIazCzpM2OixBnOkUEIiILDvgegQtM78XjsKcCgKOeQlIaOF
         5VgXAhKXauLCfeboPk7yEDV6sl5oN6E4N7JkCDtXnJ/Ks4wGwv6j2Qe9QMtqVzhkA1Fl
         4DjsRFdbDev4h2QzZkwPK0xfD/8T/B2tgFsotiQqgCm6eNhXeDytIGfRK3vD7tK2Bpkt
         ylz4W6byyN4grRcEBf8qmZVgy+1nYj9pN8oZPEkqLgtjeGeoRYTViwTuIpcHXKzs5ppF
         vdL9hdcUHCGcfWISAnluSvEasP4ulaOKrs+i4rjzb/AXvHGX4zPsGsahNM6zFT9BOx2n
         X3XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:to:subject:message-id
         :date:from:reply-to:mime-version:from:to:cc;
        bh=4V+sibc3ytu5MLlRjMyfNdIezK8L9Ci5j077d9vs5tU=;
        b=mGx0YmycvNEuk0b7HuyAOliiPl1wFdgLQTdVVNEMrXmfUpSnGAHxjzczTkxf8yJjQy
         Fbk4xYnkAsbRdzSnSV10Ym4fqrwf9J45kHdyY6aeT0qXb1dNsC/9HHOpRqbm6WRv6oqx
         OXR9c7Bvn12KyuCQtQdUMwrsLZOVppwmCudUjbxK1o7kXx3AtFmTAcvuw0SLutQQJFuS
         iHzpEaLeXXUm4Th9t3ZRJ6JKPmUHrJKHdd9f5U+vm3vpU0CKMhRDn76pooh8GECjDcj2
         SGNxhJ/Yl6d/m6VD7Pd9yer0xVAfEH5fZPlmRmYv8l6bso2k0KysNchSCOrSGxPFZuan
         8fNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:sender:from:to:cc;
        bh=4V+sibc3ytu5MLlRjMyfNdIezK8L9Ci5j077d9vs5tU=;
        b=3JkHBcAtGtQXdrIOCnBbZJC7kjFNdLywz/d4P3itVdZf5pJu1aaMEii5Y8V0ZvJzuT
         hwIVvxdJKYNIn1AHMXUINipHI18u63NWHN8jkB76niEKGnE+ej0CXrUSGtswcu0yJQFK
         XXlRFRXXEj1F0qPjvAAv1dVsA28B5OYNOT0D4v9cEo+BFJBGnTy9sYNUXVku/0uACa4K
         wjyAaogagNnbLG+X7vG9yhAirQg4f4puAwqJ3ljaPqIfo+uCDYsCtq7knvYuWvffe0Mv
         Iy/Dr3Vv4VkF6natynu5NTeC9EZIrFuuMD/a7Dv1qmWknZfmytmU+N5OCj/QVOlKnd44
         eb5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo1mO3dQbcbXZIV8RHVfcAvilnzIPMAli7ZgRFCtazSJdZ9djUQ2
	zh7+Ow2rze0oFlrw1U8KS0U=
X-Google-Smtp-Source: AA6agR7w99iiWNUliZYLv04IPz9MvYPwDQbiEy3wNP0jvxChbsd4Y1n2TcZEAEtktF9Z04BBlHLbBQ==
X-Received: by 2002:a05:6602:2c89:b0:67b:7e8c:11c1 with SMTP id i9-20020a0566022c8900b0067b7e8c11c1mr8659571iow.101.1661160958485;
        Mon, 22 Aug 2022 02:35:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:f08:b0:2e9:385e:7b59 with SMTP id
 x8-20020a056e020f0800b002e9385e7b59ls1490635ilj.2.-pod-prod-gmail; Mon, 22
 Aug 2022 02:35:57 -0700 (PDT)
X-Received: by 2002:a05:6e02:17cc:b0:2e8:f067:ae90 with SMTP id z12-20020a056e0217cc00b002e8f067ae90mr9349029ilu.196.1661160957593;
        Mon, 22 Aug 2022 02:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661160957; cv=none;
        d=google.com; s=arc-20160816;
        b=iwfB3O5gSRxyaW/rZVq0x1PuFOH0bJdAK9hVX1NPsM7n/80+R+qPTjXwxRSC0UKCi/
         U9NZZIbbRPDlkorp3xdDf89JSL4ZKytbgaG9fPBeMnWrp96cD5bszfVab8MdqqU5SQfi
         KN+SKpHBOaGbzjNjc711Z2cw4XoW9vhEXAKqnWTC/XrLnEalJBo1a1X69r/VDoYbvTyg
         tGrfRXnzcOhtzTrSVl+IEkh9Q+DuaVQvrWB7XImJjzmqeeNBRE+O3GKD3rLyoijdZf+X
         uSKt4J5x/rftfM9l1R21qobJSxKOpW8zKxbZxHLJNYwpZ2s9ajK4G7lj4MLmJU/NUEVo
         4QKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:dkim-signature;
        bh=RNqF77wjqF8iy1HAW8fdhj7DkrHd1/Ilt+i0IdRP9TY=;
        b=ufnIdlB6f2HbLXOni8o2A0o52dL/EAngYpcso+4Qcn7BaQACySmBt7RGc7YT+HZKGv
         Xsjn55UdC7e2SFJ5+vorK5J5BRO7kbX2mXNsIR1WMB3QS3Ugcoj7cwHcMA/t24tP8O48
         CW5DY9rkq/L8l5aV00iW58DKZAuup8LI2TICntOS64Pgk4C8kvzu1SEosc5QPq6WSSoL
         VeK0Ji6lXFejOEEidVoD7QCR6NIAkK/509Hj94S/XfOAy6wT6ag+P0758Sn1a3excjos
         jJV0zsIRLluCOGTGi7qEoIbGdyjlGKqrAVbgcB3AM+h9AA41xYigarqYlcEFnoehmnVO
         kXrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=DMF1AHaz;
       spf=pass (google.com: domain of williamwinfield60@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=williamwinfield60@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com. [2607:f8b0:4864:20::1043])
        by gmr-mx.google.com with ESMTPS id v14-20020a056e020f8e00b002de7816ab29si537254ilo.5.2022.08.22.02.35.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 02:35:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of williamwinfield60@gmail.com designates 2607:f8b0:4864:20::1043 as permitted sender) client-ip=2607:f8b0:4864:20::1043;
Received: by mail-pj1-x1043.google.com with SMTP id pm13so1454834pjb.5
        for <jailhouse-dev@googlegroups.com>; Mon, 22 Aug 2022 02:35:57 -0700 (PDT)
X-Received: by 2002:a17:902:dac7:b0:172:e189:f717 with SMTP id
 q7-20020a170902dac700b00172e189f717mr6549726plx.129.1661160956938; Mon, 22
 Aug 2022 02:35:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:f94f:b0:2d5:2242:724 with HTTP; Mon, 22 Aug 2022
 02:35:56 -0700 (PDT)
Reply-To: info@depfinfinance.co.za
From: Depfin Finance <williamwinfield60@gmail.com>
Date: Mon, 22 Aug 2022 02:35:56 -0700
Message-ID: <CAJpWKqwB3Nu6gELU5qfGn_FZU+ZGxHLuJ4+e_GuuNMWT09hUBw@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: williamwinfield60@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=DMF1AHaz;       spf=pass
 (google.com: domain of williamwinfield60@gmail.com designates
 2607:f8b0:4864:20::1043 as permitted sender) smtp.mailfrom=williamwinfield60@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--=20

Good day,

To whom it may concern.

Do you need a loan without stress to pay all your outstanding debts,
Depfin Finance is here to help you with the Quick and Easy Application
Process. Apply Now Online via our website https://depfinfinance.co.za/
Instant Loan approval =C2=B7Customer Protection Blacklist Protection =C2=B7=
 Debt
Consolidation =C2=B7 Business Loan =C2=B7 Personal Loan =C2=B7 With No Cred=
it Check
at 6% Interest Rate =C2=B7 Debt Counselling =C2=B7 Flexible Instalment Serv=
ices:
Flexible Repayments, Customer Protection, and Paperless Application.
Instant decision, No Appointments =C2=B7 Apply Now And Get Instant Cash in
your Bank account.

Send Reply To: info@depfinfinance.co.za or Visit our Website
https://depfinfinance.co.za/apply/ and sign up for a quick paperless
application process and immediate approval.

Depfin Finance Contact
Tel: +27 87 510 7793
WhatsApp: +27630900202
Email: info@depfinfinance.co.za
https://depfinfinance.co.za/
Address: 208 De Waal Rd, Southfield, Cape Town, 7800

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAJpWKqwB3Nu6gELU5qfGn_FZU%2BZGxHLuJ4%2Be_GuuNMWT09hUBw%40mai=
l.gmail.com.
