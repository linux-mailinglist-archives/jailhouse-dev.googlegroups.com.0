Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBK6V22MAMGQEJE3IMOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3a.google.com (mail-oa1-x3a.google.com [IPv6:2001:4860:4864:20::3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3115ACD0E
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Sep 2022 09:52:19 +0200 (CEST)
Received: by mail-oa1-x3a.google.com with SMTP id 586e51a60fabf-1273391d2cfsf1818520fac.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Sep 2022 00:52:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1662364331; cv=pass;
        d=google.com; s=arc-20160816;
        b=vQ4MD/6kUgblq13wA3dvzqbgqL37hdByAjhhOnA2eeFO+NYqudd9bPZ7eehxmDM859
         yMkrsv+bh5PXBrLJv1UjF87iONYUGTEGrh/BS1lXuHkudxCR0J/jJYI+UFDcSiNmwIyf
         KTQY8fF+LfzRvkQF0DtdI8Fw25tXghub98iLQf5ioXLprYY+MqObbLyVwo64pFD9yfy9
         X8q5kk1URXMVsHGAlY/d0fWbUbRG8tIHBsk7Cj/1Cetj1r8KbwT0LE2GvaoCmRT2aZkq
         yru/SFH12F86tb8tv5Xj6ttL1poDDPrgIKC9rk1U//QgA/H4INKCbVZIPwCpPakWq4qf
         d8MA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=yE61AQD1bzN99hLFzS7Z1pwbqjxQHeTXJ1znNxZ/8MM=;
        b=hd8CfFfX+SB341H71JwmpsFEyMMUvdDXLjnLIcPB8vK7F6C5B4WDxxl6dzJbNoWIBi
         lUU6KRHvf9qOXQ22Irh4tbOsHrfaBzanmsFiS8mb2PB1s5uR0AQ7kPJlkgG0/RI/NdDS
         j0jOzzjgpl5A/WFJVp2fApTW4lBRSHRKBv0xvAmXKxn3H8z4++e+S0eA7IMx8Fzg37cp
         oDF2NxjpfZkWMjHttVp2E0gS2jqnzyPguyjFxH8LH9/Qdk/OARSRvM9aNyWpb26E6OeC
         /HNrn9+F1tdBeO1TpNLPSAaWDVwkgpYndjFeLmlFwTVQGcxsZJzFmm9h+9aBmdYW7tCS
         /dyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AlA9w5ba;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1131 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date;
        bh=yE61AQD1bzN99hLFzS7Z1pwbqjxQHeTXJ1znNxZ/8MM=;
        b=TV5yEkeFrynFe2GFyJKdYLv7yUB94JibuioVphjsWeFUcPkNb/qvUoFEMB0hhhBuTa
         I4MOy2dgHUKHZHI/PJwkRJkB0qDFDzs7jP1oT+/BEDo+tg34M2Vc5Tbu1KvxCQRJmTQP
         umDwQt6SH9MzKdBuoKtD9eXZC6EYmgLHgl5uaBPNjHMee16BqX3ueF32/Fpb1fz7VqMr
         /oMbzFvEKAk28gnnzoTp7ZIWqv0HuMxN9eSxu7NJ8SmnK2RxKbvZLtd94ScD5i3NUBjo
         RbX//p25cA5zVc18uJ1LoXtbKDzkkKxeqEb8OGNKeQ21J7uJdMvwUVwxDbl7thDYOiQS
         TIKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date;
        bh=yE61AQD1bzN99hLFzS7Z1pwbqjxQHeTXJ1znNxZ/8MM=;
        b=L0LC5doFIiURBmk7g/SJD/qqsdOoU3GTfnvOZ39rW27RFIhNJFGbDtz19ScBooPASw
         Mh0yi4hehBUv1hx0CRmbDzebCPbcXpx0WYVdvzxhGaOU1Hg6KuFqeXi4nnnVbmv/12eN
         TNfWjlBLkjO2gF+xku+R4nZ+rPtel9bDNIeQfVRg+BFnK7GTQ/xRXMWag6Lj4oC6acrX
         SU0Vn7erRH9L44Sr2MzAhpY4OWJInTQPjdXctHJ/5aWkwzMJlwYgDJxa1DvrQd4I30se
         SzUYqHh9NwHorM4EGW5NP5xScb/RS45Qum/fQjX3MN4tJtNT56NeJP5uRAwedkAF8ZDC
         vTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=yE61AQD1bzN99hLFzS7Z1pwbqjxQHeTXJ1znNxZ/8MM=;
        b=mxDCeMXHRMOP3Vb/gkxQyvtQe9ows7KjfHmJfRvcXMcQzo3K0KVlNN+VYXl0mAoLpq
         OT4tTErvN/7g3QkYAOA7t529H30z1jJJ+qU2bgIM4yNgUETUkpL1dIYfIl3fnjlQgMsD
         45+MOF3AJvtInyulGpLfFk/i2N7FcLzOYqPQGmK9eTRd11hIOH1E4zapr6lVrV7rp8eX
         lgn7ddCGNuYC79l2BvZVmyjENGu3Rd6jNcZJnPENkQcExB/LLM165ToPt30p76u/WNCi
         muuMqrMUmGcUcaSinuyuGaW+D36YzOClNRV/m7IAm41i2p+BYgxtKhZ6T/5B2i76jf+8
         auJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo0jJkL2vpSPSrx+04pvbnWLpUoIfItaJGVkZCm5eSj8K9EG5LRr
	qa9XsUVctZvp9AjA1d7Cj0Y=
X-Google-Smtp-Source: AA6agR6USpCYv38MVvqpTBBzLQc4CFo4mrcUXlXit62XIFBFQZOQhOPKsgHQdt0i+NqUo7BGLC9ZpQ==
X-Received: by 2002:a05:6808:1586:b0:345:df7b:b1b2 with SMTP id t6-20020a056808158600b00345df7bb1b2mr7272195oiw.63.1662364331597;
        Mon, 05 Sep 2022 00:52:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:d64d:0:b0:448:a832:c34 with SMTP id y13-20020a4ad64d000000b00448a8320c34ls460145oos.6.-pod-prod-gmail;
 Mon, 05 Sep 2022 00:52:10 -0700 (PDT)
X-Received: by 2002:a05:6820:167:b0:460:8084:db29 with SMTP id k7-20020a056820016700b004608084db29mr1863561ood.19.1662364330711;
        Mon, 05 Sep 2022 00:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662364330; cv=none;
        d=google.com; s=arc-20160816;
        b=FNZ6eqh5Qw6QU5oO8u/EANr9+99/kI/BC+gHNWK3btITuQXVEcpX4cdx1ulI9h1H1q
         960/abDR8vhmt7Sep/elGND1djYzosVUPf+bqH/UfExSltHaBJns+E26I6+vXqwMarRs
         JHplKjM8FNEcoR9CkG9fW5AGOtkdOJonwrY6UocRcdl2mjZq5NhDQ8ZvVQ43fhNrBfDv
         7VIX6Qla+JEYAeJB4wz8W6mfO2TbB9Q4GsqoskKeQ9t/RJjLSp7n6MQb3JUAuD16YqMU
         E1u+wqdC4DF+Bg2crancybFlCyeW2ICrSeRwg+UunlpZjdCcTH3Gd8r7JCROweN5UP0P
         8QnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HzO7JTLgcrdqQtII+r+KV/QCv0err3sDzO+qokjyPwU=;
        b=empvIP2gG2saJfeITDyqaX1QDYYk20XD/NmxaoFLqBu7L08J51gdU+rh6lyT56vlC6
         z4WFp0+OVN6WN1FrXhIoGCktlqlXB3z5Cou1yOf+3hFsDWldgWPjtLb76Vct3nxEk8a4
         F6v7vQuhSIKkVsPBkEhDwNmZ6klNhSCSU/nMJJvhMs5fNWIQYf6tZLT8iE58SFZrHrUR
         +7+6os08lDh4ihjf2Q+9NqyHpUxY3UfkSCEKv6CGap7L3ejMXhTVjD3Xgb05es/xJJwO
         Jjqobq+DrqZ++gwzcpxdh5MB4bWjIVjyOdYq1ETMCobVVlyLyjIMyLbK14qbkEwjvllX
         GhgA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AlA9w5ba;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1131 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com. [2607:f8b0:4864:20::1131])
        by gmr-mx.google.com with ESMTPS id t13-20020a4ae40d000000b0044dfb9bed1bsi386064oov.2.2022.09.05.00.52.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 00:52:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1131 as permitted sender) client-ip=2607:f8b0:4864:20::1131;
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-32a09b909f6so63531897b3.0
        for <jailhouse-dev@googlegroups.com>; Mon, 05 Sep 2022 00:52:10 -0700 (PDT)
X-Received: by 2002:a0d:f282:0:b0:329:7da1:90e8 with SMTP id
 b124-20020a0df282000000b003297da190e8mr36977932ywf.519.1662364330287; Mon, 05
 Sep 2022 00:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220822220202.26218-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220822220202.26218-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 5 Sep 2022 08:51:42 +0100
Message-ID: <CA+V-a8uCdhTYh3AzbKy7v+kAFGBwK-6ngDarzHi2Hd1LhwiZEA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for Renesas RZ/G2M
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, 
	Chris Paterson <chris.paterson2@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=AlA9w5ba;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1131 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Mon, Aug 22, 2022 at 11:02 PM Lad Prabhakar
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
> [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
> [1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
> [2] https://github.com/siemens/jailhouse/tree/next
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
Gentle ping, request for review.


Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uCdhTYh3AzbKy7v%2BkAFGBwK-6ngDarzHi2Hd1LhwiZEA%40mail.gmail.com.
