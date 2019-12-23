Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBXVTQPYAKGQER3K5LFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23b.google.com (mail-oi1-x23b.google.com [IPv6:2607:f8b0:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B51297D0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 16:14:40 +0100 (CET)
Received: by mail-oi1-x23b.google.com with SMTP id 21sf4264044oiy.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 07:14:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577114079; cv=pass;
        d=google.com; s=arc-20160816;
        b=R2iljwynQgjUF+w5aqDfADX0hka6bFwgrfSIU14cCTQq+XXl4bXOuTfsuX+42DSUvK
         7oZgR44KXoJiTBNOXKTU5gHRGsK7uKvES4zPYJDXOMyEfyIAMAsLZtcIL/F2GqO/TEDr
         S44RoYXq1aSYZ7K2yzMxxdSGjqUmFExw5xzONlx8CgYm1vVxdhbfnRjDLr+WHu7fFwTD
         bMciF/hnK6e5yi73NTJWElkW6tUNBnHJYK/r2Azt0aIsSlIIHnRz8VKtjYoTco4gah0N
         iZ6Yu+6mDaAUR2CQJCT3Gex7hhcv3Gb1xjiFIYu/Waoc4ahrgItI8It9sm2D7rIFT/+4
         0wiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=iDQuiWx1N9knhDQSeBiq0D5cbkBOp2iBIthXu5Ir1wU=;
        b=VtoyWdLiPA7GNmMhAYFnFlOjuy3CySG+NIz9VcVA+9qjCSfo364GB7rzqS5dhbHt/Q
         +I8aYjt12ShIfchLqYH2/a1wLSXfFDVKChg3FyNo+81+TSjMaWhvlD7TWsmDdSRoOALX
         h8/VmnvPbRjRmVonzQK+7DcviatAKvgBPiI4ZlVycWe1X9zla+GFDLLr6agGVon02hSw
         WUU2i5hd+WLwY9KNfODI/DXsIX02hvs+LRJIotjdxK7TmKEYMYblJ/U0vuiYN7uJLkw5
         /LonRQeNtGq4oeCPYji5BMfnqEeR4x/tY55r5T6rNiQmmWkvvBta76wfpvn/Yppgzj9p
         NFCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WRcSEJb7;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=iDQuiWx1N9knhDQSeBiq0D5cbkBOp2iBIthXu5Ir1wU=;
        b=gL0Rnf0zcAPhB+WQWXKWvw5qj3uK4HkR2v114bUdPu+haCNukpM3kdnBw/K2XSLB7c
         8KQbMWhezaWl5JvkjM4dHCRKatY9ZFEE32s47CMmIFZL5pKJtQ3dnnrlG8WSd9NyopJ/
         7nTTRkrGTYXdTO/SC2DHQ+lKHptpcpPOqe9dn7T7GjIK7HFxZhDwUltKb9P94PG/3+7J
         4oqbhsy56MNYhpeqBBCjv6X0pzGjPsjiRf4NPyMMZVwtMt1k0J0aB7YyCmYlVQwSf1Mz
         FLdjAXOUmgwnq/H5YKuZWDLVUN5UJv7FxXCWAY+PiHAFrMpatYf4atQmp7ytr7pOt20H
         lr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iDQuiWx1N9knhDQSeBiq0D5cbkBOp2iBIthXu5Ir1wU=;
        b=TkSmO8fp5xKhDG/iiShA4Tu9oX49A4UVd/Qv7G0bhlfOBrrvP5I36NUOFQOAv6SAWO
         YLjZTaK4ZfUqTFip3TTyXMqorA6IZ/NL6ecDqbthW/ju+veobtsnezRgoVayMnjZ/6LA
         1g88xQ9N+/ijUhwr3dB/0wTTMuEJS9iIZfUBfDnYybkHR+U5bimsNZ/YQ+Bl34zlQOeA
         PG0knXr3dzs/32rhO9znlfY4QBiZAKRKRqFkBdzFRHlLCiEoYpF5la5fnBJAe01KAesn
         NpHBKSd/7LdrdO8nmFIC5UH05sT8jDDYI65iRKP++oSPB4Xv8Mm6htlmPWtnxdPeQLcO
         QEbQ==
X-Gm-Message-State: APjAAAXZ1F/CobB3P7gIADTHcMpRvXe85ZTILdnfgzpe+kfrovh3lVgv
	HoDnAnSGJn6gsgDBk5R1HsY=
X-Google-Smtp-Source: APXvYqy5iw7XZqmcQE+jmLngBGOjGRsgCKthsP/i4nf3qU2Awvov/8aJUYoxiJ4clNfOvd3M13DQaQ==
X-Received: by 2002:aca:59c2:: with SMTP id n185mr674747oib.170.1577114078863;
        Mon, 23 Dec 2019 07:14:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:895:: with SMTP id 143ls840659oii.1.gmail; Mon, 23 Dec
 2019 07:14:38 -0800 (PST)
X-Received: by 2002:a05:6808:3c2:: with SMTP id o2mr717188oie.145.1577114078429;
        Mon, 23 Dec 2019 07:14:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577114078; cv=none;
        d=google.com; s=arc-20160816;
        b=LsGw6wVAFF8PNMFW0kqX7+V3r/Fp3YjQAeIpdIjPh1X8rw5TlhYYKoLmgDnMYDANoD
         N8sbLFvxXRwvcdreDe4aMv89X3WDAtpuBGWdlN8EIWXtdWCMkE/0lx5zi2FhOGgTufxk
         XUkGx0ZAzDCH8SfjWtTU3GqkYxDN7W4+JQxBjWA16wXnr4pyJOH5v6QndFMVp6Q7DfuX
         nAHNrUqcGowYwnHjkiSl6VyZLjtfJph2bEzM0g28Box5l4YYVJV6Gprzu1oV8zm5GxCf
         BofMfWTFFxDSSOngl2becsObAXitVJEicmJS6ZmseOTUkQVmQjuX6R05AsC5HmUiCE5Y
         Z+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=PX2f8aaDzq7jyYe2Otd749BswJ3rI2hGZvw2dct/jPU=;
        b=TtpfT5vx8nxpb3mxhWKE05PKWBDhvxAeLn6qepWLKx14Uqza+b7SJGFygWI8j1db9y
         nGfyJsxgw1uSTVo3sQSANA7iHblcw52t/2Ft9KgS553AuZC0vQLZOFXnU3Vl3f5iKmkx
         7cDRFq9TdcBa1whWvE7/cJXFqi4X6oC0+qe3Lz8dBDJCPuVx9EBlxZZqiBwazaXYLqsa
         qkNUgZIXzMRHrltTEujNEbn5GS2QdbZOdNhtxxdPLsm85DeIspn9d/2N9PtSMRnsOXA5
         q3yUXKWrGn3UDki5Zf5BgRq2GtPDKuT1aOvZkXHbFfcP+tLnuWR08aYkSSpBSd8eXbK+
         m4ew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WRcSEJb7;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id a12si553286otq.5.2019.12.23.07.14.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 07:14:38 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBNFEcSg012955;
	Mon, 23 Dec 2019 09:14:38 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBNFEcvu018260;
	Mon, 23 Dec 2019 09:14:38 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 23
 Dec 2019 09:14:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 23 Dec 2019 09:14:38 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBNFEZ1P020577;
	Mon, 23 Dec 2019 09:14:36 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <jan.kiszka@siemens.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [PATCH v4 0/4] Initial support for j721-evm board
Date: Mon, 23 Dec 2019 20:43:49 +0530
Message-ID: <20191223151353.22495-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=WRcSEJb7;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

This series adds support for the Texas Instrument's j721e-evm board.
The J721E SoC belongs to the K3 Multicore SoC architecture platform
for automotive applications such as infotainment, cluster, premium
Audio, Gateway, industrial and a range of broad market applications.

Verified with the 5.5 linux-stable kernel on J721E common processor board.
All DT bindings are compliant with upstream kernel.

Nikhil Devshatwar (4):
  inmates: uart-8250: Add MDR quirk for enabling UART
  configs: arm64: Add support for k3-j721-evm board
  configs: arm64: Add gic and uart demos for j721-evm board
  configs: arm64: Add Linux demo for j721-evm board

 configs/arm64/dts/inmate-k3-j721e-evm.dts | 433 ++++++++++++++++++++++
 configs/arm64/k3-j721e-evm-gic-demo.c     |  72 ++++
 configs/arm64/k3-j721e-evm-linux-demo.c   | 262 +++++++++++++
 configs/arm64/k3-j721e-evm-uart-demo.c    |  72 ++++
 configs/arm64/k3-j721e-evm.c              | 363 ++++++++++++++++++
 include/jailhouse/console.h               |   7 +-
 inmates/lib/uart-8250.c                   |   3 +
 7 files changed, 1211 insertions(+), 1 deletion(-)
 create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
 create mode 100644 configs/arm64/k3-j721e-evm-gic-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-uart-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191223151353.22495-1-nikhil.nd%40ti.com.
