Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLEZ2D2AKGQEDSIJDAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 4241D1A6344
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:37 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id n127sf2476088wme.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760877; cv=pass;
        d=google.com; s=arc-20160816;
        b=asFVtQZc/PwnxutRE6+LdjBwnoQwPamh499O3vnmNLxzQE9ShtOCooXmu6Fd8mruFp
         n+877GSAlUs0/nBZF3aRCoNEE69V9H2LapyHdmp62lArMnz13eh076PU0FsLYQdY79Fs
         DlAcfbDRFEfjjsfkUa2nso5YFyF+Dn8+UkNqiUCIZzp6q9jsXUfhYsQGbFAR/1gKzKhq
         J8Ep4M5IYT7yIcL8jh9fPCOziYsiSffOs1sVElvP0hEO8yc/FV1SI86mvS956WdmtT9U
         Dnaausd9jwE7KV9FKg2+4ojUOPtBsB6Rpz7EZEgNv+44jzT0cEKwuNEUE8B3veKsI2pl
         rstg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=AfuWRk90KvlDROUFATzXea4EfBKkhEbbjkuuTIhHzGk=;
        b=XEO1eNS8wQd0KhfUhVxoplx1i7vwQe0GGks6mdFmUNpb6RE78OFleaWjv1dGgzMbZu
         hHv3hBQnoHpJzXQL0z7BbdgekFPIxdVFz8MCH3tGfjLX5AyEltHTrV2t9X2EUDraP0Zt
         Hp81M0Mnzk/hbuv/XJZ8uTM0ZI4IB8h88kJj+JMAAqmo7JYJcU8Ri3BSDjQVmnfcoK8V
         V49hNo1PKlbQqDmoEh7iGV1hi7sLulxNw8bdqz5aMWHbcaKt2oR8wtQWPnN5gUU/EwnZ
         UMG6FWHdfXJYpuU9vctjxESuPAuLG6wvAeuwKkaJbqSpBQ8R3mQc/p3KXyfBF0dxANPi
         pNUg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=gu2ORASu;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AfuWRk90KvlDROUFATzXea4EfBKkhEbbjkuuTIhHzGk=;
        b=hyb7CjkEHsoIMVciqzl8QIkJZVAspP+8vMqFi3OCn824AG38DCvjwabYQmluHMVWTg
         piqwaGFPpzYgvjN26gyN16eiK0/MZSs4Hv3fSiFJ6VZhzY/95G4SD2Y5rj/Ytiys8qjI
         o6mZOkgZ8ldhVVdsHdwan/Zxs/sDjLIuKMXkUVOzSQMH3t8aobl/Hds3uhnKm6ucAomg
         CS0gYl3gSGHBobNU95mwFb+YSv0ZiG0BAG3dpgEHpPCPiT3F35XFxJudMIDBZ2bK3nRv
         vVyHJfPiMkCmA2BA3TL3LD7Ra+x8Z+nluoW+b6cZbG4JWgBxvJXixpQN+8OOnsVurZ3B
         EQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AfuWRk90KvlDROUFATzXea4EfBKkhEbbjkuuTIhHzGk=;
        b=qk+b68p70e039QoG8tsxE4L0x0g+tWbv5VV3WCh3oCJhUqusI0+RRB25iDpF3YRXsn
         ik18JsKOFzw3zvJIhrljDm9i6YqVVEqvrqVOL0Scy1/wTCrTIMCB7Ps49sp1zLWu7sFA
         wyBJ1CQjmRE00na2J6RYiiS+d5AEGudNNyQ20ucIVy/wAF0Fdg7nkxQgmKzDzRu4/iws
         THZLgvLF6LGbKkFjqLLCLOjiVob7qZE7bo/vNTTZ3EMRJl2/qv5uKeiQRbExpwjple2p
         CwmoZ9rpvcOuJomyEx3bBq3Q1nqqyEWM9xZWDDmMx/DuolUFyAkIC/xvpoC8ADI2T+LW
         cVvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYmi7n92pZvXtsbdUWqY6R37zvvXzi320yH07MpGUNLjoWM+L4p
	dUe39JofNasEQ5HHEXQ2yT4=
X-Google-Smtp-Source: APiQypLFQWN4z9hrZ4dk0xFXRZBtROroA/wyhGU4fbznjuyeyiaYgKs/9FS43iGMrG7JDDaz8MOw6A==
X-Received: by 2002:a1c:b005:: with SMTP id z5mr16663034wme.145.1586760877018;
        Sun, 12 Apr 2020 23:54:37 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e390:: with SMTP id e16ls16824998wrm.9.gmail; Sun, 12
 Apr 2020 23:54:36 -0700 (PDT)
X-Received: by 2002:adf:e282:: with SMTP id v2mr17170029wri.329.1586760876268;
        Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760876; cv=none;
        d=google.com; s=arc-20160816;
        b=DuCyNbCRaHi4fUyNNyK6eP83/F/68BCxwtCIsfkhVLPgC9IUbPvrzGkgGpT14aDwZH
         IpTWjO2bNDdrOY4PdAtpO80TisnjBEQB/WwAsEnN/nj4nvyODiPj5yH0+4hhIZPhCGvT
         YE0osd9+mmVVTnKDCEBmN4Abk0QuJ7OyG+7mo3QZ21ySqfPmJ2fSk+B20jrLxURnpOOQ
         Oo/E4XL9FyE9jsLBihCrcw4XHu19o+XFIUE9QTSEvKhqZYOJA/dMccV/wK/B0887X/UI
         puorqss1vWD/zCafukxpLsacAIDBcGIi6t7GrGq+BmJqndcXuc+MNpv4zkeXKKjX/N1x
         jW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=o65fMJC2O6COrQLY8QLBAoFlvAL5koPfaY77h/htVUw=;
        b=nVJ9WQOikmGSChwvXQwk7J3IxXhJsFPEIG9lUX4CLZUcmjlOowWeBIcWsQrGz6/vww
         6f8/JWj4fdGfu3LoAxi+jVGl9cnXHPvxufX2DcSBWWxNguNSv3X4Q6UcplWzLVJuyXt6
         Qmk7g5/dSQQb0vwHTmRzrXw8IqtEp1TAZICusv04NwY7QB/8jDHNSw/1RtHwcZ3KL2fK
         4wGPxdQnZIK987OhuYkbke1mudXwMdBsTcSDwJjqWktuLLvktiNNn90hvIEunOvVK2lG
         84P9D1F257JoObdk1WApUhuKHA14xs6haCRPxiz3TfLYgIQ+P30Xkbli7aZj/Z6LXC2L
         BNmQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=gu2ORASu;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id m4si167791wrn.5.2020.04.12.23.54.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0LgYOH-1isRqg3LYz-00o0P9 for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:35 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 12/13] README: Add SIMATIC IPC127E support
Date: Mon, 13 Apr 2020 08:53:54 +0200
Message-Id: <23d2e095cb1f075ef12acbc434f45b45d753910f.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:vtx7UDcdXJwbixTGyAPk7y8pEI937SBAU4Dyz9oipo3v4+uD4v4
 Kd8DjTOhwumuaA+c/APeoxd7DWDljMhKioYeJjHUOHYZuw8Ow+yGo9fLldkIniK7IDk5Acv
 myAq4ZsfItb31qp5vjGRGqMf1RNOakzNr1XPPpldtgJl1SGmMlyBCOug4VTTQQ9X39+t46s
 PNpBbv3OoH07P+HRIfMIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k1ZCfJO/r7k=:/C9KdZt19jvficPbUmCVUb
 X7NJ8bFUwX/LEYyJbWN2aDjg5HeOOaLGvcsjkMKgM0piosIW3dYOd8QNp1yOQnoDafL/0rx9I
 5+otHcon/8hZmum30Hx4vyZ3zyAOAJsgGWF2kHmzsghxffGykFTGAzQatdPZgeUbboUQgaAPs
 yUwn9NcnDxxt6k1tAY6Re0gtWy5h2sFBs/H7w8lgwiaIWbGrtYbPAi/z6TZrSXH6U73/jjx7J
 1yywu3ztMYHLFu5tKaZIM4Ad+ymMMjsgKL+TLum1fjMN4B6rG1bDqv45Y4Rpez2EP7ixoJ1vi
 NarrSddpw/WZ8P7mVKUeiINiYFJlOPmFdWv3smdT74wHWnEPNQobPhOIso/VDe1gLg6HF+tar
 7UdHa9NV1LvYL4eAKbCttIjaORAD9QNtCV3Q22e6Jfncxkea8xuq6JYZ/r5M7MuE82t5tTxng
 JaPygospd1vBQs0LvEPAGqCEYSzR7f8aWTgiv+RSsf1+14vctOdtyKmBrjKcQy30NcDu46S4+
 xakVcfqp4zFLF6Kw+b/LNx48+8uJe+vJ49Gcv0gD/4SJnu2SsmPvcuCqnh5PFYsBRlbtNmDmU
 HEDXO87k6pbw9llAFuPHZfwDeeOG3ueAGBhfd1FqdGOTK+b4/SGphpHXDDy41Zbbi3iV86W1q
 i6GsBDODnVJl4cRAeI3t4A3QOiwXEq6+W+V8M8opqZuDBVxCXEdy+G2cPrdexCtJqGr4pjy+J
 HFsivstHB76byxzwaJWgmGJwshvx/0G6dbtKHAqRcLDlW8SRCEAObIQIiXm/NiO7fKjnFKEGs
 ksAFYpOhBS4+GoLKWDIWmYbLd3WP3BobMtxCaTCoR4JrvEvC7l3v48AF58+sfWcNmmQeNCm8+
 bjod/awc8NhnNA4J1HKdzO2D3E5JXi8RCP6w4tjmjTKYPDQZ7/wE3qGoWaGAPN9EIK3yKZL4E
 BQtPpx0WqkcuDC4g+UpVHiwvX+PANM7k+fcaieMlfDzAYoEhmkXmaiuJu39Ib67y0xtC1qL2P
 JfVdZeMeHpyyQ8Hg5bSv7uTi4qTLvMeAggErb4GNazpD239WPhmN7j3g9bzT9XMmziaX2pFLu
 y8LBYiDlqh0NVtNMxg5eqBRFt00V2oek6QISBKB1H7zvyu5r7o0xkRQJVwaaaAHFy53wPYYOC
 WAog/+jRKwQHPpE0p41wKfSpxDDNdKhiJKiqZ1QN3O1MpA4pZdl+s2IVZZuLT6gFlqku/lxaa
 uzxzU1BVltZKCBVqW
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=gu2ORASu;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

Add a missing word to the very similar NUC6CAY description as well.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index ad5f7a0..bb93821 100644
--- a/README.md
+++ b/README.md
@@ -55,7 +55,19 @@ smoothly.

 The [NUC6CAY](https://www.intel.com/content/www/us/en/products/boards-kits/nuc/mini-pcs/nuc6cays.html)
 is supported with 8 GB of RAM. It can boot from an SD card, or you can flash
-the generated on a built-in storage device. The device has to boot in EFI mode.
+the generated image on a built-in storage device. The device has to boot in EFI
+mode.
+
+As the device comes without a UART connector, the output of Jailhouse can only
+be seen via the EFI framebuffer on a monitor or on the virtual Jailhouse
+console (`jailhouse console`).
+
+### SIMATIC IPC127E
+
+The [SIMATIC IPC127E](https://new.siemens.com/global/en/products/automation/pc-based/iot-gateways/simatic-ipc127e.html)
+is supported in its 2-cores variant. It can boot from an USB stick, or you can
+flash the generated image on a built-in storage device. The device has to boot
+in EFI mode.

 As the device comes without a UART connector, the output of Jailhouse can only
 be seen via the EFI framebuffer on a monitor or on the virtual Jailhouse
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23d2e095cb1f075ef12acbc434f45b45d753910f.1586760835.git.jan.kiszka%40web.de.
