Return-Path: <jailhouse-dev+bncBCSPHTXQ2UMRBNMA46BAMGQEP6G2YRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D7345BC8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 11:17:25 +0100 (CET)
Received: by mail-ej1-x639.google.com with SMTP id di5sf848643ejc.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 03:17:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616494645; cv=pass;
        d=google.com; s=arc-20160816;
        b=ITR0kGYN0iDRW3ShOuDxBrtp4pl+pTVG8Fb/bxmXejlGri8VeO2FHT4C2gONmjS525
         aW4G6l11Rrn2zUVACEesAuZlMoJIpnXbFy+gUCy9w0BnQtOl5RvSeu/MDeuUkTZnx512
         +Tpy6voNyslbAtPb93FTzNUfbkdanpUjV+26M9bB+k6rZWcJUmUJUpgM+t7fziwNcgNy
         pxhWhVz4YgqP6zLu5HReqv78l4ZLnwTdx2MJDv9FzuE2SJgG3wIQ3B5syrskLw503KaT
         8rAgoo7AHXDuvaY7sBtxvcZg51MpuyLL+RxcIIkdc9l9wDc2XK4TCpNcZkh9bVdAh3S1
         wAxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=GYHD9S8ML4k9fhDA2QPLMmFboM8qTodkB4eGMLuzSq8=;
        b=EI9QqvGnwwtG3fbCutg1VmR37tC9i9aNYKoJl8/edONbBWkI6nKfH4kUc169lpjF7v
         bsVgnxNyi07xaCKrkx5MxJsaKlJsylnLdYTcUV7GlaMxZXcvi7gf7TnH2/W9PTbMHYPw
         rZR1vh2KR9MJqdzDIxETKP5q3t0Cd8H+K+QPD5Yq/rCAiPupe0eFEiZ9NH81cxx+dH8r
         +B00O5+PWnZB9QFhjxzN5UXc80uYjYSBdrO3yLp5ksNfAm9QbcJX+SWL0q9dua0mdiGM
         wsuvffXFimnH5GzMoyOcfr3r3ITCc16wJT3Ndt+aoAfLmLgUItp/T29uEaAREuiegt2E
         7org==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bkJg1+rp;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to:cc
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GYHD9S8ML4k9fhDA2QPLMmFboM8qTodkB4eGMLuzSq8=;
        b=Fatu99BwBwRqeRXLz8hNVBOKS4D4aE+2vumaanMpgT2bp1r6KoF78wL1kbZ+ylsR1P
         jQdeBSLi/vXoGZwm80RDNnbppOI4hPxDR9P0RBYNTwlDXyAoWf7ia/1e1YGY9Mzv5reX
         x9DzO2ZCCO/9iJr6Ip6o7fW4HpGUS83LaQMTMNedPhQkwWf5BI1k+hUdJaPI0DspHy56
         E0yjIualjYTrfjJ8h6GVMKwXL6VOeKjYrN0cBmPh4AKa9FYk3ToBRYFxQGLNi3/9ISwq
         CuH7tibUmGDChT9XqoNU8Vb/JuDklxQo+63mXLzLKxB7MCitYDojN4mTqbg640lOonv+
         uCcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GYHD9S8ML4k9fhDA2QPLMmFboM8qTodkB4eGMLuzSq8=;
        b=GW5wjZ5vnEsbgKxe0KHSRAK/kd8OUcMGWZPJ+mX5aoW0HnHpN//RiT8u2u4UsGUNGr
         sHYtC8O8IFQARPJbV3XhaOn5r4I132stu20CZBAiO0UZJhUIEntFjUy32gCFEZ2hBNyp
         +RyzWT0+qXvv6mh06Posj/2LxEQUVskasCdiyYrNrB11nX1+5Fh3dEm+abUxYB+BAdQi
         /aDauaVcxFa/lCKDqGUWL268ZyUlCZa0zXYPXrMdCfq69jROApRt570yzrqkUis9iGmB
         5P6eNDQ3ejcMy4RywdPXC9+YNCsqSIFnmNfLgEkg7CNXjAZ0Hn4y/t6I+ju0Q/GIg+VL
         7ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GYHD9S8ML4k9fhDA2QPLMmFboM8qTodkB4eGMLuzSq8=;
        b=flSZUbzZYCFFWLI5HYdwJ7K4Piha6bZrLGxLqR/s85+xBpwt8V5sxM/kyWuC5RUYpL
         3+WN0YDdVxtr6BlyhbIpFSFvgLiR0QGJ++c1ceF+U2/jHvmhboJiYe7S3dBCt0AjgXRr
         6ifwYw217vvtzldNHZ+wzauIIrWYgJIOiHUlZdlqId7Xg7asiPYOLjsORe+DcWCfL0Ko
         C7yj3RoZl4U1ADCaU7Cc9AApQF7mZiBGbZ/iaVn33/8HVlkhU1VFl4qxkfi+XC6wV0kw
         Os9Cp9gRjMoP8rrtMJ7eh8q9gvxkJ2jYk8nxfFzSyT6vAOxAX9Hpl1ly98OBwu97ZfX+
         DZuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530S+EeVflTRawZIURVzIjHs/UgYiWysfLZ/ls8p7HFTdvP2GVQ9
	ZmgMQ2aBCNEpx+Lmlchv20g=
X-Google-Smtp-Source: ABdhPJzuLziqdeLJK9anqip2uce/DYXtUaKA7WRMJWeqf78qHt5UoNP8TbnHYIfnMt4zhG6ljSV/fg==
X-Received: by 2002:a17:906:9714:: with SMTP id k20mr4087203ejx.519.1616494645620;
        Tue, 23 Mar 2021 03:17:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:50cd:: with SMTP id h13ls4666982edb.3.gmail; Tue,
 23 Mar 2021 03:17:24 -0700 (PDT)
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr3949382edu.124.1616494644678;
        Tue, 23 Mar 2021 03:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616494644; cv=none;
        d=google.com; s=arc-20160816;
        b=b5SSUrg7daOyHqOAopO7cfiP7vjTx2x+uBK5ipA/hG/Doo9sSAQX5ITAJzEpyquCCG
         UON5p/TOd+HfWXnuBKdBpr646FrPxX+V/7IB56YN8lpeFPxp6LyYsH8417WfCns6YJDY
         TkObqMjrnbAsEyaS1AWsAfVu1aNaI03skQAEWmAXmo9LY9oi8MJo/lvA2ER4GN0pgbAe
         R9+X99Df+z9z5VRwBffJ79NgjqVyEVqe0b+HF6bX9F1MsS80r6Hxb1mrCLcfjJrzoUS9
         ovlfzaNJMu14nsHYfed/y2p1A1uOWN+yLSWNGWXjwW7bv7KU7J7eQF8w6o77mYFRIBTM
         3bTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8Tc4GMeaOyEBX+WAC9BCkZp2z+jKmy+c8sspQsL1WnE=;
        b=an1vIWgaNiWX9VHGIqBmA7AzCIt4Y1qtwSxvp86TORmfOLufeUWSU7Mq/fGJo92Jnz
         7ltksFt0FoGdfSslaR8Dbrh0TG54B6YMBpvDuzIsFZzSY80vFe9Ii5wuFsicDZfPupIB
         qaqZFONqghKetyKilu3hDGu91G8H1lRwUFF2D0OKceZYDWO+LacEL2onhwJY53EkTd4e
         tpml7yedbMZ0Sv9njUC32Rpw38igIqWAK42TjzMFML9um94MH2jn/4oYT4zr/g1IbcFq
         vbcgBcXkPPfKwMKwj+2u4eNkiJQo0Pmk+DL+TAd+xRpjax3HsLF8YojuDPdy2mWKR/Rq
         TCKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bkJg1+rp;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com. [2a00:1450:4864:20::52f])
        by gmr-mx.google.com with ESMTPS id t7si636020edr.0.2021.03.23.03.17.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 03:17:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) client-ip=2a00:1450:4864:20::52f;
Received: by mail-ed1-x52f.google.com with SMTP id j3so22746575edp.11
        for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 03:17:24 -0700 (PDT)
X-Received: by 2002:aa7:cb82:: with SMTP id r2mr3867730edt.209.1616494644443;
 Tue, 23 Mar 2021 03:17:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:2d8b:0:0:0:0 with HTTP; Tue, 23 Mar 2021 03:17:23
 -0700 (PDT)
From: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Date: Tue, 23 Mar 2021 11:17:23 +0100
Message-ID: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
Subject: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Marco Solieri <marco.solieri@unimore.it>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: angelo.ruocco.90@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=bkJg1+rp;       spf=pass
 (google.com: domain of angelo.ruocco.90@gmail.com designates
 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
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

Hi Jan, all,

I have seen that arm-zero-exits has been merged into next.

My understanding is that right now the only officially supported
boards, meaning supporting both jailhouse and SDEI, are NXP's ones,
with only a experimental patch for the xilinx zynqmp firmware to
enable SDEI.

Regarding that patch, I have looked at it, tested it and added the
missing non-secure-boundary check.

Are you thinking of submitting it upstream? If so, how do you want to proceed?

Angelo

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA%40mail.gmail.com.
