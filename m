Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKORUH6QKGQEHYQJ64I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F92AADBC
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Nov 2020 22:52:42 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id t22sf2438938ljh.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Nov 2020 13:52:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604872362; cv=pass;
        d=google.com; s=arc-20160816;
        b=VRZiikM1xSpfaMTgVdUC1i2g9nwVBIFBFCQOWQVltoMlxLub5KXZSl6vZjIod9dl59
         Yfldm0lMJpP6d/rytt6ia1K9jud3E+njX9GHBADxbDZMEL7JCDYBSsXymNx5424WC0s4
         xuX+2mEGBdUXUu3g6D+tZeX3lsHwwxS8XAu+0zNjXsjgk7wlu/CmEaBwGuoaCQY3EJtW
         ZiTdtB3VR6vtijBVVF2951c3GfDFDuBVcD+i5o8suwqsiryLqaK77OHFly2+qafAlmjR
         j0EkTQAkBZs/BeY+Kwm+dQ3P26oaYV3Q5pCGSgqjnbTt+6MM7APoC84IawOZDEBpWcUX
         CI4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Ku3csAy2qM3fq48h6CxofUzQcPh2qWBfFPRL5aIfOkw=;
        b=XzMsGrlPF2A/tWPrCPJoYtNzESUgvaHTZgU9RJbz1IyBWuqlExKw8W7tG51nldyks9
         pPxCzlfuJfWBzoD2dQWaeC+UNFhfpw8VIY/Bb0ionwJYPRZATVXpPUqxvTdO0kP1fMbl
         Pd+hMBp7H19LnByjPhP/d9lfnePThPNJrK74bNIanub1LcK5uVAQbs8onZOzL4sCZbJ+
         sJT/751Kn9e0vDk3LsNNDQQDoSYNjnuwOi/lNl4I8q91uJkFyVLRcZoEtoTRChqL/1aQ
         92N3Z1te82BUoO8XH8CbaVP/spoXDdN/tydTxTeMbzBd8V8G/QJFW7CLdhUaUWkSg7zg
         vhbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ku3csAy2qM3fq48h6CxofUzQcPh2qWBfFPRL5aIfOkw=;
        b=WMekLkdTyiUE9y0kLbNMZe+/54Ifp5RngVwAKNigOBZp/6rDiefQPfBQHchwHOW8IX
         +M2qeOO/9EOpv61iUfwcZFYcAdQmMgYfvFgzK1z8lNw8Q68ofedeExklHuobDID5TGZJ
         FpJssLI9NQAFWB9Vrq67iNe3TNQBVH/H+bnpMuqm8mHKnlbKotsf8iyN6AWSb5/iOJp/
         mJ393azt22gBRIqjXwDYXmMAZ1b2y7gOQgM3VPDiyHA+a0dfDK3tIAi6BWTqOzD6r3J/
         p5ZJgfZoOnXKHE9XTakZRAk1xy++kGKb7rFBGTRZHqq7/WZhfVNqZuYbzxzAPQ5bvBJw
         ktxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ku3csAy2qM3fq48h6CxofUzQcPh2qWBfFPRL5aIfOkw=;
        b=jXWr7RpdBQEwYepb4bOzjgMsbTyYNlGTADN+sQ7rPXjLpgg7UTI2w8PlYdHyoyl8f4
         9kBMhmod2xYNOJW+sWwUElm5+qYZBzWrigv2rFy4YKjjigmLy18tVYTiynNRx6Rh+hP6
         dofY9Bd1Yk9/1gcv3D85AqgfD82FtAYvioSHAsd91vDJTc2nN5zNgqF1Z5XVCHb1FqdA
         xi4PUmy3ChUjEkaXMJK9Bw9c4nv8uV99U+wBkykYzWzLThVS4nwB7d8bdeEqY7xfaXUb
         17YtgAQRqxYVKVu6OfeQuSYELtI+V99XBoFZKSL0o/EvDCSukWTULBQXTcs5l7Gim1wd
         zlqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532QLJ1dlfTZfGkpy4V8b6wsoElWvZXM+NYPydPINdIfs5dnVo8X
	SI3iDQNwFSuo0hue1p5e95w=
X-Google-Smtp-Source: ABdhPJzD86mLVMcWCsCaBvzu1eekwna42s8LslOM4W6EN3ryztEyfuTfJ8v6kqDAbzdtR1esAaEclg==
X-Received: by 2002:a2e:8682:: with SMTP id l2mr1275013lji.218.1604872362153;
        Sun, 08 Nov 2020 13:52:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9f48:: with SMTP id v8ls1009690ljk.9.gmail; Sun, 08 Nov
 2020 13:52:40 -0800 (PST)
X-Received: by 2002:a2e:9f57:: with SMTP id v23mr5175012ljk.370.1604872360837;
        Sun, 08 Nov 2020 13:52:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604872360; cv=none;
        d=google.com; s=arc-20160816;
        b=Udjb2z6Ns5TfMngZx2q4Dauzjj9aepuo7tslR8DykAn2eHFGbzXPGOLm96OvvhZ0z2
         tagiFO7rLy/JidQUP1fK6asieEv4G/LtxtPgNvJ4XYj5BPqsmv9IvXTwaePPNrlNhhyT
         L46SEJmr7EvvGjO7AtVGQ8CxB/2pYWpvseCTrNk0xPIX3KFuaC5Bw/3eHcg4JGvofJn8
         mVnN68BpPMlkk2/UrIxu8usHn+my+RKMxYQDRUq1xEVzQmeAT45pANmDvMLboL52mxAM
         t/K0sfs8ROEoRkuxLBnf4rBacV9gvJrCnPFYXKuRv3yM3RSOhxTCn5k0FsjiSKRcLfld
         f6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=LxT+HSMBys5o8tXDxDnOhfxEJIzlWn+qndV9XO4pY5M=;
        b=gAMKmgDOHBjl9JP7oqmbSq0b+B44lE09eyzK7EMDLK03ert9gKBTno3Bie3D/QeUfn
         yUHJvt7HiLljApt8H0D05tKmdsRL34VWpj87u0bn04eg0x6D4QaRxH5RDJPpCIQJO6s1
         ICPX+xVJ1Fde0eiNrQTtLWO9fVOENPtCbUxzWvQDSChPkcflTowz4nlO0PMKGVRko+hE
         zSrv+KbDgCsrEWuR0e/KyAKJp/cHJdrXMpT9ruKiLTEg/BWjPwRgtLHTwqcleX8ZUV/k
         tnJgd39clX4g1kb5yl5gxMy5Tze0aiN+v/l0CNJXpJO2fV5VHJyT0bslADKvdDLV8H3R
         CYgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id s15si263765ljo.2.2020.11.08.13.52.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 13:52:40 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0A8LqdD3010573
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 8 Nov 2020 22:52:39 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0A8Lqdck026408;
	Sun, 8 Nov 2020 22:52:39 +0100
Subject: [PATCH v4 17/22] x86: apic: Wsign-compare change to uint and update
 comparison check accordingly
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
 <20201028210933.138379-18-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ec57e348-7525-c8a2-027f-5ac4cf61badb@siemens.com>
Date: Sun, 8 Nov 2020 22:52:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201028210933.138379-18-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
[Jan: fix APIC register loop after making n unsigned]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/apic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index d36c2033..e861ec2f 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -315,7 +315,7 @@ void apic_clear(void)
 {
 	unsigned int maxlvt = (apic_ops.read(APIC_REG_LVR) >> 16) & 0xff;
 	unsigned int xlc = (apic_ext_features() >> 16) & 0xff;
-	int n;
+	unsigned int n;
 
 	/* Enable the APIC - the cell may have turned it off */
 	apic_ops.write(APIC_REG_SVR, APIC_SVR_ENABLE_APIC | 0xff);
@@ -336,8 +336,8 @@ void apic_clear(void)
 
 	/* Clear ISR. This is done in reverse direction as EOI
 	 * clears highest-priority interrupt ISR bit. */
-	for (n = APIC_NUM_INT_REGS-1; n >= 0; n--)
-		while (apic_ops.read(APIC_REG_ISR0 + n) != 0)
+	for (n = APIC_NUM_INT_REGS; n > 0; n--)
+		while (apic_ops.read(APIC_REG_ISR0 + n - 1) != 0)
 			apic_ops.write(APIC_REG_EOI, APIC_EOI_ACK);
 
 	/* Consume pending interrupts to clear IRR.
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ec57e348-7525-c8a2-027f-5ac4cf61badb%40siemens.com.
