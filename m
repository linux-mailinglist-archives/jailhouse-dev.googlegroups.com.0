Return-Path: <jailhouse-dev+bncBCPOLQPRTECBBCFR36TQMGQEVQUEIIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103b.google.com (mail-pj1-x103b.google.com [IPv6:2607:f8b0:4864:20::103b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F17879336F
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Sep 2023 03:40:27 +0200 (CEST)
Received: by mail-pj1-x103b.google.com with SMTP id 98e67ed59e1d1-26d68b5995dsf3386045a91.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Sep 2023 18:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1693964425; x=1694569225; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjQ6sagQEJs04JTlmRcMHUymBMH/Jro7Jhi0Mtu3BHU=;
        b=qRF4KdV2GmOQrCF1PkoB0ZRsphg4vxZ+zA11jHKJ6BKR9Nf1wI47kXJHPdlRIomX80
         P5aIf+cMCdcqNAYlaosJe7qBrxNOfgq0aezqlQljuWlMQQEy+qIGBw05X10i+E50dUS1
         nADtezD2SzhT2sH+/XJiGAUymmsJ3HrKfXg+aTTpMlVN3mIWNbSAT6aGKsVhzoxhMe/w
         iWZDLAwLy18dE7AskTxodX0n+AevXpQmGKV/YHdVDjIRn8DrEEY6xr1qD2Q2YjO8GB5e
         DBbKTZF2kH0CuF4NwVLzstYHIOJofWyha5iwlP8Ox5A7C60h5FQL4CUkv6AtiVteqIdC
         Xd7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693964425; x=1694569225; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjQ6sagQEJs04JTlmRcMHUymBMH/Jro7Jhi0Mtu3BHU=;
        b=JJTqopfgRGqN4GAdNgH1bJh7yKV8r/tUwKpdFFcZVSIgOybSSzjezQLoZbPUXIzqvS
         oi2Q5bdkEsEOGr7aaUKDj54uo2wUT+UthbjQFp9XB3D6gOOC1A6bjHY58kuwQRDf68dC
         O/H2tFHVsQ4ACeOMuDDjxOz2U16PDCLwFkL/jgfz+1GZFaDLvrYPX7f7zbyYJnbIs1be
         Jh3JVD/pxQjJMx0/arakW3l3RNfXrs9t09xwKBRfONg5SnNjvw6Kbvm2GhnAaGpncdSC
         sjGKC/dx9chHLM7XQ2Y7rP78clvnNCpGax4HQo7LZtZajp3bBLu8xJo4uxsRYb+lXDQo
         ku7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693964425; x=1694569225;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjQ6sagQEJs04JTlmRcMHUymBMH/Jro7Jhi0Mtu3BHU=;
        b=PmORbjuvOA0bDymA9gzZFP2IJj2bvUk2+YF77lUEG8wpBc/xBV4lClFolz4N77OOgK
         PEOqfvB/sfE/JBNBJXuBJFOgRtS9KIKWef3snEX90bQQwSxOYPmGRu5xjTbFg2scM9Eb
         zRJhgaC1Dr4gtmaYlS8R3JBAFJwQM8G0JBT0NYNc9DBaBuG4Fi9QPTn+8UcciuuIGBVL
         +N4EPvUS0yY6ER2S+xdmB1n5EAcyOIXJHDuqGIKcsIXCo0xOxjADa9KE+aJQIV59LDvx
         vgV13DKWI2p3+9KCOI6wuQL1pZOPsrk+3mITNXmf0MmHMUr2K5EIT3TjagI0QqhGDKpk
         Zf1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxXQteZu/dbzfFV6OnqIO6McuiEmfCKcLdOGsvrRv3OXEIDp7n6
	tIhmNfUtexzM1FrXjbYKJWs=
X-Google-Smtp-Source: AGHT+IH1sbRawULE4ObKnNFjLfjjMVpBkKnbCLrbSlJv2O9O6WsWvik6QY7fBeVbuhF5yqt5ZU4IkQ==
X-Received: by 2002:a17:90b:314a:b0:268:2d6:74d6 with SMTP id ip10-20020a17090b314a00b0026802d674d6mr11356145pjb.16.1693964425269;
        Tue, 05 Sep 2023 18:40:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:370e:b0:269:671:d45b with SMTP id
 mg14-20020a17090b370e00b002690671d45bls5280384pjb.0.-pod-prod-08-us; Tue, 05
 Sep 2023 18:40:24 -0700 (PDT)
X-Received: by 2002:a17:90b:1258:b0:26f:7521:25bc with SMTP id gx24-20020a17090b125800b0026f752125bcmr3510996pjb.0.1693964423921;
        Tue, 05 Sep 2023 18:40:23 -0700 (PDT)
Date: Tue, 5 Sep 2023 18:40:23 -0700 (PDT)
From: bot crack <unintialized@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4edd4683-c693-4cad-aca7-53605eef02f3n@googlegroups.com>
Subject: How to add new system register macro definition in arm64?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_16844_273581583.1693964423063"
X-Original-Sender: unintialized@gmail.com
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

------=_Part_16844_273581583.1693964423063
Content-Type: multipart/alternative; 
	boundary="----=_Part_16845_905891538.1693964423063"

------=_Part_16845_905891538.1693964423063
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

   1. I want to add some register definitions.=20
   2. I want to know why #define CNTPCT_EL0 SYSREG_64(0, c14) in arm64 *has=
=20
   only two arguments*, but it can be expanded into assembly "MRS X0, #3,=
=20
   c14, c0, #1"
   3. I didn=E2=80=99t understand the definition in=20
   inmates/lib/arm64/include/asm/sysregs.h because I couldn=E2=80=99t find =
how to=20
   expand the macro definition SYSREG_64
   4. For example, I want to add a new CNTVCT_EL0 (op0=3D0b11, op1=3D0b011,=
=20
   CRn=3D0b1110, CRm=3D0b0, op2=3Db010) register. How should I do it?


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4edd4683-c693-4cad-aca7-53605eef02f3n%40googlegroups.com.

------=_Part_16845_905891538.1693964423063
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi</div><ol><li>I want to add some register definitions.=C2=A0</li><li=
>I want to know why #define CNTPCT_EL0 SYSREG_64(0, c14) in arm64 <b><font =
color=3D"#ff0000">has only two arguments</font></b>, but it can be expanded=
 into assembly "MRS X0, #3, c14, c0, #1"</li><li>I didn=E2=80=99t understan=
d the definition in inmates/lib/arm64/include/asm/sysregs.h because I could=
n=E2=80=99t find how to expand the macro definition SYSREG_64<br /></li><li=
>For example, I want to add a new CNTVCT_EL0 (op0=3D0b11, op1=3D0b011, CRn=
=3D0b1110, CRm=3D0b0, op2=3Db010) register. How should I do it?</li></ol><d=
iv><br /></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4edd4683-c693-4cad-aca7-53605eef02f3n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/4edd4683-c693-4cad-aca7-53605eef02f3n%40googlegroups.co=
m</a>.<br />

------=_Part_16845_905891538.1693964423063--

------=_Part_16844_273581583.1693964423063--
