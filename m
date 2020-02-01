Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBKEK2XYQKGQEZBFGRGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x939.google.com (mail-ua1-x939.google.com [IPv6:2607:f8b0:4864:20::939])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BADA14F75D
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 Feb 2020 10:30:18 +0100 (CET)
Received: by mail-ua1-x939.google.com with SMTP id t26sf2641661ual.17
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 Feb 2020 01:30:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580549417; cv=pass;
        d=google.com; s=arc-20160816;
        b=RcZ1mCBrw8lXgQMCYXAtjSLcjto79iYzoUeWjAZ0Rf4y66te8E/tn1FV6V5uy/jqPZ
         lacWNeN6T+lALNWRetQlW9FFRgpra0jPv5DqkQK7vPVk1YwlQUmTNsO8DdScn55rVwMq
         S7u4BGeU/QOP1yrB8ggJnPeYt7ZB8eoYWH+LaGJCT/vwt3Bvee4sZzoWBvIAIgXA9bmn
         VS/8p+FAPV5gb00ktTMZQCucoaGwfkkSiXzmdCWMQ3wCCGZ2//Fhtgj/ESgdn4Yahzgh
         lu7dK+6eaPceCFURDU1iBbnoz0K8NznLs2Qo+qis3BMka6kQ3QwXxi0FkFeoz3E3qp97
         ltwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=c+VRbKMPViX2ezLjhOYUNdML9lLNjxxTLYmnDHEJkWA=;
        b=Q1BOfeRmvXE5iyjg/losqiybqpFITHa8BTp/LlzBLY+liCFgwr1KhBBU5Qnytz19sV
         zOSnttz3xdMPkzCmKrLlcX8lPPxpVwAiMVMV3tRcfKiejgvpnsSw3YgV844nXNgQ91yP
         CIDSywuQ4ENhSvVLM20ALDqWjScMQNLs2txGy2T49wYCy9EMxgdJc7ESdjVTH+tbIHI3
         k15f3N1Jf1/g7Qi3A46wrnzSGprTu3IwkcdN7omThWt1XaoasLlI+kr6ZaGdsmNSDxOy
         AMCobv+IOOxR4iCH7mB4uxcBy+1UutnGu7F8ArYEgiTYJJK8Y3eEu/o5NOakcVk98Jc9
         zFvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NjdQPUCZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=c+VRbKMPViX2ezLjhOYUNdML9lLNjxxTLYmnDHEJkWA=;
        b=Bfi5KfCFopL4C5VvMIEDoFTiwvxiCo9pZVytlP1FF4XfgeLebRozTnIZFQv0e4t6DU
         iw+rF7/oWFM99PvtkIbAD7gMNFFehdiPyt+PDU1YIiyJqvAdEmtTdQyrhQGxFDNpY7xr
         XVjL0kxWnN3mIz+6Gx7TqU8fUp7UUAEe0+SPkP4OafTP8l9UJ26gzXZ5N8cOuJOuLZq5
         LpxQBced5tWtS7lducZc3Bpgpk4cn7rmtfthPJOSJJ/Bue+VQBCV0n2kW1gvX+InqWTz
         qZfEiQYl62c3x3v+jHLGkIGiBwFF4tvcPisSVA0MI6jYwVKl/imPrN+L2sQW3qETF/oJ
         jQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=c+VRbKMPViX2ezLjhOYUNdML9lLNjxxTLYmnDHEJkWA=;
        b=eMbz7WjjUDOS6KVdSu7PnAyA/H6gH/1a+34p6I4Yjcp/PzErneNW/qhvatma9zT2ew
         GwdtxOIviEhu5u7wuAwOhq14TNxF+dFtBOJdDyPr6y79cDWYHKvv5nDWie4GgYo5NpHv
         tndIJxvGRwSdYa6pS25oeGswOS1ovEXpb9EuxvKsB94gZgSIg6Y7vCk0vydaWWzolO5n
         i4h6qi9hLK8bfIjYSR2JjdanBIlxYms3jIb+QgbK947BSM67wiZLkojIqxhsNyZ4RAAo
         jdDTF93HKJk8kUOzSqOCKPltx+IbRu6qUZC8xS95n59f1YJjAD/zUgYTOrFB2v/RxFZZ
         SI+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXYfV94CSFSiMt4dHr1q9PPRZ0aOjZUqt8HS7IZqd7Gr94IchoB
	NDeBqCedTEMndC/mv0QL68U=
X-Google-Smtp-Source: APXvYqxjUUGMPXxU7XwIVJozBvcqSVj33twgV00d7twB46E5K4RpV02Z7uFDwSATsuzCU8Jh3iyXXw==
X-Received: by 2002:ac5:c64c:: with SMTP id j12mr9228920vkl.11.1580549417288;
        Sat, 01 Feb 2020 01:30:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:f288:: with SMTP id q130ls513541vkh.11.gmail; Sat, 01
 Feb 2020 01:30:16 -0800 (PST)
X-Received: by 2002:a1f:7c0c:: with SMTP id x12mr8731655vkc.41.1580549416498;
        Sat, 01 Feb 2020 01:30:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580549416; cv=none;
        d=google.com; s=arc-20160816;
        b=iCa33pTctLwTGB67O3kZNRin+K6t5mZwBkxbDqL/8JY5KDaJF4XykXTSSYZTYoulQL
         kQ+XVSs0wYn1AEs/TXvZ5rGXXkVYCFqEMm/FCZsdcyYslHaEAg9SAk9ayx4CimUCxOie
         jJI14n3Lu09Qb2TgtluX3QNLpBFD5aoU7uItEpwxvM+akR36tc3Zgz13uzlwdJZZLlxW
         +ftJw7TpgBrkGlYfqSaVl/gzLeTCya+8T3iiz9uyjRpTa5kyNTrBHpA8L5tlZUYbJOAl
         9Cw7zAKapFkcbzCAGLj62Lmc8IW8JSqnpPQRfGAWMFau/OXHBwbgWtUvL9fpTgOH6Bf9
         fWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=5Kuw3x58n4SeLKQZ//QWlx9u2r0HriK8bRWlNMAnEOg=;
        b=PxLNc0+CJJJbjDUPCrt27Tm1RKMeALa98a3C/Dvrve266fg30MblEVUZSO9EWEJGFF
         zV6O2dYKiOptI2OnrbAj2tn42dhb/c9j39enotmrkeK2i6L2V1V9E51A1VZfue1pV7Kj
         A1B4BMzWV2F1huvBPn1RiLyksnXgZAKAB/YTswX02Px7xtnwxpWffrH9Mk4KJ1dvQ9OU
         v2+nbU0oKgCcZx5O/37QCxJLqH/l4uTsj47lLl+g3Q+fEVexEclVLVKIzuAAp74qdl5s
         XVeGfTMFl1UEkil4HvhkTw5L9+7uLo/QM4CD2vmfUKxbV7xBpO8Y7D9fFRXwoI4eyeK2
         +gIw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NjdQPUCZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-13.smtp.github.com (out-13.smtp.github.com. [192.30.254.196])
        by gmr-mx.google.com with ESMTPS id o19si629303vka.4.2020.02.01.01.30.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Feb 2020 01:30:16 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) client-ip=192.30.254.196;
Date: Sat, 01 Feb 2020 01:30:15 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/c4024b-213747@github.com>
Subject: [siemens/jailhouse] a6d8de: core: paging: Refactor
 paging_create/destroy param...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=NjdQPUCZ;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.196 as
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
  Commit: a6d8decf371dc5560a335ab9c03781e3f2387dcc
      https://github.com/siemens/jailhouse/commit/a6d8decf371dc5560a335ab9c03781e3f2387dcc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-21 (Tue, 21 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/x86/svm.c
    M hypervisor/arch/x86/vmx.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/paging.h
    M hypervisor/paging.c

  Log Message:
  -----------
  core: paging: Refactor paging_create/destroy parameters

Change the coherent enum into paging_flags in order to allow adding more
in the future. Rename the flags parameter to access_flags for better
differentiation.

Use this chance to align the names and types of local vars that are
forwarded to access_flags with that parameter.

No behavioral changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b310eaa9c02509a04ad2db0808bd66d7884747ca
      https://github.com/siemens/jailhouse/commit/b310eaa9c02509a04ad2db0808bd66d7884747ca
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/arm-common/setup.c
    M hypervisor/arch/arm/mmu_hyp.c
    M hypervisor/arch/arm64/setup.c
    M hypervisor/arch/x86/svm.c
    M hypervisor/arch/x86/vcpu.c
    M hypervisor/arch/x86/vmx.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/paging.h
    M hypervisor/ivshmem.c
    M hypervisor/mmio.c
    M hypervisor/paging.c
    M hypervisor/setup.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core: Introduce JAILHOUSE_MEM_NO_HUGEPAGES memory region flag

This allows to mitigate CVE-2018-12207: On affected Intel machines, a
guest can trigger an unrecoverable machine check exception when running
a certain code pattern on an executable huge page. The suggested
mitigation pattern of Intel involves on-demand break-up of huge pages
when the guest tries to execute on them and also consolidating them into
non-executable huge pages dynamically. This pattern is not compatible
with the static and deterministic behavior of Jailhouse.

Therefore, this introduces a memory region flag to exclude huge page
mappings for a region. System configurators can use this flag for
executable regions on affected CPUs, while still allowing huge pages for
non-executable regions.

PAGING_HUGE/NO_HUGE is consistently applied to all caller of
paging_create, using NO_HUGE in case only a size known to be smaller
than a huge page is requested.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2f21dba72fdb3fd430c10cc8befa82c9a4a01efe
      https://github.com/siemens/jailhouse/commit/2f21dba72fdb3fd430c10cc8befa82c9a4a01efe
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M include/jailhouse/hypercall.h

  Log Message:
  -----------
  core: Tune comm region's flags field definition and documentation

This field is static, thus volatile is not appropriate. Rephrase the
field and flags documentation for a clearer wording.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 859c6fa5f6454d5f3a58df9a6fc82dee21829fdf
      https://github.com/siemens/jailhouse/commit/859c6fa5f6454d5f3a58df9a6fc82dee21829fdf
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M include/arch/arm-common/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  arm/arm64: Pad comm region to natural alignment

Better pad than rely on both sides using the same compiler logic.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4381dda62383cd32f23b1b7a053483ae1d333535
      https://github.com/siemens/jailhouse/commit/4381dda62383cd32f23b1b7a053483ae1d333535
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M include/arch/arm/asm/jailhouse_hypercall.h
    M include/arch/arm64/asm/jailhouse_hypercall.h
    M include/arch/x86/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  core: Mark jailhouse_comm_region as packed

Ensure that we do not deviate in alignments, even if the currently
achieved natural one should once be violated.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f9ac6fa0c3bb207b0fcc1c328bd9e22eced9acfe
      https://github.com/siemens/jailhouse/commit/f9ac6fa0c3bb207b0fcc1c328bd9e22eced9acfe
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M Documentation/hypervisor-interfaces.txt

  Log Message:
  -----------
  Documentation: Update hypervisor interfaces specification

Lots of things changed since the file was last touched. Add the
hypercall ABIs for non-Intel-x86, update the "CPU Get Info" hypercall
with new statistic types, and extend the Comm Region description with
the console and non-x86 extensions added meanwhile.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Reviewed-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>


  Commit: 77a41ea5a2cddf814985961c3cde6a064ccd34e4
      https://github.com/siemens/jailhouse/commit/77a41ea5a2cddf814985961c3cde6a064ccd34e4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M TODO.md

  Log Message:
  -----------
  TODO: Update

Add an entry about VT-d modernization, refine the SMMU to-do now that v3
is available, and drop big-endian - not relevant on ARM in the
foreseeable future.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8c51dd45ad98f71e693d98b89dd85e45ab10c069
      https://github.com/siemens/jailhouse/commit/8c51dd45ad98f71e693d98b89dd85e45ab10c069
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M include/arch/arm-common/asm/jailhouse_hypercall.h
    M include/arch/arm/asm/jailhouse_hypercall.h
    M include/arch/arm64/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  arm/arm64: Factor out more common parts of jailhouse_hypercall.h

JAILHOUSE_HVC_CODE is the same, most of the JAILHOUSE_CPU_STAT_VMEXITS_*
are, and when we move struct jailhouse_comm_region, we can save
COMM_REGION_COMMON_PLATFORM_INFO.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3814e3a977987a782db3e9a152dcb707e3c82e33
      https://github.com/siemens/jailhouse/commit/3814e3a977987a782db3e9a152dcb707e3c82e33
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-29 (Wed, 29 Jan 2020)

  Changed paths:
    M configs/arm64/jetson-tx1.c
    M configs/arm64/jetson-tx2.c

  Log Message:
  -----------
  configs: arm64: Remove vmalloc from command line hint

Not needed on arm64 because it starts Jailhouse differently compared to
arm (tk1).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2137473830c3788f3fbca9f1e782b2dcd7c358d5
      https://github.com/siemens/jailhouse/commit/2137473830c3788f3fbca9f1e782b2dcd7c358d5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-30 (Thu, 30 Jan 2020)

  Changed paths:
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: arm64: Fix comments in qemu-arm64

The device tree remark was copy&pasted, we use mem= for QEMU.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/c4024b68d0d1...2137473830c3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/c4024b-213747%40github.com.
