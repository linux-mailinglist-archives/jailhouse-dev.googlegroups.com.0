Return-Path: <jailhouse-dev+bncBAABBRPU42RQMGQEQOFTLUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB2671FE2E
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Jun 2023 11:45:43 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id 38308e7fff4ca-2b0982c99adsf1081781fa.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Jun 2023 02:45:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1685699142; cv=pass;
        d=google.com; s=arc-20160816;
        b=0IWTB70lEXJyfsxX3a2OTtLVd4KhXKM0tr2G5vKR1LNZqJv4ksk3IE1wVglx4A0wjh
         LN2hB7PHUFhVPrG0Pp1hpfb1ss3MjDx38bGHK3QOzTNGcC+kouLR0XfvGI2lZ2B2Hzf4
         nrTAE7HqvVOAkMI9Qjj0Q4amhq4f2dWJhecj/7cbmouDkOQgnYmPzkGjVjPHhOvQPItR
         j6nYv+Sz5Lttc+IFBWpC4PQegpshBVJ8zDAG3Z0cPcITMzq7Vl1YRIaINGTh3+VSQEZh
         zhOX8NeWwbD3CcQ0kAWvU4fAlW4ood7EOsZPQOlVbdgl/g0DlBLuV5H2ml7HGLDuRbwF
         3bpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=P2XLbGWpFPyyGIqJI3RuR5Fg9rGVhxP5QRy/F0GZ1aM=;
        b=CtGy5CUDQHFRp+gaylz51p9XTFH4mmteFU9lWzjzobHuS8SSYc+bb1k0xm01bWCr7F
         J2dBlrDqDTUz5Ewl8XRnrjwoTlm+StsmKwDXwV1556nussZvljnpwSPMtBZWA5Wj8+uT
         45TxIwPlg8Ru84gWiwRJrO8P8CPABbWemYay/YujqtsEp1i4kVabiUr7Nqikeqc+oSwE
         XZ9pcxfOlSnn0Gtcl2ISya9MOi0xjCQRDUzbmlIuB8oww/mxeOA+HuyQka3czdOq/mly
         aS39mLh5Hr9ExbsW8VKKDwWTYTkBm1O+5Q3g5pNWtMhX+rD7ugeYdl8w0Jk36aImO62A
         D+tQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kumkeo.de header.s=default header.b=pX3qGquX;
       spf=pass (google.com: domain of ulrich.wulff@kumkeo.de designates 91.102.14.10 as permitted sender) smtp.mailfrom=ulrich.wulff@kumkeo.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1685699142; x=1688291142;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2XLbGWpFPyyGIqJI3RuR5Fg9rGVhxP5QRy/F0GZ1aM=;
        b=NNmL2EuqegiIpKLtYgIJitY8Y8HCb9GKssZ6p4kCzoP8laeqjvpBRPAA8zD7Bk4AJ7
         DC6jKPVIpa/2wMbFlelznb1u8c2scx9aWLgQSVmVU5cTI+rXSkFVM+nTQsiQqKhNtIV/
         LoIWFxLDlA07xh6QWVP3xGRXhAi1kWEIYhkU8X/hQc075Lc5epgGuWbT5j4WypqO6LuA
         iD7D9yxHqVbAmCMcXin5JqozuitdrimywmWYkRc0K7cZsd4hyfDNsonujdS1CR+JzQo2
         Eem9sysfEaBxYzzZzgzANrPzDRGLOimdsuLeAYyIgjhyjz0jLQYp9hWD4GJky3gy36F7
         OWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685699142; x=1688291142;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2XLbGWpFPyyGIqJI3RuR5Fg9rGVhxP5QRy/F0GZ1aM=;
        b=I+cM7hkhcD15FrRQO9DW86n/bEYKOl9I6nLrUfQ6LPW2HLVSLydaEaqCkA3Mijk6An
         LaI8Ap2VUxeLNMXR99H92pGazMYCXtxdLmG6yRTQVynxXs9GV7M4m4d4Ro0KMwxfoQA/
         n/+mI0csJL1viD8t+aYnRbGXsUDZrQSl/fBwr2eDZ4GnbxIUKHjg02auOjalwMXO9RcK
         9SWvtzbpKjal0Wxir2tG13Fq5DPoLuJ+TmlBT+y2Cdk9/KL3I7GVUSO7O50b0JmIgSJ4
         3BELQjmFiS7amVvJFda9pp5REWo5++u2/Ak8SK5fgTKhLpyTmKtPGDqZWkGEpfbktPas
         OkCQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDz1wCl/SSeeraDw+BlLp4ZP0oJd2hCL4biAn6mPfDTlkTrtF2Nm
	DQ5MHsYPWRfM1SPBQt5atfY=
X-Google-Smtp-Source: ACHHUZ5HvlS+zDkc6cPEZQjbZJpp4e8jsk6iuhLUaBxrMggXjyIq6T36+/iymiAuXNEo/KniWGnKIg==
X-Received: by 2002:a05:651c:b99:b0:2b1:acd4:162c with SMTP id bg25-20020a05651c0b9900b002b1acd4162cmr655696ljb.4.1685699141813;
        Fri, 02 Jun 2023 02:45:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a554:0:b0:2b1:a764:75c3 with SMTP id e20-20020a2ea554000000b002b1a76475c3ls292946ljn.0.-pod-prod-00-eu;
 Fri, 02 Jun 2023 02:45:40 -0700 (PDT)
X-Received: by 2002:a2e:9c45:0:b0:2b0:84bc:2da6 with SMTP id t5-20020a2e9c45000000b002b084bc2da6mr541809ljj.17.1685699140247;
        Fri, 02 Jun 2023 02:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685699140; cv=none;
        d=google.com; s=arc-20160816;
        b=V4/YrW5sVyOyfP5FlcaF9tKWQV5k6NMexDhEzSisr7vT+9hXTXXK4PP6+urRgnCAJU
         SOylrahC7MrIxZuGQInARZ6ceHrQr0PZHzNX7Dj6xly2/gYEGfO6Gkzk+ra7fYnbeIab
         3AuVzeVc8SIug7UraMOEuXzziAA5yYEiDbANYDWrOUMPZAetkWe/+JPzHHD31Hl7IWf1
         WHCWmscgJ5qALKvnB0bqYIQv5lvVqUYkQAtliLEy8utnY/ncqTZ21/cQ8aoduqb5cw/G
         8+NrFfZ9Q+SztzR+LXZNWYxcNEwobilOSWdu9upbW74NLPDcP7sHBnkmh/v4fHehSEuQ
         rt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=cTmON6SXOv+cOyFBIUAIDydFxOvy8FAXFJSqn32Rz3w=;
        b=VHAGesJDY5UOuLMFXPv4tQDI3OW8yvwQmFFUisSrkQP9eDvO6+BI9RwochULnTO8y+
         FOYWB7/0dBuOd7LQ1HFkahk9mGbdQb+iR1kkNaGzV4pUbpmP8f3vfqc26KwCaQOHUnia
         8IhEYadlM+ye2H5py6arcziQPtEiyusJrftqQ+hl3OQyMkcDF6tU6jfZI8Qfa/hbKWof
         IUFm+pA/zC6Hqb7sf1H7khaCwbVKYLhrEZwp1QIb303ohT6x8vrXjG3WfHMuGADfPjnR
         gvxqmVUcrBnmQawBOvGD/z8PxnyiN163vsrxQdpMec9i0hljrQ5inrwaThPplZASxEP4
         IDWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kumkeo.de header.s=default header.b=pX3qGquX;
       spf=pass (google.com: domain of ulrich.wulff@kumkeo.de designates 91.102.14.10 as permitted sender) smtp.mailfrom=ulrich.wulff@kumkeo.de
Received: from mail1.berlinercloud.net (mail1.berlinercloud.net. [91.102.14.10])
        by gmr-mx.google.com with ESMTPS id i18-20020a2e0752000000b002a8ba7c9a04si129238ljd.7.2023.06.02.02.45.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Jun 2023 02:45:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ulrich.wulff@kumkeo.de designates 91.102.14.10 as permitted sender) client-ip=91.102.14.10;
Received: from mail1.berlinercloud.net (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49AB0FC079;
	Fri,  2 Jun 2023 11:45:39 +0200 (CEST)
Received: from mail1.berlinercloud.net (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DF3FFC078;
	Fri,  2 Jun 2023 11:45:39 +0200 (CEST)
Received: from mail.kumkeo.de (unknown [172.18.20.16])
	by mail1.berlinercloud.net (Postfix) with ESMTPS;
	Fri,  2 Jun 2023 11:45:39 +0200 (CEST)
Received: from kumex2.kumkeo.de (172.18.20.16) by kumex2.kumkeo.de
 (172.18.20.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.23; Fri, 2 Jun
 2023 11:45:38 +0200
Received: from kumex2.kumkeo.de ([fe80::6572:2554:d711:1795]) by
 kumex2.kumkeo.de ([fe80::6572:2554:d711:1795%3]) with mapi id 15.01.2507.023;
 Fri, 2 Jun 2023 11:45:38 +0200
From: Ulrich Wulff <ulrich.wulff@kumkeo.de>
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, "Jan
 Kiszka" <jan.kiszka@siemens.com>, Martin Kaistra
	<martin.kaistra@linutronix.de>
Subject: AW: Re: [RFC PATCH 0/4] arm64: Limit cache invalidate to local CPU.
Thread-Topic: Re: [RFC PATCH 0/4] arm64: Limit cache invalidate to local CPU.
Thread-Index: AQHZlTFlLhxLoyGMz06vpWFnqzldaq93QjTA
Date: Fri, 2 Jun 2023 09:45:38 +0000
Message-ID: <a31396bb7a77423097daa430eb011f6e@kumkeo.de>
References: <20230602074808.1383333-1-bigeasy@linutronix.de>
 <BD7FE16F-42F5-4D5C-9182-2AFC442B43BC@gmx.de>
In-Reply-To: <BD7FE16F-42F5-4D5C-9182-2AFC442B43BC@gmx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.61.103.52]
x-tm-as-product-ver: SMEX-14.0.0.3092-9.0.1002-27666.006
x-tm-as-result: No-10--0.950100-8.000000
x-tmase-matchedrid: biL4YBBTMFZJC9HP7gEJMHpXbwx9aHgaKQNhMboqZlrHhoBEyuHcbTcp
	XpPCV0E3fgzDWzxaUYGImy+rTiaJWXJP+WcG2EDXN/L0PiELZLXpkhHAf9djV7gbJOZ434BskO2
	RIoOVaCe62sn1Xy7Jgd7p/FD6BG2Pu2PzD0SpTPVV8scx1YOQqDVEnbrqmBw7ymV+KD7aQbluPo
	APovQ9g4WC3a1I+chGWO3sffakmrSLahxedAZ5hsZmqSBzWZjEsuW6WlaxpNoed27L56G2Gp4CI
	KY/Hg3AnCGS1WQEGtCm4/3ODjvukSq2rl3dzGQ1GpeevGsoI5eBachtTgT39M/DWHAGDTugaB3X
	83jrFXi8G1AitRUTz+4BzZUNOP3hjH2BlLfmuHbczvBf0umWiOeo3I0VKZnVLpEJF1ROzuWpwXE
	L6auHLVbBLfKusMEl3q5/wFAM7/sldSrg7jJgh37cGd19dSFd
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--0.950100-8.000000
x-tmase-version: SMEX-14.0.0.3092-9.0.1002-27666.006
x-tm-snts-smtp: 68BF01C92D2FDD4EA32AF2B03E62CD19C028709106CC1E82E11E7B283A89F0D22000:9
x-c2processedorg: c2164c60-77f9-4731-9233-294e5719f64e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Original-Sender: ulrich.wulff@kumkeo.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kumkeo.de header.s=default header.b=pX3qGquX;       spf=pass
 (google.com: domain of ulrich.wulff@kumkeo.de designates 91.102.14.10 as
 permitted sender) smtp.mailfrom=ulrich.wulff@kumkeo.de
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

They do not address the same problem. I can not see that flush_icache_all i=
s modified, so this will not solve our problem. This patch will only minimi=
ze the effect.

Ulrich


Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards

Dipl.-Ing. (FH) Ulrich Wulff
Senior Software Developer

kumkeo GmbH
Heidenkampsweg 82a
20097 Hamburg
Germany

T: +49 40 2846761-0
F: +49 40 2846761-99

ulrich.wulff@kumkeo.de
www.kumkeo.de

Amtsgericht Hamburg / Hamburg District Court, HRB 108558
Gesch=C3=A4ftsf=C3=BChrer / Managing Director: Dipl.-Ing. Bernd Sager; Dipl=
.-Ing. Sven Tanneberger, MBA
-----Urspr=C3=BCngliche Nachricht-----
Von: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Gesendet: Freitag, 2. Juni 2023 11:05
An: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: jailhouse-dev@googlegroups.com; Jan Kiszka <jan.kiszka@siemens.com>; Ma=
rtin Kaistra <martin.kaistra@linutronix.de>; Ulrich Wulff <ulrich.wulff@kum=
keo.de>
Betreff: [Extern] Re: [RFC PATCH 0/4] arm64: Limit cache invalidate to loca=
l CPU.

> The problem is the cache flush/ invalidation which is performed
> locally and signal to the other CPUs in the same cacheable domain.
> This is required on SMP systems where the memory is shared between
> CPUs but can be omitted in setup where each CPU has exclusive memory.

You might want to take a look at the patches in this thread:
https://lore.kernel.org/linux-arm-kernel/20200223192520.20808-1-aarcange@re=
dhat.com/t/#u

They address the same problem but offer a kernel-only solution (rough summa=
ry: tlbi broadcast instructions are only issued if more than one CPU is onl=
ine in Linux). The obvious advantage is that it doesn=E2=80=99t rely on the=
 cooperation of Linux and the hypervisor. There may even be a chance that t=
hey make it into mainline.

Oliver



--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a31396bb7a77423097daa430eb011f6e%40kumkeo.de.
