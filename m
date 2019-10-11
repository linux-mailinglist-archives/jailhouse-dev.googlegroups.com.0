Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBW4HQLWQKGQEENZCMZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 44031D4129
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 15:30:04 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id h3sf5746226edd.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 06:30:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570800604; cv=pass;
        d=google.com; s=arc-20160816;
        b=JicOxNmjXjsNwjR+brov+Ny4HdMlwuDrsWBBL2w/jcdesx5O86G1q9gRDp/27e2sDt
         hT+T/J4fgWjOIC/IKDEw2TnvRUEToncTrA3161gdj/+z7kJvhzBkZUWTDEtLtKdq8CiV
         wYGbrKmUg4TBoxWNXODFPRsupEZhB6//ao4uS7pJ1FPhzmDha+ws+4OlTjNabAUDorcs
         cdHngK9akhfIzCp219hG9lLbpOqPOggOVS7/v7uX2JOgcFVAL5q4ajFdLWS3BO+25M8/
         v/PbQCqC+RyCU6CMkt4EhSBesv1CU9ge3nhQYgo9gnBYnujvD2/WQjImut3ZXHG0g/wV
         5VGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:date:message-id:subject
         :mime-version:from:sender:dkim-signature;
        bh=Alh5RaOAlakTtmR0DLeqTWxE+JeTq8xy3KhTSTHcGIU=;
        b=g1ZE6Dd11q0xmwgpO9DH/Jl9D6AmSEohWwZeqizKccezGx0RP9ehxhprGgSDQjrxoF
         rFkMt+aZ6oQ9o75RYf2OkMWCxK0dY1YSD+2iWETBDBnhpIBB73OvSHbbMfQHh9fcXARa
         7E73z3uJ0UnA+5mnUbVCy6Z0C+d4TlNBp6KjWidEMlJbnRh4ktp1hN/PWvd9oG/raBfJ
         sIMBwQtSKHIMsavNq6FlFSgAcs1ccuX0PsOHHnQde2b1xWmWkbgI/gMr0gNU77hQcM2F
         YNRMCysmqPhH5WtBss4uro0R0KHEBqBW8DKx89QGxHmFoiFzBcoh5GK5evUo1iniaxJY
         FLCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=IQTB2D4i;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:mime-version:subject:message-id:date:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Alh5RaOAlakTtmR0DLeqTWxE+JeTq8xy3KhTSTHcGIU=;
        b=TS6HrnNqpH4CrBdO7dgICFJDaslyhbAdx4c4PeGJ4tt5DIwgDEOWyE3mTzH80hW9Jc
         u2g9oJvR8j0Jl8fZ35CdAgFNuWris5j1ZoA4Bmt0qiWkVzTjf273SsJ400GbzjQEdBDt
         ljaljA3IwvrhaR/R9m+aw+8l1KTz7Kv007ctVXbeYZcUTGWiBup3rLa/RRlxuf0vpPH5
         /2GfgRPR/n5IbNYb//XjFvtZTwxPgIajitKw8rv998Z2hoDTSG3b0nxHT6im5oj7TqGz
         dEcSRgiMsyMw12o8hTEeoa+r3Z0xWClCMzw2BFXF0gmUawTpzI70vpyoqh6HN4sAwbwa
         LMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:mime-version:subject:message-id:date
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Alh5RaOAlakTtmR0DLeqTWxE+JeTq8xy3KhTSTHcGIU=;
        b=NmvzUztlJLNxQSTX1wuxezVQPTzT4m8Pk3lQLGflmTg5P2sakUIwg2xqOBa5WmA548
         GBbdgmYY+M3EvZEugpGezWI/wdrWeYBdDaexFOEFD9QtnrlLG7KoRaPvJ0nILeiDfYRF
         kATKrjobXUj/006JI9QViLlJ2iQymuwS2ZGxfQheNYHf9X2DnqhlNJj67p9gaePyKSrq
         WA4R0wM4YJQQ8QZCKBcpjf6Jq24fe3qLjqYBCS2K/37Z+gQvqpkslhtLhqJcdW1aRHbm
         GTclc2VWo0sFQtQPYmBEbql+oIGNStLVd8YES3TXSlv0wCMEHP+yjAP4BdhFbF+XphM9
         Ep4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVrO0yld9erEmBNazlnoVUx4jAxfyjRTbXfzrizif87pAmVCnx/
	sVbsfjrGX9e/A5q/v2m1Eko=
X-Google-Smtp-Source: APXvYqylGU36uNewb1r0EheG2NpqiXrTm9YtYDqV5TkzCNP+QSTAhzPzlWHJnnxn/SReV0Qne6JlRg==
X-Received: by 2002:a50:e409:: with SMTP id d9mr13381441edm.254.1570800603967;
        Fri, 11 Oct 2019 06:30:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:f11b:: with SMTP id w27ls1741574edl.1.gmail; Fri, 11 Oct
 2019 06:30:03 -0700 (PDT)
X-Received: by 2002:aa7:de02:: with SMTP id h2mr13542421edv.212.1570800603315;
        Fri, 11 Oct 2019 06:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570800603; cv=none;
        d=google.com; s=arc-20160816;
        b=fUdsclInfBaHVWoyZ34kg4Abgrx3PDPZmSo7j6AeEktAUHH7qd5xkrndhbYBvTxDZ+
         dnNco6+kIxLlSkMThhq6lidRirqHfJsN9rtQkonQw+TLTbMGEjPG1fdkvAfFvnsd8+Vc
         w2Dngk2acvJKNN62ft218lteil9O5a/hSo6+vJPK3pfx/T3IFVge73mYPLx6ZcN4XSIV
         IC6Pn4H49ZDDYkXFuMSCyoSRzArG982mEaF7dYQwfoEEeNEVy1tUkDLRuC+vHCZzn+Ln
         m083obXx0Ux8QVAuPUBURBKzSFCXy8cA1BnyOJKJh//4ObRqXKf9FASRYXxQstAv4yXv
         48OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:dkim-signature;
        bh=WaUoHShpVTuzIR1Vv1sMmImkrMn+8ZcgllvyS16Znqw=;
        b=J1KCC3lH6xPyZvM9diTCENbRYncFWO/anT0a/2k1Pw3aibXISTOnecAdXj4yrRBTzu
         Gb/vwVeUZBZ420YmEB58oeiQ4OO29a3GPZOC3LxFVhEPSOrMkeFvwN7ArbXrpLIKAkdw
         DohSBoxpAUg7HSSkMWR9f+eJOfW8xSLC5U6NswJVKPc49cYrIBdUnX67z31cwmH/lyMn
         RnFQyhOZnUZzktEi/jWKp0uZlx4+TvujgLRR87X0BbO5BdkUjC2ze5sNYuC26T0HQ5st
         FPszVGX9d16/R7Uzb6sYyVwmC9dtODSCXMb7oIdMx/E0DEHOowDwp28xUxNvK/tGr4Yf
         6Avg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=IQTB2D4i;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by gmr-mx.google.com with ESMTPS id a27si200366ejg.1.2019.10.11.06.30.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 06:30:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQe5u-1igedg3dv4-00Neg8 for
 <jailhouse-dev@googlegroups.com>; Fri, 11 Oct 2019 15:30:02 +0200
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: [PATCH 2/3] configs: Add SMC SiP IDs needed for Petalinux.
Message-Id: <C4A932C2-5761-4E9D-A455-988C33A9F8F3@gmx.de>
Date: Fri, 11 Oct 2019 15:30:02 +0200
To: jailhouse-dev@googlegroups.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:j3BhsuSC7PaeRO8wdamI8uVxUFD9B20HC5z+Oo+zm0ujMlFP8p3
 IYTYFBCMECCk+tcbgyEoFaRSx/gzMThcO0rGBfcOy/cFYa0RhKc1bBKs2dFMBPMoDMJ7bm7
 bprqlMIKT5zmGfbW5v8CIIctzh1n8BtzFrp9wnhg5De03c6zguP0Lip00fp6T0406+GMoHy
 YIk7XwoF3fx7cIF9b6e6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:O9DvWBHq7V0=:UVVV1+y5pwwn5r7vTcIItS
 v+LkyjlNw9x3X4eNp8MSPr1Ku1A2H0QesuBVz19oGTheErn6TETVxE5jlG0RjzNNNNp0PC33o
 I9hq0JGNt2cBO3+z6bqBoXwXvOlT3uv4D3sWF/3+8AtjcfXikKfKtDWLBq3qagzKiZKe+zwx/
 DPuqrJMMDDHDCalMw70l5jiNrXdQK4Nir90LmDDpH7TIMFik4RcZHVPeJLUCMN9513H4LtkH8
 br1IEP9rie0JoFETATC8HsjO7gEx8OzRK/ENP8qcdwM19DuRxF5kfv6+5L+4/B51/Cc78Yzq7
 p43yXm4yLCVkOgTAWDbuAmibEBM3EhjAVV7tSmrY8uUprZF0C86MoGd/jc1mwwOcqkLqaJj+u
 nxDGbICdYIdVeyS251Yqyh55wzEo9/BrK9/JccEwnJSb+N+fD/TbCh5xWdnB2HhDePO3tIjeP
 GZ0nwlBVo2mL3d9IKZyRHaboMpMv/JkGWav9uH/mXmdr3GhKvozG9sANe/ExmgyteeIUvjj+s
 Gw/wh9WIN+wSp0+PP2YhM0vVkOlv6jR7Byj2AfRItxmFgE15eoZsLs1DG2ulHnR+uRwjHre8B
 pdACSEwPQEUoOuzLjvEZGCzSArF/9zCKBV8eb99YAs5XXMTfru5uSrOYTlAJMyr56mN7Azvxu
 ETL6qvGTwJ9Fz7Hg8naLoCH7ZYGOY3dWPPAL9a11mGoMeqeoQJcgjiAxRswenePwLoLxy5vzd
 0O3fLZZRBkV82QdckQaIW6yCrdSjSMPLc5SDpvNv5bXAlxOLVA4wXPZXT2JNmvAc0VuVMYj3k
 Z988uxsNxtFbwOqzx2A5Cw/9Lvex9mpn6Qkz9RG1NjsZ1U9ZPfJWrK9uzPyxwkAr3dFGJjQZD
 jEfq68bpIrPx5YTQL9zXxyGd05ZlpWmlG1yPj1l+f3zYXzgFAanP6y6k5tc4RIwVhmrjHJ0oJ
 jbZxVboh2gxMCAU0ghbbF9bI7BWQ6kgY6MkI5/zRgEuLWm526Oe/IBqNh2CWQh3DeVUPMy4kY
 wUX2Cwt2FB1kQYmoeGn0O7Eas+ygL6mkKL9xmj6V8jaDgisZogav/2hZSzydvHdZw/BCaXoNk
 9QRmR7Xq0HEr9SX9MDCGYSdl+lWhyqti2JfhBeZRpkDDCeURDWjFJT4PdqYXHbljfVfAcw7rr
 zZJZbmcrLhM66r51Fkd16X+vekEs+DVIxDJxOYzh7EH6rAQ8kmk11oX0+/+Uh5+qZFbM17RHC
 VCfxztjPij3ubYlAIdaeYme/e0X9FxDPUxhaXqZozvBMDouZrooOb2gER4Uw=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=IQTB2D4i;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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

This patch adds the SMC SiP IDs that are used by Petalinux to the root cell
of zynqmp-zcu102.c. The SiP calls are:

0x0f: PM_SET_REQUIREMENT
0x24: PM_CLOCK_ENABLE
0x25: PM_CLOCK_DISABLE
Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
---
 configs/arm64/zynqmp-zcu102.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 9de04d6..d9cd790 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -23,6 +23,7 @@ struct {
 	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
+	__u32 allowed_sip_ids[3];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -60,6 +61,7 @@ struct {
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.num_allowed_sip_ids = ARRAY_SIZE(config.allowed_sip_ids),

 			.vpci_irq_base = 136-32,
 		},
@@ -146,4 +148,5 @@ struct {
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
+	.allowed_sip_ids = { 0x0f, 0x24, 0x25 },
 };
--
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/C4A932C2-5761-4E9D-A455-988C33A9F8F3%40gmx.de.
