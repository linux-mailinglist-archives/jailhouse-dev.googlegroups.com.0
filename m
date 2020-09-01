Return-Path: <jailhouse-dev+bncBCZKRDGF7APRBDELXD5AKGQEI6FDNMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1037.google.com (mail-pj1-x1037.google.com [IPv6:2607:f8b0:4864:20::1037])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB3258A4F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 10:25:50 +0200 (CEST)
Received: by mail-pj1-x1037.google.com with SMTP id nk7sf166568pjb.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Sep 2020 01:25:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598948749; cv=pass;
        d=google.com; s=arc-20160816;
        b=s9Wtt/W2+z7kq6z5HeKijqodtcuGU70Yuds/izZhEWnv+pOyFGSFt/1x1O8Vb06V1t
         GDgrrhj6WWy4yUDHYA5o9JxbqGwHev1Wsb/bkDzu7DOxsFf5Rw2wYOE7i0cPJ6qPdZsH
         F5JY6PD0VZpJTGrzxF794v5gLmoejoiECadgoAU6PUouKMfW4+adFfA9gEPnKLbsTMcz
         g9QXxcTVXTiwRs+ncY5Va399xLVjHGmMGyYWqbqhcNWvIzXWEOjX28E65fOOCX0KfHkl
         vG8vVrnGN4xACY/q3XNaTqhXrPbJuO6ge/JcMyAPAuWQ30XchVnVVYXzuDTei3UJjcHN
         od6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=cy0PWw12a1Eopy5MCd9vEt+G4cjccUl4lQafQrybeJE=;
        b=Uj/Z60ExzXaoPibuE/rKLmlrVNLiFKmn/6uF/KVl9Cdxu+gRU7SVskZjmIbxDS92/L
         dnsgruh/Q49gxSjIxkz8VPE0dtkO8YADFq4CKp2TZUKTKrUxA5X5et6JMrZS3xglQvCX
         hBH4bY0ksalORTUnA10CEAS2hOTkenuc9qTR4LyOng2J2Y1AuR1Ub8LvoH53Ot0SnnHh
         CYmMhrQP3Km/fNgUJGoBIPzDxzuX7ziOn17Ck2TjQ0KgwEt+wVBsszcOyt72z6v+mqXw
         xwr++W9WFofsb+jT+Cv58o534fvgcmpfdxx+uLvujjewc++CIAlC8bXZdVJB2ic0V+Hy
         d9wQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=Z6rxxUEY;
       spf=neutral (google.com: 2607:f8b0:4864:20::343 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cy0PWw12a1Eopy5MCd9vEt+G4cjccUl4lQafQrybeJE=;
        b=nNP3b0A50E/i2VryVrH6hKHjtpyldYwElBHIvVtaU0s58eit1+aeXrmofqIJeJI83F
         o04guIk7CPZYdMFAao2dtPaiTB6oK/Fp1m1BFSZjKX4qA1vZe0rQ318DNtHETWghjxXO
         BbWYigMzlSDkmdiV2/EK8Bfu3jTp1VAK97AfJzzrp8XUhR7ZpMpGXoRYGGFmRx4W+hWC
         pd9K5o3Ak0v8cfQcw/as6X9c9ByfAUoSYHPdVOZa5WggKxEzdm6hot1JxZXwLohUMDZe
         FpY7H9uGiIZXg3Y4+WAe3ciPqLfaY1umMFC1+M8Zw9Si8ibJpxxDVvinrda4DZU0khxV
         KGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cy0PWw12a1Eopy5MCd9vEt+G4cjccUl4lQafQrybeJE=;
        b=s8sWgHWtrR+CuA6JCu2EME/Af3ltPMOargVp61kB5tAWpDLrs1TLdW+6nNs8tuhHZj
         IEoxN5Wm0XKKznCchCrBGyKsYCI18Bg1I32NSXcMUwvFWHXQiQIjw0DVLA0gShvu4Ukq
         a+upFJ4xHprhqJvpow71GeS8MggIpnum/IZT2XIgTjDVZWKiqVlgPYN/4US1q2X3wdy0
         Br7DeRgD801Hy9Wi03bKTSbTrA0+EQ2w1koGNjfhS3/p2o1lSTqzrhwo2x+jAC3KzhLs
         2LVNmIaGaYl2ZHpDB1qrJpwDJg24tuNZ9Fgiro0SIQyxDZBiptmIuNfReXWbBPCI5f51
         7xRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531SWJMQAQUFqS5bm1anrAvXvkUinlw2eeOIEtXybYvsFiBhXzOV
	6qZsPGipatoYOQxZj/hqv18=
X-Google-Smtp-Source: ABdhPJzKkARBbEBzetW+lZRMMtdckI9Na0tg7KJCW3Qd4UpOpK+KUazKtFflPbCvKEBWf7qaJc8DTA==
X-Received: by 2002:a63:4b10:: with SMTP id y16mr550612pga.93.1598948748882;
        Tue, 01 Sep 2020 01:25:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:45:: with SMTP id 66ls297111pfa.1.gmail; Tue, 01 Sep
 2020 01:25:48 -0700 (PDT)
X-Received: by 2002:a63:4b10:: with SMTP id y16mr550571pga.93.1598948748116;
        Tue, 01 Sep 2020 01:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598948748; cv=none;
        d=google.com; s=arc-20160816;
        b=CqUZrJQpPkmdGjabE1Hba6mpcfPD1WyZcaozjWDALZKR0YDIfkbEo9cQ32SltUJ1y5
         FYM6GFu/Ote2eIJGrEtU06dBgjSimkGIH/HcZVisUV4mb6SwxXLOKBsanC3NYKlt0Zaf
         6VoxX3QXcM8naDFctBEmIf1m1EIXqCNjAg3f9uh5rv2vbNK5mjYQoCaovMWwC2jVcYfE
         t5EJDf3P+10zFeOvBgQDPFIXr+jbFeNA3k6BbmEgUwYjLqUPlVOr98Zd8fpGCkqx0NBh
         wvEMSTBPgQQIxZpVOzcATq4OfbM1eMrAWJgiN/L5xrJ3K7Uu5HnTJLYiXv2kpr/prk1P
         WHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V2PioYR+laHnmw5k1TXMvyBjHO5SbI0oFBSGgpEoaFg=;
        b=WEsGWCIxIgNOldqvmFMgIbwpM3KuWajQWhpZw8YF+0x2i0VPqHsZyyRV49Ag0v+8+o
         Ylc8MXP0c5d/q4+Ikcz/StXrF3Jyrdk+MdpO1Uaj/6Yr241EG+aSSh7MGuMNBlxFfHaf
         dMV7dgAya7isW6QBNWW+KMG4OWiPfR12T7NxoAkmrhyHhfFjBvmhw2oFgbpDup9rVFTQ
         k17SFwqecr8QSu/dqqG9DXVPGatmwTKPtvkYuQ+lufBkp/iEvDId2PqlphcJJsQpARFA
         QsaWjdMxwq/8ZtwWUqUh9aqvZpixW4QrmASzb2GWCwQYhfiHa/84JLQpiZsX7BkE9oA+
         ik9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=Z6rxxUEY;
       spf=neutral (google.com: 2607:f8b0:4864:20::343 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com. [2607:f8b0:4864:20::343])
        by gmr-mx.google.com with ESMTPS id nv17si16418pjb.1.2020.09.01.01.25.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 01:25:47 -0700 (PDT)
Received-SPF: neutral (google.com: 2607:f8b0:4864:20::343 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2607:f8b0:4864:20::343;
Received: by mail-ot1-x343.google.com with SMTP id v16so445341otp.10
        for <jailhouse-dev@googlegroups.com>; Tue, 01 Sep 2020 01:25:47 -0700 (PDT)
X-Received: by 2002:a9d:4d88:: with SMTP id u8mr601195otk.81.1598948746795;
 Tue, 01 Sep 2020 01:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598871229.git.jan.kiszka@siemens.com> <5e286f069b8aa2266915b28531e7e11d2cfa1069.1598871229.git.jan.kiszka@siemens.com>
 <46dbf0c0-68a1-7a62-8cc2-13a5b95d449c@siemens.com> <CAGdCPwvhkChVGGkr-fe=Q4WYEr2f1tQ0+GSHDnKRpfWWsYSp1A@mail.gmail.com>
 <a01043f1-4db6-dd1b-6730-4c9ee9e309f7@siemens.com> <ca0589ec-07b3-e577-1082-66d897022238@siemens.com>
 <CAGdCPwsDoF-HSb_Lpx_mWw-DAqbwOWJ+W=m+06Nac6DMRp=6NQ@mail.gmail.com>
In-Reply-To: <CAGdCPwsDoF-HSb_Lpx_mWw-DAqbwOWJ+W=m+06Nac6DMRp=6NQ@mail.gmail.com>
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Date: Tue, 1 Sep 2020 10:25:35 +0200
Message-ID: <CAGdCPwvW8wf5s-caksX05gW5aLyYV=cPTnAVycyECNxjC5fZvQ@mail.gmail.com>
Subject: Re: [jh-images][PATCH 5/5] rpi-firmware: Switch to overlay-based RAM
 reservation to support all variants
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000112f0405ae3c442d"
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=Z6rxxUEY;       spf=neutral (google.com: 2607:f8b0:4864:20::343 is
 neither permitted nor denied by best guess record for domain of
 jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
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

--000000000000112f0405ae3c442d
Content-Type: text/plain; charset="UTF-8"

>
> RPi dropped the linux,pci-domain property from the physical pci host,
>> and that made our vpci config incompatible, moving it to an unexpected
>> domain. Fixed, please have a look at the v2 series I just sent.
>>
>>
> Will take a look.
>

Looks good, the interface shows up as enP1p0s1 again and gets configured
automatically.

Jakub

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGdCPwvW8wf5s-caksX05gW5aLyYV%3DcPTnAVycyECNxjC5fZvQ%40mail.gmail.com.

--000000000000112f0405ae3c442d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">RPi dropped the linux,pci-domain prop=
erty from the physical pci host,<br>
and that made our vpci config incompatible, moving it to an unexpected<br>
domain. Fixed, please have a look at the v2 series I just sent.<br>
<br></blockquote><div>=C2=A0</div><div>Will take a look.<br></div></div></d=
iv>
</blockquote></div><br>Looks good, the interface shows up as=C2=A0enP1p0s1 =
again and gets configured automatically.=C2=A0<br clear=3D"all"><div><br></=
div>Jakub</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGdCPwvW8wf5s-caksX05gW5aLyYV%3DcPTnAVycyECNxjC5f=
ZvQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAGdCPwvW8wf5s-caksX05gW5aLyYV%3DcPTnAVyc=
yECNxjC5fZvQ%40mail.gmail.com</a>.<br />

--000000000000112f0405ae3c442d--
