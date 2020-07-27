Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTFH7L4AKGQEHI4PAAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5422E824
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 10:43:57 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id a5sf7541591wmj.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 01:43:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595839436; cv=pass;
        d=google.com; s=arc-20160816;
        b=u8i8pb/x/NAmp76ioK6xS4FlARC/LPHqcj4aSYzo1leRlvEPeGwW4LxsMj3pNkazcP
         oB9gx8hSMIMitlxcutXsch9kiUAMK1gJxyd11ggGKCzs5n+xuTqabRvaHuYf23DRL3vk
         vHgGlKg6hI20yAs4IZ3c/KtOm9M/SYqLoUHuM269kO25aXY5LXQgt/9dYF3AbVar2+VZ
         huNhJlbt68h1IZ40EgLcGNFegy8Cqc2ybwwiXG/71IUO6ssQ+D1SpeWUib2GPgkNLtir
         icCAAhVEjYV3s7OC/R6h8avFCTxzf6N4sMNLtrYz67/QPB941hNtrr5BcdSgFmROK7br
         wxsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=MamXOYxaowpgnH5Bifw1hTywwm8bGMEc6VKPIYXpYQA=;
        b=hhZPOzzy9buK3puFdByu1feFl1vwdzyoT/pGHQpQZlebjRKhP0wXZjp4tw1XZKY5RB
         t8mmtlW8E+K5WHRD8uMGuqkdx8Hm1VfzRgxL3his1Uu2DAiRp7OcHzOxT3F8h/G1vOT8
         GPDTK/U4TuJ5g1VAPOU80Wvr69QBkh5KT4QaSowUbOjh5s4UYIwciRNGvBXlK007tIlb
         qELwG4GEPw+3mbxo4YZudGeh0wfK3dXXof0h7SLkeaHXjSaIHfLSI9oacD+JnY1Wvt43
         dWSxkjlRVeSN28DejLvC5eAihRBqcqOStksQRcnMfwc/TXCnYiBs9U6VcPMAvyNiHh+5
         s75g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=lYL8XRfi;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MamXOYxaowpgnH5Bifw1hTywwm8bGMEc6VKPIYXpYQA=;
        b=Umosm7//iMI6+Du57pgf+9kERLZ8OisulsiIx3fWv7i7eZfb9B6zzUYWJOvp/VgW2K
         K/9bPBjP4tESb7/MXz1rbTZUtWjNpVwL0SVfZ9TOT9teOzSnNI7if/7Z4j58Xd9X/9Mp
         2QpSqRNfB5Sijf67Ezg99vBFcjrLO+ZlAkhQQMLnFrc86ZS206/lc0fg1f/Q2icHnIba
         OiNo3MhT+JsviSV1tdNVFuQ9afszid3m1C79VoB6lP0EdvC/7I0aPofkWvDUbYcPQwx5
         Me3dwvGmKwy1WtNfo9UhIfC6QtwLL61I2lC4/PppyeIi/Bq7H+6VXupg5WGiqoO5VFDP
         t0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MamXOYxaowpgnH5Bifw1hTywwm8bGMEc6VKPIYXpYQA=;
        b=ZMH2RmvvStIkOdMYMXTWDH/kdhxrZU35jO8Nv+KF7vFuA41CZGghD6QZaWQc2MaxOf
         DJt63Rqvv13j2ZoNGawmxgTR1ezvURncE7O/QH7hPxqCxFVUFEN9/P3EvZG8IlU0YK/Z
         vEdg7NrM2tOX6SmP60zLqOrOAiUrEhK7XZuIFDvwY6117itHoQ/M11HJW+Coix40u+/j
         tAzw2zFGSo5MtGzw8sQQCN0TzJzwjUfRDPpsI6lISx7KSHIuR5JHoLoXPGsUuiUvgk3w
         SQasgtjXNQbJ6qrEjXgNHvm3x6XlgxXJfTYns1TnKmw5P4Bcn6k8bzQ2vYDu6L20B3Ix
         vkCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531u4EmH2GxswBrOzoeuaq/RY7yzVPErgAk4FHjZf90fnIML0PW2
	wI9H61iCsHEFkkeI38Kcsa0=
X-Google-Smtp-Source: ABdhPJy2Wup+8jTM6+vqEKVc+is80L95eacRD6X0vDlCe1vRv2xD1OeqTnXsdjSJ+zbo/01C60O+tg==
X-Received: by 2002:a1c:61d5:: with SMTP id v204mr17265011wmb.102.1595839436786;
        Mon, 27 Jul 2020 01:43:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls7296708wra.2.gmail; Mon, 27 Jul
 2020 01:43:56 -0700 (PDT)
X-Received: by 2002:a5d:5647:: with SMTP id j7mr18786398wrw.242.1595839436242;
        Mon, 27 Jul 2020 01:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595839436; cv=none;
        d=google.com; s=arc-20160816;
        b=A2t8hZUEQ1aMJ4TsBjjWQ9SqG1QTFAaxheWIyNqKmrQrBdkH6toe8ZkLQbuel1qXaZ
         +GaAIwd933HErHBgmfpcQ/p4v2Rvi4ARrhbS4KOgZnh0O6VXSGxigQbgzMf8SfLzjPpy
         Go7biNfXAJ9veWezcdr/IWnRMNxLe2I09B5hUN0nC/PXLxC+x92T+DqVBPUGCbJwBJ5p
         XwJZpf5wg7r0BWSaPaBs9LyZHRnsrDcuK1uiMotcfouaEQqvdIADvW9HCHzHYnPwxITL
         Cw8VbPLylV8fQeeCgwdpk9/KpWX0/JlU4hl1KoDH2+XI+9ahcnHczNNy5agXTiRZ+mdI
         1CuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=boBfWe3w1NOEQSTfKWdUjKMS0dc6uJTYw0kQmhBox/U=;
        b=Azzhga5hA7gEWfMWa52d2kUynO6+qqEMGFp+lAsLqBTxnX3ynOc5uRZbwF/IQlhgaD
         3tg8rLKkygw3UYNsoK2i73Wlmift5/v6CUW7ILF8YPWaTdnL7KYsbfYgPD3ILxl2CroP
         n8vjPjM4kt9D0uA7g6cNB5QvQjnoWZrTIsZsx7mT5dTdNMxeOJ4D9tOBHfXjCcBGeut8
         uCgjRSSzG6c6LeEr7i5RiNUOyDDYqA9OBu1zUgu0wtCWQOvpsqO7g4w6yvHEcSPFcmpK
         9VhG9KdBEwzdI2vPCeFDdpLv9oW+QlEYmndWvBR5eFsSfWLghMlAGKc5nIvEVNzjZww8
         IUSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=lYL8XRfi;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-26.smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id l18si532517wra.5.2020.07.27.01.43.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 01:43:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Received: from github-lowworker-1dbcc59.ash1-iad.github.net (github-lowworker-1dbcc59.ash1-iad.github.net [10.56.105.54])
	by smtp.github.com (Postfix) with ESMTP id 719BA5E0F26
	for <jailhouse-dev@googlegroups.com>; Mon, 27 Jul 2020 01:43:55 -0700 (PDT)
Date: Mon, 27 Jul 2020 01:43:55 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/384720-9b4efc@github.com>
Subject: [siemens/jailhouse] ade323: configs: qemu-arm64: Move virtual PCI
 host out of ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=lYL8XRfi;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.209 as
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

  Branch: refs/heads/master
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


Compare: https://github.com/siemens/jailhouse/compare/384720216c2f...9b4efcf4cb3a

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/384720-9b4efc%40github.com.
