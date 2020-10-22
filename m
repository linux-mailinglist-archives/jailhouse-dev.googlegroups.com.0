Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBHVUYT6AKGQEQ46L24Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x937.google.com (mail-ua1-x937.google.com [IPv6:2607:f8b0:4864:20::937])
	by mail.lfdr.de (Postfix) with ESMTPS id 757222957F8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 07:35:27 +0200 (CEST)
Received: by mail-ua1-x937.google.com with SMTP id f10sf207132uao.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 22:35:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603344926; cv=pass;
        d=google.com; s=arc-20160816;
        b=QO6zGA9CLqkrWNLDkOYQfIKzG8k+VxuS0Syx8nB4jkuvz6dQjEl0XIZK95gjBPIGDM
         m+IXz5lU1UFM0fljK/TCXy1Bi2QAg5og4l/QNRLj4suEdUlk1MErc2q3rM/SZcU4m2XS
         ZTekuakaDiiCoBHxEnYi4GgHrLGA2vCObMQZVfF8cXYaPNDdSf7+YdoI5u/LtTBePBdN
         Whjux+kdGQgs0lsrxrGb+Sd8hEzrqPNvInxiVOUYo7rJ3qg9JUpi9sisRtmaHNIRkff+
         6EsdFntI2iwu5uwuAeywYztgJ/1UOy2v8UpqrQd2jZ/RXHx5lz6L51Wp72qsmlXOd9vi
         GZlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=Md04OYaO4RUq60dpF4lR243+Ygyflr8gUY6aKsRWl/8=;
        b=dhDDb18TgUptN6vsrTGNn0HPZIyrGPM/5/yb4hdnK/oansbPzQPtEbdU/Hui52Q/8r
         7xmotozSfJgBi96VQOUyGpbYso06RUcRS27lgVvqYhAl/jMd/0KXk/FeujsaksQiiTCd
         aUulFCCXk4F1mJivAdMhbvMrPG5fhzYlyHWd2iydxi3zhyxMf1lS/PYAWcGQ63hOQloa
         CCmX8e8rQ9QJHjyPxi6iZ5zSZfGVfzXSyEj3iLxjsUVjgF0fqvNbIwTizhXjbo/C4bOv
         DlYYsxF3iOmXGy83kDuH5firUy4EK9447AFPj8RsG+MJ30WcLb8PQNgcFhazOyRtdP9j
         HXzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=JvQlOyJ4;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=Md04OYaO4RUq60dpF4lR243+Ygyflr8gUY6aKsRWl/8=;
        b=p/fvvPuWz8zgIiJDkcwS8Tc+sgu5JkF5ZxkdOCrffzwNsEzYBsfo2Vj3lEGSzwFuif
         8jtNSaRB8ZV/VyEpiyrjJ4QFYaG87dpgXFiCG+V5dkQrCAhm0I9BjAdOojv6ZGzJHB9a
         aPBlcqnBc0ulghJ5mJRjIWWX0ckL3OUe3smWa7T2RzRbXtCvJK+dBVS4WcVh8Pyl3vis
         hRT45PCubVfVaPt4//bTyqfyOSxAElDpugIXx9k+5rX1Ob3/5RPD+sBAKJzHvCRm/dJu
         6UDkXJwDmsr1L5fv/FlcRXH8EHcG7j+6IjHO0jzkMjOTA9DEPTbMPf5oy+Y2dEd8dye7
         +JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Md04OYaO4RUq60dpF4lR243+Ygyflr8gUY6aKsRWl/8=;
        b=pHwg233xjTeMzqo2Af60HBnNhArDDVPivCUa7l20GfnjggKiFLSYqgOHIsMFXD2fvZ
         cm3278w338nDnNqaJ8JaMKIyPqognZySkdnwaFr37GcjvFcUA8ONqq+/isBteXNYHs2/
         EHapc+845QOqZ4683dS0+bwxbEOssKlep6iWHylyEl0rU7fzJ4EFbOVTaYaA59yzV6Fs
         jX/E46eZ9FgAMYmRT5ELbyaNfsizglCdSXwrzfS1yMRIfDnulICy5DL1OIZ4IIYBRduk
         DNdQnTiR+hYOqMJwAHGSSnvvWxP4ICTLGg+lLa7ykjAx/6p/jL3y5NLCWvZzPGrL4uxe
         yEHg==
X-Gm-Message-State: AOAM533Flzi+96jkuW/13/oezKK4OyC00bewvTbQSYmGKFRaHq5X6a38
	44+DOETl8f5CHXu9CFjBF4w=
X-Google-Smtp-Source: ABdhPJzNPZNxl4ZTWOeREDJdzjhmsu2k99Tx0aoFob/lN6hcg8Yz5fqAiXT4sz48Kv3/CoTmEU1mXQ==
X-Received: by 2002:a05:6102:3013:: with SMTP id s19mr438603vsa.2.1603344926287;
        Wed, 21 Oct 2020 22:35:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:cf85:: with SMTP id f127ls20393vkg.9.gmail; Wed, 21 Oct
 2020 22:35:25 -0700 (PDT)
X-Received: by 2002:a1f:d844:: with SMTP id p65mr435324vkg.23.1603344925531;
        Wed, 21 Oct 2020 22:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603344925; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJsjTU9qkinLWNVOzbQGlT9StIjxP40iHJWUfTsF+IIQHg5rZq3Neh0oIgjiiywSLp
         9V4igJCNO2DmQQnrxvu4+wOGq8hvmEQgTSMDPqSNn8Pl7MOsy2dVCNWVnseArIoT7U3m
         XGjD3nh65PKNkbVrrJWe3ir9J2Vd1lgN3NGue2CPL3tqpdrZ2q/sU/OHSHth9Fjrk/QS
         PzB753v50FxsZcTc78HP121guN/ZTw6BUofmHddNSCun6UjwfmlDes/BwC5ZbumLmANS
         DIAf1uCXWPXBj3hTSnjjT0qBXSuSTnOAOYQXRw9Yb+m776flv+zHB3a+P2B/eZaAHm+T
         MDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=Tk3cOVM/FP4Eatru1S18oEhWSFPp7IbefB2ExGPbOG0=;
        b=mHgtx23z0RY4+4hzPDlUKic0AKZwZUQe7bhwFvH58CJf+8hMluD+CVxwfcl1zb3j6q
         6Ag40L+oUCitEyLKEgl94lJUGdsGzw1f8/kLljyulDocAZ4Ad8n8mreSxB3uU1hh9hbf
         aztX9CgD1FFkf3DlZOt+6RXHblxApWPjjQcQyHTd1SA75StBDFuRWB6kQWeMXLWJF01l
         qYDquBmNGnISjs8FrNjr5nVaXw8EjlLmv1eM8fKR4KDBJX/KYBn67Lpf5WXRIqniZTw5
         ssg7Z/ucIgwh62O7V07uEWbO6Tuava/W7IPns6CHgOO34V0wLH6k3xeptDnPdQ9G7tI0
         yuaA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=JvQlOyJ4;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id h2si28420vsr.1.2020.10.21.22.35.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 22:35:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github.com (hubbernetes-node-8cf92ad.va3-iad.github.net [10.48.122.38])
	by smtp.github.com (Postfix) with ESMTPA id 35EA4340050
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 22:35:25 -0700 (PDT)
Date: Wed, 21 Oct 2020 22:35:25 -0700
From: "'Andrea Bastoni' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/e636dc-e75cec@github.com>
Subject: [siemens/jailhouse] 5dd302: arm64: smmu: Handle arm_smmu_find_sme
 error properly
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=JvQlOyJ4;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Andrea Bastoni <noreply@github.com>
Reply-To: Andrea Bastoni <noreply@github.com>
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
  Commit: 5dd302c96c54f4407a5ce0ea698b79944f5ba8d1
      https://github.com/siemens/jailhouse/commit/5dd302c96c54f4407a5ce0ea698b79944f5ba8d1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Handle arm_smmu_find_sme error properly

Bail out if they happen during cell init - apparently configuration
errors. Skip the entry if that happens during cell exit (unlikely).

[Andrea Bastoni: Fix double negative in trace_error]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2101e5b84589ca82d926d88f3662e5896d731f77
      https://github.com/siemens/jailhouse/commit/2101e5b84589ca82d926d88f3662e5896d731f77
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Improve output during setup

Makes the output more compact, fixes one missing line break and adds a
correlation with the physical unit.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9e42d85249af06b6a2a057671d5debba28e8067d
      https://github.com/siemens/jailhouse/commit/9e42d85249af06b6a2a057671d5debba28e8067d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M inmates/Makefile

  Log Message:
  -----------
  inmates: arm, arm64: Remove dangling include search path

This was obsoleted by splitting the inmate headers from the hypervisor
internal ones, somewhere around ce98ecaad89b.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 941569fef655e7f7696851b139683c083246380f
      https://github.com/siemens/jailhouse/commit/941569fef655e7f7696851b139683c083246380f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    A hypervisor/arch/arm-common/include/asm/processor.h
    M hypervisor/arch/arm/include/asm/processor.h
    M hypervisor/arch/arm64/include/asm/processor.h

  Log Message:
  -----------
  arm-common: Factor out common processor.h parts

No need to duplicate them in the arm/arm64 specific headers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f40bb3752fa4a33bbcbe8108aa37b88bc7a7dc1b
      https://github.com/siemens/jailhouse/commit/f40bb3752fa4a33bbcbe8108aa37b88bc7a7dc1b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c
    M hypervisor/arch/arm-common/gic-v3.c
    M hypervisor/arch/arm-common/include/asm/irqchip.h
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm-common: Drop return code from irqchip_send_sgi

None of the callers checks it, and all of the callers ensure that only
SGI IDs are passed.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2b752d23d40fc56c6e36af0cec9252dffa7f9785
      https://github.com/siemens/jailhouse/commit/2b752d23d40fc56c6e36af0cec9252dffa7f9785
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M tools/jailhouse-config-create

  Log Message:
  -----------
  pyjailhouse: Do not fail on missing date for DebugConsole

All readouts are optional, but then they will return empty strings.
Converting them to integer will raise ValueError. Catch that and ignore
it - we won't have DebugConsole information then, as desired.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ae63343fd302983ac1b36fe9b615daa742e2c88b
      https://github.com/siemens/jailhouse/commit/ae63343fd302983ac1b36fe9b615daa742e2c88b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Fix regions_split_by_kernel corner cases

If the kernel is at the beginning or at the end of a region,
before_kernel or after_kernel could stay None, and adding a NoneType
object to the regions will make other parts unhappy. Better construct a
list without any None elements.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ad188b3c1d177872cd57bd90f106288a031df654
      https://github.com/siemens/jailhouse/commit/ad188b3c1d177872cd57bd90f106288a031df654
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: vtd: Fix interpretation of redirection hint

Reading the KVM code of Linux and re-reading the spec, multiple times,
it became clear the RH only controls whether one or all CPUs of a
potential target group should be addressed. If it's set only one is
chosen, via lowest-prio, but that is done by the hardware. For us, its
state does not matter. We always consider a multicast scenario, thus
simply ignore the state of this bit.

This fixes startup errors when DH=1 and RH=0 of the kind

FATAL: Unsupported MSI/MSI-X state, device ...

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b9db8db073aec049f042c13401a9a529c236f5e9
      https://github.com/siemens/jailhouse/commit/b9db8db073aec049f042c13401a9a529c236f5e9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  ivshmem: Expand MSI-X region to full page

It's a bit wasteful, but the alternative can be that the guest moves the
region close to a physical one, and then we need to start configuring
sub-page dispatching. That is first of all a source for mistakes
(specifically in combination with generated configs), and it may even be
suboptimal in case exceeding, full-page access on that physical region
would have been safe.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6f01f5b95f9815e9a627776ff748bb1b3862c563
      https://github.com/siemens/jailhouse/commit/6f01f5b95f9815e9a627776ff748bb1b3862c563
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M Kbuild
    M configs/Makefile
    M hypervisor/Makefile
    M inmates/Makefile

  Log Message:
  -----------
  kbuild: Set -Werror in all KBUILD_CFLAGS

subdir-ccflags-y doesn't have the desired effect, at least with recent
kernels.

Reported-by: Jan-Marc Stranz <stranzjanmarc@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 72cf271c9bd88922682c60583a6bca3bf15deb0b
      https://github.com/siemens/jailhouse/commit/72cf271c9bd88922682c60583a6bca3bf15deb0b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M configs/arm64/ultra96.c

  Log Message:
  -----------
  configs: arm64: Add SMMU configuration for Ultra96

This only lists the SDIO interfaces for now - more isn't working with
mainline so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f2cd6f0587242c564c554c1f6dcdcecbd62a0845
      https://github.com/siemens/jailhouse/commit/f2cd6f0587242c564c554c1f6dcdcecbd62a0845
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/paging.c

  Log Message:
  -----------
  arm64: Cap parange at 48 bits

This is the limit for 4K-paging which we rely on in Jailhouse. Make sure
that, if we hit support for even larger sizes, we still end up with this
limit.

Reported-by: Chase Conklin <Chase.Conklin@arm.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9115ccc93fde0f14b00bb7aba85d6ad4254a0be5
      https://github.com/siemens/jailhouse/commit/9115ccc93fde0f14b00bb7aba85d6ad4254a0be5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/include/asm/paging.h
    M hypervisor/arch/arm64/paging.c

  Log Message:
  -----------
  arm64: Introduce cpu_parange_encoded

Keep the encode parange value as well. This allows to use it directly in
VTCR_CELL, rather than re-encoding it via TCR_PS_CELL. It will also
allow reuse by the SMMUv2 code.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4d0485bb65fd4c78f3248d55c4271ad74773f745
      https://github.com/siemens/jailhouse/commit/4d0485bb65fd4c78f3248d55c4271ad74773f745
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/include/asm/paging.h
    M hypervisor/arch/arm64/paging.c

  Log Message:
  -----------
  arm64: Simplify get_cpu_parange

Array lookup is simpler, given this input-output mapping. This also
obsoletes a couple of PARANGE constants.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2833e410afb1aa4b97de56bb43c89b4a8800fbc3
      https://github.com/siemens/jailhouse/commit/2833e410afb1aa4b97de56bb43c89b4a8800fbc3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Deny transfers by default

Make sure that DMA transfers from unconfigured sources do not sneak by.
This is in line with the access policy for other resources: Deny what is
not explicitly allowed.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a76ffdce71cb370c30c35c25b1c43a8a5ea56b10
      https://github.com/siemens/jailhouse/commit/a76ffdce71cb370c30c35c25b1c43a8a5ea56b10
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop test for non-zero base address

Setting type to JAILHOUSE_IOMMU_ARM_MMU500 already implies that the
entry is valid.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ad6b9b1abc82fa857ad2dd63a476859a29c5e47b
      https://github.com/siemens/jailhouse/commit/ad6b9b1abc82fa857ad2dd63a476859a29c5e47b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop useless features initialization

This field already comes zero-initialized.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6b8dbad8dc3d64770e1b8048b2708b82e04f370e
      https://github.com/siemens/jailhouse/commit/6b8dbad8dc3d64770e1b8048b2708b82e04f370e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Clean up arm_smmu_find_sme parameters

Just pass in the arm_smmu_device, rather than the mask associated with
that device and the device index.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b3af35bcb954cc845a71e3cf569b9ec4219b8a9d
      https://github.com/siemens/jailhouse/commit/b3af35bcb954cc845a71e3cf569b9ec4219b8a9d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Refactor smmu device setup and usage

We only need iommu_units from the system configuration during setup.
Afterwards, we work solely against entries of smmu_device.

Rework the usage of the latter by filling the smmu_device array
independently of the iommu_units and iterating over the former later on.
Introduce an iterator macro for this. Helps to simplify the code.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b7bb6120b3505b670e6940c4982bc22d1344797e
      https://github.com/siemens/jailhouse/commit/b7bb6120b3505b670e6940c4982bc22d1344797e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Fold arm_smmu_free_sme into single caller

Simplifies the code. Also removes the test of the return value which was
always true.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ffbcd510f21bbe121b709a09f412ae4cda640df4
      https://github.com/siemens/jailhouse/commit/ffbcd510f21bbe121b709a09f412ae4cda640df4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Replace for_each_smmu_sid with for_each_stream_id

We already had an iteration macro.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 071906b8e41c9f7efd955df86e47acf037872a49
      https://github.com/siemens/jailhouse/commit/071906b8e41c9f7efd955df86e47acf037872a49
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Make sCR0 write-only

There is no need to preserve existing settings, and reserved fields can
always be overwritten by zeros (Should-Be-Zero-*or*-Preserved).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 90073b893b232021f3df844c870df2466dadc486
      https://github.com/siemens/jailhouse/commit/90073b893b232021f3df844c870df2466dadc486
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Add shutdown handler

Properly disable the SMMU on shutdown as well as on errors during setup.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a9e34e9c9c2a81984e018b58a4c9a24aa6d055b4
      https://github.com/siemens/jailhouse/commit/a9e34e9c9c2a81984e018b58a4c9a24aa6d055b4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Tune output

Reporting of the number of configures stream IDs does not provide any
value. Rather report StreamID assignments.

Convert two unlikely error outputs into trace_error.

Furthermore, report "stage-2" consistently.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0b587bfb97bcee2933a626a682ccfcd18ac91b12
      https://github.com/siemens/jailhouse/commit/0b587bfb97bcee2933a626a682ccfcd18ac91b12
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Remove IRPTNDX traces

Not used with SMMUv2, which is what we focus on.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 540ee6b59682364bd01e3dcc1a47c49d9a799a7c
      https://github.com/siemens/jailhouse/commit/540ee6b59682364bd01e3dcc1a47c49d9a799a7c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Remove bogus Extended StreamID support fragments

We do not use the extended S2CR / SMR registers, but we enabled extended
StreamID matching when it was found. That would have broken platforms
carrying this feature. Remove all traces for now. Can be added properly
when there is a need and full support for more.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5c6cef4f99adcadd4681484d869b3e9b381cb8d7
      https://github.com/siemens/jailhouse/commit/5c6cef4f99adcadd4681484d869b3e9b381cb8d7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop unneeded includes

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: df21ea6cc6f83bce25023022e20931ca35afe2ad
      https://github.com/siemens/jailhouse/commit/df21ea6cc6f83bce25023022e20931ca35afe2ad
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Do not stall failing context transaction

We do not handle faults, e.g. by resuming them later on. Stalling
failed transactions will soon lead to a stalled SMMU, blocking even
valid transactions.

This could easily be reproduced by stealing a used StreamID from the
root cell. On the Zynqmp, this lead to all transactions of the root cell
to be blocked.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fa820f7cd8c60c87e67760eaf834addd8d43c435
      https://github.com/siemens/jailhouse/commit/fa820f7cd8c60c87e67760eaf834addd8d43c435
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/include/asm/sysregs.h
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Move S2CR macro out of sysregs.h

Misplaced, they SMMUv1-specific.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: aa4112076f4c20a3529469dc26004d3e9d17cee6
      https://github.com/siemens/jailhouse/commit/aa4112076f4c20a3529469dc26004d3e9d17cee6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Refactor S2CR handling

There is no need to cache the value we write to S2CRn. Drop the related
data structure and pass the values to be written to arm_smmu_write_s2cr
directly. This implies dropping arm_smmu_write_sme, open-coding it.
Still a net gain as a lot of boilerplate code can be dropped.

Along this cleanup, convert arm_smmu_s2cr_type and arm_smmu_s2cr_privcfg
into defines, only encoding what we use. There is no value in enums.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 36aa3def4cf4d27f832547f45b9430c986179f14
      https://github.com/siemens/jailhouse/commit/36aa3def4cf4d27f832547f45b9430c986179f14
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Simplify VMID and CBNDX allocation

Leaving VMID 0 free comes from Linux but is unneeded for Jailhouse.
Simply use one ID, the cell ID, for both VMID and the context bank
index.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f9db967278803d6b09811c9c3e73095ff4c35a60
      https://github.com/siemens/jailhouse/commit/f9db967278803d6b09811c9c3e73095ff4c35a60
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop write-only pgsize_bitmap

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5fcef354737d6abc6314f2cbaea465edb1e3cab3
      https://github.com/siemens/jailhouse/commit/5fcef354737d6abc6314f2cbaea465edb1e3cab3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop write-only va_size field

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e5c66ec55628aed5425da9ef051f159ef2b6a79c
      https://github.com/siemens/jailhouse/commit/e5c66ec55628aed5425da9ef051f159ef2b6a79c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Demand aarch64-4K paging, drop probing of unused formats

We are aarch64-only, and we shared the page table with the MMU.
Jailhouse uses 4K-paging for that, so there is no point in probing for
other format. In fact, we must demand ID2_PTFS_4K, otherwise things
would break.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 53f26d64a013c5d77fe4ca3e589a1e9b2dff13f1
      https://github.com/siemens/jailhouse/commit/53f26d64a013c5d77fe4ca3e589a1e9b2dff13f1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Fix CBn_TCR initialization

This was simply wrong: We must use the same settings for the SMMU as for
the MMU because we share the page tables. We can pick up VTCR_CELL for
this, just like SMMUv3 does, we just need to mask out reserved bits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 406847b5f1bc8ac66a8766ac026968221577b355
      https://github.com/siemens/jailhouse/commit/406847b5f1bc8ac66a8766ac026968221577b355
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop coherency reporting

We don't do anything with this because we always flush TLBs after
changing the mappings.


  Commit: c9c3c76714fb2c838a1d05469bfa701810ea7d20
      https://github.com/siemens/jailhouse/commit/c9c3c76714fb2c838a1d05469bfa701810ea7d20
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop stream-match feature recording

We keep this information via smrs != NULL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c3822548cbacd92955a25b2d8408ca7060974112
      https://github.com/siemens/jailhouse/commit/c3822548cbacd92955a25b2d8408ca7060974112
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop 16-bit VMID feature

We are limited by the number of context banks, and those are 128 at
most. That fits into 8 bits.

This obsoletes the features field in arm_smmu_device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e8998674ad372a764e233bb07ca422add50333e0
      https://github.com/siemens/jailhouse/commit/e8998674ad372a764e233bb07ca422add50333e0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop dead ARM_SMMU_OPT_SECURE_CFG_ACCESS

In Linux, this is set for a caldexa device which we do not support. So
ARM_SMMU_OPT_SECURE_CFG_ACCESS was never set. Simply replace
ARM_SMMU_GR0_NS with ARM_SMMU_GR0 and remove dead artifacts.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: aeec874d7f9fd8572403daa7a8cc1c98ba65a02e
      https://github.com/siemens/jailhouse/commit/aeec874d7f9fd8572403daa7a8cc1c98ba65a02e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop dead arm_smmu_test_smr_masks

Nothing was done with the results.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f5e1b9f8c245c6d26781ad0305fb4ead494d6411
      https://github.com/siemens/jailhouse/commit/f5e1b9f8c245c6d26781ad0305fb4ead494d6411
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Fix TLB flush on cell exit

We must update S2CR and SMRs first, then flush. Otherwise, TLB entries
might be left which refer to the old settings.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c755d55f8911304ceffc91d346b55224d5f50835
      https://github.com/siemens/jailhouse/commit/c755d55f8911304ceffc91d346b55224d5f50835
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Disable context bank only once on cell exit

No need to run this sequence for every SID the cell owned.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: dafc85df4c4c244eb7096dee1ce97a367af56b1d
      https://github.com/siemens/jailhouse/commit/dafc85df4c4c244eb7096dee1ce97a367af56b1d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Introduce arm_smmu_disable_context_bank

This avoid having to carry the information if a context bank is enabled
and makes the code more readable.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 378bd54fc85a21a7276666e5944a1bd314328c17
      https://github.com/siemens/jailhouse/commit/378bd54fc85a21a7276666e5944a1bd314328c17
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Refactor ID0 evaluation

Use GET_FIELD where possible, drop pointless clearing of ID0_S1TS and
ID0_NTS.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1d80442d14746f5eddd019d94a9cd1187259c775
      https://github.com/siemens/jailhouse/commit/1d80442d14746f5eddd019d94a9cd1187259c775
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Refactor ID1 evaluation

Use GET_FIELD where possible.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6d6a8739ab948bf8f15525f0fd2734ed1e4df300
      https://github.com/siemens/jailhouse/commit/6d6a8739ab948bf8f15525f0fd2734ed1e4df300
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Refactor ID2 evaluation

Use GET_FIELD where possible, change to descending bit order.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: db96061a8d556270217f43891df9a695d5f9d338
      https://github.com/siemens/jailhouse/commit/db96061a8d556270217f43891df9a695d5f9d338
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Check IAS and OAS against CPU parange

Make sure that supported range of the SMMU is compatible with what we
need to use via the MMU settings. Bail out if not, and rather drop
useless reporting in the code case.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1d5995c026c25ab90338937ccf7ada9c94791b66
      https://github.com/siemens/jailhouse/commit/1d5995c026c25ab90338937ccf7ada9c94791b66
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Refactor ID7 evaluation

Use GET_FIELD where possible.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1f67ee94a861ccbb6d11f3d042e304acd6599c09
      https://github.com/siemens/jailhouse/commit/1f67ee94a861ccbb6d11f3d042e304acd6599c09
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Demand version 2

We only support version 2, and this should be checked during probe
already. Makes arm_smmu_device_reset a bit simpler.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ac39cd7a3d3652e113a25797f1691c8b98cf6c4c
      https://github.com/siemens/jailhouse/commit/ac39cd7a3d3652e113a25797f1691c8b98cf6c4c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Drop more unused fields from arm_smmu_device

num_s2_context_banks is only locally used during probe, and the rest is
just dead leftover from the Linux driver.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ce634b7d64753f1c4f14f29badf70f618512ed90
      https://github.com/siemens/jailhouse/commit/ce634b7d64753f1c4f14f29badf70f618512ed90
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Catch VMID exhaustion

As we map each cell on an exclusively used context bank, make sure we do
not overrun the hardware limits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 837efda3a43b5296dc342c0ea51d989256cca2c5
      https://github.com/siemens/jailhouse/commit/837efda3a43b5296dc342c0ea51d989256cca2c5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Rename ARM_SMMU_CB_TTBCR, drop unused ARM_SMMU_CB_CONTEXTIDR

TTBCR is SMMUv1 terminology. We are v2-only.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c5230ca2ae69712ba62e034d8738b5e0eca50ba5
      https://github.com/siemens/jailhouse/commit/c5230ca2ae69712ba62e034d8738b5e0eca50ba5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Fix CNn_TTBR construction

There is no VMID in CNn_TTBR - stop writing to reserved bits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 70334e24a61746d2e9c898658d211a59981e8655
      https://github.com/siemens/jailhouse/commit/70334e24a61746d2e9c898658d211a59981e8655
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Stop caching context bank states

Refactor arm_smmu_init_context_bank/write_context_bank to a unified
setup_context_bank that generates the required register values directly,
without the pointless indirection over arm_smmu_cb and arm_smmu_cfg.
This massively simplifies the code and improves readability.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6e83bbdf1c3547b246d76a5cc2a2b2af93f34f6a
      https://github.com/siemens/jailhouse/commit/6e83bbdf1c3547b246d76a5cc2a2b2af93f34f6a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Clean up arm_smmu_tlb_sync_global further

It still contained fragments of the Linux back-off mechanism which was
removed already. Adjust the loop counters to the new iteration count.
Will wait at least one second now.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 11262d9d19ae6e1c63964ca98a6a0d172be68f56
      https://github.com/siemens/jailhouse/commit/11262d9d19ae6e1c63964ca98a6a0d172be68f56
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Return StreamIDs on cell destruction to the root cell

If we stole a StreamID from the root cell, which happens implicitly by
adjusting the matching SMR, make sure to return it on cell destruction.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a938bf82470af09d4fa102fd144c74972d2b445f
      https://github.com/siemens/jailhouse/commit/a938bf82470af09d4fa102fd144c74972d2b445f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M tools/Makefile

  Log Message:
  -----------
  tools: Fix naming of tool in Makefile error

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 00e989b13fbcde82663e1ad08ae30ca1b44e9bc7
      https://github.com/siemens/jailhouse/commit/00e989b13fbcde82663e1ad08ae30ca1b44e9bc7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/x86/pci.c
    M hypervisor/pci.c

  Log Message:
  -----------
  pci: Tune error output format

There has been the request to prefix hex output with "0x". Also, one ":"
was missing.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e75cec8021baafcf6f0b6b5e7e64935a922c1f71
      https://github.com/siemens/jailhouse/commit/e75cec8021baafcf6f0b6b5e7e64935a922c1f71
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-10-22 (Thu, 22 Oct 2020)

  Changed paths:
    M hypervisor/arch/x86/include/asm/bitops.h

  Log Message:
  -----------
  x86: bitops: only x86_64 is supported, avoid picking the wrong default suffix

This was harmless so far as the only user panic_printk only worked
against bit 0.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
[Jan: clarified criticality]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/e636dc0a5d09...e75cec8021ba

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/e636dc-e75cec%40github.com.
