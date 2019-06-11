Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBPEWQDUAKGQEUULEVIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3a.google.com (mail-vk1-xa3a.google.com [IPv6:2607:f8b0:4864:20::a3a])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD373DBB2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 22:12:45 +0200 (CEST)
Received: by mail-vk1-xa3a.google.com with SMTP id d143sf4311086vkf.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 13:12:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560283964; cv=pass;
        d=google.com; s=arc-20160816;
        b=UwybkJVI7Da4cwggAUsBF3mAi2FC+1pVezcBCJL4Q/lalMfVuNoq8HbDFCKLiwuMDM
         oXw3qaPzmUHpW7Vmh2lJXnvF3f1T/+G5RzePJfpMSiswFT1bxwKmtVsyiiCul8Edw3C2
         l52FFLTqaE5RAlz686kTB1MMDzVPlwHRoDi1HLc0v1goATeIDXnkm96UaUPdBajwWJWJ
         wvIAi3+UpgGe3CBnbA6YzyyQ3c7H8cgKAYtjB8Tby07sQPhXblw0nzfSBZ4pUZxRdpo+
         qkWK0XnOtKeWBzxGFmdYMxxrZPfIMtfFLTHfpwxAJ/2AXXuSI/u+sYJF41RJvXY1jdVH
         wRLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=8eZ3ClZhwN+z7VwW3R+yhesUaHHIZXq0AMAPIVFLQR0=;
        b=TSVcf3fA9K/XgRuBaMY4oSlBDl39kXeWOaMzg/9MvyExx3iLdAsYwXAYjARRYNeNh4
         OsiagfCMBFe8ygBfxCPMPvsslyGusBiUIo0j1usQ+NUPuarVlInltoNFuCvezYTOCEm3
         JdBBsxu+U+EsbPU6aT/jBAHYBCn17QWqQ6eV73f8Qxf7Atjl87CqkBnX/jUmR0kMdY9n
         lVg/XPnsg+Rn0ncA+3+28qV4+SOFg6ik5828dUXtB7oo7GXpuKAEeA8ryzxmgMPpvtl1
         /L+FemZ74cf5sbqZjVH2M3TI3FslNaoABpSp1wdNR55ZL1qOP7zojK89YLjrx2M5aEAP
         uCqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Qag67Cu7;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8eZ3ClZhwN+z7VwW3R+yhesUaHHIZXq0AMAPIVFLQR0=;
        b=WPchvtHN3kzwdzYAxEkklJiu9xY4sudScoQvdPtpq5f1WMXQZlOOjyJwUJPNJfc6+t
         uR48BBgS3I6/NtcK1mjPtZPM7xzsgMHfi2htxnsi3xNSIQE6qLaoEpGTduyH/Sa88Z5g
         bINcNGO2BG/dpQP59/NAOxnYlRwSy8auj7PSw22DwrJCGK/Zh4c33qg+kWDG2vRvP9mf
         jQsN7ZyyvhdIVLl/D4NZsAwqIdZx869JX463ophfcd11ONwNH6tiFvt+64tRr0mrr2Xa
         ED2HV23McK739Dd6ZGhq6Ks98rpht6RIAbCjC/UNKU6e8BUZCWxYPac4j1dfEcdvez6x
         fumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8eZ3ClZhwN+z7VwW3R+yhesUaHHIZXq0AMAPIVFLQR0=;
        b=ofTHNbTKnwtms9vw1QmxS9if7MDVekje1eEiBtOQX8BSsfOKl3dBuNL4oj0VB5SWdh
         jUfyOHrO2K590h40Jsae6Zokb+XIO7AwMlf93C/pGJwqOvpPY/VP8Mi/sEYOMeK8ZIT6
         5Mk9z7ZyOy2RJzlOX4KgRDICS+oHAq/MdV9nzRu2AwA5MnPNIpwt/Z/L+BxAcK4KqLF3
         M4RHqJB8CtyzI+WKrQq1jpCAwXdgb5IuDZ6MpClnHXT+gtMisYlHxzYbPpcaY7yZ8hzd
         zM7e2j/K1qCmaCUv5SAC/jZZRsxnfuyyzd6w25r0TqNZJ7b7QnJU+3vrpdebepkIh16C
         6sLg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVkiXPGaisvisXRLjgO9btVcKGKa3PFdT5bZzhaLvqk3N90hzFI
	HvXDcriYf8FO4sloLr5twzc=
X-Google-Smtp-Source: APXvYqzr8UjqzEWUNduY2yit0YiSEsM1Hsha0ngOJq5Cip/XNWCtdLyfzo8vcZMFXtwqLF6xCDEfrA==
X-Received: by 2002:ab0:7848:: with SMTP id y8mr19998808uaq.58.1560283964592;
        Tue, 11 Jun 2019 13:12:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:16c3:: with SMTP id g3ls227037uaf.0.gmail; Tue, 11 Jun
 2019 13:12:44 -0700 (PDT)
X-Received: by 2002:ab0:4744:: with SMTP id i4mr4243674uac.63.1560283964053;
        Tue, 11 Jun 2019 13:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560283964; cv=none;
        d=google.com; s=arc-20160816;
        b=hwhJpF4kINlsNByIb7osCg4K2nJ7IS0OfgVUTLdYFrE3mTqybXB9tvQnQvEepsRI8T
         GbtIj70nbs03hTrn9YM/2RrEiwfRjG0s3Aonxt2yF8FqAjoO6ODaIkuH6iBJR33QxZen
         P7ndqLznHJB/nnrNlToOBIkHxtjZZbWDzmw3NY/pNJ9CUPxdhqdNVeYxKqUQAkMNC+MB
         URw4vKe4GLpvtEHbyUBxlhDaLhtI9T51k8Bc6+DobheYDEzG3RuHfj8driM09zYBGsO3
         P2noWZvrAfCJi/igFuHK5xIsn6Ify9nCX3BME0l3zptw2wJ5uDvC9T0eAzc+kxi3pDGP
         onMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=IbhovBRBqbFiZKHiAALmzgG16nmBD/V1WuNNClFM2Iw=;
        b=lGzsudgYPiEWURwD5kj1P8PHehOY1bfByvsE/0SMccf+LeGKYjbQVQVM5OheG4xude
         CbQI+O6eTWNL46FixWF/a0yZc7rpD9ll4YOPn5Z6R/4cJR6U3s+i/PFV45rrJf1dRtSX
         xFcjHARbIFOHGylGSBSyqYE5XM+hcYmrBWrrcADfs9F8ZueYKa8+chxAWDffXD5NZklZ
         bnzyDcC/9lWT9WMJEjquhrv3noHPV2mpIFb8YudsdvMFiI+uwVmEiX9PmdXs+M2YZccj
         Y5cJogrhhGawTS/FdV5EgcZQPn8vqGZx5VEhVhJEw7dD7cF4DOfdb6Lgpq4pvCmwulnx
         aK3Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Qag67Cu7;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-17.smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id v21si511145vso.2.2019.06.11.13.12.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 13:12:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Date: Tue, 11 Jun 2019 13:12:43 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/0c3e5e-961576@github.com>
Subject: [siemens/jailhouse] f7604e: x86: vtd: Use proper MMIO_ERROR instead
 of -1
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Qag67Cu7;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.200 as
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
  Commit: f7604e0b4beda5985aceebe50228c3e14abe4d0b
      https://github.com/siemens/jailhouse/commit/f7604e0b4beda5985aceebe50228c3e14abe4d0b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-06 (Thu, 06 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: vtd: Use proper MMIO_ERROR instead of -1

No functional change as the value stays the same.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d07b0dcba4837e2f5cc9799d777a32b1ab5f7936
      https://github.com/siemens/jailhouse/commit/d07b0dcba4837e2f5cc9799d777a32b1ab5f7936
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-06-07 (Fri, 07 Jun 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: fix IVDM memory region definition

Second parameter to MemRegion must be its end (inclusive).

Fixes: 5fe206927c05 ("tools: Implement ACPI IVRS table parser")
Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8c5b95c43a8c41a2f648a8d3b0b95533916cca17
      https://github.com/siemens/jailhouse/commit/8c5b95c43a8c41a2f648a8d3b0b95533916cca17
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-07 (Fri, 07 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/include/asm/mmio.h
    M hypervisor/arch/x86/mmio.c
    M hypervisor/arch/x86/vcpu.c
    M inmates/tests/x86/mmio-access-32.c
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  x86: mmio: fix accidental clears of bits in registers

We trap certain MMIO accesses and need to emulate their access.

On x86, a 32-bit read will clear bits 32-63 of a register.

Inconsistently, on x86, 16-bit and 8-bit reads must not clear high bits.
Jailhouse erroneously cleared those bits. Prevent this by applying a
preserved mask that keeps bits alive.

Add tests that check correct behaviour.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: dropped redundant EXPECT_EQUAL]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a39be9c3499f51a05dedf5b8612cee42f82db659
      https://github.com/siemens/jailhouse/commit/a39be9c3499f51a05dedf5b8612cee42f82db659
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-07 (Fri, 07 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/mmio.c

  Log Message:
  -----------
  x86: mmio: move flags to struct parse_context

We can easier pass them around if flags are stored in struct
parse_context.

Just a preparation, no functional change so far.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 96157677dfbb37cc112e4384bbd4c585f9d98af6
      https://github.com/siemens/jailhouse/commit/96157677dfbb37cc112e4384bbd4c585f9d98af6
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-07 (Fri, 07 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/include/asm/processor.h
    M hypervisor/arch/x86/mmio.c
    M inmates/tests/x86/mmio-access-32.c
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  x86: mmio: add support for 0x66 operand prefix

mov (%rax), %ax is a 16-bit data MOV_FROM_MEM that will emit
0x66 0x8b 0x00.

0x66 is the operand-size override prefix which we currently do not support.

We should support it, as we can find this opcode, for example, for some
mmconfig space access from Linux (e.g., pci_generic_config_read).

This also adds appropriate mmio-access tests.

Tested in QEMU virtual target.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: dropped redundant EXPECT_EQUAL, adjusted ebx->rax addressing, tuned comment]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/0c3e5eb67e17...96157677dfbb

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/0c3e5e-961576%40github.com.
For more options, visit https://groups.google.com/d/optout.
