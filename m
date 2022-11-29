Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBB6FOTCOAMGQENN6BMJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 562BA63C27B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Nov 2022 15:30:18 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id z21-20020a2e9655000000b0027736b9bb8asf3243050ljh.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Nov 2022 06:30:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1669732217; cv=pass;
        d=google.com; s=arc-20160816;
        b=s0Aebgj/F4DZ3mVy37ITIOtipkOQdFYT93C2BdN5tEiMwWLwJhV6efANiyHk2eMLAJ
         9SrJh/vDucETjGx5hXoqf0OVgxMOTuzear7dBtuY4QvwL57T+80C8cQjZyPePDU0fIsL
         Zj9bSY1B6jnLc/czYeIJBcrm1cjc6dKQ3DO+oaLwDKXvacTpSjaxUwexIKeuga9bnbS2
         LqgTmvEsJ4UA1uXZYLYJX2w5mq7i9Lb6M5bLFvRK5OIbFARIMYLc2BLrs+6Sddme4ROL
         /r/ygxHnWB9bwcNXCrop3mCsrFPInv5cuPuiVLUONX0KnVp/XoI8nUfDyay+OI6XvD4n
         Pjag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=78BoJzZUoR7T/4uy4DCh7VK4JzoFm5dKxeM8vTGg/Ko=;
        b=dbEhxGxWVv+GdKi/5Fop5gS/W0YrvradHzmOYuJVYvvqYD7hdz8jXlmEi3CFYoM+iP
         rOMI4XxSQERRmOndqdoQadN7Jz9lBdtANO1ItCvUicyuJrfeHsqutTIca1/r6hRbp99m
         0pxHGvphUjmTCuRvFw8lU8YnL0aHEatRhx1TF3cV7fAYBZZwQs/9Y8v0H7SaSjCITqGi
         sJy1JLIP1x5HebahbY6jeg7yXIOj3t1jHP6sH+5SPe8PRQ1Iha0MZVvkccCkorq5iWGb
         7IIavyXGp8XiTnSgc4ewlucqvetrNrcq8Mt7rIArhlFSMjtzhcAkZrrZXXX/b1nhBqBG
         L4yQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=jdKRReDO;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::632 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78BoJzZUoR7T/4uy4DCh7VK4JzoFm5dKxeM8vTGg/Ko=;
        b=Zml1GPB5Ijo2liImsJJDwzhrvwcRHcqYnUhCeiAqbdDjRtAfXiuN0OVA9nOg/2mXye
         w/zOHYSJzI/JuiMgszQ8NOOS30EDLiiNUgRc1cz+YwcHQszFKIo6N6wkNOFSpUyEUJ5a
         VUsilsAJFpjOu61WO8PbLa1X3WLQe6B4aO0bYVgsgzj3XPF9yi0JrUS78djIXz9nYkha
         QdQYq0NiOUF2ZbwpZEMZ8f9T3b7+9SCkeYqYRGZG3ew+hfjSSs4C30WjRdS9PTcyVp5k
         eD2R+KQCsjBGwxRpTYKsjkjIDoNdT+zdgRKx8ySIMKql04t1MUrDpCYB4mVvXJtiz0R+
         ao6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=78BoJzZUoR7T/4uy4DCh7VK4JzoFm5dKxeM8vTGg/Ko=;
        b=A6/7O6TrbTYpVBOTHmDHSCItxiTvJjt84UQlGIqPFPHNW617/SDk9rnJL2wA81PqSR
         BdY/cpYqXb9w4aqREknKgQRpJ+yTbrb9hVqXLjb5N6MCRiej2ZGLtAy8KyMRq5i8pTSS
         +C7juVvHPgYuVXKS5XFGOKJJ5sG/FQI7rPuTgL/B7ndChajxPxWtcu2iiIUwJJIoy5D5
         hdxHSsPYHe13OQE5B7j4oemyx0wOqP0v5sg+4IHT2QegMFvTwSJhxQo/L2l9QuNmVNEW
         9sSs9RtAJJN+Pi7UI0QubBSqAPeYfhTBg7NvMgIf+bdvInYuCvdVY2hPhDnkRbqo6Z9T
         h6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78BoJzZUoR7T/4uy4DCh7VK4JzoFm5dKxeM8vTGg/Ko=;
        b=x5I2Yu20+QAzkf//2JZl9Y1JA5mChVbNM6q8QNcp8Jxme7P5/7bMpKMGI1U8JHKxT/
         Q2udlQ/jribWCDYq0KngD/aaxZDMDRDKNyGYzlVmLidrd7YrnYJHGD/3TGPHRYhy+TzH
         drZCLJnZrWGcScs+iWluTWcITDK7QlPm/Uy5bHbldX8xe/AMyW3Z+CCie6wMbjY3w+Is
         asLX0mRb2DmIeBvnM492GV2F8JmxlZ3ZqA9J5H0MsHrGQvPgFEwMlJbPUVcs4D/MVcv6
         4U2c6NxtHuZpDepq1YQCbbKqjke3gI+qJyYLLqIYvb1GqEhKvJho4g7HkjH+5TY/p30D
         eQPg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pmZYBT2T40boCjqUJ8ngK44TP1fySw/3yMQyj6InIlvLPK83WiA
	orCqbyzFu8tRUWOtaufrHHQ=
X-Google-Smtp-Source: AA0mqf7kGSd+aIcBjsz3QjvBEYxjH6QSuHbqaYb3AM7pQIj5F+ntYRE38InkPpBWlRApDON4XUIfCA==
X-Received: by 2002:a19:f809:0:b0:4b4:b5ad:a645 with SMTP id a9-20020a19f809000000b004b4b5ada645mr15374322lff.672.1669732217619;
        Tue, 29 Nov 2022 06:30:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:158e:b0:26c:56b2:1383 with SMTP id
 h14-20020a05651c158e00b0026c56b21383ls2302743ljq.4.-pod-prod-gmail; Tue, 29
 Nov 2022 06:30:15 -0800 (PST)
X-Received: by 2002:a2e:54c:0:b0:279:8b55:7f7a with SMTP id 73-20020a2e054c000000b002798b557f7amr7560978ljf.149.1669732215415;
        Tue, 29 Nov 2022 06:30:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669732215; cv=none;
        d=google.com; s=arc-20160816;
        b=CrkU4LEocgjPVZfVVtt7CfcQddxKgN0ukLMpyKgWjloi8v1zdsD4koLT4kyMDLn5JK
         nm3Hr9mfgpHpIoiDgP5VlSay/h71xkWl0DV+BheVzFcdw/WEdiBC9u8DeSeHztfl21J4
         BmlC5Zhok4m65ZPg0lxHDTFwL5lS0MEv/0CKQCX7gHYlshcIU/QX/nu9NBglbg17iTYQ
         roSkYQuaHF0yRSHZu7Ucog7LZ9PHbCR8ODgkxejaK3jh5g6KbcU9fIlaaAZGkgBW/IDW
         kDmBT2n8cCZntWVz9csWfGfrtPS1qWybWFyuTHHIjyYV0+ctdTHRqmL9u0N7XmJuzHK2
         kpBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XC4jVbAzgVy7vPHQSBrDQYOEPOcI1l/392RmHBspRIU=;
        b=LJQAH+bzUlGE1kq0QQVlwUjB4IhUlZI1vjBwPSP7YRprkrOaeRxUXdgNarkUjmew4d
         /F1XDguET1+yx9/8O7IQJKMp0zy3Fh7ipSPG76DRMeIJKqzEmMogcdlMO0lKh2XbHNbZ
         /5v5Cp1QlNgN/kdhUxudxZmzUlapTqFEDoOg3aPs1gn4Qu+9DfiTjZxZqg5VAGWXsOUw
         sUISvdL58HJqWYROMcb60OiGF5SEqWt8CBtD/HigSBkN2j28389Uox1zPpzx3dgVgvmm
         sdeQ7r3lslJrYTfNiotRFGxMMpqXtDFQlkofzJUgKkkWHT4rnupIvww5tiLH0UHcI2oq
         rviw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=jdKRReDO;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::632 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com. [2a00:1450:4864:20::632])
        by gmr-mx.google.com with ESMTPS id g8-20020a2ea4a8000000b00278f552596bsi649737ljm.2.2022.11.29.06.30.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 06:30:15 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::632 as permitted sender) client-ip=2a00:1450:4864:20::632;
Received: by mail-ej1-x632.google.com with SMTP id fy37so34163122ejc.11
        for <jailhouse-dev@googlegroups.com>; Tue, 29 Nov 2022 06:30:15 -0800 (PST)
X-Received: by 2002:a17:906:79c4:b0:778:e3e2:8311 with SMTP id
 m4-20020a17090679c400b00778e3e28311mr34370211ejo.342.1669732215005; Tue, 29
 Nov 2022 06:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 29 Nov 2022 14:29:48 +0000
Message-ID: <CA+V-a8uMPfCWMPxJ90AE=dzLSiEEk61Pn4Oxicpv_Sxd9hVhHg@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/3] Add support for Renesas RZ/G2M
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, 
	Chris Paterson <chris.paterson2@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=jdKRReDO;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2a00:1450:4864:20::632 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Sun, Nov 6, 2022 at 11:05 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi All,
>
> This patch series adds support for Renesas RZ/G2M SoC [0] (root cell
> config) and adds demo cell config for HopeRun HiHope RZ/G2M platform [1].
>
> Changes apply on top of next branch [2] and the kernel used for testing is
> 5.10 (-cip) based on BSP-3.0.0 [3] release from Renesas.
>
> No changes from previous version sent to ML, just rebased on the next branch.
>
> [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
> [1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
> [2] https://github.com/siemens/jailhouse/tree/next (9391d30a)
> [3] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (3):
>   renesas: Add SCIF support
>   configs: arm64: Add root cell config for Renesas RZ/G2M SoC
>   configs: arm64: Add demo cell config for Renesas RZ/G2M
>
>  Documentation/debug-output.md                 |    1 +
>  configs/arm64/dts/inmate-r8a774a1-hihope.dts  |  228 ++++
>  configs/arm64/renesas-r8a774a1-linux-demo.c   |  114 ++
>  configs/arm64/renesas-r8a774a1.c              | 1134 +++++++++++++++++
>  hypervisor/arch/arm-common/Kbuild             |    2 +-
>  hypervisor/arch/arm-common/dbg-write.c        |    2 +
>  hypervisor/arch/arm-common/include/asm/uart.h |    2 +-
>  hypervisor/arch/arm-common/uart-scif.c        |   44 +
>  include/jailhouse/console.h                   |    1 +
>  inmates/lib/arm-common/Makefile.lib           |    2 +-
>  inmates/lib/arm-common/uart-scif.c            |   65 +
>  inmates/lib/arm-common/uart.c                 |    2 +
>  12 files changed, 1594 insertions(+), 3 deletions(-)
>  create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
>  create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c
>  create mode 100644 configs/arm64/renesas-r8a774a1.c
>  create mode 100644 hypervisor/arch/arm-common/uart-scif.c
>  create mode 100644 inmates/lib/arm-common/uart-scif.c
>
Gentle ping.

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uMPfCWMPxJ90AE%3DdzLSiEEk61Pn4Oxicpv_Sxd9hVhHg%40mail.gmail.com.
