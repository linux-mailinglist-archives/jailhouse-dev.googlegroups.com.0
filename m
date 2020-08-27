Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBIH4TX5AKGQE3IEVJHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103b.google.com (mail-pj1-x103b.google.com [IPv6:2607:f8b0:4864:20::103b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD36254281
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Aug 2020 11:34:26 +0200 (CEST)
Received: by mail-pj1-x103b.google.com with SMTP id lx9sf2851849pjb.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Aug 2020 02:34:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598520864; cv=pass;
        d=google.com; s=arc-20160816;
        b=bRAUTlY1nBefNY/FD8kYc/MeoomfuskydtZHmYDZWTldv/66wSa/6QyG/IviFBhgZ7
         OwWUZdywtkQrgBttIDKBxAy8kRRfxKoqMRUcARm2Dm1lythdqtExfjlNoYwFPeaUcFXg
         MQ7RBBg+HoR5mITg2yuLk3Cc5h/NYq2DUezcihxJ2+1sj3eaU/2q7OCUFFcVLBPPxtKN
         Ntoz/+vFpUtP4Zm1hSgAaaXkzqaThSs0FiHAqHRbADtYLfDKDj6N/nOsthImvR2XOT3F
         q3jQ6SIyXCpnToW6YW12VTMegeNDJOrCw6O5kMQm20oj1yBHY0hTRyJRAh+LOOzgISOZ
         2PfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Se3/BrfWjARxRBVxF89TrfVRgD8jUWXNUPmAGyr+5Ks=;
        b=TbUVhbgPgdwc4HiXghN/4DpLgK9LvwK/ZuhH2+mrGWk7re9jLG6j5QORJd8AkDQWRr
         D8p/KpkHpbCNMKV18k/UH3PpzFHCH3uh062oL+a7cugpBtIcJQ0ukSQ6OxHTMIYeI/Ef
         1ufNaJ97R305qAD6lDalGzHc1Ia6qVD617BVLwGsPBWM79IWPwrBVSj8tSN7v//Fs5zK
         LWqGUDGQBkX5zdlOT1hGLuxpONB4z0euEnLd9ZW/2tZjpGtLiK5NjiGeZI2aXN0Ck2Fh
         NvUib1llAcl80wURnhtLaxTO9bNLFnKmbj1JrqpjLj41As2ckugthpP5mPApNHP8A61j
         NV1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=nFAijQhW;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Se3/BrfWjARxRBVxF89TrfVRgD8jUWXNUPmAGyr+5Ks=;
        b=Zkd9peJk+QgrEfdbGwB3ZQM0fCt/xQifpbiTelLOwvV+YvdhWfr9aEM2VcqNBzkk5N
         GiEX50xR5lmiSIEpTU9YypcJqrKbxDVqMoO4GZSdIPyUEgoZHg1QX9wWUYVTWlc145ta
         LQavkqkn0GUkU+nwnSOSHFFaIT/AWHlXpMuFxCRoYfCZIPOlS86JUpLThta9RrI3CP9+
         LEAlfENm/PA3de+h/PCRPZJHvvMq1PfnAx9qqWuWx8PMEmtlsB3c7iAcXiB5xOmfwB5m
         HNjJNR0cNDmoHFTRqdTslUbGvr0d5rUmPjpSdpZpBs6vWfew9y8WQArEGggPsGsBHgdg
         rlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Se3/BrfWjARxRBVxF89TrfVRgD8jUWXNUPmAGyr+5Ks=;
        b=Xc2AzGrsmYCAtiP3aM8497+G2IiOUszwaaF9OprvdOFzteOAxqMg+IIvcVs9H8OkIW
         jMhpst+exUykcsharIh/2NrVjCKG+1KE8Paj8cUJZy8kYZVeBuJp4qJ498GBVBwIOrnx
         w3V1zy7eFUE5LMjat0yOn724IFp/4E7iiJI5ba/RpmOWyT8nBqqTqsTvVZ673ASxgea6
         u+9DvL74ixqEx2B0SuB5HJE4DZgKcgt8Mv2Kz7b772Aw3f7NOUadlx0hZd5+hsVqXHdw
         UXi2eIyWqNlgq+2F+nnqNwIe3xc+sEq3f+LicBo2qCAec4wYgLX0jSmr8C1fQJaQxEgI
         IJHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530MTNkHHsqWZrJNebgi7c4oIWXraUaxhLVbYmlF62Mup9jF3JDF
	2Rvb1A51ugImZrTHLAk6AFs=
X-Google-Smtp-Source: ABdhPJxsFOGAtKFL++IKjk7gxB6+wZ8BKPOqa9QEIaOMVUFSDj5Gn349RbNRdmB5qpBLVbzOn/HDwA==
X-Received: by 2002:a17:902:b40b:: with SMTP id x11mr2288265plr.196.1598520864468;
        Thu, 27 Aug 2020 02:34:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:720b:: with SMTP id ba11ls954593plb.0.gmail; Thu, 27
 Aug 2020 02:34:23 -0700 (PDT)
X-Received: by 2002:a17:90a:fa0b:: with SMTP id cm11mr6025055pjb.53.1598520863718;
        Thu, 27 Aug 2020 02:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598520863; cv=none;
        d=google.com; s=arc-20160816;
        b=WkS3+Y5HomYxKpeqvd04HfvVXowLQ5cMKDzPqPyFcPnqBq14mz5Ff5GSrBM3eiEXdY
         J5VCaGszwVf0QwGt/Y4tjiV2Y6Xr9PMpaRIHsXIdPpijQEiYpSrYOdHMGAuUny4SfCW6
         w5GAscC8aFczrKmPZXvTEksYN2oAgj/hfUcM1GyqQq/gYnOsVKasZw9RWCttaZVKDq76
         BxbO0hkfti96aZGdXnFQz9+P+nFr+EDvNf5lSOSJU7tXwwM1dBV4VaSMuhcBklxZM6KU
         2l8Vsf/PeRUy8N2hSLIfOZUq9bhA5S394UQvSAlDi0bRjaYSyhoQJyqss26gu8ttRwZt
         WXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=w5jzQ8n+US23OOFn48k7ss+OUwlXkBN4kw/h8hpLE5U=;
        b=CfCxdUWHVfUMQJ0t39qrRnvBOBBtpHGdrWn3bWxKKYjgKqm9ei8LHXuRkXX5FRhhxL
         xiwcfHiCZ3lpgVfh3VmMobmAmULVtSLQBfT0Wc4xezVPPK7AFDi6zdqtEsGQQp6Wv/s6
         J1Tlz7uhg6oXgsLqwzz6O9yrfXhVf3aXcilY6vs0MpgycW5H5DZ274cipIEX7MVUeSsI
         jNEeFR7zEg/6TaFwSMIPUH5TVmI5CjGqv8l9hAvkzoidCJQywQYZyKHrXAh1/ZfuMKNT
         3yZGyrdXLng7L0En3aYBkxOmQdu7X0YAqkQwi5ndJdAFXlpR/jbKOFcL9CUZJ/5ePcf1
         uNfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=nFAijQhW;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-25.smtp.github.com (out-25.smtp.github.com. [192.30.252.208])
        by gmr-mx.google.com with ESMTPS id o185si111412pfg.4.2020.08.27.02.34.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 02:34:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) client-ip=192.30.252.208;
Received: from github-lowworker-d31a065.va3-iad.github.net (github-lowworker-d31a065.va3-iad.github.net [10.48.17.70])
	by smtp.github.com (Postfix) with ESMTP id ED31C84019A
	for <jailhouse-dev@googlegroups.com>; Thu, 27 Aug 2020 02:34:22 -0700 (PDT)
Date: Thu, 27 Aug 2020 02:34:22 -0700
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/6d7eed-7bcab7@github.com>
Subject: [siemens/jailhouse] a8d033: Documentation: fix display resolution
 number
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=nFAijQhW;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.208 as
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
  Commit: a8d033c65dbb8667fc795e16aa4ce60dd45b18f0
      https://github.com/siemens/jailhouse/commit/a8d033c65dbb8667fc795e16aa4ce60dd45b18f0
  Author: Daniel Sangorrin <daniel.sangorrin@toshiba.co.jp>
  Date:   2020-08-27 (Thu, 27 Aug 2020)

  Changed paths:
    M Documentation/debug-output.md

  Log Message:
  -----------
  Documentation: fix display resolution number

I was wondering why the configuration size didn't match
the multiplication and then I realised there was an
errata.

Signed-off-by: Daniel Sangorrin <daniel.sangorrin@toshiba.co.jp>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7bcab7c38b2c853ec068b35d61205ef660fceaac
      https://github.com/siemens/jailhouse/commit/7bcab7c38b2c853ec068b35d61205ef660fceaac
  Author: Jakub Luzny <jakub@luzny.cz>
  Date:   2020-08-27 (Thu, 27 Aug 2020)

  Changed paths:
    M configs/arm64/dts/inmate-rpi4.dts
    M configs/arm64/rpi4-inmate-demo.c
    M configs/arm64/rpi4-linux-demo.c
    M configs/arm64/rpi4.c

  Log Message:
  -----------
  configs: arm64: Add support for RPi4 with more than 1G of memory

Add the required memory regions to support 2G, 4G and 8G RAM variants
of the Raspberry Pi 4. Tested on all the bigger variants, not on 1G, as I don't
have one on hand and it's not available anymore.

Also moved the memory used by Jailhouse for the hypervisor and cells from
0x30000000 to 0x20000000 to avoid conflict with GPU memory. That is fine for
gpu_mem setting of up to 256. The memory is supposed to be reserved using
reserved-memory node in the device tree.

To support variants with >2G RAM, the PCI MMIO config space was moved into the
ARM Local Peripherals address range, into free space behind the GIC.

Signed-off-by: Jakub Luzny <jakub@luzny.cz>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/6d7eed9ccf14...7bcab7c38b2c

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/6d7eed-7bcab7%40github.com.
