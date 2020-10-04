Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBYE65D5QKGQESGVPS2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id A0257282C5D
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 20:07:29 +0200 (CEST)
Received: by mail-qt1-x83b.google.com with SMTP id t4sf870120qtd.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 11:07:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601834848; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vtb8piYFfQpjbDSffwaNz+brH+cOZC1Chqgu78W6aRMpGH1HuGUZuOxFx2YEDP8K/P
         rLfGOmA1Mt1K9VAj5NCv73nv77g2SP/UMF6Y0Tdls1lAVWKx1r+yNGGFUXs0bLSWKtJS
         mcpWChLVIdriDJK08uR+eUTKMZQYUYy5cIZfqktrCLSJtwTSOkCiFMS4Qf5m7kX73UQR
         KIkzpJHgjGzoOKEVEzinYLRHQIJx+xK0fyfiO8wHx+v1eSQVHY8uKwMXOXjZP9y6Jbmi
         fLG/lbzkGRwUfCPykM/LC+DkLBbBIOX8t21OqaK/OEurXM6j1Xn+OQ5KYaFygVPCU1kl
         prZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=8YOSjUauPnYQ8MAa5du9IabYUh9wMBRIEdr0Irw1+uI=;
        b=1DH+BXBFY+j87PrR9XYT0Spa28eMI5pFMU5xIM362pufMS0Q9TfBpvxxGrdMdJx2/J
         ldVnZIfZyX6ufi30e0WTAmQxzzwREwEPaz8nwUO2tBi3P1kLmrtMDidtOrJTqGgjJQmO
         2/PkqiWrEAPCRylgR5ccDAHoUWSCApt7kISHS10mg4y+X1qVj8BjOLnfgNW7ZfqFd5Mx
         bWJoXKueNmoeaeZjxjSerctYnnnzLYUNOvxsu/MxKNLzrlbVxK0ULCdwKQFEETLYH2Nr
         bXYME4r+8exsy8zrJbpSIWKtAIV5+6ZXfpZPkq/aJQRMDsE14uNsizVsUDWJd0QqWl0J
         gY8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Txkkui3O;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=8YOSjUauPnYQ8MAa5du9IabYUh9wMBRIEdr0Irw1+uI=;
        b=mtOlPXTYKtOcGiToMMlucImktrVEY4OT+Z33+qp46mkyYC9h2Sb+LIQImviPlG7Ecb
         693PyxSi+kftqjtjxZ2oO5mg7UBIRoMxsOXUSYlFrDOymSqG0qFMRJgQzuabirrMG/Mm
         pHLWT4wUV5Hm/+oiGMmMRYJgDlfAjiuSkVdg3BFmhyCdVW0tSwS/xSU1DFv90Z/YPAqA
         atsRuNTYl0yc3ipLz5qU5UJ5b2BlPY3NnfYg2hmsgsKrI49vKyt60ztezeeWMgW/0dpR
         PIJAFeweWSXgU3LW3qb/XKofzL/xSdn/u5GdNuXqxdD5ut7kdYXjOOLz9AWSDLLvin6i
         wbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8YOSjUauPnYQ8MAa5du9IabYUh9wMBRIEdr0Irw1+uI=;
        b=etana/0es+CUJQ7ASo8m5PLiHXZ2Wn1N0PuAx2Qsrb+okkQiVGcQsbdijyA8qiGeHu
         Ul8pqQarTugp3Q4ghj2fLwGlNQJ4MQIpS4/hWCPrHC8OqIxiMrje9etH603rlmt5Hw4V
         p+nIGkaqX6jt1ZYo5qXmg3M3OoD46Fe404ygdCZJd/jvmnMDmV/QRKP68SwH90qKMuo0
         FwCpOmqHyaaKVIGT8msfJqfeSQHXWf2lMWb82GQp1mvYs4mi3bJER073dK3T/Jv4OQBw
         JADL9ADPqD4E43uzi2ZivITIg428xWrqWZNMhkz1eN+kGdnMLwH+YF8fMviwR4Sj4SPR
         rDFQ==
X-Gm-Message-State: AOAM533UgzDoQiKUYqgUTQwh1twJYuqXdqoQ/5VGJ1qYN5amqWuSbhn6
	5TYg/Lx5eBnon51Ddc1lZ4o=
X-Google-Smtp-Source: ABdhPJy9wIG4HJAAYg1o4aytWRv3biNBdwSHgH8ZP9YCoudmFj1i3uMY5QQujZ3toWhSCH/mvd04nQ==
X-Received: by 2002:a05:620a:48:: with SMTP id t8mr11478131qkt.368.1601834848436;
        Sun, 04 Oct 2020 11:07:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1112:: with SMTP id o18ls3448280qkk.2.gmail; Sun,
 04 Oct 2020 11:07:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a45:: with SMTP id j5mr11298229qka.367.1601834847759;
        Sun, 04 Oct 2020 11:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601834847; cv=none;
        d=google.com; s=arc-20160816;
        b=1BcsoiHsw+VhytjUWqgYnnPk+RQk9Rwps73Yl+5ewC33Tkr3ZYE+E6YQXeRHHW2HLc
         ZYvQVDJ82rDKU1d0qdQ58XlOOqrNGuzzW3ky0BGXL5yId8hMiA33UiEHGbnNufjTuj0w
         vkZmRVSC3G788nW2B1lggSxmuB84iYqC2NNLFu33s3ziEwcTJKzEw/JQ4NHii6qUH6BZ
         e5IonGu4s0Pg6LAxT4W7RDDqzYFYmoEhSzNPxlQbOXD2EJgDTm/ZjvOkRsuCsHq//9If
         snSUpf7rmB77Ju8JUr2p6HoH4cSnBOCbkEe2rIEjPKHw3n53V/TWRafwBB/+gnmMaUnh
         PHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=Xngmzs76yBiibG2jC26xViY55hEtOBItBctkBd4vOgI=;
        b=050zDBS7YPWYcflRNQWDKi5N8SLFDkdmzkMQxJbyboDKtNeG9F/q726x1DoSv457kK
         ayX/B2whfTladDNtVbb4lDdHbMWQr58zMxLITksGPjYsa8jgnOrcVay8m/3FJ70Y1hUQ
         klpyxYacm1p/kNOW5WE8QHwFrt+USFSeq/AawUS8m3/fOKNKXaS7pt/kQConA8ZYHdi4
         q26ug+bfgR6RdCWJXWmHGh+5hAGwlOu/+FAmAeHDhUJuF55fen9gATgoZnQ4CCEHlKLy
         veT8ksRoo0oW2pud0HQyStA0JBO4LVmWJeW03M7MGgIlvMiaK85jdSBnFaFOKGI77aPH
         6dgg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Txkkui3O;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id h18si450210qkg.3.2020.10.04.11.07.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Oct 2020 11:07:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Received: from github.com (hubbernetes-node-70f3dd3.ac4-iad.github.net [10.52.119.45])
	by smtp.github.com (Postfix) with ESMTPA id 7FABA56074A
	for <jailhouse-dev@googlegroups.com>; Sun,  4 Oct 2020 11:07:27 -0700 (PDT)
Date: Sun, 04 Oct 2020 11:07:27 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/9ae58f-e0d420@github.com>
Subject: [siemens/jailhouse] f0c780: configs: arm64: Add SMMU configuration
 for Ultra96
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Txkkui3O;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
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
  Commit: f0c7800586d10a1d53b6cbc5dd515404d4a8994c
      https://github.com/siemens/jailhouse/commit/f0c7800586d10a1d53b6cbc5dd515404d4a8994c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M configs/arm64/ultra96.c

  Log Message:
  -----------
  configs: arm64: Add SMMU configuration for Ultra96

This only lists the SDIO interfaces for now - more isn't working with
mainline so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a3fcb28ff4f58371c7a7e92be689927947b100d8
      https://github.com/siemens/jailhouse/commit/a3fcb28ff4f58371c7a7e92be689927947b100d8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

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


  Commit: 7434305f16589d47d0248ba127edd82bf234d9e0
      https://github.com/siemens/jailhouse/commit/7434305f16589d47d0248ba127edd82bf234d9e0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/include/asm/paging.h
    M hypervisor/arch/arm64/paging.c

  Log Message:
  -----------
  arm64: Simplify get_cpu_parange, add 52-bit case

Array lookup is simpler, given this input-output mapping. Cover the
52-bit case as well at this chance. This also obsoletes a couple of
PARANGE constants.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d59b094012dc4f14c62ec742648b9a98e153b554
      https://github.com/siemens/jailhouse/commit/d59b094012dc4f14c62ec742648b9a98e153b554
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Deny transfers by default

Make sure that DMA transfers from unconfigured sources do not sneak by.
This is in line with the access policy for other resources: Deny what is
not explicitly allowed.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f4e35ec4396ba4fc5b90a9280542ed8dc112b406
      https://github.com/siemens/jailhouse/commit/f4e35ec4396ba4fc5b90a9280542ed8dc112b406
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop test for non-zero base address

Setting type to JAILHOUSE_IOMMU_ARM_MMU500 already implies that the
entry is valid.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d5a0cd560e099f8bd6dfe0ec3006614ac4903fa2
      https://github.com/siemens/jailhouse/commit/d5a0cd560e099f8bd6dfe0ec3006614ac4903fa2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop useless features initialization

This field already comes zero-initialized.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7794bae4bd24dcdf3fef5478e9bef44655b44b05
      https://github.com/siemens/jailhouse/commit/7794bae4bd24dcdf3fef5478e9bef44655b44b05
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Clean up arm_smmu_find_sme parameters

Just pass in the arm_smmu_device, rather than the mask associated with
that device and the device index.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0ff6b52404d8c7f517e3bea2d682301323aed37b
      https://github.com/siemens/jailhouse/commit/0ff6b52404d8c7f517e3bea2d682301323aed37b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

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


  Commit: 51e75bc48215dad8e70f59c6b221eadfe4b7246e
      https://github.com/siemens/jailhouse/commit/51e75bc48215dad8e70f59c6b221eadfe4b7246e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Fold arm_smmu_free_sme into single caller

Simplifies the code. Also removes the test of the return value which was
always true.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 87d9bccf243d0bd094d0d06ed483800cbaa412bc
      https://github.com/siemens/jailhouse/commit/87d9bccf243d0bd094d0d06ed483800cbaa412bc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Replace for_each_smmu_sid with for_each_stream_id

We already had an iteration macro.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6aee39334bc289b65ff14e9885e5cd989efa9732
      https://github.com/siemens/jailhouse/commit/6aee39334bc289b65ff14e9885e5cd989efa9732
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Make sCR0 write-only

There is no need to preserve existing settings, and reserved fields can
always be overwritten by zeros (Should-Be-Zero-*or*-Preserved).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0bcb9f9f3795c42576304889855aba72b5f3a67b
      https://github.com/siemens/jailhouse/commit/0bcb9f9f3795c42576304889855aba72b5f3a67b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Add shutdown handler

Properly disable the SMMU on shutdown as well as on errors during setup.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 05038bf42660279774b93e05401732af771f19a1
      https://github.com/siemens/jailhouse/commit/05038bf42660279774b93e05401732af771f19a1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

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


  Commit: 0766d8d4d666156edbfc8450b9070f656b59e4e9
      https://github.com/siemens/jailhouse/commit/0766d8d4d666156edbfc8450b9070f656b59e4e9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Remove IRPTNDX traces

Not used with SMMUv2, which is what we focus on.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3863f10de16f95734e29de1693a323a89715bee2
      https://github.com/siemens/jailhouse/commit/3863f10de16f95734e29de1693a323a89715bee2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

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


  Commit: cfe4b3af813358e9cf5aa4c22b7b421803499189
      https://github.com/siemens/jailhouse/commit/cfe4b3af813358e9cf5aa4c22b7b421803499189
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop unneeded includes

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 39a8de01d1487d02de08aa5e5c4a85816ac4b010
      https://github.com/siemens/jailhouse/commit/39a8de01d1487d02de08aa5e5c4a85816ac4b010
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

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


  Commit: 1ac4c4aa05ae925a87ad07f259c86157d94277dd
      https://github.com/siemens/jailhouse/commit/1ac4c4aa05ae925a87ad07f259c86157d94277dd
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/include/asm/sysregs.h
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Move S2CR macro out of sysregs.h

Misplaced, they SMMUv1-specific.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 10fdfe550793a3bb829199e761fdf2e654b1e486
      https://github.com/siemens/jailhouse/commit/10fdfe550793a3bb829199e761fdf2e654b1e486
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

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


  Commit: c99b17c6bdb0b6941d626e81cfdc01efa4418523
      https://github.com/siemens/jailhouse/commit/c99b17c6bdb0b6941d626e81cfdc01efa4418523
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Simplify VMID and CBNDX allocation

Leaving VMID 0 free comes from Linux but is unneeded for Jailhouse.
Simply use one ID, the cell ID, for both VMID and the context bank
index.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a97632291c57e73bb1f4469de1a8e0d2c5e55b05
      https://github.com/siemens/jailhouse/commit/a97632291c57e73bb1f4469de1a8e0d2c5e55b05
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop write-only pgsize_bitmap

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 02a540534ff4ecfeaf4190ddf180d458332c2e7a
      https://github.com/siemens/jailhouse/commit/02a540534ff4ecfeaf4190ddf180d458332c2e7a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop write-only va_size field

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d77d299100407a39a90ddf20af6f2a2220ff1860
      https://github.com/siemens/jailhouse/commit/d77d299100407a39a90ddf20af6f2a2220ff1860
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

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


  Commit: 7ee8dd23048980b9e747693e5c72fc158c8abb01
      https://github.com/siemens/jailhouse/commit/7ee8dd23048980b9e747693e5c72fc158c8abb01
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Fix CBn_TCR initialization

This was simply wrong: We must use the same settings for the SMMU as for
the MMU because we share the page tables. We can pick up VTCR_CELL for
this, just like SMMUv3 does, we just need to mask out reserved bits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 39f26537be470a31c9f7cd000cffcdac3393f731
      https://github.com/siemens/jailhouse/commit/39f26537be470a31c9f7cd000cffcdac3393f731
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop coherency reporting

We don't do anything with this because we always flush TLBs after
changing the mappings.


  Commit: 52c27d9af380e78ca82fa752f3e2533a7d9dc99b
      https://github.com/siemens/jailhouse/commit/52c27d9af380e78ca82fa752f3e2533a7d9dc99b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop stream-match feature recording

We keep this information via smrs != NULL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9772826e4bf5b4e0239939a413eeeba34cf4ff33
      https://github.com/siemens/jailhouse/commit/9772826e4bf5b4e0239939a413eeeba34cf4ff33
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop 16-bit VMID feature

We are limited by the number of context banks, and those are 128 at
most. That fits into 8 bits.

This obsoletes the features field in arm_smmu_device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 07546f0ef191d4b10f65be22aa97147fd211f6c9
      https://github.com/siemens/jailhouse/commit/07546f0ef191d4b10f65be22aa97147fd211f6c9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop dead ARM_SMMU_OPT_SECURE_CFG_ACCESS

In Linux, this is set for a caldexa device which we do not support. So
ARM_SMMU_OPT_SECURE_CFG_ACCESS was never set. Simply replace
ARM_SMMU_GR0_NS with ARM_SMMU_GR0 and remove dead artifacts.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cdcd368a564360e1df98a78b4a8a7306c7bf3b28
      https://github.com/siemens/jailhouse/commit/cdcd368a564360e1df98a78b4a8a7306c7bf3b28
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop dead arm_smmu_test_smr_masks

Nothing was done with the results.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0096659f575af9ee67e51ece770116f31793da57
      https://github.com/siemens/jailhouse/commit/0096659f575af9ee67e51ece770116f31793da57
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Fix TLB flush on cell exit

We must update S2CR and SMRs first, then flush. Otherwise, TLB entries
might be left which refer to the old settings.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c4da54daafe45071e6d769b63a8293eb86bda741
      https://github.com/siemens/jailhouse/commit/c4da54daafe45071e6d769b63a8293eb86bda741
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Disable context bank only once on cell exit

No need to run this sequence for every SID the cell owned.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 71b92b25905c132d73eb08d181329f21b6a30be4
      https://github.com/siemens/jailhouse/commit/71b92b25905c132d73eb08d181329f21b6a30be4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Introduce arm_smmu_disable_context_bank

This avoid having to carry the information if a context bank is enabled
and makes the code more readable.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: efb57a396e9242c0e73be207e48cea4d8e3190c6
      https://github.com/siemens/jailhouse/commit/efb57a396e9242c0e73be207e48cea4d8e3190c6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Refactor ID0 evaluation

Use GET_FIELD where possible, drop pointless clearing of ID0_S1TS and
ID0_NTS.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: de4c5a29c0129742ef84a5e5c5d919b367f08856
      https://github.com/siemens/jailhouse/commit/de4c5a29c0129742ef84a5e5c5d919b367f08856
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Refactor ID1 evaluation

Use GET_FIELD where possible.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bcd0f80f8ae8dcdd9a1140c33c2233ee5b8fe3b4
      https://github.com/siemens/jailhouse/commit/bcd0f80f8ae8dcdd9a1140c33c2233ee5b8fe3b4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Refactor ID2 evaluation

Use GET_FIELD where possible, change to descending bit order.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1828aa461a846dcfba4873019d613162585ea137
      https://github.com/siemens/jailhouse/commit/1828aa461a846dcfba4873019d613162585ea137
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Check IAS and OAS against CPU parange

Make sure that supported range of the SMMU is compatible with what we
need to use via the MMU settings. Bail out if not, and rather drop
useless reporting in the code case.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 226a11e8c18afb4acd7d3aff9b08fc0dcd4ff2c0
      https://github.com/siemens/jailhouse/commit/226a11e8c18afb4acd7d3aff9b08fc0dcd4ff2c0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Refactor ID7 evaluation

Use GET_FIELD where possible.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 16e2acc785aab3d1b2329fddafd2bf7e3bfec96f
      https://github.com/siemens/jailhouse/commit/16e2acc785aab3d1b2329fddafd2bf7e3bfec96f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Demand version 2

We only support version 2, and this should be checked during probe
already. Makes arm_smmu_device_reset a bit simpler.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9f7b93860e5a4af3a690f4098563b1344fa9a676
      https://github.com/siemens/jailhouse/commit/9f7b93860e5a4af3a690f4098563b1344fa9a676
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop more unused fields from arm_smmu_device

num_s2_context_banks is only locally used during probe, and the rest is
just dead leftover from the Linux driver.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bf62abf1407d8f2d8bcbde24a3bb50bbd5dcb88d
      https://github.com/siemens/jailhouse/commit/bf62abf1407d8f2d8bcbde24a3bb50bbd5dcb88d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Catch VMID exhaustion

As we map each cell on an exclusively used context bank, make sure we do
not overrun the hardware limits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1ad9321824c4091943d8cd30985d664a62d8caa6
      https://github.com/siemens/jailhouse/commit/1ad9321824c4091943d8cd30985d664a62d8caa6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Rename ARM_SMMU_CB_TTBCR, drop unused ARM_SMMU_CB_CONTEXTIDR

TTBCR is SMMUv1 terminology. We are v2-only.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4c37dc7211856ca2f49542876406762b49b9e915
      https://github.com/siemens/jailhouse/commit/4c37dc7211856ca2f49542876406762b49b9e915
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Fix CNn_TTBR construction

There is no VMID in CNn_TTBR - stop writing to reserved bits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a2f56df7423b6277b6162aae62c80b98956af7d0
      https://github.com/siemens/jailhouse/commit/a2f56df7423b6277b6162aae62c80b98956af7d0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

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


  Commit: a910f9b26572cd64462b16a6345288062a5fd844
      https://github.com/siemens/jailhouse/commit/a910f9b26572cd64462b16a6345288062a5fd844
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Clean up arm_smmu_tlb_sync_global further

It still contained fragments of the Linux back-off mechanism which was
removed already. Adjust the loop counters to the new iteration count.
Will wait at least one second now.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e0d420547c1cbe637a40bbf3027e82c908271150
      https://github.com/siemens/jailhouse/commit/e0d420547c1cbe637a40bbf3027e82c908271150
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-04 (Sun, 04 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Return StreamIDs on cell destruction to the root cell

If we stole a StreamID from the root cell, which happens implicitly by
adjusting the matching SMR, make sure to return it on cell destruction.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/9ae58f6cdb1b...e0d420547c1c

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/9ae58f-e0d420%40github.com.
