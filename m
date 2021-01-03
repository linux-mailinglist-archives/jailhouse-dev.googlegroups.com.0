Return-Path: <jailhouse-dev+bncBCWN7IUKQQKRBXWGY37QKGQEI3U5NEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x139.google.com (mail-il1-x139.google.com [IPv6:2607:f8b0:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 487302E8BCD
	for <lists+jailhouse-dev@lfdr.de>; Sun,  3 Jan 2021 11:58:40 +0100 (CET)
Received: by mail-il1-x139.google.com with SMTP id f4sf24800426ilu.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 03 Jan 2021 02:58:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609671519; cv=pass;
        d=google.com; s=arc-20160816;
        b=EaJ2g+lE1HVwuPD0to45LBKZenh1wyetGbwG5FnQFdlTAAp73nsfKIl1ywD8qBQ98Y
         vmU6obFH4nv8k4os6Ozd4cjr2q3Aj4/5PZNaucLwZQjbSeLJuSB71aNwMBNY2rOdVD5S
         iu+6chHlVHO+TqCcazvPXdzXBvSf//jCEkomGI6FQF1rHY/jHndFgF2Yb96KQPAH6em5
         +0lHgK2uKMfKpd1JxYMVWhsiNEmv1vgwb4/EaKm8Vc1LmKrvrjFyfJknQ7Hwm6HX/uLv
         HehPQT7sM/Q3O8qw2bKHl6/oquQbifejLbJrwsD7S5bQM8JjriMY4ldgVNlZTIN7zKBq
         BtWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date
         :content-transfer-encoding:subject:to:reply-to:from:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=af//QvPKHwwjG2hEkjWB+vE7HFvTLz2/0yp3ZU2uc4o=;
        b=SKXE8cSkzxtt7QFV7UEeuy7W+GhLeYD0cL0WX90zL5Z9aNI0oQj3TgRWNDTVJq/mrD
         1kduXkd/8HF9pmB4X1905xJQrIBGYck4Z4eEt9c856OelKncICyz+2OG7jw4WhS+P2Fn
         SyToS3zKj3tCeMaRCbTDf0YUhD7pD9Y29lfrSuIV3jIIfJ9QJ9/cTwtI7L5kBGDFWEYR
         72GOLVefE1eXp/AKEABw2ioKubzpBdONdrizd/wB50hBl2Th1JPkFmOgHpG/XGccUCur
         rotqigkWl7/kGrqkvIIBz5GOdFVr7B5/hL4En1UYdgVxaYEtOpshRm4+yspjwPvGC9RY
         vyEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FtagcoJS;
       spf=pass (google.com: domain of barbaralimon90@gmail.com designates 2607:f8b0:4864:20::42c as permitted sender) smtp.mailfrom=barbaralimon90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:reply-to:to:subject
         :content-transfer-encoding:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=af//QvPKHwwjG2hEkjWB+vE7HFvTLz2/0yp3ZU2uc4o=;
        b=gW9jNQPRRm9ibRtyDAJyIkLmQHmSxS9HY+luzG2y61l2Pf6IrBpLrnWt+8Wri7v0DP
         XV18JPVzV0ucRjNtRG4XBZSWiH55q/ReG0Xn/R1Cm0KL5wTsQ6YOQJwxSRytzV7C/3Vr
         9cmWi+NN4B4gznPAd/BCg8+Q0p6QNHbUKEk79s3AZtrY+TpKsHsmUE4h5l2nHw+AISjt
         R1UMJ5ajqAalbbzoLZP+R2+dGGID4DoMiGVPFeT3nB+i28KQScK6GRo77NhWrYviJl+1
         4xKboOWojFLBSfvpHUTW1H2l9HF6iZ9jq2qq6IIMIO8DaU4KZ7b/vlWbx2WW8lIXnRSO
         FoHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:reply-to:to:subject:content-transfer-encoding
         :date:message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=af//QvPKHwwjG2hEkjWB+vE7HFvTLz2/0yp3ZU2uc4o=;
        b=I9+IqvkbuprSBTzedQlvoHlV+ILKLj5yoqWCMPxFeOPPbvnPT+fcx0l+yjtqiNfOY/
         8xkufa4EHcWd51pHw7adOE03p5V1f8gg2dySkvmEu5zNYgTfn86u/IOw4NXM7jgbzpuC
         KXLLgrZtF1L6cenPMp98d+QfnlfuPn++O2fjIuq+wG3RjjEUN95jJw5GAoUJOP+qzRYv
         nfNjnO59I8QHkRvmSjIGACWryN5E+KVtfWjOU0nLc6czHUBdlrXO4CtL68ahylC98AC0
         30fVLzvlQrIGLjzXDD5C/lEg2PQM9wlwTLh7GxSADiuvYdgnLXzX1QK34AiTSJyjhm1a
         vZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:reply-to:to:subject
         :content-transfer-encoding:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=af//QvPKHwwjG2hEkjWB+vE7HFvTLz2/0yp3ZU2uc4o=;
        b=KRaYJGHl59U97a0wtUjYpfFSLL4Zxfh2JIxnsvmbL6OaNBz8Vtds5DISj0bmYofRk9
         e7kx7DPtIZsBd4XYvXbHscYoOiVwCUmGz6Dc/pPkv+mb66s8+y2t2E+C3vSULMx1ylSV
         Ol3tdM/yUra4za7fxF3OfTxv5tmlYpp1iXQ0r+Uyj2qRgBICktkskwyaoFnIsd7ENH62
         4fDc21Mwk6TJqofC5N0fDAtH7/NXG0HUlCiKciwYEPaJLJXdgJeL4c9Ib1ODPBNEMBSj
         5RAUOkk/SqTdTpB8ycttrjc0TyajmatSPEdIewAcxMhSxb+ZZUHpO0QZe7vbauaIf3Nm
         iIxw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531f9BBGTx5AVbFHWnLSSi6XbyyeT/wrmb4parVvDuREUaXlB12R
	IAs/m+V5O7nNZ20pV6MiVcw=
X-Google-Smtp-Source: ABdhPJyct55ZJpgg9g0MNGSOJBCZJkvQPUsbulOw/AueofyKaFIHAVQkM0ieouRoea7CNKVyd2FCEA==
X-Received: by 2002:a05:6602:29cf:: with SMTP id z15mr56448636ioq.39.1609671518882;
        Sun, 03 Jan 2021 02:58:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:9844:: with SMTP id l65ls18914921ili.3.gmail; Sun, 03
 Jan 2021 02:58:38 -0800 (PST)
X-Received: by 2002:a92:de43:: with SMTP id e3mr65226944ilr.62.1609671518367;
        Sun, 03 Jan 2021 02:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609671518; cv=none;
        d=google.com; s=arc-20160816;
        b=V+TXuT+zE9I7AwzzL15Wm82NvZtj9yZpvn9p98+dFoh9gQoW/ODvvTexegK6KntKr2
         jXkA0oBW4ecekb6Y/Vg6s6Z764qiXWkpudwQsKmRc7Znm+pIOsTJYEy1L8hI9z3L55y0
         ChtgwJPUFCpI326Ueef8Q1ZiHU1DZ9KIgLnL2xFrT/vm9b+0QhgHPsTJO/qw0q+uDNHt
         kjQEiTXZlWofKYIXCD9HHqaX9153kYJS08ARhEprcfOGHtU96L0q6PrQMGftg8h1rEeu
         znMfbvEn7lOslRteG3whdP0C259N9Jz6vxZgaiU3ysKo84MEzjVA9DztnseAsTGigB0a
         2VAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:content-transfer-encoding:subject:to:reply-to:from
         :mime-version:dkim-signature;
        bh=p5Qfb5AKKl/JqHMFQnfYUQrXymdVnV4fiENxA5S+duc=;
        b=Zton+biLc855o66pSRc6/2DtIDZRxFZ78qph/1r9bEdey6B7VDOOQ7QcrwZl1KWbwG
         BMo3TZPjBJiplASrZFupZyjpNAMQRBUgqeOOJ+eEfD0jcjVbrN2RXPvZSlAuLSV4Xw90
         liJ/BlmLCzlahsF/dIisen9+03Aga/yZZaj2A/JcgUhX49Lqz7M60njLVTt4BspT6NXw
         6XP3xofHV13vh5GU8oYQVC/ZRFQVqBp4RMQ87quoKbpCpCcPXgwHlwKL6Wohlzs1N3ow
         OKx9ZRUPnIMfKsW2YXviUTHP0hiT61+AX1wab/8/pWQ6IDOKRjVNJl5Fh0/lVBJrcTIK
         aJjg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FtagcoJS;
       spf=pass (google.com: domain of barbaralimon90@gmail.com designates 2607:f8b0:4864:20::42c as permitted sender) smtp.mailfrom=barbaralimon90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com. [2607:f8b0:4864:20::42c])
        by gmr-mx.google.com with ESMTPS id k131si3509382iof.1.2021.01.03.02.58.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Jan 2021 02:58:38 -0800 (PST)
Received-SPF: pass (google.com: domain of barbaralimon90@gmail.com designates 2607:f8b0:4864:20::42c as permitted sender) client-ip=2607:f8b0:4864:20::42c;
Received: by mail-pf1-x42c.google.com with SMTP id x126so14578526pfc.7
        for <jailhouse-dev@googlegroups.com>; Sun, 03 Jan 2021 02:58:38 -0800 (PST)
X-Received: by 2002:a63:1c42:: with SMTP id c2mr27791340pgm.304.1609671517527;
        Sun, 03 Jan 2021 02:58:37 -0800 (PST)
Received: from DESKTOP53F6QH8 ([103.99.182.34])
        by smtp.gmail.com with ESMTPSA id x18sm52994058pfr.158.2021.01.03.02.58.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Jan 2021 02:58:36 -0800 (PST)
MIME-Version: 1.0
From: "GiftCardoffer" <barbaralimon90@gmail.com>
Reply-To: barbaralimon90@gmail.com
To: jailhouse-dev@googlegroups.com
Subject: Get Free amazon gift card is here
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Smart_Send_4_4_2
Date: Sun, 3 Jan 2021 16:58:27 +0600
Message-ID: <184684644916722522013075@DESKTOP-53F6QH8>
X-Original-Sender: barbaralimon90@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=FtagcoJS;       spf=pass
 (google.com: domain of barbaralimon90@gmail.com designates
 2607:f8b0:4864:20::42c as permitted sender) smtp.mailfrom=barbaralimon90@gmail.com;
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

<head>
  =20
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
252"> =20
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001"></head>=20
<body>
<p class=3D"MsoNormal">Here's&nbsp;</p>
<p class=3D"MsoNormal">how you get to enter for the&nbsp;</p>
<p class=3D"MsoNormal">Step:1 =E2=80=94Click this&nbsp; Link: <a href=3D"ht=
tp://giftcardoffer.org/amazon.html" target=3D"_blank">Amazon</a></p>
<p class=3D"MsoNormal"><br></p>
<p class=3D"MsoNormal">Step:2 =E2=80=94 Choose measure for your gift card v=
alue as $25,$50=20
 yet $100;</p>
<p class=3D"MsoNormal"><br></p>
<p class=3D"MsoNormal">Step:3=E2=80=94 proof you are human or verify humani=
ty</p>
<p class=3D"MsoNormal"><br></p>
<p class=3D"MsoNormal">Step:4 =E2=80=94 Complete to the one simple task or =
offer for=20
 unlocking your premium content</p>
<p class=3D"MsoNormal"><br></p>
<p class=3D"MsoNormal">Step:5=E2=80=94 Check your account</p>
</body>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/184684644916722522013075%40DESKTOP-53F6QH8?utm_med=
ium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhous=
e-dev/184684644916722522013075%40DESKTOP-53F6QH8</a>.<br />
