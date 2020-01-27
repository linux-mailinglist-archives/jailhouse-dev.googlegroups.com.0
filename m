Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBQ6WXPYQKGQENJEZ3UA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x640.google.com (mail-pl1-x640.google.com [IPv6:2607:f8b0:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC6814A578
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:53:09 +0100 (CET)
Received: by mail-pl1-x640.google.com with SMTP id d20sf3840527pls.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:53:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580133188; cv=pass;
        d=google.com; s=arc-20160816;
        b=DlE7Jslow2xggzdqcWsPTobUqAZQTMcpQIdSUoeR+HLSAqtZUawtJLOwRRI5kCj6M+
         s1nJLWoenWKuNCHQSogM1M4TpZ49rWS8Umvrl+U2R6oTfK3ITCBCu9V4HF7FUaouyeKg
         MQ+29v/76ktHVFqM6s4Ls++Ep2nKqHd7a1hee/B+2tBZiO7HWgG+dhK6DUAmKPOnNNKv
         ap2Vkk15EQ/VH+4H2AGY8q7ARDgqdojsxPNWL5p1qWmbPr5Gevzjo9exU+LBxVYouAIm
         bfyZwCS1ugaM/EeZUhPnSxXVd33bc3Su49bRq80TkvxwNRj/tWU/h2S+lE0+CWb3QZbM
         YsQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=J8ENOZz5keBg+D1VXkRU7Zpi3oJhilBetaLjroWL3Rg=;
        b=DF9Yn3+fcS6E3tSRhE9YUwOxe2jtek/SjNQBLN0m22ieEZpny5/HZ0Tu6GctdMlCwk
         kzdb9/y2KG3btusdbk0u4drZbkEIuKFjaVmFG0OHbYvnrOUmgotXrU8Y4zL6MpUysLgI
         Zq4cajDCRjzkbkcaoPoj13OS155MZ6/9srzlrgnC0dIvRZA5UbbXS9coK0NqjyPStdRh
         C0CXyfeezeuBsZD3c8unzn6371sPt0KgryVDAlPq6hFOLy4gD4fRKto87d5wYPZC7Pkr
         WdoMy9iR3iKRshejEU0VYG7cKeiwVLstYn2WrmgK4kJCfoWbVGX5SdIQbbuVLOGclvSg
         F0bw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=uhEBDiAB;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J8ENOZz5keBg+D1VXkRU7Zpi3oJhilBetaLjroWL3Rg=;
        b=i6HrJD+gq9y7hFBNLmjGlenfBp1O7G/2pE34VizudvrqmYTUHo+1GSDUeWNlPHKZ1s
         XZLvpbCMwQYxT0Mb7hhNhiy20Pk3dUgVpPHW5kZG9WYGtKSdxrB3v76FHhFjnSX3G3HC
         uoOj7b51zaIXNS0QgByi5uu7giR41F1Su4xrGybBXePciH8PAQkJBuu86uzgSMTV6sAo
         f72qvKAcsLTmg+fMfdBPdFMcBqm5fuu0lxCdK5HdIXiNcRGy2KsjxRDZngkB5yHZhP+H
         lfVGRcJaBB2n1oLVRWGj2tsMIIzBEw0fjyrek0GyCbXdb0Jt8S4LDVFydtoh1+oE8OY4
         x5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=J8ENOZz5keBg+D1VXkRU7Zpi3oJhilBetaLjroWL3Rg=;
        b=T0vgxQaVpn+hsTVMyQTLJ5iu4Y77QJ6gvWBSOl1lcnLaV5HlA8ym98/+7NjApiiLtA
         Cde/UF+MbNm7EBA0O6pihT+T83QdcCa6Y5XfEXo8WOXWzg5n0ORSFwOEbMUrEbAU5SX+
         1NBOeRlmtr/XnhMnpMg4zmmyFl6ZnwGAxXJShCPcs/7PBd5JXooz1c2GyoCa7pVrl295
         DXFh3Idx8mJUyU/8m2l4STAyqolVcpJygST0BdUUc8o3blmNj7hlksSMi3BxFLCbZRPm
         ukrtGghBzmHI1NSVsX/ShPsrnGi3fm9n2uNU7k7tC14O/PiOdrNCd0kG/gzTZ6lH3zXC
         B+Ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV37CC9H6evDAofMe84797TdMNoN7f4U0w8bEIpIzG1JBeak0TR
	W6h+nZgNJlJPCD2NxsA3p7A=
X-Google-Smtp-Source: APXvYqxQPzzFKwDpxAbghqV5hCn76xIgtQMGIdi16ifu4E5N3Kqw7jwm4rrZp+Y073SiDZMX3pJM5Q==
X-Received: by 2002:a17:90b:f06:: with SMTP id br6mr14284102pjb.125.1580133187814;
        Mon, 27 Jan 2020 05:53:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:4608:: with SMTP id v8ls4582951pgq.8.gmail; Mon, 27 Jan
 2020 05:53:07 -0800 (PST)
X-Received: by 2002:a63:496:: with SMTP id 144mr20367131pge.207.1580133187169;
        Mon, 27 Jan 2020 05:53:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580133187; cv=none;
        d=google.com; s=arc-20160816;
        b=UrJcmOdgBtrSFvhz7HsxAlnLolOjeCHW0hxnh1VdX15Ekcrs8m1cR2KKy+VPhMVAPv
         6DQQFS0mFg18wXrvzK8ulR1v5FJmP/j4eUYpqiIPmusRi0c5m+SnA6+l5x/OfgCR84en
         4udMgpirSzmHkOABM69svVoGmA7wFHnaJquXkS+BZko836dIVoMbqsQXO06Gsfa3d7mg
         imkJ+ia+D9lZQtjiyLC8h75GjwSTNgwNinqxyYmnfTtrromHxpOiNUh6+YR3Em2e92dK
         0GRhLHDnhPoZ+uHKzTbrRpr46v/HYbSHjrXUGXlFWDvS+2u8s0DPildOYxdxPjUwougN
         dYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=+CHzJ4l1Lm4UW+80piNz5T3bYf2QG+TV+Dt9TRqb5BM=;
        b=TmHllR1g8IPzZTgDy1iW5YZrh4OJrVri5vYvmukWS4+0F41SgwkFF8UQGMoImB84mW
         aUGcGP99ZWM/J4VoztdTb08sJErey9ppqgI22kpNTCgwqIrs/qeuWaI6IgY5yQLT0cyj
         zBTdCKtSmpeT5W7d9RhHT+ja1/I6SbYcOJA79HRSXxI8MRoz4gszzZamPyz1MxxON30/
         BpomgpkVjU9XWL7WNpqEsC19O05nQlXH1S3XxUYGrEnoTbjnbGtlHu4t191JpgvqNSZl
         hr6FuKy9gm6M+yY1vfjuXZZY0xhMLnoaQGBPsfMK4R7xCRdpk2x5V5H7BoUMsHx6I1xx
         xMMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=uhEBDiAB;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id x12si582025plv.3.2020.01.27.05.53.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:53:07 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github-lowworker-e8b54ca.ac4-iad.github.net (github-lowworker-e8b54ca.ac4-iad.github.net [10.52.23.39])
	by smtp.github.com (Postfix) with ESMTP id 51134660A06
	for <jailhouse-dev@googlegroups.com>; Mon, 27 Jan 2020 05:53:06 -0800 (PST)
Date: Mon, 27 Jan 2020 05:53:06 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/2c8fc1-77a41e@github.com>
Subject: [siemens/jailhouse] b310ea: core: Introduce
 JAILHOUSE_MEM_NO_HUGEPAGES memory ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=uhEBDiAB;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
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


Compare: https://github.com/siemens/jailhouse/compare/2c8fc1423cc1...77a41ea5a2cd

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/2c8fc1-77a41e%40github.com.
