Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB7HWXX4AKGQEY3CCHAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa40.google.com (mail-vk1-xa40.google.com [IPv6:2607:f8b0:4864:20::a40])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B92A221765
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 23:56:13 +0200 (CEST)
Received: by mail-vk1-xa40.google.com with SMTP id v84sf1323249vkv.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 14:56:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594850172; cv=pass;
        d=google.com; s=arc-20160816;
        b=nCElPmXThbSEZ5hhCkGbCoHIwwpf4AMGbj1wh8drw/66UQTuAV9Lgk1lCWLVLP8TA0
         f79WJyUBRdLs692cAUU9P+YoChuK48OTyscElNEsPb+pxgHKBqHr6nS/jtqXu8G+u3kY
         zTsawOqHrvFzzmulxbiwH+u0bI9lTO8DM44xSskJwU9icXnbt0TObfdeNx+nIDG8n+zh
         r5boyiHWjI5wx0VC7a2bLnZhFTQKdYwUx45k312gz/YtYdvYgWjBYNEvPI7ZoTM1asYG
         uKs6dWGC0Iely1pVDxadedmDefNwGH04Ip7Y30BkHG9xhv1yCZA6M+pYP5EbWbxDj1xw
         N4bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=7yuUp2ElXcvJGfIe5bYke/sgBqtni14Z/rmsmoK5QsA=;
        b=PQd1lVUZd7ICm1oDBMJyXd445WY72ge7PCmiQHmQ1YbWnygWgPHtVCOvXemoS+e7xU
         wwvDvFAEefOlAc+R+gtI9OVBJ53eeUqYIIQX4oE4RZg0/XsZN6VGjklmXLxU7u2oursF
         90+2OIEozgRrrbi3EbntuswDP4Y1BbLSAadk49MMmFsYozYO6ftEhg7f8uBg4v9P1Txb
         gpoNkSppFOv1Fe/F/j/pjpvHMqAQ8RlUA5k8NuoJcgGAxm0xkOwEAHw1IXw81c1ig2z/
         j+dHDBw3jc4DcDgSlSQj50L3SwhFM8ObWK7EjV0G9LzgAQ/J8Pm06/dBWFOe8DxFFQ73
         /N0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="CgQ8/T7u";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7yuUp2ElXcvJGfIe5bYke/sgBqtni14Z/rmsmoK5QsA=;
        b=K0u6J/q6qIeuETgjtbk+YLnki4iUmy3KD7Pb+8HQ+gZu4ZKGZc0EAljjpoVeG1UJ+K
         XHNe5bMt5YzIrB6sNhKiMxY4IuK+hSzaQ4g7a5aSFlZTPV4CnHog/lQ7o3liI6R5Ywc5
         6VubDmGyZwwK8/TIqb686meTVnrys42KjNnLJc4exDAQ3TL9Umzo2Fzw2ZUQSn7m8IVM
         3UgCJ51UMgZ4lDvMM2BTn8GkDlLjBdR08W9pDYRex0mW0R1aHpthVC+4MdHlaM3rEsZu
         AuvTfPdresHJ6Fm7ny1kalFDOloMLXkFsjn33mewxw81aVAqBeSw/WXto0zwduHa84Zf
         pKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7yuUp2ElXcvJGfIe5bYke/sgBqtni14Z/rmsmoK5QsA=;
        b=DOGYGZfPNQAzld31yFA+BJTp2z9ilowiyAn84YRxIAKXPonv0pdiSBYder+2XI9DL9
         MlifaJoOAo6d0/bhLV5U9Hv7rXafPVUuQ4kmprWEa0ZTUS9TXOGbCQd8mIngw7DEcedX
         C8aV4h3ouwwp1dpgqNg0Hp26CTiGdCdLN7X9sAOXtQ5gKg/qDaUaDMi6YPpO0wOqpxq3
         bmtdUfEI6Ds4W4347bclijArZx3bHN9qUaoubWxdTZjG4qSE/79pWlHXCwEk1bZnH6/L
         vT6EV7bdlGJamA29IPPvCKSJ9D6g8D3Yd0yfxsWYpkpOk1DMfh1UTGVZnSTItAeWyIb4
         kxng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530bwK4WCfLb4fgb83dCGO0xwPQtsQC+UDKGwEzGV3gy14oBXABu
	rmV3q5r4W8jOIIg5ZnDgI/s=
X-Google-Smtp-Source: ABdhPJxbMxdHI1pM2WI4sNltkQEB4+7tE4liwVuiV80B3HhoZuPsd0HvabWkvdJPtQDhf2D8DT7aGQ==
X-Received: by 2002:ab0:217:: with SMTP id 23mr1243697uas.51.1594850172459;
        Wed, 15 Jul 2020 14:56:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6122:12cf:: with SMTP id d15ls191442vkp.9.gmail; Wed, 15
 Jul 2020 14:56:11 -0700 (PDT)
X-Received: by 2002:a1f:5f49:: with SMTP id t70mr966284vkb.19.1594850171838;
        Wed, 15 Jul 2020 14:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594850171; cv=none;
        d=google.com; s=arc-20160816;
        b=lekqILqv7YzPkzEvMdogY4VAxNejmtuTVeffGY9FfEOhVq7u0ePobtnAg0DJ0bceWL
         lRJIWO1jENQwkMe+a22+sXCq4HEHd0ukTuQfrCoamLERsyP0JeuPryujHZzl/+dFH9LD
         Wwf+rVx/DK1tM1ZCWe1p+crWgL1ao2LnHWBhAiC989pjBgijOdx5wu4xwy5ZZBHPUK+F
         MIX583IoHccNNEuz6z5X433zRAMxw2+hU4qnlRVtf8ULivayRDupMVp19uIlRBKlMtNb
         8F92ST4w3/a8irtyjeGDXEv2rRZHbEvtL3xwgOlQA+VT1dxt2Ro8qRZXnq4n1aiMvw7b
         xXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=swk2O3S8AqK/mwVV7SG2kamGHxRLk2Yrvw1Q2MgLZK0=;
        b=VbIWt/g6JBk8Niyxolpu3hCfXKTv9jOfM8/hpCk90lJnscd6DullZ/eM2Fa1vGdFxu
         qtMjy4BYxSctKv3+HWrkBlL0tQBDj1e/TqzluAim5ghEn4ll6QrMqUHODVnZ9bDebI70
         6dNtey9R/svl1LoMBVZQH1jcy/kFUW62Y+/BZNTAFRaMvVdtikZ4OkrgQwBDUj39OvJl
         +EzsZebcaXwiB3r80B7W1OXEZPfctr8aU4gpbsTpytADi46OcS1wKqdVlDgJtVdnWlFj
         o+ilEQL2G4xay6NZ/hlLP1Oj537KqpA7uI/QpNfG4B/kTT3V/s8vmDmPStPGwANR63XI
         s8Qw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="CgQ8/T7u";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-9.smtp.github.com (out-9.smtp.github.com. [192.30.254.192])
        by gmr-mx.google.com with ESMTPS id t13si186227vsn.2.2020.07.15.14.56.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2020 14:56:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) client-ip=192.30.254.192;
Received: from github-lowworker-f045d1f.ac4-iad.github.net (github-lowworker-f045d1f.ac4-iad.github.net [10.52.19.54])
	by smtp.github.com (Postfix) with ESMTP id 63938260419
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jul 2020 14:56:10 -0700 (PDT)
Date: Wed, 15 Jul 2020 14:56:10 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/000000-cb6114@github.com>
Subject: [siemens/jailhouse] ade323: configs: qemu-arm64: Move virtual PCI
 host out of ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="CgQ8/T7u";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.254.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: ade3231483b5e5b16800f48b56e2e2c45ab67a8f
      https://github.com/siemens/jailhouse/commit/ade3231483b5e5b16800f48b56e2e2c45ab67a8f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M configs/arm64/dts/inmate-qemu-arm64.dts
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: qemu-arm64: Move virtual PCI host out of flash region

QEMU puts virtual flash between 0 and 0x800000. Avoid this conflict by
moving to a real free space.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 41d858e9584d59931b54a1946b7c3265b6ba1cd1
      https://github.com/siemens/jailhouse/commit/41d858e9584d59931b54a1946b7c3265b6ba1cd1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/arm-common/setup.c

  Log Message:
  -----------
  arm-common: Write VTCR only during arm_cpu_init

The value of VTCR does not change while Jailhouse is running. The
function that writes it so far, arm_paging_vcpu_init, is called on every
update of the pg_structs of a cell CPU. Writing VTCR each time as well
is harmless but unneeded.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9b4efcf4cb3ae36a555251ec01ba75d648c0f7a5
      https://github.com/siemens/jailhouse/commit/9b4efcf4cb3ae36a555251ec01ba75d648c0f7a5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/irqchip.h
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm-common: Refactor irqchip_send_sgi interface

Pull the setup of struct sgi into irqchip_send_sgi, avoiding the
duplication of this logic at the callers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cb6114f2f6086db90886a4bc0a5fd0c49e3a9053
      https://github.com/siemens/jailhouse/commit/cb6114f2f6086db90886a4bc0a5fd0c49e3a9053
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-15 (Wed, 15 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/gic-v2.c
    M hypervisor/arch/arm-common/gic-v3.c
    M hypervisor/arch/arm-common/include/asm/percpu.h
    M hypervisor/arch/arm-common/include/asm/smccc.h
    M hypervisor/arch/arm-common/irqchip.c
    M hypervisor/arch/arm-common/smccc.c
    M hypervisor/arch/arm64/asm-defines.c
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/include/asm/smc.h
    M hypervisor/arch/arm64/setup.c
    M hypervisor/arch/arm64/traps.c

  Log Message:
  -----------
  arm64: SDEI prototype

to-dos:
 - sdei detection should fail if only some cores report it
 - gic pass-through logic needs review
 - double-check if invalidating vtcr_el2 is safe


Compare: https://github.com/siemens/jailhouse/compare/ade3231483b5%5E...cb6114f2f608

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/000000-cb6114%40github.com.
