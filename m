Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBN43ZX2AKGQE7JNPLWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AD61A5F84
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 19:19:51 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id t8sf5249024wrq.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 10:19:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586711991; cv=pass;
        d=google.com; s=arc-20160816;
        b=amBiBDBnKM+0n3vhgDLtomMJ7uc/+ocFoXgkJby9yqq8C0dYu4XXS61DrTolCEaz/t
         LLULQPf2YVefBJHhWHIaVKVrW3R5EFv5MMdvaFUNuMgjGrV7nKnBmHDegFtRBLsOiUku
         QewsxfluJxWGQIa8lJcDMoXbmzR4PLsgxKU6VWv9BdHLTF6lXXwKSN5n0GO0eWEXUNIG
         fiR1fiwv4vOawBqgn3Ifc/Vs2Sr+DqQycuG7zURV62YGYWebO1BqOS+GKoQ+aHv/ijJY
         Kb0uW733wHX2HdRQYh3l8b4y+ncr6TubLcFzajVHJ9mmLw25T2tyPd7UncYpD/XkUzh9
         4GtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=nFPI0Gct4FT2+Jzjkl1IJKX4a6Rf/4mgzEc5WleITsk=;
        b=sn2jgeIlx+1TIdOeDd33v2xhPXTsxUlFS2ZSZyQY/NQvugpOCqsXQAmBqu0utnT8TV
         IMZd+dPIU3kkocnBcngm3ZHXU2cjbMXz7Z4ODoikKYcNzG0RpUS8Pb4j+nqJyFdoyhWt
         y//C+M2TiVlIcbc1oqSfYO+fogsewd6Ota+hLY1z/W3aHjk9FvTqrLw9Fm1osq5kA64f
         g7EkHauzV/lS20b1VA+rvb1HVoqjNZejnfj4q55o9jxBerLjkOZJwOT/B1zvAljUNFRR
         +js18qBLgi+OGyKDEi6NiV38hWjc/heJS9AeATucSNhzTkycP0X+Yg1QfVCzyBtjXoD3
         tvLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TGkR3pfZ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nFPI0Gct4FT2+Jzjkl1IJKX4a6Rf/4mgzEc5WleITsk=;
        b=qAATA+07t1lBpI26noXnFR0WpmMfamQqrJ+fSAQINSB0aPOUrpYnsXDQqGqQzAAdeK
         CFvNG4Q8ToZfmx5CKbt2XOo5FYY+lFNx4yX92NNFo88bE2SJwk6yMZZQ3vaxOPcpktr+
         6RPZPknX38VGYzEUaqdF9Hft1wwIeU/NhSNp44iTYeLjKgrkcDP7FCglo/cSuixa5ImL
         Tf7PKQBh5ecpJHdBjCYZnda1IUhDIaZdk3QEAGVc8WSaS9fLBolVNkLVwl+INI+VwakA
         dwx6bRUnEHWf4RN/l33t8LTZd3h1CC/0osp1HfRTIDvXSRHiwvueFoTCTDD8H3ejxxI1
         wcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nFPI0Gct4FT2+Jzjkl1IJKX4a6Rf/4mgzEc5WleITsk=;
        b=YWN/lS5Y8Ex8gMFX4cvXJLY8GvIuhJ6IF7xwAJUdsmChgWST8ArhtXX0LuruzK6ToX
         W7+6qtkkz2DXKwY5BY4nRimtJ55dk2fUlh3xR/bcip03vq15zqEoPndcAMnF4uOs7Apo
         c4PGpWUywPERh0vaXIZ4OmUJl0gUdX7t6aGg1/YOXZlZvo/2C3ANaHK1sj7/z6mLPYQ1
         S4fPP0ARHh3EPPjMJG9X9shc2LehhyzHPeMUj6/vJKMBCflgKykz89PKQcjbTF2KhQDT
         M3KaSfWzQQl5AgdcXBHealVVEBhU/PZ9JEMLC/tTOhZ5dChN+BRKGlS8bHvRT7I0FduP
         JQTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pua7tpdbTPWYwNnLbZVUOzMGMcYKrBCae99pMSdvejjS1cY5Nm58
	dhStaSLHMQIPQOwjmUxwwqs=
X-Google-Smtp-Source: APiQypJvsm/wPl2nq00LSdy/As1b/eNHawtWRuRSW6EhaWTdoxN9jKgbSzrAG9m222pY4q5ZpUeusg==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr15945737wrv.363.1586711991207;
        Sun, 12 Apr 2020 10:19:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:120d:: with SMTP id e13ls3467794wrx.0.gmail; Sun,
 12 Apr 2020 10:19:50 -0700 (PDT)
X-Received: by 2002:adf:f1c2:: with SMTP id z2mr15807027wro.40.1586711990587;
        Sun, 12 Apr 2020 10:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586711990; cv=none;
        d=google.com; s=arc-20160816;
        b=I/l4JG7YAy6XLzk0K1X86JTmXJX8u103OlV7SHdXC8fxzXhijzuyQx/2FypRseoUQ4
         TvjEix32F90IdaGebLpa9/UsFIrFI6pMh8qmQ+OuAKWtLiPF09gjmrduAXU+Vw9T4+en
         Ymb3VjVUJLXJUTS12mpUxfw75bk7j81xxCXSds3jpFWlh9QbLg9LQo0DGdQWAf17Okuu
         J37JCGUXS474HSblB+aEbH8zC2xgGCAABXU7OUwy0XhZ+AVn4ZP47/sui/SThUVBqJTD
         iOjuBOi4EI/AuOzp4WHcipDbmjlbAlbeuW2wte9gwjJzv6RxTasQ9upHN+Sx6dkvhIye
         IJnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=P+gRY8z8ThWoWR8p6bTI1CxqVpgqjEq+Shh+8WY9/Oo=;
        b=oUPePdaBPB+WMsmNCTtiaCEkqhMLIvV01fSVtsldGBJUWXsbvOWUveRSLxn60L+da6
         Xn9wRO57DFtfbeGzd7spip2MGDTcn3iQmtGunwJ+1z10H5MDyu0DN7ng6IHGpGy/+Rvo
         zZyl/fTV1j54dT3JHq9Ol/30SyaqcNzT4Dr2dMNApZXr3D31+5Ez3XoU+HmjNfqAqdoX
         M+7mcL4KnnyOlt3hvGMJLjiu1f2e47M3BTsH0lkZT537I28R7BWdGAC9W0vryBApueYc
         XqdzDWknv6zq57LupXzS5eA2dR05fDz8tcOdYO94sLVFxJmqf/xK67AJVF11DXJz705P
         0aFw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TGkR3pfZ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id u16si569731wmd.2.2020.04.12.10.19.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 10:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([109.41.193.243]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MCIqT-1jWEqN0np3-0095Ps for
 <jailhouse-dev@googlegroups.com>; Sun, 12 Apr 2020 19:19:50 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] inmates: x86: Add LED blinking support to apic-demo
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <c6911357-714e-e1cd-edbd-43f270cf5677@web.de>
Date: Sun, 12 Apr 2020 19:19:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:3xktZ13EplClT99UXh/XmgnkQ2/ARhiNGqXnXHdlpYBW0g2PYNN
 tlq12OniAkBhI8MRkVQPCPctT/WSwBNRyycOyscTCesWnAr1bdWkyAgTvTODz8vv2Ck0dyH
 zg0JU2l/JkDi6E8I2FT5OAwxq8WMUxC7Xueh82Geto4/wO05TEGFkRg2BjMZqhN1dsDC5pk
 Cx2D00OPEI2ibDatxQjQA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e7YwMhH1FFE=:kD5xxd2AaJKF32eS+TV8yj
 lhyZSRPU7jPvHG03Amdsmlr+yJXEJIfbEEsrSVhBwSa7LDHxgW11A1M+g9h76h2EI2EZ6IiER
 0d5OGvSg68q4l5vb0YWgyNwcL9JfBsG9JckDHzlIHpUB/3y57Ij8DjjsQwW2KOAatWDT6F43x
 OXrlwUrxNMxLnRnXDAmztmZ5MPq0LvnQDiAY+90efw4l66Z2X1rADTN9PjFb47iqWXvpFWNpS
 934ZQ31mu0K2y5Uputu0rbT9/piuEoOIiTXfPPPNQHm9pvd9X4lqXez1/91wmjQpdp+lBAg1o
 2FlxuK9yt54UZeklpRYJOje+Tbo/GQapPqtgmm69BaGiYRTCqeX8e667nbjp0yzoooTBS6Nub
 4/Tx9y4AcUciSTgEo+62p9cqtE0n29qImZW6xeb6oFohR1T/zvj3R/+k1oK+4dSvh6Mo+qYpE
 1VWFRx9RIhCUREFgSHCnEfsf0CbjdS/T/srogfNbFWHWvv5alajU9dvKHi3b3xbCWDJDNzFOH
 bQSZw5emmFRlGFzE09ul4c5MoLcGv9OMJbEPGkNfmT4Q4KfTdrMuI2KlokIfUTX7M+w9exdrw
 SMStNQHlZ1JCwrqP2wNieDnTfXUdmvJ54xHZNookW91efIqxQamq7N/N7VEhHR8fRxy9CFwg4
 9psCQ82G7O3wqrvoBlVBRzcPBA1fMNQiI6CivxF0jq6wDD+R1xhgHRVIfvfBA1IEoUS0BcgRd
 UrVJ2waFJFr4BNiz1YkoVyGT4gkYQg0PCqLvrqrd3HXIyLPWhuE35zsm85/1K7TzU8EKMpmqi
 5OwqGvdAtmedp45aiZ1rk2fHh2Q+iFXlGyLfT83ceK/HI2RSmWL9+fu3q5o0xIr8PAGhRa8L1
 Cp/5y/KwkrGkKYsOpg89wSS54UVaIlnGNAptMotllgR4pPg0JhS4fkn92GVwPu+yrIuffZRRG
 3oZzr3+zmh5gAOtOVOjqFs9ouXbU0JpmSVv7DVj2WN/nTriJSyDgIBVesGDgQZYGpOPCz0bWT
 AEpwMSDA41SQfJCS2RQX41KHBIiNSqbVZVs8RK/nEay+ekTzTL9l66hAvNgbcowXku0ZC7RaA
 teAe50rHyJEcM8IPtjSh4y7F3DWvVOaePle4OnAPAsRyQv1hCDzhSVhHRii2jZRIrvVVkb3LB
 Bf2vrfyTln7L612ZKcb+XWdTYh+RzJfod0ui12zGTBmXc1Oa6fVAv37pQ2r5g8btIgZw0V2UR
 U6xqZB5ixLEnJ6ZI9
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=TGkR3pfZ;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

This is analogous to gic-demo on the ARM side: Grab led-reg and led-pin
from the command line and toggle the specified bit in that memory-mapped
register at the pace of the print-outs to make an LED behind it blink.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/demos/x86/apic-demo.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/inmates/demos/x86/apic-demo.c b/inmates/demos/x86/apic-demo.c
index d9aada6a..83ab77fd 100644
--- a/inmates/demos/x86/apic-demo.c
+++ b/inmates/demos/x86/apic-demo.c
@@ -18,6 +18,13 @@

 #define APIC_TIMER_VECTOR	32

+/*
+ * Enables blinking LED
+ * SIMATIC IPC127E:     register 0xd0c506a8, pin 0
+ */
+static void *led_reg;
+static unsigned int led_pin;
+
 static unsigned long expected_time;
 static unsigned long min = -1, max;
 static bool has_smi_count;
@@ -72,6 +79,9 @@ static void irq_handler(unsigned int irq)
 	}
 	printk("\n");

+	if (led_reg)
+		mmio_write32(led_reg, mmio_read32(led_reg) ^ (1 << led_pin));
+
 	expected_time += 100 * NS_PER_MSEC;
 	apic_timer_set(expected_time - tsc_read_ns());
 }
@@ -132,6 +142,12 @@ void inmate_main(void)

 	init_apic();

+	led_reg = (void *)(unsigned long)cmdline_parse_int("led-reg", 0);
+	led_pin = cmdline_parse_int("led-pin", 0);
+
+	if (led_reg)
+		map_range(led_reg, 4, MAP_UNCACHED);
+
 	while (!terminate) {
 		cpu_relax();

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c6911357-714e-e1cd-edbd-43f270cf5677%40web.de.
