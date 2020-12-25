Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBAXHTH7QKGQEU42L5WA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x640.google.com (mail-pl1-x640.google.com [IPv6:2607:f8b0:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F97F2E2C91
	for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Dec 2020 00:19:32 +0100 (CET)
Received: by mail-pl1-x640.google.com with SMTP id b2sf2773586pls.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Dec 2020 15:19:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608938370; cv=pass;
        d=google.com; s=arc-20160816;
        b=Fe2XEUwTZxx7x25b7lH0B+EbufySldmVq3H09Fsj0xT/A/wn4EOLvg+oagMFWZG3x7
         HdgULxahxWQdyK9n67+74AI3VpRI/6rHWSWbw7c/1D/fa5C9N/hkluzcU3Zw1oJTXZE/
         XMAw6LWXDTwU/C8LhXgb5Ec+dLxSRnublHTfG/ZiLYypjPy0vG4OATTurJt90BGwTqWj
         kGYgEDQfxRsB/6JEFkIS72BGfoACHhWx/0gMpIIdCgwipQBArHLkl+KlWxA257tbu2N0
         ktnZOUtXiH+W8AaVWpnfWQF08N9SrdS3ArHw5bAnTyC1+ZiZmHJM46zmJZi6Izu4i8Kz
         7lXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=6K5b1zQoTmgfk2TUSJxPunTigb+rXDLccHM82BrTVVQ=;
        b=WDPp0mG8NfgSEZNcpqmoYHwu/o6/LrXlwasMDq/aLBS3I56ANtTnfYc7LTcwD86aOf
         2BMOxKaCVCon1iJMHjSr1GrFICnsr+E/EsbO9E1sVsO49MQ+LhKwzz0w+/h+2WzvYYaS
         R944Hpwki3EUDdEGt3Q3uVFEZ8UnlFKJ+QqahWNAGybGqK+YSuhwM8rK5ALfBBOD/ggq
         Wo+ngHps0opdnjOSPOBkxsCU1qACyFKSpE0P0xriAJS+pq3WNZiFf1GB2Ik1LAGDF3ix
         BccBxyr5OkOxFmIuFyOlHby4MX4yP5i9JxuZc4vpa2xCAL3Ed7FLrRSukABF6nG0i4mw
         HEJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kWbsi3Mi;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=6K5b1zQoTmgfk2TUSJxPunTigb+rXDLccHM82BrTVVQ=;
        b=UxwK1GThdLWuxuTstOXFbJfeLMhu5IZM8eRB980AjmTIAsfSOk6ZpCFLBUAY0e4HbK
         cZdDILd0hoUCxJHtmJZl5rHetGWe72pY/hGLPztmE+8wegcPSPlh4/IyBW3g6zeuSRYn
         ajP+crC7QGuLqV/5zFXl/3wKPVdbEcVvAdkTeR3RCgXNQEXZYV+9hRKBXPdlSHKI7FUv
         /F2jYFHn1WqnhZHcNVtMIOvU4OmKisgQLOo/d4mosk6rNJ69svUnyWuPRksyIC2ay4M5
         o616+KoGWLd+mHD6Pz29BqhzNyKgu+leAOhl7rbHTImykuRPxdmXl4KnuxhYOyReSmAy
         7xAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6K5b1zQoTmgfk2TUSJxPunTigb+rXDLccHM82BrTVVQ=;
        b=W5UHR+hVWFPYIvZZ3/91VS9i7W+4aohr9V8fFVltD2W/QENwDob5Mb6jMix/lne8eW
         DQ0o6sjPh+zNkoQGqTVz+tPKdhAB3dXR1e2fYhh0MYr459pDYuLItzCMY59uJcVn/wEL
         gHRfzj9d+uYk7AChHeWJ8Pjp9BpEO8Z+hZ/FcvJ7PVt5CNT4/KkOWG56CD3hwfzy/4Ny
         c9dujLcPRa2JaQNHz6rHSJcVA/5GYUax0zOt3iUyskIBwdxVUuDIk77F+AAsWHSccbzR
         5K7rHg4Uti77388FS7+h1sg7m+YTXov5tsgJvhmWvM1XY4lSua27pyWp0tzgl7qBG2wu
         HNwg==
X-Gm-Message-State: AOAM530ZckQKj9JJuzjO9M0tqxWk+KMcRiHIJIaYZfwy7x1Eon/AexrS
	hzTt8Ryfb2qxfZ44trW0Rrg=
X-Google-Smtp-Source: ABdhPJxP0iig8rgU/DvG6Gu9QGaCaSELcQr4O+juynswMVDykmROMIobFNroWRoGrJvqmu+vFILf6w==
X-Received: by 2002:a17:902:ac90:b029:da:fd0c:53ba with SMTP id h16-20020a170902ac90b02900dafd0c53bamr34948026plr.23.1608938370701;
        Fri, 25 Dec 2020 15:19:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:9155:: with SMTP id 21ls20043245pfi.3.gmail; Fri, 25 Dec
 2020 15:19:30 -0800 (PST)
X-Received: by 2002:a65:4bc2:: with SMTP id p2mr26686282pgr.169.1608938369947;
        Fri, 25 Dec 2020 15:19:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608938369; cv=none;
        d=google.com; s=arc-20160816;
        b=RZH0srqylaUx4wbE+fT1yxjn7yPSVSnodGeot62tcS2PXjwglUAYuV6KA7c3ZDFTHr
         j3kVZ3NUSJK359GWocji3BMRjiFSFoqkp+o2Lys4saJXl7AxEVt3rSE/niYdJI7qHfje
         Md8tx9xbU05oHCtGisZzxYP+9NVvoiZMJJx5mSEvoU8j/iUJJjNApRNFtFS2cVZHVyXy
         7lsHHiOXaESAoWCr7hppAj/ZWPcx3EPjHo5cF1E1TNXmPN/lcIqA7Vb66Vnlv4f8XKRQ
         ARGTjtb5aAoMmIrARLw3fFa6kCfCJOnu+v0dJ4fjRnQXJNr3K/yTHBu7o9cll4KQaHjb
         +RNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ZHxIZRXvcthu4Tu82xYtqj0FhJanB5+jWqGLwY0+GQs=;
        b=UZkeDsxw1/O6Sf5Xie+0hEVuo7DtzRqzK25BxEXH8ImERhK4hQth80FH6kD1336wMZ
         wMzmAX6RJyBx9Qn4nliWZE87+tkeoz2cAJg6O2Xk9NfGe2cFdm8E9XB2PJXGgUtqtmRo
         AaZ3NsBbxT6QFDmKPzgebtVAXsHaFzaqOJshsY1yMDas+kY315f341UxIdCZU7HeGz2J
         aEX7ok+IPGvFvo+uX2LZJ8fTlO9l1KZ52gKnJb5owUZEvOfQCIpd6odP3ClXg2WbgG0S
         SNc8d6peIGdjiOoHpsxCpjPWoPWUZrS35f7A3BgCQu7L+s99MuYNWzBEbgzs8DgM4h9r
         5MHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kWbsi3Mi;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id f15si2354740pgf.3.2020.12.25.15.19.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Dec 2020 15:19:29 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Received: from github.com (hubbernetes-node-e778d48.ash1-iad.github.net [10.56.109.55])
	by smtp.github.com (Postfix) with ESMTPA id 21CC15E0064
	for <jailhouse-dev@googlegroups.com>; Fri, 25 Dec 2020 15:19:29 -0800 (PST)
Date: Fri, 25 Dec 2020 15:19:29 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/3ad66a-d9f658@github.com>
Subject: [siemens/jailhouse] e69184: arm: Enforce soft-float ABI
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=kWbsi3Mi;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.209 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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
  Commit: e69184339a05ddfcf4949db12f5606e7cce1730c
      https://github.com/siemens/jailhouse/commit/e69184339a05ddfcf4949db12f5606e7cce1730c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-25 (Fri, 25 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm/Makefile

  Log Message:
  -----------
  arm: Enforce soft-float ABI

Required with newer gcc as we may otherwise "gain" vector instructions
that are not supported by Jailhouse. This is analogously to the kernel.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1ea32307282e71282bb5cbf65af754abdbe3fbfa
      https://github.com/siemens/jailhouse/commit/1ea32307282e71282bb5cbf65af754abdbe3fbfa
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-26 (Sat, 26 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm/entry.S

  Log Message:
  -----------
  arm: entry: Drop broken attempt to restore CPSR

This is neither the proper way to restor CPSR (we do not return to Linux
on error via eret) nor is this needed (no relevant change to CPSR done
if we return prior to switching to EL2). So drop this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d9f658ba17fcef567a0b80d1a610a325c18c0e13
      https://github.com/siemens/jailhouse/commit/d9f658ba17fcef567a0b80d1a610a325c18c0e13
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-26 (Sat, 26 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm/control.c
    M hypervisor/arch/arm/mmio.c
    M hypervisor/arch/arm/setup.c
    M hypervisor/arch/arm/traps.c

  Log Message:
  -----------
  arm: Fix access to SPSR from EL2

When in EL2, banked SPSR_hyp is not accessible. We rather want SPSR of
the current mode. For writing, that means appending fsxc which selects
all bits. Reading means dropping the bank suffix.

Noticed via QEMU. Real HW might have done the intended access so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/3ad66a08f2e1...d9f658ba17fc

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/3ad66a-d9f658%40github.com.
