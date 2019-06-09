Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB4NN6XTQKGQEPFDTMVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED13AB42
	for <lists+jailhouse-dev@lfdr.de>; Sun,  9 Jun 2019 20:58:58 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id h9sf2264412wrv.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 09 Jun 2019 11:58:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560106737; cv=pass;
        d=google.com; s=arc-20160816;
        b=drq2L9vCc3eOwRuLldYKmVhJ5Y8Qx6cDyxxwSP/gwQEcWc2WS0sSwFPziMx8MbW7dM
         n7VSJnQHdpnYqv9JkQN6NTXItKN9rBzA0nNSrvAvG6uGeFcIb1dmH3aySMUe/5IOcHzs
         s4LVaOxDJT5WbrizIEWtgXWKzOyeADmZFXtru8trrHXemsJDAvTzNQ3TJuQ6nRW0JxdP
         58+E1XXgyXw48SuBnlHt3RfgoQyAzi/sM7xmOu9hs6OKkrysMvkCLc/4lWMNGrjcALMF
         aiDOZe9M98SHxd60oEnqjC3W8w9qyO9Zu4kxNAsdhGWKO0u8B4ZTHH2Xq8bWNrh7iEIs
         UHJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=biyqO1cywd6EaWJHyUxZe3w9EkiszfcxLfRyJ4iP6+k=;
        b=MH93MC5mSx44l5IgKDKV0YUvHPSLjlijCdB8ATqkv8h3X9lJRGGfwiQ2adeQ6QRNgJ
         4cB+iKvCKNEs52oMOhXClne7HZ1c1WEWsn8IsvHd+z3faDnPnA2I+Xdvj9ddL4ngs1Vw
         IiDok3VHIJkaH96RrIeaun6Ri5aDHabJjtDSZMgoA9gw+6yqBpDxio7V5uWM4Udh2Htc
         yKKyWyo1AlOzj2YefYa4sAIKW/Z/1ZpPudlKBgNLJG7vixlUyQRnncoFQwgb8jnYacoV
         YGxmdNd2oF0X0j+/J3Q360mWfxQAo6sZpxDQeo3mIfNfmVvL9ZiF+ErRJp7iGRvfO+I2
         rztw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=n7jKwqU4;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=biyqO1cywd6EaWJHyUxZe3w9EkiszfcxLfRyJ4iP6+k=;
        b=eO13GTpRsS26h7erFtm/28fQg/bGOx/EIDAVCx3Q6VYdahhPqnpjChUxDgG+Uyw5Du
         HJ84uQoyEmzq56ipoDbETzoNkvk7WzXVPZONK3UkcNTQq/E0OxZAh+53w4khqkQPEVms
         Qv6IYP38/exCfe4RHqAA9vwDkverv4OvsJef2xvGcipQ+BaT1SVMa7LoEkKcUI/Y9Xk8
         5r5bxXPa5gOnfoJGC7Koha7NMlH/TX4vDp3vBtrmxC8ZrMNHHh7KBgpViWtA67YydOxx
         JF5A3mfhFMLGp6p6dcPCY9X22Gr4XKxibEBdY5Kimb+uZGeVxknvQvvjn7kf0yJTW11m
         IUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=biyqO1cywd6EaWJHyUxZe3w9EkiszfcxLfRyJ4iP6+k=;
        b=HhHgThY8TPy0kINJVVfQ1Oev9B06awwWC4A7OA77fN/Vrid+bN7zhoZQsJa8zrrZWA
         lrg/9/MnNUwXDGlZUeUZBEjKtSS4pYD6gZrAmGEtYNaaJhi5qRL3VxFxTaSEZDubrbI2
         0sSZOwmWlu0a4/fKbYTSnYzH876bF2GVTy67LOr3DuxeU03EnNMAJ2pN1Plbk6+muR9x
         D08wGCzCXL9LYuqYwCwSi/mcDXj39md2ZlaH+JNCKbSpEoBXvs+3lSdClj122ELGMJXn
         LX+16YV2a2DUTrAlv3OLWFD50stAz57LJAOpaVcN3+2DuxJHoZSYQ/L0HrSl4nOOulmu
         QT1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVm3iFDdVByw6f47+rrEbxLBzBK/ayxGYBPd5PQp7BueDk6nOiP
	qH03P6ZUXLOUs8Jj0s/9vno=
X-Google-Smtp-Source: APXvYqxSQf5yxHWZWo6eQoZwnnqYWkZJYWmtSoqIfr7d6M2I0cjcKauzNwlyuFUCkfIXlc4cPQw9iQ==
X-Received: by 2002:adf:fe0a:: with SMTP id n10mr28461716wrr.40.1560106737880;
        Sun, 09 Jun 2019 11:58:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c34f:: with SMTP id l15ls352193wmj.4.gmail; Sun, 09 Jun
 2019 11:58:57 -0700 (PDT)
X-Received: by 2002:a1c:3b45:: with SMTP id i66mr9465815wma.48.1560106737429;
        Sun, 09 Jun 2019 11:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560106737; cv=none;
        d=google.com; s=arc-20160816;
        b=YpNadtj0bWL74H4vwzEXL95JkRM1j+Wd7AWCvgg0ZHWaXnCMKJjrEq82A6ODey4yei
         0iaw6WPy5qN2FNYkAaaU02g8ZBumLA6iUz2efUHPRfMTZTRgL1WDKDnroh7w+2ZvupgL
         DuI0JmOn/bEeNbKVZg2XP/aXGEgJh3Qq+ainhyZYANMOWs21T5DXYk1+RzNJYBi114Cq
         dE8jFR+cF/myQ+E69EiiAAmzgBoJfonhPBzaT3ZEFruGcsnJI08fyz1oD1QJkHDBbMKl
         BE70+1Zf5N1aAo/iuwhoJLrZLPXDEekXoBOqWS57Rw9PLo5krTi5ZBiV2c9sXA+uoX3N
         bOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:dkim-signature;
        bh=zK96YE7hAaXwqrTkpI0INlwELbPdMvchyYDjq+dd3Qw=;
        b=eQ+ZbXR8R6t0npY9kbsB46hKeLefPs9uRg0Qng4CWl1+pNJ7UtAjUT9XD/iSjpedlJ
         /q+3R8cHM8DCAbybbIYIVGtAvf03r+5V6DMpv4Xbnt4NRl5EnYTGcoQ0o+Qh7yxmw1py
         hFAnlIcOZ/nhVzTcCM710egdJOtop2aQpwnpZ9rql8RkMbBJhoSQIIz1tNxFscdg4+tk
         2uDUhluC56q3q292r56epWL4jNkCfzjINUHHJChdIf7hJgeuZdNRS3bYbkSqJ6oCNjOl
         MqvLoVYUPqT79fPItouQgLvjWq9vl+ayLSs0gPZPulfTenvkHc74I2D3+9AINu0S0eiR
         eutQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=n7jKwqU4;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id h10si324601wrv.3.2019.06.09.11.58.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 11:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.43.205] ([109.41.65.91]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MF7Nb-1hKwrT2yt9-00GF7P; Sun, 09
 Jun 2019 20:58:56 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] configs: orangepi0: Keep hypervisor away from "secure" memory
Message-ID: <7c18ad4c-3e4d-30aa-b19e-76cc67bb0cd5@web.de>
Date: Sun, 9 Jun 2019 20:58:55 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:pVOcVb2oXL/tI9kIZVpWDu5L3V5+FTusHOnsG1labzJpoa9Ypd2
 WRN9N7kdjwrUMEe8modIEe7capKYHHgnpBIqrM9w7aDm5bWjMDMrjvoj+Kc+jy10H8vOF/X
 qe4GXybAOmst7uXdDSzg3Z6rU9g1gyvF6kCIBFk0fSenKwGrDjKqLMqZSsxJjKTCyzgRm2n
 hRh9/t4JfT1YJsN7q2EgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oRjVzjDHtVM=:LGYYq0E/Wk4n0RZfr3m+sK
 edzE/f8BCP46Xus4Vv3+RkFdWTKV/nd3f3VGvCJlK4UNJwLRpty18lWynhczqr6uccwgkNart
 ZGycQNMWOv3aPxCk99iUEGzfX6yeuAZA+gs1RLNN75Il3QIW29nPfDgLuhb9ARH32EQtxaXlx
 QXy6Gx4L3tn3yprUUFmaUCU1j/LiXenIF7mYOkvhiT8vzhMJ147KoKHQx+r5u07u6oOZY4t4N
 suqXht+aMw9PucT8R1ZpC00WnEYPn5Gwb0ecTgPpeFU64mdhIxVC1QqnktJPTqfaRDkYlsly+
 H0h8jmFpa0g4/L2hAtzItoqvMu61pzY3J3KCnmsj87stfSs0LaD3h2/YQzxwzWaquw+/mXKpk
 CQHPVRW2Db9MrZUddyVWEsgQ/P8YwE51OyUZU8AC2tj/6WxqxPe/7qrnvMe54R92dq5LE6OGK
 JihpNvJ3KOH1fFh1Nm3Ljq8VIFhGgBxBhjFuvKtA/XMkvu3vg/vyz/cF8G1s16o2rI85YXl3w
 ns/dL5yj8xFGaYJ1G9zdKtp4Ht4pJK1bF/HfIzRQpqF6yyJ9U+dqh3sND+3cSSElM0uvS6skl
 MJjTNMu03OWrvtcFiQLbB03xslz0ZzBge6t32RyvnAqwQj1UpPkAzY8u9rzCFy/19OBI/KMMk
 7Sj6dyZxfMwewvWz2dz5Sb4n+v3ES3lZvqokpy8HlRzvePmGjvyaHfkYhL7X/Fsx+/9+X0Z3C
 Lb2GLwY27mqIg81JU3Qi3Tt8R+WWhb/pHPFU3SdBoIjJBDIKYEAi6+InGP9yil/r8l2wuexqX
 Y4qLFmQue06Okkrehk+lZ3f2LiAyEyRjUqdrsg5KDEPvfgIGcDP03HmZBXCZtseq52+UTsY9/
 VStW43xLde2gtqG0CcP7S6M0ZFT3j4ZdMB3kgm2YAWbuAQyGek9wpUyDvm7/f44/TyAoDRhcX
 lWHIAZb1I/PkD52jn+eBinWcb5eTceXM1LxyqoGPedYmvgnZvgTZT
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=n7jKwqU4;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

U-Boot places its PSCI EL3 code at 0x4ffbb000, and Jailhouse so far
overwrote this during enabling - because it was not secured. This
slipped through widely unnoticed as long as no one tried physical
CPU offline/online after Jailhouse ran. But since we implemented Spectre
mitigation, we started to query the firmware - and crashed. Avoid this
by keeping some safe gap to the firmware, reducing the hypervisor memory
by 256K.

Fixes: MiniDebConf 2019 live demo
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/orangepi0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index e45c8d62..2ab02ea4 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -28,7 +28,7 @@ struct {
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x4f800000,
-			.size = 0x800000,
+			.size = 0x7b0000,
 		},
 		.debug_console = {
 			.address = 0x01c28000,
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7c18ad4c-3e4d-30aa-b19e-76cc67bb0cd5%40web.de.
For more options, visit https://groups.google.com/d/optout.
