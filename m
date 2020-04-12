Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBVE3ZX2AKGQER46S5OY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa39.google.com (mail-vk1-xa39.google.com [IPv6:2607:f8b0:4864:20::a39])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3D21A5F86
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 19:20:21 +0200 (CEST)
Received: by mail-vk1-xa39.google.com with SMTP id e10sf3302167vkk.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 10:20:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586712020; cv=pass;
        d=google.com; s=arc-20160816;
        b=aRf83bFNGTQ6brU729hB2kNd9imFFWe+yrMmeGMgNXvyBXdDuM60OnwiCMRISA1VRB
         SxLGQ1AfHJ4Yhf/arMXxMvVc9LOOi2x1JuHKbehrHFOe2b+5FyKKEu3LW5XzxkmyGRY9
         PF9j0Pl4PiHvIIVFgQxjUNvAwIOMKNnLMtDPdPP5OExWdKMbZfwPKQddqAosy3SOz9pk
         cCCdDPzNTuFIWlHJyF1TwwMo5Ufrkx4E+6R/jFHDXUpvLKqKexR/XjSQ+RajEaEn/MbK
         LDgu6TPi9JpPHRdRLfBecjDGMarMAyBK89Ubm0PfVeIKdif6xbTKyQks+kfzJTbgbXJh
         evjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=L/GoLwAmhSQr/8xlBghXa5auup6GrYy5AcRrQEdtHls=;
        b=HaD+Nhti7KOewkj9My1kMq2LC9nB6AdXbUs2xMsAdLRX6p68aE4e2d0AWR/bwp13Wv
         U7KrOjaPM6OJNXjv8Y09OheN8Q57PBkR7dFzZpqJeO/ry4VxBEp4mgRFhopjJijy3M7u
         tazhFlObvg188lUtbL8yNMQXxArWhDREyJKZtBWJBLhA0CUewaCLcDMD/uafiw5iTjia
         cnBLBghh3FDe0oepg9DSRuRW0bpBfEmH1pqCTXTVn2jAuYdi0i1PHWr2IRD43g6RdQPP
         hKuWllQcwxh6nTN32SUL5hhQik5AIZpsR9V5gSZP+6ub6vOSfeq8mk9DRtbsh/8avtgX
         Z89w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ywDN3Pl5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L/GoLwAmhSQr/8xlBghXa5auup6GrYy5AcRrQEdtHls=;
        b=KBSV8nhj6bdmF2W48sxtvyYoDgbFiEvlgI0a8kso9PdPhBftuF/FEgAhfnjP2EscWt
         vyW9uiD2mRlF2xtQeg3pWsHQrJJIzVaY+aAdOgmipeHChwUfOKCz5IhEcU/Kav8WG5PR
         AMl6PsjvL+I09K5XGIzsvcVyEuQMo/G2JfWnRnbz0DPRM6RqbZNP4c4Y8UYfvIOs2KLp
         XaFdyVb7hvQ+BCmEmTJkswEYzDTLkIWLzmB4Iye1t4i7GQ/3Bz2UZVagFdG8uF7rT4Np
         5fkStvwcRGZuC1tDxffZbe53gKntznCzCXfyWUfrFJ3GGGJKbk6QEv7AOWoN6RSWjtDX
         hJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L/GoLwAmhSQr/8xlBghXa5auup6GrYy5AcRrQEdtHls=;
        b=G58S9uqDX/R1ZE+USRmcSGfx+lkwTQJxRyFYsG/+1KfVWb6hBEx97Gwv6i9GpnxCa8
         N95SrzbBpO+DFNCUDiCGPtWRpEjOMU7iu/WWqCIleoDTnqcB4n3yvvFs4bzrUsIrzROi
         30Yjp/hADKW4w14rSdh9WXP7PjbR/7faPz6fmSYEJtlaQtQU00/tOSH0cu7+iW8tuEo4
         0pFDaW1IkXLUwJGKPnU7h2IeIPNGgMxB9z0bsLCFceJQr51bWpCxepdxibiMyBJdHtRA
         /cFAJKKXVUQ4gnGX0x2gG5WZW5ubmrwmEwB8yG/94fdjufYQVpzI9YqGZw9pFeqadspq
         bzSg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pub7VXyKYnC4bI+eEDRft+hsF5OMEzVM7LeqjKPUxRi++MwSXYsG
	5E+Aw2JQQuVb3/0Hslsrk/0=
X-Google-Smtp-Source: APiQypLnlpz6KNU8sgFZYVrWV5j/p1u6nmo8STdoBEhde37vCKx33hhGqFp/r6mRmLS8UN5LSShzpQ==
X-Received: by 2002:a9f:2324:: with SMTP id 33mr8944320uae.75.1586712020764;
        Sun, 12 Apr 2020 10:20:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:f10c:: with SMTP id n12ls2704773vsk.1.gmail; Sun, 12 Apr
 2020 10:20:20 -0700 (PDT)
X-Received: by 2002:a67:fc8d:: with SMTP id x13mr3625066vsp.83.1586712020172;
        Sun, 12 Apr 2020 10:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586712020; cv=none;
        d=google.com; s=arc-20160816;
        b=RPCKZG8YdoCncCCb+Xf6qLWCjFFKizMJdXQbo59Jq0mzTkZuUwa1Lszby/HsWXp38o
         KtRuHBGfFebdb4r1L8xzqKi55mOo8UYqEgmuslpn3eQ4Uv2ZONXZkhZFLwj/h9ZWHZjK
         TRsseNOFaksaH2VxZMxeQqjcwGeM9NEDH5dJV3put6LNOXPNUOzlmVNUQktffZUtfZQR
         tIY3aC2ZRijmUY4+eqIy+XKSIZdRcglJPeesyg88NpYWdEi7B8WikWEaVL4wZlmT46g1
         aq0EjLWMcHYaGAyf6GKQTm30QWJmxLfAXVKSD63n2u9C/C1QWjtCUhV+c0dw3p08esKr
         Hwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=M9CK9vVUlWAloWNuoAJ2It92E89euFuMQinsFxzTXtw=;
        b=WSGmmYJ95yqUuwBZzjokWMglm7C86RRVE4OkZtuchIwtOihQ+5chzpM+8YNw6ZJMX+
         jjGAIsOUpCqSeDQImFuxP5pPJk9KOy65Shjdic1me93kIrQ08S4YDsPfMU0mFcqPf7dw
         8p+A0CM5WaqPgG3KOH8SaencRLjKm8jCqlHvQYkUtPBrKEbqz3rxzgP3ZSH8DOtJQbxC
         O7T4L9WYozhGtoXq4u4kOD2SkQgZXgdUulTu88D7DrD1uaUnMOz8jnsk7njnQpowO5x8
         JGQqlA9Hk18cSVVKRjL0Ifu+RxUSO0L8PXcZLhQMEmFEe5LAV4r0fSurtXqA/yzL/ve2
         xraw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ywDN3Pl5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-12.smtp.github.com (out-12.smtp.github.com. [192.30.254.195])
        by gmr-mx.google.com with ESMTPS id p16si89537vsn.0.2020.04.12.10.20.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 10:20:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) client-ip=192.30.254.195;
Received: from github-lowworker-1b8c660.ash1-iad.github.net (github-lowworker-1b8c660.ash1-iad.github.net [10.56.18.59])
	by smtp.github.com (Postfix) with ESMTP id 5EA6D121258
	for <jailhouse-dev@googlegroups.com>; Sun, 12 Apr 2020 10:20:19 -0700 (PDT)
Date: Sun, 12 Apr 2020 10:20:19 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/ccc44a-72ca0d@github.com>
Subject: [siemens/jailhouse] 1aa19e: x86: Reformat for_each_pio_region
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=ywDN3Pl5;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.195 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 1aa19ea3076e2b4df1d39b1b9c2f0ea490f81c42
      https://github.com/siemens/jailhouse/commit/1aa19ea3076e2b4df1d39b1b9c2f0ea490f81c42
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-04-12 (Sun, 12 Apr 2020)

  Changed paths:
    M hypervisor/arch/x86/vcpu.c

  Log Message:
  -----------
  x86: Reformat for_each_pio_region

No functional change, just the for-statement more compact.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 72ca0d21973add5f3192922b034f1aaaf2746cf2
      https://github.com/siemens/jailhouse/commit/72ca0d21973add5f3192922b034f1aaaf2746cf2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-04-12 (Sun, 12 Apr 2020)

  Changed paths:
    M inmates/demos/x86/apic-demo.c

  Log Message:
  -----------
  inmates: x86: Add LED blinking support to apic-demo

This is analogous to gic-demo on the ARM side: Grab led-reg and led-pin
from the command line and toggle the specified bit in that memory-mapped
register at the pace of the print-outs to make an LED behind it blink.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/ccc44a81d8d8...72ca0d21973a

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/ccc44a-72ca0d%40github.com.
