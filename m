Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBBMTRLZQKGQEUW7C75A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEAE17C47B
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Mar 2020 18:33:58 +0100 (CET)
Received: by mail-ot1-x340.google.com with SMTP id w11sf1953059otq.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Mar 2020 09:33:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583516037; cv=pass;
        d=google.com; s=arc-20160816;
        b=y008CTuWS8/yvFZxJbZNWwlg6pnEtXxxO9bsZi0/oAOks453AsoZmd4RaEIoufd3Ts
         nsWCz37COZXGbvqep57exgx9HgjuP3Un6IECfSgZ7PBjlYv+eo/0RyNBPt/zsZCU4czn
         IC9anpCsmnCKOX3jrmZCGMA4le280pirERXrnr581lKsNHUYFqMMnxyCtYQixlo48Koy
         rF4oduWYot60XQg4o3Q/ketKOfUgSB7YbaYgcyjeUJeOMcpM2WJk0elETUd+L8BHf5fE
         P8WPhjeagbfaV/5nBMRjgz5/FvsGMw1rUwKdgpKwqrlT9lAgFyLpSHuwDDCHUJQZPRXO
         Y+Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=TQ+bxC0WZ4Nft5MWNLRX3yUgVoeK38/1+4uuB3bKizk=;
        b=Jy6/+uXBT6On8aAbenWt/7m1Ab7IG4gCcH6/moeHVMDK9yZTOAH5/RpRFk3u0OCskl
         kNjW0WRqeNgr4c0qkcVVZx99xDyFvQ9y/I0I1kplzxtUzesEWqdoMu9P/GaLCnUEtSEF
         YsN8zQP5WTJrsyxbUbDb4HegnUigVOSQmxXvKXu45j4RPTIMYPVA1JKYcjW0+xiSaN2E
         bpwDyqsvJT1uxnnU7/fCpaeKbHrnRccp3+cS98IT3xO+ioS+pJy6DhrS9DM0bKP0LpQv
         gBuoQAu1wVZ4TlIvk8r8Nk6wOlanQ7CsAFCi1ZUbrNRLKbyYnioqSibXEZiag+N2hV6q
         EUMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=iNpPs96u;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TQ+bxC0WZ4Nft5MWNLRX3yUgVoeK38/1+4uuB3bKizk=;
        b=pRy+7fGqKZ2F5qPTQcDVRkLf1vRVRFRExTRnh+eNAWLgn5X7YyWTkEKGRDZkv5Fsv2
         jIPCpB8gSseSr4DPGA2qFyHCMpmisAoZ5C9sHRenmiCRoFGsh9AwWu0NW1v176WfEZhw
         vEKBdMEwZjxqt4RuNvRvD6gqvjY8wvHeCCm14QbNQ7rDskxVRMsqpiEuCWs9yvaNYerM
         BjYP2BCPhRN64e6fTeLBcNel/yl6phfwgNcJILafVR6ueAqSZmcjwES2ykM1GFHpyY/I
         CP8YTUhtu9BogUZRU5KQH1Dnu3XjblJlfTRRqvZBJrM6tEc2LmPxaWzCKxHmeVVlIrqf
         Y24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TQ+bxC0WZ4Nft5MWNLRX3yUgVoeK38/1+4uuB3bKizk=;
        b=e9cMJLlDvcG2zaTwx/aD5jRLgx3AE/74JdFM99uEkXb9/cmEuip4FH6iiXu3DbHU/0
         ci4EjQAOzVF2U3PLVJQ8EDfHUFRRLyXAeKXZeW6utEF3z0aVnKKE1+IhkaoA+6si0PdY
         4e09WnKWTD0nlf637Cg2oLM8f0w4quzZ/q/tlyiOp6bpuwU1slvrYpWI6qiVmvO+ixOR
         gTFowiYUnB9XYx5vWGBg0yK4tmPGmPx2MfBWsd63PBSQQx3tu87wpAOr/DLIfxbwyzHO
         WLQSXltLsUkedZcN3Gw41kxeX0kEtv0ny84M+0usKjjsqPPsH2Myd3aSw2Ws1HYfOSf1
         NhZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2KHkUmYpbQPL27Zwwx2PcStka3DgJz59maA93yDMrAXHi4EEEp
	JHQR9Jn2Rc7yIvO5ff0DWB8=
X-Google-Smtp-Source: ADFU+vvRfe0+tlcVI2WE/yw7gfZAu1zvhByBlExxyOurAu7A2ZrV7J61PJiCC7JUbV/Rydu++wWqxg==
X-Received: by 2002:a9d:369:: with SMTP id 96mr3294529otv.174.1583516037320;
        Fri, 06 Mar 2020 09:33:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:1c03:: with SMTP id c3ls297885oic.8.gmail; Fri, 06 Mar
 2020 09:33:56 -0800 (PST)
X-Received: by 2002:aca:4b57:: with SMTP id y84mr3515877oia.16.1583516036751;
        Fri, 06 Mar 2020 09:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583516036; cv=none;
        d=google.com; s=arc-20160816;
        b=hlBHKKkkHa4O2PMn8w5ceiOSJh6f/7rN/MWHr2JUpuirk9Iqg4JQUDWxSsYp35fGE7
         dZWatm7SLm3IQQlx5gPXjoLfUPKpgcn1yRbsrGjV+cTSLWE05k0ozj0ocM4YwII1H3Yz
         VDW6hLWQnTwSO3Htd8vZ9ks/3vCx/dorfPH7zKP95i+hcwWSsnYlwHZUpbSOKfX4ffLV
         /mmAndSkYAoFnOWYcFIxK2XkI7DhRnOeamn+wafAcQUKvKpzY91UZtHi3CDPhRtcgrea
         9ejgc4NX3WlttWcqJ030K9nQZ4OWwwQqclkrhmFmR79Ss6YZqrcIt0BIPeG0EHR+8oIM
         VQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=5a+j9EEUktLY0ytVYIbl/Z68jEK/yMw5m7SCH4owUcg=;
        b=Q/Y4q3DkSGJd2RjQZWOT4ZPRk4IItHCgpwKb6cY3YXyh11NwS0u5qtz1nwKmcwEdqP
         KIXs/amC+V6zlkaxSWAbWWZe99eTDMzlnLG4Rgb1VHr30qRwoK/PcnIoHBLkPknoV6zM
         tLEBdv66StwGjxhpqK053jEgpEvj9V8Kkmn82JcGNLcMWfCGBa9h4Xma3QI6GsqSeTcc
         hGaW5yWwdaQ4s0gz65itnmH2WGmrnW/nExPXRCDck1d9p3JeqI7KPmXBiZDxsbUccjvm
         H8ZnZUqxWV0LCSpUjDfB6s3JscFWNZhPfH/gWkxziPLX4uyEnfcb+Lg5gSAUvikxLuuO
         ZsXg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=iNpPs96u;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id b1si146901ots.2.2020.03.06.09.33.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2020 09:33:56 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Received: from github-lowworker-d93c4b6.va3-iad.github.net (github-lowworker-d93c4b6.va3-iad.github.net [10.48.17.47])
	by smtp.github.com (Postfix) with ESMTP id 44C8E960503
	for <jailhouse-dev@googlegroups.com>; Fri,  6 Mar 2020 09:33:56 -0800 (PST)
Date: Fri, 06 Mar 2020 09:33:56 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/266ebe-368ff6@github.com>
Subject: [siemens/jailhouse] f91c57: arm-common: Get rid of arm_cpu_kick
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=iNpPs96u;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.196 as
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
  Commit: f91c57158100fa0b4586a3271dc2c27570d56be7
      https://github.com/siemens/jailhouse/commit/f91c57158100fa0b4586a3271dc2c27570d56be7
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


  Commit: 19cf7a61caaa793bb533d38b531519e703cccf49
      https://github.com/siemens/jailhouse/commit/19cf7a61caaa793bb533d38b531519e703cccf49
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/psci.c
    M hypervisor/control.c
    M hypervisor/include/jailhouse/control.h

  Log Message:
  -----------
  core, arm-common: Clarify role of spin_unlock before event submission

On ARM, the spin_unlock is sufficient to provide a memory barrier before
calling arch_send_event. On other archs, the implementation of
arch_send_event has to take care of this. Clarify this at the respective
call sites and the function documentation.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d2becb4a22a7dc85cb237014796862a50f4cfc6d
      https://github.com/siemens/jailhouse/commit/d2becb4a22a7dc85cb237014796862a50f4cfc6d
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


  Commit: 368ff6b2acb3f24ec5903db328d73f2c9d986601
      https://github.com/siemens/jailhouse/commit/368ff6b2acb3f24ec5903db328d73f2c9d986601
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


Compare: https://github.com/siemens/jailhouse/compare/266ebe6decbf...368ff6b2acb3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/266ebe-368ff6%40github.com.
