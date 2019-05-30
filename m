Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCMWX3TQKGQEAQC3QRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63f.google.com (mail-pl1-x63f.google.com [IPv6:2607:f8b0:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BDA2F812
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 May 2019 09:49:31 +0200 (CEST)
Received: by mail-pl1-x63f.google.com with SMTP id c3sf3412962plr.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 May 2019 00:49:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559202569; cv=pass;
        d=google.com; s=arc-20160816;
        b=XburgKyN+PM0afIXalel0TC6keJuYZbpnMnlRfH+3JEZKpBDA/wJQE7fOh1Scvx77j
         yE5BVyxHgtiKVTtckdTUEzFkuKaUEJ0gq+aaAnvdy5EH2eWYc4Wj1yhvGVkB1gcMSF5+
         YxOOssfFlDv9pMivR0ULg2HDzqZJYICbb9GwT84Oa+oqGLRWeBdYLR9YRhfSSb1d19sw
         GvM6qIW2n0jKg/aqtTgkMGVhTwP+xXfo/5DO8fQ93g5XTbJLZHVIRiEXtOuP+mUElD8X
         g1haa93cAaCThomM4f5Z/+nMlr+8OtOga77cvQZcaZocHsIoDlt8rTB3BWT78zmE+y51
         ickw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=4aJdQXH93BT/xV5hrZISgbZP12WsBALbpH0E1ieLfw8=;
        b=pTgiQ1eOOTtA/4jjCoQm+4gbFol6IcK8BL7Rv2sEu8+JyHoa+rLLH7CRZmaGyQKBxS
         Lw0F3OBHSfyeMHdURo6bVvdTHmaDVPSmjGsoGRhK+LW2cdlHu4Waw63O1JfE80CYg7xy
         XVxqhgFBpf1ip7DoAa8QyTKV735iooBj8Rl6YjTcPcTOGZa+LSGZwt/NtxnIVcXu36BD
         P/hjMvI3Z6DAlZGx2g/sgxEdQDTt7JwLiXa1n9ScTheFnNCCFkjkWxJ0BJNTQMddfvDP
         whIPVC143uaN2thHTjl8LDhZCsNFRyhbFTF46kDqIX6zqflpAzWIeZBRYBJZXwzN/e76
         Yc7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=1UKBXg4R;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4aJdQXH93BT/xV5hrZISgbZP12WsBALbpH0E1ieLfw8=;
        b=aKDODAVYFs7PVu84ySXyl9gquclsohrLBF28Rh39xpjFmsv8Z9+IqVNBRbOe+WvKvS
         mvjrqLHrtkFT91a7MgAsikWFeCUKueIqINQPOatlKEXu7tjN9Sgbh3vcKwHvBSjXJrWg
         EjyN+HobMmJJqWqG+IDKwszKl35dS6H3QHpoJTWUMyr9PcmZdNe4Q8W1drCvg65DRIJ8
         EhtU/FCVLOoDUC3T61K2bfuq6vjZITsMpLNnU0HkAY2ULkk2pv5EYQtcdLwh5iUb+crI
         E3w4VDNOcg5DGwmOmvETGy8uM2c/6KwSF4/M8WvSDt4QUEdc9XtZe4aroraorPGloSkZ
         4d1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4aJdQXH93BT/xV5hrZISgbZP12WsBALbpH0E1ieLfw8=;
        b=a4y7YJ5bXwQjOpOApPBVFHhk5VvntNdDa3tP4/P26VTpzhCgFa9Bz79ouvB5L9DolK
         bf86Ax4uQYckZXWtWLXRxuuYyK6k0N3urU+bs9Ciix5ZGcdxMKkWH9UF8E9YubVfIROZ
         GJPmXEXa/DBa2iaJoriR5HkFFKEvlXSS3qrtMbEszM7pt6mI9b7pxx2iRPpy1zDZkT6q
         N5elRhdiinDuVT6kM2utK7aAKbNLnOaM0dD8HleNQfaulu6T0EigoidE9o/0Fe2nRn2q
         n/AdlcMp5UsJhGqAWc2XGk11nXjNujlqtFqMmfvN434G9qyKlyEQZNZmJcUwFoJWRf8D
         JmQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV6M7zyshzuObw0gEBdDfefuCJKqu02IMJTwM+WGBWqQkz0Pff9
	QWrjeNt3NCOTVL4Q36hRBtM=
X-Google-Smtp-Source: APXvYqyMGQABuM2cb1+6VsZGLPLxsvNusU9njJ4JvKiS7fpKbGqzShzGTRp6EXQxJRoS1c/y+HaDng==
X-Received: by 2002:a17:902:b201:: with SMTP id t1mr2537568plr.328.1559202569625;
        Thu, 30 May 2019 00:49:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:2d:: with SMTP id 42ls1124402pla.1.gmail; Thu, 30
 May 2019 00:49:29 -0700 (PDT)
X-Received: by 2002:a17:902:ca4:: with SMTP id 33mr2485321plt.107.1559202569079;
        Thu, 30 May 2019 00:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559202569; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3BSyXOnUdiwKrXGUlexpfs0jiolfyZC2118gOB3HkOt3H5pWN3FXL3mnoEYAq8bO5
         w/kq27JdAanUCfIfZjgen+cE7SFALb6w8SFrkGix1EHaLdvKVGWt70WlivRd44uWe+lK
         qKEue6QWuyGVareL0jpCmkfC+NY1xaMjXCHbYNMBUluWXlYEq1Q36JIXOFEUex9vAkIj
         GorJy3WCaZj04gR2J5/8nTQJD7/KxBVDie9/tzCuHNQmjBCxd+6O3xRYrZ93tpP+EC6A
         eHoDWwzb6EgabFMr5sY3p2TvHXtJvai9ozzQnuqmbu5p55bI8hgkB0lSsqBaDxCuRjee
         DcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=22ltQdSxZkl4dDxFgRCu3QG8wH57vwuTEvc4bvXNDpw=;
        b=pPVDE8hn+7U/PnPoFis9wvc94SKtIPkdlTsVZIBQzMLcePwTJ4mzcSoTApEgtSwtkf
         OqHWIXEapXUPDALDWQNcjJ5oR3Vs6Wbm6D2e6JVwI0gMTwuyDJcTDLblMyMDg1mtChtz
         rijGa3NF487smHhgnNqXIz+1O22MbQYOXvLMYjx5pRMRlGjmyHJBuAftNlpM3rO9jv4E
         NxGBnCVBuAaC+jIbKTKk9hXFxc0inTo/WwhLYBzkj4Egd56Zti77ova/+ZJKcK6Nh2Cm
         zaEzRzNomrNOAM2fNlhkfXwEku8tR7cOsbP2wFicKXsh/36YVQEJ5gQGAg8UG3b2zNJx
         w64A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=1UKBXg4R;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-16.smtp.github.com (out-16.smtp.github.com. [192.30.254.199])
        by gmr-mx.google.com with ESMTPS id e8si100517plk.4.2019.05.30.00.49.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 00:49:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) client-ip=192.30.254.199;
Date: Thu, 30 May 2019 00:49:28 -0700
From: Yasser Shalabi <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/f27a6e-0c3e5e@github.com>
Subject: [siemens/jailhouse] 2c86f3: configs: x86: Make Comm Region writable
 in all con...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=1UKBXg4R;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.199 as
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
  Commit: 2c86f31e947394b14aa23f1ac5b2672b1e0a8044
      https://github.com/siemens/jailhouse/commit/2c86f31e947394b14aa23f1ac5b2672b1e0a8044
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M configs/x86/e1000-demo.c
    M configs/x86/ioapic-demo.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/pci-demo.c
    M configs/x86/smp-demo.c
    M configs/x86/tiny-demo.c

  Log Message:
  -----------
  configs: x86: Make Comm Region writable in all configs

Since we report startup or runtime failures this way, we need this
permission even when not actively participating in the message exchange
protocol.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cc7c3b6c5b2473f4fc09d61f218a8bf00b43a887
      https://github.com/siemens/jailhouse/commit/cc7c3b6c5b2473f4fc09d61f218a8bf00b43a887
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M inmates/lib/x86/include/inmate.h
    M inmates/lib/x86/int.c
    M inmates/lib/x86/setup.c

  Log Message:
  -----------
  inmates: x86: Register IDT during setup

This will allow to share it between interrupt and exception handling,
both being optional.

MAX_INTERRUPT_VECTORS is introduced as public API, defining how many
interrupts can be registered at most via int_set_handler().

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bc75ae95de6346013d320dc85708aa737457de84
      https://github.com/siemens/jailhouse/commit/bc75ae95de6346013d320dc85708aa737457de84
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M inmates/lib/x86/int.c

  Log Message:
  -----------
  inmates: x86: Refactor interrupt handler

This removes one call level by directly dispatching the target handler
from the assembly entry and also doing the EOI from there - micro
optimization.

Also limit the supported interrupt range to 32..63 so that exception
handling can be established for the first 32 vectors. This effectively
removes the possibility to set an NMI handler, but those are not
supported by Jailhouse so far anyway.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d51321d5ed55d50057666d0af7c5ce1cc89d6621
      https://github.com/siemens/jailhouse/commit/d51321d5ed55d50057666d0af7c5ce1cc89d6621
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    M inmates/lib/x86/int.c

  Log Message:
  -----------
  inmates: x86: Add 32-bit interrupt support

Fill in the missing pieces to enable interrupt handling also in 32-bit
inmates.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b8fce168415c69ddcd210d7b5c862c07e59b3c91
      https://github.com/siemens/jailhouse/commit/b8fce168415c69ddcd210d7b5c862c07e59b3c91
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-23 (Thu, 23 May 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    A inmates/lib/x86/excp.c
    M inmates/lib/x86/include/inmate.h

  Log Message:
  -----------
  inmates: x86: Catch and report exceptions

Add basic reporting of exceptions that are triggered by an inmate so
that we stop translating all of them into hypervisor-caught triple
faults. Reporting is optional and need to be enabled explicitly by an
inmate via excp_reporting_init().

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0c3e5eb67e17102d501942d00df7c5b6166a4a60
      https://github.com/siemens/jailhouse/commit/0c3e5eb67e17102d501942d00df7c5b6166a4a60
  Author: Yasser Shalabi <yassershalabi@gmail.com>
  Date:   2019-05-23 (Thu, 23 May 2019)

  Changed paths:
    M hypervisor/arch/x86/include/asm/processor.h

  Log Message:
  -----------
  x86: Update CR4 reserved bits to include Intel Protection Keys Extension

Without this users running on recent Intel processors will not be able to
use jailhouse.

It is safe to allow guests to enabl this feature as it does not affects
the host.

Signed-off-by: Yasser Shalabi <yassershalabi@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/f27a6ec96016...0c3e5eb67e17

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/f27a6e-0c3e5e%40github.com.
For more options, visit https://groups.google.com/d/optout.
