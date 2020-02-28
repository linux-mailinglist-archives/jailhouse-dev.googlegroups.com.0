Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBFON4XZAKGQE4KREREQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13d.google.com (mail-il1-x13d.google.com [IPv6:2607:f8b0:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 694BD174022
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Feb 2020 20:14:31 +0100 (CET)
Received: by mail-il1-x13d.google.com with SMTP id p7sf4238138ilq.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Feb 2020 11:14:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582917270; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZdM1oK/lg2dEea+9munInp0hMWZn1xK/3E7IibcNrNFdtR4UT6YxzFgVjEebEOlx9G
         cXNGKek5HrJ0ldF8rYCHTzIeYh0Q4TYeAKilWom1V3PjVtgzRuggIeqGusoc0AD1tF5g
         WOKRN/SkN5FGBF6uNaXroIvJPIR9EE5BnwZ1bclFbUYgL2oB7e9x+ydFE8+hsLeXD+Or
         qXvscKF0a2YcGTdyE8O1OgsWapUM8BSRE0QDf8nMBqQ9ouO/Ol/6186zzrfmv29i6tS8
         xhdmT19Mv6dbkYBgUDzy+OY7HulkSlLg1CPO9qN4BgYpFtePRqEpJjn/Ozb7usgPrSDF
         u7kQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=I4sHmb2fvewOaBq56GlCaKExbL0hqXHRJs1lIYblT/Y=;
        b=lTpJfbLd53+rqTtKRY2V3dgsTxt2Zf20PCsbz7Cn+scmniMz8AD/2rv1z035Ktb7KM
         ba4P4wNyi0noi+oIFC89YH3aWjA0fIKpSSDNNBbkUuyXw+H6bV1Uzno1XiUecBzwNp/s
         r6Q7FP0U9rx6NrV16MEZgLOp/yaNKygsESZxs9yeAIiGHt1S1AySvZQYoBvZVuv+MVLc
         qDgIq6Bhl7YkiaIYKoN3aKShPOjhlYctEh6pq/Gixukyo/d8hHP/90DGRFq+8WM2xchZ
         ehCY3sTfNsJpDuLAKkGuvrZeJKcQ+KKD0vU8XhDPn5yvAosefFsKTp2J+JrR77a2FPgF
         JhfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=wRhcTMt4;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I4sHmb2fvewOaBq56GlCaKExbL0hqXHRJs1lIYblT/Y=;
        b=LG9W6f41wXbcQCDVdFRWBHeeQgk4JsSCII/SiD3C+JV1ECMrKVjaBB/9f+ay2xi0C/
         HM6OTmXnzzmTg1qpjCpP+rXDlG3QMlaXiPNR5yQ6h1+nco3FWXJZnQUJiLwo04n6PVn5
         KR7BQ8/EF1Y1u3KZXJBgm/sIPs9OTmpvzw76/7EVGaXOMueUl2uMd14fqsvBflr3ET8w
         XdkArc+miUvTM8Iz+3+WkKiTLfOVT5PRrauev9tayJJX7YRXIedLJ9m7wmXZCrZUGV+H
         ZvgHTJ+sWMGlG8dJTtUKDqH6iS9bD3xPklS0Jcec96fMXO7F0FNk2PIvuOoONGZnUHgQ
         k5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I4sHmb2fvewOaBq56GlCaKExbL0hqXHRJs1lIYblT/Y=;
        b=TpGUMF15O6405e/6SkgMdvd2VKHGjEjzJtl8JLPnTFXueGKTIn9VC6x6k6MSZ+38T4
         CVyhgpH19gRYa+eBIJ+/Vqbo+IvrClpcoiy0E0gzVrUZAQZp2C52i413IWdbZm+zIMAV
         e5Lx8d8WBzpj/qhmbG+vuQqiga4Ll7IG5e7ddchRwvc73Y31+Sg2Hsge6rqJ/NSvTCGf
         wP3HD0cDs9e0/bAH7mWo4fjbJzs+qRyNi7ys2DTVpvhfK6qeQaX+1ta0QnCy2GLs/eNY
         MQeV5lzXgs86D2JJFc0lFoZOwWH2+AYuyAa8GeTDRX4OJww7rCLUNEvEcmkCs6nMaZ0w
         gOEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUFissBDTrQPAtSUqyeI2+wAz1ICbbej2uoWOk8LdAce17GJjSf
	1ElfDNGSEvLynlFXLHqmmPM=
X-Google-Smtp-Source: APXvYqxqg5AVhSF7FWCuU4Ny6z2xsD9uma+1EZmnEpdAVGnlGmsZPNdQ2q2HhqzE/bLELw9HLSO8gg==
X-Received: by 2002:a92:a11d:: with SMTP id v29mr5384007ili.305.1582917270003;
        Fri, 28 Feb 2020 11:14:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:d3c9:: with SMTP id c9ls1057454ilh.1.gmail; Fri, 28 Feb
 2020 11:14:29 -0800 (PST)
X-Received: by 2002:a92:1906:: with SMTP id 6mr6008497ilz.130.1582917269381;
        Fri, 28 Feb 2020 11:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582917269; cv=none;
        d=google.com; s=arc-20160816;
        b=j013/OX5oj1G5b55fbj/qxRgWLb/4YRAtEhewEQRdSuujW1W74cxgX3SMfW07s2/pr
         jNJJ+xk2O314Cckjz2ouhr/NgNGmjDstfwdb2NZjoRzW1yXmgO30GQQrJyg0rxnfSHKv
         psqzgrNuaG4gKY5Htq/hx66avb2wbwEyCKWy/Hj0bj7drQ+3OnAYbTwepOh0Z12Ex9nx
         PIKW/Bfh6vHSbEwZzzOydaUeUNYokpS2finuPHR6VVoI2/AwCShTJLszG+UUIzKcw4YE
         LHJmuRB4lWxeXpodjjITY4bCtQbifC0RehO35bCLxHQHE9pAcTNlaoTBt44u8gJ0RpGB
         TvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=G3CsVpoZGQOUnfv7GmXVF87mv+EHMy4QKi4/D8zzSyY=;
        b=uX1EGHlNu/g2tMjLTonudZ2wNxQgiBep4Y9An8eOIyLML7OunopQPzpLnFBiDnp0zw
         Gsu71cKQYn/Lcp/VK+6ugD67u1AKqCPwicgCIgMoY7lczEIiGmX+AGUSIRvLMof1IYzI
         m4YJ1vhrIJTmzI11sW9mGfQ2bA8kUXaM7VMCy5Ypat2ps/dK/TwedcDJIH6BVORj/wmF
         dMOxXlvv9kjltSyEtlxzOnH+fS7YPhtBAwmkcNkQK9nhgumsCBJjGITySUsqUegJ+kjR
         8Nag1iFwjj7k9uylVbPtdamew0cS6iw4+EUY/vNREr7ueqziyTXlhqzRhCTs39eUyGLq
         uHkw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=wRhcTMt4;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id r8si101773ioo.3.2020.02.28.11.14.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Feb 2020 11:14:29 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github-lowworker-45eca55.ac4-iad.github.net (github-lowworker-45eca55.ac4-iad.github.net [10.52.25.70])
	by smtp.github.com (Postfix) with ESMTP id E4B3E521D6A
	for <jailhouse-dev@googlegroups.com>; Fri, 28 Feb 2020 11:14:28 -0800 (PST)
Date: Fri, 28 Feb 2020 11:14:28 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/5dbdcb-ca7123@github.com>
Subject: [siemens/jailhouse] 23f82c: driver: Leave a comment while
 on_each_cpu(wait=tru...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=wRhcTMt4;       spf=pass
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: 23f82ce47f923fc6cba5696513fc5cba86dc89db
      https://github.com/siemens/jailhouse/commit/23f82ce47f923fc6cba5696513fc5cba86dc89db
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Leave a comment while on_each_cpu(wait=true) does not work

Easy to forget when looking at the code again.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7d6ea66fdd1c818882e00a3b8434d3d0bbe0b9ad
      https://github.com/siemens/jailhouse/commit/7d6ea66fdd1c818882e00a3b8434d3d0bbe0b9ad
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M driver/cell.c

  Log Message:
  -----------
  driver: Remove unneeded masking of cpus_assigned

Since 366766542b3d, Jailhouse will refuse to start if not all configured
CPUs are online. In that, the driver will not use cpus_assigned anyway.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b5d8439116e8615e5b0498391f3ecb27407a1505
      https://github.com/siemens/jailhouse/commit/b5d8439116e8615e5b0498391f3ecb27407a1505
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/paging.h
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/include/asm/paging.h
    M hypervisor/arch/x86/include/asm/paging.h
    M hypervisor/arch/x86/include/asm/vmx.h
    M hypervisor/hypervisor.lds.S
    M hypervisor/include/jailhouse/paging.h

  Log Message:
  -----------
  core: Share identical PAGE defines via jailhouse/paging.h

PAGE_SIZE, PAGE_MASK and PAGE_OFFS_MASK can all be derived from
arch-specific PAGE_SHIFT. So move those three into the generic
header. We just need to replace a few asm/paging.h includes with the
generic one, and we need move the asm include down in jailhouse/paging.h
because ARM needs PAGE_MASK in a static inline function.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fb099cc16bdc03fc20a0b7f41bb88d998f63745b
      https://github.com/siemens/jailhouse/commit/fb099cc16bdc03fc20a0b7f41bb88d998f63745b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M Documentation/Doxyfile
    M hypervisor/arch/arm-common/irqchip.c
    M hypervisor/arch/arm/include/asm/spinlock.h
    M hypervisor/arch/arm/mmu_hyp.c
    M hypervisor/arch/arm64/include/asm/spinlock.h
    M hypervisor/arch/x86/include/asm/spinlock.h
    M hypervisor/arch/x86/pci.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/control.c
    M hypervisor/printk.c
    M hypervisor/setup.c

  Log Message:
  -----------
  core: Remove DEFINE_SPINLOCK abstraction

It's highly unlikely that we will meet an arch that needs a non-zero
init value for its spinlocks or has any other use case for this
abstraction. So remove it.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 63c63da94657899e809416c1a56493e8ecc9507d
      https://github.com/siemens/jailhouse/commit/63c63da94657899e809416c1a56493e8ecc9507d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/arch/x86/include/asm/cell.h

  Log Message:
  -----------
  x86: Remove no longer needed include from asm/cell.h

This became obsolete with 018f4afa844b.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ad9547bc7a754b60207bf29b6bd9f397cbe1062e
      https://github.com/siemens/jailhouse/commit/ad9547bc7a754b60207bf29b6bd9f397cbe1062e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/arch/x86/include/asm/types.h

  Log Message:
  -----------
  x86: Remove ifndef from BITS_PER_LONG definition

Not needed, we only include this in bare environments.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 35064003c32d04844334b2607d30bb66aa5222cf
      https://github.com/siemens/jailhouse/commit/35064003c32d04844334b2607d30bb66aa5222cf
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/arch/x86/iommu.c

  Log Message:
  -----------
  x86: Simplify iommu_select_fault_reporting_cpu by using first_cpu

When this logic was defined, first_cpu didn't exist yet. It's finally
time to renovate it.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4da2f64396ae900b1229acbf5fd82e7c0323a36a
      https://github.com/siemens/jailhouse/commit/4da2f64396ae900b1229acbf5fd82e7c0323a36a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/arch/x86/apic.c
    M hypervisor/arch/x86/include/asm/apic.h

  Log Message:
  -----------
  x86: Stop exporting apic_to_cpu_id array

No longer needed since 1ff4937416fd, in fact.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ca9863efd13be47d8be61ba7e2738feff370d73b
      https://github.com/siemens/jailhouse/commit/ca9863efd13be47d8be61ba7e2738feff370d73b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M ci/build-all-configs.sh
    R ci/jailhouse-config-amd-seattle.h
    R ci/jailhouse-config-banana-pi.h
    R ci/jailhouse-config-x86.h
    A ci/jailhouse-config.h

  Log Message:
  -----------
  ci: Renovate hypervisor config

Several options became obsolete, others should be tested. Add them all
into a generic jailhouse-config.h.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a519daf7568dd81add59d01440c808489d081ef9
      https://github.com/siemens/jailhouse/commit/a519daf7568dd81add59d01440c808489d081ef9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M Documentation/hypervisor-configuration.md

  Log Message:
  -----------
  Documentation: Remove obsolete description of CONFIG_BARE_METAL

This was removed by 006918caa2b9.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 25787d78f88b97819c8769e296d4e1edeca68647
      https://github.com/siemens/jailhouse/commit/25787d78f88b97819c8769e296d4e1edeca68647
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/uart.c

  Log Message:
  -----------
  core: Reorder CR and LF on debug console

Unix tools like awk expect Unix ordering and that is different from what
we generate so far. Issue the CR first, and then the LF.

Reported-by: Michael Hinton <michael.g.hinton@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 096ee03151b45c8ff0ead2da1cd605be74fbceb8
      https://github.com/siemens/jailhouse/commit/096ee03151b45c8ff0ead2da1cd605be74fbceb8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M inmates/lib/printk.c

  Log Message:
  -----------
  inmate: Reorder CR and LF on debug console

Unix tools like awk expect Unix ordering and that is different from what
we generate so far. Issue the CR first, and then the LF.

Reported-by: Michael Hinton <michael.g.hinton@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5c5f2e20c53315e4604c07290e9a262bbba35dc4
      https://github.com/siemens/jailhouse/commit/5c5f2e20c53315e4604c07290e9a262bbba35dc4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/x86/apic.c
    M hypervisor/arch/x86/setup.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/control.c
    M hypervisor/paging.c
    M hypervisor/printk.c

  Log Message:
  -----------
  core, x86: Remove unneeded bitops.h inclusions

This header already comes with jailhouse/control.h which all require.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 46430c0f31887600ed4f11189dec4e25e1901fdb
      https://github.com/siemens/jailhouse/commit/46430c0f31887600ed4f11189dec4e25e1901fdb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm/mmio.c
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/arm64/mmio.c

  Log Message:
  -----------
  arm, arm64: Move sign_extend out of bitops.h

This is arch-specific, and it only has callers in mmio.c.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1c4c15399f736c49be665ca7af343b90cb448108
      https://github.com/siemens/jailhouse/commit/1c4c15399f736c49be665ca7af343b90cb448108
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm/mmio.c
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/arm64/mmio.c
    M hypervisor/arch/x86/include/asm/bitops.h
    A hypervisor/include/jailhouse/bitops.h
    M hypervisor/include/jailhouse/control.h
    M scripts/header_check

  Log Message:
  -----------
  core: Introduce jailhouse/bitops.h

We will share generic bitops this way.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e2562f696de236219f5fba88f64bbe6fb08c4829
      https://github.com/siemens/jailhouse/commit/e2562f696de236219f5fba88f64bbe6fb08c4829
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/x86/include/asm/bitops.h
    M hypervisor/include/jailhouse/bitops.h

  Log Message:
  -----------
  core: Make set/clear_bit generic and non-atomic

No caller of these functions exploit their atomicity, and this should
not change. So, simplify the code by using generic non-atomic versions.

On arm and arm64, some macros are folded in the only remaining user,
test_and_set_bit.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 84844ce64639ff86ca42d8ea2a2b7d437f6ef9be
      https://github.com/siemens/jailhouse/commit/84844ce64639ff86ca42d8ea2a2b7d437f6ef9be
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/x86/include/asm/bitops.h
    M hypervisor/printk.c

  Log Message:
  -----------
  core: Rename test_and_set_bit to mark it atomic

Prepend "atomic" so that it becomes clear that this and only this bitop
works atomically.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ca7123a5c58d6e698c5349f29dfbac9a44e5e459
      https://github.com/siemens/jailhouse/commit/ca7123a5c58d6e698c5349f29dfbac9a44e5e459
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    A hypervisor/arch/arm-common/include/asm/bitops.h
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm64/include/asm/bitops.h

  Log Message:
  -----------
  arm, arm64: Factor out common bitops.h

Most parts are shared, so no point in duplicating them.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/5dbdcbc720c9...ca7123a5c58d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/5dbdcb-ca7123%40github.com.
