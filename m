Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRB45GROIQMGQEPRLBXWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6923F4CE25C
	for <lists+jailhouse-dev@lfdr.de>; Sat,  5 Mar 2022 04:05:25 +0100 (CET)
Received: by mail-qk1-x73b.google.com with SMTP id r20-20020a37a814000000b00648f4cddf6bsf7103171qke.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Mar 2022 19:05:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646449524; cv=pass;
        d=google.com; s=arc-20160816;
        b=c+2nBjnzeLUQ2XvSYAWFObnPscedZ/FlSsHfpyrlsyTZbRrGhzBRk3x266C2/mSQ0C
         XONGPNJnIunlkq7F/eV7Wwa4LGvyI+XJa1mMIkCREZ34nXtIXmFaj3vDs1+E6viLWMdi
         O4r+0E/Kwwt8jmo/Ltn1M0Fr676Woy8pOEaWVZU20vsLiR87p2QAq8losn55Z8fWxU9G
         EcDz9Ec0FW7jMIDpx66cHHPRnFKE13TWwpFb7C1Gn9muuMky2pLUChaord8KCNdrPnV3
         8T3Klbxm161jUsqzQI9oQ5B325yXqq7+a+nIVzdjihn2X2I4kaSsgZb+tZLUVLYtsi5f
         ZF2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vl/imnXAsLUZ3Zg6Gzg0f8jqNfz3txQdJqOZVQkbk5w=;
        b=OcwQ3P+8xENNSGDDTmwpDoIAbW818rm8cDXQe7d/NI1v9jpeWZdYVUwydSLNqtVlDM
         SJ5EBwo4ZLK5drSerWVg8E6QdU2mkj1Ex4PzaJeSZ1AgHFVAQjKEaDUXmbSWpap4tFeZ
         1gT1pKoCu79FxJ65mCyOQ9e3zM0XKaHbMjtSEK173/y8gfJMbKOWLLbpUSd33BGAjl4S
         KxD7tUO3nCQ5O1S/0yvP14qHvN0DRWEZ0L9VlF8j7Hs1Q/gfJftVuIbZn1Om7wbB/8zr
         SB5reKROwWxH0z2RPEYomY/UoEe0wg1Y7djE0fIX3q2eEHRTXzZXuybQv+aIRh1MU8gJ
         EeSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LkfwWowK;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vl/imnXAsLUZ3Zg6Gzg0f8jqNfz3txQdJqOZVQkbk5w=;
        b=ahxFmx7PcUCckCzSEdZUTqz5fh/O0IamfkUGT/Tk06rljUFcirJ1U+V0XvZqCu5pPf
         xR/pu+MNdnOrNTFxt2w/q7viZq4SMetcoG89c6AKTLbueLEGh5IPyqEv2ld5kepltAcz
         as3pLuWBvUkNAgWeDmRJSJkw0rUADUpzYoDxoTdWH2j+A5T0rxV9C7J01/MwCik03P2k
         bjjthwBkxzyMEt8EHm8upJqn0RWC+MpjNPD+TXtlaGvcgYQhFn99dgh0N15B/Z3MIero
         +Aa/Z0TUuz3JiRAoXL/6LoTiUhAAPwy0ZWzrlNS7at6tDsyGlsdG7NLepAnw1wLB73bX
         Ik+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vl/imnXAsLUZ3Zg6Gzg0f8jqNfz3txQdJqOZVQkbk5w=;
        b=lmuxZn/WBPWAW+jHMPjEBi6TX1XuB/coxk3r2Ljq+PIsHPeeU8sXOy3z28ZOup1n7F
         PCU9dGdzxXxi3D+5BY4d0XpJzqlwz9YxtIY1++o/TF44S+58qNwydWAeddm/SbK7cgml
         7bw+Z7Y62lLw+5nRyXPJvwDO1YwTnBm5Z59MsQhWMTfij5YBUY9IrX3Bw3hF4SOSRbUj
         KtzafKCdc2cpf4VSwhEKIaa68tpF0dXPNrTbSZKOJUdHVsIUVq8Q9ALZ/4woz39zXkJr
         CfOx2NFwc/2eAYVzkkBUaicKLvfFuGpb5ljAFI7QhN/RWrVrCWiO8sayyBmdbVYcqjDT
         27Vg==
X-Gm-Message-State: AOAM531/OT3uFeeUZWECeZnZdsIfBqZZHbF2DE5wgZ2UcmvxzENbAJsJ
	6POW6DJ2YewUurm48f4sY80=
X-Google-Smtp-Source: ABdhPJyzrjgHWVsFQctgWszLlzdc9gzhdNVlWNEyTWbBCyJ8wfC5hl6tLqGBucf8jFbKXlPjuYxPkQ==
X-Received: by 2002:a37:9e82:0:b0:609:ead8:8cb2 with SMTP id h124-20020a379e82000000b00609ead88cb2mr1031627qke.724.1646449524358;
        Fri, 04 Mar 2022 19:05:24 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:bf82:0:b0:478:be1:e7ee with SMTP id p124-20020a37bf82000000b004780be1e7eels3722983qkf.2.gmail;
 Fri, 04 Mar 2022 19:05:23 -0800 (PST)
X-Received: by 2002:a05:620a:20c8:b0:47b:4219:40d9 with SMTP id f8-20020a05620a20c800b0047b421940d9mr1048856qka.224.1646449523575;
        Fri, 04 Mar 2022 19:05:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646449523; cv=none;
        d=google.com; s=arc-20160816;
        b=i7Eyu3kTZCh8TaRaazdu8gXgqYwNF/R19MbAVANz+n23v71qXGUr6QQ2gql40IFl89
         DFMM3ltTD35CyQTBWrbwyBqFNe0wsCj/07COksqFb84o+wuKBTNkgf/SkaHrbQTBd69n
         kN4z1BNpf507bu8HfoINpDBySUhbEA1+x1IjxQx0k8NUAPxmNUNMVYh6EnRNLEnS1Qs7
         VDUHEZrWEZMDf1AF71XepLIG51bEtYezmtUf0MUEyhkUEhPHNIwGjUvxJQ/X599ahqbU
         ZM7vyyXV/eWmFSAcXXuHbhTTZEcp6iNsnyyaIXtUQD/9SuT6kr1jH2ajfiqbPK1OKcv8
         embA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zcGTWFWi/0I3g+DTN0VliNzzgaRc4x1IEdCmVY8ubyQ=;
        b=lBqcijYxmD08xltYEFVdoa1Nl8ULobsUgxMCKGKVQTRbMshujlVW7w2CDVL18mBpDP
         iqqd2+tiFuqHsSwts4tq3Q+kZE7FEEAmpwIqLt3MhctOH7GoNbpHfvqGkgqlAj8Ox6/4
         AVTbOdAeERc6OfQRIVmGirvhWLQ6M30BxYPqTs174c92UG96mckHFsiClcdL4MpkgC3Z
         5AMqDXKYxjuvXnvM9d5d8UM5UBcESDRYvL/89hE/i5kSufVXR77d4zSW7Icy8cE9ZFU7
         DkZ7G9EvdcaqoGIMMp8ZA9En098rXMVsBDaVHJrYblUin6R/FvgwTcMi1FI3nn0XbOz2
         AfpA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LkfwWowK;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id d3-20020a05620a204300b0050725e6760fsi305155qka.0.2022.03.04.19.05.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Mar 2022 19:05:23 -0800 (PST)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22535MsW110909
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Mar 2022 21:05:22 -0600
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22535MiJ065546
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Mar 2022 21:05:22 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 21:05:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 21:05:22 -0600
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22535Bvo123249;
	Fri, 4 Mar 2022 21:05:20 -0600
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v2 2/4] configs: arm64: increase PCI memory window for k3-am654-idk inmate
Date: Fri, 4 Mar 2022 19:04:56 -0800
Message-ID: <20220305030458.2938-3-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220305030458.2938-1-mranostay@ti.com>
References: <20220305030458.2938-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=LkfwWowK;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

Increaes PCI memory window by 64 KiB to allow for more IVSHMEM
device allocations for k3-am654-idk inmate.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 configs/arm64/dts/inmate-k3-am654-idk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm64/dts/inmate-k3-am654-idk.dts b/configs/arm64/dts/inmate-k3-am654-idk.dts
index 8e5066d3..e6d0b547 100644
--- a/configs/arm64/dts/inmate-k3-am654-idk.dts
+++ b/configs/arm64/dts/inmate-k3-am654-idk.dts
@@ -94,7 +94,7 @@
 			<0 0 0 4 &gic500 GIC_SPI 160 IRQ_TYPE_EDGE_RISING>;
 			reg = <0x0 0x76000000 0x0 0x100000>;
 			ranges =
-			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x20000>;
 		};
 
 		secure_proxy_main: mailbox@32c00000 {
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220305030458.2938-3-mranostay%40ti.com.
