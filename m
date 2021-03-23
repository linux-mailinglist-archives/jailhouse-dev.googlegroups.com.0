Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFXD46BAMGQEONGWKZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D74F34600F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 14:48:06 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id f3sf1120968wrt.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:48:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616507286; cv=pass;
        d=google.com; s=arc-20160816;
        b=HTGv7yywX6gKi1Xb9x5wIG6JvhlYVZkBxIM7+zMOOQSglUXq3g/vLvuwM/d9B1H9wA
         g3Ylrj5JtyUQCkP8fE782qqHof7Zf3HHMs/tDXIP4DPgF2s9rrKF+MBEuvhvWo1t/B6Y
         vJ4/DLIA1DqKHmoQsQyUOhumIZNMOCmF4cDsBRBQKamYymi7GW7s3cdUwFw+/WrJ4n/r
         3a4pJyR3w+BArJo4AHmjput8S3mtvi66s1CzhsrWBBgccx1601XMihNXgymIpkqNXCWm
         G/BhOm9aoqD0fIuufQsjaQhlmEtqajsJZXXnP2Tplalaxw4AaYyZGKwXLeHN0N/fdWsS
         4q+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=mQ/OA08x+dlZzjUL2rqTKjqz8zYjrkJ95Rj2rrh923Y=;
        b=aZs6kHaFK5Bfs5TxdyXJcXRhj65Gkr9uwzVf3/S1IvW+PPWiQdCCXAURw5NgPp1tp0
         2PByHvaBpBbHB2UUnhNrxtL/KPSi87JEx+Mk/l5+8aP1tplVMESydHGBe32DUq++w7Hz
         VgzuHzZ1uWv3rUNVsYniYv1G4IECzKgDdG/cPMTQUoAggqArQtmTpU9p9h8fC08GHvAM
         tB1OG7FPcpQ4VN23ZQy0VIKFmUhJfRpjeWTep08CA94tklQ+/NXnUPnKzniuyOdtgLOS
         f5z5/LsjWoeBc7Wj2xYXDHNuFxP+h1kLQPIzN/zmL0qTzZ8iLosPyUQBfE+Ty+G8vLNn
         +1QA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mQ/OA08x+dlZzjUL2rqTKjqz8zYjrkJ95Rj2rrh923Y=;
        b=gcF9ZFnNiAmOkVjnw0O28bxm3AcTukmBsLAqLG7jnbPCnWzNfOGk9KQa/sIGWLAU7Q
         EBJUt3K1A6eFjl4GGSCxoex8I6Ihta3duiIjPCM5WQ/HmuBvU88g5qeFbmK7xNVAD0g9
         6lJz2TbAP4NRcSuZQ8TiFGh8lbiPgl6EC5vpdAz52B/u9NfLcDPe2EMvAeEaReAMlk1L
         MaDzinMBqsqNJaaA3XrOuJVlmdCJ07ZfeVr2AGJS4RlN3HKRvdA0+EsnALIIlVP4kVne
         USfGIcYvge/E+is3HsZmazqETDDenwlaIAhXSKlwJNGp8n7ojbQdk+R7urjrSjMRBA8v
         pc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mQ/OA08x+dlZzjUL2rqTKjqz8zYjrkJ95Rj2rrh923Y=;
        b=da2o1emAZ2cZPPfqYO5DzMO34OSIEZqkKFr4mc4sLz1l8CSejzifjwgGlnYkiLUFWd
         valHo5P4netK6eAGyUR4G/ZVQX9yssvOUe3YpTLhn/wjYZNifgzj3GrQMVsyFq/n1z73
         pR986hRCc5Sy8PMO911GhI2oNLGCbULvv7Rllc9p6KZiXP5suwoo3Xi2o9JiWxPPMrpg
         tFt7mjQaeMkvfaSQreBFHUyxwBGzpe2Sf3W4XzXXSmPqksHqGeekXHqkbA1V5xWLBY3z
         6hQEdoU6pK97+ci6ULdGzyqOxxU3hLKJAKyQ5GMldyo9q1GBNx+E3hEZUya6EoyQwEpM
         qGYg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5336+cbIhVRKHM6XRgULqOZDhBzbloH1DCvKWFMy5ZZj2dhFVa0A
	fqxRAneT3uog0lKn/RCpJnE=
X-Google-Smtp-Source: ABdhPJwxyEUxq3D2qqCwuBoKIVLWIflDdb91IE6RbamxBsb+TvKD4e2WDwBNvI3085BviI27kALEag==
X-Received: by 2002:a05:600c:198d:: with SMTP id t13mr3547362wmq.73.1616507286234;
        Tue, 23 Mar 2021 06:48:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:162d:: with SMTP id v13ls2975097wrb.1.gmail; Tue,
 23 Mar 2021 06:48:05 -0700 (PDT)
X-Received: by 2002:adf:fa41:: with SMTP id y1mr4039678wrr.256.1616507285248;
        Tue, 23 Mar 2021 06:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616507285; cv=none;
        d=google.com; s=arc-20160816;
        b=REDWQM4F91Sn52y17pDdESFf8mU5ZymyQsPGCZg6cRPjBwURry7cQOH5VC2tcdu9M9
         xL/hdam6JAlqLXNosRhnfoHk1W/SDbauy7g5J7huA2Xe7SflmT8/kmevMN9C98apVyF5
         lFp8k0cT0bqW0OCurTL9FCK2e7cfAO5nSv/qJKFMIYhQhIcjqumtW+6gVLsh5IMhc6j2
         8kL2gmMjuJU3dzNDWh4AklAFnAsEuHodS7qZbfk3F5axCp9DtAUP8vdbyHkgI7VKTijo
         KrLLDkfx40CPj+Td+9kMbDI2Fenc+AkP68rA306V+VM2C3mzedjVg2E1f/hAqVytbhKE
         lvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=PD3kPZKDjlCU1vr9O2lXyct51ckGqr3pCkabOCPPulM=;
        b=eJo6SLtEaj5X6On+rP8Gkjyx+YcEUxpQZisGhMyCq3X1wCbEHpFta61IVeg1Cl7VLv
         MRA7CO+LcaO9EwLY5JFNwMPhwKs79wQvMA0wPr6HonN//D5sRmGnTIosI249XRuncDJu
         xyLq7VEt4FSlzsW9Rmp4+Io2HzNkE7aT5A+lRfM+rJ1b9XsRod/1qoxRHbU56tRbIHEc
         is9ZOKe0oo4mJam2vPmjLRcTwFq21fi+IP1zRLeXfhZ90VLKKQ/hdijoKw8KI53Bj183
         9JCQYNGQo/g6gYPVBg4I0VZmfuwXGNn2/OFmNGUQnTUA/zZayBSSBuS87Jk84zbpfW6x
         Wz9A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id h16si619544wrx.2.2021.03.23.06.48.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:48:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NDm4I7018219
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:04 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NDm2Mn029573
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 07/11] README: Add QEMU ARM support
Date: Tue, 23 Mar 2021 14:47:58 +0100
Message-Id: <44322b571e7c9cae63e6a5065ec8abaa5e2f02f0.1616507282.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616507282.git.jan.kiszka@siemens.com>
References: <cover.1616507282.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Lift the minimally required QEMU version to 4.2, the one that the ARM
target was tested with.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index 44bbfb4..cbceffc 100644
--- a/README.md
+++ b/README.md
@@ -13,7 +13,7 @@ Quickstart for Virtual Targets
 The host-side requirements are:
 
 - Docker (tested with 19.03.5-ce)
-- QEMU >= 3.1
+- QEMU >= 4.2
 - Kernel >= 4.4 with KVM support (for qemu-x86 image)
 - kvm_intel module loaded with parameter `nested=1` (for qemu-x86 image on
   kernel < 4.20)
@@ -21,7 +21,7 @@ The host-side requirements are:
 To build a target image, just run `build-images.sh` and select one (or
 both) of the QEMU targets. The generated image can then be executed using
 `start-qemu.sh ARCHITECTURE`. Currently supported are `x86` (only works on
-Intel CPUs so far) and `arm64` as architectures. On x86, make sure the
+Intel CPUs so far), `arm64` and `arm` as architectures. On x86, make sure the
 kvm-intel module was loaded with `nested=1` to enable nested VMX support.
 
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/44322b571e7c9cae63e6a5065ec8abaa5e2f02f0.1616507282.git.jan.kiszka%40siemens.com.
