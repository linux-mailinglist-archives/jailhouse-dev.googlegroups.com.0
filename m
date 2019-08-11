Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWU4YHVAKGQE6NWLFZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3b.google.com (mail-yw1-xc3b.google.com [IPv6:2607:f8b0:4864:20::c3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F4892CE
	for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Aug 2019 19:20:28 +0200 (CEST)
Received: by mail-yw1-xc3b.google.com with SMTP id l22sf1099874ywa.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Aug 2019 10:20:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565544027; cv=pass;
        d=google.com; s=arc-20160816;
        b=SThRd9micqBLOXQh8Ui3uolMOE9h/haXWlJCwsslghE36LgPhCnO9l7TLijMupfSdP
         SrO8SuxntOTIAAQ3ldgti/81enheVx2WkOxs0XngabpMxJJIkuh5ZOVFIED9W72yPpKT
         3GyzdPe0KiE6sg0zWi4KSVpjl16wXfggGli8mQ1hIkcVs0zTNIy0KDk+ZdG0SfcbUhUV
         kiLM10AtE80DdBYSpvZicqPT8K7nf4Kmr8cXBKqmMpD46mK64R0Xp/f0/Sk1IM+6nsi7
         lSvLgUQhLGgUCDZuJ6YVORlidwIR/rGvIgpStgqiD2cNI1vNUU5qgXNmff3PIEcZClC2
         WFdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=f7FEOZ+yrYbDIAXh7GWiQdKqWVr57tSAYiOcJUlL9FE=;
        b=lupY4qVKW0QQ0iQEnLd+oziV/8X+eJj8EFfDrcUJZ2FtnFPk0JSkJrMnPQJefQQycA
         rGOIze+LqHXV2X1S5SdZqs1VHzIqChmFAHFNuQs0Pse9Cf3lP6ihJzJ+vUXI1Spfl7SX
         UsEi7Ok7+mgg5o14TppepdhdfPSctebIooh7PNuNHljvwBgFryvB3VmZo63kGmVggTjg
         mrzGfFNJ7EN8SZIlYlNNlWxUKOtGPxRvWbs/bhqj2DRYYHOhrrU+deeorqW548Ry53X5
         HvCW1OQHNRWdXBAGAW+GWgBmFrvCKQ6UR8M/fE0rJPEjb5vMEb7vBz7rQdvSW8GCcZF3
         nPag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="s3Inm/Fc";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f7FEOZ+yrYbDIAXh7GWiQdKqWVr57tSAYiOcJUlL9FE=;
        b=rlF6Y3zGenRgSLno15/t9KFHyIV2bL/FaT/GyKNtzM9oI+OWJ67Q9Ud85YfRFtBn64
         TZ++gy9jgnmKentVQM5OwBAykP0xp8q4jAoe8EaYrNviznZhsQYwU+xkhAUPnUAvhrLv
         3jXv9IT1QOworciLaLCvuB/qRVPCqtwZyt3I1LuzPjqBLchv3Z7VXlHImu3Vyw/Hrflb
         N9wyWo2NgIXvjQrNziJ1uO9XRfzJcm/dN6eiciI2xdpigO5aRw4iYKLB5QqUiBwUb4AO
         tB5O7STcY8HLjr9h2jxvpXvc0x9CZvDR3erUdOP167tH1Dfe1dff+q+KQNIJmhL08mFV
         f+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f7FEOZ+yrYbDIAXh7GWiQdKqWVr57tSAYiOcJUlL9FE=;
        b=um5LMP/KrFuNmVk/7angMK9yni+Bdoc5jbc9Bn110sPTJtUuqH/uVuapl7WAW5uS/P
         2sCcRuwqy5bucbGCnwTJ1IX36UyDSAwix/tS/hb7nSZZPO6l8kuppmoxoZXgSK3IRm/8
         BQyzC1H8ubotH6wdkOB6Ev3l6sJ6FMksACkYK4hs5hL5bObYPEOOs/VLysmdQaSpw5QO
         ozAkTGmfmuDoEO5ysf23UxfPrVtZb5Px0v/BrxBXReeS9lQ1jFSjsz8caOkaIUxVrCqR
         oGYdHxRjkXjjLpqoqCrj/8cB9QhmCPBel6oLo3lr7FLcH1zWCJUfzhtrANGoNpz1mKMB
         zMTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW79oNNexGwEu+Lpp+oLMKCNXx/m8Kn13AsJ3e9Bhb4aetXszWu
	C9RKNn1ekeU9abZ7v4HE9Qc=
X-Google-Smtp-Source: APXvYqzZA4ZGC+x/AThxhB/8Jt60oCWM6R2WhazDwkyomUdOi5psYpmfBpu1KdB2ccEW+TWhd0z9QA==
X-Received: by 2002:a25:945:: with SMTP id u5mr1492242ybm.519.1565544027202;
        Sun, 11 Aug 2019 10:20:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:4f0a:: with SMTP id d10ls5655194ywb.13.gmail; Sun, 11
 Aug 2019 10:20:26 -0700 (PDT)
X-Received: by 2002:a81:6355:: with SMTP id x82mr22408505ywb.396.1565544026623;
        Sun, 11 Aug 2019 10:20:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565544026; cv=none;
        d=google.com; s=arc-20160816;
        b=0VhE/bp27goLfbN6Wx2FoaCa/a+ti6qf7xr7aWkmbVFms6HcJ+0WGR7wjTOYQp7QQh
         rl5uEeM82eRh6Y9Ee5pxCybxSFmUSMIEIspxemcmnopxZ1rKgXTmgJeJehnci016ms6l
         Ld4fdIe9onArLuK1VfqrfsxcXWJBvoYvC00QpA3/KzkKz6OoasDO/tucb/PXQZa9d+RT
         ZQXOt4n/+LY1v987rFnvez/7w40IOfa6LIExAVf8nqpaEM+uYSkfVWRPBlGhM1uamLwV
         nVu9YOrxWFPDNXVo+ojkBRCY0PGEWv62yQtP068Scf27VAaPBCOFDI5N7th7V5Gnp+7K
         RkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=drNFh+p9Y4RvKHdSWLXjozsRUEfQysnmqHKG3rs1pu0=;
        b=JmUTzeFV1lDgYq1N9gukGX7Yg+YgwZpSwMV7PFJGFIfU0WK9CiP6nJ+5BzkipmKYt/
         zfU5UxBxdORhWNVa2Zm9l1uwcyxiJlaep9P5GpdSMf1Vdz1ncl3MAZkQJJIbZhtZ+S/F
         7y5eLdDvjRB/3liBxWyzIsq7nx2P/wli0ye1LF6Lhj8HQyEilTuGbPmGgcpM/hux/NaZ
         3LmBBF01Yp3/ejkOFgbdlJWex6phDiMeqT5hZRO+Yq6XDuU2iPejdidVM0CLHdw4/XAY
         6FWNGQuwxJvdPo3Jw8A58aQXWjmp4arga0fFNwUHsJq1xMa1akn0uaPe+qYrL97GU02e
         xAeg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="s3Inm/Fc";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id x5si3730490ybn.2.2019.08.11.10.20.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Aug 2019 10:20:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Date: Sun, 11 Aug 2019 10:20:26 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/fe9dfb-73a5bb@github.com>
Subject: [siemens/jailhouse] 07baf3: iommu: x86: Generalize iommu definition
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="s3Inm/Fc";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 07baf39e3b66f1d92805e79b6a494365267b6636
      https://github.com/siemens/jailhouse/commit/07baf39e3b66f1d92805e79b6a494365267b6636
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-08-11 (Sun, 11 Aug 2019)

  Changed paths:
    M configs/x86/f2a88xm-hd3.c
    M configs/x86/qemu-x86.c
    M hypervisor/arch/x86/amd_iommu.c
    M hypervisor/arch/x86/vtd.c
    M include/jailhouse/cell-config.h
    M pyjailhouse/sysfs_parser.py
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  iommu: x86: Generalize iommu definition

Right now, jailhouse only supports iommu for x86.
Generalize the data structures to support iommus of different types

Assumption is that each jailhouse_system can define iommu
instances of different types. Extend the jailhouse_iommu
to add type info.

Update the x86 config files to reflect updated data the new type field.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD and VT-D]
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 75cd8130848bc924500ecd4ae22beeb1a9608d9b
      https://github.com/siemens/jailhouse/commit/75cd8130848bc924500ecd4ae22beeb1a9608d9b
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-08-11 (Sun, 11 Aug 2019)

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
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c783628eccd8a2f8fdb7c3bbb67b48aac1557bab
      https://github.com/siemens/jailhouse/commit/c783628eccd8a2f8fdb7c3bbb67b48aac1557bab
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-08-11 (Sun, 11 Aug 2019)

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


  Commit: 2ec0125890fd27cdd76b0b22630b63c5207282ce
      https://github.com/siemens/jailhouse/commit/2ec0125890fd27cdd76b0b22630b63c5207282ce
  Author: Lokesh Vutla' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-08-11 (Sun, 11 Aug 2019)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm64: iommu: smmu-v3: Add support for smmu v3 configuration from config files

Add SMMU v3 type to jailhouse_iommu_type.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 73a5bb938bf913740d62ce9e5e36b6ebb7bac37c
      https://github.com/siemens/jailhouse/commit/73a5bb938bf913740d62ce9e5e36b6ebb7bac37c
  Author: Pratyush Yadav <p-yadav1@ti.com>
  Date:   2019-08-11 (Sun, 11 Aug 2019)

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


Compare: https://github.com/siemens/jailhouse/compare/fe9dfbcc2cf3...73a5bb938bf9

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/fe9dfb-73a5bb%40github.com.
