Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB6W55KBQMGQEADWIVHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x238.google.com (mail-oi1-x238.google.com [IPv6:2607:f8b0:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 36157362EFE
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 11:48:44 +0200 (CEST)
Received: by mail-oi1-x238.google.com with SMTP id s9-20020acadb090000b0290101bacefaa4sf10125865oig.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 02:48:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618652923; cv=pass;
        d=google.com; s=arc-20160816;
        b=GiH+z/HslY2xj2D6iS7dVAkBcr++saVVtCqddAmEyaEHRVCIkOuR5ZySJWemdjcoaT
         D1dLvq35auBGL9drVFasQ8NeXwkmQYQmGjylBHW3CjbxRxGPLuu2rDlOuC8L9F6a46TH
         z5RjtFZMidYUroej8D7U08bTY9/30kZBWJk+kSfjLmgDQrjlRZ+tgXtGZ1uf0Lsn8hKr
         rk11oUyCwjl1dHMwJGq1pdh1dlanMdxT6Rli3SG0pS/AuhFTPtdX/It0h1sFUng0Bf6h
         hgd4OR56S/SI8SkERskdWr0afnexd3yBzJ1wTzj6sS0rqYALuK69TYXGrPzkDnksYBZY
         6fgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=ET5z40dQD2YHR1iJG1YFrmr81KMXLv4iieQ3juv8wlo=;
        b=oLb+orCjcfU/ok7Ah8cyRSKPwSHkPdG3bD8hhRucb+a2prGXGG6qXPNKJUe4xrBvWK
         CyeWW7Qrw4EQJSQTnb/5hT9YK1PZW4Rsqh/AC60PbZZKptxo9RIPb49kGvO/PFTMYKog
         YXZrq4X3GvzWGMWBm4OboSj80f87FkXEGmfxGnn0jP/lcXhix42m+LTzfL298n2ONiZ0
         3MXmh4TnqeSo8nTO1Nn6rAAwc3cHJ6Rp5JbPYljP9LtwCxCbPsNtfxTDRrJi/2wg/viA
         GtaGp9BUa6ZNraX56OEpz7qw/nX+FSsGMyztz6czQ4XqjOZxY8h8Ar2TrzKp53T75p2K
         UpgQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=lRDlpkca;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=ET5z40dQD2YHR1iJG1YFrmr81KMXLv4iieQ3juv8wlo=;
        b=DstdSF3B0WAkx0hj6wmhoE6fAzUXKlvzboMFysEm+w8Qf4bLv6KE+krMSRywc0x/xf
         YMoiWu2th/6De/4WXhyG0Nn8b9EYfP4nVJYHxiMa/nbnSfb0w/4ORYP91u2zeAMMt99u
         VNAVrURLEqvmdy0+CRxBG6CR43T20c2zBC//+vTGFbSmgCQ4YLAF3Az118W5+FNKvu8C
         LGmAvMNPdS4v+qpx6Y7HKVMFfZOjHFSA+0da9nV7SkxMPNXXVS13reXrKPwtWs1HMcGZ
         I9/nxjrDAENRUwjMstxUtn+15mdPqoVkLvQc20rrL9Dqs19RfpNsrtZ12DdbP+ra01hs
         Cc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ET5z40dQD2YHR1iJG1YFrmr81KMXLv4iieQ3juv8wlo=;
        b=AXBTWf9OP24ciVKjd8jNCM7xw6Jt9RiH0CIklhBfj/62e8aUgtzYENxdJV3HNg+d36
         DvknEKiA3GCV/KpVawDJ84ytvZ0FMCESfShmvICMxOLT8dgehsHiFhRMEhgslFUnEjy8
         S7DGW3KGEcODPQTp8MP0Vs3grbPciXzutrrDR3y/YI4doLqSOOvCn813l4Hr1hfeloBz
         0pKglqbbBIIb5yvrVkW5ZmLanXdPdwZ2jJblSeQ0aXavdP+g4ap0tTiqQ/J3JHkqKmz2
         s05mSSQo21EgYEX3RxdN1ZRMdroNK6oCPlmwn6gRVb2VGqYGe56A9D6XpAKQfQR9ZJ1Z
         TJeQ==
X-Gm-Message-State: AOAM533lEW6e7EJXFsZ2zuvGx8AD6II+VO+EfrxQCYrcqdfRbDccQvWq
	s7832GKvxVKV4X0KXWIBd2M=
X-Google-Smtp-Source: ABdhPJwN9QPlHjqajC6oicx20hKhdTcM9Lx0NTSduvDhkcz4JgpMPWrFqIi/o1QflhAhGJEd+cXg8A==
X-Received: by 2002:a4a:d108:: with SMTP id k8mr6464565oor.76.1618652922936;
        Sat, 17 Apr 2021 02:48:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:724f:: with SMTP id a15ls394196otk.4.gmail; Sat, 17 Apr
 2021 02:48:42 -0700 (PDT)
X-Received: by 2002:a9d:75c4:: with SMTP id c4mr5193231otl.311.1618652922438;
        Sat, 17 Apr 2021 02:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618652922; cv=none;
        d=google.com; s=arc-20160816;
        b=OdL7MGZzGO/RFSSTMbQYaeUC3GzOWEOjbw6fRX3aoDHhNIZGhrezv4AMQajKI9S+4u
         t6rN7OekczsWYoKwdL1y9xB5thRjgKzy+EyKgec3Kz1Pu1KZYEhzZARdTbw/sQUmnl4F
         rFGR1/rHl25DVdyeZ6C8pZEFDnto9uKv4zMArAP3fwRyAyS6egpWMNka18I8oO/VlT1d
         NJCn6odbQ7gsFFl6F5UquIHsn8Tom8WQvDaBAsQD6OkC14n6P/SatpaiJ6Y/NALLoYvN
         MBknkj5dPbRmCngmPUmQZ/U7nO/5IrvYPVfRSL07s4nnExU3LyziSpMGmO8jBLg789Jn
         xg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=rP5Y4RXvyAVnZEJz0o30cMwz+cd7ImzsBo0vCrhPuJ8=;
        b=x8b3XIjzYlMNMlmFJUfQNQxWko25vgUh7U7Y04QczSZd5vfZbR1R+mRGxbt/FOeJLH
         CEJ7MO32Qx+KnWn+F7saeoj/xeHwrcYQ5Wv9yDP24nCGpIfgz/RCbNSgpOMqRXvBO30L
         G6HjZNVSnxnS/FV6vxoPuYdOX82LMpWGivqJIAIc7ihT/t65f57jK2DbS/DphltrzRWx
         17aH+kB0ef8buFpBZST0goofSXIqH5qMfRKp8ZWrl9h+GaXkXsSYdNjjIryOPMi4DCXc
         uCT8w/u7bMFDqSfkXnBzdCH8Naqv7cC5P8QSPzXSg6ktA/7C6yIX1oF2tqTGq/iXvCF5
         /bIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=lRDlpkca;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id b16si173332oib.1.2021.04.17.02.48.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Apr 2021 02:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Received: from github.com (hubbernetes-node-adfa2fb.ac4-iad.github.net [10.52.207.30])
	by smtp.github.com (Postfix) with ESMTPA id F2318520057
	for <jailhouse-dev@googlegroups.com>; Sat, 17 Apr 2021 02:48:41 -0700 (PDT)
Date: Sat, 17 Apr 2021 02:48:41 -0700
From: "'chacon01' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/ee0e5c-87aa37@github.com>
Subject: [siemens/jailhouse] 623476: configs: arm64: rpi4: Move RAM
 reservation down by...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=lRDlpkca;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: chacon01 <noreply@github.com>
Reply-To: chacon01 <noreply@github.com>
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 6234762737513985d5de14d860773ca3257f858c
      https://github.com/siemens/jailhouse/commit/6234762737513985d5de14d860773ca3257f858c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    M configs/arm64/dts/inmate-rpi4.dts
    M configs/arm64/rpi4-inmate-demo.c
    M configs/arm64/rpi4-linux-demo.c
    M configs/arm64/rpi4.c

  Log Message:
  -----------
  configs: arm64: rpi4: Move RAM reservation down by 256 MB

This is needed in order to switch to upstream 5.10 kernel. It refuses to
reserve the formerly used region, apparently due to conflicts with
pre-existing reservations.

Beside adjusting the cell configs, we also need to update the inmate DT
because it now has an overlap with the physical inmate RAM.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9850d614a2fd97c902dadef4d20217e17ace24dc
      https://github.com/siemens/jailhouse/commit/9850d614a2fd97c902dadef4d20217e17ace24dc
  Author: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    A configs/arm64/ls1028a-rdb-inmate-demo.c
    A configs/arm64/ls1028a-rdb-linux-demo.c
    A configs/arm64/ls1028a-rdb.c

  Log Message:
  -----------
  configs: arm64: Add support for NXP LS1028ARDB platform

Add root cell, inmate cell and Linux demo cell configuration files for NXP
LS1028ARDB platform.

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d8076d8bce49842558cad154b43f6f5c59192bc4
      https://github.com/siemens/jailhouse/commit/d8076d8bce49842558cad154b43f6f5c59192bc4
  Author: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    A configs/arm64/dts/inmate-ls1028a-rdb.dts

  Log Message:
  -----------
  configs: arm64: Add Linux inmate DTS demo for NXP LS1028ARDB platform

Add device tree demo for Linux inmate running on NXP LS1028ARDB platform

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ecd3cf0ae00e3dc3e122b730f53752180df9393b
      https://github.com/siemens/jailhouse/commit/ecd3cf0ae00e3dc3e122b730f53752180df9393b
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    M configs/arm64/dts/inmate-imx8mm-evk.dts
    M configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
    M configs/arm64/dts/inmate-imx8mp-evk.dts
    M configs/arm64/dts/inmate-imx8mq-evk.dts

  Log Message:
  -----------
  arm64: dts: imx8m: add pmu node

Adding pmu node supports to use perf tool to monitor the CPU performance
of the inmate cell when enabling Jailhouse and running dual Linux OS.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d22033b6367bedcc2890260fc23be3d5934df95b
      https://github.com/siemens/jailhouse/commit/d22033b6367bedcc2890260fc23be3d5934df95b
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M hypervisor/arch/arm-common/uart-imx.c
    M inmates/lib/arm-common/uart-imx.c

  Log Message:
  -----------
  Check UART UCR1_UARTEN bit before writing data

There is frequent start/shutdown operation in kernel reboot process.
And at the end of kernel reboot, kernel will switch to use console
output,saying imx_console_write on i.MX8MM.

imx_console_write will save/restore uart configuration.
However before imx_console_write the UCR1_UARTEN already set to 0.
when restore, it is also 0. Then when we runs into jailhouse
disable, jailhouse write to uart will trigger hardware exceptions.

So let's add a check.

However to hypervisor itself, there is still risk that
kernel disable uart, whenh jailhouse is going to write
data registers even with this patch applied.

There is no good way to avoid such contention,
the best way to avoid such issue is that
use a different uart from Linux or remove
`.type = JAILHOUSE_CON_TYPE_IMX,` from configs/arm64/imx8mm.c.

Remove `.type = JAILHOUSE_CON_TYPE_IMX,` means
jailhouse hypervisor will not output to uart, but you still
could see jailhouse log by `cat /dev/jailhouse`

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8a82d38ee12c3ab64b0cc95bee35a74ac9bdd391
      https://github.com/siemens/jailhouse/commit/8a82d38ee12c3ab64b0cc95bee35a74ac9bdd391
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v3.c
    M hypervisor/arch/arm-common/include/asm/control.h

  Log Message:
  -----------
  arm: gic-v3: not overwrite interrupt settings needed by EL2

SGI_INJECT, SGI_EVENT, and maint interrupt are needed by Jailhouse and
must not be controlled by the inmate. E.g., we allowed the inmate to
disabled those interrupts, stalling Jailhouse on management operations.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1423b55d303d0f27b97b0ee223a451c3e50cda91
      https://github.com/siemens/jailhouse/commit/1423b55d303d0f27b97b0ee223a451c3e50cda91
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M configs/arm64/imx8mp-linux-demo.c
    M configs/arm64/imx8mp.c

  Log Message:
  -----------
  imx8mp: support virtio console/block

Support virtio console/block, the reserved memory
has already been reserved in linux dts, we reserved 2MB when
initially support ivshmem which 1MB is not used at that time,
but now the left 1MB is well fit for virtio console/block.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b8f4aebd7ae665dc8011dc7070e8f978acb0de55
      https://github.com/siemens/jailhouse/commit/b8f4aebd7ae665dc8011dc7070e8f978acb0de55
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M configs/arm64/imx8mm-linux-demo.c
    M configs/arm64/imx8mm.c
    M configs/arm64/imx8mp-inmate-demo.c
    M configs/arm64/imx8mp-linux-demo.c
    M configs/arm64/imx8mp.c
    M configs/arm64/imx8mq-linux-demo.c
    M configs/arm64/imx8mq.c

  Log Message:
  -----------
  arm64: imx8m: correct pci domain

After linux moved to use linux,pci-domain, we update to
correct pci domain here to use a domain not used by pci hardware.

i.MX8MQ: 2
i.MX8MM: 1
i.MX8MN: 0
i.MX8MP: 2

Working with NXP vendor tree is 5.10.
Upstream tree only has i.MX8MQ pcie, since 5.11.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 87aa37d4236dedd81c1c9219ef3f5e6713d42d52
      https://github.com/siemens/jailhouse/commit/87aa37d4236dedd81c1c9219ef3f5e6713d42d52
  Author: Chase Conklin <chase.conklin@arm.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M hypervisor/paging.c

  Log Message:
  -----------
  core: avoid overflow in paging_destroy

It is possible for the ending address in paging_destroy to overflow to
exactly 0. For example, in a build with 32-bit addresses, a request to
unmap 512MB at 0xe0000000 will result in an overflow (0xe0000000 +
0x20000000 = 0x100000000 which exceeds 32 bits).

This overflow can be avoided by comparing the last address in the
region to be unmapped rather than the first address to not be
unmapped.

Fixes: 7cffb9b7d54d ("core: fix hugepage splitting in paging_destroy")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
[Jan: tweak comment to address also size == 0 case]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/ee0e5c42c9ba...87aa37d4236d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/ee0e5c-87aa37%40github.com.
