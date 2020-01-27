Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBZUJXLYQKGQE23PTIOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13d.google.com (mail-il1-x13d.google.com [IPv6:2607:f8b0:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 485F9149F04
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 07:36:24 +0100 (CET)
Received: by mail-il1-x13d.google.com with SMTP id d22sf4076501ild.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jan 2020 22:36:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580106983; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ur8aXjK69ZCPbo0ELuJ0zBVJO+3aSHoS86TYtpALVx4zUg0H6NJwLFJEfWfD4g9MJd
         4J/Dc/R8i+zBhhUHwzBoPt/XmY65FyoyL06lgTVST1PdVuDp4eY0uUbeQFyM7M2hS+A5
         Yzn98+T17Xqss/Op4K99SsTp3yLDYmKcoWOFpODq7Ne8KWunJAhbW5aEZp1LwWpfAlNi
         fCgpZiZCkH0mdO1mjmy04xXQgErm2vCQi7gcp/Nm5u/JFyQ6mI/vmLTndaiDNNzveSA8
         6H0UbnXTLUz9E1uP0CbcGpyS4bT7OdD8BpD+2Z0NZXEAp2ssBtYSXK5D42X+zNbVKxlY
         eqGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=DMW8W3HfrWOi20qV7b2dXZIwef2oCp8tHpAA+FRZrF4=;
        b=HfQBCQy67t9a/3LkmWogOJ5INb15DkQ90C3xjC4/XcoP3j3jdwJ8jyVETNxdYMKcXI
         ZFev3wxAPamAGg6AeaKQH3+7Owcrwzj3D0EHhOJymMtlf+Gn2QmAIQr6mU1zY63Y6Pjd
         nu6gQ/3KwFUazbV/amXUouaHKZP0H9DtXuu2TkLJ8cTSdx8/hDEyCsfV+yfG1Dl5+RPu
         72NRJy9K0sg9yK5fX1Nv3N+9CwuPgzN8+SpFOMpptIs957knYCsaHgwt0yQy6nSd7yZK
         f+ul99cn5g5S72igZmwNod34gOIJ8f6piN7NE1dbYQdhthH0whhP61UeNjRsldtKyIsU
         9ZLw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=gsV3ac0G;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DMW8W3HfrWOi20qV7b2dXZIwef2oCp8tHpAA+FRZrF4=;
        b=X7vQHFc/6XsnJWRhuhUevr8jdDeNO0yDq/iXITOtijk4IcTfQp7FxOWk35vS6/pLnB
         jMEZphjRlnmrRtA/aeGUcIw89I5OHaOXKWAlrk/t3Q/MNKSAuAWP2ZDD1suzt/UT3Vob
         fyRqODU3/laLpMW+SW/grFHMhrFv/6A3RkiEize7taVYGtIX469AcS5UYAc8MIr929MB
         YA7JjZvKntiIoku33nNIXdzm/xxLFK0Wga3rkXLb8AVeFPI7bM0v6Me7SYsPDZymqwdw
         H0EdRO+GVHY5sWBcJ2hETmBo14M2GCMD2ebQxLvE1gh1FAzf4hDHs11WNNCJ+KkWwYBs
         7GgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DMW8W3HfrWOi20qV7b2dXZIwef2oCp8tHpAA+FRZrF4=;
        b=d6KW36AIOfgHJbCphv8/xcGNgkHF5EvoHxDqtwsGRyYUbSwnQlmPuQNmwVxtw8vdrt
         TrT4lhCUC7tnhNxUxcBxAU5VNPDnRXyAF4J7cWMFzG20e7hNGjuqca7lKKlcyS4A6N2D
         NB8QgRSLGks0/+aU0eq3irEZoAc1bTkLepYEGcOKRJRWMG9QG1I3Agewl4kCghO1Z0W5
         LoMO6FzSfgac/0GITUt/EwFo2EGcGEiEpDj88rQbIFwHGNrKzOsYhl0kpKU67vBsPqKy
         O3yXdkC4bmM4OMm53YVNVQtSRoI3hb7ncrKdGq+nPgQQ5qxEid1IA2yMXVwtg5lwniPp
         dJLg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVLWMqV0GcmpRaKh3NcqOXTa7hrNfCjsuuBeMXIIhL7+1F5JvkH
	FMVpi/O8EDDxNHoXM9YpT+o=
X-Google-Smtp-Source: APXvYqwrofDe2D5xCyRRWPtpZ3rcnkjq8aIRw/FNSiD3663QDDrBFwy7aaL/nGaemdwEEeaTsGL2pw==
X-Received: by 2002:a92:902:: with SMTP id y2mr13823887ilg.196.1580106983008;
        Sun, 26 Jan 2020 22:36:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:cb49:: with SMTP id f9ls1747167ilq.7.gmail; Sun, 26 Jan
 2020 22:36:22 -0800 (PST)
X-Received: by 2002:a92:3a9b:: with SMTP id i27mr14421439ilf.39.1580106982384;
        Sun, 26 Jan 2020 22:36:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580106982; cv=none;
        d=google.com; s=arc-20160816;
        b=sYS+XIlOGNVsbfNG8aAzArbpMoYTRoQsGepXtIlrNMVEH5aE4UdY9C5msU7oPO47Rl
         p+otC3KqZ7kSPy5VKMf1rK01+uhg2kVNF/xpK+lFkghVq2RftfXyD5+gxnJi9/zI64TC
         IjqyuOBYtMJU8DSr7FOoXK/0LPXQ6szWVao1xUN2rUiY4EErpDCHXSmW91zPhlgChX9J
         9hkZR1jBE/xbBCH2soNj5udpmCrpbB3JC61CaIWffOatEcw1ed3pNNkfZDhM1uBaEBkw
         lnOiy/bSF2gMJJ7LkreNvineZKItLuxM2IyOaMSkTaON5TBJc8NIRiMfv8XXtXmkwHe4
         dVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=qOb2fTrh+olqqiriG0PQGHP8e2/9Y6DlPSt8vkMe13E=;
        b=W74f0uIhiWs3LtIo0v9tkbT2RS8gzMEcKHfmOHy7nmF5IuVWyGzsAvKP2Gh8K2dh60
         VI2ZSXt1bv6MB8yRrWjOj3nDOTjMXkCvLEMA0/lYW8wiUS8PxJS9sqfNbNXGQwFZz5J/
         PHi7Tqjk2srSeH+H/bNs3+Gep6EC6kc7oxaVfkIPc6wporwXP1FE5me//PvcFagJAsLw
         PxvJOiFnsF1rJcK+Ofe8vQTbaBy+9+JhKnnmlcahpPhQN1I4fuXbPCy2kfD22LFayjyj
         L8I3L76irXJ817l94aYwbdxAEOHfsw42pVS4KNDcw7batpQnkIwHKSmy8XZqD8j5ouG+
         lcgg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=gsV3ac0G;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-4.smtp.github.com (out-4.smtp.github.com. [192.30.252.195])
        by gmr-mx.google.com with ESMTPS id k18si706194ilg.0.2020.01.26.22.36.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jan 2020 22:36:22 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) client-ip=192.30.252.195;
Received: from github-lowworker-28f8021.ac4-iad.github.net (github-lowworker-28f8021.ac4-iad.github.net [10.52.25.98])
	by smtp.github.com (Postfix) with ESMTP id DC742C610D2
	for <jailhouse-dev@googlegroups.com>; Sun, 26 Jan 2020 22:36:21 -0800 (PST)
Date: Sun, 26 Jan 2020 22:36:21 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/f27064-5ea603@github.com>
Subject: [siemens/jailhouse] c4024b: tools: config-create: Adjust template to
 latest ch...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=gsV3ac0G;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.195 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: c4024b68d0d17f6cf6d55a0b61845511ed19e6f7
      https://github.com/siemens/jailhouse/commit/c4024b68d0d17f6cf6d55a0b61845511ed19e6f7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-19 (Sun, 19 Jan 2020)

  Changed paths:
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  tools: config-create: Adjust template to latest changes

This was forgotten in 3fac413f0647.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


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


  Commit: f64e719b01d6cd526b748742d5e7b96f6749027a
      https://github.com/siemens/jailhouse/commit/f64e719b01d6cd526b748742d5e7b96f6749027a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-22 (Wed, 22 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/x86/svm.c
    M hypervisor/arch/x86/vmx.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/paging.h
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c1d059a56b20261f75a268fe7bbf94f3e796d99c
      https://github.com/siemens/jailhouse/commit/c1d059a56b20261f75a268fe7bbf94f3e796d99c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-25 (Sat, 25 Jan 2020)

  Changed paths:
    M include/jailhouse/hypercall.h

  Log Message:
  -----------
  core: Tune comm region's flags field definition and documentation

This field is static, thus volatile is not appropriate. Rephrase the
field and flags documentation for a clearer wording.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: beb95b54284b1defd0f1952d43f8143cf303d38f
      https://github.com/siemens/jailhouse/commit/beb95b54284b1defd0f1952d43f8143cf303d38f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-25 (Sat, 25 Jan 2020)

  Changed paths:
    M include/arch/arm-common/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  arm/arm64: Pad comm region to natural alignment

Better pad than rely on both sides using the same compiler logic.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5ea60323214f8cbd4c12c529acfe5223a289a10c
      https://github.com/siemens/jailhouse/commit/5ea60323214f8cbd4c12c529acfe5223a289a10c
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


Compare: https://github.com/siemens/jailhouse/compare/f2706433efea...5ea60323214f

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/f27064-5ea603%40github.com.
