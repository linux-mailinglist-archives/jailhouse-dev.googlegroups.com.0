Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBS6YXPYQKGQE2LEVKPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1038.google.com (mail-pj1-x1038.google.com [IPv6:2607:f8b0:4864:20::1038])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EEA14A586
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:57:33 +0100 (CET)
Received: by mail-pj1-x1038.google.com with SMTP id m61sf5376105pjb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:57:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580133452; cv=pass;
        d=google.com; s=arc-20160816;
        b=pz9j4t8Vqu2EscEQYTvtFIrYhLofsXVKTcx0RmxNUAgjrtgxwZGap0R0ddPTjCRyqd
         96dydaLnp+mwiaq3rOGKVOrfmLcaSYGrNcCAYVL/v16WdG8GNn67qQdY191iaP23Nlzy
         pk6DJBrXNVjtTgdUc7IzRytubsvbnTaiM4W4oC7Ux/PmA+mWxKJ2bRwBgep/QV1HNWD5
         2SMx/kyxh4iOMzzbsy0LD1cPBu+mPdSSlTPUlijJGE3cu3w1dNk2NJbb2d/dqpFafdMu
         3df4fN/hu5KdmPzCoUwKXkC1nMA9UPfah+NZrFM3FgcqFi2mXhPyoGFtYoU+fKt1/J/R
         ELIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=uYtvh0In83RsTHhhZbNRaZBSB3fLxzwBOdNV4PCqurc=;
        b=HhCwd6gwgHfQMcF0k9CL7TOkLhh0XXYjrgpNsFnFnC0huBD6ao1Z1gPSJlNVbFzrrB
         J+IEI8Z+e92+D1SeHbIryQahmSrPGNK1PXjeMo9oh/jLyUipT89CFFdUKXIjzqvFkjfF
         LJh2tqzm4zP23XMX4aRdWqr2TiBzqwz3Qsb2hXn/MFrgrQyf+2QhgxfwvYyYI2qTj4PH
         iDvznnK2DS/kSwXSxjsfAJDOdru9AYCSEdcubtDj3qvHKnYhFOLP5qazd58BtXIWc64p
         d12EtdeOST22E3lkAghtbaLXssy06O0hrY9jO9g9fX6S9/anH+t3W9bRGsgtSJNaGm18
         8adg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MVFw4a+X;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=uYtvh0In83RsTHhhZbNRaZBSB3fLxzwBOdNV4PCqurc=;
        b=CV/Ox7cHyrzgwaGNbbZ3b749LeBUtAHSFFfwDmXT3Op8mIB3s6vwncFkZKwKmFzcYq
         c/wn1bETDaSCVlKY0NkgFvjzyn71NSBdDM/uP5Rt01+ecz5xXlm3VPB6UUuRQFPEnLbT
         k+WA8+MPlavDvJOYJRKWZaw9NULuJSW8XGBLo3rUk7tlcClzw/+m+TUec5dy9OFs0gbC
         NVXlPP00f+XC5Kvg6aYRh+7dOg4tYohkxuZOZUrokZrr5AqXCG93PTm0z2HqAN5C9sn7
         pfOEjz/AaiSeg5bhYtztm7uRPM8vw9GsbvXLK9IABcelry+PG9emXV2W6Cv8MG0ma9R3
         Scjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uYtvh0In83RsTHhhZbNRaZBSB3fLxzwBOdNV4PCqurc=;
        b=OYDbZpKH5ziyVD9QKkg2LkupH2YzePq3VCdEHiBoTMS2BYDC/wW2bUpWBVmlquPyrd
         9aq43SZ6wQjPs4UdKrOOI5xByqzOB2beNzKrQ88qpNTX7XfLr2VJCStwZssTwFzN1pmV
         j8q3ZyU+sj8aHJAx1wIFsaygGZY/wOU+2/701Sw1LbdZs6rN4mxvqeUJuozLz29abGf3
         JjAiDROKW0AkBsBgqFpMMPWVFcObx6AW4WrYOMnSm1hRUzqj2+mSBnPpEleywnj52bw4
         X4Yos7hujb6ONJvbzVMPaJRGyFz29PuH5O3bPc1zMlncpoq/cZOtEaFWSvC7H73EpDEs
         4CYA==
X-Gm-Message-State: APjAAAXVu7DXt3Gt7Nv8+hUDFMubuLECYJJv94T1VZ0exMMOF28ter24
	8nco6asckIBk7N93lsLIaas=
X-Google-Smtp-Source: APXvYqzS2cUQJTW7mmfapYVS72hCTYmSwNKwEqXjLrYRyputW5LpH7Y1PJEPaTVbOk2lZolSpIoRDQ==
X-Received: by 2002:a62:1dd7:: with SMTP id d206mr9054827pfd.148.1580133451823;
        Mon, 27 Jan 2020 05:57:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:b601:: with SMTP id b1ls4323867pls.3.gmail; Mon, 27
 Jan 2020 05:57:31 -0800 (PST)
X-Received: by 2002:a17:902:8213:: with SMTP id x19mr17561605pln.161.1580133451256;
        Mon, 27 Jan 2020 05:57:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580133451; cv=none;
        d=google.com; s=arc-20160816;
        b=JKXx1AZcn0+hdq3ovQYHEg9rLLSkZveT5OiX/XcoaPZlR7JQlz9y3x2WM6XxLpXuBr
         0a6Zmgb2ycVpvf+BKwxTx1G0aqMxg9VYyMmBm7K9cOPya3mcaAdQFE2leWoA0N9i1bGm
         7FUDj/iNgOd2yWeubHf+uCW6SRpZeaCRkYKwUNB2BEL9yjoQxx6lXAtboPqqGjTtzByE
         bonYqnfNF4x7tmiBaXeRhnQDdlcszimOlorzTlbznhSev3YVosYIklfpDCFo0SHjqpmJ
         PIuy4DB/q7sdgrZafqRX9Gq/Ocv4dhpDr90x+cIKN9uommA3CP0LjJQruFrweOF+AtQp
         dC3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mZmGYVjWZrxhUtsKPm8AfaqSrAqWp0RRrC13YnklAuw=;
        b=TNH/EAJWXB7UyNL7Ry6S1A6syaQiDAjzr4s72IFxsPOiDXEWcrSzE/af7igW8qE0/A
         czTVO3CIEu7Zm6BHeELxtjSTRqBxS0lvPM7h5aQi3Yv+tF0SwNEd3v4AhIIfU10tM8Ek
         7UrBFtsuKzzkGeWHa/CLSRuXqGqnAUv0hYJNZmKUVd4mlvek2MiFGx1U2YzFD7JknDb9
         xlEmoj6U25bbA2fd8v3+CBBafPW/mseGBlqGDAwu8LVZQs7WPX3yEjgsOj5KYFuC0oMX
         y3cRvqKODh8hMDcHeaQmcumCPbOel2p0P8Q9PkTsBkH5srOBknFZzvvnZqpaFF16e+J4
         eBUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MVFw4a+X;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id f31si268012pje.2.2020.01.27.05.57.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:57:31 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RDvUkX020430;
	Mon, 27 Jan 2020 07:57:30 -0600
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RDvUJb012763
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2020 07:57:30 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 07:57:30 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 07:57:29 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RDvS1r090460;
	Mon, 27 Jan 2020 07:57:28 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [RFC PATCH v1 0/4] Add support for partitioning registers
Date: Mon, 27 Jan 2020 19:26:07 +0530
Message-ID: <20200127135611.21302-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=MVFw4a+X;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

This series adds support for partitioning registers across different cells
in the Jailhouse. Jailhouse supports partitioning memory regions; where it uses
MMU mapping for page aligned regions and subpage handler for non aligned regions.

However, most of the embedded platforms will have common set of registers which
need to be partitioned at the granularity of single register. One such example is
the pinmux registers avaialble in many platforms including K3 J721e.

This series implements a regmap unit which allows to describe the ownerhip of the
registers using a simple bitmap. This scales well when you have to partition
hundreds of control module or pinmux registers.

Nikhil Devshatwar (4):
  configs: arm64: k3-j721e-linux: Add USB mem_regions
  core: Introduce regmaps in cell config for partitioning registers
  core: Implement regmap unit for partitioning registers
  configs: k3-j721e: Add regmaps for PADCONFIG registers

 configs/arm64/k3-j721e-evm-linux-demo.c |  41 +++-
 configs/arm64/k3-j721e-evm.c            |  15 ++
 hypervisor/Makefile                     |   2 +-
 hypervisor/include/jailhouse/cell.h     |   2 +
 hypervisor/include/jailhouse/regmap.h   |  47 +++++
 hypervisor/regmap.c                     | 258 ++++++++++++++++++++++++
 include/jailhouse/cell-config.h         |  22 +-
 tools/jailhouse-cell-linux              |   5 +-
 tools/jailhouse-hardware-check          |   2 +-
 9 files changed, 387 insertions(+), 7 deletions(-)
 create mode 100644 hypervisor/include/jailhouse/regmap.h
 create mode 100644 hypervisor/regmap.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200127135611.21302-1-nikhil.nd%40ti.com.
