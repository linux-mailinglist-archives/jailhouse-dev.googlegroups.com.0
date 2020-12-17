Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBFO4537AKGQE7YTL2WA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x440.google.com (mail-pf1-x440.google.com [IPv6:2607:f8b0:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501A2DD931
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 20:14:32 +0100 (CET)
Received: by mail-pf1-x440.google.com with SMTP id e126sf19119390pfh.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 11:14:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608232470; cv=pass;
        d=google.com; s=arc-20160816;
        b=lvC1AfTW+ViB+3i1ENvMUtdQp0VSpZgMtf/egCJ9DzH9ZVwkn1Ju+lVTVZmlU0nRwL
         LBNhXBUZAuhfS3LQNUpOpX9p92vXqE7eGgp1vbM6lVW0aQdVWIJ4Z/skoBd/ONXAdKum
         fCqF7MyWeKhqsKrNPee4pgBgnTEmTOyeV8WvQ9usYowDPCWkKpn9+PlxnZ6zi9HAZjAr
         jNny7VJs03ffgqQmwzBftlkhaEnFGQnKHMMLvvBCIM9ahN6WhQ/inaox3ymjg+RHYtYI
         VUVZQLPIkz9jN5Wf4+3TxkMI46Uc59hDbx/5Szsea47ak8ghRYY+XJEFLEZhXuUOcdpv
         vLuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=SXC1kH887nnRQ1nK2xpM7xnD33W9xrQ7p7sFtj1/K20=;
        b=r/9j1EpDDTxI2UR2D8Ek7vZ4veKTY4FYjO1RxvC9tAWjgpPQeawf5A7evXNSdnkqfS
         i+9SXv5UzSayWz6CSamDoRze9YlrpAtIYlWWfB/1polan2amO7H7yphOXkN+VsC+HuIK
         QXdpJl71jEJDx1w/3hRBmBMfS+AnGvqvsotx7L+PIOI9k39jxH+Ge459ljf7PgD9Ac2K
         7sXnKFHNJnVHF/ISh2zFp3x2MV3SHdsxJbtDceZa0f+Ri0CB1G2afjz/KhqAxky/pj1f
         P3m97MhIajFxN1QlmTz1gYJTJgMwHE7mVT1eDpcO1eDRtV4qSN4CaQQfLCfE/05eEyCQ
         5iTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=psau1eqI;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=SXC1kH887nnRQ1nK2xpM7xnD33W9xrQ7p7sFtj1/K20=;
        b=JoB4jW8ftm28xoKwmnWG7NtLmAQKmxZeAzN0HBvXpiu5tztDzSBMt0Z4g+RDRq2jBn
         aRi4PUuYIij8EtKwo9JfjkXYCG+7P2cVdbdoGxH/zeepC8gDc/SJfhpNbzvWEvNQ8d3L
         Z4+NwqbPwJmJZB4Aa0xMw3d9RrEkyfRjSREYmhkluJ7c0RKcOmjzAiHZ/gH5+Ef5RXWH
         z2awm8xQXkru1dKsnycFORUu9uZlp4eeqWYsmasqIowNAKWoo7dWmsnrDWFQWcfDVT4v
         BHUY3coEEdujWUnG3xf5rGNuFqAtPCs9jqStVnbSph4oScjKibzsEMGxcNUsuXyzHdUZ
         vVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SXC1kH887nnRQ1nK2xpM7xnD33W9xrQ7p7sFtj1/K20=;
        b=VGoDZZebuumRY6vjYX5lxG5FkU7rYeT6ddIHl2cRgyUGXR2Rgu61zAMhpJ2lrW4GLm
         ejAcPOhhIhPWqbkdvpVCM/XZDNrPoMibD2rWq5LgAS3Wvc/CHvX5vG9r6es6i2odM5RA
         0/LteILxrM29jailgk1Gd6ZiHRaPRQw9CFbzHKb0B1x58GW/lXb66ydvx93R/FmTrluT
         tP0bOxPRVQFjTVdoBUu1+rVaaus5KXnklN/GgLkcf791mjzK1EwP0OSb9CPY0i+EWoQJ
         vWYl7KMmOw73Tktp7iX4dhQjlRwNmYvIwufredfgfw+V/efFe8haqd7Jzc69oPQsxZEI
         1VbA==
X-Gm-Message-State: AOAM533weU/njIhVtfyC9rnFkZQxY1IOSrVh/hbX3wCQYHNjFUKYkzLV
	i1W2tkU1j30RFm2S1bItvH4=
X-Google-Smtp-Source: ABdhPJyVssCuA6jpkVKNz8SP5YHcFzidXJRf4VuVZ+0q0HpIJsBcuAnx1ryE9+RTD+umV1p5D/NmZA==
X-Received: by 2002:a17:902:bd01:b029:da:5bec:9ca2 with SMTP id p1-20020a170902bd01b02900da5bec9ca2mr576287pls.62.1608232470125;
        Thu, 17 Dec 2020 11:14:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:9a47:: with SMTP id x7ls13387529plv.1.gmail; Thu, 17
 Dec 2020 11:14:29 -0800 (PST)
X-Received: by 2002:a17:90a:fcc:: with SMTP id 70mr633795pjz.168.1608232469199;
        Thu, 17 Dec 2020 11:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608232469; cv=none;
        d=google.com; s=arc-20160816;
        b=Nn1fRvP/weGLN/S5LHpCUR8sTadNFeZvmsoiQbR2SFlTMvDuzT5i40ZZ0v4a5kQNig
         sdSY1gTqwNAkC+vDK4Ss/N0wi693Xonni2t+lO/57rdLWQ1X+eyLQ3Ypt2LKGkCpRlKO
         UQiidGenvFoOOhn4DmKU7cxMuKEPgWqVgAcv8+D9i3wq0FySao+TP3W7ZfN0wzVDIxk5
         ylqEwir/RADk3vw9OD0IYKsUGa7Vn7lbZQTET4OO51HoUlbxtikX7+47rRGKZedXy7SM
         3OYAcOxexAdc87GZmy+KGYWA+mzw2OUXVrMA9HnC+TAFLXFHUUufdYHj3jZoe7pyrJwZ
         xzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=Nx73OfFq27yzxskbSU9P9v4jCNkgJWpk5hfrk6dkkzk=;
        b=k6rtnHuq1uYrJYrOlt7OpiA5IgbM68w5iKXA6emWGFSUjzZESun40gTPiVylEQVxHn
         6DuwCVOVgX17lmK59GpPlrekjuU4BYywTomAtnPDRJiZKG+VxAUnTWZa4h5LaUvBgMWM
         7MixjG3kN5ayhJA7IrGuGXDfAZQHT/tXavpr2O5j040fad+XQ5c7IUHlkfi2BFnYYuMR
         oFl27AwUDEYLA9+qWHlM+PJkbZwIY8ifRvdbItslN84l6xwgmN/W3TZrfRU4cTpYs+rz
         gxtUSGBsYeIpJrT+vGEn843RGui8zvKv3ApBZHKhxVjcbmxfLCntVX5mDwn1X3NTSHoY
         Vxow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=psau1eqI;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-25.smtp.github.com. [192.30.252.208])
        by gmr-mx.google.com with ESMTPS id b18si419858pls.1.2020.12.17.11.14.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Dec 2020 11:14:29 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) client-ip=192.30.252.208;
Received: from github.com (hubbernetes-node-05799de.ash1-iad.github.net [10.56.110.70])
	by smtp.github.com (Postfix) with ESMTPA id 6E126840CED
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Dec 2020 11:14:28 -0800 (PST)
Date: Thu, 17 Dec 2020 11:14:28 -0800
From: "'Andrea Bastoni' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/af8a66-3ad66a@github.com>
Subject: [siemens/jailhouse] 1dc6b9: arm64, configs: SMMUv2: Separate stream
 ID's mask ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=psau1eqI;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.208 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Andrea Bastoni <noreply@github.com>
Reply-To: Andrea Bastoni <noreply@github.com>
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
  Commit: 1dc6b9c0aa354fb0c26680708fc6802112d88ca0
      https://github.com/siemens/jailhouse/commit/1dc6b9c0aa354fb0c26680708fc6802112d88ca0
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-12-04 (Fri, 04 Dec 2020)

  Changed paths:
    M configs/arm64/imx8qm-linux-demo.c
    M configs/arm64/imx8qm.c
    M configs/arm64/k3-j7200-evm-linux-demo.c
    M configs/arm64/k3-j7200-evm.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102.c
    M hypervisor/arch/arm64/smmu-v3.c
    M hypervisor/arch/arm64/smmu.c
    M hypervisor/arch/arm64/ti-pvu.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm64, configs: SMMUv2: Separate stream ID's mask and id

The SMMUv2 allows filtering bits when matching stream IDs before they're
passed to the TCU. In this way multiple streams legally get the same
translation.

On boards such as the ZCU Ultrascale+, the master ID needed to identify
the corresponding SMMU stream ID may be dependent on a specific AXI ID
that is set by the PL (and could be IP specific).

One single fixed mask to pass to the SMR to compact multiple stream IDs
before they "hit" the TCU is not flexible enough. The use-case is to
compact similar PL-originating masters and have the SMMU behaving the
same for them (e.g., they're assigned to the same inmate). At the
same time, one needs a full stream_id to assign e.g., different GEM
ethernets to different inmates.

Update a stream_id to support two different interpretations:
- for the SMMUv2, provide an explicit mask_out + ID.
- for the SMMUv3, keep the current single ID.

This commit updates the SMMUv2 / v3 --including configuration--
accordingly.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 297ac264c0f4a4e163b77ab8942780cc1f5f6c61
      https://github.com/siemens/jailhouse/commit/297ac264c0f4a4e163b77ab8942780cc1f5f6c61
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-12-04 (Fri, 04 Dec 2020)

  Changed paths:
    M configs/Makefile
    M configs/arm64/k3-j7200-evm-linux-demo.c
    M configs/arm64/k3-j7200-evm.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: add Wall and fix bracketing

In combination with Wextra, Wall enables additional checks such as
Wmissing-braces.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3ad66a08f2e14443581acd77740d3b41d3a21e37
      https://github.com/siemens/jailhouse/commit/3ad66a08f2e14443581acd77740d3b41d3a21e37
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-12-17 (Thu, 17 Dec 2020)

  Changed paths:
    M configs/Makefile
    M inmates/Makefile

  Log Message:
  -----------
  configs, inmates: Makefile: remove .note.gnu.property section during objcopy

It seems that the .note.gnu.property section is interfering with objcpy and
causes the "JHSYST" identification to be removed from the .cell.

Removing the section while copying the .o fixes the issue:

objcopy --version
GNU objcopy (GNU Binutils for Ubuntu) 2.34

readelf -a jailhouse/configs/x86/qemu-x86.o
...
Displaying notes found in: .note.gnu.property
  Owner                Data size        Description
  GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
      Properties: x86 feature: IBT, SHSTK

hexdump -C jailhouse/configs/x86/qemu-x86.cell
00000000  04 00 00 00 10 00 00 00  05 00 00 00 47 4e 55 00  |............GNU.|

objcopy -O binary --remove-section=.note.gnu.property
jailhouse/configs/x86/qemu-x86.o jailhouse/configs/x86/qemu-x86.cell

00000000  4a 48 53 59 53 54 0d 00  01 00 00 00 00 00 00 3a  |JHSYST.........:|

Maybe related to:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=906414

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/af8a664fbfa5...3ad66a08f2e1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/af8a66-3ad66a%40github.com.
