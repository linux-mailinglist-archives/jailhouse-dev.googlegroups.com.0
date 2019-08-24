Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB6U6QXVQKGQEPLA5QJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B49BE51
	for <lists+jailhouse-dev@lfdr.de>; Sat, 24 Aug 2019 16:53:48 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id x11sf12863641qtm.11
        for <lists+jailhouse-dev@lfdr.de>; Sat, 24 Aug 2019 07:53:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566658427; cv=pass;
        d=google.com; s=arc-20160816;
        b=szXSrW1PB475xMFLujmba7m9dKx8p3WzYEh7bvq2QPUqM7adPykJbDPc8LVE+kNuVO
         aI4eiXnzAPwWRSlqx/g5SxGfnTclbCAAAdPCZYTHig8uwQvvCi8nxsGE9XOXG6oor0VK
         RT8iKUZLETW8eS/4VbKdZz/uiKY2RoupTldSLynx9h6/8FDcHRADf5F6fMLijKrrOtXv
         J8J8GQsdTYUOhLODKYS9jSy1F2x6+7ket+LESO4vXfF7NfopPE5HA8DCdwUNrlFJz23N
         bFSkzJxwRhY+vjwokeW5F0+X3x3reJqnOSuI3mle749i98Ksq3fJCZPkKZ+4rXkI4FHB
         7pNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Lfb28o7zKH9h4C73QvPf87vybi6sAzXEqKBswV7d0nA=;
        b=ZiDbulVEXOv1b+Gs4b0CBA/c3hkjZFsjzDbuJH7x1EVBe4/84H6dQ7GXUjcIeDs+et
         3ne4vEDO+9P5H9cGVzVjr9Ly8caoRDKU7JQQBvO2dIC0QRzfaGo1oVM+rQ3RVf8Vn/2f
         X52WRnsyh+C54BrG0hwGwhE0Rpeu4nX7egZqItc8Ev2v76WfLRcVS/lj2RpBfSqVKBS6
         Zlp2fx90nfbs8OXMzvw9DqURBnLpinH7YA/s5r4MsiFapsOPzGuISQJ3sbxz6cJOIL+F
         i78ZASp8HyIWgb3gwEY4z5ILBC89Qhpz1XZaStbER9RtQhh4W4u007ZD5bkcbjnTYYee
         Vu/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=C13n1KmY;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Lfb28o7zKH9h4C73QvPf87vybi6sAzXEqKBswV7d0nA=;
        b=e7WNg1GDu3NPBOX7z7I3m1vseaATc4+6MWDHDUlR9+vYnfO7E6M8Wlz3JypsG5GZrQ
         y3eSs9rvPriuz9EcKZZLJyN/wA/IZ51nTZbDFUnBepx2VsdPhwi4raXqLtedIWLIy1Ij
         PtljuTxXbWxbl80NsO4ZhtqNUM7dTm5dblTjqG3J9Sy/EMaThxdQcT5/c9p7zau/wPrx
         obROJXiZZSfFX+isxkiegXtH52aF/HemERJR0OJKk6lV69lHXZ8T/k3ZndqfotLE6qks
         8kLBfgEvClFDkzP3z3W2y0CoxnqvifGs8p4vAFZpJv750irfFYV4Sc3cU36ebZLZzOeU
         rzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Lfb28o7zKH9h4C73QvPf87vybi6sAzXEqKBswV7d0nA=;
        b=mf3nqDaZv+Je8Ae+DUC5vGmCp7+9QqBxslLt8++hc5FuhrEULfi/gK8ZR3aZ9bQx9w
         k/jrzEK+KW1A5voAUzg3S1+90xx1Pr3wIQVnRsaENkhJvL+aHFtDzWNLo1dP2tSCQDJz
         U2111NZNH1dBIy+bLzgOLFV/4fWgl5DlCzEcvteuGJHrN0Ozw9uN4TOWsOWS55coRDVK
         I/Nf865cnUsjQWsLXLhsvwYI8kUtVf1Ewop8MCfj2gsNuzC15KolcZGWsiYf/mKyWHEF
         NzTTJzNZCYevDBNydwmxcvT78nf2d2Q6d26XAnrZmrkC7EbPbJYHk4lkipkBm5/xjhrb
         zIxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU+NhXfHRwZsGhN9jhlG/GO+c83tsDJ/Wl9eDiex+TPQ6Jv1duZ
	02Owfwc1jQK48ZwUaiIey70=
X-Google-Smtp-Source: APXvYqw541gI0JRWcyYql7VKfSC+xKw6lOoXLJt1TBujz95pEI3NWk5ETMIHRdAvHFX8Na9WaDQF5g==
X-Received: by 2002:a37:5f87:: with SMTP id t129mr9169966qkb.183.1566658427127;
        Sat, 24 Aug 2019 07:53:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:15f6:: with SMTP id p22ls4361963qkm.8.gmail; Sat,
 24 Aug 2019 07:53:46 -0700 (PDT)
X-Received: by 2002:a37:4e13:: with SMTP id c19mr9221262qkb.370.1566658426592;
        Sat, 24 Aug 2019 07:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566658426; cv=none;
        d=google.com; s=arc-20160816;
        b=gILmDZQf4FYUZwVFIywbk1LQi5+1ySmMcDgqv1VSfGdt3MlXl8mizgk8ORMoJ+uBD2
         Q3kWCn3WjlXDN7wZtkDP4Gq3dM+XsE7JOxC/kqu0e39RHIK00whLAbEEHOKFrT1Qy9R+
         IDt5ekHUOvA5Hs/8CPzky/rcNAl/vRnTN8F1EWRha5oyEu2/qByPX4DLXxNWuMytF3W0
         RyzW3GwSsf30HfkCcSnF0xSfXLYtZVtp/BRqY429i2AG7C2OhtFF2TcxpNaG/fK4wmtC
         /gWoqloZIgHTwBsXCqZNRtQ7qfFBHzOtBkSiD8X6RbqjEgZ2m+iQOxdJDZ3d0ojJtUCc
         J3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=nTVhiekSJmOpfTcd9L/qxdaZDL2cu35GgaGQKtWue3w=;
        b=NCdXd2T98NIWVe5z2Ygs6E8nTr0hp9Ac0hEHo4Nfgf8jywWnPQLlPKvAeKOxTop8Ih
         7+ruPA7tSY3gTEZa5JYzIiM7QmotzJs1FsmLxfFSn6WokOTLDT3nNtjQRg7H8A9/CO0V
         eLyhCIVhecLDVPx4canlC0b5+IpoqTtQn164Twrq8FNVorrqBdIexBvO9vB18l7TuUnV
         ythNtSAT+OP1wpb2XWP89d5/FlX6UJaS0rL/s1dbZPV6kN4VWSviyVH3ObrVAc51Gdam
         EO07kcN3qkbUQh8PyQa3vVw1I9MHEVVb8ja7p91XTQO6z20wflni8Vq3+887vWnaXoqn
         5C2w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=C13n1KmY;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id v19si176999qth.1.2019.08.24.07.53.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Aug 2019 07:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Date: Sat, 24 Aug 2019 07:53:45 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/4e9071-8e77d6@github.com>
Subject: [siemens/jailhouse] 52a995: arm-common: Introduce iommu functionality
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=C13n1KmY;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 52a995b2b19b028ad3a13df48e345f58f49648d2
      https://github.com/siemens/jailhouse/commit/52a995b2b19b028ad3a13df48e345f58f49648d2
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-08-24 (Sat, 24 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm-common/Kbuild
    M hypervisor/arch/arm-common/control.c
    A hypervisor/arch/arm-common/include/asm/iommu.h
    A hypervisor/arch/arm-common/iommu.c
    M hypervisor/arch/arm-common/mmu_cell.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm-common: Introduce iommu functionality

Add the iommu hooks for ARM and ARM64 architectures with
dummy implementations and update the Kbuild to include new iommu files

Introduce following hooks:
iommu_map_memory - Setup iommu mapping for the memory region
iommu_unmap_memory - Unmap the iommu mapping for the mem region
iommu_config_commit - Commit all the changes to the mem mapping

Call the map/unmap iommu functions in addition to CPU map/unmap and
config_commit.
Also add iommu_units in the platform data for ARM cells.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
[Jan: removed bogus jailhouse/config.h includes]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0f2d9d3c8cda68b1ba29b1812c485f15854fdf7d
      https://github.com/siemens/jailhouse/commit/0f2d9d3c8cda68b1ba29b1812c485f15854fdf7d
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-08-24 (Sat, 24 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/iommu.h
    M include/jailhouse/cell-config.h
    M tools/jailhouse-cell-linux
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  core: Add stream id list in the cell config

When ARM IOMMU drivers are supported, it will setup the IO address
translation tables unique for each DMA context in the system.

A typical DMA context is identified by an integer called stream id.
To setup the correct IOMMU mapping, hypervisor should know
list of all the streamIDs that should be setup in the IOMMU.

Add an array of stream IDs in the cell config, bump up the config revision.
Change the python struct unpacking logic in the tools to reflect
revised config structure.

While at it, tell struct.calcsize to not use padding for size calculation.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[p-yadav1@ti.com: Make the stream_ids array resizeable]
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e194da32533d99e8bf4cad860b562d57f91a239d
      https://github.com/siemens/jailhouse/commit/e194da32533d99e8bf4cad860b562d57f91a239d
  Author: Lokesh Vutla' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-08-24 (Sat, 24 Aug 2019)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm64: iommu: smmu-v3: Add support for smmu v3 configuration from config files

Add SMMU v3 type to jailhouse_iommu_type.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 458f7d0a6bdf3fc66e94fe09ff5fb2ab3e2c6c5f
      https://github.com/siemens/jailhouse/commit/458f7d0a6bdf3fc66e94fe09ff5fb2ab3e2c6c5f
  Author: Pratyush Yadav <p-yadav1@ti.com>
  Date:   2019-08-24 (Sat, 24 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm64/Kbuild
    A hypervisor/arch/arm64/smmu-v3.c

  Log Message:
  -----------
  arm64: iommu: smmu-v3: Add data structure initialization and stage 2 for SMMUv3

A System Memory Management Unit(SMMU) performs a task analogous to a
CPU's MMU, translating addresses for device requests from system I/O
devices before the requests are passed into the system interconnect.

Implement a driver for SMMU v3 that maps and unmaps memory for specified
stream ids.

The guest cells are assigned stream IDs in their configs and only those
assigned stream IDs can be used by the cells. There is no checking in
place to make sure two cells do not use the same stream IDs. This must
be taken care of when creating the cell configs.

This driver is implemented based on the following assumptions:
- Running on a Little endian 64 bit core compatible with ARM v8
  architecture.
- SMMU supporting only AARCH64 mode.
- SMMU AARCH 64 stage 2 translation configurations are compatible with
  ARMv8 VMSA. So re-using the translation tables of CPU for SMMU.

This driver is loosely based on the Linux kernel SMMU v3 driver.

Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
[Jan: dropped comments about SMMU emulation - not present here,
      added iommu_count_units() check to arm_smmuv3_cell_exit]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8e77d610dd4869223a5209c11e4314c2e1d4d334
      https://github.com/siemens/jailhouse/commit/8e77d610dd4869223a5209c11e4314c2e1d4d334
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-24 (Sat, 24 Aug 2019)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Fix backward compatibility of lapic_timer_period symbol

It was not enough to only rename lapic_timer_period back to
lapic_timer_frequency for older kernels. First, our macro
RESOLVE_EXTERNAL_SYMBOL was not prepared to be provided a macro as well
and was still using the untranslated 5.3-name. And if we do not want to
break up that macro, we need to map lapic_timer_period_sym as well.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Fixes: e7674ea7425f ("driver: Account for renaming of lapic_timer_frequency in 5.3")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/4e90716335a8...8e77d610dd48

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/4e9071-8e77d6%40github.com.
