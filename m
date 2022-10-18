Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBGFIXONAMGQEIHNXODQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 512BE6030BA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Oct 2022 18:28:09 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id r188-20020a1c44c5000000b003c3a87d8abdsf5644863wma.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Oct 2022 09:28:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1666110489; cv=pass;
        d=google.com; s=arc-20160816;
        b=MEZPEoIVqGPENosLVNpWFw84OauQrt1lmB96GC2vyyCHrlUIUQy0qtN/H+q4ubqw5c
         nBvz6vgYBBwfInX0IsJnF6RK2e+HcmYCBUGCjpYeFA4dMuhTyQr23apuulqp9lp9zAiI
         6PdPs09qO08C/+nopjdrvUzw31P/NLbLqJLZhUS09TcxAJqdKWm6IzGgwC0ckEIN9y0x
         QE2ulmk/cC54J8UGyGJmCCU83H2/tYCVmKfkkHhBlGSSCewhDR6QfUbPTzCXoDu7f5bJ
         Nbg7G0RYvLTy2gXpIc4MTUU3d3ZC57oTSJutURq9PAup8aMH00LBKxqLYwuWZQGx5EvR
         C2CA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=N6G0IogEtbBoQUkwmOU9eiW2jvWKvbM5zp2iFMgtn/Y=;
        b=M35Iy3pD/h8BoBWqj4CiOtUv8F9W+s6uLKU2Ry5gZxg+1wQvAkxdYj+nQW4H1cK2yr
         Iq4N/jtwtiglYectJ47SEc84FM2VIQUVytsunkvtBdj9k6wnQ6uxgfCstQSvTXr9JYhB
         s8TqDEXBIFsdtcDEOXJ9Cris7P6FT/3r2O07uG/n3Z1hOu0E8w4ExGlhKUIg/82oxdhX
         3bem/HinhLem7uIbu+oWe5cE4TbUp6mFafZ2cYfcyJ7vzImwWF/uGKgj0KEr8fQYjXf1
         vdqfjxv8eF5YW2CPcTUWMbJ2Y5rbCfw5OeKXg4srSri8TW0nUCCvLqNYyiHld3w2Jtuv
         E+Dw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=b6G0qes5;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::52d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6G0IogEtbBoQUkwmOU9eiW2jvWKvbM5zp2iFMgtn/Y=;
        b=BoR3h28IPbIA3lkyfITVEmbTSJZHW7jWqK7w2dt9Dkjp4Ktr1l65C148faO/4YIKw1
         usjl/QRmNSbT/bT/Qp2IvBWtJcdZlZkxmHrqWsC/p85B1g0eBjzjDlMOBXjeh9x50wMJ
         MQ3YW/4PzS93v7Bah7EO0GEKOrg9BBfzeed9eyXRIDxLO5cc5Z3PJNbmus8GxaZcL2wO
         RPp3ai18zBx9PYFjZfjGVcPQ+7oTOdUC19A0XouwXh1k75B/iAPjv2ATPtrh4UiXtRKW
         UllfqqZLnzb2Ai/d8ARweKvkQlr6UGJTHg30LnuSjvC5RcN+mpJnln3pAIlvJG1AOLvL
         y5ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N6G0IogEtbBoQUkwmOU9eiW2jvWKvbM5zp2iFMgtn/Y=;
        b=cLgr42+S2I8duXbqRmU6L1bpW+8znonD1/vnUQZ3a3N3QqzJ25RKTNEoETkgztcPgk
         gPm1r+1WrTBNRLqFsl7FK7Y5CREuLC1zVDAqhHdekv/6zDm8JJj2rrGmgsBrVPUBoI28
         w0Naau0TPXUqc/ruy+dHBInWeGbB+9/4yK3zg27/bK1wxMCV5hFl+7Bnv7tpWUceTZjV
         lVF5uAMWyCq5oaWmsI4VHTygQB4SQVW0cYBvru8LL9zzHJoYOqnGHgwZvpoYC52mJjic
         JHE+1YvNFn24soyBKSoO01a6q1PvBd5dHA2yUhN8eBRIGqGyVyGkiZeW9psDVD6kidxB
         Pd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6G0IogEtbBoQUkwmOU9eiW2jvWKvbM5zp2iFMgtn/Y=;
        b=4p356EMpQRorMh7cgFnolVzYGYU8n++K7x01CXcclJViHa+P9/DdZ/ODicHoZ6Jjw4
         5hyLSaqolipVa/wxNu9OUkXVT8qF6qDknhinHrzOMbLjH0I5b5dmDOyLTwH9UZOReySE
         ThXcrjiZqh2zuaonDMcTBT0WdkTfKagm7QvfIbjxsZWY0jnVMxdcIAH2nwtGqyZHCqMH
         5A/xWuT2Xgz5NpXxrNQriaaYOGtm8fT/z2FOuUAV4uhCdypSI9DPcX7oXwJ/eXHB6JR4
         iJTtwQcn9p+09KF+R3/SVwH9AmS7Ut7e1GJZaTC0MoPnK2T7pomdfyUW9sP4dNWBQhsp
         hyZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf1MFNshXaaFlKY22M85wunuj7ZfCb90TnYQ1OeMJsiAyv4jfi6B
	Sx1P5nv0MHAHSodhrcVZNqY=
X-Google-Smtp-Source: AMsMyM6mMcMV/HsHx6TJp1x1FIomlbIvklLrmy99OVOYUntNsQuJkUagIRtyV3qq7wOXBvDiwCkC8g==
X-Received: by 2002:a7b:c048:0:b0:3b4:fb26:f0f3 with SMTP id u8-20020a7bc048000000b003b4fb26f0f3mr24401143wmc.115.1666110489008;
        Tue, 18 Oct 2022 09:28:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4304:0:b0:3c4:89fe:ecec with SMTP id q4-20020a1c4304000000b003c489feececls219685wma.0.-pod-preprod-gmail;
 Tue, 18 Oct 2022 09:28:07 -0700 (PDT)
X-Received: by 2002:a05:600c:1d0f:b0:3c6:bfa9:9ef6 with SMTP id l15-20020a05600c1d0f00b003c6bfa99ef6mr23717395wms.136.1666110486984;
        Tue, 18 Oct 2022 09:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666110486; cv=none;
        d=google.com; s=arc-20160816;
        b=sb1SXgXe9vebu5IG2PpcIOruACuzxffPCYzx95kzw5WFGZ+77OSHR2BRHdISXGu19Y
         q/7JB2WM2xTqrPoppS+zluq3bimZFIX5hxc79PG/XGydTQjY3UfdDP4i1Og0rx6e6zOg
         7+x5QVtKbxMS8E3JONA/Z7paXlG62WsVRJldPnoERNtVzjtYQFlwX46U4M6Zcs5fl7l8
         qfsiggvyCBqbEwWi6rsDHYyy5t/kpz+HdfvvnxRM080vyljL7e69fH8Ho4Q04PH6SF8l
         Y3aBwjyryvTRrXkb1ORwwhExx9l4gH8zr7bxfIPs/Kl5bbssdcD756bhh2MT3t18z5xt
         GayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9HXjW6ejRoAjXTziRZNwskSatUZQosU2R8D3UQeJpu4=;
        b=T42nrFC/A9VP3DEavq7bIYTYnz70EXT8j2ttU5knHtyROB+fVTC0XrOW+bKhgyJkbL
         V2mMhBcHev03NnHam65lTThwKHxsHaGxpO/Ee6CX2u+roVDdN6FOhsPJN/+CXlFJM5as
         waTwQUjDgTg0zqTzFwYDeXOooOJPY39HZG7NS3+x175OZLGTTnV1pMe7TVCh4H9w75RT
         yOYGqZq0GKjkWq4tWiuabfLxEnNTLb9Kliv15khWG5akRuquXl5UeitoMd0RBUIp9oew
         eXlpH3QwqNDU1pTZahjHxCY6qp/WvRk9SUeyeQTMKdTBJa114q4x1O48xx615SdRniia
         lzbg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=b6G0qes5;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::52d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com. [2a00:1450:4864:20::52d])
        by gmr-mx.google.com with ESMTPS id a1-20020a05600c348100b003c6c0197f3dsi877840wmq.2.2022.10.18.09.28.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 09:28:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::52d as permitted sender) client-ip=2a00:1450:4864:20::52d;
Received: by mail-ed1-x52d.google.com with SMTP id q19so21286087edd.10
        for <jailhouse-dev@googlegroups.com>; Tue, 18 Oct 2022 09:28:06 -0700 (PDT)
X-Received: by 2002:a05:6402:3492:b0:45d:c00:ea8e with SMTP id
 v18-20020a056402349200b0045d0c00ea8emr3414866edc.150.1666110486584; Tue, 18
 Oct 2022 09:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220822220202.26218-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CA+V-a8uCdhTYh3AzbKy7v+kAFGBwK-6ngDarzHi2Hd1LhwiZEA@mail.gmail.com>
In-Reply-To: <CA+V-a8uCdhTYh3AzbKy7v+kAFGBwK-6ngDarzHi2Hd1LhwiZEA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Oct 2022 17:27:40 +0100
Message-ID: <CA+V-a8tR3je-Z_0d0LHyTuJT8gcC9MrJLdXMm+NY6gaDB9AT6w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for Renesas RZ/G2M
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, 
	Chris Paterson <chris.paterson2@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=b6G0qes5;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2a00:1450:4864:20::52d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

Hi Jan,

On Mon, Sep 5, 2022 at 8:51 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> On Mon, Aug 22, 2022 at 11:02 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Hi All,
> >
> > This patch series adds support for Renesas RZ/G2M SoC [0] (root cell
> > config) and adds demo cell config for HopeRun HiHope RZ/G2M platform [1].
> >
> > Changes apply on top of next branch [2] and the kernel used for testing is
> > 5.10 (-cip) based on BSP-3.0.0 [3] release from Renesas.
> >
> > [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
> > [1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
> > [2] https://github.com/siemens/jailhouse/tree/next
> > [3] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (3):
> >   renesas: Add SCIF support
> >   configs: arm64: Add root cell config for Renesas RZ/G2M SoC
> >   configs: arm64: Add demo cell config for Renesas RZ/G2M
> >
> >  Documentation/debug-output.md                 |    1 +
> >  configs/arm64/dts/inmate-r8a774a1-hihope.dts  |  228 ++++
> >  configs/arm64/renesas-r8a774a1-linux-demo.c   |  114 ++
> >  configs/arm64/renesas-r8a774a1.c              | 1134 +++++++++++++++++
> >  hypervisor/arch/arm-common/Kbuild             |    2 +-
> >  hypervisor/arch/arm-common/dbg-write.c        |    2 +
> >  hypervisor/arch/arm-common/include/asm/uart.h |    2 +-
> >  hypervisor/arch/arm-common/uart-scif.c        |   44 +
> >  include/jailhouse/console.h                   |    1 +
> >  inmates/lib/arm-common/Makefile.lib           |    2 +-
> >  inmates/lib/arm-common/uart-scif.c            |   65 +
> >  inmates/lib/arm-common/uart.c                 |    2 +
> >  12 files changed, 1594 insertions(+), 3 deletions(-)
> >  create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
> >  create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c
> >  create mode 100644 configs/arm64/renesas-r8a774a1.c
> >  create mode 100644 hypervisor/arch/arm-common/uart-scif.c
> >  create mode 100644 inmates/lib/arm-common/uart-scif.c
> >
> Gentle ping, request for review.
>
Ping v2.

Let me know if you want me to resend the patches.

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8tR3je-Z_0d0LHyTuJT8gcC9MrJLdXMm%2BNY6gaDB9AT6w%40mail.gmail.com.
