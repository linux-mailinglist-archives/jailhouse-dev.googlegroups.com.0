Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKPUYX2AKGQEKQZ6GKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6581A4EE5
	for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 10:04:57 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id p16sf28470wro.16
        for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 01:04:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586592297; cv=pass;
        d=google.com; s=arc-20160816;
        b=TE0ykcZOXnW9ttrlbO9wXMnM7O7+UGCPLCaNGdUojUNsQfw2YYWJedKrqRqHPG0p7m
         aQHObWnQWaZ3uweeZ3lyDcXNSZkcCOZxBHgr22i3MqvNLjzcc5Vp+GlCdkCzYJUC8Zly
         04C+xRE3AEirUPQmePiP5LT+lrdXTQxvEqw8BoFC1Mc6U02YN5bb+aplVwPKpclGJkUc
         SuxPjQ19AbzjValR4VkiQVkenqHYZgZt7b9Ufz00x8fmXbNIrPkGXb6TCPh2xOCJVjfH
         MQjp0SUAZF8eY+3/TMDvf5gKdNS46hxI5ypGNoUpP45pWdGQqASgu+1lN9ijLo1mqMOa
         2+8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=fiOJum0Li0yQYK1is1taTmmaUDSHhVe7hZIBi+/lbsM=;
        b=aBlrnMm7egMZrElWhetZQYoX1CY96/sIziYxLY67KWF7kKBrW8P7aMN1F/KcNeXY+G
         xxmBps7ndNWLgbuFanQL9QhHeQbltJLk8x5FzzIpMVNeUYVAGilYqBWmtCuFDVhJV7jC
         RG7XkZgUhFY9tecjzygdW1gYo5wg+xPasRmE9gT1Cvap7jlAbk70ZBDQDoVCo9Ado+8R
         sEFK50pnzCEvSawZYVnl08mnfrYv9FO274X7OAZwDRw5YFP8VdN6FiSmmZn7QTWSONyc
         toUJvFzSd11MT7Xmxj8+QIq0guTREig1MTzTTrqt5tPkEmyfVIXJ1VWr+zG+/wBgSggM
         tO+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TfKfB3eH;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fiOJum0Li0yQYK1is1taTmmaUDSHhVe7hZIBi+/lbsM=;
        b=mND+qpVExoz9bmgos7dYJBx19Bt62hs51ZdfLmfbJfz5F95QB5f296OYNdXEyiwXvG
         +QYkXf0praovT/sANVwqs8sSuUSIwhpIrjcRTQZ3cNziDhItZaJYKrdhAFMLS/VcWFwU
         o8v0vTmcg6kKcIMM7RBJQf6rQ4u/k9WSd8xhr6wMBlrNvuVfD6MDVFTxUsosP/ABp+uN
         kOJVPo1Qv/RpC9c5ooi6OmBVXOkgzD0gIgUJYVe29kg01TOHxNWum6kDbT36t1BOCR/0
         QbACpy8KcS2QFVMqioaLwOchj5FImCuAMyzujoajGo8XTsABJkbprAr6RCtVeOc0LYZs
         VgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fiOJum0Li0yQYK1is1taTmmaUDSHhVe7hZIBi+/lbsM=;
        b=eWxAF5dfpOiJzJI17nzctwgZs+OvGrDUGhJBf78ghOo4O9tXSplO3nC3NK9daMne/Y
         pHUZloeif/eJsECN7/NH3FvwtXjmJ6OQ4cJwo+sgCWz4i1fShy+hgGCFVEumNK5MdYnf
         IqgeEh/1gkbnnRWpZCibsIHi9Nz5cORvWGNzBTc1L2CAypCnv9fqNSAlaYqd0w9f3bui
         DsM4obyKGGJeVr245r65q+1TtUS/GBvLQBU8aR+web+8EtDoR3FUuj099lpbnWsdr9z/
         DRnYnSA3SDPt34IUzTNOJNhNFaNf9MaVP9ogqOslEmKj3Ctspho1/vMZRpitPVFh/sBc
         tFeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubtvfcjyzhFMaWfRfcUOTl8ZiNQsBff3KkCgDcjeHuSJ1hbnZeM
	B0vaGGyibW5p1fZ9vI/mevo=
X-Google-Smtp-Source: APiQypKTOqhFjIo4DQf1bDjrOtN8vOv67T2kzZbzaWMMEerc2upVGhWPNs3WsI0yHVidkIXSuz1crA==
X-Received: by 2002:a5d:568f:: with SMTP id f15mr8185457wrv.48.1586592297513;
        Sat, 11 Apr 2020 01:04:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4690:: with SMTP id u16ls12556482wrq.11.gmail; Sat, 11
 Apr 2020 01:04:57 -0700 (PDT)
X-Received: by 2002:adf:8149:: with SMTP id 67mr7495234wrm.60.1586592297020;
        Sat, 11 Apr 2020 01:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586592297; cv=none;
        d=google.com; s=arc-20160816;
        b=Xqv6voJkPZx3GzHxlicWTdZBOjyhKRmepDKrfKnEM19FrjSJR0BAKHlY7TKYQpOU4t
         K6xkiJHv9cno8CmErCFpjWsGFp+TRTFHn/0uMh2Fw/YXGEgNDWddmW2A/UeYI2LiaJ7n
         pUYcDC4ERtvUfkHKG2yKZQ0UFLvvKM+pB3P8/eKO7dLA4YlR38Bi70UeSQRYTHQnDZZN
         Irf5aWerCwtMXBs92Po1Lp0CJ1yWHAXp/s5/rZKSJjmMTCmGtV57KVTNPPJaZwsNBRIY
         dahvUR+GX1BVxdgwcyqs67Q67B1+WO+ZhgN6raaSUX3jFF6eOyiYS4JtlCCdwQN2RCHp
         WXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=yQ0budoB5gBYCOYalJ+jsBD/GKEMofY4+j70JcPrqaY=;
        b=y4M1NFLJYj/0NDM9LB35L+Ag0YIoYCw91NCDJoHoQufCoQMjkX90OkvRweLtPIsJDn
         t2FcfnCUnLFs2Eox2FeoTfAJ4P4F8HQ0Q87/VLTZnXdG2UOg8WehEgqV2O3PPixpEWRF
         +F3p+r8xVK/qd2+VR5OXVRScVIm3omBX0brEO8xLRDAtVE6jQhfu5o6qiY2UDL++75Tu
         uEKg5yJm0jvXzqEg34gXQrSfOkwwCs5pFv5Zg1c+/FnIFSieZi2kv0GL/oCCPrYV15r/
         F3zoUqTEdJ0T9IP9VJ/JQ661yA1VDYIFXg0YDRVEseq8KrXsrRelr/JLQBQZUWBzQ3fC
         DQHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TfKfB3eH;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id l20si271727wrc.0.2020.04.11.01.04.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Apr 2020 01:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([80.187.82.138]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Le4fk-1ivlKe2nXA-00ps5L for
 <jailhouse-dev@googlegroups.com>; Sat, 11 Apr 2020 10:04:56 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] x86: Reformat for_each_pio_region
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <e50ce647-c62b-73c9-b632-415d4d32aa22@web.de>
Date: Sat, 11 Apr 2020 10:04:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:D0XNpR1iZH/pMtiLy1uWbQLcLqgbIB7AHBL1c0kqMZ8aCOwoi7F
 4twFk5urZUqFfSKm/ZmOcr5lr1Xk9Y3qoSZOGnh2lBVPg045Az6fp5D406kNgGYXhxrpF1A
 qLyJAYrgDtKVCo/20XoVKXE1h4fb60Lur22wNLtLUHa8oYRKvxVCiLRy55e4vLdLYbes5aB
 5nUcUyteckliIvqJin85A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fo5+QaGaeuU=:VOsZvnp3uKLn70FJXYNBuq
 YOrHbeqluWCrPt7jNgtTcwoocVN/974XD3jOpm5Gcp9b8oTuwIiyMMX75cLRW3X2TDd0WXSeY
 MAbn8xZXQOD+96h+AvgCNWiAm39ICY2kVWz88aYFXw86aESIS/MtDzxrQmpwgXOt66viBZ+Kv
 L/+G+q0Td1u2G24pva3kGSrFag5+eAxqM5sE+0ABnHQDmymaJ5R5oD9BnlIzfeskTOE4Bd2Jn
 QPvV/Ckzu5Q8gRvNoXwhwRR/2HPiALkjfwzp+bvcLnjPD49fd18TOXm1VpFZEiNHq24meFqLZ
 GfdZo78zLCOHLUrRSreXl0oM38VlZcHk6snHGN7hFiYnv0I6QNbl5zKUamQixDfvS0F4QQgX2
 Up6/T8lI72i3pum9Wu0ykdwZlo3CU4KACm00UdyZXgA8EbWgFCOT5bZGNZrmeEBZrlnexyAfq
 IKat0TdCfQbLhPoFfx0IhZgpF1Xna18S8ZvOcZ/6YpFByWhBheKXXjrzie8z2soO1nAbV12lw
 VkOGkOOlAdnA8mEA4PXlIuKdpXzWHGW/UgnqnMaYIVyl0tkWMyeXlkY/tiYxPEQoqYZdEj+Li
 +9AB4J6dqkpHJsaNt0YK0mo1vdenHAg9stvGYctC4judOTbKFrmBc499fe8MhSDNO5xXOLPF+
 h5184cxEQ3Tv4C538LIfZ9/qizeJUiKVqVOkoDgz7gnrV6pZ8ketIm6hU4FGaHJ6FbvKmnf9m
 CkjzdDy6Xdk4kscWpVN8jO09ksNADFQ7hxr4/AmJnAfPZoyc0Rcpq2SNaB6RtUuuemwEOJJ0s
 xe4P9VbsYtRveUmHb+RKYd9Y0a/9F7+vyPOKMbcD0ibyEfChA+rj53otiB4CR7PJVIvXSle89
 dC0ShXncHk4ncDQD3m29e9zcVn6/kPZ27vPRBw7LNZxFpevDObq/8GvKr/Y6c6kG1Kmh4YIY7
 nk4n9LA8pA+GNeWbpKZPBP3JwfE4+PEHbyQrKOif0mT+rbxo++PCaYcgFN23Uy2iMLA35upqA
 4xExsk3mnI+tKZ+0uPeqaAxrtib6iaM8qXP0a8WJa9TBXH4bEc12TN6iyG9M4fe+Tg3p9TXhq
 cPvfaPbGbhzMU+R0OSGaIS2U5NGbntB+C3Va5KlLJq5qWPmyTXAje72WPxY13HkuT9bt7IjzN
 NZDfN0YVCIzywK03WuLHABDD4ngaPzFAL058/O9On79xs8edL8v9jFf8kA6zEWyNxwWPVHuxp
 zFbaJfFKtjE4/niuC
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=TfKfB3eH;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

No functional change, just the for-statement more compact.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/vcpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index 676dc481..7a6543bf 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -26,10 +26,9 @@
 #include <jailhouse/percpu.h>
 #include <asm/vcpu.h>

-#define for_each_pio_region(pio, config, counter)	\
-	for ((pio) = jailhouse_cell_pio(config),	\
-	     (counter) = 0;				\
-	     (counter) < (config)->num_pio_regions;	\
+#define for_each_pio_region(pio, config, counter)		\
+	for ((pio) = jailhouse_cell_pio(config), (counter) = 0;	\
+	     (counter) < (config)->num_pio_regions;		\
 	     (pio)++, (counter)++)

 static u8 __attribute__((aligned(PAGE_SIZE))) parking_code[PAGE_SIZE] = {
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e50ce647-c62b-73c9-b632-415d4d32aa22%40web.de.
