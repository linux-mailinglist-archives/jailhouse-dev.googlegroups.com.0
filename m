Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTOST7ZQKGQE77JXOJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD5C1807E7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 20:23:57 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id u24sf1643608edv.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 12:23:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583868237; cv=pass;
        d=google.com; s=arc-20160816;
        b=XoBws9V/qdcjxod0+eT3YfvkygFxC713J4KQCYc1T7AzI2pdScglF7P9/GTx4cULx5
         v+LOciA4NPk5zaVTZP1W6WJdGuafd16SoVzvaaPK2d2uCMJAyi/uwcKnHSeBu8bJH5/5
         HL5wZk23ojWPNx1lJMSGFmScHfxWjHDuoaYY3NmSWBdFtHijxnMULD3L56WJ2VlVJStx
         toNl7dmmOpPa9Ayebrv8KHJCYdvNJK6EPzuPhzhPvwZQoa86M9uWkB6BYK9OI+s6pKqg
         0mYSjZFroS0EqEt0PR+8YGE/Nbfybm47Q+mSyMC+e0qAPO3yacwt1nYWubQlhSrYHc3m
         Hy/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=C7ohEqjPWFEBJUX0qeMpa4zgla6m41UTwx7i2+ishvc=;
        b=qwOPrFFWIrEOJNu0mPWwM02cautKOrqjYoGU8pU9qit6BtgU1FzvaCGWwhRFEr0H9A
         7lRQLA8gxrLthU89Vb/aNO7okmGWuGRm0ixvIEn6h2ms2v7Z0ZftOc2xPFkS43iWUnfi
         68coPpDuKsTNIlboRlqyWC0baAXuuHX//a1I8THQ/XjMCbbjyF88dvnb178XTNlAHziQ
         GRWQ5EixH3MSZgSKULX3vvSbW7qXDXXOhHUADxEu2jbox5I+IfKnGWnDHoz4Nyv0YskW
         boxH26zYNDtRdG1Fym3Yz+EXUv/ky3Aswxkx1gaHKW4ufu/uL8DRRvkvYIL7DEZKlTH1
         eDNg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=C7ohEqjPWFEBJUX0qeMpa4zgla6m41UTwx7i2+ishvc=;
        b=PCH2OlD+Um5CuSF8bQJqDGCC4HqAYVJdWHiHCjMgBTxjsVQiI0cmoiVuxmrt5IA/Hm
         fmRdIZcEu+2KF4lwzjwHAFFvC7hV0Ke1Ff8h31nEp1MJPgJlzzu0Uw0rZP2eLxAskLqm
         JfnGuDeoVZ4MaLA0e2W/2Z8VuFw3ssCWrQHZQKAXgYpofJkiCWnJavkhNCwfNXPm2WQ1
         r9EglPFpc/5ZUS8M4+gzip1FDCU0vPmPfkuORuX069YmXOISRjG/Et9iB5xEgd+gC5B4
         clEE4L01HwEB05hd69NwSWEY8a+03WklqDMwydEFppGbKZ0yadtIs4ynYAV5UAm4UXTW
         1XIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=C7ohEqjPWFEBJUX0qeMpa4zgla6m41UTwx7i2+ishvc=;
        b=mViOIJsWFOsAeFcIlNRr0r1ZmFzUvJxtWZz+iX7Y15fSwQlxlBUOtC2wd4qd+2gYdc
         c5c8FPbNJOELsMR9WHcB2Gl0GH8OL9cokcAh9lvcbMumOl+qBLwpn8GujapCxWclH9aV
         HZqLUIBIkL2xg1ndljSNZWO0PqJAoeUEnpG2Xxq6u/LPdEAH5xshHCbbbjAS+KYscaQO
         RUF93cvsBPgKOA0/q1yDCmjmIeVzZ82Z2dZ47FCXcVeNUYwO+uKYAbx/dWHeEuGHYUw1
         4ysgXALXDP4vBOXrNGt5HLKQtZmhqs1bM1bG0OOcSw368Jk+S74e+XUmYAww0DN/A23J
         DkmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0sDvWigvA63Tdvksq0Zd0dGquG/R4ALZUKs3Aqpo82FxBLbLQK
	le45tc+ca6VyKEzFZ0s5ICs=
X-Google-Smtp-Source: ADFU+vt7PuU/z/i3HaZJ6AEDCCfsqSDgD3BgMb1LpiTvyYagoTfPTBpCfbl2VHi5rjQouN3rljM7jA==
X-Received: by 2002:a17:906:e099:: with SMTP id gh25mr16372634ejb.32.1583868237359;
        Tue, 10 Mar 2020 12:23:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:c049:: with SMTP id u9ls1610820edd.7.gmail; Tue, 10 Mar
 2020 12:23:56 -0700 (PDT)
X-Received: by 2002:aa7:d785:: with SMTP id s5mr24246784edq.101.1583868236469;
        Tue, 10 Mar 2020 12:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583868236; cv=none;
        d=google.com; s=arc-20160816;
        b=cP0GshcNUCtgEsH/Z9UB9LQBMwsXpD0MF/KE5hqTtmT8/3QFJKUedGvJZ8B4Ia6HlO
         R1rJNwcoJa9mbj1Bu5IOo2/OlO/TQZbDtjreK+YPODq0rCHhQ84DC8WFL5ckyUSHu2wr
         gtB0UPhsqsMeG3UnjH9LEIHHX6dqXq9eg7YbMy8eYG2lfB5c3Td7khpEdAiMJfxgqBL3
         zL76xb4e3N5qpcVbbz5lM07YBadhhujbE6LzuGLi64810llU3TCzoxUBeJ4UGQZi6yt8
         DoHxEXHuKte4hCwXvF7mmhZ2dPZpYaN5gub+L3sI6nPP8ENHtEtcXv7kwRe1dOcvtsy1
         Op5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=8EYyVCRXmrjEvfV2xUpeF+8ygNpl0QqvRUv2/6AHSn0=;
        b=qG+hvIq1HlG4fVkKcCj1Vsng0we9pn+1GeJiDAMJGhC3EeqYLxPy2Oqshwh8qkLpiT
         fZ8jvxjRNe/Lan7VgAu2FSdXTQVX24HTSjMNdI5y/3KcTLz/FSc3Y80AAlDWHaMIfJVn
         tHjKliLmGEkjp0zD02iUoCxf3UjKrK7iHODK25Op+g3naY/dfBEP3omi1hZHB73xN9A/
         g+/KP+LHZUVvgprl9Vfdr7vURe8dr/edAjAJtgXbYKU5k0OIU1ZbQcLmpXoWUcI8Huzf
         2cUn+GSFVz4BJRYf8Sy6zVVBMU4gK8FI514VhaksR0lCfH91iTVanTlpR6DLT5UaaKX4
         5Dvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id x7si516629ejw.0.2020.03.10.12.23.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 12:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 02AJNtTF021904
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 10 Mar 2020 20:23:56 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 02AJNtEw017753
	for <jailhouse-dev@googlegroups.com>; Tue, 10 Mar 2020 20:23:55 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] x86: ioapic: Fix programming of to-be-masked pin
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <61352e16-f5c2-2dde-ed1d-c51f10d32e4a@siemens.com>
Date: Tue, 10 Mar 2020 20:23:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

The unconditional writing of both redirection table words created an
invalid intermediate state when masking a previously unmasked pin: As
the entry was to be masked, the index in result was set to 0xffff. This
value was then programmed into the upper word while the pin was still
unmasked.

QEMU detected this invalid redirection table entry but only a message
was logged on the host terminal because QEMU does not emulate error
reporting for VT-d. If an interrupt had come in on real hardware right
at this point, we would have seen a VT-d fault. Still, no kitten would
have been harmed.

Fix this by only writing the upper half when we are unmasking the pin
(or keeping it unmasked). And the goal of bac03e4d5f54 is still achieved
this way.

Fixes: bac03e4d5f54 ("x86: ioapic: Rework and fix redir entry programming")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/ioapic.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/x86/ioapic.c b/hypervisor/arch/x86/ioapic.c
index 7b243097..65ac00f2 100644
--- a/hypervisor/arch/x86/ioapic.c
+++ b/hypervisor/arch/x86/ioapic.c
@@ -143,12 +143,12 @@ static int ioapic_virt_redir_write(struct cell_ioapic *ioapic,
 	}
 
 	/*
-	 * Write all 64 bits on updates of the lower 32 bits to ensure the
-	 * consistency of an entry.
+	 * Write all 64 bits on updates of the lower 32 bits when unmasked to
+	 * ensure the consistency of an entry.
 	 *
 	 * The index information in the higher bits does not change when the
-	 * guest programs an entry, but they need to be initialized when taking
-	 * their ownership (always out of masked state, see
+	 * guest programs an unmasked entry, but they need to be initialized
+	 * when taking their ownership (always out of masked state, see
 	 * ioapic_prepare_handover).
 	 */
 	if ((reg & 1) == 0) {
@@ -157,7 +157,8 @@ static int ioapic_virt_redir_write(struct cell_ioapic *ioapic,
 		entry.remap.remapped = 1;
 		entry.remap.int_index = result;
 
-		ioapic_reg_write(phys_ioapic, reg | 1, entry.raw[1]);
+		if (!entry.native.mask)
+			ioapic_reg_write(phys_ioapic, reg | 1, entry.raw[1]);
 		ioapic_reg_write(phys_ioapic, reg, entry.raw[0]);
 	}
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/61352e16-f5c2-2dde-ed1d-c51f10d32e4a%40siemens.com.
