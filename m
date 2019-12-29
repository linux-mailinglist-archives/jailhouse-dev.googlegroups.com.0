Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBP4LULYAKGQEM7XELAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275012C23F
	for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Dec 2019 11:53:51 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id m21sf1682066edp.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Dec 2019 02:53:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577616831; cv=pass;
        d=google.com; s=arc-20160816;
        b=Hf/SvpXzPUdDSu8pOEX8MV6uTFWg6kbaF0yX++xuByMnv/FYjHsG1FmXOYeTmoBmvx
         IPoOdu2YtdJHp5o5PTr388ASJ3etTJAa3BH8wjMsZZR5RwVoDmgZWiXlLZzEI8nzysIh
         TEZrmkf0j32jTMcOnCbz8rucWCgvbWdCaiZ0xoCXJUJ6sLi3Zp/eGNr7JnYfGG0eFBYt
         m91slcT5ul6q6w9dOgDcX4hPVsIS7ksHI3wmOqs4aAV92xYX12w7ic8unLa7Hs4bAryD
         9w6+zn8n9+0GGDW1ChugOaXi75zt+Ml1NbbsStwHDOlkYWMscfQ2Z6B6Ky83ulObkGv0
         MKsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=4jHlgTus1w2LMEgQ+9TVNVrqRdMchxUvgvUUne2bC/c=;
        b=urzu4dTXYOJ80MoWmpWlq8Z3RTDvQ5ZmRboUo9c1IVs5kFgG9rKX7zNAktBGUwDWSo
         5dwlmuO845briOBpS9MedI38ZYFSodqpwBSKDqW48w1sivvtdUO68z9t1Gq3xnald+Og
         q53yc17WT9RbrJYxrWI2ty1Adl7LlbwTJmhik9Gasq4FvxbU+rdZIu3KAXPL6A1mFOxW
         PbPGo/Y7rsW2yVNHZUrKjUn1Igh+6rHVnEqrUncnNZQ5mq9XAWVP29UvFTp4QLCqu/x1
         o4J5OL9cQD93ZG3gNFo6hYKZ59rQpc3g+jIDsSzUYn7soW5uT5MF9UuJ3J0nQl/R9rJj
         BbXA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=h1p48gfK;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4jHlgTus1w2LMEgQ+9TVNVrqRdMchxUvgvUUne2bC/c=;
        b=Bdxr2lXLjtdFxIZ0fhOtvLnxF4y9lTvRDKjxgyNatGc0qamxo74AHECxEH65wKTAhr
         1MpY6UqKNY9IeOWcKzRvQu7hzZVG6jMe6gKeBHybGop+nx2OdK9tKFfJ2z45HxQfHNKF
         bgb1f0rFpEN0G4rx98Okm0wkp4b89BMWb0yNZlD0AnV8VtveupRDwnDrFXD9MAKn1HNO
         VujiwrVjjUzFf5kWqBv6FPyPvRdIJnLyOjBkKOnGgQ5tJispRZ/zCOkaQlVthFX5GRl3
         pkFbqhvGqS7i3nYt2UHkd240KPT9svPiDurPGp5SeXsTgDBfiYt0TVnHFKCb9pOfwaTb
         hC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4jHlgTus1w2LMEgQ+9TVNVrqRdMchxUvgvUUne2bC/c=;
        b=MYkPB0k1KmAeTcYYccWNtdZ2PXzy14l9aDKJpysIMIkkNM0baSG0AWxEMbA4Atc7iA
         6eFwZeg7UXWdP4w23yA+8W3Z6NWosQ0GTon2KdLzr3LEet050zw8mgM9p7qqt/9b9zAG
         ukqMKGfEPi5e6t7rqbtKtvouiPPC+N1XRFusyWL1ei59uXc4j6EadPeHzCYtx/vP/6Ku
         I7o3ZVfNLW6SInUX/Zr/0TvwTJ45lIxGnCmtZnKpJX68Xg7sjEN0Z5118UXb6SXcLFw3
         gbzcVI3l+UzJKbPdkhvEs7ZOH2aCrp+dqqTj2sSKVyJ3Rv4luFy9Ba9gdhjR0Ofc/U1X
         vTuw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXYET7yMgu/Amha7lFNfb0s7RuFgeek1wz/Bnsa4JCKOb3w6ev3
	97cy/63k2WJzbYDpAG2AsJI=
X-Google-Smtp-Source: APXvYqzLP4rU7tCeKho98GXE7pr9vFkD35R/vBRHfSC+97vqQ1e0WBxJUjrRO7aJHcKGNrQHFrmvNw==
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr65619585edr.164.1577616831253;
        Sun, 29 Dec 2019 02:53:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1717:: with SMTP id y23ls9127514edu.10.gmail; Sun,
 29 Dec 2019 02:53:50 -0800 (PST)
X-Received: by 2002:a05:6402:185a:: with SMTP id v26mr65251809edy.290.1577616830626;
        Sun, 29 Dec 2019 02:53:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577616830; cv=none;
        d=google.com; s=arc-20160816;
        b=Pf7/3Lxh9OQFR4uK9rNQ5N2eI2TA17ue/2sx1fjSBUubTkidEyhoLBlCctHrZbu/fz
         /MDh/LgvIeB/XDB/Z8DFbwMlz7dtGDnEkJYjLQDRA5UWE+x8bZP5kK6ilNe3ptr9AdYq
         sZbH7y3eTbGqpGjQwy86KVPE8AYhtVpKHwfTDbRatQP6uC2gjuqHIjvs2dLZlHOgB5Qt
         xbX/xDWEIf3/cB4MqR4DJcZFqUtHZxlBrzq5m4vXdPld/Cygnq025qNRfeoZ1UaYySI9
         G57fos7wQTx0nGMG6pGXWGP0jTChxhr/9TdbgzG/YOoYVcIuTIe3wDkkFVW+EH2WzBHy
         z2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=Bc8MhuKf5P3Tr2jj7xue8rfBuh07aVqpc15bXTuJjQc=;
        b=dY0YgCaK8VLl+52KeFIye/dj/JLPnunwNRpI3XO4O7O2GL+oOPCD/r/YC/wHtnNUWG
         MTXA4D+EPF+W5QGIiO89lgeR9Z4xB51p5mU35rc7uL9ZTM4u5czJ2Y5R31+k4CkTvdoQ
         s1/QanFllrmq9J6tvduUzHH/fG1qMaiiAsVVbB9j9RWy1yMXpobs65le8pP3Tbomagol
         hZc9uLIlxha+78QZ7ArNqk1YP82XK1m4iZFNfCI5gpRlQK5H3qMKotr9FetKRSpyV8aX
         KfbUNx6NBLPBvxbnFDgsCBqMTjSx1Tx/QX8Yf4b/aZ+5D2gr9+0Y4z5Sb+rLAMUU8b8M
         Bqmw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=h1p48gfK;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id z20si1232952ejx.1.2019.12.29.02.53.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Dec 2019 02:53:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([84.61.93.39]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lheu9-1jY6QB0Fxh-00mwHR for
 <jailhouse-dev@googlegroups.com>; Sun, 29 Dec 2019 11:53:50 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] tools: hardware-check: Add tests for INVPCID and XSAVES
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <236865fc-d4ac-104f-9afb-3083f4548a3b@web.de>
Date: Sun, 29 Dec 2019 11:53:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:hIGh44GD3dnFr3yycvznPlon1/jrxn/5XXH9DxrLfWLyV0yZg5W
 5Xuxs/PDACuac3ukRVV+uFjP7L6yQJjMm3lcwltxm5myoTE4QMziYi8/sNNud1pzZcYlLdh
 TUGKQsW8F/2iiys9eEyh2zY9jLTihE3GN/Z2ekXCbpb09Ld0/4iK85fGlbPGSC2ahPCGtbn
 SKfSvDvT9ZOsS6zX8aP0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vi379tQZCkA=:vC1a+V7B1kzQuWgdCh0c3t
 tS7hGrofAWT7odrlHgw6aDsOKkHS/cqfY03Ie2y55YYHovhv+cIsoQScEqkV3tfCgqHoH81ht
 VIKpZCDU9RRckGenJyw4+nHZHvG5Xz00dpniojdOYPuuFqrZ5GLrzHMXGsNhaDuJk+RIgpxDI
 60iG2jSdaw1s1fsOK2thRT2SA9l0NTtx0Wl7rJh/R6F3oYmIph/PyfF/WVCab+UHSGf+Li+Il
 99ZP9RNrLUUixwiKxBvBz/RTonZryJr6Bxi4kdSfAJD9tad7xiNVRcscZRhUNax6T6FwikKSh
 p94QpYlNrnoi7MfOrXtH53cMYFhyAUg3vDxK+PS0q89iQN6wupxIaFWL6TjtkrjYlk6kpq/ks
 GHjuOXWNycLbdLG369OVGMoXcxR+jyynqwgczw/vm4R4wjoFV/tuFaeE5tdNl/I6h4R6p7BhH
 zTdqrlZRanFEOar5dtlU875xlh8vJZHZHXpjmATPwpDfslnL8RlqpRSEdfpkCwzjQpZB2mxv5
 ymSOPvEahTQeAEON90TqjqasfaLL107xvroOkg6apTUlqm8pwkY8I8G7ujuwB1tkQg4/QOVeb
 t5XgwZFGbbS9zS9VcuoYO7IJwnrRH/LWRYofFMhzNgfEcI7HsNvLyLgmYr8nzJ4arUtqhOx6h
 afhzrbXF3C36qVhggdcJ6ORY/JUm0y0GxWIFhM9kpYkDdNg396xIrr73PyTIvWx9kvr5nyX00
 vW32LPZ68VpdTXFJNuXdENkff9xuzrkc0ZVRd0myeAW019pKZHxj5VhNt/DYpeXA2xYaKIljg
 x+5tWGkiSJR8qLxqgtn4BV+BUCxbDAtyW34RNigrBskE8Q7SWPAHK2uEw6qyJQR8e7FrpI4HC
 6MMPNLN11IkfCcOPbHJsuJo0N6w4wYKBM/ZG24F432uHvSw6ZXgtGhrzeqWR3OPlRD4kOodtu
 S9RO5+rksBGH4eLr/gYFZ9bESlycI4XJTJwG8SjtXMh/z04DXjdt1pjzrXq3WBOL6CRpLAvUN
 Cdgx477mxAMmBeOOwfa/O75Un99EJ+iACcTcJZ+b2Ly5KrIBYAfbCNTC0qwvT0wx254Jfh1qw
 AliOky/SFy/iYbitpPOTof/ROl1nKRhoYFaPy+WzyznbjGnxKwnnKTcOgrB6e415sAw35fshU
 COdta5Q2BSj/6kNBKmljV0CnLnw26P8I8Scd/g/T5s8I4VySH+IAtQOOqUrjk/tU51CZRQrl9
 WpkMv+xo+3GhDnduaR66e1tTc4AkiATXDpQntYOqoSIDbrUrUQYZqjIw+UCo=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=h1p48gfK;       spf=pass
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

We need the corresponding features in IA32_VMX_PROCBASED_CTLS2 when the
CPU has support for those instructions. Add the missing checks to the
script.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/jailhouse-hardware-check | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index 37e02b7d..375816e2 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -221,6 +221,10 @@ if cpu_vendor == 'GenuineIntel':
     check_feature('  RDTSCP', procbased2 & (1 << 3),
                   'rdtscp' not in cpu_features)
     check_feature('  Unrestricted guest', procbased2 & (1 << 7))
+    check_feature('  INVPCID', procbased2 & (1 << 12),
+                  'invpcid' not in cpu_features)
+    check_feature('  XSAVES', procbased2 & (1 << 20),
+                  'xsaves' not in cpu_features)

     check_feature('  EPT', procbased2 & (1 << 1))
     ept_cap = msr.read(MSR.IA32_VMX_EPT_VPID_CAP)
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/236865fc-d4ac-104f-9afb-3083f4548a3b%40web.de.
