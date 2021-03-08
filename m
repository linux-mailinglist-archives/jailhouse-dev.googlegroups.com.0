Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMFCS6BAMGQEULTZ3LI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc39.google.com (mail-oo1-xc39.google.com [IPv6:2607:f8b0:4864:20::c39])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0723308C7
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Mar 2021 08:24:33 +0100 (CET)
Received: by mail-oo1-xc39.google.com with SMTP id e21sf4727036oow.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Mar 2021 23:24:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1615188272; cv=pass;
        d=google.com; s=arc-20160816;
        b=QW3rmAEOYPKQVAFb9dX7IFuf9sdWJvn4Lgkw5ASfXuWSzJ7n8e9AGRYWTJhUFqBGhS
         +q+Am8yGrRuDg2oYwreuhEkDLWeUDes+hekNKgUKJPZlAh/7XzxTlDucqbNpV2b24cWx
         EOf/2tJIUBSs3w3QDHD8n6BC/LIrBTFGZQpYxlJm4r0N3mmSfj62SjX2UWxhPyIE7qrt
         vcTAJF92oHUhefLmLKp7KIcacS2SKMp0vIy7BsUG/tyDM74/Yeg4SDw62WHVSd/w7knS
         cPkz18pNSGJ6eso2TRbN7aSN037VHGsU033R7JpZa0wWLiB/iAJMAmtn355OeKUql+fv
         UPiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=wVKt87SfI/1JdQWcbjQiJ8OeCj23luYgeUbdjEAdV/I=;
        b=vWQlcJB2zV6l1ujO4oXzh1Uy9ke7UHBjYKM+cAyGSYcx+H2b2yICxnfWKfKBRFZI7c
         umdtkdm9kAfGE69aEJ6y2pw+zXL/iQBtWXw52DYco00mTfj02x1YcL/FhlNynNnJCQYm
         qzp2dWpb1qhuPEKA5vMUvw9EaOw//YPriwG8YR4sFzgT5RJw6wVEOd7slaO8WvJ9kMyG
         5kxqAOT0n6O7xe7I48LXkzX6KC7ILoIPcK3Ynk9ziLRJ8WqqwXpvQhzQUeyCA7ZH3vOU
         jbh9GBwJqpd651aura1eRNsOg76hCTuWF/o0yNiQQgDJjZyMBNEPGwPXjn3hc5KbmGNP
         9IJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b="1N/inIcy";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=wVKt87SfI/1JdQWcbjQiJ8OeCj23luYgeUbdjEAdV/I=;
        b=geiY/H9j98axP1NqaSdoVHl7o31EUHl6ziOls9t+qVjRtMO39ARLmP9N+bk27dTtlz
         REtVV8qgJzpy6NMFTReaNMTCL3sOpgudkr9DZFqnB5yeesIt8d37f+6HFvxxBI0A6e2k
         xr69wJ1xHB60+3JbubJKbarX3mt65JOZ7AokYU6go0DIxuu+u/9QE8bYk53sYUPY7tr8
         Jj8TLmrGLdSjTy692SbCE1HI+UKRLsTLdSnJMbe8U4Ujlw/3h9T6lbyztM0yJanHS0rp
         4FoG5J7TEggGsljlfYOHX5Qzk9yvLHRr5jamHMFJ1LHBpYh6UixeVtiUVLzrSBENRdHw
         gxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wVKt87SfI/1JdQWcbjQiJ8OeCj23luYgeUbdjEAdV/I=;
        b=Eo2yxjF/payuKC78yHlO020z+v6Z0T9wbeP6RQ8wGRZYuS2huXKn+1pSstaiP6mylT
         WMFR0Ob6uqMQ/0B3r9XTH9GJpwdqeEGm+k9RrSSvtDwk68k3qc3VVN38y07YzyTA+YrE
         8JdVZSBV1zFDMziW7nwX+RstqlnUYipj3C2bmLzckKmXdRcsNV4Nhbit83iOPsH8umzp
         axzHdb4X0/scVGaRjAagLqBsqkyoDbGqhrt/21zhBDAK0PZhCSyMdQ4TUawieLTMx9sc
         AgzRpf+u/F2tjENqDB3Yhr7EZOOoNaUE7/9xwAL2AGM5Dfl1w9uZSOtZsz2wunb70sYk
         KwHA==
X-Gm-Message-State: AOAM530V89DtrTUWKmFmWpaGBfqii2pyBLDXFEXgYT23pW7Y3009l8ib
	NOj6/uwVPl8r3FOSPpeZWOI=
X-Google-Smtp-Source: ABdhPJxxPULc+7GHCwU6Z9dAmkyQuYUdpJplrERfMCCu0vm86Ll3JhSQJaZp3pI3mSdtzkDMNhlJgw==
X-Received: by 2002:a9d:4a8e:: with SMTP id i14mr19003803otf.37.1615188272114;
        Sun, 07 Mar 2021 23:24:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6a0e:: with SMTP id g14ls4327248otn.3.gmail; Sun, 07 Mar
 2021 23:24:31 -0800 (PST)
X-Received: by 2002:a05:6830:1d4a:: with SMTP id p10mr18969255oth.216.1615188271740;
        Sun, 07 Mar 2021 23:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615188271; cv=none;
        d=google.com; s=arc-20160816;
        b=wtSBwAeKv5issvlv2QOe6/SfI8dKRmm6zcpZaDxbs44ItJVPPGpowB5AAyC99RIS6L
         adXQPPbty6rF6hrZdhldRtVMv78BnHOZTuUJQai0I3Z7p7RS9oBXJd0Te04sVALt4wMz
         1korixXzTwllLHqAAybigrGpK3snB6UmaqjbTPgUvnPi0loNjUobK1Ej/LHUORDLVUew
         AWrHXhQcQ3CZXO0Rf3oQ3IRIIJ3RaATmNZYqqh8ZcbIbLcl7YXDRoD2It/PTnBgQGLmk
         XID+h4Up5NgFcH8IfHZNZqY0L0cMqPMMW01jXQyOMZFkD50WSNuu6ay/aSliILWVAhv1
         xo5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=vYnUeTQ/fYQB8BTGIKixfroG9tG9dTO3kynawc3JEUg=;
        b=fsb6nizeqgVkG8NA0TVbvjYD0i7ICx2DM9fhlxnmzh3hrD7GP+nf4dzLdH5Ufu6RHq
         s2/xSJDNgYLP8/FM0NmbWPBSbK2AjolId4v6E8vr3XStCr1iqHr8fUIIEl5G31wHTfl+
         Mnw4QozFlFbNrjD/lokhMy6FN3qvY+1CfabetWgoybDk3K1EYg/PHSdvXSup8Exsm2J1
         Aojmebxrgy18U2Mq1WvNlk7ZqkUIkz2hJ1v/0405b/+/MOZT70Xc8OFuLn8V6SmhO2TN
         84OYKgKwXaXrEEvEuF9jLXjaiO5kmEzpUyWkx/7qOjA2VXKDYNESCpU9FyRuxoyXNPit
         Y5+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b="1N/inIcy";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id y26si641270ooy.1.2021.03.07.23.24.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Mar 2021 23:24:31 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github.com (hubbernetes-node-965e5d4.va3-iad.github.net [10.48.120.85])
	by smtp.github.com (Postfix) with ESMTPA id 5EB77E022A
	for <jailhouse-dev@googlegroups.com>; Sun,  7 Mar 2021 23:24:31 -0800 (PST)
Date: Sun, 07 Mar 2021 23:24:31 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/13c360-ee0e5c@github.com>
Subject: [siemens/jailhouse] 49b3b3: arm-common: Reorder gicv2_cpu_init
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b="1N/inIcy";       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/wip/arm64-zero-exits
  Home:   https://github.com/siemens/jailhouse
  Commit: 49b3b33c1338a59fd333c69fffbff813990f8042
      https://github.com/siemens/jailhouse/commit/49b3b33c1338a59fd333c69fffbff813990f8042
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c

  Log Message:
  -----------
  arm-common: Reorder gicv2_cpu_init

This pulls CPU ID validation and gicv2_target_cpu_map setup to the
beginning of gicv2_cpu_init so that we can fail early if needed, before
any changes to the hardware configuration are made. This will also help
when introducing SDEI-based management interrupts.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 68e592b1f315172b707e41ec3c6ac1ca86419771
      https://github.com/siemens/jailhouse/commit/68e592b1f315172b707e41ec3c6ac1ca86419771
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Expand return type of smc helpers to long

This allows to evaluate all 64 bits on arm64. Will be needed for SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 839f3ab97da1aa1bb98bf8e0afcd66ae6d33ff17
      https://github.com/siemens/jailhouse/commit/839f3ab97da1aa1bb98bf8e0afcd66ae6d33ff17
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Add further smc helpers

Will be used for SDEI. Actually not on ARM, but we add the smc_arg2 to
please the build and avoid surprises once it is used for real.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 275e855a0b75c03c9162c6a3bb4fe7414bf7e37e
      https://github.com/siemens/jailhouse/commit/275e855a0b75c03c9162c6a3bb4fe7414bf7e37e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Reorder arch_cpu_init

This will allow to modify the hcr value based on the result of
arm_cpu_init when SDEI is in play.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 467e6524fd2f2f58ea11fa7966695cc9d4048bec
      https://github.com/siemens/jailhouse/commit/467e6524fd2f2f58ea11fa7966695cc9d4048bec
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/smccc.h
    M hypervisor/arch/arm-common/irqchip.c
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Add SDEI-based management event injection support

This is the first building block for switching to management interrupts
using the Software Delegated Exception Interface (SDEI) which will allow
to pass the GICC to the guest.

In this step, the feature flag is introduced - but not yet set -, and
arch_send_event is augmented with sending the event via
SDEI_EVENT_SIGNAL, software event 0.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4d41e47391385220c796aba6728382a5a37485f0
      https://github.com/siemens/jailhouse/commit/4d41e47391385220c796aba6728382a5a37485f0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c
    M hypervisor/arch/arm-common/gic-v3.c
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm-common: Pass through GIC CPU interface in SDEI mode

When SDEI is used for management interrupts, we can give the gicc
completely to the cell. This requires to skip gic-v2 and gic-v3 per-cpu
initializations and to map the physical gicc-v2 into the cell or to not
enable ICH_HCR_EN in case of gic-v3. Furthermore, injected interrupts
now have to be sent as physical SGI to the target, rather than being
queued for the virtual interface.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 482b64b129b5506065095d4e76165bd53ee87d9e
      https://github.com/siemens/jailhouse/commit/482b64b129b5506065095d4e76165bd53ee87d9e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/smccc.h
    M hypervisor/arch/arm64/asm-defines.c
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/include/asm/entry.h
    M hypervisor/arch/arm64/include/asm/percpu_fields.h
    M hypervisor/arch/arm64/setup.c
    M hypervisor/arch/arm64/traps.c

  Log Message:
  -----------
  arm64: Add SDEI-based management interrupt handling

This brings the arm64-specific bits to handle management interrupts sent
via SDEI.

The pattern for processing them is derived from NMI-based injection on
x86: The SDEI event can come asynchronously at any time while in EL2,
EL1 or EL0. To avoid having to synchronize with running EL2, translate
it into a trap that is triggered on EL1/0 reentry. We use an invalid
VTCR_EL2 value for this and set the per-cpu sdei_event flag. When EL2
finds this flag set on handling the trap, it kicks off SGI_EVENT
handling and restores VTCR_EL2.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 31b3017324624b02a6731d9a5c6194208e7b3e3e
      https://github.com/siemens/jailhouse/commit/31b3017324624b02a6731d9a5c6194208e7b3e3e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Do not trap interrupts when using SDEI

They can (and must) be delivered directly to the cell in that mode. GIC
CPU interfaces are already passed through.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 03d07e0f703987b8437969caadc30916aa0f9cbe
      https://github.com/siemens/jailhouse/commit/03d07e0f703987b8437969caadc30916aa0f9cbe
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/psci.c

  Log Message:
  -----------
  arm-common: Improve PSCI documentation

Describe what happens around CPU_SUSPEND and use the official symbolic
return code. Also explain what is (not) returned from CPU_OFF.

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f97e8528200c5800a0a2e24494b2451592e1453f
      https://github.com/siemens/jailhouse/commit/f97e8528200c5800a0a2e24494b2451592e1453f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/control.h
    M hypervisor/arch/arm-common/psci.c
    M hypervisor/arch/arm/control.c
    M hypervisor/arch/arm64/control.c

  Log Message:
  -----------
  arm-common: Handle SDEI case in PSCI CPU_SUSPEND

When suspending the CPU while interrupts are passed through, we cannot
simply call wfi as EL2 is not receiving interrupts as wakeup events -
the CPU would starve.

Factor out arm_cpu_passthru_suspend to handle this case by enabling IMO
and FMO before calling wfi. That ensures that EL2 will resume, and as
interrupts are off in that mode, the events will simply be carried to
EL1 when clearing IMO/FMO before returning.

For ARM, arm_cpu_passthru_suspend remains empty as there is no SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ee0e5c42c9baf1389481c372693cd8fab0e1cb88
      https://github.com/siemens/jailhouse/commit/ee0e5c42c9baf1389481c372693cd8fab0e1cb88
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/smccc.h
    M hypervisor/arch/arm-common/setup.c
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Detect availability of SDEI on arm64

Enhance smccc_discover() to detect if SDEI is available on all CPUs on
arm64. Fail on inconsistent availability, now returning and error code.

SDEI is practically only available on arm64 and also only implemented
there in Jailhouse. So skip the probing on 32-bit.

This activates the previously introduced SDEI paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/13c360e08dec...ee0e5c42c9ba

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/13c360-ee0e5c%40github.com.
