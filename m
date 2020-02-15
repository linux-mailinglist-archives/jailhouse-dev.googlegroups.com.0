Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBVGET7ZAKGQEXVCFMLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A2415FE52
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:21:42 +0100 (CET)
Received: by mail-qv1-xf3e.google.com with SMTP id f17sf7553592qvi.6
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:21:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581769301; cv=pass;
        d=google.com; s=arc-20160816;
        b=N/s83IJ5W0PwW6fv1nxTrEW2/mBYNb0bYbgs597soUVqnolXLJEJdy6vJ701GwcZqe
         6ZWzBBQ3idsAaenaLL9b4avkfdwARbELhR/Djaf12FJpeFgVNLVYO98S4daq9OuDI6NB
         XPCgvCP0Zy6Zp3W5+PAMjIHONcWl/oz4rDQCNWmd0u/NPZEMDgb/mPRQ9fP+UKm69Iel
         k3iQ58zyBhKonzJNPkEdg1sSejtQ1T0TM73XLYGDmMUnD2fDy/CX27oiUwjUP36c1Rk9
         VRvzyPPPRV1xwGv+c548pwCWKqmF4aPaFhjC15FtLCZqtfq6FxoKu06Yqi19ErWvWBkH
         cHXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=a/D6J5/yVfmkd5pPHHqSSR3Nlf3Fe6Mgm4G+T8jW38Y=;
        b=n0aMqoH8Nz4JU3L9Wd4cMxh9IYuJNw0nPS9q5SUAsYlNmOa+2Dgl+G68Y2yaPNyKxU
         e+SOfmrGqaarPdnPUf7aTwxRGK25QVJLM4A9jSQEMHGwRoLztiDcaAmEc4pUYg9wrzdU
         Vn74aHrckwNlf6TwssZbA9ut0A04TIO0vwwm1UHjY6/fnxX52ldsT5LijBfKHcBnqNNw
         cds0apgM7seKl1dG1yP67+jNMdeY/8wuwbo3G+tD5awynYjcTsLlGmPGdKgWT2cdkFQ5
         mQPqx2WCe6ZRnRMgptq/FElQdsyBdHs6yVVJQbbA+q276gxDgyVfKXRU8R3s4BF7RvU4
         XU4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=T9B0m+H9;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a/D6J5/yVfmkd5pPHHqSSR3Nlf3Fe6Mgm4G+T8jW38Y=;
        b=YQcT+PpdjoYvRPdY5iVw7c2OgPI0zHqlRmQL9a9WXV1DTZiNnCLoS5LRwzBc/35aPu
         iKoEb8sEzl3/Sd75HDKHVV1oY2+mZBTW/3uoBVOHD1jzwCQOkgjePEYoeHJpeR6ZIeed
         YTmo3WNZ0MmtCUr7iJM6uIVJ/wyZolKkwb5x3AIRd3EFErG+dTO/YtQ5zeSSlAbBgALK
         +8mQ92yaxpcMdqu8SxyTPJoB6PBRf0Z/zT/r8klZ+x0HH5bpSNIrECMs9M7qiBAJ2qFe
         eKG/n0eU9yf+BCpF/cRYAHUVPscFzYvduZ/T6U9K1qjzAoK8bNirtXnONTDFKw2zKqHe
         mPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=a/D6J5/yVfmkd5pPHHqSSR3Nlf3Fe6Mgm4G+T8jW38Y=;
        b=NQXTu2dre9jb1Vn0Awc8u0dCGBc5WSxSuX+TKQh5ETWu5dbFZRi/78FwukG7dHlQU+
         nQGqdjeARRHL9SMoMVPTEqG+ARl4VXVIjD22gTFfCmyvGzG1Wgqlzlotddj2XlTPHBis
         8xz7hNFnU1f6OF1WOSq5r1AA3MMK33gzbH4SIpKpFXxSe/jvV0zNVLbKSx6m2UbCdWTP
         33ZdSni1mtbFfeNUW/9M4xOjJ9QvMPWL0ciSf3otfgJ7XHk/QIa1fpPW8YsKTvYtHhba
         QA+ph13p69R/sORvJpU46Ep8c+DeM7q2ib4wWH6Xc0PO9sjcjKqZ5ehJNhYYJtbl8dfd
         s1Yw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWA8vgSVcsESQmXFa1QpXAEkVtcqDe0TJ3gjFIDRm+cRKG06aq3
	rs9tSL+o6GLrZrh/ZMtT+oA=
X-Google-Smtp-Source: APXvYqw5vt1UhHgyYVocFHLehU3hNpbkqzkqYMiB+olR4yUNmr0En3A5d+gZ/7lmR3y16zPXDGYYFQ==
X-Received: by 2002:a05:620a:12a8:: with SMTP id x8mr6928710qki.93.1581769300992;
        Sat, 15 Feb 2020 04:21:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4526:: with SMTP id l6ls1126755qvu.1.gmail; Sat, 15 Feb
 2020 04:21:40 -0800 (PST)
X-Received: by 2002:a05:6214:209:: with SMTP id i9mr5971775qvt.54.1581769300505;
        Sat, 15 Feb 2020 04:21:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581769300; cv=none;
        d=google.com; s=arc-20160816;
        b=P54U8IvLVqFkNuwq6lBk+j8icIcpr35vpT5qTjPjo7xuT8eOGH+APgIGY4kG19GuKx
         j5M+7i5hwD9B1F5gtcnHiLSqzDp5YI0uWSeIDd5e/YET5hIfqzKcFWGEC3EAL0zzSLv+
         e6oe9EwMQFQr45EDu1XVb8iJpDH3y8fPGSpMnAXAxIPntAymf9IpI5mMKsNHIIvVJuE6
         GhMECyDWJwdTTtjlulCXIpwysW1nbuuDmt7331n2rdJGz2iul49fQ0IpcudqS+4ec3Pd
         VUnMfpl7d8VpUwi3hN7vMjcZlkO+8HKEjCHx8jzkc5/fs6QTAgxA1iT5VdJdhjvYT2JF
         GE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=q838592bqNEkmupDe1W5wXKTmgBpGa7PqRuZal69nOY=;
        b=DT4EKW4Yul/3uErhZ7LGKDM4ps0eLxCzQpABWRR6+ifDmISojhzEDsWGD8/cU51WfO
         5i3f0Fl20BdmMrzLL1Au7SK3W1Dr9HUXqyKAHiRvy9+eSgjELoD1Gnfv6Fb8+7cbxl7O
         h2NFPf8Hvztv6XUcJDAAl1Qp4UmX9pNjizIwx+bgwisdQUwZBa9NxdiklbabcRRV3WLz
         eNoCZDQB6zx4QimB9eG8ryiBeKCSUG23w1ZxK6BVrAKRVLye2/ppatkWSHlksSrrXrPO
         06/nQ52i+LMYpv2RZghRntMgSU947BL6ob3Q8kzXJQQjWqkFYloVwIxdMCxZO3Wo71wc
         WBpQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=T9B0m+H9;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id e26si521915qka.2.2020.02.15.04.21.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 04:21:40 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Received: from github-lowworker-292e294.va3-iad.github.net (github-lowworker-292e294.va3-iad.github.net [10.48.102.70])
	by smtp.github.com (Postfix) with ESMTP id 54F16A0D05
	for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb 2020 04:21:40 -0800 (PST)
Date: Sat, 15 Feb 2020 04:21:40 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/5dbdcb-a519da@github.com>
Subject: [siemens/jailhouse] 23f82c: driver: Leave a comment while
 on_each_cpu(wait=tru...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=T9B0m+H9;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
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


Compare: https://github.com/siemens/jailhouse/compare/5dbdcbc720c9...a519daf7568d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/5dbdcb-a519da%40github.com.
