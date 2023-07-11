Return-Path: <jailhouse-dev+bncBCW4LL4WQ4PBBPOVWKSQMGQEHDDF5GI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3c.google.com (mail-oa1-x3c.google.com [IPv6:2001:4860:4864:20::3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B8674E2EC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jul 2023 03:05:03 +0200 (CEST)
Received: by mail-oa1-x3c.google.com with SMTP id 586e51a60fabf-1b728bfb372sf1717395fac.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jul 2023 18:05:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1689037502; cv=pass;
        d=google.com; s=arc-20160816;
        b=MzZfE4kXkqZVIua3QuVRz8/mhnuxmcUKUVyO0M3XRYXt44Zgtr0JC71mPBAf+zfzDG
         cvLrC1gb83NCQVZeYoaMqGezOo/ghuBerq40Wv1DB1bgZu0rCDqVserVK/bhPNXJNYUT
         2slYO3eon/TJt8/r25YvIkrjM8wY8Khq84gZ75X9vLJA0y5plHuLQZZB6Sim6MNJm6pI
         Oqb0F7EqzZp6DZxN5pAAXWOlz0JGvr7gK4M30cRdUcw8VlgREJd6QduItR0DVyeKDExb
         ZtKGkE1kQl99wR64cvcJLHJxyL1dCsMhjfPqG/oU6KnUmlR5NpWtzazAlehde0+sZoDl
         CElA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=sMPRaxSWHrVIgm1Jrw30m9pJXov0QnuUGI1MQ/sPBKA=;
        fh=84ayPxU0rcmaXOlHZSgwj19quW5K/mjOsmWbuClA0gY=;
        b=QYNZ9nMua00XOwK8aV39yxfrZtzKKIWIMMibiE6SckRNItf2ctZ/LU7ixMdx+XQu+2
         6b0zP4F880od96cjxpCVJDGllpaTMoaj3/HFP/C27sp3FeazXoIjVOVzpxh97rsFR8Zl
         IRXQSbm1eo7Z6v1zefBP1tX4YxQCRNlp06YkjKnBFAMM4RFzn556jUy6LWuG9f4Sxzmi
         UfBV32zwzHk7++mxvoi9TcFOhJ6TPJnrmI6wbijDkmD2qPjVdQUS1iaV/BMaHkh+seVH
         f90PaA0T1xtZmk99CpQqzs3n8DvIM62Fh3XSky77MQ0mdLsWruy+3bGbgcsKh1BjNVUn
         8URA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=XZMPEuDr;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f33 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1689037502; x=1691629502;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMPRaxSWHrVIgm1Jrw30m9pJXov0QnuUGI1MQ/sPBKA=;
        b=WonmSJgbUfpGcTz6IQ1fOdjshyfVAG+IEG0ejb3uVghwafuqcB6jKl79Da/BrCO2Yh
         ZxJKxn88ZMwUPMqC4axf8lCXF29YVeWxqhfFpNDv2F/8LIK5MkIisvYQbTRhhCSiYVhN
         txeZ/Si7ekUaEyvU6eIvAuA5rDHRKmwbivZ5nJbAOA73PG7zigDWVoH5AZcjHBlMow3t
         4qrFqYKmHZljyHLJ5v47B3N05GlGKSFLwsmL0XtJkzbO+/vclrkxEX9Ed6sfodNMienT
         vsfWdcNKRgS108GeVcbY4x0jYeYITDiiopZTNs64VSwZmAODS5KgXg9m0dDChC+YZYNa
         ETsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689037502; x=1691629502;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sMPRaxSWHrVIgm1Jrw30m9pJXov0QnuUGI1MQ/sPBKA=;
        b=Hf3uyPEYkqvP9hIy+wVmm4cIV0fl2DwMqN+pPHOU9KXGBq32j90cX2yD51fkVhrdj3
         RaY/2yUHdMvJl6KBiAfR/0jNoCwO4kaDJr2CTEU+IZhgGglxIeMeH74xHJUW+KSX4C4u
         aIjKv3DmGBPPiImnmuxcDUEucqipm0lLHo8VERuNlk37/cUm/F1xgzLca182hkCeq+k1
         49pBjnEVEQSl8h6aKeyOi5NdK7tClvd81OFoMlJT151O/8V5gSAKCTWm/+uRWfqf5xRK
         ByFIXvhGZUn3iCw1deI5eAHqNliAQxyoOM5pFxmrbY5wdFRSKgCWqosiY63sQ/mMqEem
         ysbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689037502; x=1691629502;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMPRaxSWHrVIgm1Jrw30m9pJXov0QnuUGI1MQ/sPBKA=;
        b=lF3QtgJ3fbWxz0+GETvPPtWYAFzqcFYW7l9SPknvoi0XcA8OJ8uedOZt1gQw90j56u
         TdryzTJMWEySiwdgnBa+RcOy70mapLI6QKDVXQK5jdGohDgFOS9ezMMaCNmpyEfnHZop
         kAW9+8+67IMLuDP6PQj9sSV9X0wOQGKU+4ej+Eqs3P+4qsp80ollrXQHnjkIUjb1RVWL
         AiM5jLEcLv1myf7Hz1Bzj+FVS1CuSU6MtfHsYRbzv6+AGwBT0S7DwvBG+Uy0AWU5AMVM
         u2uzYscRyXHrnq90sOJlkjsgbIVTC9lvUouyAC3RUP5bdOhIA39UJos1Dut4PsgG2n7r
         pnqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLZTyFe8Z4mIZf9hEPfVhe7hwzpIFfIUTGAP6aLxtKPR7xOiCecl
	VsOy36gAbOomB6wSFyJBboY=
X-Google-Smtp-Source: APBJJlGoWA0fVQ04sQnMGZ77F5V8+VzrZUhzTeUopiUmqBg1O7RrkzMzzaZPHcidv9BWl9g6lX5+Yg==
X-Received: by 2002:a05:6871:294:b0:1b3:f0eb:ea7 with SMTP id i20-20020a056871029400b001b3f0eb0ea7mr16622154oae.50.1689037501853;
        Mon, 10 Jul 2023 18:05:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:b521:b0:1b3:d7b6:9f4c with SMTP id
 v33-20020a056870b52100b001b3d7b69f4cls1219449oap.2.-pod-prod-01-us; Mon, 10
 Jul 2023 18:05:00 -0700 (PDT)
X-Received: by 2002:a9d:67c7:0:b0:6b9:6ffd:91e6 with SMTP id c7-20020a9d67c7000000b006b96ffd91e6mr3583859otn.32.1689037500923;
        Mon, 10 Jul 2023 18:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689037500; cv=none;
        d=google.com; s=arc-20160816;
        b=xm/z6Dx1GADdXSbgkMUcBkqhpETbLvKxacP5MOdKZy07Hj2sjeeo3vbVKjJuHidpq6
         zsnCmpbifSz5jcvld70rCkhjsegGPgHUlhLVzZEYwnCHupxmD2IJSTOelfcLLy1zvOJ0
         +AgSUZGtMn+1D0wC4SrdI8HVG36BqDdI8FvRBcMDQzyiDsn0FEY6dpFOKur7Qfc61bRr
         PzyT0oH2qvFgfdjKtN/CGYei1+slNnr5CSEtZrZX+/WHMc7e+Qvl7Z4dfpVhssxD+055
         aMdl6jiWkFmnoj1IdHV9qErQrzDjzixJIL9BL/FD355AZJw2iIZxhFOcInQCBAGDqYcU
         BoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DIrvHlal7rNyntqVZ6njyzNl8Bxglbp9+nieCRRrrZE=;
        fh=84ayPxU0rcmaXOlHZSgwj19quW5K/mjOsmWbuClA0gY=;
        b=C5GcFR/sQUQIVcYyViDr3/Z0OqeOKxJ1TnnyCSFKG+FSkEozTVPDhGDKe2ySpAt2am
         1p91Xn8zeU2+HnqE5qEo/K+BIE4tumH0FaXdJiAPlJ+Ul/QSy2+1dW3Cbzq39Hhswlb6
         ufrtLEMHiIbeCR4ePpZ35fBfcHGlLZF31/J8kamLAdGHvU8Twdl6lYJSCTVOOEmm3usZ
         6IGbxbSIvNEd39mec/+2OK81RoL4l13nT2WWBYAM06EPKe4wHK7KtZneH5wTpGS8XsWU
         QA+Aelx9R/QoCgZ18AHq7gsnLNUFeNmPmnICLXNvuE9uyAME0z8/i5UYJQeVy54pxOv+
         jKbw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=XZMPEuDr;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f33 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com. [2607:f8b0:4864:20::f33])
        by gmr-mx.google.com with ESMTPS id bk19-20020a056830369300b006a5f12c714bsi202971otb.0.2023.07.10.18.05.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 18:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f33 as permitted sender) client-ip=2607:f8b0:4864:20::f33;
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-635f293884cso28989226d6.3
        for <jailhouse-dev@googlegroups.com>; Mon, 10 Jul 2023 18:05:00 -0700 (PDT)
X-Received: by 2002:a0c:9a92:0:b0:636:60c6:203d with SMTP id
 y18-20020a0c9a92000000b0063660c6203dmr10776273qvd.35.1689037500310; Mon, 10
 Jul 2023 18:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <23a847d5-6d75-4ed0-986e-6d58405abb83n@googlegroups.com>
In-Reply-To: <23a847d5-6d75-4ed0-986e-6d58405abb83n@googlegroups.com>
From: Peng Fan <van.freenix@gmail.com>
Date: Tue, 11 Jul 2023 09:04:49 +0800
Message-ID: <CAEfxd-_dzFAhL1wTkCAPyZKQVWNWaSXX6daAKCuiwARGZK8u-Q@mail.gmail.com>
Subject: Re: run non-root cell by SD card in RPI4
To: meiyan xiao <meiyanxiao0319@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="00000000000037eac106002bb08b"
X-Original-Sender: Van.Freenix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20221208 header.b=XZMPEuDr;       spf=pass
 (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f33
 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000037eac106002bb08b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you mean loading the 2nd cell Image from sd card, you need a bootload
run in the 2nd cell and assign sd card to 2nd cell.

If you mean let the 2nd use SD card for rootfs, you need assign sd card to
2nd cell.

meiyan xiao <meiyanxiao0319@gmail.com> =E4=BA=8E2023=E5=B9=B47=E6=9C=884=E6=
=97=A5=E5=91=A8=E4=BA=8C 10:24=E5=86=99=E9=81=93=EF=BC=9A

> Hi, I have already boot the 2nd linux-cell from rootfs.cpio, but the
> function of the linux is very limited, so I want to try booting the linux
> by SD card, could someone tell me how can I run the 2nd non-root cell
> (linux) by SD card in RPI4B?
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/23a847d5-6d75-4ed0-986e-6=
d58405abb83n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/23a847d5-6d75-4ed0-986e-=
6d58405abb83n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>


--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEfxd-_dzFAhL1wTkCAPyZKQVWNWaSXX6daAKCuiwARGZK8u-Q%40mail.gm=
ail.com.

--00000000000037eac106002bb08b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If you mean loading the 2nd cell Image from sd card, you n=
eed a bootload run in the 2nd cell and assign sd card to 2nd cell.<div><br>=
</div><div>If you mean let the 2nd use SD card for rootfs, you need assign=
=C2=A0sd card to 2nd cell.</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">meiyan xiao &lt;<a href=3D"mailto:meiyanxia=
o0319@gmail.com">meiyanxiao0319@gmail.com</a>&gt; =E4=BA=8E2023=E5=B9=B47=
=E6=9C=884=E6=97=A5=E5=91=A8=E4=BA=8C 10:24=E5=86=99=E9=81=93=EF=BC=9A<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi, I have already b=
oot the 2nd linux-cell from rootfs.cpio, but the function of the linux is v=
ery limited, so I want to try booting the linux by SD card, could someone t=
ell me how can I run the 2nd non-root cell (linux) by SD card in RPI4B?

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/23a847d5-6d75-4ed0-986e-6d58405abb83n%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/23a847d5-6d75-4ed0-986e-6d58405ab=
b83n%40googlegroups.com</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEfxd-_dzFAhL1wTkCAPyZKQVWNWaSXX6daAKCuiwARGZK8u-=
Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAEfxd-_dzFAhL1wTkCAPyZKQVWNWaSXX6daAKCuiwA=
RGZK8u-Q%40mail.gmail.com</a>.<br />

--00000000000037eac106002bb08b--
