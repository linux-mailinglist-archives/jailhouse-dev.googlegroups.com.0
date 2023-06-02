Return-Path: <jailhouse-dev+bncBDGIV3UHVAGBBQV542RQMGQEZSXPRRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF471FB5B
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Jun 2023 09:48:20 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id 38308e7fff4ca-2b1abdb8ef9sf3944451fa.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Jun 2023 00:48:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1685692099; cv=pass;
        d=google.com; s=arc-20160816;
        b=N7F4OIjiEPXhScM8M/bSvXaReBYJwP1pxrjWwsrSa3PHhyjBr5a+SZta7Ld6V7mE6M
         bq4gjh510rg85x9T8ofTwYwiV9q1AVLbl7UjB47lGY+MxCTas7fYMRpe8AdH6wU3jHgf
         8rYEeF14UPosT4+kKmO4kUKXH8WovDuxuhVLd50sp+uDuGXBFML4RFv1a29dMltd0KCt
         L9eKuaJNVQGojah+0180E2qa9Z36i2t/u5g39BA5ojO8IWWjqhHF1izRlzW+/srxM/dg
         8SqbY9w22SqN5gLi2LgF6yC3jwYE2p0obLalhU73Tpr0g1tjArbod9RcKWcPU7Vrxjdr
         V/vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=HJVOEBNlr1lHrykZoFtqGg3hfBAT+qUjAs6edGF8H5s=;
        b=nnAZASI2Vdjf9xO09Sj79HkL9WVSk/4B2A0hrxmDJFN//72t296pVUz+a4XHpRgs2c
         dyL90HUD7WWQfG12CbfAXqvFXJvqy7bTp7PmDev6hRil94oi4dw/6dMLbd8u4kv3wOE7
         fr1sEY5ao8Mimb+zryhJkfYn/J7oovhnu2bX98KaEhX9Ogw+Rh4pJxuJzhJ+hg0+X0al
         x6+Bj29wSL4ZaEi84vIjexTM+/6WJxnIGEtaUE0XA1xttH+Fyhso4uiWEF9i3xFZssk7
         u1LOpgCcWvCuwrySDZ0dDWLanSoRgJIazY0U+qsb8tz+C6KFbjq/exDhBoL6XgTijf7q
         /DWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=LAOfB62e;
       dkim=neutral (no key) header.i=@linutronix.de;
       spf=pass (google.com: domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=bigeasy@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1685692099; x=1688284099;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:message-id:date:subject:cc:to:from
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HJVOEBNlr1lHrykZoFtqGg3hfBAT+qUjAs6edGF8H5s=;
        b=BamwsFtVVFUhjRTbEq/Tg2evrlo+piAC85+sdN3xmbJWYxHjL1aGYGA27xAG+A5M36
         zYx/7fbUDFilYZLxVm00+dE86oYAwEtGCx+VRWOhgYXWtyCBY3zZIf1kL6+1i2B6xwKi
         G1krlx9g3cWFz46js2wndBzL563OBsHbemKltWYXOnOuoCbtTp2hwYHtSzr+LoC5e6de
         fgBPrzbwmt+8Mz7ysHvsUTDsJj8A/jUBEUtlSYUpwpWKQEmgKtKM7TfXm0e7/JSmoeDa
         4S8vdUNGXA1Ku/P2qTKVUU2X1BtUEp6FMpFc8/xdedqg5FvUtOKAqcKhF/xjhuq/VuVH
         5SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685692099; x=1688284099;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HJVOEBNlr1lHrykZoFtqGg3hfBAT+qUjAs6edGF8H5s=;
        b=B6PVkF0TedDld+fAPgVQxH/ON8hY55e97wwkXlaNuzzdhtvW1+G01ft2XKCJ3o0n+K
         b4WMZODlH56TpVnRI9lf21PniOzDjhtA8WvMvX4OwE3PbvJK4IJFxxF0HlGKrLMW2k8V
         oaArUXiINj23dFkt2wnpGv+GmgwO/RCXrC9kR8erJKzDo/SPCZUdDqKurTaHNoKL6ycU
         8irCmg2rVFu2wZjTSQMWclOs5KqlT1LtL5jtiewF1831Zx2ErFjM8diODzWO9AcZmK1U
         AlPCLyg68l9IlwKe/oPSA4hKLXQ1krl0QHs/wvK0HSmzSCRW8xPg8DUKyHTHU8HF8u3o
         ZIyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDygOfKFHWSv9DPlkD4pwVKs2tczUoOOtx2K2WTAJRToJ66CI999
	aM7GW3YwRVykyQMqJR9hRDI=
X-Google-Smtp-Source: ACHHUZ5FkHJtXsBPyOj0iwg3WMjC0xdtDLMtbx3DP3uZaKeBO2wqXsi69Fmy7Cz9uB67ITdgy41Ltw==
X-Received: by 2002:a05:651c:91:b0:2ad:bdb7:b4c3 with SMTP id 17-20020a05651c009100b002adbdb7b4c3mr1131829ljq.22.1685692098945;
        Fri, 02 Jun 2023 00:48:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1a28:b0:2b0:5b28:a1e7 with SMTP id
 by40-20020a05651c1a2800b002b05b28a1e7ls27681ljb.0.-pod-prod-03-eu; Fri, 02
 Jun 2023 00:48:17 -0700 (PDT)
X-Received: by 2002:ac2:4a7a:0:b0:4f4:4533:8535 with SMTP id q26-20020ac24a7a000000b004f445338535mr1216121lfp.67.1685692097257;
        Fri, 02 Jun 2023 00:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685692097; cv=none;
        d=google.com; s=arc-20160816;
        b=y0bMRC2l/IeQ1GrEs/mwKPO2BoctiG2N+ro8VrCmfXMgIFHt6yEH5Ac+tEv243bp+c
         X5O5PbUXiFNVLdYw57cn04pYOUuvn4uAZrIb/ISkvrMvkSqrVA6P8JX5UQWtfNpRucUC
         CfZ6DYOeORPTzCrtW+Jv7FnAJuzlUhViE2RnMMax239o1KrP+lNjTxsB/hp6yM8C4sPx
         ugRYIWQ4jo3WDvjyeZs79vXUqUyPz/ecLTsY+Joc1GqqiUZF32KMh2sHMijXeAzEYyL8
         WGGS0a/QO96mt6U40QTf1PfSRDPaZ+YFJ/h1HM1ZRLC3GYohiVYbhvY6FcHJ93LP0NqM
         qgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:dkim-signature:dkim-signature:from;
        bh=FiYGSekzZvD73h5/XweAWO6Bj/cF+BYLQO/W3eEgqOE=;
        b=KoSpLrGOsAFaQg4wXux6wcVzK4CwzQh6GYUWS7fcWvteURiynXUBh6tMH9Yuf3VXZM
         b50gVG/iaFZEO82vZ2Dyl3jT/tJrsZoZfb3z6pXBIuZh8KOwtcwya14wDvBQ2tCFKy2l
         OBwEjP/uIjYUpeZOImfM71KojyH6NwzrUib9dnTieJRNxvVuAlNR7uQclECbibeQQ7Ur
         vbh2QExWTpSe/7Ha0YrHMMuzmNp2vKcTDZf4f0RCWig3UEmd9Nb1+YPwORI0ZHXVtb9m
         mMP9Bh0I7MmVblSv5feruSBu76vahOahw0Xe+RNS3Z5r9s5254khUQDnOYCq5Gq+9Kpd
         fShg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=LAOfB62e;
       dkim=neutral (no key) header.i=@linutronix.de;
       spf=pass (google.com: domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=bigeasy@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id g32-20020a0565123ba000b004f3792ca9b8si41266lfv.6.2023.06.02.00.48.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 00:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Ulrich Wulff <ulrich.wulff@kumkeo.de>
Subject: [RFC PATCH 0/4] arm64: Limit cache invalidate to local CPU.
Date: Fri,  2 Jun 2023 09:48:04 +0200
Message-Id: <20230602074808.1383333-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Original-Sender: bigeasy@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=LAOfB62e;       dkim=neutral
 (no key) header.i=@linutronix.de;       spf=pass (google.com: domain of
 bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender)
 smtp.mailfrom=bigeasy@linutronix.de;       dmarc=pass (p=NONE sp=QUARANTINE
 dis=NONE) header.from=linutronix.de
Content-Type: text/plain; charset="UTF-8"
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

We identified a cache invalidation problem on an ARM64 (Xilinx Zynq
Ultrascale+ MPSoc, ARM v8) SoC.
We have a two CPUs setup where one CPU runs Linux and the other runs a
real time workload on the other CPU. The real time workload needs on
average 60us, sometimes it gets up to 80us but it must not exceed 100us.

The Linux cell can extend the execution time of the real time workload
in the other cell by starting stress-ng with --tlb-shootdown 2. The
execution time rises to over 280us with a few spikes at around 350us.

The problem is the cache flush/ invalidation which is performed locally
and signal to the other CPUs in the same cacheable domain. This is
required on SMP systems where the memory is shared between CPUs but can
be omitted in setup where each CPU has exclusive memory.

The here suggested solution is to boot Linux with HCR_EL2.FB set which
forces a broadcast of each "local" flush/ invalidation instruction to
the CPUs within the inner shareable. So __tlbi(vmalle1) is promoted to
__tlbi(vmalle1is). Then the opcodes can be replaced to the local
version while it still behaves as it before and notifies the CPU within
the inner shareable. 
The second step is to clear HCR_EL2.FB once jailhouse ensures that only
one CPU cells are started. Since each cell has exclusive memory access,
the invalidation can be limited to the local CPU.

As a result of the change, the stress-ng load in the Linux cell does no
longer interfere with real time cell. This change has been tested since
last December.

The patches 1 - 3 are against jailhouse and basically set/ clear
HCR_EL2.FB. Patch 4 is against Linux. Should #1 - #3 be accepted I don't
see how #4 could be integrated upstream. The closest thing I could imagine
is to hide it behind an alternative macro similar to X86's
X86_FEATURE_UP for the lock prefix. Then patch it once the system goes
to UP mode.

Sebastian

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230602074808.1383333-1-bigeasy%40linutronix.de.
