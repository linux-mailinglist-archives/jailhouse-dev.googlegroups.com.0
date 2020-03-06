Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB3UMRLZQKGQEO675VUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5E417C426
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Mar 2020 18:20:47 +0100 (CET)
Received: by mail-ot1-x33a.google.com with SMTP id 4sf1905886otd.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Mar 2020 09:20:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583515246; cv=pass;
        d=google.com; s=arc-20160816;
        b=DdPL031+VLrT8R5C3DZe0yadrphpWTQE9fuPfjAPrDPts1gLW9LG6+2U6n9ierAHkZ
         FDA9Ygl6onWIMyydLP17J2sWQ92gHl7ts8ILW7yv3PMASzX/VjFGXkAEnRqwMghjQ7Rb
         Cth29Vm32qQajfWjAfb6ZJO0ximiOlhfBGZLnxdUPk3aGA9JGaW9n0uHniLjnt/DLTM7
         A0K0psQVNEVY74M14BEj2OhsuLT4EvAurYKhWLT/+/DDyIkuifusj1etDpxMZP91OEQl
         M47jZSo9vGgYAYwi7glfsU2FlMArDfgI1glBAqr+Alym15QQM9RSKh+Rn3ERHRp0+e/F
         U5tQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=KbeWcUVoVW4wTArn1hlDGdyYIcIPIYHpL5KU/rbdA5A=;
        b=ohgBxsRgO84U7GH+60R7MC66TobN1agloqIOPfR+RHNFjsuFgQ2+Gh3Xm1vEIYfTGT
         NtsayxM6P9JHKKN5RTE8b8/7Q6npiyLvEIM5BhvfJ2t/WpMm42sbuKiO3PP2JG1BfTlL
         8rxQiqF/xowrC50+KhTlH1kWoB8atg00VEOd81R6cBRPua881ya7SAuEgs2VKxgoqG6S
         WA+Unx0AqxmeiaxOXB3JZKL0h0+6p2wQ11PsxJLnQvxqlLeIr+aA50jvSV57ijm2ypG5
         1jt7SafaeKt1iVFtt3xZKY0tBATP4hTW0pPGKJFNCRQzn6rTew6jZzUx21lL2NhQn20Z
         rBOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Y9M9VKQU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KbeWcUVoVW4wTArn1hlDGdyYIcIPIYHpL5KU/rbdA5A=;
        b=F6Q2MI5NI1om01Ys5E4zx8T2Kg/sGUiZCYQ/xRa78ahf4DK6IdNiuO/xfQWlHN29f3
         9ArCwYVwf/AbhkpWzgOoCgqZRJoOOVvIDJ5rzEjsQABCANohYbJsY6eWhPHJ0796q0h+
         3CsMtkMC9g4TJxZ/sbSZPaPHzeNiJ46PPze6vJiVMuPku0Y1RcaoALpx0f8HMirTupQW
         3Od0+3ZJFtykEzBFp+ngKv9B2+Qk/VnOaAG8gnLUUDc1L+VDjecl6lP1JnoxT4KPIPGv
         nXioUgy6Yld4qakhe0SPSfDXr/4jRW7z7HfjAHHc9F//gI/gzMGUrVDKPcD5NWF2rdk4
         9vOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KbeWcUVoVW4wTArn1hlDGdyYIcIPIYHpL5KU/rbdA5A=;
        b=Pt5t9+AV6fRqYYCHksMgvS+OcWI/eFDhR6uRI3gcXlSz7kiLhxSZqPp8af43pYPXLG
         a35pad83axgDBZcvIyekkaHQbVqJAGvVuTfHozIxJQFlsRBayB+iXyyPZH6CJpGp3w2g
         B7HPP/QLogG5PnnlcePlDiUPkXkSiQTDEnQwQUOgBrsi042jCIZPs/oQ/ps01dwWE6UF
         qgMFYtHUsgbzMdK/04IWSaEPrjhu3BJg3dtYdOifNwc0p3szHtGyKeTuMVbeG89lJQtw
         33gvtokGfjKE4BgLk9ePL8waHjGiyXJw2xxJYioLGIsx/Y7Z7YCj2fJRPY7oQ11lJE4N
         muUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1Yh/H/JIYvY8Wf7sW4o/nyBJbiE/8FkuxE+unpiZ0UT0zj5ahc
	s3A6QGwrV0XWjAlGNOD6d64=
X-Google-Smtp-Source: ADFU+vtUmQCoG1rAMCZHv7HU3j0OKrvTb7/b4pnC925SwhjGPseJ16zcoegUkdSglZsQZT8pc/MTrQ==
X-Received: by 2002:a9d:7756:: with SMTP id t22mr3285696otl.272.1583515246676;
        Fri, 06 Mar 2020 09:20:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:f5d4:: with SMTP id t203ls848590oih.11.gmail; Fri, 06
 Mar 2020 09:20:46 -0800 (PST)
X-Received: by 2002:a05:6808:103:: with SMTP id b3mr3501233oie.46.1583515246035;
        Fri, 06 Mar 2020 09:20:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583515246; cv=none;
        d=google.com; s=arc-20160816;
        b=dMq9L31J7i7UZX5b5WcyOcDhrgpNPWWWGGXCm9EA5aZBC35qPHOs+Je6OJsrS1DsqN
         rtl2dW8Ojz4ej6TGEkZ19PqTduwuhqUGSpVc+IF0SWivwgueYgrdaWfOT621nOSj4wKr
         WHaPQSnSKMgBggSdOsQhKnK8XRDZ1qpX69RC675tPX/u25AYfzxPNcgOAuO821RaQ0PL
         MxdCPW6COU5Ac7UUQJjOFkhtojKfi0N3qGmv0+nada4MbI0/v+r6+ESM78gmQsiJqmFy
         Ed+PV8pyw/SoJT6Xmlou05mRQh5GousTrgVO941bm8oyR3LPvBMUpJE/WNa/tZSqn0Td
         WUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=8VVOjqY+5wPesbVv/2Wdca3PZe2/UFfvLnq509yTU6U=;
        b=HoGsi5OCxPvpzr1PXlH7DgCzJKWF0v18ilnuPlpPpz4k+Pe4FD9VXxyBP1KvxlVdq8
         tkfSLVptqg5/ZFyiiJE6+cxuuRIYS5vuTUhHLqK6uUO+5JVqMjPbt5JaPcX7h+9T54hF
         9IjrBVcdZ8Ic5fuAvNOTag/apDsgdfZU+mWQUfrzjKfatEActAbo/PJ9bcbHQP0GE6pc
         R0KuHuSsT65iuqM3ITDcBXZErAlZ6LNddJLZ/FDheT4cCrGmzYXe9Dh90UZR0DhLLxBI
         HwCZyYSSJvBk0xXOvxMd8pEQxyspWIVzdmGGde8YXZSRLaI55QU9X4WDIx8cc0Mujlvq
         J2bA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Y9M9VKQU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-7.smtp.github.com (out-7.smtp.github.com. [192.30.252.198])
        by gmr-mx.google.com with ESMTPS id g15si141176otq.1.2020.03.06.09.20.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2020 09:20:46 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) client-ip=192.30.252.198;
Received: from github-lowworker-275fa97.va3-iad.github.net (github-lowworker-275fa97.va3-iad.github.net [10.48.17.64])
	by smtp.github.com (Postfix) with ESMTP id 935C12C0E59
	for <jailhouse-dev@googlegroups.com>; Fri,  6 Mar 2020 09:20:45 -0800 (PST)
Date: Fri, 06 Mar 2020 09:20:45 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/ca7123-266ebe@github.com>
Subject: [siemens/jailhouse] 564f35: x86: Add proper fence before sending IPIs
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Y9M9VKQU;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.198 as
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
  Commit: 564f354155a3a21e95041c1b8fb79605356abf65
      https://github.com/siemens/jailhouse/commit/564f354155a3a21e95041c1b8fb79605356abf65
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M hypervisor/arch/x86/apic.c
    M hypervisor/arch/x86/control.c

  Log Message:
  -----------
  x86: Add proper fence before sending IPIs

Since 2017, the Intel manual suggests to use mfence plus lfence as
barrier to make data changes visible triggering an interrupt via the
x2APIC interface. Jailhouse was so far not using any barrier
consistently in those cases, neither for internal NMI IPIs, nor for
those triggered via the ivshmem doorbell interface.

This adds the recommended mfence;lfence sequence to all IPIs triggered
via apic_send_irq or apic_send_ipi, at the risk of having more than
needed, e.g. when issuing an IPI on behalf of a guest that already used
a barrier itself. Compared to the risk of missing a cases and given the
overhead that the intercepted IPI submission comes with anyway, this is
the preferable option.

Note that this also ensures proper serialization of data writes and
kicks for the ivshmem doorbell interface on x86. Such a property is
going to be demanded by the ivshmem specification.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cb8d79bbc2caee07fbc2d9ed86af15e040a70c35
      https://github.com/siemens/jailhouse/commit/cb8d79bbc2caee07fbc2d9ed86af15e040a70c35
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/ivshmem.c

  Log Message:
  -----------
  arm-common: Add memory barrier before ivshmem interrupt submission

This ensures that a guest will not see its data lagging behind the
signal when triggering the ivshmem doorbell. We are going to demand this
property from the ivshmem interface.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: dbfeb6d8711fc0e1fd8140d4d3d4aa6ea5c6e4fd
      https://github.com/siemens/jailhouse/commit/dbfeb6d8711fc0e1fd8140d4d3d4aa6ea5c6e4fd
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/psci.c
    M hypervisor/control.c

  Log Message:
  -----------
  core, arm-common: Clarify role of spin_unlock before event submission

On ARM, the spin_unlock is sufficient to provide a memory barrier before
calling arch_send_event / arm_cpu_kick. On other archs, the
implementation of arch_send_event has to take care of this. Clarify this
at the respective call sites.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 851ae85813884f50580535b076f4b97ca5dbf360
      https://github.com/siemens/jailhouse/commit/851ae85813884f50580535b076f4b97ca5dbf360
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/control.h
    M hypervisor/arch/arm-common/psci.c
    M hypervisor/arch/x86/include/asm/control.h
    M hypervisor/include/jailhouse/control.h

  Log Message:
  -----------
  arm-common: Get rid of arm_cpu_kick

Implement arch_send_event directly and switch psci to this. Makes things
more straightforward - and provides the chance to properly document
arch_send_event.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e72a8edaa1ebf7b4a00c43ecb988cb94c882d12d
      https://github.com/siemens/jailhouse/commit/e72a8edaa1ebf7b4a00c43ecb988cb94c882d12d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/irqchip.h
    M hypervisor/arch/arm-common/irqchip.c
    M hypervisor/arch/arm-common/ivshmem.c

  Log Message:
  -----------
  arm-common: Factor out irqchip_trigger_external_irq

This replaces the non-intuitive special case of
irqchip_set_pending(NULL, ...) with an explicit one.
The only case where irqchip_set_pending() was called like this was
arch_ivshmem_trigger_interrupt(). All others already passed in a
cpu_public pointer guaranteed to be non-NULL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 266ebe6decbf3062120a164e2bb24a4a874b01ae
      https://github.com/siemens/jailhouse/commit/266ebe6decbf3062120a164e2bb24a4a874b01ae
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: ivshmem: Require that doorbell writes act as memory barriers

This avoids that the guest has to be aware of how the doorbell interrupt
is internally sent to the target CPU because to add the corresponding
memory barrier explicitly. The implementation in Jailhouse already
fulfills this new requirement.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/ca7123a5c58d...266ebe6decbf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/ca7123-266ebe%40github.com.
