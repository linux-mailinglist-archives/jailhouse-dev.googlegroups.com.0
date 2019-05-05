Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBIG3XLTAKGQE2DCTZTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 978B213EA8
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 11:32:17 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id f3sf1475980lfk.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 02:32:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557048737; cv=pass;
        d=google.com; s=arc-20160816;
        b=gFyunaS6nOIycO6OUltHforgF0j5mJUkSvFOoJEhvul7zQxch2PNZ8GJb9SUTbWg1Q
         rABUNmw2hluKs7HI9GNMILlZulw/Bu92AHqhC/gKeTFGFUlm5zxEoMB1EUulllWTgOCO
         RDuPHDpXHs8+CINtwQwsw2e/b9ZIV7/vwj/RUl5GAjG5MTr6t26qE7TsYlIfETw1AT6A
         J7ShLW06VNKl6NAjkjoLMlCQtYJDB6XxCitLwUGesmzN9BbrFK1ZtdBUfXXB5g5m8hmE
         CnyY2C8IjrjOVsmQCjaSCVTAb3fzSkqsfCeZm7SbiqEKX6h5rt4v6jW1GSYniqWfUTHz
         LR7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=ToYJm4dxeKFBr70CGDeH0UwQQgk/BtkAdyJuR+tflm8=;
        b=nwWwOSKAlNKJSAYP9+d3Q/s9aciERI/5E7hYr9EJPShscxgOldoCxI+vmmFhxu3t5y
         jMf0F7Od27pxP9878VOgqO1Skzgtn0jSo8cp2tVCU+w1F8SdbAAHfpJ7+/EiiTPq3u+S
         SxSwCUGbw+MuSv9qgcp9a1K1E6Wyd5libMLQNZNb6WsyHWLx7g/2DOhvhjeMo+04u9eb
         AZM/XmCqoQ2i70ob9SsiP5ta3yYXD4R2EPX0l71eigmwao8lCt7UU/rBar3zwKylAIR0
         9sPM6HyzqRBkJjNoQDlWdQrhJe5d/ICJ0C3yfbDoT2bCJ2jLjKcsEUvbA0BVEAhbUFd5
         m7rg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=dHetx9yl;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ToYJm4dxeKFBr70CGDeH0UwQQgk/BtkAdyJuR+tflm8=;
        b=LQu0cSUP3btJq0pdmvhjeEEPeFYK+w0TiCbEI6xDMGInfKzVtT7ytOsx9iOwkFo3/O
         K1WPwss8cfXWb/sp8mnhrhrvhcitRrd4S3700TxYjdchQ0YG9dJhfViYbo7Ld5+ZHuk2
         gfZgS+WDroorIcJCUghHWNp0LJrEDduwtesStmUcoVpQ8a4UL9RLvtvyTGCXE7FC/ei5
         Wanhxyu2m2GY5SBAdqfoSj2uoOkI2vsZ8SfNbNBVNrZiWMs1QGh1e1F8A5StOSFU5QKf
         a3U7IxvhBBeAa70GcOLkEYTcxUZgshbGhycXinARPXeWbD5TB9EtZdTy6mDxrBRTQ0Rq
         XLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ToYJm4dxeKFBr70CGDeH0UwQQgk/BtkAdyJuR+tflm8=;
        b=Zgu9p1ETgHGklVCR/dUAlNJqhl2A+Wk+7LI3N/mIPRso6wB1Ie3+tdY/eXcmFmYImj
         t/xTH1nq6jXGWjCtGM/bix2ft9iyKhjNsmJwykcVZT31KkJ4MKVv6LK3yPqtF+tfdsJR
         qqj8EW5jzcNKyXYRiWAt/A4cgJYXOcPoxv/VD1F2Qzyl6rl4/fQduSv8GLgsMC+bY0SD
         auFFCpYR3MZ4E5OpfLrDMxqRuDNw2RjhbTZuTeYXyeUxsgMxVoXmDodChNtIVbbzJOkn
         naDMf88udPxcCwe5p9lbrjHFPPeMcTsY6FGfCH+pA0IWi2S0kK88X8m+qXer+Lrfw+UB
         5zTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWYlfeYOE1KWLQ1h+RnMrnIQNWo7z1T1IGkFGRzna4fDJz806yF
	xUVqdf22Onlve7/tjwM4JGg=
X-Google-Smtp-Source: APXvYqylcEYJsd/q5D8Q7gzne9fcryf2cwg1uns67v0ylXLBLD9fDt3U+UwjzcSWMNUX7KC1Hlleqw==
X-Received: by 2002:a19:f50f:: with SMTP id j15mr6419099lfb.135.1557048737213;
        Sun, 05 May 2019 02:32:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:974e:: with SMTP id f14ls994172ljj.15.gmail; Sun, 05 May
 2019 02:32:16 -0700 (PDT)
X-Received: by 2002:a2e:89c8:: with SMTP id c8mr10603809ljk.73.1557048736358;
        Sun, 05 May 2019 02:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557048736; cv=none;
        d=google.com; s=arc-20160816;
        b=EfxTpj58kXntCvLEYJuZDAKqMYrTPCr71qSxo1nMMwFE5azfJDHCcj7TXCG5IZGp7U
         Ewe/zvw73RMrpSscfLHbXGMG0OON2KNjBrfF3qmpgnfvP/IwEsgK8UHfCdOuPQjZ4fHg
         5yvn8ER74vbYjQUqQUIq/kAKHJAVOP2GSRQVr6NPr2O5XVXdv9en0/8p3pF9guADt28b
         Q/tYDW6MIipsfJ4I+Wkdmt/e9dod+tFUwAz1BGbKeTE2F1ukhytIzPqf8k1tZ/zmPmW+
         Ozr3u2yC5n2NDvWK8tEZDgY2prnZ4M+xVaszFb5HlhQzyhIDD49jJwYFA3cCyDajCcmB
         sTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:dkim-signature;
        bh=Vx3T+yySjmN9orVHtSASRDa8jdmilfBFbIa269udmxs=;
        b=hRdM/Sj2ndnF36HFU7tgypsBXnbPEFeBbh+7GgJ1LAEMNbE72jtL2G/DP39NJUjq6q
         tdSgIftlJe1PBKnTE3PU6xW1hu4o8SYf754MCA8oMP+6O1PfaANwemILbJ6LbAsz1gbb
         hG84A3asH19CCDu6DMk+u7MZgoqS6nnNqJP4HzdgPGL8zy4Zr4sRSoV2UDbl0NSYSyjZ
         58YRWpyk0qvrmPXLXtDn+xHVE2ld7V0QsEgHwdt51MBsizEoWQKiMV9bQYOs46g+g9MQ
         SMI74B2+q83i2SGlMz3EzM+o19kONCuRGZbelYODfxSgIZpevZWXz7fCkcXX/MyjxIqS
         C9hg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=dHetx9yl;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id y23si51714lfe.4.2019.05.05.02.32.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 02:32:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MdLcJ-1h5PfY1kN1-00IX64; Sun, 05
 May 2019 11:32:15 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] inmates: Fix RIP-relative test mmio-access
Message-ID: <03acc935-fb5b-1010-67ba-c0b32a744490@web.de>
Date: Sun, 5 May 2019 11:32:14 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:SmBak6MxQMPtPqmDhwOKRH/v9Xp+twK4s5Hju+d+OVEg+KanjHa
 bdTQy22C9M8MEMIG5TSE8Q+8ifGzwTY4QvbpZsg4jptG2z6Z+5fvp2Y9UDG1kAQ2bXkoJ7D
 eG/olGYQ5tDmsG/qajLklWuuv/JslH8vv1m8Cc2QI1+nnbrYrkJg1bSQV8CQsRd/tOxPi1E
 +nlPWAt7Z/Ozh49Cu6IXg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YUEywbfsD/Y=:+civn4dzyg7Z1/sSoFAzUy
 dY5f2AY5UH3D+D2HYYHfm29rE99c+4hWV9hONHgVrsZBXwk6PffF6DUOfFjBSfcfA8jkrfRxe
 eFJwPbwnbwWKuc/RlxLObVusZovimpvb1s9QOBAVWJaEwGy81EvK3TucNPHGJJwvMpTh2/Rbg
 9DsYJEFn2yINA17WvPqVE9gPSSX50FIbkfp8VsbXL1wUFcvEH7fTZF6Mkss4WFVh0c/DougsT
 G9yI7+wQFf7pHVpvIaFNuetqUKUOPuVOajCCJ84/suegPpO4AXOhjJ5XnX7p8HJRmysrGwLyO
 hsYnQLPhXrbJF5g76PYyVGznOAHj7dUE1+dMou4nEwryErVZwsxTmeDsP4H6DGZAPKcyrE4lo
 5o6AjRysve/qwWePEK1pw0l+3BJbOBwN0WHtvWqORxZ6tX/w76t0SDP4ag5WQdXTHUhwAFgw3
 zCjS1D8zLk3/Midj3+3FCvubjQr6d+gTG9N5NGiCrKa3vFI3U6qEEwwpWawIoedqiO9rUjdP9
 iKXSL9Jckp+Ksjr8nmqH7z39MyOTl+OQXj9FYs1fkJC4XVXTAPJUuTNCAhWryRqy4cda7uFom
 cGlbjxHwXndWMNgOANZPLwcuxj6OjdMTTdCENaRfSOBCtJ3Mi9uOn6bF+dK7wyc7Pda4a6FRp
 YaQ+QQEDUXkOePnx6/iQh6htJvy/FVIHNEIFTXId0CN+zPyCXbMFpjBjolH718w2KmmbDJspX
 2Oat9Kn8p4j+pyDmtd4Oa9SpJdJS4A3+hduwSOUCKkGNNA7xH+fVhOeTNLGoIttK4IJWpmvoc
 /WQth/JAUrRwxfLn2NjBd83avk4+ZpZdbOM7Qa22O8tuaLZIwXmIboJfeL8HquzrxR1Tz0aMn
 MknAR+hYt9NT/+Rh1Lj4I+CFwSr4w7Pi7hU1xObXLVklMwteIsmXfbOmacxh6m9RccTL/9+Su
 RQXJPIRgKig==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=dHetx9yl;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
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

Avoid using the cmdline as basis which can move around - as in
91332fa77903. Also makes the thing more readable.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/tests/x86/mmio-access.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
index 7815ded4..1c6a35b3 100644
--- a/inmates/tests/x86/mmio-access.c
+++ b/inmates/tests/x86/mmio-access.c
@@ -14,6 +14,8 @@

 #define EXPECT_EQUAL(a, b)	evaluate(a, b, __LINE__)

+extern u8 __reset_entry[]; /* assumed to be at 0 */
+
 static bool all_passed = true;

 static void evaluate(u64 a, u64 b, int line)
@@ -108,7 +110,7 @@ void inmate_main(void)

 	pattern = ~pattern;
 	/* MOV_TO_MEM (89), 64-bit data, mod=0, reg=0, rm=5 (rip+disp32) */
-	asm volatile("movq %%rax, cmdline+0x101ef8(%%rip)"
+	asm volatile("movq %%rax, __reset_entry+0x101ff8(%%rip)"
 		: : "a" (pattern));
 	EXPECT_EQUAL(*comm_page_reg, pattern);

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
