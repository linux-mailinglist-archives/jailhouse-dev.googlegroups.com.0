Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCUW6DYAKGQEV4HWJVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13a.google.com (mail-il1-x13a.google.com [IPv6:2607:f8b0:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC19138BB6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 07:15:40 +0100 (CET)
Received: by mail-il1-x13a.google.com with SMTP id c5sf7198651ilo.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Jan 2020 22:15:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578896139; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZTgrOkj+W6PV9Hng9ZoHdF3ydQb3Vz1pqrZUn77HjMcE7nQX31O4azx5X6ggxAjuR2
         nOoRbnEZJGHz/YiQMW0GeO5yeId4q1ji7pXGSki2PEmPzHn2bdvO2+QxRp5fMkrmpLZ3
         ja952saUs5jXetEPeL3k7iA4aPUaXVnCel//DnT2EpVxt8JozFGbuZU/86cwf/wMPbpF
         Ma/bSdy4bAVHhplotnkA5QI+/9LVP+6kIWw7CM8szoIdQlJFbkU6tKmc7q6fZT0AI4oI
         h8DjCPaU1Cb49GRHBlj30GcCh6mbAhEOAecVwqnW8sAmDqMNWMH/npKO9vSpx1J3FR2Z
         wF9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=E+nCes9EzLTOIicOmsz07EZmluf9z/FEznpH5vglFgI=;
        b=la1bsBBFkv8ZJEu46voQVEAgUe6OZGdl9/14iC0xcFTFRtRey4NtmfjWoQHLglfMns
         Va0rR1+SK4D74OfjTzcYKGH027DRJVLogdIYiThXF8/qTSs3jr89oAPdHxfsa7XjG91F
         OrQmtMjRfPppngv7jfUSYQNiCxUK67nJ8HwvPeJF+5VF5RLjwhUNn8ERDNjqHtD8sfDj
         R7hZ11PHaxpJx/eoK1gl6V6mMyrtQAAQ6GMc+3hJYHQqf+k6yNAs4Xhz6UcDtwofgvan
         /nWob0ZH3KlM5+uIj7oHbvSktg7UuE05oTLm9wS+jrLL43JrZEappEowkR3uVBg8JNlh
         aR5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=qMVHHgHQ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E+nCes9EzLTOIicOmsz07EZmluf9z/FEznpH5vglFgI=;
        b=FRtCQESJ5kSYk5FM7KZTfU0LgHEe5biFk2aidSB+9vzN58yOIuWiREKQqSupt3NddL
         NubtSLIvfAhkkiN9XTDY6hsouvD/Y5MVrpItv0L3Cv6NL8LlC2hE/Wy/4mKtj0q+14GP
         yjMBXzs3wWe+cP5xMpOGqW92lXg6SG1UPRBlzOtGwROvY0loOeoM0UavAA/J7Z9a8KnM
         tDEXevuGpspJRbc1C1FINTgUplE6xzkvXx7QvKWKDgT2su5syeqyB99A+3BzT0jO1+AS
         aYh8RUlpBQ342F6yMe52BdAUWQ3dqPP/+j2H7g1rQyM3ggpsQsvZcE5x2CmWvcgmTc4W
         B/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=E+nCes9EzLTOIicOmsz07EZmluf9z/FEznpH5vglFgI=;
        b=Rkb4CariqTte2UTn1hCiIB+VfCu+LVd+BrS0OTRkXI890EwVNEQGZNwRfMPzniuScm
         7ag1nGkYpS8ZPnRlWeSFNgKgaAxVQyglAxSdKycUrvUg78PA2UPm2LdQQjHY+8kUCUIu
         ap0rJKRu8hN4oU21V0EajudbZBR9JJvl6K+chCTVu4zrkxcvFNm0HiRl2w6MGpNkru9W
         UbfF0eK3L4yQT5zu0ly6Dlr/f7310azOBkLGmmc1QgIP4Vl6cQhCArckmbrn81nsRDmY
         e16QS1Hk2D75TF2Ewz3GpyP50wsw9B/PYLU56XaqAAxXQa3Ofh/7n0UfBigz2HITIyUR
         15xQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXdaB0G3KKWMNsRIF6MsEL/pWhcXLXtrBfQvWPGhDUm4BPR5gmM
	CqY3G8hl3Cd8R+GJslCe7X8=
X-Google-Smtp-Source: APXvYqxLQeCXmDTjyp2x49sipkQxh4Y24ApPFvWuCh/PMCDQwtbmqqzLmzStReo2Q+K+zbKDeG0MrQ==
X-Received: by 2002:a92:981b:: with SMTP id l27mr13622744ili.118.1578896139049;
        Sun, 12 Jan 2020 22:15:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:5e84:: with SMTP id h126ls885423jab.5.gmail; Sun, 12 Jan
 2020 22:15:38 -0800 (PST)
X-Received: by 2002:a05:6638:a99:: with SMTP id 25mr13246594jas.37.1578896138498;
        Sun, 12 Jan 2020 22:15:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578896138; cv=none;
        d=google.com; s=arc-20160816;
        b=cA0VK6BqvR6zpbIBolfnGbe7NMNnp3ac0ZBJ+LNfnJh0fbOoJsgoo7mSqyboWHiiPc
         ef3kNcf/KE9CUC7lxPsYDCGPEB5hnFgEb6LcgOY3utJ6eswLV3GFYjqlCrJ8I8jsQOIL
         1rCICY4RzTTeo7mdc7likDXnABxmvnxN3K6pdzhn2ea8pga4d9R6oYch7Qn/PegmC9iE
         um3JOFGzlYzfPKorGSCuoTLPf+/tcsfRtN+tRhcF0Fgp5qrwr5ssaO0/drE4SqmmdEhs
         /Xsz6w9HxhgIyfzEWVvcOLpixCWr0EyMBr+gGlnHsaNYHaKM1Xmxv9e/dPUJg1cU4mjp
         88AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=PoNJKfjhgTlDnpRApyF9Y+G9XxaAyAx6WYOsf1+MUIU=;
        b=ZmvnZz8h3wBdxL912acWlJMpbN2mj4QETFvofpjhxIVUyWKY60UJ8KYqaf0xctt3zn
         RTiUqzft5rE/5srhKpINKBXJexx4iBPw/g6AMv4SoE7KnuckejNh3+e6ZKVBoUuN5/Fq
         QMsXbqXzYC8chFSfGagFYnVtxhedUoVelULyQpeIvEB60NL5Mm3WYPOqXYmNT8vzj3K9
         pUj/gSDKJ6PM/t2lzTonD/noY9kNC8kP+qmFtOYZMq9lobCqlCzsqSF9aNMlV+P+3lKL
         CW2K5dR8aBO4+2p/My98z78L1BFME4EYaslYtvWXXu9Su3fw2AA4KqDCiTol2DFy/lpI
         19cQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=qMVHHgHQ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id v82si430636ili.0.2020.01.12.22.15.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jan 2020 22:15:38 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Received: from github-lowworker-e8b54ca.ac4-iad.github.net (github-lowworker-e8b54ca.ac4-iad.github.net [10.52.23.39])
	by smtp.github.com (Postfix) with ESMTP id 04C05A09EC
	for <jailhouse-dev@googlegroups.com>; Sun, 12 Jan 2020 22:15:38 -0800 (PST)
Date: Sun, 12 Jan 2020 22:15:37 -0800
From: Nikhil Devshatwar <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/6a8ab1-89712d@github.com>
Subject: [siemens/jailhouse] 10b3d4: config: Remove unused
 JAILHOUSE_INVALID_STREAMID
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=qMVHHgHQ;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
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
  Commit: 10b3d473fb1e0938278b01ede8beb7bc881724a3
      https://github.com/siemens/jailhouse/commit/10b3d473fb1e0938278b01ede8beb7bc881724a3
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  config: Remove unused JAILHOUSE_INVALID_STREAMID

Stream IDs are now described as arrays.
We do not need the sentinel JAILHOUSE_INVALID_STREAMID.
Remove this unused define.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4205ef8698680aadc9ecca646f0d58a3dcf1b1ed
      https://github.com/siemens/jailhouse/commit/4205ef8698680aadc9ecca646f0d58a3dcf1b1ed
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu-v3.c

  Log Message:
  -----------
  arm64: smmu-v3: Fix crash in arm_smmuv3_cell_init

arm_smmuv3_cell_init and arm_smmuv3_cell_exit calls iterate over all
iommu_units to process the ones with SMMUV3 type.

After the loop, it unconditionally issues commands with first element
of smmu. This causes Unhandled HYP exception  while enabling jailhouse.
Also, it fails to issue commands on the subsequent SMMU units.

Fix this by issuing the sync command only if the iommu is SMMUV3 type.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 89712d8a4acefb59b319c50b13720d580abe77de
      https://github.com/siemens/jailhouse/commit/89712d8a4acefb59b319c50b13720d580abe77de
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-01-13 (Mon, 13 Jan 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: arm64: k3-j721e-evm: Add SMMUv3 IOMMU in platform_data

J721e has a single ARM System MMU version3 for 2 stage
address translation of DMA requests from different peripherals.
Add this as iommu unit in the k3-j721e root cell configuration.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/6a8ab13d6f2b...89712d8a4ace

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/6a8ab1-89712d%40github.com.
