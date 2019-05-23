Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBQ5JTLTQKGQE6XBNV4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF4A27D00
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:40:37 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id g14sf5174455qta.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 05:40:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558615236; cv=pass;
        d=google.com; s=arc-20160816;
        b=e/m19PO0n+bs4WGolLaXNq9wzzAyqBGumP3A6mIL+P6d1DcXLY4kX1+Vaw4LQUH4U/
         I7O1Ixve7bOKMCQG/egUuX8ScubLArgQevneBfRnwer4OihxQX/WU207UOG7DAnv+bwm
         tIc1c3agGjpjtwMKi/Qaw42YIntETDcMYmCYgFSqnA/CkpjcIcfUHIh6dQ2I6KU8yjfy
         yusz9DbiP00lmCHfCsG2st6fWDPedTpGgZu4Y4LBDblslyc+9GZc1gSTBGAq+djnQsja
         KmD1FyRnB0HMbrM9X2utySazZH/OuWYUnmytPyseby2RlzlMKFw69TWSavJOCYs3Tziu
         Z77w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=ydZLvX6Zx13Sp703aG7UAO9obotmcle4+gXI35MR3Bs=;
        b=dippoTlNhx3o/SyUB2jN4eKilkSMBY+Chw848PdJtDKxOa18aGpDeC5QM0v7fy1/gm
         65+a1MCcsrxTnysQE/wpBZdbT7c84vxWnnLfN5lM3zuazfFDGWxBfwUIIQaMUAZfzitr
         kZsJXsriOeiMS29CAS+mXOwNmJsl79BpG1/RFhv73TzmiqoPnaqF9nikna0aisCOn+vg
         pjwH224xOTcK2CEKYI4gvkrY5Yub4ODWySZqye+pFWvwQ/MG3/FCZ1UbR97P+eu3WQmx
         rwhhAlrXb/uN+HHgbUvJNl+wU9PXq7pfJqB2cl4PzjwWq7lEx7QM1ekkE6CxaJRcdjo+
         s/dg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=OFDuNexr;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ydZLvX6Zx13Sp703aG7UAO9obotmcle4+gXI35MR3Bs=;
        b=epX6qVHVlmusOjn29poHdZiVf7yJIc/M6SzaOxEWXeaiOWWwLv8dhc/b6MzpMvX/EH
         bgU7/HtUFrWeHAmDbo9H29w2ectd5Vy6fO27Ay/QZgzAVHBBrSoA/5gnPHJEj14W7Q9L
         ds7bI3yKj/wXAKJzt1YmhRPfC+myKUdsQ/GyJxhDIt4mZkkpNwjbBLIU/hAwrMD7fyqW
         prhKBAWAXEWf4dhLpzYTDmkdNfjL6jlP1u1FjgTHFJVJXIm2QHLWbhr7qDvcDJCuUoEr
         xUTCMNMjsHiW7dZkf5CfHCwxhVSXXidKEpiVcilqfy/EF/tmMxGgEGuygmO5r/5QVY9V
         WObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ydZLvX6Zx13Sp703aG7UAO9obotmcle4+gXI35MR3Bs=;
        b=I13EYKss0xI0eQ5JOSO+BFbfEaq+BKUhlH+MAHbmPimkEcA62TNBvm2Kgu5w5DFRAL
         M68OiF4qlKV9pDWZL2x5OeuV5SNT/RwP91ncdxjWLSTFpdEfqYNujSLEg5b90mIIVQ40
         n3J8IHMErfmqKvpRplmh605A9K6gzxWU+D/bUbrtu4lCq6q9E9ohDJ5BthOiEYMmK44k
         so65kBcmb+DuviDWYI8qSSdMECMc2qnP6JNX90s5UEElESCBTyD7cdrgkSCJwTA+YjhF
         KGuFkeKSplSc7z99tglrtK7DPG177Hgasj3o7/Mg4jfe4SXUTLtaD4lTE63kdGoL05p+
         P4BQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWS9BZRcAlUfi9+Of0hbs8qhq4wW+xFD4Sd/JuJnwnSDPGntUjA
	mF5qX9fjeszRxUP5C3trUG4=
X-Google-Smtp-Source: APXvYqw70OympbMP6/7uhB1D5iBL9AwO3uwKRafYpcan7UiaIHGumRpq5p8JSl7FYNYDyr1Xi/rA0g==
X-Received: by 2002:a0c:86e5:: with SMTP id 34mr70024918qvg.201.1558615236092;
        Thu, 23 May 2019 05:40:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:99de:: with SMTP id y30ls1088269qve.7.gmail; Thu, 23 May
 2019 05:40:35 -0700 (PDT)
X-Received: by 2002:a0c:be87:: with SMTP id n7mr39651984qvi.65.1558615235648;
        Thu, 23 May 2019 05:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558615235; cv=none;
        d=google.com; s=arc-20160816;
        b=W+cXOjHqYf5t/9uEvVsWpEAQaYufi/9elFkn98KjwYIApq2lu+3NMYEixWIPov2WVc
         vH22QVOQQvjTpwg4xwfI+hWgpRHV+Xi7nX+cf9eHZsXmEFx9PzIeynoCHEj8dTysPvOw
         mnfXuENZmIAjms138YuFqQtS6N7NgIUmE1+mXRoOUoiZ2Q270m8oW4bX2cqRNM1+dtGd
         t9/7UTe/Q6lQfnmASvPYWMu8mx6xeNE7F24jEuDWL3rP+cLyzZTwEAtUWgNRRfaIQoK7
         0ZmuZ+XpO+kq6DhNhES+OIhs39T1ZvkRZdCx418KciorwAwo/YyM7uVP2DXnH8cmd6QM
         tRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=29ySWsZx3CejKLvkxc+o2g220AfzY2Wi+w7sV6LaM5Y=;
        b=nLAwXQ61Fd/jLMxaTiMAwBcLUYnvZOnbyN4PmMTl8gPRpuv6iP9uA7L73Jrf/mGVAV
         2uBBzBOgRgpgKHJVVlFMPq9YQ+tH8xCD8PaOZGhofl1iVBMuodyeKWz63P+IeGpFyYSQ
         EowhV52ia1bF8z8696jZxz9wSLZzHW9fjwPL9SV2p5bQqJSckQgJ3ukIH4koxcbwAjPO
         xPYFsKvpkVtatypwgJ+L0z+ScxWrWMIjwDh9rztf38Yzmn/hvJFk5kSzZr7uCrwSFm9x
         6IGsqsOugDx+kClKd2fIpSiWoDnOJGWrTYZwRw8lAXF4wmx0y4OO4NTAgZb9kDFRBvOG
         hv+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=OFDuNexr;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-7.smtp.github.com (out-7.smtp.github.com. [192.30.252.198])
        by gmr-mx.google.com with ESMTPS id v67si1597384qka.2.2019.05.23.05.40.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 05:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) client-ip=192.30.252.198;
Date: Thu, 23 May 2019 05:40:35 -0700
From: Yasser Shalabi <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/69941a-0c3e5e@github.com>
Subject: [siemens/jailhouse] b8fce1: inmates: x86: Catch and report exceptions
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=OFDuNexr;       spf=pass
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


Compare: https://github.com/siemens/jailhouse/compare/69941a22af55...0c3e5eb67e17

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/69941a-0c3e5e%40github.com.
For more options, visit https://groups.google.com/d/optout.
