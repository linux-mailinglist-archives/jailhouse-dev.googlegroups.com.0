Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBJN2UH6QKGQELEK4SQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAF32AAD83
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Nov 2020 22:03:34 +0100 (CET)
Received: by mail-ot1-x33d.google.com with SMTP id f4sf4011581ote.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Nov 2020 13:03:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604869414; cv=pass;
        d=google.com; s=arc-20160816;
        b=uN5KZ7cOKB0d8aq3ZoyatfkQl55xBMFKHLCRp7JTdjsS9ctJNoiSM501VUzJDCR9Ei
         kxe+WfpzNXnGRHxg8qSPThte2pd58GXJDJzyEqV0BlegXOoltGYNTPPGRwiZpd9IwBiQ
         4DHCARYwUAPo3rxJIhhVRSmC6VgYNTq5vpucEi2bIU9Sr3zRU1cLPN432g7FGpZdoBE/
         796NTRc5CrTeEZOG2OnhZ2P0cekJu2+V24nqI1C8mxGpQ80ny5Mf5wt0GXn0sSJk76U9
         izawwy0WVHQJ5bL8zMTxgXaMPIcgxGp1SkONZhGp9jeLXnoCYbRdAcUbYMZSd07Niw6x
         XQrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :mime-version:subject:message-id:to:from:date:dkim-signature;
        bh=zHI0KPrcYOQoMPCNZ4cIaz6nco8saF2BjUhVdIGdkl0=;
        b=TurTY8ewZrciUMDYY4i8W0ts9JHdW3dqXU48VTVYdFPPNgvOOQ9bMgcDpI6ghjAIKM
         Wx0ET/FiHt01dLdr7pXFPY1sk5uB8/T3MKZZhr97NgIqG+3bZpS4vGRPaG62yQdftsq5
         vTVnW36s0lRJUQPCUpwJohQBZQxb6R9iIlHNc2RSEovsMpc6ZoUtfwm8oDapMd8G3JCD
         R2a5J4QtzNH3h3XBNsuFAXCWYVFyRf2cvyv9+rdYdz6xqnUkqDlhhy0HQh7IQJ3LvEDc
         AyUI0z5FkMo3hJU3I3eX3rml2oii5rqztPyNAfsqF3YFpli1hvvY3FZO3pmt/M2Moc+N
         0FaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=tfAUhouW;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=zHI0KPrcYOQoMPCNZ4cIaz6nco8saF2BjUhVdIGdkl0=;
        b=Z+Qoct4A3sHctrxfRZplu+d8qeIMWnQkmCyPG5b/rwoJ89pJfxID2O2fUTmATJfT8T
         BtSvm8laAKN0PU2VU0K4fgNunsRhL9SVbgXL4bLzzujMMTZgUTX3L4NPxx8u2fXnshWW
         nrzy5pw0Dwgcj3OCNMD4RPv0Hw65GLfoD3hXRLAriZK2A1vUf14gIuQmxjaZRlOdmh0f
         lt6Q1THKr8lDxXcmjfwqgsRQZLuXepsit+HRdAOSElTdDy1P+ANHGNZnDJVAy7hWlXsx
         PlB7i5XpZLDussAoCHphdjO9P6aKjbY0x7bN/hTm6OAZ5l85dAatJZeVG92hATHW/+LZ
         1ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zHI0KPrcYOQoMPCNZ4cIaz6nco8saF2BjUhVdIGdkl0=;
        b=LSMsTtLZT+brO0go68/SbMtOKKLhKXDKeJGrDubD93jGYTgeCeOAoBFNf8WOdqhCgq
         CmW8Dd03pgHmoIThmiKEXGZZXeB6jQuWv74lPJxMjC0kTl3jVsIjYO61nT7us2O83toK
         BXql7Fa7CWay3oBPQ1hrBVF9AWTlfVvo+UhKFZfJo+tvlHU/Z2KUqC6YJCMeBVgOkq+w
         K65Fttoe+eCyMdOtC94d7m/BhnWRq+YaVzqHM0Ku4ggYz37O1V5asBZw/f14EtTbCRo6
         xeA1SBN2QEabymj2Y7yDTGDWh0Vka/N7okGwN5RBIVZQYJbXVfqsJH8EryeiOBMHlMzn
         b1Jg==
X-Gm-Message-State: AOAM530m3dPuMTfNdd3krFPV7wK5Kb+rzfgoD70lbfqdFsUSYlZTH97+
	Zo2xRgRzuMihcuEjJcKk8S4=
X-Google-Smtp-Source: ABdhPJxcxpI8/PBbdvLLsRp+/fIo5dYF0mX8YKcb5/8OABT6EGNzZySfXRNgWWohUQPzL7ssO5f+Eg==
X-Received: by 2002:a05:6830:3155:: with SMTP id c21mr3203120ots.281.1604869413859;
        Sun, 08 Nov 2020 13:03:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6b0f:: with SMTP id g15ls1596854otp.0.gmail; Sun, 08 Nov
 2020 13:03:33 -0800 (PST)
X-Received: by 2002:a05:6830:1f22:: with SMTP id e2mr8439262oth.339.1604869413044;
        Sun, 08 Nov 2020 13:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604869413; cv=none;
        d=google.com; s=arc-20160816;
        b=0MpNnpEQJoeawsqAnV445KrAIb2MKQTDasd069/Cs+8j32AcDLgJ+dPk9n2DT9563O
         Qcva0p9pfTyAhLddOYFc+x23BGrjx75+ZfdjbGcM6NBEmjKOYHv0mXt+IKZgEzd2dbO0
         dEheCa7XMWcrDb/4EiyVEzaKc8QvB92F2w2zWFafo/0Z7Q49Ff5XI0W+WffgyJz4Lg2+
         nMCHcPxYswkiV9PsuPivqPQKexV0DOtikMq6lm2XhmsDIAlgW9qJ1KRxERR2+XvWSxhO
         tAvrnRq3McLgpF8QT0Tsl0BjN+8HKkhv0Q5ql/NWi4uPY4OWAqCVJEZlvAjOynI3o1/g
         r0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=NPxaAh9lAGmg6zK5Ud95KJHGb2AhPzA2RbffpgmKIoQ=;
        b=gc15GVfghdSfcA5eXXXnNmgc4bcwvmWM49YgcZvmj5U6jx4v9U1j/OKz0LMiGgQ13d
         pxBmGJChsmzV6LoJtI861JlC/oncPEd3rOJ5EBE0omoq0jrG/5DHrjw1k7nlz8wiGAg8
         TCcH8Tb9a7APmlEcGfs0nzk85eNefzXrR2e5eY+iCd1+Sg24YDX0F3wuZB5Qb+pBY4At
         fmxGMLbIR6LBS4hxxmWeAfOdfsWIaTGmzAjkqGVseMyUhbvpC+vgXheaAobOnC6r6N4C
         JeIBXValtQ8521nGpkZ8kK62v+ZqxP5cwT7TV97zpcr+16pHak5jEGDjXSYBbW+x0c5X
         fq2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=tfAUhouW;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id e206si189057oob.2.2020.11.08.13.03.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 13:03:33 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Received: from github.com (hubbernetes-node-4d520af.ac4-iad.github.net [10.52.111.21])
	by smtp.github.com (Postfix) with ESMTPA id 92AAE520428
	for <jailhouse-dev@googlegroups.com>; Sun,  8 Nov 2020 13:03:32 -0800 (PST)
Date: Sun, 08 Nov 2020 13:03:32 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/756216-2f52a1@github.com>
Subject: [siemens/jailhouse] 5d84af: arm64: Make sure SMC and HVC calls don't
 have side...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=tfAUhouW;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
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

  Branch: refs/heads/master

  Home:   https://github.com/siemens/jailhouse

  Commit: 5d84afa48d1634983ccc1b69e7de2bed96826947

      https://github.com/siemens/jailhouse/commit/5d84afa48d1634983ccc1b69e=
7de2bed96826947

  Author: Oliver Schwartz <Oliver.Schwartz@gmx.de>

  Date:   2020-09-21 (Mon, 21 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm64/include/asm/smc.h

    M include/arch/arm64/asm/jailhouse_hypercall.h



  Log Message:

  -----------

  arm64: Make sure SMC and HVC calls don't have side effects



SMC/HVC calls may modify registers x0 to x3. To make sure the compiler

doesn't assume input registers to be constant, also mark these registers

as output when used as input.



Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>

[Jan: rebased on next, aligned smc to smc_arg1, style]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 0abce56ab02b59f96e508723b34558c94d05434b

      https://github.com/siemens/jailhouse/commit/0abce56ab02b59f96e508723b=
34558c94d05434b

  Author: Oliver Schwartz <Oliver.Schwartz@gmx.de>

  Date:   2020-09-21 (Mon, 21 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm/include/asm/smc.h

    M include/arch/arm/asm/jailhouse_hypercall.h



  Log Message:

  -----------

  arm: Make sure SMC and HVC calls don't have side effects



SMC/HVC calls may modify registers r0 to r3. To make sure the compiler

doesn't assume input registers to be constant, also mark these registers

as output when used as input.



Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>

[Jan: rebased on next, style]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 754870fe7cfd978cdd72dc027f90995268091035

      https://github.com/siemens/jailhouse/commit/754870fe7cfd978cdd72dc027=
f90995268091035

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-21 (Mon, 21 Sep 2020)



  Changed paths:

    M include/arch/arm-common/asm/jailhouse_hypercall.h

    M include/arch/arm/asm/jailhouse_hypercall.h

    M include/arch/arm64/asm/jailhouse_hypercall.h



  Log Message:

  -----------

  arm/arm64: Factor out common hypercall stubs



Just the argument types differ. Factoring that out allows to move all

stub definitions to the common header.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: d448a0f372070d27ef128205a14fafb19e73e8a3

      https://github.com/siemens/jailhouse/commit/d448a0f372070d27ef128205a=
14fafb19e73e8a3

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-21 (Mon, 21 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm/mmu_hyp.c



  Log Message:

  -----------

  arm: Drop sp from clobber list



This gives



  warning: listing the stack pointer register =E2=80=98sp=E2=80=99 in a clo=
bber list is deprecated

  note: the value of the stack pointer after an =E2=80=98asm=E2=80=99 state=
ment must be the same as it was before the statement



with gcc 9. Obviously, this cannot be fulfilled in the given case as it

is one of the purposes of the assembly block. But as there is no code

after it anyway, it's safe to drop sp from the clobbering list.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 068aa113e63f4d6519087c0f5d40b4e20f900bed

      https://github.com/siemens/jailhouse/commit/068aa113e63f4d6519087c0f5=
d40b4e20f900bed

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-21 (Mon, 21 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm/include/asm/sysregs.h

    M hypervisor/arch/arm64/include/asm/sysregs.h

    M inmates/lib/arm/include/asm/sysregs.h

    M inmates/lib/arm64/include/asm/sysregs.h

    M inmates/tests/x86/sse-demo.c



  Log Message:

  -----------

  hypervisor, inmates: Make spacing consistent in assembly constraints



No functional changes.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f9325e628926c47a1ec75f7b0e53c571bed3d4e5

      https://github.com/siemens/jailhouse/commit/f9325e628926c47a1ec75f7b0=
e53c571bed3d4e5

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    M inmates/lib/x86/include/asm/regs.h

    M inmates/lib/x86/mem.c



  Log Message:

  -----------

  inmates: x86: paging: move definitions to regs.h



We'll need them in assembly, so move them over to regs.h and align the nami=
ng

with the hypervisor. And introduce the shorthand PAGE_DEFAULT_FLAGS.



No functional change.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: b9e596b529f7e15d7cbbe9b273c6eef746e98ffe

      https://github.com/siemens/jailhouse/commit/b9e596b529f7e15d7cbbe9b27=
3c6eef746e98ffe

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    M inmates/lib/x86/header-32.S

    M inmates/lib/x86/header-64.S



  Log Message:

  -----------

  inmates: x86: replace hardcoded constants



Use this chance to s/loader_pdpt/pd/ in header-32.S. It's a page

directory on x86-32 and not a page directory pointer table.



No functional change.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: a744fadddd8bce4e6b32e283ca84f5f6c17cd3f6

      https://github.com/siemens/jailhouse/commit/a744fadddd8bce4e6b32e283c=
a84f5f6c17cd3f6

  Author: Alice Guo <alice.guo@nxp.com>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    M include/jailhouse/cell-config.h



  Log Message:

  -----------

  cell-config: add support for MMU-500 configuration in cell-config.h



Add JAILHOUSE_IOMMU_ARM_MMU500 to the Jailhouse iommu type. Add

arm_sid_mask to struct jailhouse_iommu, and it is a mask of StreamID

bits irrelevant to the matching process.



Signed-off-by: Alice Guo <alice.guo@nxp.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 68ced33fa4a92030ec613543a29ef84711268e29

      https://github.com/siemens/jailhouse/commit/68ced33fa4a92030ec613543a=
29ef84711268e29

  Author: Alice Guo <alice.guo@nxp.com>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    M hypervisor/include/jailhouse/utils.h



  Log Message:

  -----------

  core: provide macro SET_FIELD



SET_FIELD allows to set bits[last:first] with the given value.



Signed-off-by: Alice Guo <alice.guo@nxp.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 3f78d4cbe0e8db6c42d38c82479283c221bb7b69

      https://github.com/siemens/jailhouse/commit/3f78d4cbe0e8db6c42d38c824=
79283c221bb7b69

  Author: Alice Guo <alice.guo@nxp.com>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm64/Kbuild

    M hypervisor/arch/arm64/include/asm/sysregs.h

    A hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: support ARM MMU-500



Enable SMMU for processors which use MMU-500 to implement the ARM SMMU

architecture v2. It supports stage 2 translation that allows a

hypervisor define the translation tables that translate the IPAs for a

particular guest operating system to PAs.



Signed-off-by: Alice Guo <alice.guo@nxp.com>

[Jan: fold in SZ defines]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 90db7006488d638df345b95a4c871a783fab9d63

      https://github.com/siemens/jailhouse/commit/90db7006488d638df345b95a4=
c871a783fab9d63

  Author: Alice Guo <alice.guo@nxp.com>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    A configs/arm64/imx8qm-inmate-demo.c

    A configs/arm64/imx8qm-linux-demo.c

    A configs/arm64/imx8qm.c



  Log Message:

  -----------

  configs: imx8qm: add configuration files



Add root cell and inmate cell configuration files for imx8qm.



Signed-off-by: Alice Guo <alice.guo@nxp.com>

[Jan: rename to imx8qm-inmate-demo]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: c1a7dd847f9b06e592a93d51ff0f50d7f6d88b37

      https://github.com/siemens/jailhouse/commit/c1a7dd847f9b06e592a93d51f=
f0f50d7f6d88b37

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Simplify __arm_smmu_tlb_sync



No need for a two-stage loop here. Just test and then delay before the

next try. This aligns us with the original version in Linux.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f258244cc57e69dbba1ff4a94d4f35541cdf8baa

      https://github.com/siemens/jailhouse/commit/f258244cc57e69dbba1ff4a94=
d4f35541cdf8baa

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Allow arm_smmu_init_context_bank to return an error



If arm_smmu_init_context_bank detects an invalid/unsupported pa_size,

allow it to return an error and handle that properly.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 05a7d5fdab8a4da1bcbba7a1deab233c3a217f01

      https://github.com/siemens/jailhouse/commit/05a7d5fdab8a4da1bcbba7a1d=
eab233c3a217f01

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Clarify that mapping mismatch is just a warning



The Linux kernel commit c55af7f719cb writes:



"Such a mismatch could be intentional (to fix wrong register values).

If its not intentional (e.g. due to wrong DT information) this will

very likely cause a malfunction of the driver as SMMU_CB_BASE is

derived from the size of the mapped region. The warning helps to

identify the root cause in this case."



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 04866b908593d05c8c8be29fda6c890d83a99a6c

      https://github.com/siemens/jailhouse/commit/04866b908593d05c8c8be29fd=
a6c890d83a99a6c

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Consolidate translation stage detection and reporting



We only support stage-2 translations, so quite a bit of inherited logic

from Linux can be dropped.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: fee50d3d617b6ab72c4e22371adf31b394a9454b

      https://github.com/siemens/jailhouse/commit/fee50d3d617b6ab72c4e22371=
adf31b394a9454b

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Fold __arm_smmu_tlb_sync into single caller



No need to have that inner function separately.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 47b390bac76c1ecb797ed6ed2d7c81373e1cc923

      https://github.com/siemens/jailhouse/commit/47b390bac76c1ecb797ed6ed2=
d7c81373e1cc923

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-25 (Fri, 25 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop duplicate error messages



arm_smmu_tlb_sync_global already reports when it fails.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 5dd302c96c54f4407a5ce0ea698b79944f5ba8d1

      https://github.com/siemens/jailhouse/commit/5dd302c96c54f4407a5ce0ea6=
98b79944f5ba8d1

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Handle arm_smmu_find_sme error properly



Bail out if they happen during cell init - apparently configuration

errors. Skip the entry if that happens during cell exit (unlikely).



[Andrea Bastoni: Fix double negative in trace_error]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 2101e5b84589ca82d926d88f3662e5896d731f77

      https://github.com/siemens/jailhouse/commit/2101e5b84589ca82d926d88f3=
662e5896d731f77

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Improve output during setup



Makes the output more compact, fixes one missing line break and adds a

correlation with the physical unit.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 9e42d85249af06b6a2a057671d5debba28e8067d

      https://github.com/siemens/jailhouse/commit/9e42d85249af06b6a2a057671=
d5debba28e8067d

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M inmates/Makefile



  Log Message:

  -----------

  inmates: arm, arm64: Remove dangling include search path



This was obsoleted by splitting the inmate headers from the hypervisor

internal ones, somewhere around ce98ecaad89b.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 941569fef655e7f7696851b139683c083246380f

      https://github.com/siemens/jailhouse/commit/941569fef655e7f7696851b13=
9683c083246380f

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    A hypervisor/arch/arm-common/include/asm/processor.h

    M hypervisor/arch/arm/include/asm/processor.h

    M hypervisor/arch/arm64/include/asm/processor.h



  Log Message:

  -----------

  arm-common: Factor out common processor.h parts



No need to duplicate them in the arm/arm64 specific headers.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f40bb3752fa4a33bbcbe8108aa37b88bc7a7dc1b

      https://github.com/siemens/jailhouse/commit/f40bb3752fa4a33bbcbe8108a=
a37b88bc7a7dc1b

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm-common/gic-v2.c

    M hypervisor/arch/arm-common/gic-v3.c

    M hypervisor/arch/arm-common/include/asm/irqchip.h

    M hypervisor/arch/arm-common/irqchip.c



  Log Message:

  -----------

  arm-common: Drop return code from irqchip_send_sgi



None of the callers checks it, and all of the callers ensure that only

SGI IDs are passed.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 2b752d23d40fc56c6e36af0cec9252dffa7f9785

      https://github.com/siemens/jailhouse/commit/2b752d23d40fc56c6e36af0ce=
c9252dffa7f9785

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M tools/jailhouse-config-create



  Log Message:

  -----------

  pyjailhouse: Do not fail on missing date for DebugConsole



All readouts are optional, but then they will return empty strings.

Converting them to integer will raise ValueError. Catch that and ignore

it - we won't have DebugConsole information then, as desired.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: ae63343fd302983ac1b36fe9b615daa742e2c88b

      https://github.com/siemens/jailhouse/commit/ae63343fd302983ac1b36fe9b=
615daa742e2c88b

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M pyjailhouse/sysfs_parser.py



  Log Message:

  -----------

  pyjailhouse: sysfs_parser: Fix regions_split_by_kernel corner cases



If the kernel is at the beginning or at the end of a region,

before_kernel or after_kernel could stay None, and adding a NoneType

object to the regions will make other parts unhappy. Better construct a

list without any None elements.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: ad188b3c1d177872cd57bd90f106288a031df654

      https://github.com/siemens/jailhouse/commit/ad188b3c1d177872cd57bd90f=
106288a031df654

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/x86/vtd.c



  Log Message:

  -----------

  x86: vtd: Fix interpretation of redirection hint



Reading the KVM code of Linux and re-reading the spec, multiple times,

it became clear the RH only controls whether one or all CPUs of a

potential target group should be addressed. If it's set only one is

chosen, via lowest-prio, but that is done by the hardware. For us, its

state does not matter. We always consider a multicast scenario, thus

simply ignore the state of this bit.



This fixes startup errors when DH=3D1 and RH=3D0 of the kind



FATAL: Unsupported MSI/MSI-X state, device ...



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: b9db8db073aec049f042c13401a9a529c236f5e9

      https://github.com/siemens/jailhouse/commit/b9db8db073aec049f042c1340=
1a9a529c236f5e9

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M include/jailhouse/cell-config.h



  Log Message:

  -----------

  ivshmem: Expand MSI-X region to full page



It's a bit wasteful, but the alternative can be that the guest moves the

region close to a physical one, and then we need to start configuring

sub-page dispatching. That is first of all a source for mistakes

(specifically in combination with generated configs), and it may even be

suboptimal in case exceeding, full-page access on that physical region

would have been safe.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 6f01f5b95f9815e9a627776ff748bb1b3862c563

      https://github.com/siemens/jailhouse/commit/6f01f5b95f9815e9a627776ff=
748bb1b3862c563

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M Kbuild

    M configs/Makefile

    M hypervisor/Makefile

    M inmates/Makefile



  Log Message:

  -----------

  kbuild: Set -Werror in all KBUILD_CFLAGS



subdir-ccflags-y doesn't have the desired effect, at least with recent

kernels.



Reported-by: Jan-Marc Stranz <stranzjanmarc@gmail.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 72cf271c9bd88922682c60583a6bca3bf15deb0b

      https://github.com/siemens/jailhouse/commit/72cf271c9bd88922682c60583=
a6bca3bf15deb0b

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M configs/arm64/ultra96.c



  Log Message:

  -----------

  configs: arm64: Add SMMU configuration for Ultra96



This only lists the SDIO interfaces for now - more isn't working with

mainline so far.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f2cd6f0587242c564c554c1f6dcdcecbd62a0845

      https://github.com/siemens/jailhouse/commit/f2cd6f0587242c564c554c1f6=
dcdcecbd62a0845

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/paging.c



  Log Message:

  -----------

  arm64: Cap parange at 48 bits



This is the limit for 4K-paging which we rely on in Jailhouse. Make sure

that, if we hit support for even larger sizes, we still end up with this

limit.



Reported-by: Chase Conklin <Chase.Conklin@arm.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 9115ccc93fde0f14b00bb7aba85d6ad4254a0be5

      https://github.com/siemens/jailhouse/commit/9115ccc93fde0f14b00bb7aba=
85d6ad4254a0be5

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/include/asm/paging.h

    M hypervisor/arch/arm64/paging.c



  Log Message:

  -----------

  arm64: Introduce cpu_parange_encoded



Keep the encode parange value as well. This allows to use it directly in

VTCR_CELL, rather than re-encoding it via TCR_PS_CELL. It will also

allow reuse by the SMMUv2 code.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 4d0485bb65fd4c78f3248d55c4271ad74773f745

      https://github.com/siemens/jailhouse/commit/4d0485bb65fd4c78f3248d55c=
4271ad74773f745

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/include/asm/paging.h

    M hypervisor/arch/arm64/paging.c



  Log Message:

  -----------

  arm64: Simplify get_cpu_parange



Array lookup is simpler, given this input-output mapping. This also

obsoletes a couple of PARANGE constants.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 2833e410afb1aa4b97de56bb43c89b4a8800fbc3

      https://github.com/siemens/jailhouse/commit/2833e410afb1aa4b97de56bb4=
3c89b4a8800fbc3

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Deny transfers by default



Make sure that DMA transfers from unconfigured sources do not sneak by.

This is in line with the access policy for other resources: Deny what is

not explicitly allowed.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: a76ffdce71cb370c30c35c25b1c43a8a5ea56b10

      https://github.com/siemens/jailhouse/commit/a76ffdce71cb370c30c35c25b=
1c43a8a5ea56b10

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop test for non-zero base address



Setting type to JAILHOUSE_IOMMU_ARM_MMU500 already implies that the

entry is valid.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: ad6b9b1abc82fa857ad2dd63a476859a29c5e47b

      https://github.com/siemens/jailhouse/commit/ad6b9b1abc82fa857ad2dd63a=
476859a29c5e47b

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop useless features initialization



This field already comes zero-initialized.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 6b8dbad8dc3d64770e1b8048b2708b82e04f370e

      https://github.com/siemens/jailhouse/commit/6b8dbad8dc3d64770e1b8048b=
2708b82e04f370e

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Clean up arm_smmu_find_sme parameters



Just pass in the arm_smmu_device, rather than the mask associated with

that device and the device index.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: b3af35bcb954cc845a71e3cf569b9ec4219b8a9d

      https://github.com/siemens/jailhouse/commit/b3af35bcb954cc845a71e3cf5=
69b9ec4219b8a9d

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Refactor smmu device setup and usage



We only need iommu_units from the system configuration during setup.

Afterwards, we work solely against entries of smmu_device.



Rework the usage of the latter by filling the smmu_device array

independently of the iommu_units and iterating over the former later on.

Introduce an iterator macro for this. Helps to simplify the code.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: b7bb6120b3505b670e6940c4982bc22d1344797e

      https://github.com/siemens/jailhouse/commit/b7bb6120b3505b670e6940c49=
82bc22d1344797e

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Fold arm_smmu_free_sme into single caller



Simplifies the code. Also removes the test of the return value which was

always true.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: ffbcd510f21bbe121b709a09f412ae4cda640df4

      https://github.com/siemens/jailhouse/commit/ffbcd510f21bbe121b709a09f=
412ae4cda640df4

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Replace for_each_smmu_sid with for_each_stream_id



We already had an iteration macro.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 071906b8e41c9f7efd955df86e47acf037872a49

      https://github.com/siemens/jailhouse/commit/071906b8e41c9f7efd955df86=
e47acf037872a49

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Make sCR0 write-only



There is no need to preserve existing settings, and reserved fields can

always be overwritten by zeros (Should-Be-Zero-*or*-Preserved).



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 90073b893b232021f3df844c870df2466dadc486

      https://github.com/siemens/jailhouse/commit/90073b893b232021f3df844c8=
70df2466dadc486

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Add shutdown handler



Properly disable the SMMU on shutdown as well as on errors during setup.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: a9e34e9c9c2a81984e018b58a4c9a24aa6d055b4

      https://github.com/siemens/jailhouse/commit/a9e34e9c9c2a81984e018b58a=
4c9a24aa6d055b4

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Tune output



Reporting of the number of configures stream IDs does not provide any

value. Rather report StreamID assignments.



Convert two unlikely error outputs into trace_error.



Furthermore, report "stage-2" consistently.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 0b587bfb97bcee2933a626a682ccfcd18ac91b12

      https://github.com/siemens/jailhouse/commit/0b587bfb97bcee2933a626a68=
2ccfcd18ac91b12

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Remove IRPTNDX traces



Not used with SMMUv2, which is what we focus on.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 540ee6b59682364bd01e3dcc1a47c49d9a799a7c

      https://github.com/siemens/jailhouse/commit/540ee6b59682364bd01e3dcc1=
a47c49d9a799a7c

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Remove bogus Extended StreamID support fragments



We do not use the extended S2CR / SMR registers, but we enabled extended

StreamID matching when it was found. That would have broken platforms

carrying this feature. Remove all traces for now. Can be added properly

when there is a need and full support for more.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 5c6cef4f99adcadd4681484d869b3e9b381cb8d7

      https://github.com/siemens/jailhouse/commit/5c6cef4f99adcadd4681484d8=
69b3e9b381cb8d7

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop unneeded includes



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: df21ea6cc6f83bce25023022e20931ca35afe2ad

      https://github.com/siemens/jailhouse/commit/df21ea6cc6f83bce25023022e=
20931ca35afe2ad

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Do not stall failing context transaction



We do not handle faults, e.g. by resuming them later on. Stalling

failed transactions will soon lead to a stalled SMMU, blocking even

valid transactions.



This could easily be reproduced by stealing a used StreamID from the

root cell. On the Zynqmp, this lead to all transactions of the root cell

to be blocked.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: fa820f7cd8c60c87e67760eaf834addd8d43c435

      https://github.com/siemens/jailhouse/commit/fa820f7cd8c60c87e67760eaf=
834addd8d43c435

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/include/asm/sysregs.h

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Move S2CR macro out of sysregs.h



Misplaced, they SMMUv1-specific.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: aa4112076f4c20a3529469dc26004d3e9d17cee6

      https://github.com/siemens/jailhouse/commit/aa4112076f4c20a3529469dc2=
6004d3e9d17cee6

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Refactor S2CR handling



There is no need to cache the value we write to S2CRn. Drop the related

data structure and pass the values to be written to arm_smmu_write_s2cr

directly. This implies dropping arm_smmu_write_sme, open-coding it.

Still a net gain as a lot of boilerplate code can be dropped.



Along this cleanup, convert arm_smmu_s2cr_type and arm_smmu_s2cr_privcfg

into defines, only encoding what we use. There is no value in enums.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 36aa3def4cf4d27f832547f45b9430c986179f14

      https://github.com/siemens/jailhouse/commit/36aa3def4cf4d27f832547f45=
b9430c986179f14

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Simplify VMID and CBNDX allocation



Leaving VMID 0 free comes from Linux but is unneeded for Jailhouse.

Simply use one ID, the cell ID, for both VMID and the context bank

index.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f9db967278803d6b09811c9c3e73095ff4c35a60

      https://github.com/siemens/jailhouse/commit/f9db967278803d6b09811c9c3=
e73095ff4c35a60

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop write-only pgsize_bitmap



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 5fcef354737d6abc6314f2cbaea465edb1e3cab3

      https://github.com/siemens/jailhouse/commit/5fcef354737d6abc6314f2cba=
ea465edb1e3cab3

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop write-only va_size field



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: e5c66ec55628aed5425da9ef051f159ef2b6a79c

      https://github.com/siemens/jailhouse/commit/e5c66ec55628aed5425da9ef0=
51f159ef2b6a79c

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Demand aarch64-4K paging, drop probing of unused formats



We are aarch64-only, and we shared the page table with the MMU.

Jailhouse uses 4K-paging for that, so there is no point in probing for

other format. In fact, we must demand ID2_PTFS_4K, otherwise things

would break.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 53f26d64a013c5d77fe4ca3e589a1e9b2dff13f1

      https://github.com/siemens/jailhouse/commit/53f26d64a013c5d77fe4ca3e5=
89a1e9b2dff13f1

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Fix CBn_TCR initialization



This was simply wrong: We must use the same settings for the SMMU as for

the MMU because we share the page tables. We can pick up VTCR_CELL for

this, just like SMMUv3 does, we just need to mask out reserved bits.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 406847b5f1bc8ac66a8766ac026968221577b355

      https://github.com/siemens/jailhouse/commit/406847b5f1bc8ac66a8766ac0=
26968221577b355

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop coherency reporting



We don't do anything with this because we always flush TLBs after

changing the mappings.





  Commit: c9c3c76714fb2c838a1d05469bfa701810ea7d20

      https://github.com/siemens/jailhouse/commit/c9c3c76714fb2c838a1d05469=
bfa701810ea7d20

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop stream-match feature recording



We keep this information via smrs !=3D NULL.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: c3822548cbacd92955a25b2d8408ca7060974112

      https://github.com/siemens/jailhouse/commit/c3822548cbacd92955a25b2d8=
408ca7060974112

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop 16-bit VMID feature



We are limited by the number of context banks, and those are 128 at

most. That fits into 8 bits.



This obsoletes the features field in arm_smmu_device.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: e8998674ad372a764e233bb07ca422add50333e0

      https://github.com/siemens/jailhouse/commit/e8998674ad372a764e233bb07=
ca422add50333e0

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop dead ARM_SMMU_OPT_SECURE_CFG_ACCESS



In Linux, this is set for a caldexa device which we do not support. So

ARM_SMMU_OPT_SECURE_CFG_ACCESS was never set. Simply replace

ARM_SMMU_GR0_NS with ARM_SMMU_GR0 and remove dead artifacts.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: aeec874d7f9fd8572403daa7a8cc1c98ba65a02e

      https://github.com/siemens/jailhouse/commit/aeec874d7f9fd8572403daa7a=
8cc1c98ba65a02e

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop dead arm_smmu_test_smr_masks



Nothing was done with the results.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f5e1b9f8c245c6d26781ad0305fb4ead494d6411

      https://github.com/siemens/jailhouse/commit/f5e1b9f8c245c6d26781ad030=
5fb4ead494d6411

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Fix TLB flush on cell exit



We must update S2CR and SMRs first, then flush. Otherwise, TLB entries

might be left which refer to the old settings.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: c755d55f8911304ceffc91d346b55224d5f50835

      https://github.com/siemens/jailhouse/commit/c755d55f8911304ceffc91d34=
6b55224d5f50835

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Disable context bank only once on cell exit



No need to run this sequence for every SID the cell owned.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: dafc85df4c4c244eb7096dee1ce97a367af56b1d

      https://github.com/siemens/jailhouse/commit/dafc85df4c4c244eb7096dee1=
ce97a367af56b1d

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Introduce arm_smmu_disable_context_bank



This avoid having to carry the information if a context bank is enabled

and makes the code more readable.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 378bd54fc85a21a7276666e5944a1bd314328c17

      https://github.com/siemens/jailhouse/commit/378bd54fc85a21a7276666e59=
44a1bd314328c17

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Refactor ID0 evaluation



Use GET_FIELD where possible, drop pointless clearing of ID0_S1TS and

ID0_NTS.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 1d80442d14746f5eddd019d94a9cd1187259c775

      https://github.com/siemens/jailhouse/commit/1d80442d14746f5eddd019d94=
a9cd1187259c775

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Refactor ID1 evaluation



Use GET_FIELD where possible.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 6d6a8739ab948bf8f15525f0fd2734ed1e4df300

      https://github.com/siemens/jailhouse/commit/6d6a8739ab948bf8f15525f0f=
d2734ed1e4df300

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Refactor ID2 evaluation



Use GET_FIELD where possible, change to descending bit order.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: db96061a8d556270217f43891df9a695d5f9d338

      https://github.com/siemens/jailhouse/commit/db96061a8d556270217f43891=
df9a695d5f9d338

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Check IAS and OAS against CPU parange



Make sure that supported range of the SMMU is compatible with what we

need to use via the MMU settings. Bail out if not, and rather drop

useless reporting in the code case.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 1d5995c026c25ab90338937ccf7ada9c94791b66

      https://github.com/siemens/jailhouse/commit/1d5995c026c25ab90338937cc=
f7ada9c94791b66

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Refactor ID7 evaluation



Use GET_FIELD where possible.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 1f67ee94a861ccbb6d11f3d042e304acd6599c09

      https://github.com/siemens/jailhouse/commit/1f67ee94a861ccbb6d11f3d04=
2e304acd6599c09

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Demand version 2



We only support version 2, and this should be checked during probe

already. Makes arm_smmu_device_reset a bit simpler.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: ac39cd7a3d3652e113a25797f1691c8b98cf6c4c

      https://github.com/siemens/jailhouse/commit/ac39cd7a3d3652e113a25797f=
1691c8b98cf6c4c

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Drop more unused fields from arm_smmu_device



num_s2_context_banks is only locally used during probe, and the rest is

just dead leftover from the Linux driver.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: ce634b7d64753f1c4f14f29badf70f618512ed90

      https://github.com/siemens/jailhouse/commit/ce634b7d64753f1c4f14f29ba=
df70f618512ed90

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Catch VMID exhaustion



As we map each cell on an exclusively used context bank, make sure we do

not overrun the hardware limits.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 837efda3a43b5296dc342c0ea51d989256cca2c5

      https://github.com/siemens/jailhouse/commit/837efda3a43b5296dc342c0ea=
51d989256cca2c5

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Rename ARM_SMMU_CB_TTBCR, drop unused ARM_SMMU_CB_CONTEXTIDR



TTBCR is SMMUv1 terminology. We are v2-only.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: c5230ca2ae69712ba62e034d8738b5e0eca50ba5

      https://github.com/siemens/jailhouse/commit/c5230ca2ae69712ba62e034d8=
738b5e0eca50ba5

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Fix CNn_TTBR construction



There is no VMID in CNn_TTBR - stop writing to reserved bits.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 70334e24a61746d2e9c898658d211a59981e8655

      https://github.com/siemens/jailhouse/commit/70334e24a61746d2e9c898658=
d211a59981e8655

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Stop caching context bank states



Refactor arm_smmu_init_context_bank/write_context_bank to a unified

setup_context_bank that generates the required register values directly,

without the pointless indirection over arm_smmu_cb and arm_smmu_cfg.

This massively simplifies the code and improves readability.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 6e83bbdf1c3547b246d76a5cc2a2b2af93f34f6a

      https://github.com/siemens/jailhouse/commit/6e83bbdf1c3547b246d76a5cc=
2a2b2af93f34f6a

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Clean up arm_smmu_tlb_sync_global further



It still contained fragments of the Linux back-off mechanism which was

removed already. Adjust the loop counters to the new iteration count.

Will wait at least one second now.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 11262d9d19ae6e1c63964ca98a6a0d172be68f56

      https://github.com/siemens/jailhouse/commit/11262d9d19ae6e1c63964ca98=
a6a0d172be68f56

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Return StreamIDs on cell destruction to the root cell



If we stole a StreamID from the root cell, which happens implicitly by

adjusting the matching SMR, make sure to return it on cell destruction.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: a938bf82470af09d4fa102fd144c74972d2b445f

      https://github.com/siemens/jailhouse/commit/a938bf82470af09d4fa102fd1=
44c74972d2b445f

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M tools/Makefile



  Log Message:

  -----------

  tools: Fix naming of tool in Makefile error



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 00e989b13fbcde82663e1ad08ae30ca1b44e9bc7

      https://github.com/siemens/jailhouse/commit/00e989b13fbcde82663e1ad08=
ae30ca1b44e9bc7

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/x86/pci.c

    M hypervisor/pci.c



  Log Message:

  -----------

  pci: Tune error output format



There has been the request to prefix hex output with "0x". Also, one ":"

was missing.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: e75cec8021baafcf6f0b6b5e7e64935a922c1f71

      https://github.com/siemens/jailhouse/commit/e75cec8021baafcf6f0b6b5e7=
e64935a922c1f71

  Author: Andrea Bastoni <andrea.bastoni@tum.de>

  Date:   2020-10-22 (Thu, 22 Oct 2020)



  Changed paths:

    M hypervisor/arch/x86/include/asm/bitops.h



  Log Message:

  -----------

  x86: bitops: only x86_64 is supported, avoid picking the wrong default su=
ffix



This was harmless so far as the only user panic_printk only worked

against bit 0.



Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>

[Jan: clarified criticality]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 0140313c065ddb728d3cfd34463805fd294606d2

      https://github.com/siemens/jailhouse/commit/0140313c065ddb728d3cfd344=
63805fd294606d2

  Author: Nikhil Devshatwar <nikhil.nd@ti.com>

  Date:   2020-10-26 (Mon, 26 Oct 2020)



  Changed paths:

    A configs/arm64/k3-j7200-evm.c



  Log Message:

  -----------

  configs: arm64: Add support for k3-j7200-evm board



k3-j7200-evm is the new evaluation module from Texas Instruments

which has the j7200 SoC. It has a dual coreARM Cortex-A72

CPU cores, 4GiB of RAM, 2x Display ports, 6x UART ports,

5x ethernet ports, SD and eMMC interfaces for storage and

many other connectivity and accelerator devices.



J7200 TRM: https://www.ti.com/lit/pdf/spruiu1



Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 33e53952cb180ec02d195c408f3a6fa34d5f0c83

      https://github.com/siemens/jailhouse/commit/33e53952cb180ec02d195c408=
f3a6fa34d5f0c83

  Author: Nikhil Devshatwar <nikhil.nd@ti.com>

  Date:   2020-10-26 (Mon, 26 Oct 2020)



  Changed paths:

    A configs/arm64/k3-j7200-evm-inmate-demo.c



  Log Message:

  -----------

  configs: arm64: Add inmate demo config for j7200-evm board



Add inmate demo cell config for j7200-evm board.

This can be used to run the standard jaiilhouse baremetal

inmate demos like gic-demo, uart-demo and ivshmem-demo.



Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 4fbecb507cd2142dfa7ed413151d5fe1c0e212f1

      https://github.com/siemens/jailhouse/commit/4fbecb507cd2142dfa7ed4131=
51d5fe1c0e212f1

  Author: Nikhil Devshatwar <nikhil.nd@ti.com>

  Date:   2020-10-26 (Mon, 26 Oct 2020)



  Changed paths:

    A configs/arm64/dts/inmate-k3-j7200-evm.dts

    A configs/arm64/k3-j7200-evm-linux-demo.c



  Log Message:

  -----------

  configs: arm64: Add Linux demo for k3j7200-evm board



Add the linux demo cell config for k3-j7200-evm board.

Also add the required device tree for booting Linux kernel

in the inmate cell.



Add mem_regions and enable interrupts for for main_uart1,

main_sdhci0, gpio interrupt routers and virtual PCI



Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f06871e080c5b01ca557ef3e81930cf3b1dc802f

      https://github.com/siemens/jailhouse/commit/f06871e080c5b01ca557ef3e8=
1930cf3b1dc802f

  Author: Andrea Bastoni <andrea.bastoni@tum.de>

  Date:   2020-10-26 (Mon, 26 Oct 2020)



  Changed paths:

    M hypervisor/Makefile



  Log Message:

  -----------

  hypervisor: Makefile: hook-in -Wnested-externs



Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f112308cc7620e936b776b8e6aafceee9dfd27b1

      https://github.com/siemens/jailhouse/commit/f112308cc7620e936b776b8e6=
aafceee9dfd27b1

  Author: Andrea Bastoni <andrea.bastoni@tum.de>

  Date:   2020-10-26 (Mon, 26 Oct 2020)



  Changed paths:

    M hypervisor/include/jailhouse/paging.h

    M hypervisor/include/jailhouse/percpu.h

    M hypervisor/paging.c

    M hypervisor/setup.c



  Log Message:

  -----------

  hypervisor: move declaration of __page_pool into paging.h



And remove nested declaration.



Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 7294e0836316860bf9004b15c8c397d888507f91

      https://github.com/siemens/jailhouse/commit/7294e0836316860bf9004b15c=
8c397d888507f91

  Author: Andrea Bastoni <andrea.bastoni@tum.de>

  Date:   2020-10-26 (Mon, 26 Oct 2020)



  Changed paths:

    M hypervisor/Makefile



  Log Message:

  -----------

  hypervisor: Makefile: hook-in -Wshadow



Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 44ddd41175a5f981397314d2843fa4ca7e0d68e9

      https://github.com/siemens/jailhouse/commit/44ddd41175a5f981397314d28=
43fa4ca7e0d68e9

  Author: Andrea Bastoni <andrea.bastoni@tum.de>

  Date:   2020-10-26 (Mon, 26 Oct 2020)



  Changed paths:

    M hypervisor/arch/x86/iommu.c



  Log Message:

  -----------

  x86: iommu: Wshadow, fault_reporting_cpu is global



This prevented consistent updates of the fault report cpu, making the

error interrupt showing up on the wrong CPU and possibly being filtered

there.



Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>

[Jan: add commit message that explains the impact]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 1864a5a74c557b598d03c98902b414bc5b2da331

      https://github.com/siemens/jailhouse/commit/1864a5a74c557b598d03c9890=
2b414bc5b2da331

  Author: Andrea Bastoni <andrea.bastoni@tum.de>

  Date:   2020-10-26 (Mon, 26 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu-v3.c



  Log Message:

  -----------

  arm64: smmu-v3: avoid shadowing smmu



The symbol "smmu" is declared and defined only in the smmu-v3

compilation unit. Give different names and pass a pointer as parameter

to preserve generality of the accessor functions and avoid shadowing the

smmu name.



Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>

[Jan: refactored more aggressively, avoiding redundant array element lookup=
s]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 048796f6ff6d96a80aa383ef1b214f47682aacc0

      https://github.com/siemens/jailhouse/commit/048796f6ff6d96a80aa383ef1=
b214f47682aacc0

  Author: Andrea Bastoni <andrea.bastoni@tum.de>

  Date:   2020-10-26 (Mon, 26 Oct 2020)



  Changed paths:

    M hypervisor/Makefile



  Log Message:

  -----------

  hypervisor: Makefile: hook-in -Wredundant-decls



Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 5689e221ad7e79205594b9f15fd0b0b11e4476bd

      https://github.com/siemens/jailhouse/commit/5689e221ad7e79205594b9f15=
fd0b0b11e4476bd

  Author: Andrea Bastoni <andrea.bastoni@tum.de>

  Date:   2020-10-26 (Mon, 26 Oct 2020)



  Changed paths:

    M hypervisor/include/jailhouse/string.h



  Log Message:

  -----------

  hypervisor: protect inclusion of string.h



Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 614c2347ea5528ce9ed42c455c544d3c09219a94

      https://github.com/siemens/jailhouse/commit/614c2347ea5528ce9ed42c455=
c544d3c09219a94

  Author: Andrea Bastoni <andrea.bastoni@tum.de>

  Date:   2020-10-27 (Tue, 27 Oct 2020)



  Changed paths:

    M hypervisor/include/jailhouse/processor.h



  Log Message:

  -----------

  hypervisor: protect inclusion of processor.h



Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 0ba496ce87cbb93e6a9f9b2d94766a8b77c8cd9e

      https://github.com/siemens/jailhouse/commit/0ba496ce87cbb93e6a9f9b2d9=
4766a8b77c8cd9e

  Author: Andrea Bastoni <andrea.bastoni@tum.de>

  Date:   2020-10-27 (Tue, 27 Oct 2020)



  Changed paths:

    M hypervisor/Makefile



  Log Message:

  -----------

  hypervisor: Makefile: hook-in -Wdeprecated and -Wundef



Currently, no warnings triggered by these two flags.



Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: b95b6df40fe8851250d8e3bad7a46a0d99a16bc8

      https://github.com/siemens/jailhouse/commit/b95b6df40fe8851250d8e3bad=
7a46a0d99a16bc8

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-28 (Wed, 28 Oct 2020)



  Changed paths:

    M driver/main.c



  Log Message:

  -----------

  driver: Adjust type of __hyp_stub_vectors declaration



Aligns us with an internal declaration in upstream

linux/arch/arm64/kernel/hibernate.c and with an external one in the

linux-imx downstream kernel.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f4a941d9e0247b1aef871a40b47c48d36645f2b4

      https://github.com/siemens/jailhouse/commit/f4a941d9e0247b1aef871a40b=
47c48d36645f2b4

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-29 (Thu, 29 Oct 2020)



  Changed paths:

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Detect busy units



This avoids taking over the SMMU when Linux is already using it due to a

configuration mistake.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: c90737c12d16375fae106922482284f003e98fe6

      https://github.com/siemens/jailhouse/commit/c90737c12d16375fae1069224=
82284f003e98fe6

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2020-10-29 (Thu, 29 Oct 2020)



  Changed paths:

    M tools/Makefile



  Log Message:

  -----------

  tools: Makefile: remove duplicated rules



Remove redundant rules by using wildcards.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 12a42e44e26a79a36125f2c9349bc3885ceff7cb

      https://github.com/siemens/jailhouse/commit/12a42e44e26a79a36125f2c93=
49bc3885ceff7cb

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2020-10-29 (Thu, 29 Oct 2020)



  Changed paths:

    M .gitignore

    M tools/Makefile

    A tools/demos/ivshmem-demo.c

    R tools/ivshmem-demo.c



  Log Message:

  -----------

  tools: introduce tools/demos subdirectory



And give ivshmem-demo.c a new home.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: d845c83d937335e39105e08b5c164adab825dc16

      https://github.com/siemens/jailhouse/commit/d845c83d937335e39105e08b5=
c164adab825dc16

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2020-10-30 (Fri, 30 Oct 2020)



  Changed paths:

    M .gitignore

    M inmates/demos/x86/Makefile

    A inmates/demos/x86/cache-timings-common.c

    A inmates/demos/x86/cache-timings.c

    M tools/Makefile

    A tools/demos/cache-timings.c



  Log Message:

  -----------

  inmates: x86: add cache access time test



On x86_64 systems, this test inmate measures the time that is required to r=
ead

a value from main memory. Via rdtsc, it measures the CPU cycles that are

required for the access. Access can either happen cached, or uncached. In c=
ase

of uncached access, the cache line will be flushed before access.



This tool repeats the measurement for 10e6 times, and outputs the

average cycles that were required for the access. Before accessing the

actual measurement, a dummy test is used to determine the average

overhead of one single measurement.



And that's pretty useful, because this tool gives a lot of insights of

differences between the root and the non-root cell: With tiny effort, we

can also run it on Linux.



If the 'overhead' time differs between root and non-root cell, this can

be an indicator that there might be some timing or speed differences

between the root and non-root cell.



If the 'uncached' or 'cached' average time differs between the non-root

and root cell, it's an indicator that both might have different hardware

configurations / setups.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 2f52a11d73461f64ca0d0bd36aec27e2fb4e838d

      https://github.com/siemens/jailhouse/commit/2f52a11d73461f64ca0d0bd36=
aec27e2fb4e838d

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-10-30 (Fri, 30 Oct 2020)



  Changed paths:

    A hypervisor/arch/arm64/include/asm/smmu.h

    M hypervisor/arch/arm64/iommu.c

    M hypervisor/arch/arm64/smmu.c



  Log Message:

  -----------

  arm64: smmu: Enable only on config commit



There are no tables ready during arm_smmu_init(). Therefore, we need to

hold back writing sCR0 until config commit.



This fixes DMA errors during startup.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





Compare: https://github.com/siemens/jailhouse/compare/756216b9d1e1...2f52a1=
1d7346

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/siemens/jailhouse/push/refs/heads/master/756216-2f52a1%40gith=
ub.com.
