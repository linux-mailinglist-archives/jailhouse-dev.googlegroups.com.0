Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBQ66W35QKGQEMDVDLXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x138.google.com (mail-il1-x138.google.com [IPv6:2607:f8b0:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 524ED278333
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:50:13 +0200 (CEST)
Received: by mail-il1-x138.google.com with SMTP id o18sf1321288ilm.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:50:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601023812; cv=pass;
        d=google.com; s=arc-20160816;
        b=GUrUfLXpdYl8Z/4ToeM0sFY09LXUzTCPZIUSP8JGK0lIUB+F9q7cEDsbAdi2NJTn1e
         tn40VsFaqvitHZBw+I6YpMLB9AcgcZesidcZERCfVnosInSM0cJ0hiCtAyBRB76rzYkC
         moP+K+ydPneQh2i7LRYKG4SzVIo+P5PHvqEXl3XWpwWLFEhiLr0Bdv4oVCZig/iLAlaK
         +EwYrJ3UsTs1323z5nraZarP5UCnPz86rILSkO/VNXvrvyG2E0ijjt8v3Ao1ElUY8B7x
         YJ50zUmndd5laWQ7tdmGs44n2L0j5Rsv1yeff6Eq75IuVavr0bFtLkXIxkKfGp/83J28
         NjYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=UEF2bR5tm6MGaRFD7sPh97PEK6i0JwMajS3GlEIjyZA=;
        b=w1OXeLe0b7Q+4t3O1cXNG5zwtECY6G0F7aHX8lUwwFIPab4Tt4J3M/YzId3O8vHTzA
         /TNTqUWg0KaexsSLeF4BsDAUSI2b61ia7S3Wci1cDMM55qgkdg+TZo+l3m814LvcmYZf
         cpJSWL/fCGgiF2PZJ6KVNEVd8vmj2q7xFcvh8QVnPzzsXa53W5dUhga6v4td62AY0EQd
         prQnLdKaolQBWpjLhaZGTRhj//Q6P4QFYkzFoX/RBatnw5/KCySXej6lKphVWmcsPZyl
         ADROFRCbsRmGqnirecQYkQBZdxSXMPN/ETwP6Syn4/oY6uVD26k53Xj377guqxtTsMvU
         B7Tg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=s4Rwf8C5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=UEF2bR5tm6MGaRFD7sPh97PEK6i0JwMajS3GlEIjyZA=;
        b=H+lsb9wOSiYZrfsrV+iXn5Kw0WqS/vHWqicSC7PqnQZw0xWh2UKZvwhPa4V2WIcAJf
         xp8zq0mk68nQJ18xFZFr/hQ2seoCkkWv0zee3qrbuf1DakZP0PkQoay8iVYmSaik3vKx
         eHE6X3bBruCJWtDb5dVNCN2r9yVcHyKahx3d7MyLPVAqYf4TUkWzQDLxGOPAJO9xrDkn
         qZmQ09WtglXMcBiiEmRo7RhHjT05uNvg9w2wi1oxm9nECJS19gFEvSEf5BkeiBHMyBtF
         sUjDWL/uKimBqTmHtDsal749K2Tb06iAo0CTVXGqICxlvidTzjB+wkRm9LQIrwu7hVQV
         E8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UEF2bR5tm6MGaRFD7sPh97PEK6i0JwMajS3GlEIjyZA=;
        b=JARbgtabv4sVsFcw5nCXpIAZ0+l3GVeR3CaWDkCEUAu5BEFjHXuqNYKTu6MZwAmK2d
         94DTgZ4e3fjMFoPAmQGdyo8syPyp7S9Gk+Xr84qW1qCbH4q+Mi9PRDB29DnL90oR5J8W
         Pkr0rY+qSO3w6AGdjhe5IdHCPfb4rViKuK6Hi3XTIwbW/bKz4ECHny8aGIwVWkfooBWn
         ed2hZLH5SlzueVM9HiqgkOdrcu2Zkmx+CdC/tmSv5sWGoWgtP1V6SJ2gzCrNh1/mCwuz
         2DATITrXMLVdP19uVXpdqx477LeZKNB8Pxi/fy5uunWraHsynAJBhR8Qjh2jabWt9y1J
         hz4A==
X-Gm-Message-State: AOAM532+7+zcqkMcMxCFoqn4dKCceYuYM+Uwn8W0DxGF5pZ0JpZzuaHM
	RaZEOq74tNJzryTInJkvQ/A=
X-Google-Smtp-Source: ABdhPJz7dd1QCWeJu3v1f3On7VvxKaNl3ZRuD4Fvh8y8eg0lLIillSCs5NVKj6RPplmOZhyduPD3OA==
X-Received: by 2002:a05:6602:2003:: with SMTP id y3mr2371649iod.203.1601023811974;
        Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6638:12d0:: with SMTP id v16ls282839jas.8.gmail; Fri, 25
 Sep 2020 01:50:11 -0700 (PDT)
X-Received: by 2002:a02:a0c2:: with SMTP id i2mr2418266jah.92.1601023811278;
        Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601023811; cv=none;
        d=google.com; s=arc-20160816;
        b=XC9GJM0hQ2eBVKhyC4++DynEB3dpNTPDdwmLjyHLgi2+D598ayTKsHqAFc7DJmvtby
         2geQOtKOvGGHTSwyIUXo5oB5i/lPaRcWZVzFLMoCujqNKi/IWa4HSJ7HMhXQXPRzB+av
         FGUQgy2E5gC7eMkf8d5JnmPLs72fRYcwAjqa5o7XVXP+2KC+Jdz6p3t2+qbc4LoTSLy1
         WkBdlZ4NkersLopo9ZzPhMiVSFM+OEs5SmZW8GNA0yr3Oyi9hj10xUmD9aq7PsfZcnjh
         jSt6KlPU2u/qmU4Iurut+402mcNoZSnuN1mWfrm8Bt6a0h+K2/nFMVnT6+UY7Ko+l/K7
         fFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=BO2k0axgXZmuEYxxvjB54pyS5+y0i6R3lUBSS0jfVMc=;
        b=SrnxEZBU0b2GWwubgaCLht28Usn542Qs3qiBD4/sb9NEOz0GrqcPl/reXaDfzOyNOE
         u83IEvXiV8ofc1pgfoMM8l0BQt9RNbGQ1j0s9UyHK0tbUpBzHzMCjwlJgXlo/P7z3Bil
         E9H/0G77Ui9XpnOfxomRrzhVMcT1x6jJRA6YoxtxVd60kNGkCJVnJnMSSKq6K9iESEzE
         L7W43R1oczYtzaEnMOve7Gad6v8lSMOds6aVisGwb9P74EEEvAPbiwpp1k2M8XDpvxtf
         nu9f2xvgG5azHYcTF6+cRNHfr7JO85kVfnK9mVCtuQJpKRhJc2DXaXr2Q0E3CyuSJQmt
         ysNA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=s4Rwf8C5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id a5si142598ilr.3.2020.09.25.01.50.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github-lowworker-d1d6e31.ash1-iad.github.net (github-lowworker-d1d6e31.ash1-iad.github.net [10.56.105.50])
	by smtp.github.com (Postfix) with ESMTP id A459E34074D
	for <jailhouse-dev@googlegroups.com>; Fri, 25 Sep 2020 01:50:10 -0700 (PDT)
Date: Fri, 25 Sep 2020 01:50:10 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/068aa1-2fb93b@github.com>
Subject: [siemens/jailhouse] f9325e: inmates: x86: paging: move definitions to
 regs.h
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=s4Rwf8C5;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: f9325e628926c47a1ec75f7b0e53c571bed3d4e5
      https://github.com/siemens/jailhouse/commit/f9325e628926c47a1ec75f7b0e53c571bed3d4e5
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-09-25 (Fri, 25 Sep 2020)

  Changed paths:
    M inmates/lib/x86/include/asm/regs.h
    M inmates/lib/x86/mem.c

  Log Message:
  -----------
  inmates: x86: paging: move definitions to regs.h

We'll need them in assembly, so move them over to regs.h and align the naming
with the hypervisor. And introduce the shorthand PAGE_DEFAULT_FLAGS.

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b9e596b529f7e15d7cbbe9b273c6eef746e98ffe
      https://github.com/siemens/jailhouse/commit/b9e596b529f7e15d7cbbe9b273c6eef746e98ffe
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
      https://github.com/siemens/jailhouse/commit/a744fadddd8bce4e6b32e283ca84f5f6c17cd3f6
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
      https://github.com/siemens/jailhouse/commit/68ced33fa4a92030ec613543a29ef84711268e29
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
      https://github.com/siemens/jailhouse/commit/3f78d4cbe0e8db6c42d38c82479283c221bb7b69
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
      https://github.com/siemens/jailhouse/commit/90db7006488d638df345b95a4c871a783fab9d63
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
      https://github.com/siemens/jailhouse/commit/c1a7dd847f9b06e592a93d51ff0f50d7f6d88b37
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
      https://github.com/siemens/jailhouse/commit/f258244cc57e69dbba1ff4a94d4f35541cdf8baa
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
      https://github.com/siemens/jailhouse/commit/05a7d5fdab8a4da1bcbba7a1deab233c3a217f01
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
      https://github.com/siemens/jailhouse/commit/04866b908593d05c8c8be29fda6c890d83a99a6c
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
      https://github.com/siemens/jailhouse/commit/fee50d3d617b6ab72c4e22371adf31b394a9454b
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
      https://github.com/siemens/jailhouse/commit/47b390bac76c1ecb797ed6ed2d7c81373e1cc923
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-25 (Fri, 25 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop duplicate error messages

arm_smmu_tlb_sync_global already reports when it fails.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a38f43616d17b754095f52767f25dab4fe8b192d
      https://github.com/siemens/jailhouse/commit/a38f43616d17b754095f52767f25dab4fe8b192d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-25 (Fri, 25 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Handle arm_smmu_find_sme error properly

Bail out if they happen during cell init - apparently configuration
errors. Skip the entry if that happens during cell exit (unlikely).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2fb93be68166b2159fdc5572630e52fd6f5e2907
      https://github.com/siemens/jailhouse/commit/2fb93be68166b2159fdc5572630e52fd6f5e2907
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-25 (Fri, 25 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Improve output during setup

Makes the output more compact, fixes one missing line break and adds a
correlation with the physical unit.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/068aa113e63f...2fb93be68166

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/068aa1-2fb93b%40github.com.
